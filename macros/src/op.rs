//! `#[mlir::op]`: spells each field's MLIR role in its serde name and forwards the conversions.

use proc_macro2::TokenStream as Ts;
use quote::quote;
use syn::parse::{Parse, ParseStream};
use syn::punctuated::Punctuated;
use syn::{Error, Fields, Ident, ItemStruct, LitStr, Meta, Token, Type, parse_quote};

pub struct OpArgs {
    name: LitStr,
    format: Option<LitStr>,
    results: Vec<Ident>,
    custom: bool,
    generic: bool,
}

impl Parse for OpArgs {
    fn parse(input: ParseStream) -> syn::Result<Self> {
        let mut a = Self { name: input.parse()?, format: None, results: Vec::new(), custom: false, generic: false };
        while input.parse::<Option<Token![,]>>()?.is_some() && !input.is_empty() {
            let key: Ident = input.parse()?;
            match key.to_string().as_str() {
                "format" => {
                    input.parse::<Token![=]>()?;
                    a.format = Some(input.parse()?);
                }
                "results" => {
                    let c;
                    syn::parenthesized!(c in input);
                    a.results = Punctuated::<Ident, Token![,]>::parse_terminated(&c)?.into_iter().collect();
                }
                "custom" => a.custom = true,
                "generic" => a.generic = true,
                _ => return Err(Error::new(key.span(), "expected `format = \"...\"`, `results(...)`, `custom` or `generic`")),
            }
        }
        Ok(a)
    }
}

/// A field's role as written.
enum Kind {
    Slot(Ident),
    /// `(rule, argument)`: `i1`, `i1 = x`, `of = x`；`is` 的写法另走 [`Marked::fixed`]。
    DType(Option<(String, Option<Ident>)>, Option<String>),
    Prop { int: Option<String>, dialect: Option<String>, default: Option<String>, dense: Option<String>, symbol: bool, bits: Option<String> },
    Region,
    Successor,
}

struct Marked {
    ident: Ident,
    name: String,
    /// `#[dtype(is = …)]` 里那个固定类型的写法。标识符（`index`）或字符串
    /// （`"!pdl.type"` —— 方言类型不是合法的 Rust 标识符，只能这么写）。
    fixed: Option<String>,
    kind: Kind,
    variadic: bool,
    unit: bool,
}

/// The last path segment of a type, e.g. `Vec` of `alloc::vec::Vec<T>`.
fn last_segment(ty: &Type) -> Option<String> {
    match ty {
        Type::Path(p) => p.path.segments.last().map(|s| s.ident.to_string()),
        _ => None,
    }
}

/// `overflow_flags` → `overflowFlags`.
fn camel(id: &Ident) -> String {
    let s = id.to_string();
    let mut out = String::new();
    for (i, part) in s.trim_start_matches("r#").split('_').enumerate() {
        let mut cs = part.chars();
        match (i, cs.next()) {
            (0, Some(c)) => out.extend(core::iter::once(c).chain(cs)),
            (_, Some(c)) => out.extend(c.to_uppercase().chain(cs)),
            (_, None) => {}
        }
    }
    out
}

