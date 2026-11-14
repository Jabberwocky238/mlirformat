#![allow(non_camel_case_types, unused_imports, clippy::all, rustdoc::all)]

use mlirformat::{mlir, Attribute, Region, Str, Type, Value, __Vec as Vec};

#[derive(Debug, Clone, Copy, PartialEq, Eq, mlirformat::__serde::Serialize, mlirformat::__serde::Deserialize, mlir::Cases)]
#[serde(crate = "mlirformat::__serde")]
pub enum AtomicRMWKind {
    #[serde(rename = "addf")]
    Addf,
    #[serde(rename = "addi")]
    Addi,
    #[serde(rename = "andi")]
    Andi,
    #[serde(rename = "assign")]
    Assign,
    #[serde(rename = "maximumf")]
    Maximumf,
    #[serde(rename = "maxnumf")]
    Maxnumf,
    #[serde(rename = "maxs")]
    Maxs,
    #[serde(rename = "maxu")]
    Maxu,
    #[serde(rename = "minimumf")]
    Minimumf,
    #[serde(rename = "minnumf")]
    Minnumf,
    #[serde(rename = "mins")]
    Mins,
    #[serde(rename = "minu")]
    Minu,
    #[serde(rename = "mulf")]
    Mulf,
    #[serde(rename = "muli")]
    Muli,
    #[serde(rename = "ori")]
    Ori,
    #[serde(rename = "xori")]
    Xori,
}

#[mlir::op("xegpu.alloc_nbarrier", format = "$nbarrier_num attr-dict")]
pub struct AllocNbarrierOp<'a> {
    #[attr(int = "i64")]
    pub nbarrier_num: Attribute<'a>,
}

#[mlir::op("xegpu.atomic_rmw", format = "$kind $tensorDesc `,` $mask `,` $value attr-dict `:` qualified(type($tensorDesc)) `,` type($mask) `,` type($value) `->` type($result)", results(result))]
pub struct AtomicRMWOp<'a> {
    #[slot(tensor_desc_ty, name = "tensorDesc")]
    pub tensor_desc: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[attr(int = "i64")]
    pub kind: AtomicRMWKind,
    pub layout: Option<Attribute<'a>>,
    #[dtype(strip = "xegpu.tensor_desc")]
    pub tensor_desc_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    pub value_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("xegpu.convert_layout", results(result))]
pub struct ConvertLayoutOp<'a> {
    #[slot(result)]
    pub source: Value<'a>,
    pub input_layout: Attribute<'a>,
    pub target_layout: Attribute<'a>,
    pub result: Type<'a>,
}

#[mlir::op("xegpu.create_mem_desc", results(mem_desc))]
pub struct CreateMemDescOp<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    pub source_ty: Type<'a>,
    #[dtype(strip = "xegpu.mem_desc")]
    pub mem_desc: Type<'a>,
}

#[mlir::op("xegpu.create_nd_tdesc", results(tensor_desc))]
pub struct CreateNdDescOp<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    #[slot(shape_ty)]
    pub shape: Vec<Value<'a>>,
    #[slot(strides_ty)]
    pub strides: Vec<Value<'a>>,
    #[attr(dense = "i64")]
    pub const_shape: Option<Attribute<'a>>,
    #[attr(dense = "i64")]
    pub const_strides: Option<Attribute<'a>>,
    pub source_ty: Type<'a>,
    #[dtype(is = index)]
    pub shape_ty: Type<'a>,
    #[dtype(is = index)]
    pub strides_ty: Type<'a>,
    #[dtype(strip = "xegpu.tensor_desc")]
    pub tensor_desc: Type<'a>,
}

#[mlir::op("xegpu.dpas_mx", results(result))]
pub struct DpasMxOp<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(acc_ty)]
    pub acc: Vec<Value<'a>>,
    #[slot(scale_a_ty)]
    pub scale_a: Vec<Value<'a>>,
    #[slot(scale_b_ty)]
    pub scale_b: Vec<Value<'a>>,
    pub layout_a: Option<Attribute<'a>>,
    pub layout_b: Option<Attribute<'a>>,
    pub layout_cd: Option<Attribute<'a>>,
    pub layout_a_scale: Option<Attribute<'a>>,
    pub layout_b_scale: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub acc_ty: Vec<Type<'a>>,
    pub scale_a_ty: Vec<Type<'a>>,
    pub scale_b_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("xegpu.dpas", format = "$lhs `,` $rhs (`,` $acc^)? attr-dict `:` type($lhs)`,` type($rhs) (`,` type($acc)^)? `->` type($result)", results(result))]
pub struct DpasOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[slot(acc_ty)]
    pub acc: Vec<Value<'a>>,
    pub layout_a: Option<Attribute<'a>>,
    pub layout_b: Option<Attribute<'a>>,
    pub layout_cd: Option<Attribute<'a>>,
    pub lhs_ty: Type<'a>,
    pub rhs_ty: Type<'a>,
    pub acc_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("xegpu.fence", format = "`memory_kind` `=` $memory_kind `,` `fence_scope` `=` $fence_scope attr-dict")]
