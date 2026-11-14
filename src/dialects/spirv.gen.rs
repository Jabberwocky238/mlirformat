#![allow(non_camel_case_types, unused_imports, clippy::all, rustdoc::all)]

use mlirformat::{mlir, Attribute, Region, Str, Type, Value, __Vec as Vec};

#[mlir::op("spirv.AccessChain", format = "$base_ptr `[` $indices `]` attr-dict `:` type($base_ptr) `,` type($indices) `->` qualified(type($component_ptr))", results(component_ptr))]
pub struct AccessChainOp<'a> {
    #[slot(base_ptr_ty)]
    pub base_ptr: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    pub base_ptr_ty: Type<'a>,
    pub indices_ty: Vec<Type<'a>>,
    pub component_ptr: Type<'a>,
}

#[mlir::op("spirv.mlir.addressof", format = "$variable attr-dict `:` type($pointer)", results(pointer))]
pub struct AddressOfOp<'a> {
    pub variable: Attribute<'a>,
    pub pointer: Type<'a>,
}

#[mlir::op("spirv.All", format = "$vector attr-dict `:` type($vector)", results(result))]
pub struct AllOp<'a> {
    #[slot(vector_ty)]
    pub vector: Value<'a>,
    pub vector_ty: Type<'a>,
    #[dtype(is = i1)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.Any", format = "$vector attr-dict `:` type($vector)", results(result))]
pub struct AnyOp<'a> {
    #[slot(vector_ty)]
    pub vector: Value<'a>,
    pub vector_ty: Type<'a>,
    #[dtype(is = i1)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.AtomicAnd", format = "$memory_scope $semantics $pointer `,` $value attr-dict `:` type($pointer)", results(result))]
pub struct AtomicAndOp<'a> {
    #[slot(pointer_ty)]
    pub pointer: Value<'a>,
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[attr(dialect = "spirv.scope")]
    pub memory_scope: Attribute<'a>,
    #[attr(dialect = "spirv.memory_semantics")]
    pub semantics: Attribute<'a>,
    pub pointer_ty: Type<'a>,
    #[dtype(el = pointer_ty)]
    pub value_ty: Type<'a>,
    #[dtype(el = pointer_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.AtomicCompareExchange", format = "$memory_scope $equal_semantics $unequal_semantics $pointer `,` $value `,` $comparator attr-dict `:` type($pointer)", results(result))]
pub struct AtomicCompareExchangeOp<'a> {
    #[slot(pointer_ty)]
    pub pointer: Value<'a>,
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[slot(comparator_ty)]
    pub comparator: Value<'a>,
    #[attr(dialect = "spirv.scope")]
    pub memory_scope: Attribute<'a>,
    #[attr(dialect = "spirv.memory_semantics")]
    pub equal_semantics: Attribute<'a>,
    #[attr(dialect = "spirv.memory_semantics")]
    pub unequal_semantics: Attribute<'a>,
    pub pointer_ty: Type<'a>,
    #[dtype(el = pointer_ty)]
    pub value_ty: Type<'a>,
    #[dtype(el = pointer_ty)]
    pub comparator_ty: Type<'a>,
    #[dtype(el = pointer_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.AtomicCompareExchangeWeak", format = "$memory_scope $equal_semantics $unequal_semantics $pointer `,` $value `,` $comparator attr-dict `:` type($pointer)", results(result))]
pub struct AtomicCompareExchangeWeakOp<'a> {
    #[slot(pointer_ty)]
    pub pointer: Value<'a>,
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[slot(comparator_ty)]
    pub comparator: Value<'a>,
    #[attr(dialect = "spirv.scope")]
    pub memory_scope: Attribute<'a>,
    #[attr(dialect = "spirv.memory_semantics")]
    pub equal_semantics: Attribute<'a>,
    #[attr(dialect = "spirv.memory_semantics")]
    pub unequal_semantics: Attribute<'a>,
    pub pointer_ty: Type<'a>,
    #[dtype(el = pointer_ty)]
    pub value_ty: Type<'a>,
    #[dtype(el = pointer_ty)]
    pub comparator_ty: Type<'a>,
    #[dtype(el = pointer_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.AtomicExchange", format = "$memory_scope $semantics $pointer `,` $value attr-dict `:` type($pointer)", results(result))]
pub struct AtomicExchangeOp<'a> {
    #[slot(pointer_ty)]
    pub pointer: Value<'a>,
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[attr(dialect = "spirv.scope")]
    pub memory_scope: Attribute<'a>,
    #[attr(dialect = "spirv.memory_semantics")]
    pub semantics: Attribute<'a>,
    pub pointer_ty: Type<'a>,
    #[dtype(el = pointer_ty)]
    pub value_ty: Type<'a>,
    #[dtype(el = pointer_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.AtomicIAdd", format = "$memory_scope $semantics $pointer `,` $value attr-dict `:` type($pointer)", results(result))]
pub struct AtomicIAddOp<'a> {
    #[slot(pointer_ty)]
    pub pointer: Value<'a>,
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[attr(dialect = "spirv.scope")]
    pub memory_scope: Attribute<'a>,
    #[attr(dialect = "spirv.memory_semantics")]
    pub semantics: Attribute<'a>,
    pub pointer_ty: Type<'a>,
    #[dtype(el = pointer_ty)]
    pub value_ty: Type<'a>,
    #[dtype(el = pointer_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.AtomicIDecrement", format = "$memory_scope $semantics $pointer attr-dict `:` type($pointer)", results(result))]
pub struct AtomicIDecrementOp<'a> {
    #[slot(pointer_ty)]
    pub pointer: Value<'a>,
    #[attr(dialect = "spirv.scope")]
    pub memory_scope: Attribute<'a>,
    #[attr(dialect = "spirv.memory_semantics")]
    pub semantics: Attribute<'a>,
    pub pointer_ty: Type<'a>,
    #[dtype(el = pointer_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.AtomicIIncrement", format = "$memory_scope $semantics $pointer attr-dict `:` type($pointer)", results(result))]
pub struct AtomicIIncrementOp<'a> {
    #[slot(pointer_ty)]
    pub pointer: Value<'a>,
    #[attr(dialect = "spirv.scope")]
    pub memory_scope: Attribute<'a>,
    #[attr(dialect = "spirv.memory_semantics")]
    pub semantics: Attribute<'a>,
    pub pointer_ty: Type<'a>,
    #[dtype(el = pointer_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.AtomicISub", format = "$memory_scope $semantics $pointer `,` $value attr-dict `:` type($pointer)", results(result))]
pub struct AtomicISubOp<'a> {
    #[slot(pointer_ty)]
    pub pointer: Value<'a>,
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[attr(dialect = "spirv.scope")]
    pub memory_scope: Attribute<'a>,
    #[attr(dialect = "spirv.memory_semantics")]
    pub semantics: Attribute<'a>,
    pub pointer_ty: Type<'a>,
    #[dtype(el = pointer_ty)]
    pub value_ty: Type<'a>,
    #[dtype(el = pointer_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.AtomicLoad", format = "$memory_scope $semantics $pointer attr-dict `:` type($pointer)", results(result))]
pub struct AtomicLoadOp<'a> {
    #[slot(pointer_ty)]
    pub pointer: Value<'a>,
    #[attr(dialect = "spirv.scope")]
    pub memory_scope: Attribute<'a>,
    #[attr(dialect = "spirv.memory_semantics")]
    pub semantics: Attribute<'a>,
    pub pointer_ty: Type<'a>,
    #[dtype(el = pointer_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.AtomicOr", format = "$memory_scope $semantics $pointer `,` $value attr-dict `:` type($pointer)", results(result))]
pub struct AtomicOrOp<'a> {
    #[slot(pointer_ty)]
    pub pointer: Value<'a>,
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[attr(dialect = "spirv.scope")]
    pub memory_scope: Attribute<'a>,
    #[attr(dialect = "spirv.memory_semantics")]
    pub semantics: Attribute<'a>,
    pub pointer_ty: Type<'a>,
    #[dtype(el = pointer_ty)]
    pub value_ty: Type<'a>,
    #[dtype(el = pointer_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.AtomicSMax", format = "$memory_scope $semantics $pointer `,` $value attr-dict `:` type($pointer)", results(result))]
pub struct AtomicSMaxOp<'a> {
    #[slot(pointer_ty)]
    pub pointer: Value<'a>,
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[attr(dialect = "spirv.scope")]
    pub memory_scope: Attribute<'a>,
    #[attr(dialect = "spirv.memory_semantics")]
    pub semantics: Attribute<'a>,
    pub pointer_ty: Type<'a>,
    #[dtype(el = pointer_ty)]
    pub value_ty: Type<'a>,
    #[dtype(el = pointer_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.AtomicSMin", format = "$memory_scope $semantics $pointer `,` $value attr-dict `:` type($pointer)", results(result))]
pub struct AtomicSMinOp<'a> {
    #[slot(pointer_ty)]
    pub pointer: Value<'a>,
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[attr(dialect = "spirv.scope")]
    pub memory_scope: Attribute<'a>,
    #[attr(dialect = "spirv.memory_semantics")]
    pub semantics: Attribute<'a>,
    pub pointer_ty: Type<'a>,
    #[dtype(el = pointer_ty)]
    pub value_ty: Type<'a>,
    #[dtype(el = pointer_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.AtomicStore", format = "$memory_scope $semantics $pointer `,` $value attr-dict `:` type($pointer)")]
pub struct AtomicStoreOp<'a> {
    #[slot(pointer_ty)]
    pub pointer: Value<'a>,
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[attr(dialect = "spirv.scope")]
    pub memory_scope: Attribute<'a>,
    #[attr(dialect = "spirv.memory_semantics")]
    pub semantics: Attribute<'a>,
    pub pointer_ty: Type<'a>,
    #[dtype(el = pointer_ty)]
    pub value_ty: Type<'a>,
}

#[mlir::op("spirv.AtomicUMax", format = "$memory_scope $semantics $pointer `,` $value attr-dict `:` type($pointer)", results(result))]
pub struct AtomicUMaxOp<'a> {
    #[slot(pointer_ty)]
    pub pointer: Value<'a>,
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[attr(dialect = "spirv.scope")]
    pub memory_scope: Attribute<'a>,
    #[attr(dialect = "spirv.memory_semantics")]
    pub semantics: Attribute<'a>,
    pub pointer_ty: Type<'a>,
    #[dtype(el = pointer_ty)]
    pub value_ty: Type<'a>,
    #[dtype(el = pointer_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.AtomicUMin", format = "$memory_scope $semantics $pointer `,` $value attr-dict `:` type($pointer)", results(result))]
pub struct AtomicUMinOp<'a> {
    #[slot(pointer_ty)]
    pub pointer: Value<'a>,
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[attr(dialect = "spirv.scope")]
    pub memory_scope: Attribute<'a>,
    #[attr(dialect = "spirv.memory_semantics")]
    pub semantics: Attribute<'a>,
    pub pointer_ty: Type<'a>,
    #[dtype(el = pointer_ty)]
    pub value_ty: Type<'a>,
    #[dtype(el = pointer_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.AtomicXor", format = "$memory_scope $semantics $pointer `,` $value attr-dict `:` type($pointer)", results(result))]
pub struct AtomicXorOp<'a> {
    #[slot(pointer_ty)]
    pub pointer: Value<'a>,
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[attr(dialect = "spirv.scope")]
    pub memory_scope: Attribute<'a>,
    #[attr(dialect = "spirv.memory_semantics")]
    pub semantics: Attribute<'a>,
    pub pointer_ty: Type<'a>,
    #[dtype(el = pointer_ty)]
    pub value_ty: Type<'a>,
    #[dtype(el = pointer_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.BitCount", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct BitCountOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.BitFieldInsert", format = "$base `,` $insert `,` $offset `,` $count attr-dict `:` type($base) `,` type($offset) `,` type($count)", results(result))]
pub struct BitFieldInsertOp<'a> {
    #[slot(result)]
    pub base: Value<'a>,
    #[slot(result)]
    pub insert: Value<'a>,
    #[slot(offset_ty)]
    pub offset: Value<'a>,
    #[slot(count_ty)]
    pub count: Value<'a>,
    pub offset_ty: Type<'a>,
    pub count_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.BitFieldSExtract", format = "$base `,` $offset `,` $count attr-dict `:` type($base) `,` type($offset) `,` type($count)", results(result))]
pub struct BitFieldSExtractOp<'a> {
    #[slot(result)]
    pub base: Value<'a>,
    #[slot(offset_ty)]
    pub offset: Value<'a>,
    #[slot(count_ty)]
    pub count: Value<'a>,
    pub offset_ty: Type<'a>,
    pub count_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.BitFieldUExtract", format = "$base `,` $offset `,` $count attr-dict `:` type($base) `,` type($offset) `,` type($count)", results(result))]
pub struct BitFieldUExtractOp<'a> {
    #[slot(result)]
    pub base: Value<'a>,
    #[slot(offset_ty)]
    pub offset: Value<'a>,
    #[slot(count_ty)]
    pub count: Value<'a>,
    pub offset_ty: Type<'a>,
    pub count_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.BitReverse", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct BitReverseOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.Bitcast", format = "$operand attr-dict `:` type($operand) `to` type($result)", results(result))]
pub struct BitcastOp<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    pub operand_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.BitwiseAnd", format = "$operand1 `,` $operand2 attr-dict `:` type($result)", results(result))]
pub struct BitwiseAndOp<'a> {
    #[slot(result)]
    pub operand1: Value<'a>,
    #[slot(result)]
    pub operand2: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.BitwiseOr", format = "$operand1 `,` $operand2 attr-dict `:` type($result)", results(result))]
pub struct BitwiseOrOp<'a> {
    #[slot(result)]
    pub operand1: Value<'a>,
    #[slot(result)]
    pub operand2: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.BitwiseXor", format = "$operand1 `,` $operand2 attr-dict `:` type($result)", results(result))]
pub struct BitwiseXorOp<'a> {
    #[slot(result)]
    pub operand1: Value<'a>,
    #[slot(result)]
    pub operand2: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.BranchConditional")]
pub struct BranchConditionalOp<'a> {
    #[slot(condition_ty)]
    pub condition: Value<'a>,
    #[slot(true_target_operands_ty, name = "trueTargetOperands")]
    pub true_target_operands: Vec<Value<'a>>,
    #[slot(false_target_operands_ty, name = "falseTargetOperands")]
    pub false_target_operands: Vec<Value<'a>>,
    pub branch_weights: Option<Attribute<'a>>,
    #[successor(name = "trueTarget")]
    pub true_target: Str<'a>,
    #[successor(name = "falseTarget")]
    pub false_target: Str<'a>,
    #[dtype(is = i1)]
    pub condition_ty: Type<'a>,
    pub true_target_operands_ty: Vec<Type<'a>>,
    pub false_target_operands_ty: Vec<Type<'a>>,
}

#[mlir::op("spirv.Branch", format = "$target (`(` $targetOperands^ `:` type($targetOperands) `)`)? attr-dict")]
pub struct BranchOp<'a> {
    #[slot(target_operands_ty, name = "targetOperands")]
    pub target_operands: Vec<Value<'a>>,
    #[successor]
    pub target: Str<'a>,
    pub target_operands_ty: Vec<Type<'a>>,
}

#[mlir::op("spirv.CL.acos", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct CLAcosOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.acosh", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct CLAcoshOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.asin", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct CLAsinOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.asinh", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct CLAsinhOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.atan2", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct CLAtan2Op<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.atan", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct CLAtanOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.atanh", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct CLAtanhOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.cbrt", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct CLCbrtOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.ceil", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct CLCeilOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.clz", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct CLClzOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.copysign", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct CLCopysignOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.cos", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct CLCosOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.cosh", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct CLCoshOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.erf", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct CLErfOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.erfc", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct CLErfcOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.exp10", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct CLExp10Op<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.exp2", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct CLExp2Op<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.exp", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct CLExpOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.expm1", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct CLExpm1Op<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.fabs", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct CLFAbsOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.fmax", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct CLFMaxOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.fmin", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct CLFMinOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.fdim", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct CLFdimOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.floor", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct CLFloorOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.fma", format = "$x `,` $y `,` $z attr-dict `:` type($result)", results(result))]
pub struct CLFmaOp<'a> {
    #[slot(result)]
    pub x: Value<'a>,
    #[slot(result)]
    pub y: Value<'a>,
    #[slot(result)]
    pub z: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.fmod", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct CLFmodOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.hypot", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct CLHypotOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.ldexp", format = "attr-dict $x `,` $exp `:` type($x) `,` type($exp) `->` type($y)", results(y))]
