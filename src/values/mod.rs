//! ⭐ The value layer: what the text of an attribute or a type means as values — numbers
//! (`APInt`, `APFloat`), constants (`IntegerAttr`, `FloatAttr`, `DenseElementsAttr` ⇄
//! [`Const`]), and the methods that read and build builtin types and attributes.

mod constant;
mod num;
mod types;

pub use constant::{Const, Scalar};
pub use num::{ApFloat, ApInt};
