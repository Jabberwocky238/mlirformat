#![allow(non_camel_case_types, unused_imports, clippy::all, rustdoc::all)]

use mlirformat::{mlir, Attribute, Region, Str, Type, Value, __Vec as Vec};

#[derive(Debug, Clone, Copy, PartialEq, Eq, mlirformat::__serde::Serialize, mlirformat::__serde::Deserialize, mlir::Cases)]
#[serde(crate = "mlirformat::__serde")]
pub enum AsmDialect {
    #[serde(rename = "att")]
    Att,
    #[serde(rename = "intel")]
    Intel,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, mlirformat::__serde::Serialize, mlirformat::__serde::Deserialize, mlir::Cases)]
#[serde(crate = "mlirformat::__serde")]
pub enum AtomicBinOp {
    #[serde(rename = "xchg")]
    Xchg,
    #[serde(rename = "add")]
    Add,
    #[serde(rename = "sub")]
    Sub,
    #[serde(rename = "_and")]
    And,
    #[serde(rename = "nand")]
    Nand,
    #[serde(rename = "_or")]
    Or,
    #[serde(rename = "_xor")]
    Xor,
    #[serde(rename = "max")]
    Max,
    #[serde(rename = "min")]
    Min,
    #[serde(rename = "umax")]
    Umax,
    #[serde(rename = "umin")]
    Umin,
    #[serde(rename = "fadd")]
    Fadd,
    #[serde(rename = "fsub")]
    Fsub,
    #[serde(rename = "fmax")]
    Fmax,
    #[serde(rename = "fmin")]
    Fmin,
    #[serde(rename = "uinc_wrap")]
    UincWrap,
    #[serde(rename = "udec_wrap")]
    UdecWrap,
    #[serde(rename = "usub_cond")]
    UsubCond,
    #[serde(rename = "usub_sat")]
    UsubSat,
    #[serde(rename = "fmaximum")]
    Fmaximum,
    #[serde(rename = "fminimum")]
    Fminimum,
    #[serde(rename = "fmaximumnum")]
    Fmaximumnum,
    #[serde(rename = "fminimumnum")]
    Fminimumnum,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, mlirformat::__serde::Serialize, mlirformat::__serde::Deserialize, mlir::Cases)]
#[serde(crate = "mlirformat::__serde")]
pub enum AtomicOrdering {
    #[serde(rename = "not_atomic")]
    NotAtomic,
    #[serde(rename = "unordered")]
    Unordered,
    #[serde(rename = "monotonic")]
    Monotonic,
    #[doc(hidden)]
    #[serde(rename = "__3")]
    __3,
    #[serde(rename = "acquire")]
    Acquire,
    #[serde(rename = "release")]
    Release,
    #[serde(rename = "acq_rel")]
    AcqRel,
    #[serde(rename = "seq_cst")]
    SeqCst,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, mlirformat::__serde::Serialize, mlirformat::__serde::Deserialize, mlir::Cases)]
#[serde(crate = "mlirformat::__serde")]
pub enum Comdat {
    #[serde(rename = "any")]
    Any,
    #[serde(rename = "exactmatch")]
    Exactmatch,
    #[serde(rename = "largest")]
    Largest,
    #[serde(rename = "nodeduplicate")]
    Nodeduplicate,
    #[serde(rename = "samesize")]
    Samesize,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, mlirformat::__serde::Serialize, mlirformat::__serde::Deserialize, mlir::Cases)]
#[serde(crate = "mlirformat::__serde")]
pub enum FCmpPredicate {
    #[serde(rename = "_false")]
    False,
    #[serde(rename = "oeq")]
    Oeq,
    #[serde(rename = "ogt")]
    Ogt,
    #[serde(rename = "oge")]
    Oge,
    #[serde(rename = "olt")]
    Olt,
    #[serde(rename = "ole")]
    Ole,
    #[serde(rename = "one")]
    One,
    #[serde(rename = "ord")]
    Ord,
    #[serde(rename = "ueq")]
    Ueq,
    #[serde(rename = "ugt")]
    Ugt,
    #[serde(rename = "uge")]
    Uge,
    #[serde(rename = "ult")]
    Ult,
    #[serde(rename = "ule")]
    Ule,
    #[serde(rename = "une")]
    Une,
    #[serde(rename = "uno")]
    Uno,
    #[serde(rename = "_true")]
    True,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, mlirformat::__serde::Serialize, mlirformat::__serde::Deserialize, mlir::Cases)]
#[serde(crate = "mlirformat::__serde")]
pub enum FPExceptionBehavior {
    #[serde(rename = "ignore")]
    Ignore,
    #[serde(rename = "maytrap")]
    Maytrap,
    #[serde(rename = "strict")]
    Strict,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, mlirformat::__serde::Serialize, mlirformat::__serde::Deserialize, mlir::Cases)]
#[serde(crate = "mlirformat::__serde")]
pub enum ICmpPredicate {
    #[serde(rename = "eq")]
    Eq,
    #[serde(rename = "ne")]
    Ne,
    #[serde(rename = "slt")]
    Slt,
    #[serde(rename = "sle")]
    Sle,
    #[serde(rename = "sgt")]
    Sgt,
    #[serde(rename = "sge")]
    Sge,
    #[serde(rename = "ult")]
    Ult,
    #[serde(rename = "ule")]
    Ule,
    #[serde(rename = "ugt")]
    Ugt,
    #[serde(rename = "uge")]
    Uge,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, mlirformat::__serde::Serialize, mlirformat::__serde::Deserialize, mlir::Cases)]
#[serde(crate = "mlirformat::__serde")]
pub enum RoundingMode {
    #[serde(rename = "towardzero")]
    Towardzero,
    #[serde(rename = "tonearest")]
    Tonearest,
    #[serde(rename = "upward")]
    Upward,
    #[serde(rename = "downward")]
    Downward,
    #[serde(rename = "tonearestaway")]
    Tonearestaway,
    #[doc(hidden)]
    #[serde(rename = "__5")]
    __5,
    #[doc(hidden)]
    #[serde(rename = "__6")]
    __6,
    #[serde(rename = "dynamic")]
    Dynamic,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, mlirformat::__serde::Serialize, mlirformat::__serde::Deserialize, mlir::Cases)]
#[serde(crate = "mlirformat::__serde")]
pub enum UnnamedAddr {
    #[serde(rename = "")]
    V,
    #[serde(rename = "local_unnamed_addr")]
    LocalUnnamedAddr,
    #[serde(rename = "unnamed_addr")]
    UnnamedAddr,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, mlirformat::__serde::Serialize, mlirformat::__serde::Deserialize, mlir::Cases)]
#[serde(crate = "mlirformat::__serde")]
pub enum Visibility {
    #[serde(rename = "")]
    V,
    #[serde(rename = "hidden")]
    Hidden,
    #[serde(rename = "protected")]
    Protected,
}

#[mlir::op("llvm.intr.acos", format = "`(` $in `)` attr-dict `:` functional-type($in, $res)", results(res))]
pub struct ACosOp<'a> {
    #[slot(res, name = "in")]
    pub in_: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.ashr", format = "(`exact` $isExact^)? $lhs `,` $rhs attr-dict `:` type($res)", results(res))]
pub struct AShrOp<'a> {
    #[slot(res)]
    pub lhs: Value<'a>,
    #[slot(res)]
    pub rhs: Value<'a>,
    #[attr(name = "isExact")]
    pub is_exact: bool,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.asin", format = "`(` $in `)` attr-dict `:` functional-type($in, $res)", results(res))]
pub struct ASinOp<'a> {
    #[slot(res, name = "in")]
    pub in_: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.atan2", format = "`(` $a `,` $b `)` attr-dict `:` functional-type($a $b, $res)", results(res))]
pub struct ATan2Op<'a> {
    #[slot(res)]
    pub a: Value<'a>,
    #[slot(res)]
    pub b: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.atan", format = "`(` $in `)` attr-dict `:` functional-type($in, $res)", results(res))]
pub struct ATanOp<'a> {
    #[slot(res, name = "in")]
    pub in_: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.abs", results(res))]
pub struct AbsOp<'a> {
    #[slot(in_ty, name = "in")]
    pub in_: Value<'a>,
    #[attr(int = "i1")]
    pub is_int_min_poison: Attribute<'a>,
    pub in_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.add", format = "$lhs `,` $rhs ($overflowFlags^)? attr-dict `:` type($res)", results(res))]
pub struct AddOp<'a> {
    #[slot(res)]
    pub lhs: Value<'a>,
    #[slot(res)]
    pub rhs: Value<'a>,
    #[attr(name = "overflowFlags", int = "i32", default = "0", bits = "overflow/, /none=0;nsw=1;nuw=2")]
    pub overflow_flags: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.addrspacecast", format = "$arg attr-dict `:` type($arg) `to` type($res)", results(res))]
pub struct AddrSpaceCastOp<'a> {
    #[slot(arg_ty)]
    pub arg: Value<'a>,
    pub arg_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.mlir.addressof", format = "$global_name attr-dict `:` qualified(type($res))", results(res))]
pub struct AddressOfOp<'a> {
    pub global_name: Attribute<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.mlir.alias")]
pub struct AliasOp<'a> {
    pub alias_type: Attribute<'a>,
    pub sym_name: Attribute<'a>,
    #[attr(dialect = "llvm.linkage")]
    pub linkage: Attribute<'a>,
    pub dso_local: bool,
    pub thread_local_: bool,
    #[attr(int = "i64")]
    pub unnamed_addr: Option<UnnamedAddr>,
    #[attr(int = "i64", default = "0")]
    pub visibility_: Option<Visibility>,
    pub initializer: Region<'a>,
}

#[mlir::op("llvm.alloca", results(res))]
pub struct AllocaOp<'a> {
    #[slot(array_size_ty, name = "arraySize")]
    pub array_size: Value<'a>,
    #[attr(int = "i64")]
    pub alignment: Option<Attribute<'a>>,
    pub elem_type: Attribute<'a>,
    pub inalloca: bool,
    pub array_size_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.and", format = "$lhs `,` $rhs attr-dict `:` type($res)", results(res))]
pub struct AndOp<'a> {
    #[slot(res)]
    pub lhs: Value<'a>,
    #[slot(res)]
    pub rhs: Value<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.annotation", results(res))]
pub struct Annotation<'a> {
    #[slot(res)]
    pub integer: Value<'a>,
    #[slot(annotation_ty)]
    pub annotation: Value<'a>,
    #[slot(annotation_ty, name = "fileName")]
    pub file_name: Value<'a>,
    #[slot(line_ty)]
    pub line: Value<'a>,
    pub annotation_ty: Type<'a>,
    #[dtype(is = i32)]
    pub line_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.arithmetic.fence", format = "`(` $in `)` attr-dict `:` functional-type($in, $res)", results(res))]
pub struct ArithmeticFenceOp<'a> {
    #[slot(res, name = "in")]
    pub in_: Value<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.assume")]
pub struct AssumeOp<'a> {
    #[slot(cond_ty)]
    pub cond: Value<'a>,
    #[slot(op_bundle_operands_ty)]
    pub op_bundle_operands: Vec<Value<'a>>,
    #[attr(dense = "i32")]
    pub op_bundle_sizes: Attribute<'a>,
    pub op_bundle_tags: Option<Attribute<'a>>,
    #[dtype(is = i1)]
    pub cond_ty: Type<'a>,
    pub op_bundle_operands_ty: Vec<Type<'a>>,
}

#[mlir::op("llvm.cmpxchg", format = "(`weak` $weak^)? (`volatile` $volatile_^)? $ptr `,` $cmp `,` $val (`syncscope` `(` $syncscope^ `)`)? $success_ordering $failure_ordering attr-dict `:` qualified(type($ptr)) `,` type($val)", results(res))]
pub struct AtomicCmpXchgOp<'a> {
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    #[slot(cmp_ty)]
    pub cmp: Value<'a>,
    #[slot(cmp_ty)]
    pub val: Value<'a>,
    #[attr(int = "i64")]
    pub success_ordering: AtomicOrdering,
    #[attr(int = "i64")]
    pub failure_ordering: AtomicOrdering,
    pub syncscope: Option<Attribute<'a>>,
    #[attr(int = "i64")]
    pub alignment: Option<Attribute<'a>>,
    pub weak: bool,
    pub volatile_: bool,
    pub access_groups: Option<Attribute<'a>>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    pub ptr_ty: Type<'a>,
    pub cmp_ty: Type<'a>,
    #[dtype(pair = cmp_ty)]
    pub res: Type<'a>,
}

#[mlir::op("llvm.atomicrmw", format = "(`volatile` $volatile_^)? $bin_op $ptr `,` $val (`syncscope` `(` $syncscope^ `)`)? $ordering attr-dict `:` qualified(type($ptr)) `,` type($val)", results(res))]
pub struct AtomicRMWOp<'a> {
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    #[slot(res)]
    pub val: Value<'a>,
    #[attr(int = "i64")]
    pub bin_op: AtomicBinOp,
    #[attr(int = "i64")]
    pub ordering: AtomicOrdering,
    pub syncscope: Option<Attribute<'a>>,
    #[attr(int = "i64")]
    pub alignment: Option<Attribute<'a>>,
    pub volatile_: bool,
    pub access_groups: Option<Attribute<'a>>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    pub ptr_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.bitreverse", format = "`(` $in `)` attr-dict `:` functional-type($in, $res)", results(res))]
pub struct BitReverseOp<'a> {
    #[slot(res, name = "in")]
    pub in_: Value<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.bitcast", format = "$arg attr-dict `:` type($arg) `to` type($res)", results(res))]