pub struct CLLdexpOp<'a> {
    #[slot(y)]
    pub x: Value<'a>,
    #[slot(exp_ty)]
    pub exp: Value<'a>,
    pub exp_ty: Type<'a>,
    pub y: Type<'a>,
}

#[mlir::op("spirv.CL.log10", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct CLLog10Op<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.log1p", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct CLLog1pOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.log2", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct CLLog2Op<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.log", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct CLLogOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.mix", format = "$x `,` $y `,` $z attr-dict `:` type($result)", results(result))]
pub struct CLMixOp<'a> {
    #[slot(result)]
    pub x: Value<'a>,
    #[slot(result)]
    pub y: Value<'a>,
    #[slot(result)]
    pub z: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.pow", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct CLPowOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.pown", format = "attr-dict $x `,` $y `:` type($x) `,` type($y) `->` type($result)", results(result))]
pub struct CLPownOp<'a> {
    #[slot(result)]
    pub x: Value<'a>,
    #[slot(y_ty)]
    pub y: Value<'a>,
    pub y_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.printf", format = "$format ( $arguments^ )? attr-dict `:` type($format) ( `,` type($arguments)^ )? `->` type($result)", results(result))]
pub struct CLPrintfOp<'a> {
    #[slot(format_ty)]
    pub format: Value<'a>,
    #[slot(arguments_ty)]
    pub arguments: Vec<Value<'a>>,
    pub format_ty: Type<'a>,
    pub arguments_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.rint", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct CLRintOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.rootn", format = "attr-dict $x `,` $n `:` type($x) `,` type($n) `->` type($result)", results(result))]
pub struct CLRootnOp<'a> {
    #[slot(result)]
    pub x: Value<'a>,
    #[slot(n_ty)]
    pub n: Value<'a>,
    pub n_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.round", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct CLRoundOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.rsqrt", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct CLRsqrtOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.s_abs", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct CLSAbsOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.s_max", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct CLSMaxOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.s_min", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct CLSMinOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.sin", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct CLSinOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.sinh", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct CLSinhOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.sqrt", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct CLSqrtOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.tan", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct CLTanOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.tanh", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct CLTanhOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.trunc", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct CLTruncOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.u_max", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct CLUMaxOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CL.u_min", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct CLUMinOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CompositeConstruct", format = "$constituents attr-dict `:` `(` qualified(type($constituents)) `)` `->` type($result)", results(result))]
pub struct CompositeConstructOp<'a> {
    #[slot(constituents_ty)]
    pub constituents: Vec<Value<'a>>,
    pub constituents_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CompositeExtract", results(component))]
pub struct CompositeExtractOp<'a> {
    #[slot(composite_ty)]
    pub composite: Value<'a>,
    pub indices: Attribute<'a>,
    pub composite_ty: Type<'a>,
    pub component: Type<'a>,
}

#[mlir::op("spirv.CompositeInsert", results(result))]
pub struct CompositeInsertOp<'a> {
    #[slot(object_ty)]
    pub object: Value<'a>,
    #[slot(composite_ty)]
    pub composite: Value<'a>,
    pub indices: Attribute<'a>,
    pub object_ty: Type<'a>,
    pub composite_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.Constant", results(constant))]
pub struct ConstantOp<'a> {
    pub value: Attribute<'a>,
    pub constant: Type<'a>,
}

#[mlir::op("spirv.ControlBarrier", format = "$execution_scope `,` $memory_scope `,` $memory_semantics attr-dict")]
pub struct ControlBarrierOp<'a> {
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    #[attr(dialect = "spirv.scope")]
    pub memory_scope: Attribute<'a>,
    #[attr(dialect = "spirv.memory_semantics")]
    pub memory_semantics: Attribute<'a>,
}

#[mlir::op("spirv.ConvertFToS", format = "$operand attr-dict `:` type($operand) `to` type($result)", results(result))]
pub struct ConvertFToSOp<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    pub operand_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.ConvertFToU", format = "$operand attr-dict `:` type($operand) `to` type($result)", results(result))]
pub struct ConvertFToUOp<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    pub operand_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.ConvertPtrToU", format = "$pointer attr-dict `:` type($pointer) `to` type($result)", results(result))]
pub struct ConvertPtrToUOp<'a> {
    #[slot(pointer_ty)]
    pub pointer: Value<'a>,
    pub pointer_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.ConvertSToF", format = "$operand attr-dict `:` type($operand) `to` type($result)", results(result))]
pub struct ConvertSToFOp<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    pub operand_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.ConvertUToF", format = "$operand attr-dict `:` type($operand) `to` type($result)", results(result))]
pub struct ConvertUToFOp<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    pub operand_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.ConvertUToPtr", format = "$operand attr-dict `:` type($operand) `to` type($result)", results(result))]
pub struct ConvertUToPtrOp<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    pub operand_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.CopyMemory")]
pub struct CopyMemoryOp<'a> {
    #[slot(target_ty)]
    pub target: Value<'a>,
    #[slot(source_ty)]
    pub source: Value<'a>,
    #[attr(dialect = "spirv.memory_access")]
    pub memory_access: Option<Attribute<'a>>,
    #[attr(int = "i32")]
    pub alignment: Option<Attribute<'a>>,
    #[attr(dialect = "spirv.memory_access")]
    pub source_memory_access: Option<Attribute<'a>>,
    #[attr(int = "i32")]
    pub source_alignment: Option<Attribute<'a>>,
    pub target_ty: Type<'a>,
    pub source_ty: Type<'a>,
}

#[mlir::op("spirv.Dot", format = "$vector1 `,` $vector2 attr-dict `:` type($vector1) `->` type($result)", results(result))]
pub struct DotOp<'a> {
    #[slot(vector1_ty)]
    pub vector1: Value<'a>,
    #[slot(vector1_ty)]
    pub vector2: Value<'a>,
    pub vector1_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.EXT.AtomicFAdd", format = "$memory_scope $semantics $pointer `,` $value attr-dict `:` type($pointer)", results(result))]
pub struct EXTAtomicFAddOp<'a> {
    #[slot(pointer_ty)]
    pub pointer: Value<'a>,
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[attr(dialect = "spirv.scope")]
    pub memory_scope: Attribute<'a>,
    #[attr(dialect = "spirv.memory_semantics")]
    pub semantics: Attribute<'a>,
    pub pointer_ty: Type<'a>,
    #[dtype(el = pointer_ty)]
    pub value_ty: Type<'a>,
    #[dtype(el = pointer_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.EXT.ConstantCompositeReplicate", format = "` ` `[` $value `]` `:` type($replicated_constant) attr-dict", results(replicated_constant))]
pub struct EXTConstantCompositeReplicateOp<'a> {
    pub value: Attribute<'a>,
    pub replicated_constant: Type<'a>,
}

#[mlir::op("spirv.EXT.EmitMeshTasks")]
pub struct EXTEmitMeshTasksOp<'a> {
    #[slot(group_count_x_ty)]
    pub group_count_x: Value<'a>,
    #[slot(group_count_y_ty)]
    pub group_count_y: Value<'a>,
    #[slot(group_count_z_ty)]
    pub group_count_z: Value<'a>,
    #[slot(payload_ty)]
    pub payload: Vec<Value<'a>>,
    pub group_count_x_ty: Type<'a>,
    pub group_count_y_ty: Type<'a>,
    pub group_count_z_ty: Type<'a>,
    pub payload_ty: Vec<Type<'a>>,
}

#[mlir::op("spirv.EXT.SetMeshOutputs", format = "$vertex_count `,` $primitive_count attr-dict `:` qualified(type($vertex_count)) `,` qualified(type($primitive_count))")]
pub struct EXTSetMeshOutputsOp<'a> {
    #[slot(vertex_count_ty)]
    pub vertex_count: Value<'a>,
    #[slot(primitive_count_ty)]
    pub primitive_count: Value<'a>,
    pub vertex_count_ty: Type<'a>,
    pub primitive_count_ty: Type<'a>,
}

#[mlir::op("spirv.EXT.SpecConstantCompositeReplicate")]
pub struct EXTSpecConstantCompositeReplicateOp<'a> {
    #[attr(name = "type")]
    pub type_: Attribute<'a>,
    pub sym_name: Attribute<'a>,
    pub constituent: Attribute<'a>,
}

#[mlir::op("spirv.EmitVertex", format = "attr-dict")]
pub struct EmitVertexOp<'a> {
}

#[mlir::op("spirv.EndPrimitive", format = "attr-dict")]
pub struct EndPrimitiveOp<'a> {
}

#[mlir::op("spirv.EntryPoint")]
pub struct EntryPointOp<'a> {
    #[attr(dialect = "spirv.execution_model")]
    pub execution_model: Attribute<'a>,
    #[attr(name = "fn")]
    pub fn_: Attribute<'a>,
    pub interface: Attribute<'a>,
}

#[mlir::op("spirv.ExecutionModeId")]
pub struct ExecutionModeIdOp<'a> {
    #[attr(name = "fn")]
    pub fn_: Attribute<'a>,
    #[attr(dialect = "spirv.execution_mode")]
    pub execution_mode: Attribute<'a>,
    pub values: Attribute<'a>,
}

#[mlir::op("spirv.ExecutionMode")]
pub struct ExecutionModeOp<'a> {
    #[attr(name = "fn")]
    pub fn_: Attribute<'a>,
    #[attr(dialect = "spirv.execution_mode")]
    pub execution_mode: Attribute<'a>,
    pub values: Attribute<'a>,
}

#[mlir::op("spirv.ExperimentalML.Call", format = "`opcode` `=` $opcode `,` $parameters attr-dict `:` functional-type($parameters, $output)", results(output))]
pub struct ExperimentalMLCallOp<'a> {
    #[slot(parameters_ty)]
    pub parameters: Vec<Value<'a>>,
    #[attr(int = "i32")]
    pub opcode: Attribute<'a>,
    pub parameters_ty: Vec<Type<'a>>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.FAdd", format = "$operand1 `,` $operand2 attr-dict `:` type($result)", results(result))]
pub struct FAddOp<'a> {
    #[slot(result)]
    pub operand1: Value<'a>,
    #[slot(result)]
    pub operand2: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.FConvert", format = "$operand attr-dict `:` type($operand) `to` type($result)", results(result))]
pub struct FConvertOp<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    pub operand_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.FDiv", format = "$operand1 `,` $operand2 attr-dict `:` type($result)", results(result))]
pub struct FDivOp<'a> {
    #[slot(result)]
    pub operand1: Value<'a>,
    #[slot(result)]
    pub operand2: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.FMod", format = "$operand1 `,` $operand2 attr-dict `:` type($result)", results(result))]
pub struct FModOp<'a> {
    #[slot(result)]
    pub operand1: Value<'a>,
    #[slot(result)]
    pub operand2: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.FMul", format = "$operand1 `,` $operand2 attr-dict `:` type($result)", results(result))]
pub struct FMulOp<'a> {
    #[slot(result)]
    pub operand1: Value<'a>,
    #[slot(result)]
    pub operand2: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.FNegate", format = "$operand attr-dict `:` type($result)", results(result))]
pub struct FNegateOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.FOrdEqual", format = "$operand1 `,` $operand2 `:` type($operand1) attr-dict", results(result))]
pub struct FOrdEqualOp<'a> {
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand1_ty)]
    pub operand2: Value<'a>,
    pub operand1_ty: Type<'a>,
    #[dtype(i1 = operand1_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.FOrdGreaterThanEqual", format = "$operand1 `,` $operand2 `:` type($operand1) attr-dict", results(result))]
pub struct FOrdGreaterThanEqualOp<'a> {
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand1_ty)]
    pub operand2: Value<'a>,
    pub operand1_ty: Type<'a>,
    #[dtype(i1 = operand1_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.FOrdGreaterThan", format = "$operand1 `,` $operand2 `:` type($operand1) attr-dict", results(result))]
pub struct FOrdGreaterThanOp<'a> {
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand1_ty)]
    pub operand2: Value<'a>,
    pub operand1_ty: Type<'a>,
    #[dtype(i1 = operand1_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.FOrdLessThanEqual", format = "$operand1 `,` $operand2 `:` type($operand1) attr-dict", results(result))]
pub struct FOrdLessThanEqualOp<'a> {
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand1_ty)]
    pub operand2: Value<'a>,
    pub operand1_ty: Type<'a>,
    #[dtype(i1 = operand1_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.FOrdLessThan", format = "$operand1 `,` $operand2 `:` type($operand1) attr-dict", results(result))]
pub struct FOrdLessThanOp<'a> {
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand1_ty)]
    pub operand2: Value<'a>,
    pub operand1_ty: Type<'a>,
    #[dtype(i1 = operand1_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.FOrdNotEqual", format = "$operand1 `,` $operand2 `:` type($operand1) attr-dict", results(result))]
pub struct FOrdNotEqualOp<'a> {
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand1_ty)]
    pub operand2: Value<'a>,
    pub operand1_ty: Type<'a>,
    #[dtype(i1 = operand1_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.FRem", format = "$operand1 `,` $operand2 attr-dict `:` type($result)", results(result))]
pub struct FRemOp<'a> {
    #[slot(result)]
    pub operand1: Value<'a>,
    #[slot(result)]
    pub operand2: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.FSub", format = "$operand1 `,` $operand2 attr-dict `:` type($result)", results(result))]
pub struct FSubOp<'a> {
    #[slot(result)]
    pub operand1: Value<'a>,
    #[slot(result)]
    pub operand2: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.FUnordEqual", format = "$operand1 `,` $operand2 `:` type($operand1) attr-dict", results(result))]
pub struct FUnordEqualOp<'a> {
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand1_ty)]
    pub operand2: Value<'a>,
    pub operand1_ty: Type<'a>,
    #[dtype(i1 = operand1_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.FUnordGreaterThanEqual", format = "$operand1 `,` $operand2 `:` type($operand1) attr-dict", results(result))]
pub struct FUnordGreaterThanEqualOp<'a> {
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand1_ty)]
    pub operand2: Value<'a>,
    pub operand1_ty: Type<'a>,
    #[dtype(i1 = operand1_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.FUnordGreaterThan", format = "$operand1 `,` $operand2 `:` type($operand1) attr-dict", results(result))]
pub struct FUnordGreaterThanOp<'a> {
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand1_ty)]
    pub operand2: Value<'a>,
    pub operand1_ty: Type<'a>,
    #[dtype(i1 = operand1_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.FUnordLessThanEqual", format = "$operand1 `,` $operand2 `:` type($operand1) attr-dict", results(result))]
pub struct FUnordLessThanEqualOp<'a> {
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand1_ty)]
    pub operand2: Value<'a>,
    pub operand1_ty: Type<'a>,
    #[dtype(i1 = operand1_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.FUnordLessThan", format = "$operand1 `,` $operand2 `:` type($operand1) attr-dict", results(result))]
pub struct FUnordLessThanOp<'a> {
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand1_ty)]
    pub operand2: Value<'a>,
    pub operand1_ty: Type<'a>,
    #[dtype(i1 = operand1_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.FUnordNotEqual", format = "$operand1 `,` $operand2 `:` type($operand1) attr-dict", results(result))]
pub struct FUnordNotEqualOp<'a> {
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand1_ty)]
    pub operand2: Value<'a>,
    pub operand1_ty: Type<'a>,
    #[dtype(i1 = operand1_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.func")]
pub struct FuncOp<'a> {
    pub function_type: Attribute<'a>,
    pub arg_attrs: Option<Attribute<'a>>,
    pub res_attrs: Option<Attribute<'a>>,
    pub sym_name: Attribute<'a>,
    #[attr(dialect = "spirv.function_control")]
    pub function_control: Attribute<'a>,
    #[attr(dialect = "spirv.linkage_attributes")]
    pub linkage_attributes: Option<Attribute<'a>>,
    pub body: Region<'a>,
}

