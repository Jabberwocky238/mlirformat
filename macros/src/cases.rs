use proc_macro2::TokenStream;
use quote::quote;
use syn::{Error, Fields, ItemEnum};

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
