#![allow(non_camel_case_types, unused_imports, clippy::all, rustdoc::all)]

use mlirformat::{mlir, Attribute, Region, Str, Type, Value, __Vec as Vec};

#[derive(Debug, Clone, Copy, PartialEq, Eq, mlirformat::__serde::Serialize, mlirformat::__serde::Deserialize, mlir::Cases)]
#[serde(crate = "mlirformat::__serde")]
pub enum ClassType {
    #[serde(rename = "class")]
    Class,
    #[serde(rename = "struct")]
    Struct,
    #[serde(rename = "union")]
    Union,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, mlirformat::__serde::Serialize, mlirformat::__serde::Deserialize, mlir::Cases)]
#[serde(crate = "mlirformat::__serde")]
pub enum CmpPredicate {
    #[serde(rename = "eq")]
    Eq,
    #[serde(rename = "ne")]
    Ne,
    #[serde(rename = "lt")]
    Lt,
    #[serde(rename = "le")]
    Le,
    #[serde(rename = "gt")]
    Gt,
    #[serde(rename = "ge")]
    Ge,
    #[serde(rename = "three_way")]
    ThreeWay,
}

#[mlir::op("emitc.add", format = "$lhs `,` $rhs attr-dict `:` functional-type($lhs $rhs, $result)", results(result))]
pub struct AddOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    pub lhs_ty: Type<'a>,
    pub rhs_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("emitc.address_of", results(result))]
pub struct AddressOfOp<'a> {
    #[slot(reference_ty)]
    pub reference: Value<'a>,
    #[dtype(strip = "emitc.lvalue")]
    pub reference_ty: Type<'a>,
    #[dtype(strip = "emitc.ptr")]
    pub result: Type<'a>,
}

#[mlir::op("emitc.assign", format = "$value `:` type($value) `to` $var `:` type($var) attr-dict")]
pub struct AssignOp<'a> {
    #[slot(var_ty)]
    pub var: Value<'a>,
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[dtype(strip = "emitc.lvalue")]
    pub var_ty: Type<'a>,
    pub value_ty: Type<'a>,
}

#[mlir::op("emitc.bitwise_and", format = "$lhs `,` $rhs attr-dict `:` functional-type($lhs $rhs, $result)", results(result))]
pub struct BitwiseAndOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    pub lhs_ty: Type<'a>,
    pub rhs_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("emitc.bitwise_left_shift", format = "$lhs `,` $rhs attr-dict `:` functional-type($lhs $rhs, $result)", results(result))]
pub struct BitwiseLeftShiftOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    pub lhs_ty: Type<'a>,
    pub rhs_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("emitc.bitwise_not", format = "$operand attr-dict `:` functional-type($operand, $result)", results(result))]
pub struct BitwiseNotOp<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    pub operand_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("emitc.bitwise_or", format = "$lhs `,` $rhs attr-dict `:` functional-type($lhs $rhs, $result)", results(result))]
pub struct BitwiseOrOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    pub lhs_ty: Type<'a>,
    pub rhs_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("emitc.bitwise_right_shift", format = "$lhs `,` $rhs attr-dict `:` functional-type($lhs $rhs, $result)", results(result))]
pub struct BitwiseRightShiftOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    pub lhs_ty: Type<'a>,
    pub rhs_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("emitc.bitwise_xor", format = "$lhs `,` $rhs attr-dict `:` functional-type($lhs $rhs, $result)", results(result))]
pub struct BitwiseXorOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    pub lhs_ty: Type<'a>,
    pub rhs_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("emitc.call", format = "$callee `(` $operands `)` attr-dict `:` functional-type($operands, $result)", results(result))]
pub struct CallOp<'a> {
    #[slot(operands_ty)]
    pub operands: Vec<Value<'a>>,
    pub callee: Attribute<'a>,
    pub arg_attrs: Option<Attribute<'a>>,
    pub res_attrs: Option<Attribute<'a>>,
    pub operands_ty: Vec<Type<'a>>,
    pub result: Vec<Type<'a>>,
}