#[mlir::op("spirv.FunctionCall", format = "$callee `(` $arguments `)` attr-dict `:` functional-type($arguments, $return_value)", results(return_value))]
pub struct FunctionCallOp<'a> {
    #[slot(arguments_ty)]
    pub arguments: Vec<Value<'a>>,
    pub callee: Attribute<'a>,
    pub arg_attrs: Option<Attribute<'a>>,
    pub res_attrs: Option<Attribute<'a>>,
    pub arguments_ty: Vec<Type<'a>>,
    pub return_value: Vec<Type<'a>>,
}

#[mlir::op("spirv.GL.Acos", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct GLAcosOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.Acosh", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct GLAcoshOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.Asin", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct GLAsinOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.Asinh", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct GLAsinhOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.Atan2", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct GLAtan2Op<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.Atan", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct GLAtanOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.Atanh", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct GLAtanhOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.Ceil", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct GLCeilOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.Cos", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct GLCosOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.Cosh", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct GLCoshOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.Cross", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct GLCrossOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.Degrees", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct GLDegreesOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.Distance", format = "$p0 `,` $p1 attr-dict `:` type($p0) `,` type($p1) `->` type($result)", results(result))]
pub struct GLDistanceOp<'a> {
    #[slot(p0_ty)]
    pub p0: Value<'a>,
    #[slot(p0_ty)]
    pub p1: Value<'a>,
    pub p0_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.Exp2", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct GLExp2Op<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.Exp", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct GLExpOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.FAbs", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct GLFAbsOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.FClamp", results(result))]
pub struct GLFClampOp<'a> {
    #[slot(x_ty)]
    pub x: Value<'a>,
    #[slot(y_ty)]
    pub y: Value<'a>,
    #[slot(z_ty)]
    pub z: Value<'a>,
    pub x_ty: Type<'a>,
    pub y_ty: Type<'a>,
    pub z_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.FMax", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct GLFMaxOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.FMin", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct GLFMinOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.FMix", format = "attr-dict $x `:` type($x) `,` $y `:` type($y) `,` $a `:` type($a) `->` type($result)", results(result))]
pub struct GLFMixOp<'a> {
    #[slot(result)]
    pub x: Value<'a>,
    #[slot(result)]
    pub y: Value<'a>,
    #[slot(result)]
    pub a: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.FSign", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct GLFSignOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.FindILsb", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct GLFindILsbOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.FindSMsb", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct GLFindSMsbOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.FindUMsb", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct GLFindUMsbOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.Floor", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct GLFloorOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.Fma", results(result))]
pub struct GLFmaOp<'a> {
    #[slot(x_ty)]
    pub x: Value<'a>,
    #[slot(y_ty)]
    pub y: Value<'a>,
    #[slot(z_ty)]
    pub z: Value<'a>,
    pub x_ty: Type<'a>,
    pub y_ty: Type<'a>,
    pub z_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.Fract", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct GLFractOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.FrexpStruct", format = "attr-dict $operand `:` type($operand) `->` type($result)", results(result))]
pub struct GLFrexpStructOp<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    pub operand_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.InverseSqrt", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct GLInverseSqrtOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.Ldexp", format = "attr-dict $x `:` type($x) `,` $exp `:` type($exp) `->` type($y)", results(y))]
pub struct GLLdexpOp<'a> {
    #[slot(y)]
    pub x: Value<'a>,
    #[slot(exp_ty)]
    pub exp: Value<'a>,
    pub exp_ty: Type<'a>,
    pub y: Type<'a>,
}

#[mlir::op("spirv.GL.Length", format = "$operand attr-dict `:` type($operand) `->` type($result)", results(result))]
pub struct GLLengthOp<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    pub operand_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.Log2", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct GLLog2Op<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.Log", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct GLLogOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.NClamp", results(result))]
pub struct GLNClampOp<'a> {
    #[slot(x_ty)]
    pub x: Value<'a>,
    #[slot(y_ty)]
    pub y: Value<'a>,
    #[slot(z_ty)]
    pub z: Value<'a>,
    pub x_ty: Type<'a>,
    pub y_ty: Type<'a>,
    pub z_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.NMax", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct GLNMaxOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.NMin", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct GLNMinOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.Normalize", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct GLNormalizeOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.PackHalf2x16", format = "attr-dict $operand `:` type($operand) `->` type($result)", results(result))]
pub struct GLPackHalf2x16Op<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    pub operand_ty: Type<'a>,
    #[dtype(is = i32)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.PackSnorm4x8", format = "attr-dict $operand `:` type($operand) `->` type($result)", results(result))]
pub struct GLPackSnorm4x8Op<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    pub operand_ty: Type<'a>,
    #[dtype(is = i32)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.Pow", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct GLPowOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.Radians", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct GLRadiansOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.Reflect", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct GLReflectOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.RoundEven", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct GLRoundEvenOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.Round", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct GLRoundOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.SAbs", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct GLSAbsOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.SClamp", results(result))]
pub struct GLSClampOp<'a> {
    #[slot(x_ty)]
    pub x: Value<'a>,
    #[slot(y_ty)]
    pub y: Value<'a>,
    #[slot(z_ty)]
    pub z: Value<'a>,
    pub x_ty: Type<'a>,
    pub y_ty: Type<'a>,
    pub z_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.SMax", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct GLSMaxOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.SMin", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct GLSMinOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.SSign", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct GLSSignOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.Sin", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct GLSinOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.Sinh", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct GLSinhOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.SmoothStep", results(result))]
pub struct GLSmoothStepOp<'a> {
    #[slot(x_ty)]
    pub x: Value<'a>,
    #[slot(y_ty)]
    pub y: Value<'a>,
    #[slot(z_ty)]
    pub z: Value<'a>,
    pub x_ty: Type<'a>,
    pub y_ty: Type<'a>,
    pub z_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.Sqrt", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct GLSqrtOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.Step", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct GLStepOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.Tan", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct GLTanOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.Tanh", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct GLTanhOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.Trunc", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct GLTruncOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.UClamp", results(result))]
pub struct GLUClampOp<'a> {
    #[slot(x_ty)]
    pub x: Value<'a>,
    #[slot(y_ty)]
    pub y: Value<'a>,
    #[slot(z_ty)]
    pub z: Value<'a>,
    pub x_ty: Type<'a>,
    pub y_ty: Type<'a>,
    pub z_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.UMax", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct GLUMaxOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.UMin", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct GLUMinOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.UnpackHalf2x16", format = "attr-dict $operand `:` type($operand) `->` type($result)", results(result))]
pub struct GLUnpackHalf2x16Op<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    #[dtype(is = i32)]
    pub operand_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GL.UnpackSnorm4x8", format = "attr-dict $operand `:` type($operand) `->` type($result)", results(result))]
pub struct GLUnpackSnorm4x8Op<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    #[dtype(is = i32)]
    pub operand_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GenericCastToPtrExplicit", format = "$pointer attr-dict `:` type($pointer) `to` type($result)", results(result))]
pub struct GenericCastToPtrExplicitOp<'a> {
    #[slot(pointer_ty)]
    pub pointer: Value<'a>,
    pub pointer_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GenericCastToPtr", format = "$pointer attr-dict `:` type($pointer) `to` type($result)", results(result))]
pub struct GenericCastToPtrOp<'a> {
    #[slot(pointer_ty)]
    pub pointer: Value<'a>,
    pub pointer_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GlobalVariable")]
pub struct GlobalVariableOp<'a> {
    #[attr(name = "type")]
    pub type_: Attribute<'a>,
    pub sym_name: Attribute<'a>,
    pub initializer: Option<Attribute<'a>>,
    #[attr(int = "i32")]
    pub location: Option<Attribute<'a>>,
    #[attr(int = "i32")]
    pub binding: Option<Attribute<'a>>,
    #[attr(int = "i32")]
    pub descriptor_set: Option<Attribute<'a>>,
    pub built_in: Option<Attribute<'a>>,
    #[attr(dialect = "spirv.linkage_attributes")]
    pub linkage_attributes: Option<Attribute<'a>>,
}

#[mlir::op("spirv.ARM.Graph")]
pub struct GraphARMOp<'a> {
    pub function_type: Attribute<'a>,
    pub arg_attrs: Option<Attribute<'a>>,
    pub res_attrs: Option<Attribute<'a>>,
    pub entry_point: Option<Attribute<'a>>,
    pub sym_name: Attribute<'a>,
    pub body: Region<'a>,
}

#[mlir::op("spirv.ARM.GraphConstant", format = "attr-dict `:` type($output)", results(output))]
pub struct GraphConstantARMOp<'a> {
    #[attr(int = "i32")]
    pub graph_constant_id: Attribute<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.ARM.GraphEntryPoint")]
pub struct GraphEntryPointARMOp<'a> {
    #[attr(name = "fn")]
    pub fn_: Attribute<'a>,
    pub interface: Attribute<'a>,
}

#[mlir::op("spirv.ARM.GraphOutputs", format = "$value attr-dict `:` type($value)")]
pub struct GraphOutputsARMOp<'a> {
    #[slot(value_ty)]
    pub value: Vec<Value<'a>>,
    pub value_ty: Vec<Type<'a>>,
}

#[mlir::op("spirv.GroupBroadcast", format = "$execution_scope $value `,` $localid attr-dict `:` type($value) `,` type($localid)", results(result))]
pub struct GroupBroadcastOp<'a> {
    #[slot(result)]
    pub value: Value<'a>,
    #[slot(localid_ty)]
    pub localid: Value<'a>,
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    pub localid_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GroupFAdd", format = "$execution_scope $group_operation $x attr-dict `:` type($x)", results(result))]
pub struct GroupFAddOp<'a> {
    #[slot(result)]
    pub x: Value<'a>,
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    #[attr(dialect = "spirv.group_operation")]
    pub group_operation: Attribute<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GroupFMax", format = "$execution_scope $group_operation $x attr-dict `:` type($x)", results(result))]
pub struct GroupFMaxOp<'a> {
    #[slot(result)]
    pub x: Value<'a>,
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    #[attr(dialect = "spirv.group_operation")]
    pub group_operation: Attribute<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GroupFMin", format = "$execution_scope $group_operation $x attr-dict `:` type($x)", results(result))]
pub struct GroupFMinOp<'a> {
    #[slot(result)]
    pub x: Value<'a>,
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    #[attr(dialect = "spirv.group_operation")]
    pub group_operation: Attribute<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.KHR.GroupFMul", format = "$execution_scope $group_operation $x attr-dict `:` type($x)", results(result))]
pub struct GroupFMulKHROp<'a> {
    #[slot(result)]
    pub x: Value<'a>,
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    #[attr(dialect = "spirv.group_operation")]
    pub group_operation: Attribute<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GroupIAdd", format = "$execution_scope $group_operation $x attr-dict `:` type($x)", results(result))]
pub struct GroupIAddOp<'a> {
    #[slot(result)]
    pub x: Value<'a>,
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    #[attr(dialect = "spirv.group_operation")]
    pub group_operation: Attribute<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.KHR.GroupIMul", format = "$execution_scope $group_operation $x attr-dict `:` type($x)", results(result))]
pub struct GroupIMulKHROp<'a> {
    #[slot(result)]
    pub x: Value<'a>,
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    #[attr(dialect = "spirv.group_operation")]
    pub group_operation: Attribute<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GroupNonUniformAllEqual", format = "$execution_scope $value attr-dict `:` type($value) `,` type($result)", results(result))]
pub struct GroupNonUniformAllEqualOp<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    pub value_ty: Type<'a>,
    #[dtype(is = i1)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.GroupNonUniformAll", format = "$execution_scope $predicate attr-dict `:` type($result)", results(result))]
pub struct GroupNonUniformAllOp<'a> {
    #[slot(predicate_ty)]
    pub predicate: Value<'a>,
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    #[dtype(is = i1)]
    pub predicate_ty: Type<'a>,
    #[dtype(is = i1)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.GroupNonUniformAny", format = "$execution_scope $predicate attr-dict `:` type($result)", results(result))]
pub struct GroupNonUniformAnyOp<'a> {
    #[slot(predicate_ty)]
    pub predicate: Value<'a>,
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    #[dtype(is = i1)]
    pub predicate_ty: Type<'a>,
    #[dtype(is = i1)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.GroupNonUniformBallotBitCount", format = "$execution_scope $group_operation $value attr-dict `:` type($value) `->` type($result)", results(result))]
pub struct GroupNonUniformBallotBitCountOp<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    #[attr(dialect = "spirv.group_operation")]
    pub group_operation: Attribute<'a>,
    pub value_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GroupNonUniformBallotFindLSB", format = "$execution_scope $value attr-dict `:` type($value) `,` type($result)", results(result))]
pub struct GroupNonUniformBallotFindLSBOp<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    pub value_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GroupNonUniformBallotFindMSB", format = "$execution_scope $value attr-dict `:` type($value) `,` type($result)", results(result))]
pub struct GroupNonUniformBallotFindMSBOp<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    pub value_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GroupNonUniformBallot", format = "$execution_scope $predicate attr-dict `:` type($result)", results(result))]
pub struct GroupNonUniformBallotOp<'a> {
    #[slot(predicate_ty)]
    pub predicate: Value<'a>,
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    #[dtype(is = i1)]
    pub predicate_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GroupNonUniformBitwiseAnd", format = "$execution_scope $group_operation $value (`cluster_size``(` $cluster_size^ `)`)? attr-dict `:` type($value) (`,` type($cluster_size)^)? `->` qualified(type($result))", results(result))]
pub struct GroupNonUniformBitwiseAndOp<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[slot(cluster_size_ty)]
    pub cluster_size: Vec<Value<'a>>,
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    #[attr(dialect = "spirv.group_operation")]
    pub group_operation: Attribute<'a>,
    pub value_ty: Type<'a>,
    pub cluster_size_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GroupNonUniformBitwiseOr", format = "$execution_scope $group_operation $value (`cluster_size``(` $cluster_size^ `)`)? attr-dict `:` type($value) (`,` type($cluster_size)^)? `->` qualified(type($result))", results(result))]
pub struct GroupNonUniformBitwiseOrOp<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[slot(cluster_size_ty)]
    pub cluster_size: Vec<Value<'a>>,
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    #[attr(dialect = "spirv.group_operation")]
    pub group_operation: Attribute<'a>,
    pub value_ty: Type<'a>,
    pub cluster_size_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GroupNonUniformBitwiseXor", format = "$execution_scope $group_operation $value (`cluster_size``(` $cluster_size^ `)`)? attr-dict `:` type($value) (`,` type($cluster_size)^)? `->` qualified(type($result))", results(result))]
pub struct GroupNonUniformBitwiseXorOp<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[slot(cluster_size_ty)]
    pub cluster_size: Vec<Value<'a>>,
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    #[attr(dialect = "spirv.group_operation")]
    pub group_operation: Attribute<'a>,
    pub value_ty: Type<'a>,
    pub cluster_size_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GroupNonUniformBroadcastFirst", format = "$execution_scope $value attr-dict `:` type($value)", results(result))]
pub struct GroupNonUniformBroadcastFirstOp<'a> {
    #[slot(result)]
    pub value: Value<'a>,
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GroupNonUniformBroadcast", format = "$execution_scope $value `,` $id attr-dict `:` type($value) `,` type($id)", results(result))]
pub struct GroupNonUniformBroadcastOp<'a> {
    #[slot(result)]
    pub value: Value<'a>,
    #[slot(id_ty)]
    pub id: Value<'a>,
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    pub id_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GroupNonUniformElect", format = "$execution_scope attr-dict `:` type($result)", results(result))]
pub struct GroupNonUniformElectOp<'a> {
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    #[dtype(is = i1)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.GroupNonUniformFAdd", format = "$execution_scope $group_operation $value (`cluster_size``(` $cluster_size^ `)`)? attr-dict `:` type($value) (`,` type($cluster_size)^)? `->` qualified(type($result))", results(result))]
pub struct GroupNonUniformFAddOp<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[slot(cluster_size_ty)]
    pub cluster_size: Vec<Value<'a>>,
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    #[attr(dialect = "spirv.group_operation")]
    pub group_operation: Attribute<'a>,
    pub value_ty: Type<'a>,
    pub cluster_size_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GroupNonUniformFMax", format = "$execution_scope $group_operation $value (`cluster_size``(` $cluster_size^ `)`)? attr-dict `:` type($value) (`,` type($cluster_size)^)? `->` qualified(type($result))", results(result))]
