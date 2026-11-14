use crate::common::{Elem, Error};
use alloc::string::String;
use alloc::vec;
use alloc::vec::Vec;

crate::mlir::syntax! {
    DynamicIndexList($values, $integers) = "[" zip($integers, $values) "]";
}