pub struct FenceOp<'a> {
    #[attr(dialect = "xegpu<memory_space")]
    pub memory_kind: Attribute<'a>,
    #[attr(dialect = "xegpu<fence_scope")]
    pub fence_scope: Attribute<'a>,
}

#[mlir::op("xegpu.init_nbarrier", format = "$nbarrier_id `,` $participant_thread_num attr-dict `:` type($nbarrier_id) `,` type($participant_thread_num) `->` qualified(type($result))", results(result))]
pub struct InitNbarrierOp<'a> {
    #[slot(nbarrier_id_ty)]
    pub nbarrier_id: Value<'a>,
    #[slot(participant_thread_num_ty)]
    pub participant_thread_num: Value<'a>,
    #[dtype(is = i8)]
    pub nbarrier_id_ty: Type<'a>,
    #[dtype(is = i8)]
    pub participant_thread_num_ty: Type<'a>,
    #[dtype(is = "!xegpu.nbarrier")]
    pub result: Type<'a>,
}

#[mlir::op("xegpu.load", results(value))]
pub struct LoadGatherOp<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    #[slot(offsets_ty)]
    pub offsets: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[attr(int = "i64")]
    pub chunk_size: Option<Attribute<'a>>,
    #[attr(dialect = "xegpu.cache_hint")]
    pub l1_hint: Option<Attribute<'a>>,
    #[attr(dialect = "xegpu.cache_hint")]
    pub l2_hint: Option<Attribute<'a>>,
    #[attr(dialect = "xegpu.cache_hint")]
    pub l3_hint: Option<Attribute<'a>>,
    pub layout: Option<Attribute<'a>>,
    #[attr(int = "i64")]
    pub contiguity: Option<Attribute<'a>>,
    pub source_ty: Type<'a>,
    pub offsets_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    pub value: Type<'a>,
}

#[mlir::op("xegpu.load_matrix", results(res))]
pub struct LoadMatrixOp<'a> {
    #[slot(mem_desc_ty)]
    pub mem_desc: Value<'a>,
    #[slot(offsets_ty)]
    pub offsets: Vec<Value<'a>>,
    #[attr(dense = "i64")]
    pub const_offsets: Attribute<'a>,
    pub subgroup_block_io: bool,
    pub layout: Option<Attribute<'a>>,
    #[dtype(strip = "xegpu.mem_desc")]
    pub mem_desc_ty: Type<'a>,
    #[dtype(is = index)]
    pub offsets_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("xegpu.load_nd", results(value))]
pub struct LoadNdOp<'a> {
    #[slot(tensor_desc_ty, name = "TensorDesc")]
    pub tensor_desc: Value<'a>,
    #[slot(offsets_ty)]
    pub offsets: Vec<Value<'a>>,
    #[attr(dense = "i64")]
    pub const_offsets: Attribute<'a>,
    pub packed: bool,
    #[attr(dense = "i64")]
    pub transpose: Option<Attribute<'a>>,
    #[attr(dialect = "xegpu.cache_hint")]
    pub l1_hint: Option<Attribute<'a>>,
    #[attr(dialect = "xegpu.cache_hint")]
    pub l2_hint: Option<Attribute<'a>>,
    #[attr(dialect = "xegpu.cache_hint")]
    pub l3_hint: Option<Attribute<'a>>,
    pub layout: Option<Attribute<'a>>,
    #[dtype(strip = "xegpu.tensor_desc")]
    pub tensor_desc_ty: Type<'a>,
    #[dtype(is = index)]
    pub offsets_ty: Type<'a>,
    pub value: Type<'a>,
}

#[mlir::op("xegpu.nbarrier_arrive", format = "$nbarrier attr-dict `:` qualified(type($nbarrier))")]
pub struct NbarrierArriveOp<'a> {
    #[slot(nbarrier_ty)]
    pub nbarrier: Value<'a>,
    #[dtype(is = "!xegpu.nbarrier")]
    pub nbarrier_ty: Type<'a>,
}

#[mlir::op("xegpu.nbarrier_wait", format = "$nbarrier attr-dict `:` qualified(type($nbarrier))")]
pub struct NbarrierWaitOp<'a> {
    #[slot(nbarrier_ty)]
    pub nbarrier: Value<'a>,
    #[dtype(is = "!xegpu.nbarrier")]
    pub nbarrier_ty: Type<'a>,
}