pub struct BitcastOp<'a> {
    #[slot(arg_ty)]
    pub arg: Value<'a>,
    pub arg_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.blockaddress", format = "$block_addr attr-dict `:` qualified(type($res))", results(res))]
pub struct BlockAddressOp<'a> {
    #[attr(dialect = "llvm.blockaddress")]
    pub block_addr: Attribute<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.blocktag", format = "$tag attr-dict")]
pub struct BlockTagOp<'a> {
    #[attr(dialect = "llvm.blocktag")]
    pub tag: Attribute<'a>,
}

#[mlir::op("llvm.br", format = "$dest (`(` $destOperands^ `:` type($destOperands) `)`)? attr-dict")]
pub struct BrOp<'a> {
    #[slot(dest_operands_ty, name = "destOperands")]
    pub dest_operands: Vec<Value<'a>>,
    #[attr(dialect = "llvm.loop_annotation")]
    pub loop_annotation: Option<Attribute<'a>>,
    #[successor]
    pub dest: Str<'a>,
    pub dest_operands_ty: Vec<Type<'a>>,
}

#[mlir::op("llvm.intr.bswap", format = "`(` $in `)` attr-dict `:` functional-type($in, $res)", results(res))]
pub struct ByteSwapOp<'a> {
    #[slot(res, name = "in")]
    pub in_: Value<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.call_intrinsic", results(results))]
pub struct CallIntrinsicOp<'a> {
    #[slot(args_ty)]
    pub args: Vec<Value<'a>>,
    #[slot(op_bundle_operands_ty)]
    pub op_bundle_operands: Vec<Value<'a>>,
    pub intrin: Attribute<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    #[attr(dense = "i32")]
    pub op_bundle_sizes: Attribute<'a>,
    pub op_bundle_tags: Option<Attribute<'a>>,
    pub arg_attrs: Option<Attribute<'a>>,
    pub res_attrs: Option<Attribute<'a>>,
    pub args_ty: Vec<Type<'a>>,
    pub op_bundle_operands_ty: Vec<Type<'a>>,
    pub results: Vec<Type<'a>>,
}

#[mlir::op("llvm.call", results(result))]
pub struct CallOp<'a> {
    #[slot(callee_operands_ty)]
    pub callee_operands: Vec<Value<'a>>,
    #[slot(op_bundle_operands_ty)]
    pub op_bundle_operands: Vec<Value<'a>>,
    pub var_callee_type: Option<Attribute<'a>>,
    pub callee: Option<Attribute<'a>>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    #[attr(name = "CConv", dialect = "llvm.cconv", default = "<ccc>")]
    pub c_conv: Option<Attribute<'a>>,
    #[attr(name = "TailCallKind", dialect = "llvm.tailcallkind", default = "<none>")]
    pub tail_call_kind: Option<Attribute<'a>>,
    #[attr(dialect = "llvm.memory_effects")]
    pub memory_effects: Option<Attribute<'a>>,
    pub convergent: bool,
    pub no_unwind: bool,
    pub will_return: bool,
    pub noreturn: bool,
    pub returns_twice: bool,
    pub hot: bool,
    pub cold: bool,
    pub noduplicate: bool,
    pub no_caller_saved_registers: bool,
    pub nocallback: bool,
    pub modular_format: Option<Attribute<'a>>,
    pub nobuiltins: Option<Attribute<'a>>,
    #[attr(dense = "i32")]
    pub allocsize: Option<Attribute<'a>>,
    pub optsize: bool,
    pub minsize: bool,
    pub builtin: bool,
    pub nobuiltin: bool,
    pub save_reg_params: bool,
    pub zero_call_used_regs: Option<Attribute<'a>>,
    pub trap_func_name: Option<Attribute<'a>>,
    pub default_func_attrs: Option<Attribute<'a>>,
    #[attr(dense = "i32")]
    pub op_bundle_sizes: Attribute<'a>,
    pub op_bundle_tags: Option<Attribute<'a>>,
    pub arg_attrs: Option<Attribute<'a>>,
    pub res_attrs: Option<Attribute<'a>>,
    pub no_inline: bool,
    pub always_inline: bool,
    pub inline_hint: bool,
    pub access_groups: Option<Attribute<'a>>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    pub callee_operands_ty: Vec<Type<'a>>,
    pub op_bundle_operands_ty: Vec<Type<'a>>,
    pub result: Vec<Type<'a>>,
}

#[mlir::op("llvm.comdat", format = "$sym_name $body attr-dict")]
pub struct ComdatOp<'a> {
    #[attr(symbol)]
    pub sym_name: Attribute<'a>,
    pub body: Region<'a>,
}

#[mlir::op("llvm.comdat_selector", format = "$sym_name $comdat attr-dict")]
pub struct ComdatSelectorOp<'a> {
    #[attr(symbol)]
    pub sym_name: Attribute<'a>,
    #[attr(int = "i64")]
    pub comdat: Comdat,
}

#[mlir::op("llvm.cond_br", format = "$condition ( `weights` `(` $branch_weights^ `)` )? `,` $trueDest (`(` $trueDestOperands^ `:` type($trueDestOperands) `)`)? `,` $falseDest (`(` $falseDestOperands^ `:` type($falseDestOperands) `)`)? attr-dict")]
pub struct CondBrOp<'a> {
    #[slot(condition_ty)]
    pub condition: Value<'a>,
    #[slot(true_dest_operands_ty, name = "trueDestOperands")]
    pub true_dest_operands: Vec<Value<'a>>,
    #[slot(false_dest_operands_ty, name = "falseDestOperands")]
    pub false_dest_operands: Vec<Value<'a>>,
    #[attr(dense = "i32")]
    pub branch_weights: Option<Attribute<'a>>,
    #[attr(dialect = "llvm.loop_annotation")]
    pub loop_annotation: Option<Attribute<'a>>,
    #[successor(name = "trueDest")]
    pub true_dest: Str<'a>,
    #[successor(name = "falseDest")]
    pub false_dest: Str<'a>,
    #[dtype(is = i1)]
    pub condition_ty: Type<'a>,
    pub true_dest_operands_ty: Vec<Type<'a>>,
    pub false_dest_operands_ty: Vec<Type<'a>>,
}

#[mlir::op("llvm.mlir.constant", format = "`(` $value `)` attr-dict `:` type($res)", results(res))]
pub struct ConstantOp<'a> {
    pub value: Attribute<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.experimental.constrained.fadd", format = "$arg_0 `,` $arg_1 $roundingmode $fpExceptionBehavior attr-dict `:` type($arg_0)", results(res))]
pub struct ConstrainedFAddIntr<'a> {
    #[slot(res)]
    pub arg_0: Value<'a>,
    #[slot(res)]
    pub arg_1: Value<'a>,
    #[attr(int = "i64")]
    pub roundingmode: RoundingMode,
    #[attr(name = "fpExceptionBehavior", int = "i64")]
    pub fp_exception_behavior: FPExceptionBehavior,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.experimental.constrained.fdiv", format = "$arg_0 `,` $arg_1 $roundingmode $fpExceptionBehavior attr-dict `:` type($arg_0)", results(res))]
pub struct ConstrainedFDivIntr<'a> {
    #[slot(res)]
    pub arg_0: Value<'a>,
    #[slot(res)]
    pub arg_1: Value<'a>,
    #[attr(int = "i64")]
    pub roundingmode: RoundingMode,
    #[attr(name = "fpExceptionBehavior", int = "i64")]
    pub fp_exception_behavior: FPExceptionBehavior,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.experimental.constrained.fma", format = "$arg_0 `,` $arg_1 `,` $arg_2 $roundingmode $fpExceptionBehavior attr-dict `:` type($arg_0)", results(res))]
pub struct ConstrainedFMAIntr<'a> {
    #[slot(res)]
    pub arg_0: Value<'a>,
    #[slot(res)]
    pub arg_1: Value<'a>,
    #[slot(res)]
    pub arg_2: Value<'a>,
    #[attr(int = "i64")]
    pub roundingmode: RoundingMode,
    #[attr(name = "fpExceptionBehavior", int = "i64")]
    pub fp_exception_behavior: FPExceptionBehavior,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.experimental.constrained.fmuladd", format = "$arg_0 `,` $arg_1 `,` $arg_2 $roundingmode $fpExceptionBehavior attr-dict `:` type($arg_0)", results(res))]
pub struct ConstrainedFMulAddIntr<'a> {
    #[slot(res)]
    pub arg_0: Value<'a>,
    #[slot(res)]
    pub arg_1: Value<'a>,
    #[slot(res)]
    pub arg_2: Value<'a>,
    #[attr(int = "i64")]
    pub roundingmode: RoundingMode,
    #[attr(name = "fpExceptionBehavior", int = "i64")]
    pub fp_exception_behavior: FPExceptionBehavior,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.experimental.constrained.fmul", format = "$arg_0 `,` $arg_1 $roundingmode $fpExceptionBehavior attr-dict `:` type($arg_0)", results(res))]
pub struct ConstrainedFMulIntr<'a> {
    #[slot(res)]
    pub arg_0: Value<'a>,
    #[slot(res)]
    pub arg_1: Value<'a>,
    #[attr(int = "i64")]
    pub roundingmode: RoundingMode,
    #[attr(name = "fpExceptionBehavior", int = "i64")]
    pub fp_exception_behavior: FPExceptionBehavior,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.experimental.constrained.fpext", format = "$arg_0 $fpExceptionBehavior attr-dict `:` type($arg_0) `to` qualified(type($res))", results(res))]
pub struct ConstrainedFPExtIntr<'a> {
    #[slot(arg_0_ty)]
    pub arg_0: Value<'a>,
    #[attr(name = "fpExceptionBehavior", int = "i64")]
    pub fp_exception_behavior: FPExceptionBehavior,
    pub arg_0_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.experimental.constrained.fptrunc", format = "$arg_0 $roundingmode $fpExceptionBehavior attr-dict `:` type($arg_0) `to` qualified(type($res))", results(res))]
pub struct ConstrainedFPTruncIntr<'a> {
    #[slot(arg_0_ty)]
    pub arg_0: Value<'a>,
    #[attr(int = "i64")]
    pub roundingmode: RoundingMode,
    #[attr(name = "fpExceptionBehavior", int = "i64")]
    pub fp_exception_behavior: FPExceptionBehavior,
    pub arg_0_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.experimental.constrained.frem", format = "$arg_0 `,` $arg_1 $roundingmode $fpExceptionBehavior attr-dict `:` type($arg_0)", results(res))]
pub struct ConstrainedFRemIntr<'a> {
    #[slot(res)]
    pub arg_0: Value<'a>,
    #[slot(res)]
    pub arg_1: Value<'a>,
    #[attr(int = "i64")]
    pub roundingmode: RoundingMode,
    #[attr(name = "fpExceptionBehavior", int = "i64")]
    pub fp_exception_behavior: FPExceptionBehavior,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.experimental.constrained.fsub", format = "$arg_0 `,` $arg_1 $roundingmode $fpExceptionBehavior attr-dict `:` type($arg_0)", results(res))]
pub struct ConstrainedFSubIntr<'a> {
    #[slot(res)]
    pub arg_0: Value<'a>,
    #[slot(res)]
    pub arg_1: Value<'a>,
    #[attr(int = "i64")]
    pub roundingmode: RoundingMode,
    #[attr(name = "fpExceptionBehavior", int = "i64")]
    pub fp_exception_behavior: FPExceptionBehavior,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.experimental.constrained.sitofp", format = "$arg_0 $roundingmode $fpExceptionBehavior attr-dict `:` type($arg_0) `to` qualified(type($res))", results(res))]
pub struct ConstrainedSIToFP<'a> {
    #[slot(arg_0_ty)]
    pub arg_0: Value<'a>,
    #[attr(int = "i64")]
    pub roundingmode: RoundingMode,
    #[attr(name = "fpExceptionBehavior", int = "i64")]
    pub fp_exception_behavior: FPExceptionBehavior,
    pub arg_0_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.experimental.constrained.uitofp", format = "$arg_0 $roundingmode $fpExceptionBehavior attr-dict `:` type($arg_0) `to` qualified(type($res))", results(res))]
pub struct ConstrainedUIToFP<'a> {
    #[slot(arg_0_ty)]
    pub arg_0: Value<'a>,
    #[attr(int = "i64")]
    pub roundingmode: RoundingMode,
    #[attr(name = "fpExceptionBehavior", int = "i64")]
    pub fp_exception_behavior: FPExceptionBehavior,
    pub arg_0_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.copysign", format = "`(` $a `,` $b `)` attr-dict `:` functional-type($a $b, $res)", results(res))]
pub struct CopySignOp<'a> {
    #[slot(res)]
    pub a: Value<'a>,
    #[slot(res)]
    pub b: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.coro.align", format = "attr-dict `:` type($res)", results(res))]
pub struct CoroAlignOp<'a> {
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.coro.begin", format = "$token `,` $mem attr-dict `:` functional-type($token $mem, $res)", results(res))]
pub struct CoroBeginOp<'a> {
    #[slot(token_ty)]
    pub token: Value<'a>,
    #[slot(mem_ty)]
    pub mem: Value<'a>,
    #[dtype(is = token)]
    pub token_ty: Type<'a>,
    pub mem_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.coro.end", format = "$handle `,` $unwind `,` $retvals attr-dict `:` functional-type($handle $unwind $retvals, $res)", results(res))]