pub struct GroupNonUniformFMaxOp<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[slot(cluster_size_ty)]
    pub cluster_size: Vec<Value<'a>>,
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    #[attr(dialect = "spirv.group_operation")]
    pub group_operation: Attribute<'a>,
    pub value_ty: Type<'a>,
    pub cluster_size_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GroupNonUniformFMin", format = "$execution_scope $group_operation $value (`cluster_size``(` $cluster_size^ `)`)? attr-dict `:` type($value) (`,` type($cluster_size)^)? `->` qualified(type($result))", results(result))]
pub struct GroupNonUniformFMinOp<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[slot(cluster_size_ty)]
    pub cluster_size: Vec<Value<'a>>,
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    #[attr(dialect = "spirv.group_operation")]
    pub group_operation: Attribute<'a>,
    pub value_ty: Type<'a>,
    pub cluster_size_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GroupNonUniformFMul", format = "$execution_scope $group_operation $value (`cluster_size``(` $cluster_size^ `)`)? attr-dict `:` type($value) (`,` type($cluster_size)^)? `->` qualified(type($result))", results(result))]
pub struct GroupNonUniformFMulOp<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[slot(cluster_size_ty)]
    pub cluster_size: Vec<Value<'a>>,
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    #[attr(dialect = "spirv.group_operation")]
    pub group_operation: Attribute<'a>,
    pub value_ty: Type<'a>,
    pub cluster_size_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GroupNonUniformIAdd", format = "$execution_scope $group_operation $value (`cluster_size``(` $cluster_size^ `)`)? attr-dict `:` type($value) (`,` type($cluster_size)^)? `->` qualified(type($result))", results(result))]
pub struct GroupNonUniformIAddOp<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[slot(cluster_size_ty)]
    pub cluster_size: Vec<Value<'a>>,
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    #[attr(dialect = "spirv.group_operation")]
    pub group_operation: Attribute<'a>,
    pub value_ty: Type<'a>,
    pub cluster_size_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GroupNonUniformIMul", format = "$execution_scope $group_operation $value (`cluster_size``(` $cluster_size^ `)`)? attr-dict `:` type($value) (`,` type($cluster_size)^)? `->` qualified(type($result))", results(result))]
pub struct GroupNonUniformIMulOp<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[slot(cluster_size_ty)]
    pub cluster_size: Vec<Value<'a>>,
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    #[attr(dialect = "spirv.group_operation")]
    pub group_operation: Attribute<'a>,
    pub value_ty: Type<'a>,
    pub cluster_size_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GroupNonUniformLogicalAnd", format = "$execution_scope $group_operation $value (`cluster_size``(` $cluster_size^ `)`)? attr-dict `:` type($value) (`,` type($cluster_size)^)? `->` qualified(type($result))", results(result))]
pub struct GroupNonUniformLogicalAndOp<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[slot(cluster_size_ty)]
    pub cluster_size: Vec<Value<'a>>,
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    #[attr(dialect = "spirv.group_operation")]
    pub group_operation: Attribute<'a>,
    pub value_ty: Type<'a>,
    pub cluster_size_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GroupNonUniformLogicalOr", format = "$execution_scope $group_operation $value (`cluster_size``(` $cluster_size^ `)`)? attr-dict `:` type($value) (`,` type($cluster_size)^)? `->` qualified(type($result))", results(result))]
pub struct GroupNonUniformLogicalOrOp<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[slot(cluster_size_ty)]
    pub cluster_size: Vec<Value<'a>>,
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    #[attr(dialect = "spirv.group_operation")]
    pub group_operation: Attribute<'a>,
    pub value_ty: Type<'a>,
    pub cluster_size_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GroupNonUniformLogicalXor", format = "$execution_scope $group_operation $value (`cluster_size``(` $cluster_size^ `)`)? attr-dict `:` type($value) (`,` type($cluster_size)^)? `->` qualified(type($result))", results(result))]
pub struct GroupNonUniformLogicalXorOp<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[slot(cluster_size_ty)]
    pub cluster_size: Vec<Value<'a>>,
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    #[attr(dialect = "spirv.group_operation")]
    pub group_operation: Attribute<'a>,
    pub value_ty: Type<'a>,
    pub cluster_size_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GroupNonUniformQuadSwap", format = "$execution_scope $direction $value attr-dict `:` type($value)", results(result))]
pub struct GroupNonUniformQuadSwapOp<'a> {
    #[slot(result)]
    pub value: Value<'a>,
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    #[attr(dialect = "spirv.quad_swap_direction")]
    pub direction: Attribute<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GroupNonUniformRotateKHR", format = "$execution_scope $value `,` $delta (`,` `cluster_size` `(` $cluster_size^ `)`)? attr-dict `:` type($value) `,` type($delta) (`,` type($cluster_size)^)? `->` qualified(type($result))", results(result))]
pub struct GroupNonUniformRotateKHROp<'a> {
    #[slot(result)]
    pub value: Value<'a>,
    #[slot(delta_ty)]
    pub delta: Value<'a>,
    #[slot(cluster_size_ty)]
    pub cluster_size: Vec<Value<'a>>,
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    pub delta_ty: Type<'a>,
    pub cluster_size_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GroupNonUniformSMax", format = "$execution_scope $group_operation $value (`cluster_size``(` $cluster_size^ `)`)? attr-dict `:` type($value) (`,` type($cluster_size)^)? `->` qualified(type($result))", results(result))]
pub struct GroupNonUniformSMaxOp<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[slot(cluster_size_ty)]
    pub cluster_size: Vec<Value<'a>>,
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    #[attr(dialect = "spirv.group_operation")]
    pub group_operation: Attribute<'a>,
    pub value_ty: Type<'a>,
    pub cluster_size_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GroupNonUniformSMin", format = "$execution_scope $group_operation $value (`cluster_size``(` $cluster_size^ `)`)? attr-dict `:` type($value) (`,` type($cluster_size)^)? `->` qualified(type($result))", results(result))]
pub struct GroupNonUniformSMinOp<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[slot(cluster_size_ty)]
    pub cluster_size: Vec<Value<'a>>,
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    #[attr(dialect = "spirv.group_operation")]
    pub group_operation: Attribute<'a>,
    pub value_ty: Type<'a>,
    pub cluster_size_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GroupNonUniformShuffleDown", format = "$execution_scope $value `,` $delta attr-dict `:` type($value) `,` type($delta)", results(result))]
pub struct GroupNonUniformShuffleDownOp<'a> {
    #[slot(result)]
    pub value: Value<'a>,
    #[slot(delta_ty)]
    pub delta: Value<'a>,
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    pub delta_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GroupNonUniformShuffle", format = "$execution_scope $value `,` $id attr-dict `:` type($value) `,` type($id)", results(result))]
pub struct GroupNonUniformShuffleOp<'a> {
    #[slot(result)]
    pub value: Value<'a>,
    #[slot(id_ty)]
    pub id: Value<'a>,
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    pub id_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GroupNonUniformShuffleUp", format = "$execution_scope $value `,` $delta attr-dict `:` type($value) `,` type($delta)", results(result))]
pub struct GroupNonUniformShuffleUpOp<'a> {
    #[slot(result)]
    pub value: Value<'a>,
    #[slot(delta_ty)]
    pub delta: Value<'a>,
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    pub delta_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GroupNonUniformShuffleXor", format = "$execution_scope $value `,` $mask attr-dict `:` type($value) `,` type($mask)", results(result))]
pub struct GroupNonUniformShuffleXorOp<'a> {
    #[slot(result)]
    pub value: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    pub mask_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GroupNonUniformUMax", format = "$execution_scope $group_operation $value (`cluster_size``(` $cluster_size^ `)`)? attr-dict `:` type($value) (`,` type($cluster_size)^)? `->` qualified(type($result))", results(result))]
pub struct GroupNonUniformUMaxOp<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[slot(cluster_size_ty)]
    pub cluster_size: Vec<Value<'a>>,
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    #[attr(dialect = "spirv.group_operation")]
    pub group_operation: Attribute<'a>,
    pub value_ty: Type<'a>,
    pub cluster_size_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GroupNonUniformUMin", format = "$execution_scope $group_operation $value (`cluster_size``(` $cluster_size^ `)`)? attr-dict `:` type($value) (`,` type($cluster_size)^)? `->` qualified(type($result))", results(result))]
pub struct GroupNonUniformUMinOp<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[slot(cluster_size_ty)]
    pub cluster_size: Vec<Value<'a>>,
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    #[attr(dialect = "spirv.group_operation")]
    pub group_operation: Attribute<'a>,
    pub value_ty: Type<'a>,
    pub cluster_size_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GroupSMax", format = "$execution_scope $group_operation $x attr-dict `:` type($x)", results(result))]
pub struct GroupSMaxOp<'a> {
    #[slot(result)]
    pub x: Value<'a>,
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    #[attr(dialect = "spirv.group_operation")]
    pub group_operation: Attribute<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GroupSMin", format = "$execution_scope $group_operation $x attr-dict `:` type($x)", results(result))]
pub struct GroupSMinOp<'a> {
    #[slot(result)]
    pub x: Value<'a>,
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    #[attr(dialect = "spirv.group_operation")]
    pub group_operation: Attribute<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GroupUMax", format = "$execution_scope $group_operation $x attr-dict `:` type($x)", results(result))]
pub struct GroupUMaxOp<'a> {
    #[slot(result)]
    pub x: Value<'a>,
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    #[attr(dialect = "spirv.group_operation")]
    pub group_operation: Attribute<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.GroupUMin", format = "$execution_scope $group_operation $x attr-dict `:` type($x)", results(result))]
pub struct GroupUMinOp<'a> {
    #[slot(result)]
    pub x: Value<'a>,
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    #[attr(dialect = "spirv.group_operation")]
    pub group_operation: Attribute<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.IAddCarry", results(result))]
pub struct IAddCarryOp<'a> {
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand2_ty)]
    pub operand2: Value<'a>,
    pub operand1_ty: Type<'a>,
    pub operand2_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.IAdd", format = "$operand1 `,` $operand2 attr-dict `:` type($result)", results(result))]
pub struct IAddOp<'a> {
    #[slot(result)]
    pub operand1: Value<'a>,
    #[slot(result)]
    pub operand2: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.IEqual", format = "$operand1 `,` $operand2 `:` type($operand1) attr-dict", results(result))]
pub struct IEqualOp<'a> {
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand1_ty)]
    pub operand2: Value<'a>,
    pub operand1_ty: Type<'a>,
    #[dtype(i1 = operand1_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.IMul", format = "$operand1 `,` $operand2 attr-dict `:` type($result)", results(result))]
pub struct IMulOp<'a> {
    #[slot(result)]
    pub operand1: Value<'a>,
    #[slot(result)]
    pub operand2: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.INTEL.ControlBarrierArrive", format = "$execution_scope $memory_scope $memory_semantics attr-dict")]
pub struct INTELControlBarrierArriveOp<'a> {
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    #[attr(dialect = "spirv.scope")]
    pub memory_scope: Attribute<'a>,
    #[attr(dialect = "spirv.memory_semantics")]
    pub memory_semantics: Attribute<'a>,
}

#[mlir::op("spirv.INTEL.ControlBarrierWait", format = "$execution_scope $memory_scope $memory_semantics attr-dict")]
pub struct INTELControlBarrierWaitOp<'a> {
    #[attr(dialect = "spirv.scope")]
    pub execution_scope: Attribute<'a>,
    #[attr(dialect = "spirv.scope")]
    pub memory_scope: Attribute<'a>,
    #[attr(dialect = "spirv.memory_semantics")]
    pub memory_semantics: Attribute<'a>,
}

#[mlir::op("spirv.INTEL.ConvertBF16ToF", format = "$operand attr-dict `:` type($operand) `to` type($result)", results(result))]
pub struct INTELConvertBF16ToFOp<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    pub operand_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.INTEL.ConvertFToBF16", format = "$operand attr-dict `:` type($operand) `to` type($result)", results(result))]
pub struct INTELConvertFToBF16Op<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    pub operand_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.INTEL.MaskedGather", format = "$ptr_vector `,` $alignment `,` $mask `,` $fill_empty attr-dict `:` type($ptr_vector) `,` type($alignment) `,` type($mask) `,` type($fill_empty) `->` type($result)", results(result))]
pub struct INTELMaskedGatherOp<'a> {
    #[slot(ptr_vector_ty)]
    pub ptr_vector: Value<'a>,
    #[slot(alignment_ty)]
    pub alignment: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(result)]
    pub fill_empty: Value<'a>,
    pub ptr_vector_ty: Type<'a>,
    #[dtype(is = i32)]
    pub alignment_ty: Type<'a>,
    #[dtype(i1 = result)]
    pub mask_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.INTEL.MaskedScatter", format = "$ptr_vector `,` $alignment `,` $mask `,` $input_vector attr-dict `:` type($ptr_vector) `,` type($alignment) `,` type($mask) `,` type($input_vector)")]
pub struct INTELMaskedScatterOp<'a> {
    #[slot(ptr_vector_ty)]
    pub ptr_vector: Value<'a>,
    #[slot(alignment_ty)]
    pub alignment: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(input_vector_ty)]
    pub input_vector: Value<'a>,
    pub ptr_vector_ty: Type<'a>,
    #[dtype(is = i32)]
    pub alignment_ty: Type<'a>,
    #[dtype(i1 = input_vector_ty)]
    pub mask_ty: Type<'a>,
    pub input_vector_ty: Type<'a>,
}

#[mlir::op("spirv.INTEL.RoundFToTF32", format = "$operand attr-dict `:` type($operand) `to` type($result)", results(result))]
pub struct INTELRoundFToTF32Op<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    pub operand_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.INTEL.SubgroupBlockRead", format = "$ptr attr-dict `:` type($ptr) `->` type($value)", results(value))]
pub struct INTELSubgroupBlockReadOp<'a> {
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    pub ptr_ty: Type<'a>,
    pub value: Type<'a>,
}

#[mlir::op("spirv.INTEL.SubgroupBlockWrite")]
pub struct INTELSubgroupBlockWriteOp<'a> {
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    #[slot(value_ty)]
    pub value: Value<'a>,
    pub ptr_ty: Type<'a>,
    pub value_ty: Type<'a>,
}

#[mlir::op("spirv.INotEqual", format = "$operand1 `,` $operand2 `:` type($operand1) attr-dict", results(result))]
pub struct INotEqualOp<'a> {
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand1_ty)]
    pub operand2: Value<'a>,
    pub operand1_ty: Type<'a>,
    #[dtype(i1 = operand1_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.ISubBorrow", results(result))]
pub struct ISubBorrowOp<'a> {
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand2_ty)]
    pub operand2: Value<'a>,
    pub operand1_ty: Type<'a>,
    pub operand2_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.ISub", format = "$operand1 `,` $operand2 attr-dict `:` type($result)", results(result))]
pub struct ISubOp<'a> {
    #[slot(result)]
    pub operand1: Value<'a>,
    #[slot(result)]
    pub operand2: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.ImageDrefGather", results(result))]
pub struct ImageDrefGatherOp<'a> {
    #[slot(sampled_image_ty)]
    pub sampled_image: Value<'a>,
    #[slot(coordinate_ty)]
    pub coordinate: Value<'a>,
    #[slot(dref_ty)]
    pub dref: Value<'a>,
    #[slot(operand_arguments_ty)]
    pub operand_arguments: Vec<Value<'a>>,
    #[attr(dialect = "spirv.image_operands")]
    pub image_operands: Option<Attribute<'a>>,
    pub sampled_image_ty: Type<'a>,
    pub coordinate_ty: Type<'a>,
    #[dtype(is = f32)]
    pub dref_ty: Type<'a>,
    pub operand_arguments_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.ImageFetch", results(result))]
pub struct ImageFetchOp<'a> {
    #[slot(image_ty)]
    pub image: Value<'a>,
    #[slot(coordinate_ty)]
    pub coordinate: Value<'a>,
    #[slot(operand_arguments_ty)]
    pub operand_arguments: Vec<Value<'a>>,
    #[attr(dialect = "spirv.image_operands")]
    pub image_operands: Option<Attribute<'a>>,
    pub image_ty: Type<'a>,
    pub coordinate_ty: Type<'a>,
    pub operand_arguments_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.Image", format = "$sampled_image attr-dict `:` type($sampled_image)", results(result))]
pub struct ImageOp<'a> {
    #[slot(sampled_image_ty)]
    pub sampled_image: Value<'a>,
    pub sampled_image_ty: Type<'a>,
    #[dtype(el = sampled_image_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.ImageQuerySize", format = "$image attr-dict `:` type($image) `->` type($result)", results(result))]