#[mlir::op("xegpu.prefetch_nd")]
pub struct PrefetchNdOp<'a> {
    #[slot(tensor_desc_ty, name = "TensorDesc")]
    pub tensor_desc: Value<'a>,
    #[slot(offsets_ty)]
    pub offsets: Vec<Value<'a>>,
    #[attr(dense = "i64")]
    pub const_offsets: Attribute<'a>,
    #[attr(dialect = "xegpu.cache_hint")]
    pub l1_hint: Option<Attribute<'a>>,
    #[attr(dialect = "xegpu.cache_hint")]
    pub l2_hint: Option<Attribute<'a>>,
    #[attr(dialect = "xegpu.cache_hint")]
    pub l3_hint: Option<Attribute<'a>>,
    pub layout: Option<Attribute<'a>>,
    #[dtype(strip = "xegpu.tensor_desc")]
    pub tensor_desc_ty: Type<'a>,
    #[dtype(is = index)]
    pub offsets_ty: Type<'a>,
}

#[mlir::op("xegpu.prefetch")]
pub struct PrefetchOp<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    #[slot(offsets_ty)]
    pub offsets: Value<'a>,
    #[attr(dialect = "xegpu.cache_hint")]
    pub l1_hint: Option<Attribute<'a>>,
    #[attr(dialect = "xegpu.cache_hint")]
    pub l2_hint: Option<Attribute<'a>>,
    #[attr(dialect = "xegpu.cache_hint")]
    pub l3_hint: Option<Attribute<'a>>,
    #[attr(int = "i64")]
    pub offset_align_byte: Option<Attribute<'a>>,
    pub layout: Option<Attribute<'a>>,
    pub source_ty: Type<'a>,
    pub offsets_ty: Type<'a>,
}

#[mlir::op("xegpu.store_matrix")]
pub struct StoreMatrixOp<'a> {
    #[slot(data_ty)]
    pub data: Value<'a>,
    #[slot(mem_desc_ty)]
    pub mem_desc: Value<'a>,
    #[slot(offsets_ty)]
    pub offsets: Vec<Value<'a>>,
    #[attr(dense = "i64")]
    pub const_offsets: Attribute<'a>,
    pub subgroup_block_io: bool,
    pub layout: Option<Attribute<'a>>,
    pub data_ty: Type<'a>,
    #[dtype(strip = "xegpu.mem_desc")]
    pub mem_desc_ty: Type<'a>,
    #[dtype(is = index)]
    pub offsets_ty: Type<'a>,
}

#[mlir::op("xegpu.store_nd")]
pub struct StoreNdOp<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[slot(tensor_desc_ty, name = "TensorDesc")]
    pub tensor_desc: Value<'a>,
    #[slot(offsets_ty)]
    pub offsets: Vec<Value<'a>>,
    #[attr(dense = "i64")]
    pub const_offsets: Attribute<'a>,
    #[attr(dialect = "xegpu.cache_hint")]
    pub l1_hint: Option<Attribute<'a>>,
    #[attr(dialect = "xegpu.cache_hint")]
    pub l2_hint: Option<Attribute<'a>>,
    #[attr(dialect = "xegpu.cache_hint")]
    pub l3_hint: Option<Attribute<'a>>,
    pub layout: Option<Attribute<'a>>,
    pub value_ty: Type<'a>,
    #[dtype(strip = "xegpu.tensor_desc")]
    pub tensor_desc_ty: Type<'a>,
    #[dtype(is = index)]
    pub offsets_ty: Type<'a>,
}

#[mlir::op("xegpu.store")]
pub struct StoreScatterOp<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[slot(dest_ty)]
    pub dest: Value<'a>,
    #[slot(offsets_ty)]
    pub offsets: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[attr(int = "i64")]
    pub chunk_size: Option<Attribute<'a>>,
    #[attr(dialect = "xegpu.cache_hint")]
    pub l1_hint: Option<Attribute<'a>>,
    #[attr(dialect = "xegpu.cache_hint")]
    pub l2_hint: Option<Attribute<'a>>,
    #[attr(dialect = "xegpu.cache_hint")]
    pub l3_hint: Option<Attribute<'a>>,
    pub layout: Option<Attribute<'a>>,
    #[attr(int = "i64")]
    pub contiguity: Option<Attribute<'a>>,
    pub value_ty: Type<'a>,
    pub dest_ty: Type<'a>,
    pub offsets_ty: Type<'a>,
    pub mask_ty: Type<'a>,
}

#[mlir::op("xegpu.truncf", format = "$source attr-dict `:` qualified(type($source)) `->` qualified(type($result))", results(result))]
pub struct TruncfOp<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    pub source_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::dialect(
    "xegpu",
    ops = [AllocNbarrierOp, AtomicRMWOp, ConvertLayoutOp, CreateMemDescOp, CreateNdDescOp, DpasMxOp, DpasOp, FenceOp, InitNbarrierOp, LoadGatherOp, LoadMatrixOp, LoadNdOp, NbarrierArriveOp, NbarrierWaitOp, PrefetchNdOp, PrefetchOp, StoreMatrixOp, StoreNdOp, StoreScatterOp, TruncfOp],
    dependents = ["arith"]
)]
pub struct XegpuDialect;