#[mlir::op("emitc.call_opaque", results(result))]
pub struct CallOpaqueOp<'a> {
    #[slot(arg_operands_ty)]
    pub arg_operands: Vec<Value<'a>>,
    pub callee: Attribute<'a>,
    pub args: Option<Attribute<'a>>,
    pub template_args: Option<Attribute<'a>>,
    pub arg_operands_ty: Vec<Type<'a>>,
    pub result: Vec<Type<'a>>,
}

#[mlir::op("emitc.cast", format = "$source attr-dict `:` type($source) `to` type($dest)", results(dest))]
pub struct CastOp<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    pub pure: bool,
    pub source_ty: Type<'a>,
    pub dest: Type<'a>,
}

#[mlir::op("emitc.class", format = "($class_type^)? (`final` $final_specifier^)? $sym_name attr-dict-with-keyword $body")]
pub struct ClassOp<'a> {
    #[attr(symbol)]
    pub sym_name: Attribute<'a>,
    pub final_specifier: bool,
    #[attr(int = "i32", default = "0")]
    pub class_type: Option<ClassType>,
    pub body: Region<'a>,
}

#[mlir::op("emitc.cmp", format = "$predicate `,` $lhs `,` $rhs attr-dict `:` functional-type($lhs $rhs, $result)", results(result))]
pub struct CmpOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[attr(int = "i64")]
    pub predicate: CmpPredicate,
    pub lhs_ty: Type<'a>,
    pub rhs_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("emitc.conditional", format = "$condition `,` $true_value `,` $false_value attr-dict `:` type($result)", results(result))]
pub struct ConditionalOp<'a> {
    #[slot(condition_ty)]
    pub condition: Value<'a>,
    #[slot(result)]
    pub true_value: Value<'a>,
    #[slot(result)]
    pub false_value: Value<'a>,
    #[dtype(is = i1)]
    pub condition_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("emitc.constant", results(result))]
pub struct ConstantOp<'a> {
    pub value: Attribute<'a>,
    pub result: Type<'a>,
}

#[mlir::op("emitc.declare_func", format = "$sym_name attr-dict")]
pub struct DeclareFuncOp<'a> {
    pub sym_name: Attribute<'a>,
}

#[mlir::op("emitc.dereference", results(result))]
pub struct DereferenceOp<'a> {
    #[slot(pointer_ty)]
    pub pointer: Value<'a>,
    #[dtype(strip = "emitc.ptr")]
    pub pointer_ty: Type<'a>,
    #[dtype(strip = "emitc.lvalue")]
    pub result: Type<'a>,
}

#[mlir::op("emitc.div", format = "$operand0 `,` $operand1 attr-dict `:` functional-type($operand0 $operand1, $result)", results(result))]
pub struct DivOp<'a> {
    #[slot(operand0_ty)]
    pub operand0: Value<'a>,
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    pub operand0_ty: Type<'a>,
    pub operand1_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("emitc.do")]
pub struct DoOp<'a> {
    #[region(name = "bodyRegion")]
    pub body_region: Region<'a>,
    #[region(name = "conditionRegion")]
    pub condition_region: Region<'a>,
}

#[mlir::op("emitc.expression", results(result))]
pub struct ExpressionOp<'a> {
    #[slot(defs_ty)]
    pub defs: Vec<Value<'a>>,
    pub do_not_inline: bool,
    pub region: Region<'a>,
    pub defs_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("emitc.field")]
pub struct FieldOp<'a> {
    #[attr(symbol)]
    pub sym_name: Attribute<'a>,
    #[attr(name = "type")]
    pub type_: Attribute<'a>,
    pub initial_value: Option<Attribute<'a>>,
}

#[mlir::op("emitc.file", format = "$id attr-dict-with-keyword $bodyRegion")]
pub struct FileOp<'a> {
    pub id: Attribute<'a>,
    #[region(name = "bodyRegion")]
    pub body_region: Region<'a>,
}

#[mlir::op("emitc.for")]
pub struct ForOp<'a> {
    #[slot(lower_bound_ty, name = "lowerBound")]
    pub lower_bound: Value<'a>,
    #[slot(lower_bound_ty, name = "upperBound")]
    pub upper_bound: Value<'a>,
    #[slot(lower_bound_ty)]
    pub step: Value<'a>,
    pub region: Region<'a>,
    pub lower_bound_ty: Type<'a>,
}

