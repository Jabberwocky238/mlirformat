//! The ODS `custom<X>` directives, declared once each.
//!
//! Upstream MLIR keeps a directive's syntax out of the `.td` and writes it as a `parseX` /
//! `printX` pair in C++, so no consumer that reads only ODS can ever derive it. The names are
//! shared across dialects, though — `DynamicIndexList` alone is 72 of the 271 uses in upstream's
//! `.td` files — so one rule here covers every op in every dialect that calls it.
//!
//! Nothing here reaches run time as a name: `mlirformat tblgen` asks [`known`] before it keeps a
//! format, and [`Elem::list`](crate::Elem) expands the call site into plain format elements while
//! it tokenizes. The interpreter never learns a directive exists.

use crate::common::{Elem, Error};
use alloc::string::String;
use alloc::vec;
use alloc::vec::Vec;

crate::mlir::syntax! {
    /// `[%a, 7, 42]` — each item is either the static integer or, where that integer is the
    /// `kDynamic` sentinel, the next operand. Upstream: `printDynamicIndexList`, 72 call sites.
    DynamicIndexList($values, $integers) = "[" zip($integers, $values) "]";
}
