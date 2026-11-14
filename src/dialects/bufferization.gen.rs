#![allow(non_camel_case_types, unused_imports, clippy::all, rustdoc::all)]

use mlirformat::{mlir, Attribute, Region, Str, Type, Value, __Vec as Vec};

#[mlir::op("bufferization.alloc_tensor", results(result))]
pub struct AllocTensorOp<'a> {
    #[slot(dynamic_sizes_ty)]
    pub dynamic_sizes: Vec<Value<'a>>,
    #[slot(copy_ty)]
    pub copy: Vec<Value<'a>>,
    #[slot(size_hint_ty)]
    pub size_hint: Vec<Value<'a>>,
    pub memory_space: Option<Attribute<'a>>,
    #[dtype(is = index)]
    pub dynamic_sizes_ty: Type<'a>,
    pub copy_ty: Vec<Type<'a>>,
    #[dtype(is = index)]
    pub size_hint_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("bufferization.clone", format = "$input attr-dict `:` type($input) `to` type($output)", results(output))]
pub struct CloneOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    pub input_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("bufferization.dealloc", format = "(` ``(` $memrefs^ `:` type($memrefs) `)` `if` ` ` `(` $conditions `)` )? (`retain` ` ` `(` $retained^ `:` type($retained) `)` )? attr-dict", results(updated_conditions))]
pub struct DeallocOp<'a> {
    #[slot(memrefs_ty)]
    pub memrefs: Vec<Value<'a>>,
    #[slot(conditions_ty)]
    pub conditions: Vec<Value<'a>>,
    #[slot(retained_ty)]
    pub retained: Vec<Value<'a>>,
    pub memrefs_ty: Vec<Type<'a>>,
    #[dtype(is = i1)]
    pub conditions_ty: Type<'a>,
    pub retained_ty: Vec<Type<'a>>,
    #[dtype(is = i1)]
    pub updated_conditions: Type<'a>,
}

#[mlir::op("bufferization.dealloc_tensor", format = "$tensor attr-dict `:` type($tensor)")]
pub struct DeallocTensorOp<'a> {
    #[slot(tensor_ty)]
    pub tensor: Value<'a>,
    pub tensor_ty: Type<'a>,
}

#[mlir::op("bufferization.materialize_in_destination", format = "$source `in` (`restrict` $restrict^)? (`writable` $writable^)? $dest attr-dict `:` functional-type($source $dest, $result)", results(result))]
pub struct MaterializeInDestinationOp<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    #[slot(dest_ty)]
    pub dest: Value<'a>,
    pub restrict: bool,
    pub writable: bool,
    pub source_ty: Type<'a>,
    pub dest_ty: Type<'a>,
    pub result: Vec<Type<'a>>,
}

#[mlir::op("bufferization.to_buffer", format = "$tensor (`read_only` $read_only^)? attr-dict `:` type($tensor) `to` type($buffer)", results(buffer))]
pub struct ToBufferOp<'a> {
    #[slot(tensor_ty)]
    pub tensor: Value<'a>,
    pub read_only: bool,
    pub tensor_ty: Type<'a>,
    pub buffer: Type<'a>,
}

#[mlir::op("bufferization.to_tensor", format = "$buffer (`restrict` $restrict^)? (`writable` $writable^)? attr-dict `:` type($buffer) `to` type($result)", results(result))]
pub struct ToTensorOp<'a> {
    #[slot(buffer_ty)]
    pub buffer: Value<'a>,
    pub restrict: bool,
    pub writable: bool,
    pub buffer_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::dialect(
    "bufferization",
    ops = [AllocTensorOp, CloneOp, DeallocOp, DeallocTensorOp, MaterializeInDestinationOp, ToBufferOp, ToTensorOp],
    dependents = ["affine", "memref", "tensor", "arith"]
)]
pub struct BufferizationDialect;