pub struct CoroEndOp<'a> {
    #[slot(handle_ty)]
    pub handle: Value<'a>,
    #[slot(unwind_ty)]
    pub unwind: Value<'a>,
    #[slot(retvals_ty)]
    pub retvals: Value<'a>,
    pub handle_ty: Type<'a>,
    #[dtype(is = i1)]
    pub unwind_ty: Type<'a>,
    #[dtype(is = token)]
    pub retvals_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.coro.free", format = "$id `,` $handle attr-dict `:` functional-type($id $handle, $res)", results(res))]
pub struct CoroFreeOp<'a> {
    #[slot(id_ty)]
    pub id: Value<'a>,
    #[slot(handle_ty)]
    pub handle: Value<'a>,
    #[dtype(is = token)]
    pub id_ty: Type<'a>,
    pub handle_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.coro.id", format = "$align `,` $promise `,` $coroaddr `,` $fnaddrs attr-dict `:` functional-type($align $promise $coroaddr $fnaddrs, $res)", results(res))]
pub struct CoroIdOp<'a> {
    #[slot(align_ty)]
    pub align: Value<'a>,
    #[slot(promise_ty)]
    pub promise: Value<'a>,
    #[slot(coroaddr_ty)]
    pub coroaddr: Value<'a>,
    #[slot(fnaddrs_ty)]
    pub fnaddrs: Value<'a>,
    #[dtype(is = i32)]
    pub align_ty: Type<'a>,
    pub promise_ty: Type<'a>,
    pub coroaddr_ty: Type<'a>,
    pub fnaddrs_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.coro.promise", format = "$handle `,` $align `,` $from attr-dict `:` functional-type($handle $align $from, $res)", results(res))]
pub struct CoroPromiseOp<'a> {
    #[slot(handle_ty)]
    pub handle: Value<'a>,
    #[slot(align_ty)]
    pub align: Value<'a>,
    #[slot(from_ty)]
    pub from: Value<'a>,
    pub handle_ty: Type<'a>,
    #[dtype(is = i32)]
    pub align_ty: Type<'a>,
    #[dtype(is = i1)]
    pub from_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.coro.resume", format = "$handle attr-dict `:` qualified(type($handle))")]
pub struct CoroResumeOp<'a> {
    #[slot(handle_ty)]
    pub handle: Value<'a>,
    pub handle_ty: Type<'a>,
}

#[mlir::op("llvm.intr.coro.save", format = "$handle attr-dict `:` functional-type($handle, $res)", results(res))]
pub struct CoroSaveOp<'a> {
    #[slot(handle_ty)]
    pub handle: Value<'a>,
    pub handle_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.coro.size", format = "attr-dict `:` type($res)", results(res))]
pub struct CoroSizeOp<'a> {
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.coro.suspend", format = "$save `,` $final attr-dict `:` type($res)", results(res))]
pub struct CoroSuspendOp<'a> {
    #[slot(save_ty)]
    pub save: Value<'a>,
    #[slot(final_ty, name = "final")]
    pub final_: Value<'a>,
    #[dtype(is = token)]
    pub save_ty: Type<'a>,
    #[dtype(is = i1)]
    pub final_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.cos", format = "`(` $in `)` attr-dict `:` functional-type($in, $res)", results(res))]
pub struct CosOp<'a> {
    #[slot(res, name = "in")]
    pub in_: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.cosh", format = "`(` $in `)` attr-dict `:` functional-type($in, $res)", results(res))]
pub struct CoshOp<'a> {
    #[slot(res, name = "in")]
    pub in_: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.ctlz", results(res))]
pub struct CountLeadingZerosOp<'a> {
    #[slot(res, name = "in")]
    pub in_: Value<'a>,
    #[attr(int = "i1")]
    pub is_zero_poison: Attribute<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.cttz", results(res))]
pub struct CountTrailingZerosOp<'a> {
    #[slot(res, name = "in")]
    pub in_: Value<'a>,
    #[attr(int = "i1")]
    pub is_zero_poison: Attribute<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.ctpop", format = "`(` $in `)` attr-dict `:` functional-type($in, $res)", results(res))]
pub struct CtPopOp<'a> {
    #[slot(res, name = "in")]
    pub in_: Value<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.dso_local_equivalent", format = "$function_name attr-dict `:` qualified(type($res))", results(res))]
pub struct DSOLocalEquivalentOp<'a> {
    pub function_name: Attribute<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.dbg.declare")]
pub struct DbgDeclareOp<'a> {
    #[slot(addr_ty)]
    pub addr: Value<'a>,
    #[attr(name = "varInfo", dialect = "llvm.di_local_variable")]
    pub var_info: Attribute<'a>,
    #[attr(name = "locationExpr", dialect = "llvm.di_expression")]
    pub location_expr: Option<Attribute<'a>>,
    pub addr_ty: Type<'a>,
}

#[mlir::op("llvm.intr.dbg.label", format = "$label attr-dict")]
pub struct DbgLabelOp<'a> {
    #[attr(dialect = "llvm.di_label")]
    pub label: Attribute<'a>,
}

#[mlir::op("llvm.intr.dbg.value")]
pub struct DbgValueOp<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[attr(name = "varInfo", dialect = "llvm.di_local_variable")]
    pub var_info: Attribute<'a>,
    #[attr(name = "locationExpr", dialect = "llvm.di_expression")]
    pub location_expr: Option<Attribute<'a>>,
    pub value_ty: Type<'a>,
}

#[mlir::op("llvm.intr.debugtrap", format = "attr-dict")]
pub struct DebugTrap<'a> {
}

#[mlir::op("llvm.intr.eh.typeid.for", format = "$type_info attr-dict `:` functional-type($type_info, $res)", results(res))]
pub struct EhTypeidForOp<'a> {
    #[slot(type_info_ty)]
    pub type_info: Value<'a>,
    pub type_info_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.exp10", format = "`(` $in `)` attr-dict `:` functional-type($in, $res)", results(res))]
pub struct Exp10Op<'a> {
    #[slot(res, name = "in")]
    pub in_: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.exp2", format = "`(` $in `)` attr-dict `:` functional-type($in, $res)", results(res))]
pub struct Exp2Op<'a> {
    #[slot(res, name = "in")]
    pub in_: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.exp", format = "`(` $in `)` attr-dict `:` functional-type($in, $res)", results(res))]
pub struct ExpOp<'a> {
    #[slot(res, name = "in")]
    pub in_: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.expect", format = "$val `,` $expected attr-dict `:` type($val)", results(res))]
pub struct ExpectOp<'a> {
    #[slot(res)]
    pub val: Value<'a>,
    #[slot(res)]
    pub expected: Value<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.expect.with.probability", format = "$val `,` $expected `,` $prob attr-dict `:` type($val)", results(res))]
pub struct ExpectWithProbabilityOp<'a> {
    #[slot(res)]
    pub val: Value<'a>,
    #[slot(res)]
    pub expected: Value<'a>,
    #[attr(int = "f64")]
    pub prob: Attribute<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.extractelement", format = "$vector `[` $position `:` type($position) `]` attr-dict `:` type($vector)", results(res))]
pub struct ExtractElementOp<'a> {
    #[slot(vector_ty)]
    pub vector: Value<'a>,
    #[slot(position_ty)]
    pub position: Value<'a>,
    pub vector_ty: Type<'a>,
    pub position_ty: Type<'a>,
    #[dtype(el = vector_ty)]
    pub res: Type<'a>,
}

#[mlir::op("llvm.extractvalue", format = "$container `` $position attr-dict `:` type($container)", results(res))]
pub struct ExtractValueOp<'a> {
    #[slot(container_ty)]
    pub container: Value<'a>,
    #[attr(dense = "i64")]
    pub position: Attribute<'a>,
    pub container_ty: Type<'a>,
    #[dtype(field = container_ty)]
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.fabs", format = "`(` $in `)` attr-dict `:` functional-type($in, $res)", results(res))]
pub struct FAbsOp<'a> {
    #[slot(res, name = "in")]
    pub in_: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.fadd", format = "$lhs `,` $rhs attr-dict `:` type($res)", results(res))]
pub struct FAddOp<'a> {
    #[slot(res)]
    pub lhs: Value<'a>,
    #[slot(res)]
    pub rhs: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.ceil", format = "`(` $in `)` attr-dict `:` functional-type($in, $res)", results(res))]
pub struct FCeilOp<'a> {
    #[slot(res, name = "in")]
    pub in_: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.fcmp", results(res))]
pub struct FCmpOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(lhs_ty)]
    pub rhs: Value<'a>,
    #[attr(int = "i64")]
    pub predicate: FCmpPredicate,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub lhs_ty: Type<'a>,
    #[dtype(i1 = lhs_ty)]
    pub res: Type<'a>,
}

#[mlir::op("llvm.fdiv", format = "$lhs `,` $rhs attr-dict `:` type($res)", results(res))]
pub struct FDivOp<'a> {
    #[slot(res)]
    pub lhs: Value<'a>,
    #[slot(res)]
    pub rhs: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.floor", format = "`(` $in `)` attr-dict `:` functional-type($in, $res)", results(res))]
pub struct FFloorOp<'a> {
    #[slot(res, name = "in")]
    pub in_: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.fma", format = "`(` $a `,` $b `,` $c `)` attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct FMAOp<'a> {
    #[slot(res)]
    pub a: Value<'a>,
    #[slot(res)]
    pub b: Value<'a>,
    #[slot(res)]
    pub c: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.fmuladd", format = "`(` $a `,` $b `,` $c `)` attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct FMulAddOp<'a> {
    #[slot(res)]
    pub a: Value<'a>,
    #[slot(res)]
    pub b: Value<'a>,
    #[slot(res)]
    pub c: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.fmul", format = "$lhs `,` $rhs attr-dict `:` type($res)", results(res))]
pub struct FMulOp<'a> {
    #[slot(res)]
    pub lhs: Value<'a>,
    #[slot(res)]
    pub rhs: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.fneg", format = "$operand attr-dict `:` type($res)", results(res))]
pub struct FNegOp<'a> {
    #[slot(res)]
    pub operand: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.fpext", format = "$arg (`fastmath` `` $fastmathFlags^)? attr-dict `:` type($arg) `to` type($res)", results(res))]
pub struct FPExtOp<'a> {
    #[slot(arg_ty)]
    pub arg: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub arg_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.fptosi", format = "$arg attr-dict `:` type($arg) `to` type($res)", results(res))]
pub struct FPToSIOp<'a> {
    #[slot(arg_ty)]
    pub arg: Value<'a>,
    pub arg_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.fptoui", format = "$arg attr-dict `:` type($arg) `to` type($res)", results(res))]
pub struct FPToUIOp<'a> {
    #[slot(arg_ty)]
    pub arg: Value<'a>,
    pub arg_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.fptrunc", format = "$arg (`fastmath` `` $fastmathFlags^)? attr-dict `:` type($arg) `to` type($res)", results(res))]
pub struct FPTruncOp<'a> {
    #[slot(arg_ty)]
    pub arg: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub arg_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.frem", format = "$lhs `,` $rhs attr-dict `:` type($res)", results(res))]
pub struct FRemOp<'a> {
    #[slot(res)]
    pub lhs: Value<'a>,
    #[slot(res)]
    pub rhs: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.fsub", format = "$lhs `,` $rhs attr-dict `:` type($res)", results(res))]
pub struct FSubOp<'a> {
    #[slot(res)]
    pub lhs: Value<'a>,
    #[slot(res)]
    pub rhs: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.trunc", format = "`(` $in `)` attr-dict `:` functional-type($in, $res)", results(res))]
pub struct FTruncOp<'a> {
    #[slot(res, name = "in")]
    pub in_: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.fake.use", format = "$args attr-dict `:` type($args)")]
pub struct FakeUseOp<'a> {
    #[slot(args_ty)]
    pub args: Vec<Value<'a>>,
    pub args_ty: Vec<Type<'a>>,
}

#[mlir::op("llvm.fence", format = "(`syncscope` `(` $syncscope^ `)`)? $ordering attr-dict")]
pub struct FenceOp<'a> {
    #[attr(int = "i64")]
    pub ordering: AtomicOrdering,
    pub syncscope: Option<Attribute<'a>>,
}

#[mlir::op("llvm.intr.frexp", format = "`(` $val `)` attr-dict `:` functional-type($val, $res)", results(res))]
pub struct FractionExpOp<'a> {
    #[slot(val_ty)]
    pub val: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub val_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.freeze", format = "$val attr-dict `:` type($val)", results(res))]
pub struct FreezeOp<'a> {
    #[slot(res)]
    pub val: Value<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.fshl", format = "`(` $a `,` $b `,` $c `)` attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct FshlOp<'a> {
    #[slot(res)]
    pub a: Value<'a>,
    #[slot(res)]
    pub b: Value<'a>,
    #[slot(res)]
    pub c: Value<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.fshr", format = "`(` $a `,` $b `,` $c `)` attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct FshrOp<'a> {
    #[slot(res)]
    pub a: Value<'a>,
    #[slot(res)]
    pub b: Value<'a>,
    #[slot(res)]
    pub c: Value<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.getelementptr", results(res))]
pub struct GEPOp<'a> {
    #[slot(base_ty)]
    pub base: Value<'a>,
    #[slot(dynamic_indices_ty, name = "dynamicIndices")]
    pub dynamic_indices: Vec<Value<'a>>,
    #[attr(name = "rawConstantIndices", dense = "i32")]
    pub raw_constant_indices: Attribute<'a>,
    pub elem_type: Attribute<'a>,
    #[attr(name = "noWrapFlags", int = "i32", default = "0", bits = "/|/none=0;inbounds_flag=1;nusw=2;nuw=4;inbounds=3")]
    pub no_wrap_flags: Option<Attribute<'a>>,
    pub base_ty: Type<'a>,
    pub dynamic_indices_ty: Vec<Type<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.get.active.lane.mask", format = "$base `,` $n attr-dict `:` type($base) `,` type($n) `to` type($res)", results(res))]
