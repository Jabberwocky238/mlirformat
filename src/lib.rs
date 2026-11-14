#![no_std]

extern crate alloc;

#[cfg(all(feature = "std", not(target_env = "msvc")))]
#[global_allocator]
static JEMALLOC: tikv_jemallocator::Jemalloc = tikv_jemallocator::Jemalloc;

extern crate self as mlirformat;

macro_rules! ast {
    ($($(#[$m:meta])* $vis:vis $kw:ident $name:ident $(<$lt:lifetime>)? { $($body:tt)* })*) => {$(
        $(#[$m])*
        #[repr(C)]
        #[derive(Debug, Clone, PartialEq, ::serde::Serialize, ::serde::Deserialize)]
        $vis $kw $name $(<$lt>)? { $($body)* }
    )*};
}

macro_rules! keywords {
    ($($(#[$m:meta])* $vis:vis enum $name:ident { $($var:ident = $s:literal),* $(,)? })*) => {$(
        $(#[$m])*
        #[repr(C)]
        #[derive(Debug, Clone, Copy, PartialEq, Eq, Hash, ::serde::Serialize, ::serde::Deserialize)]
        $vis enum $name { $($var),* }

        impl ::core::fmt::Display for $name {
            #[inline]
            fn fmt(&self, f: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
                f.write_str(match self { $(Self::$var => $s),* })
            }
        }

        impl TryFrom<&str> for $name {
            type Error = ();
            #[inline]
            fn try_from(s: &str) -> Result<Self, ()> {
                match s { $($s => Ok(Self::$var),)* _ => Err(()) }
            }
        }
    )*};
}

pub mod affine_expr;
mod common;
mod dialects;
mod generator;
mod mliropt;
mod parser;
mod text;

pub mod syntax;

mod traits;

mod values;

mod verifier;

pub use mlirformat_macros as mlir;
pub use mliropt::*;

pub use moremath::{Execute, Executor, ThreadSingle};
#[cfg(feature = "std")]
pub use moremath::ThreadMulti;
pub use traits::{Effect, EffectKind, EffectOn, Effects, OpInfo, OpInfos, Trait};
pub use values::*;
pub use verifier::{Invalid, Verifier, Verify};

#[doc(hidden)]
pub use {alloc::vec as __vec, alloc::vec::Vec as __Vec, serde as __serde};
