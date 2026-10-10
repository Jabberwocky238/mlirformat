//! `#[mlir::dialect]`: an enum of `#[mlir::op]` structs as a registrable op table.

use proc_macro2::TokenStream as Ts;
use quote::quote;
use syn::parse::{Parse, ParseStream};
use syn::{Error, Fields, Ident, ItemEnum, LitStr, Path, Token, Type};

/// `"ns"`, optionally `params = path::to::fn` (the `Dialect::parse_params` hook).
pub struct DialectArgs {
    ns: LitStr,
    params: Option<Path>,
}

impl Parse for DialectArgs {
    fn parse(input: ParseStream) -> syn::Result<Self> {
        let mut a = Self { ns: input.parse()?, params: None };
        while input.parse::<Option<Token![,]>>()?.is_some() && !input.is_empty() {
            let key: Ident = input.parse()?;
            if key != "params" {
                return Err(Error::new(key.span(), "expected `params = path`"));
            }
            input.parse::<Token![=]>()?;
            a.params = Some(input.parse()?);
        }
        Ok(a)
    }
}

pub fn expand(DialectArgs { ns, params }: DialectArgs, item: ItemEnum) -> syn::Result<Ts> {
    let mut vars = Vec::new();
    for v in &item.variants {
        match &v.fields {
            Fields::Unnamed(f) if f.unnamed.len() == 1 => vars.push((&v.ident, &f.unnamed[0].ty)),
            _ => return Err(Error::new_spanned(v, "#[mlir::dialect] variants wrap one op: `AddI(AddI<'a>)`")),
        }
    }
    let (idents, tys): (Vec<_>, Vec<_>) = vars.into_iter().unzip();
    // `<AddI as Op>::template()`: the lifetime is left to inference (`'static`).
    let bare: Vec<Type> = tys
        .iter()
        .map(|t| {
            let mut t = (*t).clone();
            if let Type::Path(p) = &mut t
                && let Some(s) = p.path.segments.last_mut()
            {
                s.arguments = syn::PathArguments::None;
            }
            t
        })
        .collect();
    let ty = &item.ident;
    let (ig, tg, wc) = item.generics.split_for_impl();
    let params = params.map(|f| {
        quote! {
            fn parse_params<'p>(
                kind: ::mlirformat::SymKind,
                name: &str,
                p: &mut ::mlirformat::Parser<'p, '_>,
            ) -> ::core::option::Option<::mlirformat::R<::mlirformat::__Vec<::mlirformat::Attribute<'p>>>> {
                #f(kind, name, p)
            }
        }
    });
    Ok(quote! {
        #[derive(::core::fmt::Debug, ::core::clone::Clone, ::core::cmp::PartialEq)]
        #item

        impl #ig ::mlirformat::Dialect for #ty #tg #wc {
            const NAMESPACE: &'static str = #ns;
            fn ops() -> ::mlirformat::__Vec<::mlirformat::Template> {
                ::mlirformat::__vec![#(<#bare as ::mlirformat::Op>::template()),*]
            }

            #params
        }

        impl #ig ::core::convert::TryFrom<&::mlirformat::Operation<'_>> for #ty #tg #wc {
            type Error = ::mlirformat::Error;
            fn try_from(op: &::mlirformat::Operation<'_>) -> ::core::result::Result<Self, ::mlirformat::Error> {
                #(if op.name == <#tys as ::mlirformat::Op>::NAME {
                    return ::core::convert::TryFrom::try_from(op).map(Self::#idents);
                })*
                ::core::result::Result::Err(::mlirformat::Error::from(concat!("not an op of dialect `", #ns, "`")))
            }
        }

        impl #ig ::core::convert::TryFrom<&#ty #tg> for ::mlirformat::Operation<'static> #wc {
            type Error = ::mlirformat::Error;
            fn try_from(op: &#ty #tg) -> ::core::result::Result<Self, ::mlirformat::Error> {
                match op { #(#ty::#idents(x) => ::core::convert::TryFrom::try_from(x),)* }
            }
        }

        impl #ig ::core::fmt::Display for #ty #tg #wc {
            fn fmt(&self, f: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
                match self { #(Self::#idents(x) => ::core::fmt::Display::fmt(x, f),)* }
            }
        }

        #(impl #ig ::core::convert::From<#tys> for #ty #tg #wc {
            fn from(x: #tys) -> Self {
                Self::#idents(x)
            }
        })*
    })
}