#[mlir::op("emitc.func")]
pub struct FuncOp<'a> {
    #[attr(symbol)]
    pub sym_name: Attribute<'a>,
    pub function_type: Attribute<'a>,
    pub specifiers: Option<Attribute<'a>>,
    pub arg_attrs: Option<Attribute<'a>>,
    pub res_attrs: Option<Attribute<'a>>,
    pub body: Region<'a>,
}

#[mlir::op("emitc.get_field", format = "$field_name `:` type($result) attr-dict", results(result))]
pub struct GetFieldOp<'a> {
    pub field_name: Attribute<'a>,
    pub result: Type<'a>,
}

#[mlir::op("emitc.get_global", format = "$name `:` type($result) attr-dict", results(result))]
pub struct GetGlobalOp<'a> {
    pub name: Attribute<'a>,
    pub result: Type<'a>,
}

#[mlir::op("emitc.global")]
pub struct GlobalOp<'a> {
    #[attr(symbol)]
    pub sym_name: Attribute<'a>,
    #[attr(name = "type")]
    pub type_: Attribute<'a>,
    pub initial_value: Option<Attribute<'a>>,
    pub extern_specifier: bool,
    pub static_specifier: bool,
    pub const_specifier: bool,
}

#[mlir::op("emitc.if")]
pub struct IfOp<'a> {
    #[slot(condition_ty)]
    pub condition: Value<'a>,
    #[region(name = "thenRegion")]
    pub then_region: Region<'a>,
    #[region(name = "elseRegion")]
    pub else_region: Region<'a>,
    #[dtype(is = i1)]
    pub condition_ty: Type<'a>,
}

#[mlir::op("emitc.include")]
pub struct IncludeOp<'a> {
    pub include: Attribute<'a>,
    pub is_standard_include: bool,
}

#[mlir::op("emitc.literal", format = "$value attr-dict `:` type($result)", results(result))]
pub struct LiteralOp<'a> {
    pub value: Attribute<'a>,
    pub result: Type<'a>,
}

#[mlir::op("emitc.load", format = "$operand attr-dict `:` type($operand)", results(result))]
pub struct LoadOp<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    #[dtype(strip = "emitc.lvalue")]
    pub operand_ty: Type<'a>,
    #[dtype(el = operand_ty)]
    pub result: Type<'a>,
}

#[mlir::op("emitc.logical_and", format = "$lhs `,` $rhs attr-dict `:` qualified(type($lhs)) `,` qualified(type($rhs))", results(result))]
pub struct LogicalAndOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    pub lhs_ty: Type<'a>,
    pub rhs_ty: Type<'a>,
    #[dtype(is = i1)]
    pub result: Type<'a>,
}

#[mlir::op("emitc.logical_not", format = "$operand attr-dict `:` qualified(type($operand))", results(result))]
pub struct LogicalNotOp<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    pub operand_ty: Type<'a>,
    #[dtype(is = i1)]
    pub result: Type<'a>,
}

#[mlir::op("emitc.logical_or", format = "$lhs `,` $rhs attr-dict `:` qualified(type($lhs)) `,` qualified(type($rhs))", results(result))]
pub struct LogicalOrOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    pub lhs_ty: Type<'a>,
    pub rhs_ty: Type<'a>,
    #[dtype(is = i1)]
    pub result: Type<'a>,
}

#[mlir::op("emitc.member_call_opaque", results(result))]
pub struct MemberCallOpaqueOp<'a> {
    #[slot(receiver_ty)]
    pub receiver: Value<'a>,
    #[slot(arg_operands_ty)]
    pub arg_operands: Vec<Value<'a>>,
    pub callee: Attribute<'a>,
    pub args: Option<Attribute<'a>>,
    pub template_args: Option<Attribute<'a>>,
    pub receiver_ty: Type<'a>,
    pub arg_operands_ty: Vec<Type<'a>>,
    pub result: Vec<Type<'a>>,
}

#[mlir::op("emitc.member_of_ptr", results(result))]
pub struct MemberOfPtrOp<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    pub member: Attribute<'a>,
    #[dtype(strip = "emitc.lvalue")]
    pub operand_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("emitc.member", results(result))]