pub struct GetActiveLaneMaskOp<'a> {
    #[slot(base_ty)]
    pub base: Value<'a>,
    #[slot(n_ty)]
    pub n: Value<'a>,
    pub base_ty: Type<'a>,
    pub n_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.mlir.global_ctors", format = "`ctors` `=` $ctors `,` `priorities` `=` $priorities `,` `data` `=` $data attr-dict")]
pub struct GlobalCtorsOp<'a> {
    pub ctors: Attribute<'a>,
    pub priorities: Attribute<'a>,
    pub data: Attribute<'a>,
}

#[mlir::op("llvm.mlir.global_dtors", format = "`dtors` `=` $dtors `,` `priorities` `=` $priorities `,` `data` `=` $data attr-dict")]
pub struct GlobalDtorsOp<'a> {
    pub dtors: Attribute<'a>,
    pub priorities: Attribute<'a>,
    pub data: Attribute<'a>,
}

#[mlir::op("llvm.mlir.global")]
pub struct GlobalOp<'a> {
    pub global_type: Attribute<'a>,
    pub constant: bool,
    pub sym_name: Attribute<'a>,
    #[attr(dialect = "llvm.linkage")]
    pub linkage: Attribute<'a>,
    pub dso_local: bool,
    pub thread_local_: bool,
    pub externally_initialized: bool,
    pub value: Option<Attribute<'a>>,
    #[attr(int = "i64")]
    pub alignment: Option<Attribute<'a>>,
    #[attr(int = "i32", default = "0")]
    pub addr_space: Option<Attribute<'a>>,
    #[attr(int = "i64")]
    pub unnamed_addr: Option<UnnamedAddr>,
    pub section: Option<Attribute<'a>>,
    pub comdat: Option<Attribute<'a>>,
    pub dbg_exprs: Option<Attribute<'a>>,
    #[attr(int = "i64", default = "0")]
    pub visibility_: Option<Visibility>,
    pub target_specific_attrs: Option<Attribute<'a>>,
    pub initializer: Region<'a>,
}

#[mlir::op("llvm.icmp", results(res))]
pub struct ICmpOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(lhs_ty)]
    pub rhs: Value<'a>,
    #[attr(int = "i64")]
    pub predicate: ICmpPredicate,
    pub lhs_ty: Type<'a>,
    #[dtype(i1 = lhs_ty)]
    pub res: Type<'a>,
}

#[mlir::op("llvm.mlir.ifunc")]
pub struct IFuncOp<'a> {
    #[attr(symbol)]
    pub sym_name: Attribute<'a>,
    pub i_func_type: Attribute<'a>,
    pub resolver: Attribute<'a>,
    pub resolver_type: Attribute<'a>,
    #[attr(dialect = "llvm.linkage")]
    pub linkage: Attribute<'a>,
    pub dso_local: bool,
    #[attr(int = "i32", default = "0")]
    pub address_space: Option<Attribute<'a>>,
    #[attr(int = "i64", default = "0")]
    pub unnamed_addr: Option<UnnamedAddr>,
    #[attr(int = "i64", default = "0")]
    pub visibility_: Option<Visibility>,
}

#[mlir::op("llvm.indirectbr")]
pub struct IndirectBrOp<'a> {
    #[slot(addr_ty)]
    pub addr: Value<'a>,
    #[slot(succ_operands_ty, name = "succOperands")]
    pub succ_operands: Vec<Value<'a>>,
    #[attr(dense = "i32")]
    pub indbr_operand_segments: Attribute<'a>,
    #[successor]
    pub successors: Vec<Str<'a>>,
    pub addr_ty: Type<'a>,
    pub succ_operands_ty: Vec<Type<'a>>,
}

#[mlir::op("llvm.inline_asm", format = "(`has_side_effects` $has_side_effects^)? (`is_align_stack` $is_align_stack^)? (`tail_call_kind` `=` $tail_call_kind^)? (`asm_dialect` `=` $asm_dialect^)? (`operand_attrs` `=` $operand_attrs^)? attr-dict $asm_string `,` $constraints $operands `:` functional-type($operands, $res)", results(res))]
pub struct InlineAsmOp<'a> {
    #[slot(operands_ty)]
    pub operands: Vec<Value<'a>>,
    pub asm_string: Attribute<'a>,
    pub constraints: Attribute<'a>,
    pub has_side_effects: bool,
    pub is_align_stack: bool,
    #[attr(dialect = "llvm.tailcallkind", default = "<none>")]
    pub tail_call_kind: Option<Attribute<'a>>,
    #[attr(int = "i64")]
    pub asm_dialect: Option<AsmDialect>,
    pub operand_attrs: Option<Attribute<'a>>,
    pub operands_ty: Vec<Type<'a>>,
    pub res: Vec<Type<'a>>,
}

#[mlir::op("llvm.insertelement", format = "$value `,` $vector `[` $position `:` type($position) `]` attr-dict `:` type($vector)", results(res))]
pub struct InsertElementOp<'a> {
    #[slot(res)]
    pub vector: Value<'a>,
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[slot(position_ty)]
    pub position: Value<'a>,
    #[dtype(el = res)]
    pub value_ty: Type<'a>,
    pub position_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.insertvalue", format = "$value `,` $container `` $position attr-dict `:` type($container)", results(res))]
pub struct InsertValueOp<'a> {
    #[slot(res)]
    pub container: Value<'a>,
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[attr(dense = "i64")]
    pub position: Attribute<'a>,
    #[dtype(field = res)]
    pub value_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.inttoptr", format = "$arg (`dereferenceable` `` $dereferenceable^)? attr-dict `:` type($arg) `to` type($res)", results(res))]
pub struct IntToPtrOp<'a> {
    #[slot(arg_ty)]
    pub arg: Value<'a>,
    #[attr(dialect = "llvm.dereferenceable")]
    pub dereferenceable: Option<Attribute<'a>>,
    pub arg_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.invariant.end", format = "$start `,` $size `,` $ptr attr-dict `:` qualified(type($ptr))")]
pub struct InvariantEndOp<'a> {
    #[slot(start_ty)]
    pub start: Value<'a>,
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    #[attr(int = "i64")]
    pub size: Attribute<'a>,
    #[dtype(is = "!llvm.ptr")]
    pub start_ty: Type<'a>,
    pub ptr_ty: Type<'a>,
}

#[mlir::op("llvm.intr.invariant.start", format = "$size `,` $ptr attr-dict `:` qualified(type($ptr))", results(res))]
pub struct InvariantStartOp<'a> {
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    #[attr(int = "i64")]
    pub size: Attribute<'a>,
    pub ptr_ty: Type<'a>,
    #[dtype(is = "!llvm.ptr")]
    pub res: Type<'a>,
}

#[mlir::op("llvm.invoke", results(result))]
pub struct InvokeOp<'a> {
    #[slot(callee_operands_ty)]
    pub callee_operands: Vec<Value<'a>>,
    #[slot(normal_dest_operands_ty, name = "normalDestOperands")]
    pub normal_dest_operands: Vec<Value<'a>>,
    #[slot(unwind_dest_operands_ty, name = "unwindDestOperands")]
    pub unwind_dest_operands: Vec<Value<'a>>,
    #[slot(op_bundle_operands_ty)]
    pub op_bundle_operands: Vec<Value<'a>>,
    pub var_callee_type: Option<Attribute<'a>>,
    pub callee: Option<Attribute<'a>>,
    pub arg_attrs: Option<Attribute<'a>>,
    pub res_attrs: Option<Attribute<'a>>,
    #[attr(dense = "i32")]
    pub branch_weights: Option<Attribute<'a>>,
    #[attr(name = "CConv", dialect = "llvm.cconv", default = "<ccc>")]
    pub c_conv: Option<Attribute<'a>>,
    #[attr(dense = "i32")]
    pub op_bundle_sizes: Attribute<'a>,
    pub op_bundle_tags: Option<Attribute<'a>>,
    #[successor(name = "normalDest")]
    pub normal_dest: Str<'a>,
    #[successor(name = "unwindDest")]
    pub unwind_dest: Str<'a>,
    pub callee_operands_ty: Vec<Type<'a>>,
    pub normal_dest_operands_ty: Vec<Type<'a>>,
    pub unwind_dest_operands_ty: Vec<Type<'a>>,
    pub op_bundle_operands_ty: Vec<Type<'a>>,
    pub result: Vec<Type<'a>>,
}

#[mlir::op("llvm.intr.is.constant", results(res))]
pub struct IsConstantOp<'a> {
    #[slot(val_ty)]
    pub val: Value<'a>,
    pub val_ty: Type<'a>,
    #[dtype(is = i1)]
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.is.fpclass", results(res))]
pub struct IsFPClass<'a> {
    #[slot(in_ty, name = "in")]
    pub in_: Value<'a>,
    #[attr(int = "i32")]
    pub bit: Attribute<'a>,
    pub in_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.func")]
pub struct LLVMFuncOp<'a> {
    pub sym_name: Attribute<'a>,
    pub sym_visibility: Option<Attribute<'a>>,
    pub function_type: Attribute<'a>,
    #[attr(dialect = "llvm.linkage", default = "<external>")]
    pub linkage: Option<Attribute<'a>>,
    pub dso_local: bool,
    #[attr(name = "CConv", dialect = "llvm.cconv", default = "<ccc>")]
    pub c_conv: Option<Attribute<'a>>,
    pub comdat: Option<Attribute<'a>>,
    pub convergent: bool,
    pub personality: Option<Attribute<'a>>,
    #[attr(name = "garbageCollector")]
    pub garbage_collector: Option<Attribute<'a>>,
    pub passthrough: Option<Attribute<'a>>,
    pub arg_attrs: Option<Attribute<'a>>,
    pub res_attrs: Option<Attribute<'a>>,
    #[attr(dialect = "llvm.function_entry_count")]
    pub function_entry_count: Option<Attribute<'a>>,
    #[attr(dialect = "llvm.memory_effects")]
    pub memory_effects: Option<Attribute<'a>>,
    #[attr(int = "i64", default = "0")]
    pub visibility_: Option<Visibility>,
    pub arm_streaming: bool,
    pub arm_locally_streaming: bool,
    pub arm_streaming_compatible: bool,
    pub arm_new_za: bool,
    pub arm_in_za: bool,
    pub arm_out_za: bool,
    pub arm_inout_za: bool,
    pub arm_preserves_za: bool,
    pub section: Option<Attribute<'a>>,
    #[attr(int = "i64")]
    pub unnamed_addr: Option<UnnamedAddr>,
    #[attr(int = "i64")]
    pub alignment: Option<Attribute<'a>>,
    #[attr(dialect = "llvm.vscale_range")]
    pub vscale_range: Option<Attribute<'a>>,
    #[attr(dialect = "llvm.framePointerKind")]
    pub frame_pointer: Option<Attribute<'a>>,
    pub target_cpu: Option<Attribute<'a>>,
    pub tune_cpu: Option<Attribute<'a>>,
    pub reciprocal_estimates: Option<Attribute<'a>>,
    pub prefer_vector_width: Option<Attribute<'a>>,
    #[attr(dialect = "llvm.target_features")]
    pub target_features: Option<Attribute<'a>>,
    pub no_signed_zeros_fp_math: Option<Attribute<'a>>,
    #[attr(dialect = "llvm.denormal_fpenv")]
    pub denormal_fpenv: Option<Attribute<'a>>,
    pub fp_contract: Option<Attribute<'a>>,
    pub instrument_function_entry: Option<Attribute<'a>>,
    pub instrument_function_exit: Option<Attribute<'a>>,
    pub no_inline: bool,
    pub always_inline: bool,
    pub inline_hint: bool,
    pub no_unwind: bool,
    pub will_return: bool,
    pub noreturn: bool,
    pub optimize_none: bool,
    pub returns_twice: bool,
    pub hot: bool,
    pub cold: bool,
    pub noduplicate: bool,
    pub no_caller_saved_registers: bool,
    pub nocallback: bool,
    pub modular_format: Option<Attribute<'a>>,
    pub nobuiltins: Option<Attribute<'a>>,
    #[attr(dense = "i32")]
    pub allocsize: Option<Attribute<'a>>,
    pub optsize: bool,
    pub minsize: bool,
    pub save_reg_params: bool,
    pub zero_call_used_regs: Option<Attribute<'a>>,
    pub default_func_attrs: Option<Attribute<'a>>,
    #[attr(dialect = "llvm.vec_type_hint")]
    pub vec_type_hint: Option<Attribute<'a>>,
    #[attr(dense = "i32")]
    pub work_group_size_hint: Option<Attribute<'a>>,
    #[attr(dense = "i32")]
    pub reqd_work_group_size: Option<Attribute<'a>>,
    #[attr(int = "i32")]
    pub intel_reqd_sub_group_size: Option<Attribute<'a>>,
    #[attr(dialect = "llvm.uwtableKind")]
    pub uwtable_kind: Option<Attribute<'a>>,
    pub use_sample_profile: Option<Attribute<'a>>,
    pub body: Region<'a>,
}

#[mlir::op("llvm.lshr", format = "(`exact` $isExact^)? $lhs `,` $rhs attr-dict `:` type($res)", results(res))]
pub struct LShrOp<'a> {
    #[slot(res)]
    pub lhs: Value<'a>,
    #[slot(res)]
    pub rhs: Value<'a>,
    #[attr(name = "isExact")]
    pub is_exact: bool,
    pub res: Type<'a>,
}