impl Marked {
    fn of(f: &mut syn::Field) -> syn::Result<Self> {
        let ident = f.ident.clone().ok_or_else(|| Error::new_spanned(&*f, "#[mlir::op] needs named fields"))?;
        let mut found = None;
        let mut name = None;
        let mut fixed: Option<String> = None;
        for a in &f.attrs {
            let Some(marker) = ["slot", "dtype", "attr", "region", "successor"].into_iter().find(|m| a.path().is_ident(m)) else { continue };
            let (mut ty_var, mut rule, mut int, mut dialect, mut default, mut dense, mut symbol, mut bits, mut strip) = (None, None, None, None, None, None, false, None, None);
            if !matches!(a.meta, Meta::Path(_)) {
                a.parse_nested_meta(|m| {
                    let key = m.path.get_ident().map(Ident::to_string).unwrap_or_default();
                    let value = |m: &syn::meta::ParseNestedMeta| m.value().and_then(|v| v.parse::<LitStr>()).map(|s| s.value());
                    match (marker, key.as_str()) {
                        (_, "name") => name = Some(value(&m)?),
                        ("slot", _) => ty_var = m.path.get_ident().cloned(),
                        // `is = index` 与 `is = "!pdl.type"` 都认：方言类型不是合法标识符。
                        ("dtype", "is") => {
                            let v = m.value()?;
                            fixed = Some(if v.peek(LitStr) { v.parse::<LitStr>()?.value() } else { v.parse::<Ident>()?.to_string() });
                            rule = Some((key, None));
                        }
                        ("dtype", "i1" | "of" | "eq" | "el") => {
                            let arg = if m.input.peek(Token![=]) { Some(m.value()?.parse::<Ident>()?) } else { None };
                            rule = Some((key, arg));
                        }
                        ("dtype", "strip") => strip = Some(value(&m)?),
                        ("attr", "int") => int = Some(value(&m)?),
                        ("attr", "dialect") => dialect = Some(value(&m)?),
                        ("attr", "default") => default = Some(value(&m)?),
                        ("attr", "dense") => dense = Some(value(&m)?),
                        ("attr", "symbol") => symbol = true,
                        ("attr", "bits") => bits = Some(value(&m)?),
                        _ => return Err(m.error(format!("unknown `#[{marker}(...)]` option"))),
                    }
                    Ok(())
                })?;
            }
            let kind = match marker {
                "slot" => Kind::Slot(ty_var.ok_or_else(|| Error::new_spanned(a, "`#[slot(T)]` needs its type variable"))?),
                "dtype" => Kind::DType(rule, strip),
                "attr" => Kind::Prop { int, dialect, default, dense, symbol, bits },
                "region" => Kind::Region,
                _ => Kind::Successor,
            };
            if found.replace(kind).is_some() {
                return Err(Error::new_spanned(a, "one role per field"));
            }
        }
        f.attrs.retain(|a| !["slot", "dtype", "attr", "region", "successor"].iter().any(|m| a.path().is_ident(m)));
        let kind = found.ok_or_else(|| Error::new_spanned(&ident, "field needs #[slot(T)], #[dtype], #[attr], #[region] or #[successor]"))?;
        let seg = last_segment(&f.ty);
        Ok(Self {
            name: name.unwrap_or_else(|| camel(&ident)),
            ident,
            fixed,
            kind,
            variadic: seg.as_deref() == Some("Vec"),
            unit: seg.as_deref() == Some("bool"),
        })
    }
}

