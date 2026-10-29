//! `#[mlir::op]`: each field's MLIR role as a constant (`Op::FIELDS`), the conversions forwarded.

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
}

impl Parse for OpArgs {
    fn parse(input: ParseStream) -> syn::Result<Self> {
        let mut a = Self { name: input.parse()?, format: None, results: Vec::new(), custom: false };
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
                _ => return Err(Error::new(key.span(), "expected `format = \"...\"`, `results(...)` or `custom`")),
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

/// `T` of `Option<T>`.
fn option_of(ty: &Type) -> Option<&Type> {
    wrapped(ty, "Option")
}

/// `T` of `W<T>`.
fn wrapped<'t>(ty: &'t Type, w: &str) -> Option<&'t Type> {
    let Type::Path(p) = ty else { return None };
    let seg = p.path.segments.last().filter(|s| s.ident == w)?;
    let syn::PathArguments::AngleBracketed(args) = &seg.arguments else { return None };
    args.args.iter().find_map(|a| if let syn::GenericArgument::Type(t) = a { Some(t) } else { None })
}

/// A field's `FieldType`: an `Attribute` property is read as it is, one of any other Rust type
/// through that type.
fn field_type(kind: &Kind, ty: &Type) -> Ts {
    let inner = option_of(ty);
    match kind {
        Kind::Prop { .. } if last_segment(inner.unwrap_or(ty)).as_deref() == Some("Attribute") => {
            let required = inner.is_none();
            quote!(::mlirformat::FieldType::Attr { required: #required })
        }
        Kind::Prop { .. } => quote!(::mlirformat::FieldType::of::<#ty>()),
        _ => quote!(::mlirformat::FieldType::Attr { required: false }),
    }
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
                        ("dtype", "i1" | "of" | "eq" | "el" | "width") => {
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
        // Unmarked: the Rust type says the role. A `Type` is a type variable, a `Region` a
        // region, anything else but a `Value` a property.
        let kind = match found {
            Some(k) => k,
            None => match last_segment(wrapped(&f.ty, "Vec").unwrap_or(&f.ty)).as_deref() {
                Some("Type") => Kind::DType(None, None),
                Some("Region") => Kind::Region,
                Some("Value") => return Err(Error::new_spanned(&ident, "an operand needs #[slot(T)]: its type variable")),
                _ => Kind::Prop { int: None, dialect: None, default: None, dense: None, symbol: false, bits: None },
            },
        };
        let seg = last_segment(&f.ty);
        Ok(Self {
            name: name.unwrap_or_else(|| ident.to_string().trim_start_matches("r#").into()),
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
        // `(key, take, put)` in order: `KEYS`, `from_fields` and `into_fields`; `fields`: `FIELDS`.
        let mut keys = Vec::new();
        let mut fields = Vec::new();
        let s = |v: &Option<String>| v.as_ref().map_or_else(|| quote!(::core::option::Option::None), |v| quote!(::core::option::Option::Some(#v)));
        for (f, m) in named.named.iter_mut().zip(&marked) {
            let role = match &m.kind {
                Kind::Slot(t) => {
                    let t = mlir_name(t)?;
                    quote!(Operand { ty: #t })
                }
                Kind::DType(rule, strip) => {
                    let result = self.results.iter().position(|r| *r == m.ident).map_or_else(|| quote!(::core::option::Option::None), |k| quote!(::core::option::Option::Some(#k)));
                    let var = |x: &Option<Ident>| x.as_ref().map(&mlir_name).ok_or_else(|| Error::new(m.ident.span(), "`#[dtype(..)]` rule needs `= field`"))?;
                    let infer = match rule.as_ref().map(|(r, x)| (r.as_str(), x)) {
                        None => quote!(::core::option::Option::None),
                        Some(("is", _)) => {
                            let ty = m.fixed.as_deref().unwrap_or_default();
                            quote!(::core::option::Option::Some(::mlirformat::Infer::Is(#ty)))
                        }
                        Some(("i1", None)) => quote!(::core::option::Option::Some(::mlirformat::Infer::I1)),
                        Some((r, x)) => {
                            let v = var(x)?;
                            let rule = Ident::new(match r { "i1" => "I1Like", "of" => "TypeOf", "eq" => "Same", "el" => "ElemOf", _ => "Width" }, m.ident.span());
                            quote!(::core::option::Option::Some(::mlirformat::Infer::#rule(#v)))
                        }
                    };
                    let strip = s(strip);
                    quote!(Type { result: #result, infer: #infer, strip: #strip })
                }
                Kind::Prop { int, dialect, default, dense, symbol, bits } => {
                    let (unit, int, dialect, default, dense, bits) = (m.unit, s(int), s(dialect), s(default), s(dense), s(bits));
                    quote!(Prop { unit: #unit, int: #int, dialect: #dialect, default: #default, dense: #dense, symbol: #symbol, bits: #bits })
                }
                Kind::Region => quote!(Region),
                Kind::Successor => quote!(Successor),
            };
            let (key, variadic, ty) = (&m.name, m.variadic, field_type(&m.kind, &f.ty));
            fields.push(quote!(::mlirformat::Field { name: #key, variadic: #variadic, role: ::mlirformat::Role::#role, ty: #ty }));
            f.attrs.push(parse_quote!(#[serde(rename = #key)]));
            let id = &m.ident;
            // A region moves through `Content` as itself, never serialized.
            let (take, put) = match (&m.kind, m.variadic) {
                (Kind::Region, false) => (quote!(#id: f.region(#key)?), quote!((#key, ::mlirformat::Content::region(self.#id)))),
                (Kind::Region, true) => (quote!(#id: f.regions(#key)?), quote!((#key, ::mlirformat::Content::regions(self.#id)))),
                _ if m.unit => (quote!(#id: f.or_default(#key)?), quote!((#key, ::mlirformat::Content::of(&self.#id)?))),
                _ => (quote!(#id: f.take(#key)?), quote!((#key, ::mlirformat::Content::of(&self.#id)?))),
            };
            keys.push((key.clone(), take, put));
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
        named.named.push(parse_quote!(#[serde(rename = "{}")] pub attrs: ::mlirformat::__Vec<::mlirformat::NamedAttr<#lt>>));
        named.named.push(parse_quote!(#[serde(rename = "@")] pub loc: ::core::option::Option<::mlirformat::Str<#lt>>));
        keys.push(("{}".into(), quote!(attrs: f.or_default("{}")?), quote!(("{}", ::mlirformat::Content::of(&self.attrs)?))));
        keys.push(("@".into(), quote!(loc: f.or_default("@")?), quote!(("@", ::mlirformat::Content::of(&self.loc)?))));
        let (keys, takes, puts) = keys.into_iter().fold((Vec::new(), Vec::new(), Vec::new()), |(mut k, mut t, mut p), (a, b, c)| {
            k.push(a);
            t.push(b);
            p.push(c);
            (k, t, p)
        });
        // ⭐ 字段一个个从 `Fields` 取，不派生 `Deserialize`：派生的 visitor 每个 op 一套，
        // 九百个 op 的类型检查、借用检查都花在它身上。
        let extra = |name: &str, role: Ts| quote!(::mlirformat::Field { name: #name, variadic: false, role: ::mlirformat::Role::#role, ty: ::mlirformat::FieldType::Attr { required: false } });
        fields.extend([extra("{}", quote!(Attrs)), extra("@", quote!(Loc))]);
        let fields = quote! {
            const KEYS: &'static [&'static str] = &[#(#keys),*];
            const FIELDS: &'static [::mlirformat::Field] = &[#(#fields),*];
            fn from_fields(f: &mut ::mlirformat::Fields) -> ::core::result::Result<Self, ::mlirformat::Error> {
                ::core::result::Result::Ok(Self { #(#takes),* })
            }
            fn into_fields(self) -> ::core::result::Result<::mlirformat::__Vec<(&'static str, ::mlirformat::Content)>, ::mlirformat::Error> {
                ::core::result::Result::Ok(::mlirformat::__vec![#(#puts),*])
            }
        };

        let ty = &item.ident;
        let name = &self.name;
        let (ig, tg, wc) = item.generics.split_for_impl();
        let mut de_generics = item.generics.clone();
        de_generics.params.insert(0, parse_quote!('de));
        let (de_ig, _, _) = de_generics.split_for_impl();
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
        // No format: the op only ever prints generic (`CUSTOM = false`).
        let op_impl = match (&self.format, self.custom) {
            // ⛔ `custom`：只挡住 `Print` / `Parse`，`Op` 照常生成。逃生口是关于**两个方向**
            // 的，不是关于这个 op 是谁 —— 名字和「有自定义形式」这两件事没有理由也手写。
            (_, true) => quote! {
                impl #ig ::mlirformat::Op for #ty #tg #wc {
                    const NAME: &'static str = #name;
                    const FORMAT: &'static str = "";
                    #fields
                }
            },
            (format, false) => {
                let (format, custom) = format.as_ref().map_or_else(|| (quote!(""), quote!(const CUSTOM: bool = false;)), |f| (quote!(#f), quote!()));
                quote! {
                    impl #ig ::mlirformat::Op for #ty #tg #wc {
                        const NAME: &'static str = #name;
                        const FORMAT: &'static str = #format;
                        #custom
                        #fields
                    }

                    #dual
                }
            }
        };
        Ok(quote! {
            #[derive(::core::fmt::Debug, ::core::clone::Clone, ::core::cmp::PartialEq, ::mlirformat::__serde::Serialize)]
            #[serde(crate = "::mlirformat::__serde", rename = #name)]
            #item

            #op_impl

            // ⭐ `Content` 中转：只有 `Fields::read` 按格式泛型，所有 op 共用；每个 op 不再有
            // 自己的 visitor。
            impl #de_ig ::mlirformat::__serde::Deserialize<'de> for #ty #tg #wc {
                fn deserialize<D: ::mlirformat::__serde::Deserializer<'de>>(d: D) -> ::core::result::Result<Self, D::Error> {
                    let mut f = ::mlirformat::Fields::read(d, #name, <Self as ::mlirformat::Op>::KEYS)?;
                    <Self as ::mlirformat::Op>::from_fields(&mut f).map_err(<D::Error as ::mlirformat::__serde::de::Error>::custom)
                }
            }

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
