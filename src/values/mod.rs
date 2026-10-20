//! ⭐ The value layer: what the text of an attribute or a type means as values — numbers
//! (`APInt`, `APFloat`), constants (`IntegerAttr`, `FloatAttr`, `DenseElementsAttr` ⇄
//! [`Const`]), memref layouts ([`StridedLayout`]), quantized types ([`UniformQuantized`]),
//! and the methods that read and build builtin types and attributes.

mod constant;
mod layout;
mod num;
mod quant;
mod types;

pub use constant::{Const, Scalar};
pub use layout::StridedLayout;
pub use num::{ApFloat, ApInt};
pub use quant::UniformQuantized;