#[mlir::op("llvm.landingpad", results(res))]
pub struct LandingpadOp<'a> {
    #[slot(operand_ty)]
    pub operand: Vec<Value<'a>>,
    pub cleanup: bool,
    pub operand_ty: Vec<Type<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.launder.invariant.group", format = "$ptr attr-dict `:` qualified(type($ptr))", results(res))]
pub struct LaunderInvariantGroupOp<'a> {
    #[slot(res)]
    pub ptr: Value<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.lifetime.end", format = "$ptr attr-dict `:` qualified(type($ptr))")]
pub struct LifetimeEndOp<'a> {
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    pub ptr_ty: Type<'a>,
}

#[mlir::op("llvm.intr.lifetime.start", format = "$ptr attr-dict `:` qualified(type($ptr))")]
pub struct LifetimeStartOp<'a> {
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    pub ptr_ty: Type<'a>,
}

#[mlir::op("llvm.linker_options", format = "$options attr-dict")]
pub struct LinkerOptionsOp<'a> {
    pub options: Attribute<'a>,
}

#[mlir::op("llvm.intr.llrint", format = "`(` $val `)` attr-dict `:` functional-type($val, $res)", results(res))]
pub struct LlrintOp<'a> {
    #[slot(val_ty)]
    pub val: Value<'a>,
    pub val_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.llround", format = "`(` $val `)` attr-dict `:` functional-type($val, $res)", results(res))]
pub struct LlroundOp<'a> {
    #[slot(val_ty)]
    pub val: Value<'a>,
    pub val_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.ldexp", format = "`(` $val `,` $power `)` attr-dict `:` functional-type($val $power, $res)", results(res))]
pub struct LoadExpOp<'a> {
    #[slot(val_ty)]
    pub val: Value<'a>,
    #[slot(power_ty)]
    pub power: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub val_ty: Type<'a>,
    pub power_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.load", format = "(`volatile` $volatile_^)? $addr (`atomic` (`syncscope` `(` $syncscope^ `)`)? $ordering^)? (`invariant` $invariant^)? (`invariant_group` $invariantGroup^)? (`dereferenceable` `` $dereferenceable^)? attr-dict `:` qualified(type($addr)) `->` type($res)", results(res))]
pub struct LoadOp<'a> {
    #[slot(addr_ty)]
    pub addr: Value<'a>,
    #[attr(int = "i64")]
    pub alignment: Option<Attribute<'a>>,
    pub volatile_: bool,
    pub nontemporal: bool,
    pub invariant: bool,
    #[attr(name = "invariantGroup")]
    pub invariant_group: bool,
    #[attr(int = "i64", default = "0")]
    pub ordering: Option<AtomicOrdering>,
    pub syncscope: Option<Attribute<'a>>,
    #[attr(dialect = "llvm.dereferenceable")]
    pub dereferenceable: Option<Attribute<'a>>,
    pub access_groups: Option<Attribute<'a>>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    pub addr_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.log10", format = "`(` $in `)` attr-dict `:` functional-type($in, $res)", results(res))]
pub struct Log10Op<'a> {
    #[slot(res, name = "in")]
    pub in_: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.log2", format = "`(` $in `)` attr-dict `:` functional-type($in, $res)", results(res))]
pub struct Log2Op<'a> {
    #[slot(res, name = "in")]
    pub in_: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.log", format = "`(` $in `)` attr-dict `:` functional-type($in, $res)", results(res))]
pub struct LogOp<'a> {
    #[slot(res, name = "in")]
    pub in_: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.lrint", format = "`(` $val `)` attr-dict `:` functional-type($val, $res)", results(res))]
pub struct LrintOp<'a> {
    #[slot(val_ty)]
    pub val: Value<'a>,
    pub val_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.lround", format = "`(` $val `)` attr-dict `:` functional-type($val, $res)", results(res))]
pub struct LroundOp<'a> {
    #[slot(val_ty)]
    pub val: Value<'a>,
    pub val_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.masked.load", results(res))]
pub struct MaskedLoadOp<'a> {
    #[slot(data_ty)]
    pub data: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(pass_thru_ty)]
    pub pass_thru: Vec<Value<'a>>,
    #[attr(int = "i32")]
    pub alignment: Attribute<'a>,
    pub nontemporal: bool,
    pub data_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    pub pass_thru_ty: Vec<Type<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.masked.store", format = "$value `,` $data `,` $mask attr-dict `:` type($value) `,` type($mask) `into` qualified(type($data))")]
pub struct MaskedStoreOp<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[slot(data_ty)]
    pub data: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[attr(int = "i32")]
    pub alignment: Attribute<'a>,
    pub nontemporal: bool,
    pub value_ty: Type<'a>,
    pub data_ty: Type<'a>,
    pub mask_ty: Type<'a>,
}

#[mlir::op("llvm.intr.matrix.column.major.load", format = "$data `,` `<` `stride` `=` $stride `>` attr-dict`:` type($res) `from` qualified(type($data)) `stride` type($stride)", results(res))]
pub struct MatrixColumnMajorLoadOp<'a> {
    #[slot(data_ty)]
    pub data: Value<'a>,
    #[slot(stride_ty)]
    pub stride: Value<'a>,
    #[attr(name = "isVolatile", int = "i1")]
    pub is_volatile: Attribute<'a>,
    #[attr(int = "i32")]
    pub rows: Attribute<'a>,
    #[attr(int = "i32")]
    pub columns: Attribute<'a>,
    pub data_ty: Type<'a>,
    pub stride_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.matrix.column.major.store", format = "$matrix `,` $data `,` `<` `stride` `=` $stride `>` attr-dict`:` type($matrix) `to` qualified(type($data)) `stride` type($stride)")]
pub struct MatrixColumnMajorStoreOp<'a> {
    #[slot(matrix_ty)]
    pub matrix: Value<'a>,
    #[slot(data_ty)]
    pub data: Value<'a>,
    #[slot(stride_ty)]
    pub stride: Value<'a>,
    #[attr(name = "isVolatile", int = "i1")]
    pub is_volatile: Attribute<'a>,
    #[attr(int = "i32")]
    pub rows: Attribute<'a>,
    #[attr(int = "i32")]
    pub columns: Attribute<'a>,
    pub matrix_ty: Type<'a>,
    pub data_ty: Type<'a>,
    pub stride_ty: Type<'a>,
}

#[mlir::op("llvm.intr.matrix.multiply", format = "$lhs `,` $rhs attr-dict `:` `(` type($lhs) `,` type($rhs) `)` `->` type($res)", results(res))]
pub struct MatrixMultiplyOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[attr(int = "i32")]
    pub lhs_rows: Attribute<'a>,
    #[attr(int = "i32")]
    pub lhs_columns: Attribute<'a>,
    #[attr(int = "i32")]
    pub rhs_columns: Attribute<'a>,
    pub lhs_ty: Type<'a>,
    pub rhs_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.matrix.transpose", format = "$matrix attr-dict `:` type($matrix) `into` type($res)", results(res))]
pub struct MatrixTransposeOp<'a> {
    #[slot(matrix_ty)]
    pub matrix: Value<'a>,
    #[attr(int = "i32")]
    pub rows: Attribute<'a>,
    #[attr(int = "i32")]
    pub columns: Attribute<'a>,
    pub matrix_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.maxnum", format = "`(` $a `,` $b `)` attr-dict `:` functional-type($a $b, $res)", results(res))]
pub struct MaxNumOp<'a> {
    #[slot(res)]
    pub a: Value<'a>,
    #[slot(res)]
    pub b: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.maximum", format = "`(` $a `,` $b `)` attr-dict `:` functional-type($a $b, $res)", results(res))]
pub struct MaximumOp<'a> {
    #[slot(res)]
    pub a: Value<'a>,
    #[slot(res)]
    pub b: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.memcpy.inline")]
pub struct MemcpyInlineOp<'a> {
    #[slot(dst_ty)]
    pub dst: Value<'a>,
    #[slot(src_ty)]
    pub src: Value<'a>,
    pub len: Attribute<'a>,
    #[attr(name = "isVolatile", int = "i1")]
    pub is_volatile: Attribute<'a>,
    pub access_groups: Option<Attribute<'a>>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    pub arg_attrs: Option<Attribute<'a>>,
    pub res_attrs: Option<Attribute<'a>>,
    pub dst_ty: Type<'a>,
    pub src_ty: Type<'a>,
}

#[mlir::op("llvm.intr.memcpy")]
pub struct MemcpyOp<'a> {
    #[slot(dst_ty)]
    pub dst: Value<'a>,
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(len_ty)]
    pub len: Value<'a>,
    #[attr(name = "isVolatile", int = "i1")]
    pub is_volatile: Attribute<'a>,
    pub access_groups: Option<Attribute<'a>>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    pub arg_attrs: Option<Attribute<'a>>,
    pub res_attrs: Option<Attribute<'a>>,
    pub dst_ty: Type<'a>,
    pub src_ty: Type<'a>,
    pub len_ty: Type<'a>,
}

#[mlir::op("llvm.intr.memmove")]
pub struct MemmoveOp<'a> {
    #[slot(dst_ty)]
    pub dst: Value<'a>,
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(len_ty)]
    pub len: Value<'a>,
    #[attr(name = "isVolatile", int = "i1")]
    pub is_volatile: Attribute<'a>,
    pub access_groups: Option<Attribute<'a>>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    pub arg_attrs: Option<Attribute<'a>>,
    pub res_attrs: Option<Attribute<'a>>,
    pub dst_ty: Type<'a>,
    pub src_ty: Type<'a>,
    pub len_ty: Type<'a>,
}

#[mlir::op("llvm.intr.memset.inline")]
pub struct MemsetInlineOp<'a> {
    #[slot(dst_ty)]
    pub dst: Value<'a>,
    #[slot(val_ty)]
    pub val: Value<'a>,
    pub len: Attribute<'a>,
    #[attr(name = "isVolatile", int = "i1")]
    pub is_volatile: Attribute<'a>,
    pub access_groups: Option<Attribute<'a>>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    pub arg_attrs: Option<Attribute<'a>>,
    pub res_attrs: Option<Attribute<'a>>,
    pub dst_ty: Type<'a>,
    #[dtype(is = i8)]
    pub val_ty: Type<'a>,
}

#[mlir::op("llvm.intr.memset")]
pub struct MemsetOp<'a> {
    #[slot(dst_ty)]
    pub dst: Value<'a>,
    #[slot(val_ty)]
    pub val: Value<'a>,
    #[slot(len_ty)]
    pub len: Value<'a>,
    #[attr(name = "isVolatile", int = "i1")]
    pub is_volatile: Attribute<'a>,
    pub access_groups: Option<Attribute<'a>>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    pub arg_attrs: Option<Attribute<'a>>,
    pub res_attrs: Option<Attribute<'a>>,
    pub dst_ty: Type<'a>,
    #[dtype(is = i8)]
    pub val_ty: Type<'a>,
    pub len_ty: Type<'a>,
}

#[mlir::op("llvm.mlir.metadata_as_value", results(res))]
pub struct MetadataAsValueOp<'a> {
    pub metadata: Attribute<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.minnum", format = "`(` $a `,` $b `)` attr-dict `:` functional-type($a $b, $res)", results(res))]
pub struct MinNumOp<'a> {
    #[slot(res)]
    pub a: Value<'a>,
    #[slot(res)]
    pub b: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.minimum", format = "`(` $a `,` $b `)` attr-dict `:` functional-type($a $b, $res)", results(res))]
pub struct MinimumOp<'a> {
    #[slot(res)]
    pub a: Value<'a>,
    #[slot(res)]
    pub b: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.module_flags", format = "$flags attr-dict")]
pub struct ModuleFlagsOp<'a> {
    pub flags: Attribute<'a>,
}

#[mlir::op("llvm.mul", format = "$lhs `,` $rhs ($overflowFlags^)? attr-dict `:` type($res)", results(res))]
pub struct MulOp<'a> {
    #[slot(res)]
    pub lhs: Value<'a>,
    #[slot(res)]
    pub rhs: Value<'a>,
    #[attr(name = "overflowFlags", int = "i32", default = "0", bits = "overflow/, /none=0;nsw=1;nuw=2")]
    pub overflow_flags: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.named_metadata", format = "$metadata_name $nodes attr-dict")]
pub struct NamedMetadataOp<'a> {
    pub metadata_name: Attribute<'a>,
    pub nodes: Attribute<'a>,
}

#[mlir::op("llvm.intr.nearbyint", format = "`(` $in `)` attr-dict `:` functional-type($in, $res)", results(res))]
pub struct NearbyintOp<'a> {
    #[slot(res, name = "in")]
    pub in_: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.experimental.noalias.scope.decl", format = "$scope attr-dict")]
pub struct NoAliasScopeDeclOp<'a> {
    #[attr(dialect = "llvm.alias_scope")]
    pub scope: Attribute<'a>,
}

#[mlir::op("llvm.mlir.none", format = "attr-dict `:` type($res)", results(res))]
pub struct NoneTokenOp<'a> {
    #[dtype(is = token)]
    pub res: Type<'a>,
}

#[mlir::op("llvm.or", format = "(`disjoint` $isDisjoint^)? $lhs `,` $rhs attr-dict `:` type($res)", results(res))]
pub struct OrOp<'a> {
    #[slot(res)]
    pub lhs: Value<'a>,
    #[slot(res)]
    pub rhs: Value<'a>,
    #[attr(name = "isDisjoint")]
    pub is_disjoint: bool,
    pub res: Type<'a>,
}

