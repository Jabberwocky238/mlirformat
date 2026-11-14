#![allow(non_camel_case_types, unused_imports, clippy::all, rustdoc::all)]

use mlirformat::{mlir, Attribute, Region, Str, Type, Value, __Vec as Vec};

#[mlir::op("pdl.apply_native_constraint", format = "$name `(` $args `:` type($args) `)` (`:` type($results)^ )? attr-dict", results(results))]
pub struct ApplyNativeConstraintOp<'a> {
    #[slot(args_ty)]
    pub args: Vec<Value<'a>>,
    pub name: Attribute<'a>,
    #[attr(name = "isNegated", default = "false")]
    pub is_negated: Option<Attribute<'a>>,
    pub args_ty: Vec<Type<'a>>,
    pub results: Vec<Type<'a>>,
}

#[mlir::op("pdl.apply_native_rewrite", format = "$name (`(` $args^ `:` type($args) `)`)? (`:` type($results)^)? attr-dict", results(results))]
pub struct ApplyNativeRewriteOp<'a> {
    #[slot(args_ty)]
    pub args: Vec<Value<'a>>,
    pub name: Attribute<'a>,
    pub args_ty: Vec<Type<'a>>,
    pub results: Vec<Type<'a>>,
}

#[mlir::op("pdl.attribute", format = "(`:` $valueType^)? (`=` $value^)? attr-dict-with-keyword", results(attr))]
pub struct AttributeOp<'a> {
    #[slot(value_type_ty, name = "valueType")]
    pub value_type: Vec<Value<'a>>,
    pub value: Option<Attribute<'a>>,
    #[dtype(is = "!pdl.type")]
    pub value_type_ty: Type<'a>,
    #[dtype(is = "!pdl.attribute")]
    pub attr: Type<'a>,
}

#[mlir::op("pdl.erase", format = "$opValue attr-dict")]
pub struct EraseOp<'a> {
    #[slot(op_value_ty, name = "opValue")]
    pub op_value: Value<'a>,
    #[dtype(is = "!pdl.operation")]
    pub op_value_ty: Type<'a>,
}

#[mlir::op("pdl.operand", format = "(`:` $valueType^)? attr-dict", results(value))]
pub struct OperandOp<'a> {
    #[slot(value_type_ty, name = "valueType")]
    pub value_type: Vec<Value<'a>>,
    #[dtype(is = "!pdl.type")]
    pub value_type_ty: Type<'a>,
    #[dtype(is = "!pdl.value")]
    pub value: Type<'a>,
}

#[mlir::op("pdl.operands", format = "(`:` $valueType^)? attr-dict", results(value))]
pub struct OperandsOp<'a> {
    #[slot(value_type_ty, name = "valueType")]
    pub value_type: Vec<Value<'a>>,
    #[dtype(is = "!pdl.range<type>", strip = "pdl.range")]
    pub value_type_ty: Type<'a>,
    #[dtype(is = "!pdl.range<value>", strip = "pdl.range")]
    pub value: Type<'a>,
}

#[mlir::op("pdl.operation", results(op))]
pub struct OperationOp<'a> {
    #[slot(operand_values_ty, name = "operandValues")]
    pub operand_values: Vec<Value<'a>>,
    #[slot(attribute_values_ty, name = "attributeValues")]
    pub attribute_values: Vec<Value<'a>>,
    #[slot(type_values_ty, name = "typeValues")]
    pub type_values: Vec<Value<'a>>,
    #[attr(name = "opName")]
    pub op_name: Option<Attribute<'a>>,
    #[attr(name = "attributeValueNames")]
    pub attribute_value_names: Attribute<'a>,
    pub operand_values_ty: Vec<Type<'a>>,
    #[dtype(is = "!pdl.attribute")]
    pub attribute_values_ty: Type<'a>,
    pub type_values_ty: Vec<Type<'a>>,
    #[dtype(is = "!pdl.operation")]
    pub op: Type<'a>,
}

