//! Dialect-agnostic MLIR textual format parser and printer.
//!
//! * The generic operation form (`"dialect.op"(...) ... : (...) -> (...)`) is parsed fully.
//! * Custom (pretty) operation forms are kept as raw text pieces; nested regions inside
//!   them are still parsed structurally.
//! * Builtin types are structured; dialect types/attributes are kept as `name` + raw body.
//!
//! Every AST node borrows from the source (`Cow<'a, str>`), is `#[repr(C)]`, and
//! implements `serde::{Serialize, Deserialize}`. `Display` prints MLIR text back.
//!
//! `no_std` compatible (needs `alloc`); the default `std` feature only forwards to deps.

#![no_std]

extern crate alloc;
/// Lets `#[mlir::op]` output use `::mlirformat::` paths inside this crate too.
extern crate self as mlirformat;

/// Declares AST nodes with the common derive set.
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

mod ast;
mod dialect;
mod dialects;
mod error;
mod op;
mod parse;
mod print;

/// `#[mlir::op]` with field markers `#[slot(T)]`, `#[dtype]`.
pub use mlirformat_macros as mlir;

#[doc(hidden)]
pub use {alloc::vec as __vec, alloc::vec::Vec as __Vec, serde as __serde};

pub use ast::*;
pub use dialects::*;
pub use dialect::{Dialect, Dialects, SymKind};
pub use error::ParseError;
pub use op::{Op, Spacer, Syntax};
pub use parse::{Parser, R};
pub use print::{Printer, Sep, WithDialects};
