//! `#[mlir::dialect]` on a dialect struct: its namespace, its op structs and its traits, as an
//! implementation of `mlirformat::Dialect`.
//!
//! ```ignore
//! #[mlir::dialect("arith", ops = [AddI, SubI], dependents = ["ub"], materializer, canonicalizer)]
//! pub struct ArithDialect;
//! ```

use proc_macro2::TokenStream as Ts;
use quote::quote;
use syn::parse::{Parse, ParseStream};
use syn::punctuated::Punctuated;
use syn::{Error, Fields, Ident, ItemStruct, LitStr, Path, Token, bracketed};

/// `"ns"`, then: `ops = [Op, ..]` (its `#[mlir::op]` structs), `params = path::to::fn` (the
/// `Dialect::parse_params` hook), `dependents = ["ns", ..]`, `materializer`, `canonicalizer`.
pub struct DialectArgs {
    ns: LitStr,
    ops: Vec<Path>,
    params: Option<Path>,
    dependents: Vec<LitStr>,
    materializer: bool,
    canonicalizer: bool,
}

impl Parse for DialectArgs {
    fn parse(input: ParseStream) -> syn::Result<Self> {
        let mut a = Self { ns: input.parse()?, ops: Vec::new(), params: None, dependents: Vec::new(), materializer: false, canonicalizer: false };
        while input.parse::<Option<Token![,]>>()?.is_some() && !input.is_empty() {
            let key: Ident = input.parse()?;
            match key.to_string().as_str() {
                "materializer" => a.materializer = true,
                "canonicalizer" => a.canonicalizer = true,
                "params" => {
                    input.parse::<Token![=]>()?;
                    a.params = Some(input.parse()?);
                }
                "ops" => {
                    input.parse::<Token![=]>()?;
                    let list;
                    bracketed!(list in input);
                    a.ops = Punctuated::<Path, Token![,]>::parse_terminated(&list)?.into_iter().collect();
                }
                "dependents" => {
                    input.parse::<Token![=]>()?;
                    let list;
                    bracketed!(list in input);
                    a.dependents = Punctuated::<LitStr, Token![,]>::parse_terminated(&list)?.into_iter().collect();
                }
                _ => return Err(Error::new(key.span(), "expected `ops = [..]`, `params = path`, `dependents = [..]`, `materializer` or `canonicalizer`")),
            }
        }
        Ok(a)
    }
}

impl DialectArgs {
    pub fn expand(self, item: ItemStruct) -> syn::Result<Ts> {
        if !matches!(item.fields, Fields::Unit) || !item.generics.params.is_empty() {
            return Err(Error::new_spanned(&item, "#[mlir::dialect] goes on a unit struct: `pub struct ArithDialect;`"));
        }
        let DialectArgs { ns, ops, params, dependents, materializer, canonicalizer } = self;
        let ty = &item.ident;
        let params = params.map(|f| {
            quote! {
                #[inline]
                fn parse_params<'p>(
                    &self,
                    kind: ::mlirformat::SymKind,
                    name: &str,
                    p: &mut ::mlirformat::Parser<'p, '_>,
                ) -> ::core::option::Option<::mlirformat::R<::mlirformat::__Vec<::mlirformat::Attribute<'p>>>> {
                    #f(kind, name, p)
                }
            }
        });
        Ok(quote! {
            #[derive(::core::fmt::Debug, ::core::clone::Clone, ::core::marker::Copy, ::core::cmp::PartialEq, ::core::cmp::Eq, ::core::default::Default)]
            #item

            impl ::mlirformat::Dialect for #ty {
                #[inline]
                fn namespace(&self) -> &'static str {
                    #ns
                }

                #[inline]
                fn traits(&self) -> ::mlirformat::DialectTraits {
                    ::mlirformat::DialectTraits { dependents: &[#(#dependents),*], constant_materializer: #materializer, canonicalizer: #canonicalizer }
                }

                fn ops(&self) -> ::mlirformat::__Vec<::mlirformat::Template> {
                    // `<AddI as Op>::template()`: the lifetime is left to inference (`'static`).
                    ::mlirformat::__vec![#(<#ops as ::mlirformat::Op>::template()),*]
                }

                #params
            }
        })
    }
}