#[mlir::op("pdl.pattern", format = "($sym_name^)? `:` `benefit` `(` $benefit `)` attr-dict-with-keyword $bodyRegion")]
pub struct PatternOp<'a> {
    #[attr(int = "i16")]
    pub benefit: Attribute<'a>,
    #[attr(symbol)]
    pub sym_name: Option<Attribute<'a>>,
    #[region(name = "bodyRegion")]
    pub body_region: Region<'a>,
}

#[mlir::op("pdl.range", results(result))]
pub struct RangeOp<'a> {
    #[slot(arguments_ty)]
    pub arguments: Vec<Value<'a>>,
    pub arguments_ty: Vec<Type<'a>>,
    #[dtype(strip = "pdl.range")]
    pub result: Type<'a>,
}

#[mlir::op("pdl.replace", format = "$opValue `with` (`(` $replValues^ `:` type($replValues) `)`)? ($replOperation^)? attr-dict")]
pub struct ReplaceOp<'a> {
    #[slot(op_value_ty, name = "opValue")]
    pub op_value: Value<'a>,
    #[slot(repl_operation_ty, name = "replOperation")]
    pub repl_operation: Vec<Value<'a>>,
    #[slot(repl_values_ty, name = "replValues")]
    pub repl_values: Vec<Value<'a>>,
    #[dtype(is = "!pdl.operation")]
    pub op_value_ty: Type<'a>,
    #[dtype(is = "!pdl.operation")]
    pub repl_operation_ty: Type<'a>,
    pub repl_values_ty: Vec<Type<'a>>,
}

#[mlir::op("pdl.result", format = "$index `of` $parent attr-dict", results(val))]
pub struct ResultOp<'a> {
    #[slot(parent_ty)]
    pub parent: Value<'a>,
    #[attr(int = "i32")]
    pub index: Attribute<'a>,
    #[dtype(is = "!pdl.operation")]
    pub parent_ty: Type<'a>,
    #[dtype(is = "!pdl.value")]
    pub val: Type<'a>,
}

#[mlir::op("pdl.results", results(val))]
pub struct ResultsOp<'a> {
    #[slot(parent_ty)]
    pub parent: Value<'a>,
    #[attr(int = "i32")]
    pub index: Option<Attribute<'a>>,
    #[dtype(is = "!pdl.operation")]
    pub parent_ty: Type<'a>,
    pub val: Type<'a>,
}

#[mlir::op("pdl.rewrite", format = "($root^)? (`with` $name^ (`(` $externalArgs^ `:` type($externalArgs) `)`)?)? ($bodyRegion^)? attr-dict-with-keyword")]
pub struct RewriteOp<'a> {
    #[slot(root_ty)]
    pub root: Vec<Value<'a>>,
    #[slot(external_args_ty, name = "externalArgs")]
    pub external_args: Vec<Value<'a>>,
    pub name: Option<Attribute<'a>>,
    #[region(name = "bodyRegion")]
    pub body_region: Region<'a>,
    #[dtype(is = "!pdl.operation")]
    pub root_ty: Type<'a>,
    pub external_args_ty: Vec<Type<'a>>,
}

#[mlir::op("pdl.type", format = "attr-dict (`:` $constantType^)?", results(result))]
pub struct TypeOp<'a> {
    #[attr(name = "constantType")]
    pub constant_type: Option<Attribute<'a>>,
    #[dtype(is = "!pdl.type")]
    pub result: Type<'a>,
}

#[mlir::op("pdl.types", format = "attr-dict (`:` $constantTypes^)?", results(result))]
pub struct TypesOp<'a> {
    #[attr(name = "constantTypes")]
    pub constant_types: Option<Attribute<'a>>,
    #[dtype(is = "!pdl.range<type>", strip = "pdl.range")]
    pub result: Type<'a>,
}

#[mlir::dialect(
    "pdl",
    ops = [ApplyNativeConstraintOp, ApplyNativeRewriteOp, AttributeOp, EraseOp, OperandOp, OperandsOp, OperationOp, PatternOp, RangeOp, ReplaceOp, ResultOp, ResultsOp, RewriteOp, TypeOp, TypesOp]
)]
pub struct PdlDialect;