impl OpArgs {
    pub fn expand(self, mut item: ItemStruct) -> syn::Result<Ts> {
        let Fields::Named(named) = &mut item.fields else {
            return Err(Error::new_spanned(&item, "#[mlir::op] needs a struct with named fields"));
        };
        let marked = named.named.iter_mut().map(Marked::of).collect::<syn::Result<Vec<_>>>()?;
        let mlir_name = |id: &Ident| -> syn::Result<String> {
            marked.iter().find(|m| m.ident == *id).map(|m| m.name.clone()).ok_or_else(|| Error::new(id.span(), format!("no field `{id}`")))
        };
        for (f, m) in named.named.iter_mut().zip(&marked) {
            let star = if m.variadic { "*" } else { "" };
            let key = match &m.kind {
                Kind::Slot(t) => format!("%{}{star}:{}", m.name, mlir_name(t)?),
                Kind::DType(rule, strip) => {
                    let result = self.results.iter().position(|r| *r == m.ident).map_or(String::new(), |k| format!("={k}"));
                    let infer = match (rule, &m.fixed) {
                        (Some((r, _)), Some(ty)) if r == "is" => format!("~is:{ty}"),
                        (None, _) => String::new(),
                        (Some((r, None)), _) => format!("~{r}"),
                        (Some((r, Some(x))), _) => format!("~{r}:{}", mlir_name(x)?),
                    };
                    let strip = strip.as_ref().map_or(String::new(), |d| format!("@{d}"));
                    format!("!{}{star}{result}{strip}{infer}", m.name)
                }
                Kind::Prop { int, dialect, default, dense, symbol, bits } => {
                    let unit = if m.unit { "?" } else { "" };
                    let dense = dense.as_ref().map_or(String::new(), |e| format!("&{e}"));
                    let int = int.as_ref().map_or(String::new(), |t| format!(":{t}"));
                    let dialect = dialect.as_ref().map_or(String::new(), |d| format!("@{d}"));
                    let default = default.as_ref().map_or(String::new(), |d| format!("|{d}"));
                    let symbol = if *symbol { "$" } else { "" };
                    let bits = bits.as_ref().map_or(String::new(), |b| format!("%{b}"));
                    format!("#{}{unit}{symbol}{dense}{int}{dialect}{default}{bits}", m.name)
                }
                Kind::Region => format!("^{}{star}", m.name),
                Kind::Successor => format!(">{}{star}", m.name),
            };
            f.attrs.push(parse_quote!(#[serde(rename = #key)]));
            if m.unit {
                f.attrs.push(parse_quote!(#[serde(default)]));
            }
        }
        if let Some(r) = self.results.iter().find(|r| !marked.iter().any(|m| m.ident == **r && matches!(m.kind, Kind::DType(..)))) {
            return Err(Error::new(r.span(), format!("`{r}` is not a #[dtype] field")));
        }
        let lt = item.generics.lifetimes().next().map_or(quote!('static), |l| {
            let l = &l.lifetime;
            quote!(#l)
        });
        // `new`: every declared field, in order; no discardable attributes, no location.
        let (args, idents): (Vec<_>, Vec<_>) = named.named.iter().map(|f| {
            let (id, t) = (&f.ident, &f.ty);
            (quote!(#id: #t), quote!(#id))
        }).unzip();
        named.named.push(parse_quote!(#[serde(rename = "{}", default)] pub attrs: ::mlirformat::__Vec<::mlirformat::NamedAttr<#lt>>));
        named.named.push(parse_quote!(#[serde(rename = "@", default)] pub loc: ::core::option::Option<::mlirformat::Str<#lt>>));

        let ty = &item.ident;
        let name = &self.name;
        let (ig, tg, wc) = item.generics.split_for_impl();
        // ⭐ 一条格式串同时给出两侧：`Print` 与 `Parse` 都从 `FORMAT` 来，法则
        // `parse(print(x)) == x` 因此自动成立。写 `custom` 的自己实现这两个 trait，
        // 也就自己担保这条法则。
        let dual = quote! {
            impl #ig ::mlirformat::Print for #ty #tg #wc {
                fn print(&self, p: &mut ::mlirformat::Printer<'_, '_>) -> ::core::fmt::Result {
                    ::mlirformat::Op::print_by_format(self, p)
                }
            }

            impl #ig ::mlirformat::Parse for #ty #tg #wc {
                fn parse(p: &mut ::mlirformat::Parser<'_, '_>) -> ::mlirformat::R<Self> {
                    <Self as ::mlirformat::Op>::parse_by_format(p)
                }
            }
        };
        let op_impl = match (&self.format, self.custom) {
            _ if self.generic => quote! {
                impl #ig ::mlirformat::Op for #ty #tg #wc {
                    const NAME: &'static str = #name;
                    const FORMAT: &'static str = "";
                    const CUSTOM: bool = false;
                }

                #dual
            },
            // ⛔ `custom`：只挡住 `Print` / `Parse`，`Op` 照常生成。逃生口是关于**两个方向**
            // 的，不是关于这个 op 是谁 —— 名字和「有自定义形式」这两件事没有理由也手写。
            (_, true) => quote! {
                impl #ig ::mlirformat::Op for #ty #tg #wc {
                    const NAME: &'static str = #name;
                    const FORMAT: &'static str = "";
                }
            },
            (Some(format), false) => quote! {
                impl #ig ::mlirformat::Op for #ty #tg #wc {
                    const NAME: &'static str = #name;
                    const FORMAT: &'static str = #format;
                }

                #dual
            },
            (None, false) => return Err(Error::new(name.span(), "missing `format = \"...\"` (or `custom` / `generic`)")),
        };
        Ok(quote! {
            #[derive(::core::fmt::Debug, ::core::clone::Clone, ::core::cmp::PartialEq, ::mlirformat::__serde::Serialize, ::mlirformat::__serde::Deserialize)]
            #[serde(crate = "::mlirformat::__serde", rename = #name)]
            #item

            #op_impl

            impl #ig #ty #tg #wc {
                #[allow(clippy::too_many_arguments)]
                pub fn new(#(#args),*) -> Self {
                    Self { #(#idents,)* attrs: ::mlirformat::__Vec::new(), loc: ::core::option::Option::None }
                }
            }

            impl #ig ::core::convert::TryFrom<&::mlirformat::Operation<'_>> for #ty #tg #wc {
                type Error = ::mlirformat::Error;
                fn try_from(op: &::mlirformat::Operation<'_>) -> ::core::result::Result<Self, ::mlirformat::Error> {
                    op.to_op()
                }
            }

            impl #ig ::core::convert::TryFrom<&#ty #tg> for ::mlirformat::Operation<'static> #wc {
                type Error = ::mlirformat::Error;
                fn try_from(op: &#ty #tg) -> ::core::result::Result<Self, ::mlirformat::Error> {
                    ::mlirformat::Operation::of_op(op)
                }
            }

            impl #ig ::core::convert::TryFrom<&str> for #ty #tg #wc {
                type Error = ::mlirformat::ParseError;
                fn try_from(src: &str) -> ::mlirformat::R<Self> {
                    ::mlirformat::Parser::read(src, |p| {
                        p.op_name(<Self as ::mlirformat::Op>::NAME)?;
                        <Self as ::mlirformat::Parse>::parse(p)
                    })
                }
            }

            impl #ig ::core::fmt::Display for #ty #tg #wc {
                fn fmt(&self, f: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
                    ::mlirformat::Printer::write(f, |p| ::mlirformat::Print::print(self, p))
                }
            }
        })
    }
}