pub struct MemberOp<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    pub member: Attribute<'a>,
    pub operand_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("emitc.mul", format = "$operand0 `,` $operand1 attr-dict `:` functional-type($operand0 $operand1, $result)", results(result))]
pub struct MulOp<'a> {
    #[slot(operand0_ty)]
    pub operand0: Value<'a>,
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    pub operand0_ty: Type<'a>,
    pub operand1_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("emitc.rem", format = "$operand0 `,` $operand1 attr-dict `:` functional-type($operand0 $operand1, $result)", results(result))]
pub struct RemOp<'a> {
    #[slot(operand0_ty)]
    pub operand0: Value<'a>,
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    pub operand0_ty: Type<'a>,
    pub operand1_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("emitc.return", format = "attr-dict ($operand^ `:` type($operand))?")]
pub struct ReturnOp<'a> {
    #[slot(operand_ty)]
    pub operand: Vec<Value<'a>>,
    pub operand_ty: Vec<Type<'a>>,
}

#[mlir::op("emitc.sub", format = "$lhs `,` $rhs attr-dict `:` functional-type($lhs $rhs, $result)", results(result))]
pub struct SubOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    pub lhs_ty: Type<'a>,
    pub rhs_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("emitc.subscript", format = "$value `[` $indices `]` attr-dict `:` functional-type($value $indices, $result)", results(result))]
pub struct SubscriptOp<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    pub value_ty: Type<'a>,
    pub indices_ty: Vec<Type<'a>>,
    #[dtype(strip = "emitc.lvalue")]
    pub result: Type<'a>,
}

#[mlir::op("emitc.switch")]
pub struct SwitchOp<'a> {
    #[slot(arg_ty)]
    pub arg: Value<'a>,
    #[attr(dense = "i64")]
    pub cases: Attribute<'a>,
    #[region(name = "defaultRegion")]
    pub default_region: Region<'a>,
    #[region(name = "caseRegions")]
    pub case_regions: Vec<Region<'a>>,
    pub arg_ty: Type<'a>,
}

#[mlir::op("emitc.unary_minus", format = "$operand attr-dict `:` functional-type($operand, $result)", results(result))]
pub struct UnaryMinusOp<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    pub operand_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("emitc.unary_plus", format = "$operand attr-dict `:` functional-type($operand, $result)", results(result))]
pub struct UnaryPlusOp<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    pub operand_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("emitc.variable", results(result))]
pub struct VariableOp<'a> {
    pub value: Attribute<'a>,
    pub result: Type<'a>,
}

#[mlir::op("emitc.verbatim", format = "$value (`args` $fmtArgs^ `:` type($fmtArgs))? attr-dict")]
pub struct VerbatimOp<'a> {
    #[slot(fmt_args_ty, name = "fmtArgs")]
    pub fmt_args: Vec<Value<'a>>,
    pub value: Attribute<'a>,
    pub fmt_args_ty: Vec<Type<'a>>,
}

#[mlir::op("emitc.yield", format = "attr-dict ($result^ `:` type($result))?")]
pub struct YieldOp<'a> {
    #[slot(result_ty)]
    pub result: Vec<Value<'a>>,
    pub result_ty: Vec<Type<'a>>,
}

#[mlir::dialect(
    "emitc",
    ops = [AddOp, AddressOfOp, AssignOp, BitwiseAndOp, BitwiseLeftShiftOp, BitwiseNotOp, BitwiseOrOp, BitwiseRightShiftOp, BitwiseXorOp, CallOp, CallOpaqueOp, CastOp, ClassOp, CmpOp, ConditionalOp, ConstantOp, DeclareFuncOp, DereferenceOp, DivOp, DoOp, ExpressionOp, FieldOp, FileOp, ForOp, FuncOp, GetFieldOp, GetGlobalOp, GlobalOp, IfOp, IncludeOp, LiteralOp, LoadOp, LogicalAndOp, LogicalNotOp, LogicalOrOp, MemberCallOpaqueOp, MemberOfPtrOp, MemberOp, MulOp, RemOp, ReturnOp, SubOp, SubscriptOp, SwitchOp, UnaryMinusOp, UnaryPlusOp, VariableOp, VerbatimOp, YieldOp],
    materializer
)]
pub struct EmitcDialect;