#[mlir::op("llvm.mlir.poison", format = "attr-dict `:` type($res)", results(res))]
pub struct PoisonOp<'a> {
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.powi", format = "`(` $val `,` $power `)` attr-dict `:` functional-type($val $power, $res)", results(res))]
pub struct PowIOp<'a> {
    #[slot(val_ty)]
    pub val: Value<'a>,
    #[slot(power_ty)]
    pub power: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub val_ty: Type<'a>,
    pub power_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.pow", format = "`(` $a `,` $b `)` attr-dict `:` functional-type($a $b, $res)", results(res))]
pub struct PowOp<'a> {
    #[slot(res)]
    pub a: Value<'a>,
    #[slot(res)]
    pub b: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.prefetch")]
pub struct Prefetch<'a> {
    #[slot(addr_ty)]
    pub addr: Value<'a>,
    #[attr(int = "i32")]
    pub rw: Attribute<'a>,
    #[attr(int = "i32")]
    pub hint: Attribute<'a>,
    #[attr(int = "i32")]
    pub cache: Attribute<'a>,
    pub addr_ty: Type<'a>,
}

#[mlir::op("llvm.intr.ptr.annotation", results(res))]
pub struct PtrAnnotation<'a> {
    #[slot(res)]
    pub ptr: Value<'a>,
    #[slot(annotation_ty)]
    pub annotation: Value<'a>,
    #[slot(annotation_ty, name = "fileName")]
    pub file_name: Value<'a>,
    #[slot(line_ty)]
    pub line: Value<'a>,
    #[slot(annotation_ty)]
    pub attr: Value<'a>,
    pub annotation_ty: Type<'a>,
    #[dtype(is = i32)]
    pub line_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.ptrmask", format = "$ptr `,` $mask attr-dict `:` functional-type($ptr $mask, $res)", results(res))]
pub struct PtrMaskOp<'a> {
    #[slot(res)]
    pub ptr: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    pub mask_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.ptrtoaddr", format = "$arg attr-dict `:` type($arg) `to` type($res)", results(res))]
pub struct PtrToAddrOp<'a> {
    #[slot(arg_ty)]
    pub arg: Value<'a>,
    pub arg_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.ptrtoint", format = "$arg attr-dict `:` type($arg) `to` type($res)", results(res))]
pub struct PtrToIntOp<'a> {
    #[slot(arg_ty)]
    pub arg: Value<'a>,
    pub arg_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.resume", format = "$value attr-dict `:` type($value)")]
pub struct ResumeOp<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    pub value_ty: Type<'a>,
}

#[mlir::op("llvm.return", format = "attr-dict ($arg^ `:` type($arg))?")]
pub struct ReturnOp<'a> {
    #[slot(arg_ty)]
    pub arg: Vec<Value<'a>>,
    pub arg_ty: Vec<Type<'a>>,
}

#[mlir::op("llvm.intr.rint", format = "`(` $in `)` attr-dict `:` functional-type($in, $res)", results(res))]
pub struct RintOp<'a> {
    #[slot(res, name = "in")]
    pub in_: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.roundeven", format = "`(` $in `)` attr-dict `:` functional-type($in, $res)", results(res))]
pub struct RoundEvenOp<'a> {
    #[slot(res, name = "in")]
    pub in_: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.round", format = "`(` $in `)` attr-dict `:` functional-type($in, $res)", results(res))]
pub struct RoundOp<'a> {
    #[slot(res, name = "in")]
    pub in_: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.sadd.sat", format = "`(` $a `,` $b `)` attr-dict `:` functional-type($a $b, $res)", results(res))]
pub struct SAddSat<'a> {
    #[slot(res)]
    pub a: Value<'a>,
    #[slot(res)]
    pub b: Value<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.sadd.with.overflow", results(res))]
pub struct SAddWithOverflowOp<'a> {
    #[slot(operand0_ty)]
    pub operand0: Value<'a>,
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    pub operand0_ty: Type<'a>,
    pub operand1_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.scmp", format = "`(` $a `,` $b `)` attr-dict `:` functional-type($a $b, $res)", results(res))]
pub struct SCmpOp<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(a_ty)]
    pub b: Value<'a>,
    pub a_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.sdiv", format = "(`exact` $isExact^)? $lhs `,` $rhs attr-dict `:` type($res)", results(res))]
pub struct SDivOp<'a> {
    #[slot(res)]
    pub lhs: Value<'a>,
    #[slot(res)]
    pub rhs: Value<'a>,
    #[attr(name = "isExact")]
    pub is_exact: bool,
    pub res: Type<'a>,
}

#[mlir::op("llvm.sext", format = "$arg attr-dict `:` type($arg) `to` type($res)", results(res))]
pub struct SExtOp<'a> {
    #[slot(arg_ty)]
    pub arg: Value<'a>,
    pub arg_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.sitofp", format = "$arg attr-dict `:` type($arg) `to` type($res)", results(res))]
pub struct SIToFPOp<'a> {
    #[slot(arg_ty)]
    pub arg: Value<'a>,
    pub arg_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.smax", format = "`(` $a `,` $b `)` attr-dict `:` functional-type($a $b, $res)", results(res))]
pub struct SMaxOp<'a> {
    #[slot(res)]
    pub a: Value<'a>,
    #[slot(res)]
    pub b: Value<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.smin", format = "`(` $a `,` $b `)` attr-dict `:` functional-type($a $b, $res)", results(res))]
pub struct SMinOp<'a> {
    #[slot(res)]
    pub a: Value<'a>,
    #[slot(res)]
    pub b: Value<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.smul.with.overflow", results(res))]
pub struct SMulWithOverflowOp<'a> {
    #[slot(operand0_ty)]
    pub operand0: Value<'a>,
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    pub operand0_ty: Type<'a>,
    pub operand1_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.srem", format = "$lhs `,` $rhs attr-dict `:` type($res)", results(res))]
pub struct SRemOp<'a> {
    #[slot(res)]
    pub lhs: Value<'a>,
    #[slot(res)]
    pub rhs: Value<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.ssa.copy", format = "$operand attr-dict `:` type($operand)", results(res))]
pub struct SSACopyOp<'a> {
    #[slot(res)]
    pub operand: Value<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.sshl.sat", format = "`(` $a `,` $b `)` attr-dict `:` functional-type($a $b, $res)", results(res))]
pub struct SSHLSat<'a> {
    #[slot(res)]
    pub a: Value<'a>,
    #[slot(res)]
    pub b: Value<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.ssub.sat", format = "`(` $a `,` $b `)` attr-dict `:` functional-type($a $b, $res)", results(res))]
pub struct SSubSat<'a> {
    #[slot(res)]
    pub a: Value<'a>,
    #[slot(res)]
    pub b: Value<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.ssub.with.overflow", results(res))]
pub struct SSubWithOverflowOp<'a> {
    #[slot(operand0_ty)]
    pub operand0: Value<'a>,
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    pub operand0_ty: Type<'a>,
    pub operand1_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.select", format = "$condition `,` $trueValue `,` $falseValue attr-dict `:` type($condition) `,` type($res)", results(res))]
pub struct SelectOp<'a> {
    #[slot(condition_ty)]
    pub condition: Value<'a>,
    #[slot(res, name = "trueValue")]
    pub true_value: Value<'a>,
    #[slot(res, name = "falseValue")]
    pub false_value: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub condition_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.shl", format = "$lhs `,` $rhs ($overflowFlags^)? attr-dict `:` type($res)", results(res))]
pub struct ShlOp<'a> {
    #[slot(res)]
    pub lhs: Value<'a>,
    #[slot(res)]
    pub rhs: Value<'a>,
    #[attr(name = "overflowFlags", int = "i32", default = "0", bits = "overflow/, /none=0;nsw=1;nuw=2")]
    pub overflow_flags: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.shufflevector", results(res))]
pub struct ShuffleVectorOp<'a> {
    #[slot(v1_ty)]
    pub v1: Value<'a>,
    #[slot(v1_ty)]
    pub v2: Value<'a>,
    #[attr(dense = "i32")]
    pub mask: Attribute<'a>,
    pub v1_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.sin", format = "`(` $in `)` attr-dict `:` functional-type($in, $res)", results(res))]
pub struct SinOp<'a> {
    #[slot(res, name = "in")]
    pub in_: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.sincos", format = "`(` $val `)` attr-dict `:` functional-type($val, $res)", results(res))]
pub struct SincosOp<'a> {
    #[slot(val_ty)]
    pub val: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub val_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.sinh", format = "`(` $in `)` attr-dict `:` functional-type($in, $res)", results(res))]
pub struct SinhOp<'a> {
    #[slot(res, name = "in")]
    pub in_: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.sqrt", format = "`(` $in `)` attr-dict `:` functional-type($in, $res)", results(res))]
pub struct SqrtOp<'a> {
    #[slot(res, name = "in")]
    pub in_: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.stackrestore", format = "$ptr attr-dict `:` qualified(type($ptr))")]
pub struct StackRestoreOp<'a> {
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    pub ptr_ty: Type<'a>,
}

#[mlir::op("llvm.intr.stacksave", format = "attr-dict `:` qualified(type($res))", results(res))]
pub struct StackSaveOp<'a> {
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.stepvector", format = "attr-dict `:` type($res)", results(res))]
pub struct StepVectorOp<'a> {
    pub res: Type<'a>,
}

#[mlir::op("llvm.store", format = "(`volatile` $volatile_^)? $value `,` $addr (`atomic` (`syncscope` `(` $syncscope^ `)`)? $ordering^)? (`invariant_group` $invariantGroup^)? attr-dict `:` type($value) `,` qualified(type($addr))")]
pub struct StoreOp<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[slot(addr_ty)]
    pub addr: Value<'a>,
    #[attr(int = "i64")]
    pub alignment: Option<Attribute<'a>>,
    pub volatile_: bool,
    pub nontemporal: bool,
    #[attr(name = "invariantGroup")]
    pub invariant_group: bool,
    #[attr(int = "i64", default = "0")]
    pub ordering: Option<AtomicOrdering>,
    pub syncscope: Option<Attribute<'a>>,
    pub access_groups: Option<Attribute<'a>>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    pub value_ty: Type<'a>,
    pub addr_ty: Type<'a>,
}

#[mlir::op("llvm.intr.strip.invariant.group", format = "$ptr attr-dict `:` qualified(type($ptr))", results(res))]
pub struct StripInvariantGroupOp<'a> {
    #[slot(res)]
    pub ptr: Value<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.sub", format = "$lhs `,` $rhs ($overflowFlags^)? attr-dict `:` type($res)", results(res))]
pub struct SubOp<'a> {
    #[slot(res)]
    pub lhs: Value<'a>,
    #[slot(res)]
    pub rhs: Value<'a>,
    #[attr(name = "overflowFlags", int = "i32", default = "0", bits = "overflow/, /none=0;nsw=1;nuw=2")]
    pub overflow_flags: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.switch")]
pub struct SwitchOp<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[slot(default_operands_ty, name = "defaultOperands")]
    pub default_operands: Vec<Value<'a>>,
    #[slot(case_operands_ty, name = "caseOperands")]
    pub case_operands: Vec<Value<'a>>,
    pub case_values: Option<Attribute<'a>>,
    #[attr(dense = "i32")]
    pub case_operand_segments: Attribute<'a>,
    #[attr(dense = "i32")]
    pub branch_weights: Option<Attribute<'a>>,
    #[successor(name = "defaultDestination")]
    pub default_destination: Str<'a>,
    #[successor(name = "caseDestinations")]
    pub case_destinations: Vec<Str<'a>>,
    pub value_ty: Type<'a>,
    pub default_operands_ty: Vec<Type<'a>>,
    pub case_operands_ty: Vec<Type<'a>>,
}

#[mlir::op("llvm.intr.tan", format = "`(` $in `)` attr-dict `:` functional-type($in, $res)", results(res))]
pub struct TanOp<'a> {
    #[slot(res, name = "in")]
    pub in_: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.tanh", format = "`(` $in `)` attr-dict `:` functional-type($in, $res)", results(res))]
pub struct TanhOp<'a> {
    #[slot(res, name = "in")]
    pub in_: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.threadlocal.address", results(res))]
pub struct ThreadlocalAddressOp<'a> {
    #[slot(global_ty)]
    pub global: Value<'a>,
    pub global_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.trap", format = "attr-dict")]
pub struct Trap<'a> {
}

#[mlir::op("llvm.trunc", format = "$arg ($overflowFlags^)? attr-dict `:` type($arg) `to` type($res)", results(res))]
pub struct TruncOp<'a> {
    #[slot(arg_ty)]
    pub arg: Value<'a>,
    #[attr(name = "overflowFlags", int = "i32", default = "0", bits = "overflow/, /none=0;nsw=1;nuw=2")]
    pub overflow_flags: Option<Attribute<'a>>,
    pub arg_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.uadd.sat", format = "`(` $a `,` $b `)` attr-dict `:` functional-type($a $b, $res)", results(res))]
pub struct UAddSat<'a> {
    #[slot(res)]
    pub a: Value<'a>,
    #[slot(res)]
    pub b: Value<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.uadd.with.overflow", results(res))]
pub struct UAddWithOverflowOp<'a> {
    #[slot(operand0_ty)]
    pub operand0: Value<'a>,
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    pub operand0_ty: Type<'a>,
    pub operand1_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.ubsantrap")]
pub struct UBSanTrap<'a> {
    #[attr(name = "failureKind", int = "i8")]
    pub failure_kind: Attribute<'a>,
}

