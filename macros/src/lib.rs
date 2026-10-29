//! `#[mlir::op]` and `#[mlir::dialect]`. Neither writes conversion code: `op` spells each
//! field's MLIR role in its serde name (decoded by `mlirformat::Field`) and forwards the
//! conversions to the runtime; `dialect` turns an enum of ops into a registrable op table.
//!
//! ```ignore
//! #[mlir::op("arith.maxsi", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
//! pub struct ArithMax<'a> {
//!     #[slot(result)] pub lhs: Value<'a>,     // operand; its type is type variable `result`
//!     #[slot(result)] pub rhs: Value<'a>,
//!     pub result: Type<'a>,                   // type variable (result #0 by `results(...)`)
//! }
//! ```
//!
//! A field's role is its Rust type: a `Type` is a type variable, a `Region` a region, anything
//! else but a `Value` a property. A marker is written for an operand (`#[slot(T)]`), a successor,
//! a role the type does not say (`#[attr]` on a `Type`: a type attribute), or to carry options.
//! A `Vec` field is variadic; MLIR names are the field names unless `name = "..."`:
//!
//! ```text
//! #[slot(T)]                       operand(s) typed by type variable T
//! #[dtype] #[dtype(i1)] #[dtype(i1 = x)] #[dtype(of = attr)] #[dtype(eq = x)] #[dtype(is = index)] #[dtype(el = x)]
//!                                  type variable; how custom form infers it when unspelled
//! #[attr] #[attr(int = "i32")] #[attr(dialect = "arith.overflow", default = "<none>")]
//!                                  property (`bool`: unit attribute; enum: case value typed
//!                                  `int`, default i64); a dialect attribute is
//!                                  spelled without its prefix, its default is omitted
//! #[region]  #[successor]
//! ```
//!
//! `attrs` (discardable attributes) and `loc` fields are added. Options: `format = "..."`,
//! `results(a, b)`, `custom` (no `Print` / `Parse` impl: written by hand). Without `format` (and
//! not `custom`) the op has no custom form: always printed generic.
//!
//! `#[derive(mlir::Cases)]` on an integer enum: `TryFrom<i64>` by case value (the variant's
//! position; hidden `__N` gap variants take none).
//!
//! `#[mlir::dialect("ns", ops = [A, B], ..)]` on a unit struct: the dialect, its op structs and
//! its traits (`dependents = [..]`, `materializer`, `canonicalizer`); `params = f` structures
//! `!ns.x<...>` / `#ns.x<...>` bodies (`Dialect::parse_params`).

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

/// `syntax!`: the ODS `custom<X>` directives, as rules the format interpreter reads and writes
/// from. Crate internal: `mlirformat::syntax` is its only caller.
#[proc_macro]
pub fn syntax(input: TokenStream) -> TokenStream {
    let rules = parse_macro_input!(input as syntax::Rules);
    rules.expand().unwrap_or_else(Error::into_compile_error).into()
}
