//! Regression: `<dialect>.gen.rs` from `mlirformat tblgen` compiles in a `#![no_std]` crate
//! (variadic fields are `Vec`, which is not in the `no_std` prelude).

#![no_std]

extern crate alloc;

#[path = "../../generated/cf.gen.rs"]
pub mod cf;
#[path = "../../generated/scf.gen.rs"]
pub mod scf;