#[mlir::op("llvm.intr.ucmp", format = "`(` $a `,` $b `)` attr-dict `:` functional-type($a $b, $res)", results(res))]
pub struct UCmpOp<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(a_ty)]
    pub b: Value<'a>,
    pub a_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.udiv", format = "(`exact` $isExact^)? $lhs `,` $rhs attr-dict `:` type($res)", results(res))]
pub struct UDivOp<'a> {
    #[slot(res)]
    pub lhs: Value<'a>,
    #[slot(res)]
    pub rhs: Value<'a>,
    #[attr(name = "isExact")]
    pub is_exact: bool,
    pub res: Type<'a>,
}

#[mlir::op("llvm.uitofp", format = "(`nneg` $nonNeg^)? $arg attr-dict `:` type($arg) `to` type($res)", results(res))]
pub struct UIToFPOp<'a> {
    #[slot(arg_ty)]
    pub arg: Value<'a>,
    #[attr(name = "nonNeg")]
    pub non_neg: bool,
    pub arg_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.umax", format = "`(` $a `,` $b `)` attr-dict `:` functional-type($a $b, $res)", results(res))]
pub struct UMaxOp<'a> {
    #[slot(res)]
    pub a: Value<'a>,
    #[slot(res)]
    pub b: Value<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.umin", format = "`(` $a `,` $b `)` attr-dict `:` functional-type($a $b, $res)", results(res))]
pub struct UMinOp<'a> {
    #[slot(res)]
    pub a: Value<'a>,
    #[slot(res)]
    pub b: Value<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.umul.with.overflow", results(res))]
pub struct UMulWithOverflowOp<'a> {
    #[slot(operand0_ty)]
    pub operand0: Value<'a>,
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    pub operand0_ty: Type<'a>,
    pub operand1_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.urem", format = "$lhs `,` $rhs attr-dict `:` type($res)", results(res))]
pub struct URemOp<'a> {
    #[slot(res)]
    pub lhs: Value<'a>,
    #[slot(res)]
    pub rhs: Value<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.ushl.sat", format = "`(` $a `,` $b `)` attr-dict `:` functional-type($a $b, $res)", results(res))]
pub struct USHLSat<'a> {
    #[slot(res)]
    pub a: Value<'a>,
    #[slot(res)]
    pub b: Value<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.usub.sat", format = "`(` $a `,` $b `)` attr-dict `:` functional-type($a $b, $res)", results(res))]
pub struct USubSat<'a> {
    #[slot(res)]
    pub a: Value<'a>,
    #[slot(res)]
    pub b: Value<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.usub.with.overflow", results(res))]
pub struct USubWithOverflowOp<'a> {
    #[slot(operand0_ty)]
    pub operand0: Value<'a>,
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    pub operand0_ty: Type<'a>,
    pub operand1_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.mlir.undef", format = "attr-dict `:` type($res)", results(res))]
pub struct UndefOp<'a> {
    pub res: Type<'a>,
}

#[mlir::op("llvm.unreachable", format = "attr-dict")]
pub struct UnreachableOp<'a> {
}

#[mlir::op("llvm.intr.vp.ashr", results(res))]
pub struct VPAShrOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub lhs_ty: Type<'a>,
    pub rhs_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.add", results(res))]
pub struct VPAddOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub lhs_ty: Type<'a>,
    pub rhs_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.and", results(res))]
pub struct VPAndOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub lhs_ty: Type<'a>,
    pub rhs_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.fadd", results(res))]
pub struct VPFAddOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub lhs_ty: Type<'a>,
    pub rhs_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.fdiv", results(res))]
pub struct VPFDivOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub lhs_ty: Type<'a>,
    pub rhs_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.fmuladd", results(res))]
pub struct VPFMulAddOp<'a> {
    #[slot(op1_ty)]
    pub op1: Value<'a>,
    #[slot(op2_ty)]
    pub op2: Value<'a>,
    #[slot(op3_ty)]
    pub op3: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub op1_ty: Type<'a>,
    pub op2_ty: Type<'a>,
    pub op3_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.fmul", results(res))]
pub struct VPFMulOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub lhs_ty: Type<'a>,
    pub rhs_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.fneg", results(res))]
pub struct VPFNegOp<'a> {
    #[slot(op_ty)]
    pub op: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub op_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.fpext", results(res))]
pub struct VPFPExtOp<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub src_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.fptosi", results(res))]
pub struct VPFPToSIOp<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub src_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.fptoui", results(res))]
pub struct VPFPToUIOp<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub src_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.fptrunc", results(res))]
pub struct VPFPTruncOp<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub src_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.frem", results(res))]
pub struct VPFRemOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub lhs_ty: Type<'a>,
    pub rhs_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.fsub", results(res))]
pub struct VPFSubOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub lhs_ty: Type<'a>,
    pub rhs_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.fma", results(res))]
pub struct VPFmaOp<'a> {
    #[slot(op1_ty)]
    pub op1: Value<'a>,
    #[slot(op2_ty)]
    pub op2: Value<'a>,
    #[slot(op3_ty)]
    pub op3: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub op1_ty: Type<'a>,
    pub op2_ty: Type<'a>,
    pub op3_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.inttoptr", results(res))]
pub struct VPIntToPtrOp<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub src_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.lshr", results(res))]
pub struct VPLShrOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub lhs_ty: Type<'a>,
    pub rhs_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.load", results(res))]
pub struct VPLoadOp<'a> {
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub ptr_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.merge", results(res))]
pub struct VPMergeMinOp<'a> {
    #[slot(cond_ty)]
    pub cond: Value<'a>,
    #[slot(true_val_ty)]
    pub true_val: Value<'a>,
    #[slot(false_val_ty)]
    pub false_val: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub cond_ty: Type<'a>,
    pub true_val_ty: Type<'a>,
    pub false_val_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.mul", results(res))]
pub struct VPMulOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub lhs_ty: Type<'a>,
    pub rhs_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.or", results(res))]
pub struct VPOrOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub lhs_ty: Type<'a>,
    pub rhs_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.ptrtoint", results(res))]
pub struct VPPtrToIntOp<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub src_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.reduce.add", results(res))]
pub struct VPReduceAddOp<'a> {
    #[slot(satrt_value_ty)]
    pub satrt_value: Value<'a>,
    #[slot(val_ty)]
    pub val: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub satrt_value_ty: Type<'a>,
    pub val_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.reduce.and", results(res))]
pub struct VPReduceAndOp<'a> {
    #[slot(satrt_value_ty)]
    pub satrt_value: Value<'a>,
    #[slot(val_ty)]
    pub val: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub satrt_value_ty: Type<'a>,
    pub val_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.reduce.fadd", results(res))]
pub struct VPReduceFAddOp<'a> {
    #[slot(satrt_value_ty)]
    pub satrt_value: Value<'a>,
    #[slot(val_ty)]
    pub val: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub satrt_value_ty: Type<'a>,
    pub val_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.reduce.fmax", results(res))]
pub struct VPReduceFMaxOp<'a> {
    #[slot(satrt_value_ty)]
    pub satrt_value: Value<'a>,
    #[slot(val_ty)]
    pub val: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub satrt_value_ty: Type<'a>,
    pub val_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.reduce.fmin", results(res))]
pub struct VPReduceFMinOp<'a> {
    #[slot(satrt_value_ty)]
    pub satrt_value: Value<'a>,
    #[slot(val_ty)]
    pub val: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub satrt_value_ty: Type<'a>,
    pub val_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.reduce.fmul", results(res))]
pub struct VPReduceFMulOp<'a> {
    #[slot(satrt_value_ty)]
    pub satrt_value: Value<'a>,
    #[slot(val_ty)]
    pub val: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub satrt_value_ty: Type<'a>,
    pub val_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.reduce.mul", results(res))]
pub struct VPReduceMulOp<'a> {
    #[slot(satrt_value_ty)]
    pub satrt_value: Value<'a>,
    #[slot(val_ty)]
    pub val: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub satrt_value_ty: Type<'a>,
    pub val_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.reduce.or", results(res))]
pub struct VPReduceOrOp<'a> {
    #[slot(satrt_value_ty)]
    pub satrt_value: Value<'a>,
    #[slot(val_ty)]
    pub val: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub satrt_value_ty: Type<'a>,
    pub val_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.reduce.smax", results(res))]
pub struct VPReduceSMaxOp<'a> {
    #[slot(satrt_value_ty)]
    pub satrt_value: Value<'a>,
    #[slot(val_ty)]
    pub val: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub satrt_value_ty: Type<'a>,
    pub val_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.reduce.smin", results(res))]
pub struct VPReduceSMinOp<'a> {
    #[slot(satrt_value_ty)]
    pub satrt_value: Value<'a>,
    #[slot(val_ty)]
    pub val: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub satrt_value_ty: Type<'a>,
    pub val_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.reduce.umax", results(res))]
pub struct VPReduceUMaxOp<'a> {
    #[slot(satrt_value_ty)]
    pub satrt_value: Value<'a>,
    #[slot(val_ty)]
    pub val: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub satrt_value_ty: Type<'a>,
    pub val_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.reduce.umin", results(res))]
pub struct VPReduceUMinOp<'a> {
    #[slot(satrt_value_ty)]
    pub satrt_value: Value<'a>,
    #[slot(val_ty)]
    pub val: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub satrt_value_ty: Type<'a>,
    pub val_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.reduce.xor", results(res))]
pub struct VPReduceXorOp<'a> {
    #[slot(satrt_value_ty)]
    pub satrt_value: Value<'a>,
    #[slot(val_ty)]
    pub val: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub satrt_value_ty: Type<'a>,
    pub val_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.sdiv", results(res))]
pub struct VPSDivOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub lhs_ty: Type<'a>,
    pub rhs_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.sext", results(res))]
pub struct VPSExtOp<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub src_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.sitofp", results(res))]
pub struct VPSIToFPOp<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub src_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.smax", results(res))]
pub struct VPSMaxOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub lhs_ty: Type<'a>,
    pub rhs_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.smin", results(res))]
pub struct VPSMinOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub lhs_ty: Type<'a>,
    pub rhs_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.srem", results(res))]
pub struct VPSRemOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub lhs_ty: Type<'a>,
    pub rhs_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.select", results(res))]
pub struct VPSelectMinOp<'a> {
    #[slot(cond_ty)]
    pub cond: Value<'a>,
    #[slot(true_val_ty)]
    pub true_val: Value<'a>,
    #[slot(false_val_ty)]
    pub false_val: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub cond_ty: Type<'a>,
    pub true_val_ty: Type<'a>,
    pub false_val_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.shl", results(res))]
pub struct VPShlOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub lhs_ty: Type<'a>,
    pub rhs_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.store")]
pub struct VPStoreOp<'a> {
    #[slot(val_ty)]
    pub val: Value<'a>,
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub val_ty: Type<'a>,
    pub ptr_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
}

#[mlir::op("llvm.intr.experimental.vp.strided.load", results(res))]
pub struct VPStridedLoadOp<'a> {
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    #[slot(stride_ty)]
    pub stride: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub ptr_ty: Type<'a>,
    pub stride_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.experimental.vp.strided.store")]
pub struct VPStridedStoreOp<'a> {
    #[slot(val_ty)]
    pub val: Value<'a>,
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    #[slot(stride_ty)]
    pub stride: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub val_ty: Type<'a>,
    pub ptr_ty: Type<'a>,
    pub stride_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
}

#[mlir::op("llvm.intr.vp.sub", results(res))]
pub struct VPSubOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub lhs_ty: Type<'a>,
    pub rhs_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.trunc", results(res))]
pub struct VPTruncOp<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub src_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.udiv", results(res))]
pub struct VPUDivOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub lhs_ty: Type<'a>,
    pub rhs_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.uitofp", results(res))]
pub struct VPUIToFPOp<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub src_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.umax", results(res))]
pub struct VPUMaxOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub lhs_ty: Type<'a>,
    pub rhs_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.umin", results(res))]
pub struct VPUMinOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub lhs_ty: Type<'a>,
    pub rhs_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.urem", results(res))]
pub struct VPURemOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub lhs_ty: Type<'a>,
    pub rhs_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.xor", results(res))]
pub struct VPXorOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub lhs_ty: Type<'a>,
    pub rhs_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vp.zext", results(res))]
pub struct VPZExtOp<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(evl_ty)]
    pub evl: Value<'a>,
    pub src_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = i32)]
    pub evl_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.va_arg", format = "$arg attr-dict `:` functional-type($arg, $res)", results(res))]
pub struct VaArgOp<'a> {
    #[slot(arg_ty)]
    pub arg: Value<'a>,
    pub arg_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vacopy", format = "$src_list `to` $dest_list attr-dict `:` qualified(type($dest_list)) `,` qualified(type($src_list))")]
pub struct VaCopyOp<'a> {
    #[slot(dest_list_ty)]
    pub dest_list: Value<'a>,
    #[slot(src_list_ty)]
    pub src_list: Value<'a>,
    pub dest_list_ty: Type<'a>,
    pub src_list_ty: Type<'a>,
}

#[mlir::op("llvm.intr.vaend", format = "$arg_list attr-dict `:` qualified(type($arg_list))")]
pub struct VaEndOp<'a> {
    #[slot(arg_list_ty)]
    pub arg_list: Value<'a>,
    pub arg_list_ty: Type<'a>,
}

#[mlir::op("llvm.intr.vastart", format = "$arg_list attr-dict `:` qualified(type($arg_list))")]
pub struct VaStartOp<'a> {
    #[slot(arg_list_ty)]
    pub arg_list: Value<'a>,
    pub arg_list_ty: Type<'a>,
}