pub struct ImageQuerySizeOp<'a> {
    #[slot(image_ty)]
    pub image: Value<'a>,
    pub image_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.ImageRead", results(result))]
pub struct ImageReadOp<'a> {
    #[slot(image_ty)]
    pub image: Value<'a>,
    #[slot(coordinate_ty)]
    pub coordinate: Value<'a>,
    #[slot(operand_arguments_ty)]
    pub operand_arguments: Vec<Value<'a>>,
    #[attr(dialect = "spirv.image_operands")]
    pub image_operands: Option<Attribute<'a>>,
    pub image_ty: Type<'a>,
    pub coordinate_ty: Type<'a>,
    pub operand_arguments_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.ImageSampleExplicitLod", results(result))]
pub struct ImageSampleExplicitLodOp<'a> {
    #[slot(sampled_image_ty)]
    pub sampled_image: Value<'a>,
    #[slot(coordinate_ty)]
    pub coordinate: Value<'a>,
    #[slot(operand_arguments_ty)]
    pub operand_arguments: Vec<Value<'a>>,
    #[attr(dialect = "spirv.image_operands")]
    pub image_operands: Attribute<'a>,
    pub sampled_image_ty: Type<'a>,
    pub coordinate_ty: Type<'a>,
    pub operand_arguments_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.ImageSampleImplicitLod", results(result))]
pub struct ImageSampleImplicitLodOp<'a> {
    #[slot(sampled_image_ty)]
    pub sampled_image: Value<'a>,
    #[slot(coordinate_ty)]
    pub coordinate: Value<'a>,
    #[slot(operand_arguments_ty)]
    pub operand_arguments: Vec<Value<'a>>,
    #[attr(dialect = "spirv.image_operands")]
    pub image_operands: Option<Attribute<'a>>,
    pub sampled_image_ty: Type<'a>,
    pub coordinate_ty: Type<'a>,
    pub operand_arguments_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.ImageSampleProjDrefImplicitLod", results(result))]
pub struct ImageSampleProjDrefImplicitLodOp<'a> {
    #[slot(sampled_image_ty)]
    pub sampled_image: Value<'a>,
    #[slot(coordinate_ty)]
    pub coordinate: Value<'a>,
    #[slot(dref_ty)]
    pub dref: Value<'a>,
    #[slot(operand_arguments_ty)]
    pub operand_arguments: Vec<Value<'a>>,
    #[attr(dialect = "spirv.image_operands")]
    pub image_operands: Option<Attribute<'a>>,
    pub sampled_image_ty: Type<'a>,
    pub coordinate_ty: Type<'a>,
    #[dtype(is = f32)]
    pub dref_ty: Type<'a>,
    pub operand_arguments_ty: Vec<Type<'a>>,
    #[dtype(el = sampled_image_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.ImageWrite")]
pub struct ImageWriteOp<'a> {
    #[slot(image_ty)]
    pub image: Value<'a>,
    #[slot(coordinate_ty)]
    pub coordinate: Value<'a>,
    #[slot(texel_ty)]
    pub texel: Value<'a>,
    #[slot(operand_arguments_ty)]
    pub operand_arguments: Vec<Value<'a>>,
    #[attr(dialect = "spirv.image_operands")]
    pub image_operands: Option<Attribute<'a>>,
    pub image_ty: Type<'a>,
    pub coordinate_ty: Type<'a>,
    pub texel_ty: Type<'a>,
    pub operand_arguments_ty: Vec<Type<'a>>,
}

#[mlir::op("spirv.InBoundsPtrAccessChain", format = "$base_ptr `[` $element ($indices^)? `]` attr-dict `:` type($base_ptr) `,` type($element) (`,` type($indices)^)? `->` type($result)", results(result))]
pub struct InBoundsPtrAccessChainOp<'a> {
    #[slot(base_ptr_ty)]
    pub base_ptr: Value<'a>,
    #[slot(element_ty)]
    pub element: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    pub base_ptr_ty: Type<'a>,
    pub element_ty: Type<'a>,
    pub indices_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.IsFinite", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct IsFiniteOp<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    pub operand_ty: Type<'a>,
    #[dtype(i1 = operand_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.IsInf", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct IsInfOp<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    pub operand_ty: Type<'a>,
    #[dtype(i1 = operand_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.IsNan", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct IsNanOp<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    pub operand_ty: Type<'a>,
    #[dtype(i1 = operand_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.IsNormal", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct IsNormalOp<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    pub operand_ty: Type<'a>,
    #[dtype(i1 = operand_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.KHR.AssumeTrue", format = "$condition attr-dict")]
pub struct KHRAssumeTrueOp<'a> {
    #[slot(condition_ty)]
    pub condition: Value<'a>,
    #[dtype(is = i1)]
    pub condition_ty: Type<'a>,
}

#[mlir::op("spirv.KHR.CooperativeMatrixLength", format = "attr-dict `:` $cooperative_matrix_type", results(result))]
pub struct KHRCooperativeMatrixLengthOp<'a> {
    pub cooperative_matrix_type: Attribute<'a>,
    #[dtype(is = i32)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.KHR.CooperativeMatrixLoad", format = "$pointer `,` $stride `,` $matrix_layout ( `,` $memory_operand^ )? ( `,` $alignment^ )? attr-dict `:` qualified(type($pointer)) `,` qualified(type($stride)) `->` type($result)", results(result))]
pub struct KHRCooperativeMatrixLoadOp<'a> {
    #[slot(pointer_ty)]
    pub pointer: Value<'a>,
    #[slot(stride_ty)]
    pub stride: Value<'a>,
    #[attr(dialect = "spirv.coop_matrix_layout_khr")]
    pub matrix_layout: Attribute<'a>,
    #[attr(dialect = "spirv.memory_access")]
    pub memory_operand: Option<Attribute<'a>>,
    #[attr(int = "i32")]
    pub alignment: Option<Attribute<'a>>,
    pub pointer_ty: Type<'a>,
    pub stride_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.KHR.CooperativeMatrixMulAdd", format = "$a `,` $b `,` $c ( `,` $matrix_operands^ )? attr-dict `:` type($a) `,` type($b) `->` type($c)", results(result))]
pub struct KHRCooperativeMatrixMulAddOp<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(result)]
    pub c: Value<'a>,
    #[attr(dialect = "spirv.cooperative_matrix_operands_khr")]
    pub matrix_operands: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.KHR.CooperativeMatrixStore", format = "$pointer `,` $object `,` $stride `,` $matrix_layout ( `,` $memory_operand^ )? ( `,` $alignment^ )? attr-dict `:` qualified(type($pointer)) `,` qualified(type($object)) `,` qualified(type($stride))")]
pub struct KHRCooperativeMatrixStoreOp<'a> {
    #[slot(pointer_ty)]
    pub pointer: Value<'a>,
    #[slot(object_ty)]
    pub object: Value<'a>,
    #[slot(stride_ty)]
    pub stride: Value<'a>,
    #[attr(dialect = "spirv.coop_matrix_layout_khr")]
    pub matrix_layout: Attribute<'a>,
    #[attr(dialect = "spirv.memory_access")]
    pub memory_operand: Option<Attribute<'a>>,
    #[attr(int = "i32")]
    pub alignment: Option<Attribute<'a>>,
    pub pointer_ty: Type<'a>,
    pub object_ty: Type<'a>,
    pub stride_ty: Type<'a>,
}

#[mlir::op("spirv.KHR.Expect", format = "$value `,` $expectedValue attr-dict `:` type($result)", results(result))]
pub struct KHRExpectOp<'a> {
    #[slot(result)]
    pub value: Value<'a>,
    #[slot(result, name = "expectedValue")]
    pub expected_value: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.KHR.SubgroupBallot", format = "$predicate attr-dict `:` type($result)", results(result))]
pub struct KHRSubgroupBallotOp<'a> {
    #[slot(predicate_ty)]
    pub predicate: Value<'a>,
    #[dtype(is = i1)]
    pub predicate_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.Kill", format = "attr-dict")]
pub struct KillOp<'a> {
}

#[mlir::op("spirv.Load", results(value))]
pub struct LoadOp<'a> {
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    #[attr(dialect = "spirv.memory_access")]
    pub memory_access: Option<Attribute<'a>>,
    #[attr(int = "i32")]
    pub alignment: Option<Attribute<'a>>,
    pub ptr_ty: Type<'a>,
    pub value: Type<'a>,
}

#[mlir::op("spirv.LogicalAnd", format = "$operand1 `,` $operand2 `:` type($operand1) attr-dict", results(result))]
pub struct LogicalAndOp<'a> {
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand1_ty)]
    pub operand2: Value<'a>,
    pub operand1_ty: Type<'a>,
    #[dtype(i1 = operand1_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.LogicalEqual", format = "$operand1 `,` $operand2 `:` type($operand1) attr-dict", results(result))]
pub struct LogicalEqualOp<'a> {
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand1_ty)]
    pub operand2: Value<'a>,
    pub operand1_ty: Type<'a>,
    #[dtype(i1 = operand1_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.LogicalNotEqual", format = "$operand1 `,` $operand2 `:` type($operand1) attr-dict", results(result))]
pub struct LogicalNotEqualOp<'a> {
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand1_ty)]
    pub operand2: Value<'a>,
    pub operand1_ty: Type<'a>,
    #[dtype(i1 = operand1_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.LogicalNot", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct LogicalNotOp<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    pub operand_ty: Type<'a>,
    #[dtype(i1 = operand_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.LogicalOr", format = "$operand1 `,` $operand2 `:` type($operand1) attr-dict", results(result))]
pub struct LogicalOrOp<'a> {
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand1_ty)]
    pub operand2: Value<'a>,
    pub operand1_ty: Type<'a>,
    #[dtype(i1 = operand1_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.mlir.loop", results(results))]
pub struct LoopOp<'a> {
    #[attr(dialect = "spirv.loop_control")]
    pub loop_control: Attribute<'a>,
    pub body: Region<'a>,
    pub results: Vec<Type<'a>>,
}

#[mlir::op("spirv.MatrixTimesMatrix", format = "$leftmatrix `,` $rightmatrix attr-dict `:` type($leftmatrix) `,` type($rightmatrix) `->` type($result)", results(result))]
pub struct MatrixTimesMatrixOp<'a> {
    #[slot(leftmatrix_ty)]
    pub leftmatrix: Value<'a>,
    #[slot(rightmatrix_ty)]
    pub rightmatrix: Value<'a>,
    pub leftmatrix_ty: Type<'a>,
    pub rightmatrix_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.MatrixTimesScalar", format = "$matrix `,` $scalar attr-dict `:` type($matrix) `,` type($scalar)", results(result))]
pub struct MatrixTimesScalarOp<'a> {
    #[slot(result)]
    pub matrix: Value<'a>,
    #[slot(scalar_ty)]
    pub scalar: Value<'a>,
    pub scalar_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.MatrixTimesVector", format = "$matrix `,` $vector attr-dict `:` type($matrix) `,` type($vector) `->` type($result)", results(result))]
pub struct MatrixTimesVectorOp<'a> {
    #[slot(matrix_ty)]
    pub matrix: Value<'a>,
    #[slot(vector_ty)]
    pub vector: Value<'a>,
    pub matrix_ty: Type<'a>,
    pub vector_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.MemoryBarrier", format = "$memory_scope `,` $memory_semantics attr-dict")]
pub struct MemoryBarrierOp<'a> {
    #[attr(dialect = "spirv.scope")]
    pub memory_scope: Attribute<'a>,
    #[attr(dialect = "spirv.memory_semantics")]
    pub memory_semantics: Attribute<'a>,
}

#[mlir::op("spirv.MemoryNamedBarrier", format = "$named_barrier `,` $memory_scope `,` $memory_semantics attr-dict `:` type($named_barrier)")]
pub struct MemoryNamedBarrierOp<'a> {
    #[slot(named_barrier_ty)]
    pub named_barrier: Value<'a>,
    #[attr(dialect = "spirv.scope")]
    pub memory_scope: Attribute<'a>,
    #[attr(dialect = "spirv.memory_semantics")]
    pub memory_semantics: Attribute<'a>,
    pub named_barrier_ty: Type<'a>,
}

#[mlir::op("spirv.mlir.merge", format = "attr-dict ($operands^ `:` type($operands))?")]
pub struct MergeOp<'a> {
    #[slot(operands_ty)]
    pub operands: Vec<Value<'a>>,
    pub operands_ty: Vec<Type<'a>>,
}

#[mlir::op("spirv.module")]
pub struct ModuleOp<'a> {
    #[attr(dialect = "spirv.addressing_model")]
    pub addressing_model: Attribute<'a>,
    #[attr(dialect = "spirv.memory_model")]
    pub memory_model: Attribute<'a>,
    pub vce_triple: Option<Attribute<'a>>,
    pub sym_name: Option<Attribute<'a>>,
    pub region: Region<'a>,
}

#[mlir::op("spirv.NamedBarrierInitialize", format = "$subgroup_count attr-dict `:` type($subgroup_count) `->` type($result)", results(result))]
pub struct NamedBarrierInitializeOp<'a> {
    #[slot(subgroup_count_ty)]
    pub subgroup_count: Value<'a>,
    #[dtype(is = i32)]
    pub subgroup_count_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.Not", format = "$operand `:` type($operand) attr-dict", results(result))]
pub struct NotOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.Ordered", format = "$operand1 `,` $operand2 `:` type($operand1) attr-dict", results(result))]
pub struct OrderedOp<'a> {
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand1_ty)]
    pub operand2: Value<'a>,
    pub operand1_ty: Type<'a>,
    #[dtype(i1 = operand1_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.OuterProduct", format = "$vector1 `,` $vector2 attr-dict `:` type($vector1) `,` type($vector2) `->` type($result)", results(result))]
pub struct OuterProductOp<'a> {
    #[slot(vector1_ty)]
    pub vector1: Value<'a>,
    #[slot(vector2_ty)]
    pub vector2: Value<'a>,
    pub vector1_ty: Type<'a>,
    pub vector2_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.PtrAccessChain", format = "$base_ptr `[` $element ($indices^)? `]` attr-dict `:` type($base_ptr) `,` type($element) (`,` type($indices)^)? `->` type($result)", results(result))]
pub struct PtrAccessChainOp<'a> {
    #[slot(base_ptr_ty)]
    pub base_ptr: Value<'a>,
    #[slot(element_ty)]
    pub element: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    pub base_ptr_ty: Type<'a>,
    pub element_ty: Type<'a>,
    pub indices_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.PtrCastToGeneric", format = "$pointer attr-dict `:` type($pointer) `to` type($result)", results(result))]
pub struct PtrCastToGenericOp<'a> {
    #[slot(pointer_ty)]
    pub pointer: Value<'a>,
    pub pointer_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.mlir.referenceof", format = "$spec_const attr-dict `:` type($reference)", results(reference))]
pub struct ReferenceOfOp<'a> {
    pub spec_const: Attribute<'a>,
    pub reference: Type<'a>,
}

#[mlir::op("spirv.Return", format = "attr-dict")]
pub struct ReturnOp<'a> {
}

#[mlir::op("spirv.ReturnValue", format = "$value attr-dict `:` type($value)")]
pub struct ReturnValueOp<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    pub value_ty: Type<'a>,
}

#[mlir::op("spirv.SConvert", format = "$operand attr-dict `:` type($operand) `to` type($result)", results(result))]
pub struct SConvertOp<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    pub operand_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.SDiv", format = "$operand1 `,` $operand2 attr-dict `:` type($result)", results(result))]
pub struct SDivOp<'a> {
    #[slot(result)]
    pub operand1: Value<'a>,
    #[slot(result)]
    pub operand2: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.SDotAccSat", format = "$vector1 `,` $vector2 `,` $accumulator ( `,` $format^ )? attr-dict `:` type($vector1) `->` type($result)", results(result))]
pub struct SDotAccSatOp<'a> {
    #[slot(vector1_ty)]
    pub vector1: Value<'a>,
    #[slot(vector1_ty)]
    pub vector2: Value<'a>,
    #[slot(result)]
    pub accumulator: Value<'a>,
    #[attr(dialect = "spirv.packed_vector_format")]
    pub format: Option<Attribute<'a>>,
    pub vector1_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.SDot", format = "$vector1 `,` $vector2 ( `,` $format^ )? attr-dict `:` type($vector1) `->` type($result)", results(result))]
