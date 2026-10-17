//! MLIR text ⇄ IR ⇄ typed Rust ops.
//!
//! * [`MlirOpt`] is the central converter: register dialects, inject ops, parse, print.
//! * The generic op form is parsed fully; a custom form is structured when its op is in the
//!   op table, else kept as raw text (nested regions still parsed).
//! * A typed op is a struct with `#[mlir::op]`: serde turns it into / out of an [`Operation`],
//!   its assembly format gives the custom form.
//!
//! Layout: `common` (what an IR is), `parser` (text → IR), `generator` (IR → text), `mliropt`
//! (the converter, re-exporting everything public), `dialects` (upstream dialects).
//!
//! `no_std` compatible (needs `alloc`).

#![no_std]

extern crate alloc;
/// Lets `#[mlir::op]` output use `::mlirformat::` paths inside this crate too.
extern crate self as mlirformat;

/// Declares IR nodes with the common derive set.
macro_rules! ast {
    ($($(#[$m:meta])* $vis:vis $kw:ident $name:ident $(<$lt:lifetime>)? { $($body:tt)* })*) => {$(
        $(#[$m])*
        #[repr(C)]
        #[derive(Debug, Clone, PartialEq, ::serde::Serialize, ::serde::Deserialize)]
        $vis $kw $name $(<$lt>)? { $($body)* }
    )*};
}

/// Declares a fieldless keyword enum with `Display` and `TryFrom<&str>`.
macro_rules! keywords {
    ($($(#[$m:meta])* $vis:vis enum $name:ident { $($var:ident = $s:literal),* $(,)? })*) => {$(
        $(#[$m])*
        #[repr(C)]
        #[derive(Debug, Clone, Copy, PartialEq, Eq, Hash, ::serde::Serialize, ::serde::Deserialize)]
        $vis enum $name { $($var),* }

        impl ::core::fmt::Display for $name {
            fn fmt(&self, f: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
                f.write_str(match self { $(Self::$var => $s),* })
            }
        }

        impl TryFrom<&str> for $name {
            type Error = ();
            fn try_from(s: &str) -> Result<Self, ()> {
                match s { $($s => Ok(Self::$var),)* _ => Err(()) }
            }
        }
    )*};
}

mod common;
mod dialects;
mod generator;
mod mliropt;
mod parser;
/// The ODS `custom<X>` directives (`mlirformat tblgen` asks `known` before keeping a format).
pub mod syntax;

/// `#[mlir::op]`, `#[mlir::dialect]`.
pub use mlirformat_macros as mlir;
pub use mliropt::*;

#[doc(hidden)]
pub use {alloc::vec as __vec, alloc::vec::Vec as __Vec, serde as __serde};
