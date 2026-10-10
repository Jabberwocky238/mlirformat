//! `#[mlir::op]`: a Rust struct that maps 1:1 onto an MLIR operation.
//!
//! ```ignore
//! #[mlir::op("arith.maxsi", format = "$lhs `,` $rhs attr-dict `:` $ty", results(ty))]
//! pub struct MaxSI<'a> {
//!     #[slot(ty)] pub lhs: ValueRef<'a>,   // operand whose type is the type variable `ty`
//!     #[slot(ty)] pub rhs: ValueRef<'a>,
//!     #[dtype] pub ty: Type<'a>,           // type variable
//! }
//! ```
//!
//! Adds `attrs` (discardable attribute dict) and `loc` fields, and generates
//! `TryFrom<&GenericOp>`, `From<Self> for GenericOp`, `Syntax` (from `format`) and `Op`.

use proc_macro::TokenStream;
use proc_macro2::TokenStream as Ts;
use quote::quote;
use syn::parse::{Parse, ParseStream};
use syn::punctuated::Punctuated;
use syn::{Error, Fields, Ident, ItemStruct, LitStr, Token, parse_macro_input, parse_quote};

#[proc_macro_attribute]
pub fn op(args: TokenStream, item: TokenStream) -> TokenStream {
    let args = parse_macro_input!(args as OpArgs);
    let item = parse_macro_input!(item as ItemStruct);
    OpDef::new(args, item).and_then(|d| d.expand()).unwrap_or_else(Error::into_compile_error).into()
}

struct OpArgs {
    name: LitStr,
    format: Option<LitStr>,
    results: Vec<Ident>,
}

impl Parse for OpArgs {
    fn parse(input: ParseStream) -> syn::Result<Self> {
        let mut a = Self { name: input.parse()?, format: None, results: Vec::new() };
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
                _ => return Err(Error::new(key.span(), "expected `format = \"...\"` or `results(...)`")),
            }
        }
        Ok(a)
    }
}

enum Kind {
    /// Operand bound to a type variable.
    Slot(Ident),
    DType,
}

struct Field {
    ident: Ident,
    kind: Kind,
}

/// Assembly format element.
enum Elem {
    Lit(String),
    Var(Ident),
    /// `type($x)`: the type variable of slot `x` (or `x` itself if it is a `#[dtype]`).
    Type(Ident),
    AttrDict,
}

struct OpDef {
    args: OpArgs,
    item: ItemStruct,
    fields: Vec<Field>,
    format: Vec<Elem>,
}

