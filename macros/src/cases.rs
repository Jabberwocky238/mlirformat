//! `#[derive(Cases)]`: an integer enum's `TryFrom<i64>`, by case value.

use proc_macro2::TokenStream;
use quote::quote;
use syn::{Error, Fields, ItemEnum};

/// A case's value is its position: generated enums fill the values they skip with hidden
/// `__N` variants, which no value converts to.
pub fn expand(item: &ItemEnum) -> syn::Result<TokenStream> {
    let ty = &item.ident;
    let mut arms = Vec::new();
    for (value, v) in item.variants.iter().enumerate() {
        if !matches!(v.fields, Fields::Unit) || v.discriminant.is_some() {
            return Err(Error::new_spanned(v, "#[derive(Cases)]: cases are unit variants, valued by position"));
        }
        let name = v.ident.to_string();
        if name.strip_prefix("__").is_some_and(|n| n.bytes().all(|b| b.is_ascii_digit())) {
            continue;
        }
        let (value, id) = (value as i64, &v.ident);
        arms.push(quote!(#value => ::core::result::Result::Ok(Self::#id),));
    }
    Ok(quote! {
        impl ::core::convert::TryFrom<i64> for #ty {
            type Error = i64;

            /// The case of value `v`; `Err(v)` when no case has it.
            #[inline]
            fn try_from(v: i64) -> ::core::result::Result<Self, i64> {
                match v {
                    #(#arms)*
                    _ => ::core::result::Result::Err(v),
                }
            }
        }
    })
}