pub struct SDotOp<'a> {
    #[slot(vector1_ty)]
    pub vector1: Value<'a>,
    #[slot(vector1_ty)]
    pub vector2: Value<'a>,
    #[attr(dialect = "spirv.packed_vector_format")]
    pub format: Option<Attribute<'a>>,
    pub vector1_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.SGreaterThanEqual", format = "$operand1 `,` $operand2 `:` type($operand1) attr-dict", results(result))]
pub struct SGreaterThanEqualOp<'a> {
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand1_ty)]
    pub operand2: Value<'a>,
    pub operand1_ty: Type<'a>,
    #[dtype(i1 = operand1_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.SGreaterThan", format = "$operand1 `,` $operand2 `:` type($operand1) attr-dict", results(result))]
pub struct SGreaterThanOp<'a> {
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand1_ty)]
    pub operand2: Value<'a>,
    pub operand1_ty: Type<'a>,
    #[dtype(i1 = operand1_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.SLessThanEqual", format = "$operand1 `,` $operand2 `:` type($operand1) attr-dict", results(result))]
pub struct SLessThanEqualOp<'a> {
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand1_ty)]
    pub operand2: Value<'a>,
    pub operand1_ty: Type<'a>,
    #[dtype(i1 = operand1_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.SLessThan", format = "$operand1 `,` $operand2 `:` type($operand1) attr-dict", results(result))]
pub struct SLessThanOp<'a> {
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand1_ty)]
    pub operand2: Value<'a>,
    pub operand1_ty: Type<'a>,
    #[dtype(i1 = operand1_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.SMod", format = "$operand1 `,` $operand2 attr-dict `:` type($result)", results(result))]
pub struct SModOp<'a> {
    #[slot(result)]
    pub operand1: Value<'a>,
    #[slot(result)]
    pub operand2: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.SMulExtended", results(result))]
pub struct SMulExtendedOp<'a> {
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand2_ty)]
    pub operand2: Value<'a>,
    pub operand1_ty: Type<'a>,
    pub operand2_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.SNegate", format = "$operand attr-dict `:` type($result)", results(result))]
pub struct SNegateOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.SRem", format = "$operand1 `,` $operand2 attr-dict `:` type($result)", results(result))]
pub struct SRemOp<'a> {
    #[slot(result)]
    pub operand1: Value<'a>,
    #[slot(result)]
    pub operand2: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.SUDotAccSat", format = "$vector1 `,` $vector2 `,` $accumulator ( `,` $format^ )? attr-dict `:` type($vector1) `->` type($result)", results(result))]
pub struct SUDotAccSatOp<'a> {
    #[slot(vector1_ty)]
    pub vector1: Value<'a>,
    #[slot(vector1_ty)]
    pub vector2: Value<'a>,
    #[slot(result)]
    pub accumulator: Value<'a>,
    #[attr(dialect = "spirv.packed_vector_format")]
    pub format: Option<Attribute<'a>>,
    pub vector1_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.SUDot", format = "$vector1 `,` $vector2 ( `,` $format^ )? attr-dict `:` type($vector1) `->` type($result)", results(result))]
pub struct SUDotOp<'a> {
    #[slot(vector1_ty)]
    pub vector1: Value<'a>,
    #[slot(vector1_ty)]
    pub vector2: Value<'a>,
    #[attr(dialect = "spirv.packed_vector_format")]
    pub format: Option<Attribute<'a>>,
    pub vector1_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.SampledImage", format = "$image `,` $sampler attr-dict `:` type($image) `,` type($sampler) `->` type($result)", results(result))]
pub struct SampledImageOp<'a> {
    #[slot(image_ty)]
    pub image: Value<'a>,
    #[slot(sampler_ty)]
    pub sampler: Value<'a>,
    #[dtype(el = result)]
    pub image_ty: Type<'a>,
    pub sampler_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.Select", format = "$condition `,` $true_value `,` $false_value attr-dict `:` type($condition) `,` type($result)", results(result))]
pub struct SelectOp<'a> {
    #[slot(condition_ty)]
    pub condition: Value<'a>,
    #[slot(result)]
    pub true_value: Value<'a>,
    #[slot(result)]
    pub false_value: Value<'a>,
    pub condition_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.mlir.selection", results(results))]
pub struct SelectionOp<'a> {
    #[attr(dialect = "spirv.selection_control")]
    pub selection_control: Attribute<'a>,
    pub body: Region<'a>,
    pub results: Vec<Type<'a>>,
}

#[mlir::op("spirv.ShiftLeftLogical", format = "$operand1 `,` $operand2 attr-dict `:` type($operand1) `,` type($operand2)", results(result))]
pub struct ShiftLeftLogicalOp<'a> {
    #[slot(result)]
    pub operand1: Value<'a>,
    #[slot(operand2_ty)]
    pub operand2: Value<'a>,
    pub operand2_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.ShiftRightArithmetic", format = "$operand1 `,` $operand2 attr-dict `:` type($operand1) `,` type($operand2)", results(result))]
pub struct ShiftRightArithmeticOp<'a> {
    #[slot(result)]
    pub operand1: Value<'a>,
    #[slot(operand2_ty)]
    pub operand2: Value<'a>,
    pub operand2_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.ShiftRightLogical", format = "$operand1 `,` $operand2 attr-dict `:` type($operand1) `,` type($operand2)", results(result))]
pub struct ShiftRightLogicalOp<'a> {
    #[slot(result)]
    pub operand1: Value<'a>,
    #[slot(operand2_ty)]
    pub operand2: Value<'a>,
    pub operand2_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.SpecConstantComposite")]
pub struct SpecConstantCompositeOp<'a> {
    #[attr(name = "type")]
    pub type_: Attribute<'a>,
    pub sym_name: Attribute<'a>,
    pub constituents: Attribute<'a>,
}

#[mlir::op("spirv.SpecConstant")]
pub struct SpecConstantOp<'a> {
    pub sym_name: Attribute<'a>,
    pub default_value: Attribute<'a>,
}

#[mlir::op("spirv.SpecConstantOperation", results(result))]
pub struct SpecConstantOperationOp<'a> {
    pub body: Region<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.Store")]
pub struct StoreOp<'a> {
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[attr(dialect = "spirv.memory_access")]
    pub memory_access: Option<Attribute<'a>>,
    #[attr(int = "i32")]
    pub alignment: Option<Attribute<'a>>,
    pub ptr_ty: Type<'a>,
    pub value_ty: Type<'a>,
}

#[mlir::op("spirv.Switch")]
pub struct SwitchOp<'a> {
    #[slot(selector_ty)]
    pub selector: Value<'a>,
    #[slot(default_operands_ty, name = "defaultOperands")]
    pub default_operands: Vec<Value<'a>>,
    #[slot(target_operands_ty, name = "targetOperands")]
    pub target_operands: Vec<Value<'a>>,
    pub literals: Option<Attribute<'a>>,
    #[attr(dense = "i32")]
    pub case_operand_segments: Attribute<'a>,
    #[successor(name = "defaultTarget")]
    pub default_target: Str<'a>,
    #[successor]
    pub targets: Vec<Str<'a>>,
    pub selector_ty: Type<'a>,
    pub default_operands_ty: Vec<Type<'a>>,
    pub target_operands_ty: Vec<Type<'a>>,
}

#[mlir::op("spirv.Tosa.Abs", format = "$input1 attr-dict `:` qualified(type($input1)) `->` qualified(type($output))", results(output))]
pub struct TosaAbsOp<'a> {
    #[slot(output)]
    pub input1: Value<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.Add", format = "$input1 `,` $input2 attr-dict `:` qualified(type($input1)) `,` qualified(type($input2)) `->` qualified(type($output))", results(output))]
pub struct TosaAddOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    pub input1_ty: Type<'a>,
    pub input2_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.ArgMax", format = "`axis` `=` $axis `,` `nan_mode` `=` $nan_mode `,` $input attr-dict `:` qualified(type($input)) `->` qualified(type($output))", results(output))]
pub struct TosaArgMaxOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    #[attr(int = "i32")]
    pub axis: Attribute<'a>,
    #[attr(dialect = "spirv.tosa_ext_nan_propagation_mode_type")]
    pub nan_mode: Attribute<'a>,
    pub input_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.ArithmeticRightShift", format = "`round` `=` $round `,` $input1 `,` $input2 attr-dict `:` qualified(type($input1)) `,` qualified(type($input2)) `->` qualified(type($output))", results(output))]
pub struct TosaArithmeticRightShiftOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    pub round: Attribute<'a>,
    pub input1_ty: Type<'a>,
    pub input2_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.AvgPool2D", results(output))]
pub struct TosaAvgPool2DOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    #[slot(input_zp_ty)]
    pub input_zp: Value<'a>,
    #[slot(output_zp_ty)]
    pub output_zp: Value<'a>,
    pub kernel: Attribute<'a>,
    pub stride: Attribute<'a>,
    pub pad: Attribute<'a>,
    #[attr(dialect = "spirv.tosa_ext_acc_type")]
    pub acc_type: Attribute<'a>,
    pub input_ty: Type<'a>,
    pub input_zp_ty: Type<'a>,
    pub output_zp_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.BitwiseAnd", format = "$input1 `,` $input2 attr-dict `:` qualified(type($input1)) `,` qualified(type($input2)) `->` qualified(type($output))", results(output))]
pub struct TosaBitwiseAndOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    pub input1_ty: Type<'a>,
    pub input2_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.BitwiseNot", format = "$input1 attr-dict `:` qualified(type($input1)) `->` qualified(type($output))", results(output))]
pub struct TosaBitwiseNotOp<'a> {
    #[slot(output)]
    pub input1: Value<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.BitwiseOr", format = "$input1 `,` $input2 attr-dict `:` qualified(type($input1)) `,` qualified(type($input2)) `->` qualified(type($output))", results(output))]
pub struct TosaBitwiseOrOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    pub input1_ty: Type<'a>,
    pub input2_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.BitwiseXor", format = "$input1 `,` $input2 attr-dict `:` qualified(type($input1)) `,` qualified(type($input2)) `->` qualified(type($output))", results(output))]
pub struct TosaBitwiseXorOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    pub input1_ty: Type<'a>,
    pub input2_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.Cast", format = "$input attr-dict `:` qualified(type($input)) `->` qualified(type($output))", results(output))]
pub struct TosaCastOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    pub input_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.Ceil", format = "$input1 attr-dict `:` qualified(type($input1)) `->` qualified(type($output))", results(output))]
pub struct TosaCeilOp<'a> {
    #[slot(output)]
    pub input1: Value<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.Clamp", format = "`min_val` `=` $min_val `,` `max_val` `=` $max_val `,` `nan_mode` `=` $nan_mode `,` $input attr-dict `:` qualified(type($input)) `->` qualified(type($output))", results(output))]
pub struct TosaClampOp<'a> {
    #[slot(output)]
    pub input: Value<'a>,
    pub min_val: Attribute<'a>,
    pub max_val: Attribute<'a>,
    #[attr(dialect = "spirv.tosa_ext_nan_propagation_mode_type")]
    pub nan_mode: Attribute<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.Clz", format = "$input1 attr-dict `:` qualified(type($input1)) `->` qualified(type($output))", results(output))]
pub struct TosaClzOp<'a> {
    #[slot(output)]
    pub input1: Value<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.Concat", format = "`axis` `=` $axis `,` $input1 attr-dict `:` qualified(type($input1)) `->` qualified(type($output))", results(output))]
pub struct TosaConcatOp<'a> {
    #[slot(input1_ty)]
    pub input1: Vec<Value<'a>>,
    #[attr(int = "i32")]
    pub axis: Attribute<'a>,
    pub input1_ty: Vec<Type<'a>>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.Conv2D", results(output))]
pub struct TosaConv2DOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    #[slot(weight_ty)]
    pub weight: Value<'a>,
    #[slot(bias_ty)]
    pub bias: Value<'a>,
    #[slot(input_zp_ty)]
    pub input_zp: Value<'a>,
    #[slot(weight_zp_ty)]
    pub weight_zp: Value<'a>,
    pub pad: Attribute<'a>,
    pub stride: Attribute<'a>,
    pub dilation: Attribute<'a>,
    #[attr(dialect = "spirv.tosa_ext_acc_type")]
    pub acc_type: Attribute<'a>,
    pub local_bound: Attribute<'a>,
    pub input_ty: Type<'a>,
    pub weight_ty: Type<'a>,
    pub bias_ty: Type<'a>,
    pub input_zp_ty: Type<'a>,
    pub weight_zp_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.Conv3D", results(output))]
pub struct TosaConv3DOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    #[slot(weight_ty)]
    pub weight: Value<'a>,
    #[slot(bias_ty)]
    pub bias: Value<'a>,
    #[slot(input_zp_ty)]
    pub input_zp: Value<'a>,
    #[slot(weight_zp_ty)]
    pub weight_zp: Value<'a>,
    pub pad: Attribute<'a>,
    pub stride: Attribute<'a>,
    pub dilation: Attribute<'a>,
    #[attr(dialect = "spirv.tosa_ext_acc_type")]
    pub acc_type: Attribute<'a>,
    pub local_bound: Attribute<'a>,
    pub input_ty: Type<'a>,
    pub weight_ty: Type<'a>,
    pub bias_ty: Type<'a>,
    pub input_zp_ty: Type<'a>,
    pub weight_zp_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.Cos", format = "$input1 attr-dict `:` qualified(type($input1)) `->` qualified(type($output))", results(output))]
pub struct TosaCosOp<'a> {
    #[slot(output)]
    pub input1: Value<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.DepthwiseConv2D", results(output))]
pub struct TosaDepthwiseConv2DOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    #[slot(weight_ty)]
    pub weight: Value<'a>,
    #[slot(bias_ty)]
    pub bias: Value<'a>,
    #[slot(input_zp_ty)]
    pub input_zp: Value<'a>,
    #[slot(weight_zp_ty)]
    pub weight_zp: Value<'a>,
    pub pad: Attribute<'a>,
    pub stride: Attribute<'a>,
    pub dilation: Attribute<'a>,
    #[attr(dialect = "spirv.tosa_ext_acc_type")]
    pub acc_type: Attribute<'a>,
    pub local_bound: Attribute<'a>,
    pub input_ty: Type<'a>,
    pub weight_ty: Type<'a>,
    pub bias_ty: Type<'a>,
    pub input_zp_ty: Type<'a>,
    pub weight_zp_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.Equal", format = "$input1 `,` $input2 attr-dict `:` qualified(type($input1)) `,` qualified(type($input2)) `->` qualified(type($output))", results(output))]
pub struct TosaEqualOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    pub input1_ty: Type<'a>,
    pub input2_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.Erf", format = "$input attr-dict `:` qualified(type($input)) `->` qualified(type($output))", results(output))]
pub struct TosaErfOp<'a> {
    #[slot(output)]
    pub input: Value<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.Exp", format = "$input1 attr-dict `:` qualified(type($input1)) `->` qualified(type($output))", results(output))]
pub struct TosaExpOp<'a> {
    #[slot(output)]
    pub input1: Value<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.FFT2D", format = "`inverse` `=` $inverse `,` `local_bound` `=` $local_bound `,` $input_real `,` $input_imag attr-dict `:` qualified(type($input_real)) `,` qualified(type($input_imag)) `->` qualified(type($output))", results(output))]
pub struct TosaFFT2DOp<'a> {
    #[slot(input_real_ty)]
    pub input_real: Value<'a>,
    #[slot(input_imag_ty)]
    pub input_imag: Value<'a>,
    pub inverse: Attribute<'a>,
    pub local_bound: Attribute<'a>,
    pub input_real_ty: Type<'a>,
    pub input_imag_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.Floor", format = "$input1 attr-dict `:` qualified(type($input1)) `->` qualified(type($output))", results(output))]
pub struct TosaFloorOp<'a> {
    #[slot(output)]
    pub input1: Value<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.Gather", format = "$values `,` $indices attr-dict `:` qualified(type($values)) `,` qualified(type($indices)) `->` qualified(type($output))", results(output))]
pub struct TosaGatherOp<'a> {
    #[slot(values_ty)]
    pub values: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Value<'a>,
    pub values_ty: Type<'a>,
    pub indices_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.GreaterEqual", format = "$input1 `,` $input2 attr-dict `:` qualified(type($input1)) `,` qualified(type($input2)) `->` qualified(type($output))", results(output))]
