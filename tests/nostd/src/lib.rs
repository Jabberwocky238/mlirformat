#![no_std]

extern crate alloc;

#[path = "../../generated/cf.gen.rs"]
pub mod cf;
#[path = "../../../src/dialects/llvm.gen.rs"]
pub mod llvm;