impl OpDef {
    fn new(args: OpArgs, mut item: ItemStruct) -> syn::Result<Self> {
        let Fields::Named(named) = &mut item.fields else {
            return Err(Error::new_spanned(&item, "#[mlir::op] needs a struct with named fields"));
        };
        let mut fields = Vec::new();
        for f in &mut named.named {
            let mut kind = None;
            let mut err = Ok(());
            f.attrs.retain(|a| {
                let k = if a.path().is_ident("slot") {
                    a.parse_args::<Ident>().map(Kind::Slot)
                } else if a.path().is_ident("dtype") {
                    Ok(Kind::DType)
                } else {
                    return true;
                };
                match k {
                    Ok(k) => kind = Some(k),
                    Err(e) => err = Err(e),
                }
                false
            });
            err?;
            let ident = f.ident.clone().unwrap();
            let kind = kind.ok_or_else(|| Error::new_spanned(&ident, "field needs #[slot(T)] or #[dtype]"))?;
            fields.push(Field { ident, kind });
        }
        named.named.push(parse_quote!(pub attrs: ::mlirformat::__Vec<::mlirformat::NamedAttr<'a>>));
        named.named.push(parse_quote!(pub loc: ::core::option::Option<::mlirformat::Str<'a>>));
        let format = match &args.format {
            Some(f) => Self::tokenize(f)?,
            None => return Err(Error::new(args.name.span(), "missing `format = \"...\"`")),
        };
        Ok(Self { args, item, fields, format })
    }

    /// Splits an ODS-style format: `` `lit` ``, `$var`, `type($var)`, `attr-dict`.
    fn tokenize(f: &LitStr) -> syn::Result<Vec<Elem>> {
        let src = f.value();
        let err = |m: &str| Error::new(f.span(), format!("format: {m}"));
        let mut out = Vec::new();
        let mut rest = src.trim_start();
        while !rest.is_empty() {
            let (elem, tail) = if let Some(r) = rest.strip_prefix('`') {
                let end = r.find('`').ok_or_else(|| err("unterminated literal"))?;
                (Elem::Lit(r[..end].into()), &r[end + 1..])
            } else if let Some(r) = rest.strip_prefix("attr-dict") {
                (Elem::AttrDict, r)
            } else {
                let (inner, tail, wrap): (_, _, fn(Ident) -> Elem) = match rest.strip_prefix("type(") {
                    Some(r) => {
                        let (i, t) = r.split_once(')').ok_or_else(|| err("unclosed `type(`"))?;
                        (i, t, Elem::Type)
                    }
                    None => {
                        let (i, t) = rest.split_at(rest.find(char::is_whitespace).unwrap_or(rest.len()));
                        (i, t, Elem::Var)
                    }
                };
                let name = inner.strip_prefix('$').ok_or_else(|| err(&format!("unexpected `{inner}`")))?;
                (wrap(syn::parse_str(name)?), tail)
            };
            out.push(elem);
            rest = tail.trim_start();
        }
        Ok(out)
    }

    fn field(&self, id: &Ident) -> syn::Result<&Field> {
        self.fields.iter().find(|f| f.ident == *id).ok_or_else(|| Error::new(id.span(), format!("no field `{id}`")))
    }

    /// `type($x)` on a slot means the slot's type variable.
    fn resolve(&self, id: &Ident) -> syn::Result<Ident> {
        Ok(match &self.field(id)?.kind {
            Kind::Slot(t) => t.clone(),
            Kind::DType => id.clone(),
        })
    }

    fn slots(&self) -> impl Iterator<Item = (&Ident, &Ident)> {
        self.fields.iter().filter_map(|f| match &f.kind {
            Kind::Slot(t) => Some((&f.ident, t)),
            Kind::DType => None,
        })
    }

    fn dtypes(&self) -> impl Iterator<Item = &Ident> {
        self.fields.iter().filter(|f| matches!(f.kind, Kind::DType)).map(|f| &f.ident)
    }

    fn expand(&self) -> syn::Result<Ts> {
        let item = &self.item;
        let ty = &item.ident;
        let name = &self.args.name;
        let all: Vec<_> = self.fields.iter().map(|f| &f.ident).collect();
        let dts: Vec<_> = self.dtypes().collect();
        let (slots, slot_tys): (Vec<_>, Vec<_>) = self.slots().unzip();
        let results = &self.args.results;
        for r in results.iter().chain(slot_tys.iter().copied()) {
            if !matches!(self.field(r)?.kind, Kind::DType) {
                return Err(Error::new(r.span(), format!("`{r}` is not a #[dtype] field")));
            }
        }
        let (parse, print) = self.syntax()?;
        Ok(quote! {
            #[derive(Debug, Clone, PartialEq, ::mlirformat::__serde::Serialize, ::mlirformat::__serde::Deserialize)]
            #[serde(crate = "::mlirformat::__serde")]
            #item

            impl<'a> ::mlirformat::Op<'a> for #ty<'a> {
                const NAME: &'a str = #name;
            }

            impl<'a, 'g> ::core::convert::TryFrom<&'g ::mlirformat::GenericOp<'a>> for #ty<'a> {
                type Error = ();
                #[allow(non_snake_case)]
                fn try_from(g: &'g ::mlirformat::GenericOp<'a>) -> ::core::result::Result<Self, ()> {
                    if g.name != #name || !g.successors.is_empty() || !g.regions.is_empty() || g.properties.is_some() {
                        return Err(());
                    }
                    let (mut ops, mut ins, mut outs) = (g.operands.iter(), g.ty.inputs.iter(), g.ty.results.iter());
                    #(let mut #dts: ::core::option::Option<::mlirformat::Type<'a>> = None;)*
                    #(
                        let #slots = ops.next().cloned().ok_or(())?;
                        ::mlirformat::Type::unify(&mut #slot_tys, ins.next())?;
                    )*
                    #(::mlirformat::Type::unify(&mut #results, outs.next())?;)*
                    if ops.next().is_some() || ins.next().is_some() || outs.next().is_some() {
                        return Err(());
                    }
                    #(let #dts = #dts.ok_or(())?;)*
                    Ok(Self { #(#all,)* attrs: g.attributes.clone(), loc: g.loc.clone() })
                }
            }

            impl<'a> ::core::convert::From<#ty<'a>> for ::mlirformat::GenericOp<'a> {
                fn from(op: #ty<'a>) -> Self {
                    let ty = ::mlirformat::FunctionType {
                        inputs: ::mlirformat::__vec![#(op.#slot_tys.clone()),*],
                        results: ::mlirformat::__vec![#(op.#results.clone()),*],
                    };
                    Self {
                        name: #name.into(),
                        operands: ::mlirformat::__vec![#(op.#slots),*],
                        successors: ::mlirformat::__Vec::new(),
                        properties: None,
                        regions: ::mlirformat::__Vec::new(),
                        attributes: op.attrs,
                        ty,
                        loc: op.loc,
                    }
                }
            }

            impl<'a> ::mlirformat::Syntax<'a> for #ty<'a> {
                #[allow(non_snake_case)]
                fn parse(p: &mut ::mlirformat::Parser<'a, '_>) -> ::mlirformat::R<Self> {
                    let mut attrs = ::mlirformat::__Vec::new();
                    #parse
                    Ok(Self { #(#all,)* attrs, loc: p.opt_loc()? })
                }

                fn print(&self, p: &mut ::mlirformat::Printer<'_, '_>) -> ::core::fmt::Result {
                    use ::core::fmt::Write as _;
                    let mut s = ::mlirformat::Spacer::default();
                    p.write_str(#name)?;
                    #print
                    p.loc(&self.loc)
                }
            }
        })
    }

    /// Parser and printer bodies for the assembly format.
    fn syntax(&self) -> syn::Result<(Ts, Ts)> {
        let (mut parse, mut print) = (Ts::new(), Ts::new());
        let mut seen = Vec::new();
        for e in &self.format {
            match e {
                Elem::Lit(l) => {
                    parse.extend(quote!(p.expect_lit(#l)?;));
                    print.extend(quote!(s.lit(p, #l)?;));
                }
                Elem::AttrDict => {
                    parse.extend(quote!(attrs = p.opt_dict()?;));
                    print.extend(quote!(p.attr_dict("", &self.attrs, &[])?; s.dict();));
                }
                Elem::Var(v) | Elem::Type(v) => {
                    let v = if matches!(e, Elem::Type(_)) { self.resolve(v)? } else { self.field(v)?.ident.clone() };
                    parse.extend(quote!(let #v = ::mlirformat::Syntax::parse(p)?;));
                    print.extend(quote!(s.elem(p)?; ::mlirformat::Syntax::print(&self.#v, p)?;));
                    seen.push(v);
                }
            }
        }
        if let Some(f) = self.fields.iter().find(|f| !seen.contains(&f.ident)) {
            return Err(Error::new(f.ident.span(), format!("`{}` does not appear in the format", f.ident)));
        }
        Ok((parse, print))
    }
}