pub struct TosaGreaterEqualOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    pub input1_ty: Type<'a>,
    pub input2_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.Greater", format = "$input1 `,` $input2 attr-dict `:` qualified(type($input1)) `,` qualified(type($input2)) `->` qualified(type($output))", results(output))]
pub struct TosaGreaterOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    pub input1_ty: Type<'a>,
    pub input2_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.IntDiv", format = "$input1 `,` $input2 attr-dict `:` qualified(type($input1)) `,` qualified(type($input2)) `->` qualified(type($output))", results(output))]
pub struct TosaIntDivOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    pub input1_ty: Type<'a>,
    pub input2_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.Log", format = "$input1 attr-dict `:` qualified(type($input1)) `->` qualified(type($output))", results(output))]
pub struct TosaLogOp<'a> {
    #[slot(output)]
    pub input1: Value<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.LogicalAnd", format = "$input1 `,` $input2 attr-dict `:` qualified(type($input1)) `,` qualified(type($input2)) `->` qualified(type($output))", results(output))]
pub struct TosaLogicalAndOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    pub input1_ty: Type<'a>,
    pub input2_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.LogicalLeftShift", format = "$input1 `,` $input2 attr-dict `:` qualified(type($input1)) `,` qualified(type($input2)) `->` qualified(type($output))", results(output))]
pub struct TosaLogicalLeftShiftOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    pub input1_ty: Type<'a>,
    pub input2_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.LogicalNot", format = "$input1 attr-dict `:` qualified(type($input1)) `->` qualified(type($output))", results(output))]
pub struct TosaLogicalNotOp<'a> {
    #[slot(output)]
    pub input1: Value<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.LogicalOr", format = "$input1 `,` $input2 attr-dict `:` qualified(type($input1)) `,` qualified(type($input2)) `->` qualified(type($output))", results(output))]
pub struct TosaLogicalOrOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    pub input1_ty: Type<'a>,
    pub input2_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.LogicalRightShift", format = "$input1 `,` $input2 attr-dict `:` qualified(type($input1)) `,` qualified(type($input2)) `->` qualified(type($output))", results(output))]
pub struct TosaLogicalRightShiftOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    pub input1_ty: Type<'a>,
    pub input2_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.LogicalXor", format = "$input1 `,` $input2 attr-dict `:` qualified(type($input1)) `,` qualified(type($input2)) `->` qualified(type($output))", results(output))]
pub struct TosaLogicalXorOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    pub input1_ty: Type<'a>,
    pub input2_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.MatMul", format = "$A `,` $B `,` $A_zp `,` $B_zp attr-dict `:` qualified(type($A)) `,` qualified(type($B)) `,` qualified(type($A_zp)) `,` qualified(type($B_zp)) `->` qualified(type($output))", results(output))]
pub struct TosaMatMulOp<'a> {
    #[slot(a_ty, name = "A")]
    pub a: Value<'a>,
    #[slot(b_ty, name = "B")]
    pub b: Value<'a>,
    #[slot(a_zp_ty, name = "A_zp")]
    pub a_zp: Value<'a>,
    #[slot(b_zp_ty, name = "B_zp")]
    pub b_zp: Value<'a>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub a_zp_ty: Type<'a>,
    pub b_zp_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.MaxPool2D", results(output))]
pub struct TosaMaxPool2DOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    pub kernel: Attribute<'a>,
    pub stride: Attribute<'a>,
    pub pad: Attribute<'a>,
    #[attr(dialect = "spirv.tosa_ext_nan_propagation_mode_type")]
    pub nan_mode: Attribute<'a>,
    pub input_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.Maximum", format = "`nan_mode` `=` $nan_mode `,` $input1 `,` $input2 attr-dict `:` qualified(type($input1)) `,` qualified(type($input2)) `->` qualified(type($output))", results(output))]
pub struct TosaMaximumOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    #[attr(dialect = "spirv.tosa_ext_nan_propagation_mode_type")]
    pub nan_mode: Attribute<'a>,
    pub input1_ty: Type<'a>,
    pub input2_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.Minimum", format = "`nan_mode` `=` $nan_mode `,` $input1 `,` $input2 attr-dict `:` qualified(type($input1)) `,` qualified(type($input2)) `->` qualified(type($output))", results(output))]
pub struct TosaMinimumOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    #[attr(dialect = "spirv.tosa_ext_nan_propagation_mode_type")]
    pub nan_mode: Attribute<'a>,
    pub input1_ty: Type<'a>,
    pub input2_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.Mul", format = "$input1 `,` $input2 `,` $shift attr-dict `:` qualified(type($input1)) `,` qualified(type($input2)) `,` qualified(type($shift)) `->` qualified(type($output))", results(output))]
pub struct TosaMulOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    #[slot(shift_ty)]
    pub shift: Value<'a>,
    pub input1_ty: Type<'a>,
    pub input2_ty: Type<'a>,
    pub shift_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.Negate", format = "$input1 `,` $input1_zp `,` $output_zp attr-dict `:` qualified(type($input1)) `,` qualified(type($input1_zp)) `,` qualified(type($output_zp)) `->` qualified(type($output))", results(output))]
pub struct TosaNegateOp<'a> {
    #[slot(output)]
    pub input1: Value<'a>,
    #[slot(input1_zp_ty)]
    pub input1_zp: Value<'a>,
    #[slot(output_zp_ty)]
    pub output_zp: Value<'a>,
    pub input1_zp_ty: Type<'a>,
    pub output_zp_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.Pad", format = "$input1 `,` $padding `,` $pad_const attr-dict `:` qualified(type($input1)) `,` qualified(type($padding)) `,` qualified(type($pad_const)) `->` qualified(type($output))", results(output))]
pub struct TosaPadOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(padding_ty)]
    pub padding: Value<'a>,
    #[slot(pad_const_ty)]
    pub pad_const: Value<'a>,
    pub input1_ty: Type<'a>,
    pub padding_ty: Type<'a>,
    pub pad_const_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.Pow", format = "$input1 `,` $input2 attr-dict `:` qualified(type($input1)) `,` qualified(type($input2)) `->` qualified(type($output))", results(output))]
pub struct TosaPowOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    pub input1_ty: Type<'a>,
    pub input2_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.RFFT2D", format = "`local_bound` `=` $local_bound `,` $input_real attr-dict `:` qualified(type($input_real)) `->` qualified(type($output))", results(output))]
pub struct TosaRFFT2DOp<'a> {
    #[slot(input_real_ty)]
    pub input_real: Value<'a>,
    pub local_bound: Attribute<'a>,
    pub input_real_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.Reciprocal", format = "$input1 attr-dict `:` qualified(type($input1)) `->` qualified(type($output))", results(output))]
pub struct TosaReciprocalOp<'a> {
    #[slot(output)]
    pub input1: Value<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.ReduceAll", format = "`axis` `=` $axis `,` $input attr-dict `:` qualified(type($input)) `->` qualified(type($output))", results(output))]
pub struct TosaReduceAllOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    #[attr(int = "i32")]
    pub axis: Attribute<'a>,
    pub input_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.ReduceAny", format = "`axis` `=` $axis `,` $input attr-dict `:` qualified(type($input)) `->` qualified(type($output))", results(output))]
pub struct TosaReduceAnyOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    #[attr(int = "i32")]
    pub axis: Attribute<'a>,
    pub input_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.ReduceMax", format = "`axis` `=` $axis `,` `nan_mode` `=` $nan_mode `,` $input attr-dict `:` qualified(type($input)) `->` qualified(type($output))", results(output))]
pub struct TosaReduceMaxOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    #[attr(int = "i32")]
    pub axis: Attribute<'a>,
    #[attr(dialect = "spirv.tosa_ext_nan_propagation_mode_type")]
    pub nan_mode: Attribute<'a>,
    pub input_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.ReduceMin", format = "`axis` `=` $axis `,` `nan_mode` `=` $nan_mode `,` $input attr-dict `:` qualified(type($input)) `->` qualified(type($output))", results(output))]
pub struct TosaReduceMinOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    #[attr(int = "i32")]
    pub axis: Attribute<'a>,
    #[attr(dialect = "spirv.tosa_ext_nan_propagation_mode_type")]
    pub nan_mode: Attribute<'a>,
    pub input_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.ReduceProduct", format = "`axis` `=` $axis `,` $input attr-dict `:` qualified(type($input)) `->` qualified(type($output))", results(output))]
pub struct TosaReduceProductOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    #[attr(int = "i32")]
    pub axis: Attribute<'a>,
    pub input_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.ReduceSum", format = "`axis` `=` $axis `,` $input attr-dict `:` qualified(type($input)) `->` qualified(type($output))", results(output))]
pub struct TosaReduceSumOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    #[attr(int = "i32")]
    pub axis: Attribute<'a>,
    pub input_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.Rescale", format = "`scale32` `=` $scale32 `,` `rounding_mode` `=` $rounding_mode `,` `per_channel` `=` $per_channel `,` `input_unsigned` `=` $input_unsigned `,` `output_unsigned` `=` $output_unsigned `,` $input `,` $multiplier `,` $shift `,` $input_zp `,` $output_zp attr-dict `:` qualified(type($input)) `,` qualified(type($multiplier)) `,` qualified(type($shift)) `,` qualified(type($input_zp)) `,` qualified(type($output_zp)) `->` qualified(type($output))", results(output))]
pub struct TosaRescaleOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    #[slot(multiplier_ty)]
    pub multiplier: Value<'a>,
    #[slot(shift_ty)]
    pub shift: Value<'a>,
    #[slot(input_zp_ty)]
    pub input_zp: Value<'a>,
    #[slot(output_zp_ty)]
    pub output_zp: Value<'a>,
    pub scale32: Attribute<'a>,
    #[attr(dialect = "spirv.tosa_ext_rounding_mode_type")]
    pub rounding_mode: Attribute<'a>,
    pub per_channel: Attribute<'a>,
    pub input_unsigned: Attribute<'a>,
    pub output_unsigned: Attribute<'a>,
    pub input_ty: Type<'a>,
    pub multiplier_ty: Type<'a>,
    pub shift_ty: Type<'a>,
    pub input_zp_ty: Type<'a>,
    pub output_zp_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.Reshape", format = "$input1 `,` $shape attr-dict `:` qualified(type($input1)) `,` qualified(type($shape)) `->` qualified(type($output))", results(output))]
pub struct TosaReshapeOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(shape_ty)]
    pub shape: Value<'a>,
    pub input1_ty: Type<'a>,
    pub shape_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.Resize", format = "`mode` `=` $mode `,` $input `,` $scale `,` $offset `,` $border attr-dict `:` qualified(type($input)) `,` qualified(type($scale)) `,` qualified(type($offset)) `,` qualified(type($border)) `->` qualified(type($output))", results(output))]
pub struct TosaResizeOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[slot(offset_ty)]
    pub offset: Value<'a>,
    #[slot(border_ty)]
    pub border: Value<'a>,
    #[attr(dialect = "spirv.tosa_ext_resize_mode_type")]
    pub mode: Attribute<'a>,
    pub input_ty: Type<'a>,
    pub scale_ty: Type<'a>,
    pub offset_ty: Type<'a>,
    pub border_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.Reverse", format = "`axis` `=` $axis `,` $input1 attr-dict `:` qualified(type($input1)) `->` qualified(type($output))", results(output))]
pub struct TosaReverseOp<'a> {
    #[slot(output)]
    pub input1: Value<'a>,
    #[attr(int = "i32")]
    pub axis: Attribute<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.Rsqrt", format = "$input1 attr-dict `:` qualified(type($input1)) `->` qualified(type($output))", results(output))]
pub struct TosaRsqrtOp<'a> {
    #[slot(output)]
    pub input1: Value<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.Scatter", format = "$values_in `,` $indices `,` $input attr-dict `:` qualified(type($values_in)) `,` qualified(type($indices)) `,` qualified(type($input)) `->` qualified(type($values_out))", results(values_out))]
pub struct TosaScatterOp<'a> {
    #[slot(values_out)]
    pub values_in: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Value<'a>,
    #[slot(input_ty)]
    pub input: Value<'a>,
    pub indices_ty: Type<'a>,
    pub input_ty: Type<'a>,
    pub values_out: Type<'a>,
}

#[mlir::op("spirv.Tosa.Select", format = "$condition `,` $true_value `,` $false_value attr-dict `:` qualified(type($condition)) `,` qualified(type($true_value)) `,` qualified(type($false_value)) `->` qualified(type($output))", results(output))]
pub struct TosaSelectOp<'a> {
    #[slot(condition_ty)]
    pub condition: Value<'a>,
    #[slot(true_value_ty)]
    pub true_value: Value<'a>,
    #[slot(false_value_ty)]
    pub false_value: Value<'a>,
    pub condition_ty: Type<'a>,
    pub true_value_ty: Type<'a>,
    pub false_value_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.Sigmoid", format = "$input attr-dict `:` qualified(type($input)) `->` qualified(type($output))", results(output))]
pub struct TosaSigmoidOp<'a> {
    #[slot(output)]
    pub input: Value<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.Sin", format = "$input1 attr-dict `:` qualified(type($input1)) `->` qualified(type($output))", results(output))]
pub struct TosaSinOp<'a> {
    #[slot(output)]
    pub input1: Value<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.Slice", format = "$input1 `,` $start `,` $size attr-dict `:` qualified(type($input1)) `,` qualified(type($start)) `,` qualified(type($size)) `->` qualified(type($output))", results(output))]
pub struct TosaSliceOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(start_ty)]
    pub start: Value<'a>,
    #[slot(size_ty)]
    pub size: Value<'a>,
    pub input1_ty: Type<'a>,
    pub start_ty: Type<'a>,
    pub size_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.Sub", format = "$input1 `,` $input2 attr-dict `:` qualified(type($input1)) `,` qualified(type($input2)) `->` qualified(type($output))", results(output))]
pub struct TosaSubOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    pub input1_ty: Type<'a>,
    pub input2_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.Table", format = "$input1 `,` $table attr-dict `:` qualified(type($input1)) `,` qualified(type($table)) `->` qualified(type($output))", results(output))]
pub struct TosaTableOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(table_ty)]
    pub table: Value<'a>,
    pub input1_ty: Type<'a>,
    pub table_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.Tanh", format = "$input attr-dict `:` qualified(type($input)) `->` qualified(type($output))", results(output))]
pub struct TosaTanhOp<'a> {
    #[slot(output)]
    pub input: Value<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.Tile", format = "$input1 `,` $multiples attr-dict `:` qualified(type($input1)) `,` qualified(type($multiples)) `->` qualified(type($output))", results(output))]
pub struct TosaTileOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(multiples_ty)]
    pub multiples: Value<'a>,
    pub input1_ty: Type<'a>,
    pub multiples_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.TransposeConv2D", results(output))]
pub struct TosaTransposeConv2DOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    #[slot(weight_ty)]
    pub weight: Value<'a>,
    #[slot(bias_ty)]
    pub bias: Value<'a>,
    #[slot(input_zp_ty)]
    pub input_zp: Value<'a>,
    #[slot(weight_zp_ty)]
    pub weight_zp: Value<'a>,
    pub out_pad: Attribute<'a>,
    pub stride: Attribute<'a>,
    #[attr(dialect = "spirv.tosa_ext_acc_type")]
    pub acc_type: Attribute<'a>,
    pub local_bound: Attribute<'a>,
    pub input_ty: Type<'a>,
    pub weight_ty: Type<'a>,
    pub bias_ty: Type<'a>,
    pub input_zp_ty: Type<'a>,
    pub weight_zp_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Tosa.Transpose", results(output))]
pub struct TosaTransposeOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    pub perms: Attribute<'a>,
    pub input1_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("spirv.Transpose", format = "$matrix attr-dict `:` type($matrix) `->` type($result)", results(result))]
pub struct TransposeOp<'a> {
    #[slot(matrix_ty)]
    pub matrix: Value<'a>,
    pub matrix_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.UConvert", format = "$operand attr-dict `:` type($operand) `to` type($result)", results(result))]
pub struct UConvertOp<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    pub operand_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.UDiv", format = "$operand1 `,` $operand2 attr-dict `:` type($result)", results(result))]
pub struct UDivOp<'a> {
    #[slot(result)]
    pub operand1: Value<'a>,
    #[slot(result)]
    pub operand2: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.UDotAccSat", format = "$vector1 `,` $vector2 `,` $accumulator ( `,` $format^ )? attr-dict `:` type($vector1) `->` type($result)", results(result))]