#[mlir::op("llvm.intr.var.annotation")]
pub struct VarAnnotation<'a> {
    #[slot(val_ty)]
    pub val: Value<'a>,
    #[slot(annotation_ty)]
    pub annotation: Value<'a>,
    #[slot(annotation_ty, name = "fileName")]
    pub file_name: Value<'a>,
    #[slot(line_ty)]
    pub line: Value<'a>,
    #[slot(annotation_ty)]
    pub attr: Value<'a>,
    pub val_ty: Type<'a>,
    pub annotation_ty: Type<'a>,
    #[dtype(is = i32)]
    pub line_ty: Type<'a>,
}

#[mlir::op("llvm.xor", format = "$lhs `,` $rhs attr-dict `:` type($res)", results(res))]
pub struct XOrOp<'a> {
    #[slot(res)]
    pub lhs: Value<'a>,
    #[slot(res)]
    pub rhs: Value<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.zext", format = "(`nneg` $nonNeg^)? $arg attr-dict `:` type($arg) `to` type($res)", results(res))]
pub struct ZExtOp<'a> {
    #[slot(arg_ty)]
    pub arg: Value<'a>,
    #[attr(name = "nonNeg")]
    pub non_neg: bool,
    pub arg_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.mlir.zero", format = "attr-dict `:` type($res)", results(res))]
pub struct ZeroOp<'a> {
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.masked.compressstore")]
pub struct masked_compressstore<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    pub arg_attrs: Option<Attribute<'a>>,
    pub res_attrs: Option<Attribute<'a>>,
    pub value_ty: Type<'a>,
    pub ptr_ty: Type<'a>,
    pub mask_ty: Type<'a>,
}

#[mlir::op("llvm.intr.masked.expandload", results(res))]
pub struct masked_expandload<'a> {
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(passthru_ty)]
    pub passthru: Value<'a>,
    pub arg_attrs: Option<Attribute<'a>>,
    pub res_attrs: Option<Attribute<'a>>,
    pub ptr_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    pub passthru_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.masked.gather", results(res))]
pub struct masked_gather<'a> {
    #[slot(ptrs_ty)]
    pub ptrs: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(pass_thru_ty)]
    pub pass_thru: Vec<Value<'a>>,
    #[attr(int = "i32")]
    pub alignment: Attribute<'a>,
    pub ptrs_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    pub pass_thru_ty: Vec<Type<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.masked.scatter", format = "$value `,` $ptrs `,` $mask attr-dict `:` type($value) `,` type($mask) `into` type($ptrs)")]
pub struct masked_scatter<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[slot(ptrs_ty)]
    pub ptrs: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[attr(int = "i32")]
    pub alignment: Attribute<'a>,
    pub value_ty: Type<'a>,
    pub ptrs_ty: Type<'a>,
    pub mask_ty: Type<'a>,
}

#[mlir::op("llvm.intr.vector.deinterleave2", results(res))]
pub struct vector_deinterleave2<'a> {
    #[slot(vec_ty)]
    pub vec: Value<'a>,
    pub vec_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vector.extract", format = "$srcvec `[` $pos `]` attr-dict `:` type($res) `from` type($srcvec)", results(res))]
pub struct vector_extract<'a> {
    #[slot(srcvec_ty)]
    pub srcvec: Value<'a>,
    #[attr(int = "i64")]
    pub pos: Attribute<'a>,
    pub srcvec_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vector.insert", format = "$srcvec `,` $dstvec `[` $pos `]` attr-dict `:` type($srcvec) `into` type($res)", results(res))]
pub struct vector_insert<'a> {
    #[slot(res)]
    pub dstvec: Value<'a>,
    #[slot(srcvec_ty)]
    pub srcvec: Value<'a>,
    #[attr(int = "i64")]
    pub pos: Attribute<'a>,
    pub srcvec_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vector.interleave2", results(res))]
pub struct vector_interleave2<'a> {
    #[slot(vec1_ty)]
    pub vec1: Value<'a>,
    #[slot(vec1_ty)]
    pub vec2: Value<'a>,
    pub vec1_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vector.reduce.add", results(res))]
pub struct vector_reduce_add<'a> {
    #[slot(in_ty, name = "in")]
    pub in_: Value<'a>,
    pub in_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vector.reduce.and", results(res))]
pub struct vector_reduce_and<'a> {
    #[slot(in_ty, name = "in")]
    pub in_: Value<'a>,
    pub in_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vector.reduce.fadd", results(res))]
pub struct vector_reduce_fadd<'a> {
    #[slot(start_value_ty)]
    pub start_value: Value<'a>,
    #[slot(input_ty)]
    pub input: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub start_value_ty: Type<'a>,
    pub input_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vector.reduce.fmax", format = "`(` $in `)` attr-dict `:` functional-type($in, $res)", results(res))]
pub struct vector_reduce_fmax<'a> {
    #[slot(in_ty, name = "in")]
    pub in_: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub in_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vector.reduce.fmaximum", format = "`(` $in `)` attr-dict `:` functional-type($in, $res)", results(res))]
pub struct vector_reduce_fmaximum<'a> {
    #[slot(in_ty, name = "in")]
    pub in_: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub in_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vector.reduce.fmin", format = "`(` $in `)` attr-dict `:` functional-type($in, $res)", results(res))]
pub struct vector_reduce_fmin<'a> {
    #[slot(in_ty, name = "in")]
    pub in_: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub in_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vector.reduce.fminimum", format = "`(` $in `)` attr-dict `:` functional-type($in, $res)", results(res))]
pub struct vector_reduce_fminimum<'a> {
    #[slot(in_ty, name = "in")]
    pub in_: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub in_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vector.reduce.fmul", results(res))]
pub struct vector_reduce_fmul<'a> {
    #[slot(start_value_ty)]
    pub start_value: Value<'a>,
    #[slot(input_ty)]
    pub input: Value<'a>,
    #[attr(name = "fastmathFlags", dialect = "llvm.fastmath", default = "<none>")]
    pub fastmath_flags: Option<Attribute<'a>>,
    pub start_value_ty: Type<'a>,
    pub input_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vector.reduce.mul", results(res))]
pub struct vector_reduce_mul<'a> {
    #[slot(in_ty, name = "in")]
    pub in_: Value<'a>,
    pub in_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vector.reduce.or", results(res))]
pub struct vector_reduce_or<'a> {
    #[slot(in_ty, name = "in")]
    pub in_: Value<'a>,
    pub in_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vector.reduce.smax", results(res))]
pub struct vector_reduce_smax<'a> {
    #[slot(in_ty, name = "in")]
    pub in_: Value<'a>,
    pub in_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vector.reduce.smin", results(res))]
pub struct vector_reduce_smin<'a> {
    #[slot(in_ty, name = "in")]
    pub in_: Value<'a>,
    pub in_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vector.reduce.umax", results(res))]
pub struct vector_reduce_umax<'a> {
    #[slot(in_ty, name = "in")]
    pub in_: Value<'a>,
    pub in_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vector.reduce.umin", results(res))]
pub struct vector_reduce_umin<'a> {
    #[slot(in_ty, name = "in")]
    pub in_: Value<'a>,
    pub in_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vector.reduce.xor", results(res))]
pub struct vector_reduce_xor<'a> {
    #[slot(in_ty, name = "in")]
    pub in_: Value<'a>,
    pub in_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("llvm.intr.vscale", results(res))]
pub struct vscale<'a> {
    pub res: Type<'a>,
}

#[mlir::dialect(
    "llvm",
    ops = [ACosOp, AShrOp, ASinOp, ATan2Op, ATanOp, AbsOp, AddOp, AddrSpaceCastOp, AddressOfOp, AliasOp, AllocaOp, AndOp, Annotation, ArithmeticFenceOp, AssumeOp, AtomicCmpXchgOp, AtomicRMWOp, BitReverseOp, BitcastOp, BlockAddressOp, BlockTagOp, BrOp, ByteSwapOp, CallIntrinsicOp, CallOp, ComdatOp, ComdatSelectorOp, CondBrOp, ConstantOp, ConstrainedFAddIntr, ConstrainedFDivIntr, ConstrainedFMAIntr, ConstrainedFMulAddIntr, ConstrainedFMulIntr, ConstrainedFPExtIntr, ConstrainedFPTruncIntr, ConstrainedFRemIntr, ConstrainedFSubIntr, ConstrainedSIToFP, ConstrainedUIToFP, CopySignOp, CoroAlignOp, CoroBeginOp, CoroEndOp, CoroFreeOp, CoroIdOp, CoroPromiseOp, CoroResumeOp, CoroSaveOp, CoroSizeOp, CoroSuspendOp, CosOp, CoshOp, CountLeadingZerosOp, CountTrailingZerosOp, CtPopOp, DSOLocalEquivalentOp, DbgDeclareOp, DbgLabelOp, DbgValueOp, DebugTrap, EhTypeidForOp, Exp10Op, Exp2Op, ExpOp, ExpectOp, ExpectWithProbabilityOp, ExtractElementOp, ExtractValueOp, FAbsOp, FAddOp, FCeilOp, FCmpOp, FDivOp, FFloorOp, FMAOp, FMulAddOp, FMulOp, FNegOp, FPExtOp, FPToSIOp, FPToUIOp, FPTruncOp, FRemOp, FSubOp, FTruncOp, FakeUseOp, FenceOp, FractionExpOp, FreezeOp, FshlOp, FshrOp, GEPOp, GetActiveLaneMaskOp, GlobalCtorsOp, GlobalDtorsOp, GlobalOp, ICmpOp, IFuncOp, IndirectBrOp, InlineAsmOp, InsertElementOp, InsertValueOp, IntToPtrOp, InvariantEndOp, InvariantStartOp, InvokeOp, IsConstantOp, IsFPClass, LLVMFuncOp, LShrOp, LandingpadOp, LaunderInvariantGroupOp, LifetimeEndOp, LifetimeStartOp, LinkerOptionsOp, LlrintOp, LlroundOp, LoadExpOp, LoadOp, Log10Op, Log2Op, LogOp, LrintOp, LroundOp, MaskedLoadOp, MaskedStoreOp, MatrixColumnMajorLoadOp, MatrixColumnMajorStoreOp, MatrixMultiplyOp, MatrixTransposeOp, MaxNumOp, MaximumOp, MemcpyInlineOp, MemcpyOp, MemmoveOp, MemsetInlineOp, MemsetOp, MetadataAsValueOp, MinNumOp, MinimumOp, ModuleFlagsOp, MulOp, NamedMetadataOp, NearbyintOp, NoAliasScopeDeclOp, NoneTokenOp, OrOp, PoisonOp, PowIOp, PowOp, Prefetch, PtrAnnotation, PtrMaskOp, PtrToAddrOp, PtrToIntOp, ResumeOp, ReturnOp, RintOp, RoundEvenOp, RoundOp, SAddSat, SAddWithOverflowOp, SCmpOp, SDivOp, SExtOp, SIToFPOp, SMaxOp, SMinOp, SMulWithOverflowOp, SRemOp, SSACopyOp, SSHLSat, SSubSat, SSubWithOverflowOp, SelectOp, ShlOp, ShuffleVectorOp, SinOp, SincosOp, SinhOp, SqrtOp, StackRestoreOp, StackSaveOp, StepVectorOp, StoreOp, StripInvariantGroupOp, SubOp, SwitchOp, TanOp, TanhOp, ThreadlocalAddressOp, Trap, TruncOp, UAddSat, UAddWithOverflowOp, UBSanTrap, UCmpOp, UDivOp, UIToFPOp, UMaxOp, UMinOp, UMulWithOverflowOp, URemOp, USHLSat, USubSat, USubWithOverflowOp, UndefOp, UnreachableOp, VPAShrOp, VPAddOp, VPAndOp, VPFAddOp, VPFDivOp, VPFMulAddOp, VPFMulOp, VPFNegOp, VPFPExtOp, VPFPToSIOp, VPFPToUIOp, VPFPTruncOp, VPFRemOp, VPFSubOp, VPFmaOp, VPIntToPtrOp, VPLShrOp, VPLoadOp, VPMergeMinOp, VPMulOp, VPOrOp, VPPtrToIntOp, VPReduceAddOp, VPReduceAndOp, VPReduceFAddOp, VPReduceFMaxOp, VPReduceFMinOp, VPReduceFMulOp, VPReduceMulOp, VPReduceOrOp, VPReduceSMaxOp, VPReduceSMinOp, VPReduceUMaxOp, VPReduceUMinOp, VPReduceXorOp, VPSDivOp, VPSExtOp, VPSIToFPOp, VPSMaxOp, VPSMinOp, VPSRemOp, VPSelectMinOp, VPShlOp, VPStoreOp, VPStridedLoadOp, VPStridedStoreOp, VPSubOp, VPTruncOp, VPUDivOp, VPUIToFPOp, VPUMaxOp, VPUMinOp, VPURemOp, VPXorOp, VPZExtOp, VaArgOp, VaCopyOp, VaEndOp, VaStartOp, VarAnnotation, XOrOp, ZExtOp, ZeroOp, masked_compressstore, masked_expandload, masked_gather, masked_scatter, vector_deinterleave2, vector_extract, vector_insert, vector_interleave2, vector_reduce_add, vector_reduce_and, vector_reduce_fadd, vector_reduce_fmax, vector_reduce_fmaximum, vector_reduce_fmin, vector_reduce_fminimum, vector_reduce_fmul, vector_reduce_mul, vector_reduce_or, vector_reduce_smax, vector_reduce_smin, vector_reduce_umax, vector_reduce_umin, vector_reduce_xor, vscale],
    materializer
)]
pub struct LlvmDialect;
