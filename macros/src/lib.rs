use proc_macro::TokenStream;
use syn::{Error, ItemEnum, ItemStruct, parse_macro_input};

mod cases;
mod dialect;
mod op;
mod syntax;

#[proc_macro_attribute]
pub fn op(args: TokenStream, item: TokenStream) -> TokenStream {
    let args = parse_macro_input!(args as op::OpArgs);
    let item = parse_macro_input!(item as ItemStruct);
    args.expand(item).unwrap_or_else(Error::into_compile_error).into()
}

#[proc_macro_attribute]
pub fn dialect(args: TokenStream, item: TokenStream) -> TokenStream {
    let args = parse_macro_input!(args as dialect::DialectArgs);
    let item = parse_macro_input!(item as ItemStruct);
    args.expand(item).unwrap_or_else(Error::into_compile_error).into()
}

#[proc_macro_derive(Cases)]
pub fn cases(item: TokenStream) -> TokenStream {
    let item = parse_macro_input!(item as ItemEnum);
    cases::expand(&item).unwrap_or_else(Error::into_compile_error).into()
}

#[proc_macro]
pub fn syntax(input: TokenStream) -> TokenStream {
    let rules = parse_macro_input!(input as syntax::Rules);
    rules.expand().unwrap_or_else(Error::into_compile_error).into()
}