pub struct UDotAccSatOp<'a> {
    #[slot(vector1_ty)]
    pub vector1: Value<'a>,
    #[slot(vector1_ty)]
    pub vector2: Value<'a>,
    #[slot(result)]
    pub accumulator: Value<'a>,
    #[attr(dialect = "spirv.packed_vector_format")]
    pub format: Option<Attribute<'a>>,
    pub vector1_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.UDot", format = "$vector1 `,` $vector2 ( `,` $format^ )? attr-dict `:` type($vector1) `->` type($result)", results(result))]
pub struct UDotOp<'a> {
    #[slot(vector1_ty)]
    pub vector1: Value<'a>,
    #[slot(vector1_ty)]
    pub vector2: Value<'a>,
    #[attr(dialect = "spirv.packed_vector_format")]
    pub format: Option<Attribute<'a>>,
    pub vector1_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.UGreaterThanEqual", format = "$operand1 `,` $operand2 `:` type($operand1) attr-dict", results(result))]
pub struct UGreaterThanEqualOp<'a> {
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand1_ty)]
    pub operand2: Value<'a>,
    pub operand1_ty: Type<'a>,
    #[dtype(i1 = operand1_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.UGreaterThan", format = "$operand1 `,` $operand2 `:` type($operand1) attr-dict", results(result))]
pub struct UGreaterThanOp<'a> {
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand1_ty)]
    pub operand2: Value<'a>,
    pub operand1_ty: Type<'a>,
    #[dtype(i1 = operand1_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.ULessThanEqual", format = "$operand1 `,` $operand2 `:` type($operand1) attr-dict", results(result))]
pub struct ULessThanEqualOp<'a> {
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand1_ty)]
    pub operand2: Value<'a>,
    pub operand1_ty: Type<'a>,
    #[dtype(i1 = operand1_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.ULessThan", format = "$operand1 `,` $operand2 `:` type($operand1) attr-dict", results(result))]
pub struct ULessThanOp<'a> {
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand1_ty)]
    pub operand2: Value<'a>,
    pub operand1_ty: Type<'a>,
    #[dtype(i1 = operand1_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.UMod", format = "$operand1 `,` $operand2 attr-dict `:` type($result)", results(result))]
pub struct UModOp<'a> {
    #[slot(result)]
    pub operand1: Value<'a>,
    #[slot(result)]
    pub operand2: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.UMulExtended", results(result))]
pub struct UMulExtendedOp<'a> {
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand2_ty)]
    pub operand2: Value<'a>,
    pub operand1_ty: Type<'a>,
    pub operand2_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.Undef", format = "attr-dict `:` type($result)", results(result))]
pub struct UndefOp<'a> {
    pub result: Type<'a>,
}

#[mlir::op("spirv.Unordered", format = "$operand1 `,` $operand2 `:` type($operand1) attr-dict", results(result))]
pub struct UnorderedOp<'a> {
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand1_ty)]
    pub operand2: Value<'a>,
    pub operand1_ty: Type<'a>,
    #[dtype(i1 = operand1_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.Unreachable", format = "attr-dict")]
pub struct UnreachableOp<'a> {
}

#[mlir::op("spirv.Variable", results(pointer))]
pub struct VariableOp<'a> {
    #[slot(initializer_ty)]
    pub initializer: Vec<Value<'a>>,
    #[attr(dialect = "spirv.storage_class")]
    pub storage_class: Attribute<'a>,
    pub initializer_ty: Vec<Type<'a>>,
    pub pointer: Type<'a>,
}

#[mlir::op("spirv.VectorExtractDynamic", format = "$vector `[` $index `]` attr-dict `:` type($vector) `,` type($index)", results(result))]
pub struct VectorExtractDynamicOp<'a> {
    #[slot(vector_ty)]
    pub vector: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    pub vector_ty: Type<'a>,
    pub index_ty: Type<'a>,
    #[dtype(el = vector_ty)]
    pub result: Type<'a>,
}

#[mlir::op("spirv.VectorInsertDynamic", format = "$component `,` $vector `[` $index `]` attr-dict `:` type($vector) `,` type($index)", results(result))]
pub struct VectorInsertDynamicOp<'a> {
    #[slot(result)]
    pub vector: Value<'a>,
    #[slot(component_ty)]
    pub component: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[dtype(el = result)]
    pub component_ty: Type<'a>,
    pub index_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.VectorShuffle", format = "attr-dict $components $vector1 `,` $vector2 `:` type($vector1) `,` type($vector2) `->` type($result)", results(result))]
pub struct VectorShuffleOp<'a> {
    #[slot(vector1_ty)]
    pub vector1: Value<'a>,
    #[slot(vector2_ty)]
    pub vector2: Value<'a>,
    pub components: Attribute<'a>,
    pub vector1_ty: Type<'a>,
    pub vector2_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.VectorTimesMatrix", format = "$vector `,` $matrix attr-dict `:` type($vector) `,` type($matrix) `->` type($result)", results(result))]
pub struct VectorTimesMatrixOp<'a> {
    #[slot(vector_ty)]
    pub vector: Value<'a>,
    #[slot(matrix_ty)]
    pub matrix: Value<'a>,
    pub vector_ty: Type<'a>,
    pub matrix_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.VectorTimesScalar", format = "$vector `,` $scalar attr-dict `:` `(` qualified(type($vector)) `,` qualified(type($scalar)) `)` `->` type($result)", results(result))]
pub struct VectorTimesScalarOp<'a> {
    #[slot(vector_ty)]
    pub vector: Value<'a>,
    #[slot(scalar_ty)]
    pub scalar: Value<'a>,
    pub vector_ty: Type<'a>,
    pub scalar_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("spirv.mlir.yield", format = "attr-dict $operand `:` type($operand)")]
pub struct YieldOp<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    pub operand_ty: Type<'a>,
}

#[mlir::dialect(
    "spirv",
    ops = [AccessChainOp, AddressOfOp, AllOp, AnyOp, AtomicAndOp, AtomicCompareExchangeOp, AtomicCompareExchangeWeakOp, AtomicExchangeOp, AtomicIAddOp, AtomicIDecrementOp, AtomicIIncrementOp, AtomicISubOp, AtomicLoadOp, AtomicOrOp, AtomicSMaxOp, AtomicSMinOp, AtomicStoreOp, AtomicUMaxOp, AtomicUMinOp, AtomicXorOp, BitCountOp, BitFieldInsertOp, BitFieldSExtractOp, BitFieldUExtractOp, BitReverseOp, BitcastOp, BitwiseAndOp, BitwiseOrOp, BitwiseXorOp, BranchConditionalOp, BranchOp, CLAcosOp, CLAcoshOp, CLAsinOp, CLAsinhOp, CLAtan2Op, CLAtanOp, CLAtanhOp, CLCbrtOp, CLCeilOp, CLClzOp, CLCopysignOp, CLCosOp, CLCoshOp, CLErfOp, CLErfcOp, CLExp10Op, CLExp2Op, CLExpOp, CLExpm1Op, CLFAbsOp, CLFMaxOp, CLFMinOp, CLFdimOp, CLFloorOp, CLFmaOp, CLFmodOp, CLHypotOp, CLLdexpOp, CLLog10Op, CLLog1pOp, CLLog2Op, CLLogOp, CLMixOp, CLPowOp, CLPownOp, CLPrintfOp, CLRintOp, CLRootnOp, CLRoundOp, CLRsqrtOp, CLSAbsOp, CLSMaxOp, CLSMinOp, CLSinOp, CLSinhOp, CLSqrtOp, CLTanOp, CLTanhOp, CLTruncOp, CLUMaxOp, CLUMinOp, CompositeConstructOp, CompositeExtractOp, CompositeInsertOp, ConstantOp, ControlBarrierOp, ConvertFToSOp, ConvertFToUOp, ConvertPtrToUOp, ConvertSToFOp, ConvertUToFOp, ConvertUToPtrOp, CopyMemoryOp, DotOp, EXTAtomicFAddOp, EXTConstantCompositeReplicateOp, EXTEmitMeshTasksOp, EXTSetMeshOutputsOp, EXTSpecConstantCompositeReplicateOp, EmitVertexOp, EndPrimitiveOp, EntryPointOp, ExecutionModeIdOp, ExecutionModeOp, ExperimentalMLCallOp, FAddOp, FConvertOp, FDivOp, FModOp, FMulOp, FNegateOp, FOrdEqualOp, FOrdGreaterThanEqualOp, FOrdGreaterThanOp, FOrdLessThanEqualOp, FOrdLessThanOp, FOrdNotEqualOp, FRemOp, FSubOp, FUnordEqualOp, FUnordGreaterThanEqualOp, FUnordGreaterThanOp, FUnordLessThanEqualOp, FUnordLessThanOp, FUnordNotEqualOp, FuncOp, FunctionCallOp, GLAcosOp, GLAcoshOp, GLAsinOp, GLAsinhOp, GLAtan2Op, GLAtanOp, GLAtanhOp, GLCeilOp, GLCosOp, GLCoshOp, GLCrossOp, GLDegreesOp, GLDistanceOp, GLExp2Op, GLExpOp, GLFAbsOp, GLFClampOp, GLFMaxOp, GLFMinOp, GLFMixOp, GLFSignOp, GLFindILsbOp, GLFindSMsbOp, GLFindUMsbOp, GLFloorOp, GLFmaOp, GLFractOp, GLFrexpStructOp, GLInverseSqrtOp, GLLdexpOp, GLLengthOp, GLLog2Op, GLLogOp, GLNClampOp, GLNMaxOp, GLNMinOp, GLNormalizeOp, GLPackHalf2x16Op, GLPackSnorm4x8Op, GLPowOp, GLRadiansOp, GLReflectOp, GLRoundEvenOp, GLRoundOp, GLSAbsOp, GLSClampOp, GLSMaxOp, GLSMinOp, GLSSignOp, GLSinOp, GLSinhOp, GLSmoothStepOp, GLSqrtOp, GLStepOp, GLTanOp, GLTanhOp, GLTruncOp, GLUClampOp, GLUMaxOp, GLUMinOp, GLUnpackHalf2x16Op, GLUnpackSnorm4x8Op, GenericCastToPtrExplicitOp, GenericCastToPtrOp, GlobalVariableOp, GraphARMOp, GraphConstantARMOp, GraphEntryPointARMOp, GraphOutputsARMOp, GroupBroadcastOp, GroupFAddOp, GroupFMaxOp, GroupFMinOp, GroupFMulKHROp, GroupIAddOp, GroupIMulKHROp, GroupNonUniformAllEqualOp, GroupNonUniformAllOp, GroupNonUniformAnyOp, GroupNonUniformBallotBitCountOp, GroupNonUniformBallotFindLSBOp, GroupNonUniformBallotFindMSBOp, GroupNonUniformBallotOp, GroupNonUniformBitwiseAndOp, GroupNonUniformBitwiseOrOp, GroupNonUniformBitwiseXorOp, GroupNonUniformBroadcastFirstOp, GroupNonUniformBroadcastOp, GroupNonUniformElectOp, GroupNonUniformFAddOp, GroupNonUniformFMaxOp, GroupNonUniformFMinOp, GroupNonUniformFMulOp, GroupNonUniformIAddOp, GroupNonUniformIMulOp, GroupNonUniformLogicalAndOp, GroupNonUniformLogicalOrOp, GroupNonUniformLogicalXorOp, GroupNonUniformQuadSwapOp, GroupNonUniformRotateKHROp, GroupNonUniformSMaxOp, GroupNonUniformSMinOp, GroupNonUniformShuffleDownOp, GroupNonUniformShuffleOp, GroupNonUniformShuffleUpOp, GroupNonUniformShuffleXorOp, GroupNonUniformUMaxOp, GroupNonUniformUMinOp, GroupSMaxOp, GroupSMinOp, GroupUMaxOp, GroupUMinOp, IAddCarryOp, IAddOp, IEqualOp, IMulOp, INTELControlBarrierArriveOp, INTELControlBarrierWaitOp, INTELConvertBF16ToFOp, INTELConvertFToBF16Op, INTELMaskedGatherOp, INTELMaskedScatterOp, INTELRoundFToTF32Op, INTELSubgroupBlockReadOp, INTELSubgroupBlockWriteOp, INotEqualOp, ISubBorrowOp, ISubOp, ImageDrefGatherOp, ImageFetchOp, ImageOp, ImageQuerySizeOp, ImageReadOp, ImageSampleExplicitLodOp, ImageSampleImplicitLodOp, ImageSampleProjDrefImplicitLodOp, ImageWriteOp, InBoundsPtrAccessChainOp, IsFiniteOp, IsInfOp, IsNanOp, IsNormalOp, KHRAssumeTrueOp, KHRCooperativeMatrixLengthOp, KHRCooperativeMatrixLoadOp, KHRCooperativeMatrixMulAddOp, KHRCooperativeMatrixStoreOp, KHRExpectOp, KHRSubgroupBallotOp, KillOp, LoadOp, LogicalAndOp, LogicalEqualOp, LogicalNotEqualOp, LogicalNotOp, LogicalOrOp, LoopOp, MatrixTimesMatrixOp, MatrixTimesScalarOp, MatrixTimesVectorOp, MemoryBarrierOp, MemoryNamedBarrierOp, MergeOp, ModuleOp, NamedBarrierInitializeOp, NotOp, OrderedOp, OuterProductOp, PtrAccessChainOp, PtrCastToGenericOp, ReferenceOfOp, ReturnOp, ReturnValueOp, SConvertOp, SDivOp, SDotAccSatOp, SDotOp, SGreaterThanEqualOp, SGreaterThanOp, SLessThanEqualOp, SLessThanOp, SModOp, SMulExtendedOp, SNegateOp, SRemOp, SUDotAccSatOp, SUDotOp, SampledImageOp, SelectOp, SelectionOp, ShiftLeftLogicalOp, ShiftRightArithmeticOp, ShiftRightLogicalOp, SpecConstantCompositeOp, SpecConstantOp, SpecConstantOperationOp, StoreOp, SwitchOp, TosaAbsOp, TosaAddOp, TosaArgMaxOp, TosaArithmeticRightShiftOp, TosaAvgPool2DOp, TosaBitwiseAndOp, TosaBitwiseNotOp, TosaBitwiseOrOp, TosaBitwiseXorOp, TosaCastOp, TosaCeilOp, TosaClampOp, TosaClzOp, TosaConcatOp, TosaConv2DOp, TosaConv3DOp, TosaCosOp, TosaDepthwiseConv2DOp, TosaEqualOp, TosaErfOp, TosaExpOp, TosaFFT2DOp, TosaFloorOp, TosaGatherOp, TosaGreaterEqualOp, TosaGreaterOp, TosaIntDivOp, TosaLogOp, TosaLogicalAndOp, TosaLogicalLeftShiftOp, TosaLogicalNotOp, TosaLogicalOrOp, TosaLogicalRightShiftOp, TosaLogicalXorOp, TosaMatMulOp, TosaMaxPool2DOp, TosaMaximumOp, TosaMinimumOp, TosaMulOp, TosaNegateOp, TosaPadOp, TosaPowOp, TosaRFFT2DOp, TosaReciprocalOp, TosaReduceAllOp, TosaReduceAnyOp, TosaReduceMaxOp, TosaReduceMinOp, TosaReduceProductOp, TosaReduceSumOp, TosaRescaleOp, TosaReshapeOp, TosaResizeOp, TosaReverseOp, TosaRsqrtOp, TosaScatterOp, TosaSelectOp, TosaSigmoidOp, TosaSinOp, TosaSliceOp, TosaSubOp, TosaTableOp, TosaTanhOp, TosaTileOp, TosaTransposeConv2DOp, TosaTransposeOp, TransposeOp, UConvertOp, UDivOp, UDotAccSatOp, UDotOp, UGreaterThanEqualOp, UGreaterThanOp, ULessThanEqualOp, ULessThanOp, UModOp, UMulExtendedOp, UndefOp, UnorderedOp, UnreachableOp, VariableOp, VectorExtractDynamicOp, VectorInsertDynamicOp, VectorShuffleOp, VectorTimesMatrixOp, VectorTimesScalarOp, YieldOp],
    materializer
)]
pub struct SpirvDialect;
