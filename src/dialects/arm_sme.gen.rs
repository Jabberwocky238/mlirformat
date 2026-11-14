#![allow(non_camel_case_types, unused_imports, clippy::all, rustdoc::all)]

use mlirformat::{mlir, Attribute, Region, Str, Type, Value, __Vec as Vec};

#[mlir::op("arm_sme.copy_tile", format = "$tile attr-dict `:` type($result)", results(result))]
pub struct CopyTileOp<'a> {
    #[slot(result)]
    pub tile: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("arm_sme.extract_tile_slice", format = "$tile `[` $tile_slice_index `]` (`layout` `` $layout^)? attr-dict `:` type($result) `from` type($tile)", results(result))]
pub struct ExtractTileSliceOp<'a> {
    #[slot(tile_ty)]
    pub tile: Value<'a>,
    #[slot(tile_slice_index_ty)]
    pub tile_slice_index: Value<'a>,
    #[attr(dialect = "arm_sme.layout", default = "<horizontal>")]
    pub layout: Option<Attribute<'a>>,
    pub tile_ty: Type<'a>,
    #[dtype(is = index)]
    pub tile_slice_index_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("arm_sme.fmopa_2way", format = "$lhs `,` $rhs oilist( `acc` `` `(` $acc `)` | `masks` `` `(` $lhsMask `,` $rhsMask `)` ) attr-dict `:` type($lhs) `,` type($rhs) `into` type($result)", results(result))]
pub struct FMopa2WayOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(lhs_ty)]
    pub rhs: Value<'a>,
    #[slot(lhs_mask_ty, name = "lhsMask")]
    pub lhs_mask: Vec<Value<'a>>,
    #[slot(rhs_mask_ty, name = "rhsMask")]
    pub rhs_mask: Vec<Value<'a>>,
    #[slot(result)]
    pub acc: Vec<Value<'a>>,
    pub lhs_ty: Type<'a>,
    #[dtype(i1 = lhs_ty)]
    pub lhs_mask_ty: Vec<Type<'a>>,
    #[dtype(i1 = lhs_ty)]
    pub rhs_mask_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("arm_sme.fmops_2way", format = "$lhs `,` $rhs oilist( `acc` `` `(` $acc `)` | `masks` `` `(` $lhsMask `,` $rhsMask `)` ) attr-dict `:` type($lhs) `,` type($rhs) `into` type($result)", results(result))]
pub struct FMops2WayOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(lhs_ty)]
    pub rhs: Value<'a>,
    #[slot(lhs_mask_ty, name = "lhsMask")]
    pub lhs_mask: Vec<Value<'a>>,
    #[slot(rhs_mask_ty, name = "rhsMask")]
    pub rhs_mask: Vec<Value<'a>>,
    #[slot(result)]
    pub acc: Vec<Value<'a>>,
    pub lhs_ty: Type<'a>,
    #[dtype(i1 = lhs_ty)]
    pub lhs_mask_ty: Vec<Type<'a>>,
    #[dtype(i1 = lhs_ty)]
    pub rhs_mask_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("arm_sme.get_tile", format = "attr-dict `:` type($tile)", results(tile))]
pub struct GetTileOp<'a> {
    pub tile: Type<'a>,
}

#[mlir::op("arm_sme.insert_tile_slice", format = "$vector `,` $tile `[` $tile_slice_index `]` (`layout` `` $layout^)? attr-dict `:` type($vector) `into` type($result)", results(result))]
pub struct InsertTileSliceOp<'a> {
    #[slot(vector_ty)]
    pub vector: Value<'a>,
    #[slot(result)]
    pub tile: Value<'a>,
    #[slot(tile_slice_index_ty)]
    pub tile_slice_index: Value<'a>,
    #[attr(dialect = "arm_sme.layout", default = "<horizontal>")]
    pub layout: Option<Attribute<'a>>,
    pub vector_ty: Type<'a>,
    #[dtype(is = index)]
    pub tile_slice_index_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("arm_sme.intr.cntsd", results(res))]
pub struct aarch64_sme_cntsd<'a> {
    pub res: Type<'a>,
}

#[mlir::op("arm_sme.intr.ld1b.horiz")]
pub struct aarch64_sme_ld1b_horiz<'a> {
    #[slot(predicate_ty)]
    pub predicate: Value<'a>,
    #[slot(load_address_ty)]
    pub load_address: Value<'a>,
    #[slot(tile_slice_index_ty)]
    pub tile_slice_index: Value<'a>,
    #[attr(int = "i32")]
    pub tile_id: Attribute<'a>,
    pub predicate_ty: Type<'a>,
    pub load_address_ty: Type<'a>,
    #[dtype(is = i32)]
    pub tile_slice_index_ty: Type<'a>,
}

#[mlir::op("arm_sme.intr.ld1b.vert")]
pub struct aarch64_sme_ld1b_vert<'a> {
    #[slot(predicate_ty)]
    pub predicate: Value<'a>,
    #[slot(load_address_ty)]
    pub load_address: Value<'a>,
    #[slot(tile_slice_index_ty)]
    pub tile_slice_index: Value<'a>,
    #[attr(int = "i32")]
    pub tile_id: Attribute<'a>,
    pub predicate_ty: Type<'a>,
    pub load_address_ty: Type<'a>,
    #[dtype(is = i32)]
    pub tile_slice_index_ty: Type<'a>,
}

#[mlir::op("arm_sme.intr.ld1d.horiz")]
pub struct aarch64_sme_ld1d_horiz<'a> {
    #[slot(predicate_ty)]
    pub predicate: Value<'a>,
    #[slot(load_address_ty)]
    pub load_address: Value<'a>,
    #[slot(tile_slice_index_ty)]
    pub tile_slice_index: Value<'a>,
    #[attr(int = "i32")]
    pub tile_id: Attribute<'a>,
    pub predicate_ty: Type<'a>,
    pub load_address_ty: Type<'a>,
    #[dtype(is = i32)]
    pub tile_slice_index_ty: Type<'a>,
}

#[mlir::op("arm_sme.intr.ld1d.vert")]
pub struct aarch64_sme_ld1d_vert<'a> {
    #[slot(predicate_ty)]
    pub predicate: Value<'a>,
    #[slot(load_address_ty)]
    pub load_address: Value<'a>,
    #[slot(tile_slice_index_ty)]
    pub tile_slice_index: Value<'a>,
    #[attr(int = "i32")]
    pub tile_id: Attribute<'a>,
    pub predicate_ty: Type<'a>,
    pub load_address_ty: Type<'a>,
    #[dtype(is = i32)]
    pub tile_slice_index_ty: Type<'a>,
}

#[mlir::op("arm_sme.intr.ld1h.horiz")]
pub struct aarch64_sme_ld1h_horiz<'a> {
    #[slot(predicate_ty)]
    pub predicate: Value<'a>,
    #[slot(load_address_ty)]
    pub load_address: Value<'a>,
    #[slot(tile_slice_index_ty)]
    pub tile_slice_index: Value<'a>,
    #[attr(int = "i32")]
    pub tile_id: Attribute<'a>,
    pub predicate_ty: Type<'a>,
    pub load_address_ty: Type<'a>,
    #[dtype(is = i32)]
    pub tile_slice_index_ty: Type<'a>,
}

#[mlir::op("arm_sme.intr.ld1h.vert")]
pub struct aarch64_sme_ld1h_vert<'a> {
    #[slot(predicate_ty)]
    pub predicate: Value<'a>,
    #[slot(load_address_ty)]
    pub load_address: Value<'a>,
    #[slot(tile_slice_index_ty)]
    pub tile_slice_index: Value<'a>,
    #[attr(int = "i32")]
    pub tile_id: Attribute<'a>,
    pub predicate_ty: Type<'a>,
    pub load_address_ty: Type<'a>,
    #[dtype(is = i32)]
    pub tile_slice_index_ty: Type<'a>,
}

#[mlir::op("arm_sme.intr.ld1q.horiz")]
pub struct aarch64_sme_ld1q_horiz<'a> {
    #[slot(predicate_ty)]
    pub predicate: Value<'a>,
    #[slot(load_address_ty)]
    pub load_address: Value<'a>,
    #[slot(tile_slice_index_ty)]
    pub tile_slice_index: Value<'a>,
    #[attr(int = "i32")]
    pub tile_id: Attribute<'a>,
    pub predicate_ty: Type<'a>,
    pub load_address_ty: Type<'a>,
    #[dtype(is = i32)]
    pub tile_slice_index_ty: Type<'a>,
}

#[mlir::op("arm_sme.intr.ld1q.vert")]
pub struct aarch64_sme_ld1q_vert<'a> {
    #[slot(predicate_ty)]
    pub predicate: Value<'a>,
    #[slot(load_address_ty)]
    pub load_address: Value<'a>,
    #[slot(tile_slice_index_ty)]
    pub tile_slice_index: Value<'a>,
    #[attr(int = "i32")]
    pub tile_id: Attribute<'a>,
    pub predicate_ty: Type<'a>,
    pub load_address_ty: Type<'a>,
    #[dtype(is = i32)]
    pub tile_slice_index_ty: Type<'a>,
}

#[mlir::op("arm_sme.intr.ld1w.horiz")]
pub struct aarch64_sme_ld1w_horiz<'a> {
    #[slot(predicate_ty)]
    pub predicate: Value<'a>,
    #[slot(load_address_ty)]
    pub load_address: Value<'a>,
    #[slot(tile_slice_index_ty)]
    pub tile_slice_index: Value<'a>,
    #[attr(int = "i32")]
    pub tile_id: Attribute<'a>,
    pub predicate_ty: Type<'a>,
    pub load_address_ty: Type<'a>,
    #[dtype(is = i32)]
    pub tile_slice_index_ty: Type<'a>,
}

#[mlir::op("arm_sme.intr.ld1w.vert")]
pub struct aarch64_sme_ld1w_vert<'a> {
    #[slot(predicate_ty)]
    pub predicate: Value<'a>,
    #[slot(load_address_ty)]
    pub load_address: Value<'a>,
    #[slot(tile_slice_index_ty)]
    pub tile_slice_index: Value<'a>,
    #[attr(int = "i32")]
    pub tile_id: Attribute<'a>,
    pub predicate_ty: Type<'a>,
    pub load_address_ty: Type<'a>,
    #[dtype(is = i32)]
    pub tile_slice_index_ty: Type<'a>,
}

#[mlir::op("arm_sme.intr.mopa")]
pub struct aarch64_sme_mopa<'a> {
    #[slot(lhs_predicate_ty)]
    pub lhs_predicate: Value<'a>,
    #[slot(rhs_predicate_ty)]
    pub rhs_predicate: Value<'a>,
    #[slot(lhs_vector_ty)]
    pub lhs_vector: Value<'a>,
    #[slot(rhs_vector_ty)]
    pub rhs_vector: Value<'a>,
    #[attr(int = "i32")]
    pub tile_id: Attribute<'a>,
    pub lhs_predicate_ty: Type<'a>,
    pub rhs_predicate_ty: Type<'a>,
    pub lhs_vector_ty: Type<'a>,
    pub rhs_vector_ty: Type<'a>,
}

#[mlir::op("arm_sme.intr.mopa.wide")]
pub struct aarch64_sme_mopa_wide<'a> {
    #[slot(lhs_predicate_ty)]
    pub lhs_predicate: Value<'a>,
    #[slot(rhs_predicate_ty)]
    pub rhs_predicate: Value<'a>,
    #[slot(lhs_vector_ty)]
    pub lhs_vector: Value<'a>,
    #[slot(rhs_vector_ty)]
    pub rhs_vector: Value<'a>,
    #[attr(int = "i32")]
    pub tile_id: Attribute<'a>,
    pub lhs_predicate_ty: Type<'a>,
    pub rhs_predicate_ty: Type<'a>,
    pub lhs_vector_ty: Type<'a>,
    pub rhs_vector_ty: Type<'a>,
}

#[mlir::op("arm_sme.intr.mops")]
pub struct aarch64_sme_mops<'a> {
    #[slot(lhs_predicate_ty)]
    pub lhs_predicate: Value<'a>,
    #[slot(rhs_predicate_ty)]
    pub rhs_predicate: Value<'a>,
    #[slot(lhs_vector_ty)]
    pub lhs_vector: Value<'a>,
    #[slot(rhs_vector_ty)]
    pub rhs_vector: Value<'a>,
    #[attr(int = "i32")]
    pub tile_id: Attribute<'a>,
    pub lhs_predicate_ty: Type<'a>,
    pub rhs_predicate_ty: Type<'a>,
    pub lhs_vector_ty: Type<'a>,
    pub rhs_vector_ty: Type<'a>,
}

#[mlir::op("arm_sme.intr.mops.wide")]
pub struct aarch64_sme_mops_wide<'a> {
    #[slot(lhs_predicate_ty)]
    pub lhs_predicate: Value<'a>,
    #[slot(rhs_predicate_ty)]
    pub rhs_predicate: Value<'a>,
    #[slot(lhs_vector_ty)]
    pub lhs_vector: Value<'a>,
    #[slot(rhs_vector_ty)]
    pub rhs_vector: Value<'a>,
    #[attr(int = "i32")]
    pub tile_id: Attribute<'a>,
    pub lhs_predicate_ty: Type<'a>,
    pub rhs_predicate_ty: Type<'a>,
    pub lhs_vector_ty: Type<'a>,
    pub rhs_vector_ty: Type<'a>,
}

#[mlir::op("arm_sme.intr.read.horiz", results(res))]
pub struct aarch64_sme_read_horiz<'a> {
    #[slot(vector_ty)]
    pub vector: Value<'a>,
    #[slot(predicate_ty)]
    pub predicate: Value<'a>,
    #[slot(tile_slice_index_ty)]
    pub tile_slice_index: Value<'a>,
    #[attr(int = "i32")]
    pub tile_id: Attribute<'a>,
    pub vector_ty: Type<'a>,
    pub predicate_ty: Type<'a>,
    #[dtype(is = i32)]
    pub tile_slice_index_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("arm_sme.intr.read.vert", results(res))]
pub struct aarch64_sme_read_vert<'a> {
    #[slot(vector_ty)]
    pub vector: Value<'a>,
    #[slot(predicate_ty)]
    pub predicate: Value<'a>,
    #[slot(tile_slice_index_ty)]
    pub tile_slice_index: Value<'a>,
    #[attr(int = "i32")]
    pub tile_id: Attribute<'a>,
    pub vector_ty: Type<'a>,
    pub predicate_ty: Type<'a>,
    #[dtype(is = i32)]
    pub tile_slice_index_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("arm_sme.intr.smopa.wide")]
pub struct aarch64_sme_smopa_wide<'a> {
    #[slot(lhs_predicate_ty)]
    pub lhs_predicate: Value<'a>,
    #[slot(rhs_predicate_ty)]
    pub rhs_predicate: Value<'a>,
    #[slot(lhs_vector_ty)]
    pub lhs_vector: Value<'a>,
    #[slot(rhs_vector_ty)]
    pub rhs_vector: Value<'a>,
    #[attr(int = "i32")]
    pub tile_id: Attribute<'a>,
    pub lhs_predicate_ty: Type<'a>,
    pub rhs_predicate_ty: Type<'a>,
    pub lhs_vector_ty: Type<'a>,
    pub rhs_vector_ty: Type<'a>,
}

#[mlir::op("arm_sme.intr.smopa.za32")]
pub struct aarch64_sme_smopa_za32<'a> {
    #[slot(lhs_predicate_ty)]
    pub lhs_predicate: Value<'a>,
    #[slot(rhs_predicate_ty)]
    pub rhs_predicate: Value<'a>,
    #[slot(lhs_vector_ty)]
    pub lhs_vector: Value<'a>,
    #[slot(rhs_vector_ty)]
    pub rhs_vector: Value<'a>,
    #[attr(int = "i32")]
    pub tile_id: Attribute<'a>,
    pub lhs_predicate_ty: Type<'a>,
    pub rhs_predicate_ty: Type<'a>,
    pub lhs_vector_ty: Type<'a>,
    pub rhs_vector_ty: Type<'a>,
}

#[mlir::op("arm_sme.intr.smops.wide")]
pub struct aarch64_sme_smops_wide<'a> {
    #[slot(lhs_predicate_ty)]
    pub lhs_predicate: Value<'a>,
    #[slot(rhs_predicate_ty)]
    pub rhs_predicate: Value<'a>,
    #[slot(lhs_vector_ty)]
    pub lhs_vector: Value<'a>,
    #[slot(rhs_vector_ty)]
    pub rhs_vector: Value<'a>,
    #[attr(int = "i32")]
    pub tile_id: Attribute<'a>,
    pub lhs_predicate_ty: Type<'a>,
    pub rhs_predicate_ty: Type<'a>,
    pub lhs_vector_ty: Type<'a>,
    pub rhs_vector_ty: Type<'a>,
}

#[mlir::op("arm_sme.intr.smops.za32")]
pub struct aarch64_sme_smops_za32<'a> {
    #[slot(lhs_predicate_ty)]
    pub lhs_predicate: Value<'a>,
    #[slot(rhs_predicate_ty)]
    pub rhs_predicate: Value<'a>,
    #[slot(lhs_vector_ty)]
    pub lhs_vector: Value<'a>,
    #[slot(rhs_vector_ty)]
    pub rhs_vector: Value<'a>,
    #[attr(int = "i32")]
    pub tile_id: Attribute<'a>,
    pub lhs_predicate_ty: Type<'a>,
    pub rhs_predicate_ty: Type<'a>,
    pub lhs_vector_ty: Type<'a>,
    pub rhs_vector_ty: Type<'a>,
}

#[mlir::op("arm_sme.intr.st1b.horiz")]
pub struct aarch64_sme_st1b_horiz<'a> {
    #[slot(predicate_ty)]
    pub predicate: Value<'a>,
    #[slot(store_address_ty)]
    pub store_address: Value<'a>,
    #[slot(tile_slice_index_ty)]
    pub tile_slice_index: Value<'a>,
    #[attr(int = "i32")]
    pub tile_id: Attribute<'a>,
    pub predicate_ty: Type<'a>,
    pub store_address_ty: Type<'a>,
    #[dtype(is = i32)]
    pub tile_slice_index_ty: Type<'a>,
}

#[mlir::op("arm_sme.intr.st1b.vert")]
pub struct aarch64_sme_st1b_vert<'a> {
    #[slot(predicate_ty)]
    pub predicate: Value<'a>,
    #[slot(store_address_ty)]
    pub store_address: Value<'a>,
    #[slot(tile_slice_index_ty)]
    pub tile_slice_index: Value<'a>,
    #[attr(int = "i32")]
    pub tile_id: Attribute<'a>,
    pub predicate_ty: Type<'a>,
    pub store_address_ty: Type<'a>,
    #[dtype(is = i32)]
    pub tile_slice_index_ty: Type<'a>,
}

#[mlir::op("arm_sme.intr.st1d.horiz")]
pub struct aarch64_sme_st1d_horiz<'a> {
    #[slot(predicate_ty)]
    pub predicate: Value<'a>,
    #[slot(store_address_ty)]
    pub store_address: Value<'a>,
    #[slot(tile_slice_index_ty)]
    pub tile_slice_index: Value<'a>,
    #[attr(int = "i32")]
    pub tile_id: Attribute<'a>,
    pub predicate_ty: Type<'a>,
    pub store_address_ty: Type<'a>,
    #[dtype(is = i32)]
    pub tile_slice_index_ty: Type<'a>,
}

#[mlir::op("arm_sme.intr.st1d.vert")]
pub struct aarch64_sme_st1d_vert<'a> {
    #[slot(predicate_ty)]
    pub predicate: Value<'a>,
    #[slot(store_address_ty)]
    pub store_address: Value<'a>,
    #[slot(tile_slice_index_ty)]
    pub tile_slice_index: Value<'a>,
    #[attr(int = "i32")]
    pub tile_id: Attribute<'a>,
    pub predicate_ty: Type<'a>,
    pub store_address_ty: Type<'a>,
    #[dtype(is = i32)]
    pub tile_slice_index_ty: Type<'a>,
}

#[mlir::op("arm_sme.intr.st1h.horiz")]
pub struct aarch64_sme_st1h_horiz<'a> {
    #[slot(predicate_ty)]
    pub predicate: Value<'a>,
    #[slot(store_address_ty)]
    pub store_address: Value<'a>,
    #[slot(tile_slice_index_ty)]
    pub tile_slice_index: Value<'a>,
    #[attr(int = "i32")]
    pub tile_id: Attribute<'a>,
    pub predicate_ty: Type<'a>,
    pub store_address_ty: Type<'a>,
    #[dtype(is = i32)]
    pub tile_slice_index_ty: Type<'a>,
}

#[mlir::op("arm_sme.intr.st1h.vert")]
pub struct aarch64_sme_st1h_vert<'a> {
    #[slot(predicate_ty)]
    pub predicate: Value<'a>,
    #[slot(store_address_ty)]
    pub store_address: Value<'a>,
    #[slot(tile_slice_index_ty)]
    pub tile_slice_index: Value<'a>,
    #[attr(int = "i32")]
    pub tile_id: Attribute<'a>,
    pub predicate_ty: Type<'a>,
    pub store_address_ty: Type<'a>,
    #[dtype(is = i32)]
    pub tile_slice_index_ty: Type<'a>,
}

#[mlir::op("arm_sme.intr.st1q.horiz")]
pub struct aarch64_sme_st1q_horiz<'a> {
    #[slot(predicate_ty)]
    pub predicate: Value<'a>,
    #[slot(store_address_ty)]
    pub store_address: Value<'a>,
    #[slot(tile_slice_index_ty)]
    pub tile_slice_index: Value<'a>,
    #[attr(int = "i32")]
    pub tile_id: Attribute<'a>,
    pub predicate_ty: Type<'a>,
    pub store_address_ty: Type<'a>,
    #[dtype(is = i32)]
    pub tile_slice_index_ty: Type<'a>,
}

#[mlir::op("arm_sme.intr.st1q.vert")]
pub struct aarch64_sme_st1q_vert<'a> {
    #[slot(predicate_ty)]
    pub predicate: Value<'a>,
    #[slot(store_address_ty)]
    pub store_address: Value<'a>,
    #[slot(tile_slice_index_ty)]
    pub tile_slice_index: Value<'a>,
    #[attr(int = "i32")]
    pub tile_id: Attribute<'a>,
    pub predicate_ty: Type<'a>,
    pub store_address_ty: Type<'a>,
    #[dtype(is = i32)]
    pub tile_slice_index_ty: Type<'a>,
}

#[mlir::op("arm_sme.intr.st1w.horiz")]
pub struct aarch64_sme_st1w_horiz<'a> {
    #[slot(predicate_ty)]
    pub predicate: Value<'a>,
    #[slot(store_address_ty)]
    pub store_address: Value<'a>,
    #[slot(tile_slice_index_ty)]
    pub tile_slice_index: Value<'a>,
    #[attr(int = "i32")]
    pub tile_id: Attribute<'a>,
    pub predicate_ty: Type<'a>,
    pub store_address_ty: Type<'a>,
    #[dtype(is = i32)]
    pub tile_slice_index_ty: Type<'a>,
}

#[mlir::op("arm_sme.intr.st1w.vert")]
pub struct aarch64_sme_st1w_vert<'a> {
    #[slot(predicate_ty)]
    pub predicate: Value<'a>,
    #[slot(store_address_ty)]
    pub store_address: Value<'a>,
    #[slot(tile_slice_index_ty)]
    pub tile_slice_index: Value<'a>,
    #[attr(int = "i32")]
    pub tile_id: Attribute<'a>,
    pub predicate_ty: Type<'a>,
    pub store_address_ty: Type<'a>,
    #[dtype(is = i32)]
    pub tile_slice_index_ty: Type<'a>,
}

#[mlir::op("arm_sme.intr.str")]
pub struct aarch64_sme_str<'a> {
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[slot(store_address_ty)]
    pub store_address: Value<'a>,
    #[slot(offset_ty)]
    pub offset: Value<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    pub store_address_ty: Type<'a>,
    #[dtype(is = i32)]
    pub offset_ty: Type<'a>,
}

#[mlir::op("arm_sme.intr.sumopa.wide")]
pub struct aarch64_sme_sumopa_wide<'a> {
    #[slot(lhs_predicate_ty)]
    pub lhs_predicate: Value<'a>,
    #[slot(rhs_predicate_ty)]
    pub rhs_predicate: Value<'a>,
    #[slot(lhs_vector_ty)]
    pub lhs_vector: Value<'a>,
    #[slot(rhs_vector_ty)]
    pub rhs_vector: Value<'a>,
    #[attr(int = "i32")]
    pub tile_id: Attribute<'a>,
    pub lhs_predicate_ty: Type<'a>,
    pub rhs_predicate_ty: Type<'a>,
    pub lhs_vector_ty: Type<'a>,
    pub rhs_vector_ty: Type<'a>,
}

#[mlir::op("arm_sme.intr.sumops.wide")]
pub struct aarch64_sme_sumops_wide<'a> {
    #[slot(lhs_predicate_ty)]
    pub lhs_predicate: Value<'a>,
    #[slot(rhs_predicate_ty)]
    pub rhs_predicate: Value<'a>,
    #[slot(lhs_vector_ty)]
    pub lhs_vector: Value<'a>,
    #[slot(rhs_vector_ty)]
    pub rhs_vector: Value<'a>,
    #[attr(int = "i32")]
    pub tile_id: Attribute<'a>,
    pub lhs_predicate_ty: Type<'a>,
    pub rhs_predicate_ty: Type<'a>,
    pub lhs_vector_ty: Type<'a>,
    pub rhs_vector_ty: Type<'a>,
}

#[mlir::op("arm_sme.intr.umopa.wide")]
pub struct aarch64_sme_umopa_wide<'a> {
    #[slot(lhs_predicate_ty)]
    pub lhs_predicate: Value<'a>,
    #[slot(rhs_predicate_ty)]
    pub rhs_predicate: Value<'a>,
    #[slot(lhs_vector_ty)]
    pub lhs_vector: Value<'a>,
    #[slot(rhs_vector_ty)]
    pub rhs_vector: Value<'a>,
    #[attr(int = "i32")]
    pub tile_id: Attribute<'a>,
    pub lhs_predicate_ty: Type<'a>,
    pub rhs_predicate_ty: Type<'a>,
    pub lhs_vector_ty: Type<'a>,
    pub rhs_vector_ty: Type<'a>,
}

#[mlir::op("arm_sme.intr.umopa.za32")]
pub struct aarch64_sme_umopa_za32<'a> {
    #[slot(lhs_predicate_ty)]
    pub lhs_predicate: Value<'a>,
    #[slot(rhs_predicate_ty)]
    pub rhs_predicate: Value<'a>,
    #[slot(lhs_vector_ty)]
    pub lhs_vector: Value<'a>,
    #[slot(rhs_vector_ty)]
    pub rhs_vector: Value<'a>,
    #[attr(int = "i32")]
    pub tile_id: Attribute<'a>,
    pub lhs_predicate_ty: Type<'a>,
    pub rhs_predicate_ty: Type<'a>,
    pub lhs_vector_ty: Type<'a>,
    pub rhs_vector_ty: Type<'a>,
}

#[mlir::op("arm_sme.intr.umops.wide")]
pub struct aarch64_sme_umops_wide<'a> {
    #[slot(lhs_predicate_ty)]
    pub lhs_predicate: Value<'a>,
    #[slot(rhs_predicate_ty)]
    pub rhs_predicate: Value<'a>,
    #[slot(lhs_vector_ty)]
    pub lhs_vector: Value<'a>,
    #[slot(rhs_vector_ty)]
    pub rhs_vector: Value<'a>,
    #[attr(int = "i32")]
    pub tile_id: Attribute<'a>,
    pub lhs_predicate_ty: Type<'a>,
    pub rhs_predicate_ty: Type<'a>,
    pub lhs_vector_ty: Type<'a>,
    pub rhs_vector_ty: Type<'a>,
}

#[mlir::op("arm_sme.intr.umops.za32")]
pub struct aarch64_sme_umops_za32<'a> {
    #[slot(lhs_predicate_ty)]
    pub lhs_predicate: Value<'a>,
    #[slot(rhs_predicate_ty)]
    pub rhs_predicate: Value<'a>,
    #[slot(lhs_vector_ty)]
    pub lhs_vector: Value<'a>,
    #[slot(rhs_vector_ty)]
    pub rhs_vector: Value<'a>,
    #[attr(int = "i32")]
    pub tile_id: Attribute<'a>,
    pub lhs_predicate_ty: Type<'a>,
    pub rhs_predicate_ty: Type<'a>,
    pub lhs_vector_ty: Type<'a>,
    pub rhs_vector_ty: Type<'a>,
}

#[mlir::op("arm_sme.intr.usmopa.wide")]
pub struct aarch64_sme_usmopa_wide<'a> {
    #[slot(lhs_predicate_ty)]
    pub lhs_predicate: Value<'a>,
    #[slot(rhs_predicate_ty)]
    pub rhs_predicate: Value<'a>,
    #[slot(lhs_vector_ty)]
    pub lhs_vector: Value<'a>,
    #[slot(rhs_vector_ty)]
    pub rhs_vector: Value<'a>,
    #[attr(int = "i32")]
    pub tile_id: Attribute<'a>,
    pub lhs_predicate_ty: Type<'a>,
    pub rhs_predicate_ty: Type<'a>,
    pub lhs_vector_ty: Type<'a>,
    pub rhs_vector_ty: Type<'a>,
}

#[mlir::op("arm_sme.intr.usmops.wide")]
pub struct aarch64_sme_usmops_wide<'a> {
    #[slot(lhs_predicate_ty)]
    pub lhs_predicate: Value<'a>,
    #[slot(rhs_predicate_ty)]
    pub rhs_predicate: Value<'a>,
    #[slot(lhs_vector_ty)]
    pub lhs_vector: Value<'a>,
    #[slot(rhs_vector_ty)]
    pub rhs_vector: Value<'a>,
    #[attr(int = "i32")]
    pub tile_id: Attribute<'a>,
    pub lhs_predicate_ty: Type<'a>,
    pub rhs_predicate_ty: Type<'a>,
    pub lhs_vector_ty: Type<'a>,
    pub rhs_vector_ty: Type<'a>,
}

#[mlir::op("arm_sme.intr.write.horiz")]
pub struct aarch64_sme_write_horiz<'a> {
    #[slot(tile_slice_index_ty)]
    pub tile_slice_index: Value<'a>,
    #[slot(predicate_ty)]
    pub predicate: Value<'a>,
    #[slot(vector_ty)]
    pub vector: Value<'a>,
    #[attr(int = "i32")]
    pub tile_id: Attribute<'a>,
    #[dtype(is = i32)]
    pub tile_slice_index_ty: Type<'a>,
    pub predicate_ty: Type<'a>,
    pub vector_ty: Type<'a>,
}

#[mlir::op("arm_sme.intr.write.vert")]
pub struct aarch64_sme_write_vert<'a> {
    #[slot(tile_slice_index_ty)]
    pub tile_slice_index: Value<'a>,
    #[slot(predicate_ty)]
    pub predicate: Value<'a>,
    #[slot(vector_ty)]
    pub vector: Value<'a>,
    #[attr(int = "i32")]
    pub tile_id: Attribute<'a>,
    #[dtype(is = i32)]
    pub tile_slice_index_ty: Type<'a>,
    pub predicate_ty: Type<'a>,
    pub vector_ty: Type<'a>,
}

#[mlir::op("arm_sme.intr.zero")]
pub struct aarch64_sme_zero<'a> {
    #[attr(int = "i32")]
    pub tile_mask: Attribute<'a>,
}

#[mlir::op("arm_sme.load_tile_slice", format = "$base `[` $indices `]` `,` $mask `,` $tile `,` $tile_slice_index (`layout` `` $layout^)? attr-dict `:` type($base) `,` type($mask) `,` type($result)", results(result))]
pub struct LoadTileSliceOp<'a> {
    #[slot(base_ty)]
    pub base: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(result)]
    pub tile: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    #[slot(tile_slice_index_ty)]
    pub tile_slice_index: Value<'a>,
    #[attr(dialect = "arm_sme.layout", default = "<horizontal>")]
    pub layout: Option<Attribute<'a>>,
    pub base_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    #[dtype(is = index)]
    pub indices_ty: Type<'a>,
    #[dtype(is = index)]
    pub tile_slice_index_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("arm_sme.outerproduct", format = "$lhs `,` $rhs oilist( `kind` `` $kind | `acc` `` `(` $acc `)` | `masks` `` `(` $lhsMask `,` $rhsMask `)` ) attr-dict `:` type($lhs) `,` type($rhs)", results(result))]
pub struct OuterProductOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(lhs_ty)]
    pub rhs: Value<'a>,
    #[slot(lhs_mask_ty, name = "lhsMask")]
    pub lhs_mask: Vec<Value<'a>>,
    #[slot(rhs_mask_ty, name = "rhsMask")]
    pub rhs_mask: Vec<Value<'a>>,
    #[slot(acc_ty)]
    pub acc: Vec<Value<'a>>,
    #[attr(dialect = "arm_sme.kind", default = "<add>")]
    pub kind: Option<Attribute<'a>>,
    pub lhs_ty: Type<'a>,
    #[dtype(i1 = lhs_ty)]
    pub lhs_mask_ty: Vec<Type<'a>>,
    #[dtype(i1 = lhs_ty)]
    pub rhs_mask_ty: Vec<Type<'a>>,
    #[dtype(outer = lhs_ty)]
    pub acc_ty: Vec<Type<'a>>,
    #[dtype(outer = lhs_ty)]
    pub result: Type<'a>,
}

#[mlir::op("arm_sme.smopa_2way", format = "$lhs `,` $rhs oilist( `acc` `` `(` $acc `)` | `masks` `` `(` $lhsMask `,` $rhsMask `)` ) attr-dict `:` type($lhs) `,` type($rhs) `into` type($result)", results(result))]
pub struct SMopa2WayOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(lhs_ty)]
    pub rhs: Value<'a>,
    #[slot(lhs_mask_ty, name = "lhsMask")]
    pub lhs_mask: Vec<Value<'a>>,
    #[slot(rhs_mask_ty, name = "rhsMask")]
    pub rhs_mask: Vec<Value<'a>>,
    #[slot(result)]
    pub acc: Vec<Value<'a>>,
    pub lhs_ty: Type<'a>,
    #[dtype(i1 = lhs_ty)]
    pub lhs_mask_ty: Vec<Type<'a>>,
    #[dtype(i1 = lhs_ty)]
    pub rhs_mask_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("arm_sme.smopa_4way", format = "$lhs `,` $rhs oilist( `acc` `` `(` $acc `)` | `masks` `` `(` $lhsMask `,` $rhsMask `)` ) attr-dict `:` type($lhs) `,` type($rhs) `into` type($result)", results(result))]
pub struct SMopa4WayOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(lhs_ty)]
    pub rhs: Value<'a>,
    #[slot(lhs_mask_ty, name = "lhsMask")]
    pub lhs_mask: Vec<Value<'a>>,
    #[slot(rhs_mask_ty, name = "rhsMask")]
    pub rhs_mask: Vec<Value<'a>>,
    #[slot(result)]
    pub acc: Vec<Value<'a>>,
    pub lhs_ty: Type<'a>,
    #[dtype(i1 = lhs_ty)]
    pub lhs_mask_ty: Vec<Type<'a>>,
    #[dtype(i1 = lhs_ty)]
    pub rhs_mask_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("arm_sme.smops_2way", format = "$lhs `,` $rhs oilist( `acc` `` `(` $acc `)` | `masks` `` `(` $lhsMask `,` $rhsMask `)` ) attr-dict `:` type($lhs) `,` type($rhs) `into` type($result)", results(result))]
pub struct SMops2WayOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(lhs_ty)]
    pub rhs: Value<'a>,
    #[slot(lhs_mask_ty, name = "lhsMask")]
    pub lhs_mask: Vec<Value<'a>>,
    #[slot(rhs_mask_ty, name = "rhsMask")]
    pub rhs_mask: Vec<Value<'a>>,
    #[slot(result)]
    pub acc: Vec<Value<'a>>,
    pub lhs_ty: Type<'a>,
    #[dtype(i1 = lhs_ty)]
    pub lhs_mask_ty: Vec<Type<'a>>,
    #[dtype(i1 = lhs_ty)]
    pub rhs_mask_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("arm_sme.smops_4way", format = "$lhs `,` $rhs oilist( `acc` `` `(` $acc `)` | `masks` `` `(` $lhsMask `,` $rhsMask `)` ) attr-dict `:` type($lhs) `,` type($rhs) `into` type($result)", results(result))]
pub struct SMops4WayOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(lhs_ty)]
    pub rhs: Value<'a>,
    #[slot(lhs_mask_ty, name = "lhsMask")]
    pub lhs_mask: Vec<Value<'a>>,
    #[slot(rhs_mask_ty, name = "rhsMask")]
    pub rhs_mask: Vec<Value<'a>>,
    #[slot(result)]
    pub acc: Vec<Value<'a>>,
    pub lhs_ty: Type<'a>,
    #[dtype(i1 = lhs_ty)]
    pub lhs_mask_ty: Vec<Type<'a>>,
    #[dtype(i1 = lhs_ty)]
    pub rhs_mask_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("arm_sme.store_tile_slice", format = "$tile `,` $tile_slice_index `,` $mask `,` $base `[` $indices `]` (`layout` `` $layout^)? attr-dict `:` type($base) `,` type($mask) `,` type($tile)")]
pub struct StoreTileSliceOp<'a> {
    #[slot(tile_ty)]
    pub tile: Value<'a>,
    #[slot(tile_slice_index_ty)]
    pub tile_slice_index: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(base_ty)]
    pub base: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    #[attr(dialect = "arm_sme.layout", default = "<horizontal>")]
    pub layout: Option<Attribute<'a>>,
    pub tile_ty: Type<'a>,
    #[dtype(is = index)]
    pub tile_slice_index_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    pub base_ty: Type<'a>,
    #[dtype(is = index)]
    pub indices_ty: Type<'a>,
}

#[mlir::op("arm_sme.streaming_vl", format = "$type_size attr-dict", results(result))]
pub struct StreamingVLOp<'a> {
    #[attr(dialect = "arm_sme.type_size")]
    pub type_size: Attribute<'a>,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("arm_sme.sumopa_4way", format = "$lhs `,` $rhs oilist( `acc` `` `(` $acc `)` | `masks` `` `(` $lhsMask `,` $rhsMask `)` ) attr-dict `:` type($lhs) `,` type($rhs) `into` type($result)", results(result))]
pub struct SuMopa4WayOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(lhs_ty)]
    pub rhs: Value<'a>,
    #[slot(lhs_mask_ty, name = "lhsMask")]
    pub lhs_mask: Vec<Value<'a>>,
    #[slot(rhs_mask_ty, name = "rhsMask")]
    pub rhs_mask: Vec<Value<'a>>,
    #[slot(result)]
    pub acc: Vec<Value<'a>>,
    pub lhs_ty: Type<'a>,
    #[dtype(i1 = lhs_ty)]
    pub lhs_mask_ty: Vec<Type<'a>>,
    #[dtype(i1 = lhs_ty)]
    pub rhs_mask_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("arm_sme.sumops_4way", format = "$lhs `,` $rhs oilist( `acc` `` `(` $acc `)` | `masks` `` `(` $lhsMask `,` $rhsMask `)` ) attr-dict `:` type($lhs) `,` type($rhs) `into` type($result)", results(result))]
pub struct SuMops4WayOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(lhs_ty)]
    pub rhs: Value<'a>,
    #[slot(lhs_mask_ty, name = "lhsMask")]
    pub lhs_mask: Vec<Value<'a>>,
    #[slot(rhs_mask_ty, name = "rhsMask")]
    pub rhs_mask: Vec<Value<'a>>,
    #[slot(result)]
    pub acc: Vec<Value<'a>>,
    pub lhs_ty: Type<'a>,
    #[dtype(i1 = lhs_ty)]
    pub lhs_mask_ty: Vec<Type<'a>>,
    #[dtype(i1 = lhs_ty)]
    pub rhs_mask_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("arm_sme.tile_load", format = "$base `[` $indices `]` (`,` $padding `,` $mask^)? (`layout` `` $layout^)?attr-dict `:` type($base) `,` type($result)", results(result))]
pub struct TileLoadOp<'a> {
    #[slot(base_ty)]
    pub base: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    #[slot(padding_ty)]
    pub padding: Vec<Value<'a>>,
    #[slot(mask_ty)]
    pub mask: Vec<Value<'a>>,
    #[attr(dialect = "arm_sme.layout", default = "<horizontal>")]
    pub layout: Option<Attribute<'a>>,
    pub base_ty: Type<'a>,
    #[dtype(is = index)]
    pub indices_ty: Type<'a>,
    #[dtype(el = result)]
    pub padding_ty: Vec<Type<'a>>,
    #[dtype(i1 = result)]
    pub mask_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("arm_sme.tile_store", format = "$valueToStore `,` $base `[` $indices `]` (`,` $mask^)? (`layout` `` $layout^)?attr-dict `:` type($base) `,` type($valueToStore)")]
pub struct TileStoreOp<'a> {
    #[slot(value_to_store_ty, name = "valueToStore")]
    pub value_to_store: Value<'a>,
    #[slot(base_ty)]
    pub base: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    #[slot(mask_ty)]
    pub mask: Vec<Value<'a>>,
    #[attr(dialect = "arm_sme.layout", default = "<horizontal>")]
    pub layout: Option<Attribute<'a>>,
    pub value_to_store_ty: Type<'a>,
    pub base_ty: Type<'a>,
    #[dtype(is = index)]
    pub indices_ty: Type<'a>,
    #[dtype(i1 = value_to_store_ty)]
    pub mask_ty: Vec<Type<'a>>,
}

#[mlir::op("arm_sme.umopa_2way", format = "$lhs `,` $rhs oilist( `acc` `` `(` $acc `)` | `masks` `` `(` $lhsMask `,` $rhsMask `)` ) attr-dict `:` type($lhs) `,` type($rhs) `into` type($result)", results(result))]
pub struct UMopa2WayOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(lhs_ty)]
    pub rhs: Value<'a>,
    #[slot(lhs_mask_ty, name = "lhsMask")]
    pub lhs_mask: Vec<Value<'a>>,
    #[slot(rhs_mask_ty, name = "rhsMask")]
    pub rhs_mask: Vec<Value<'a>>,
    #[slot(result)]
    pub acc: Vec<Value<'a>>,
    pub lhs_ty: Type<'a>,
    #[dtype(i1 = lhs_ty)]
    pub lhs_mask_ty: Vec<Type<'a>>,
    #[dtype(i1 = lhs_ty)]
    pub rhs_mask_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("arm_sme.umopa_4way", format = "$lhs `,` $rhs oilist( `acc` `` `(` $acc `)` | `masks` `` `(` $lhsMask `,` $rhsMask `)` ) attr-dict `:` type($lhs) `,` type($rhs) `into` type($result)", results(result))]
pub struct UMopa4WayOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(lhs_ty)]
    pub rhs: Value<'a>,
    #[slot(lhs_mask_ty, name = "lhsMask")]
    pub lhs_mask: Vec<Value<'a>>,
    #[slot(rhs_mask_ty, name = "rhsMask")]
    pub rhs_mask: Vec<Value<'a>>,
    #[slot(result)]
    pub acc: Vec<Value<'a>>,
    pub lhs_ty: Type<'a>,
    #[dtype(i1 = lhs_ty)]
    pub lhs_mask_ty: Vec<Type<'a>>,
    #[dtype(i1 = lhs_ty)]
    pub rhs_mask_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("arm_sme.umops_2way", format = "$lhs `,` $rhs oilist( `acc` `` `(` $acc `)` | `masks` `` `(` $lhsMask `,` $rhsMask `)` ) attr-dict `:` type($lhs) `,` type($rhs) `into` type($result)", results(result))]
pub struct UMops2WayOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(lhs_ty)]
    pub rhs: Value<'a>,
    #[slot(lhs_mask_ty, name = "lhsMask")]
    pub lhs_mask: Vec<Value<'a>>,
    #[slot(rhs_mask_ty, name = "rhsMask")]
    pub rhs_mask: Vec<Value<'a>>,
    #[slot(result)]
    pub acc: Vec<Value<'a>>,
    pub lhs_ty: Type<'a>,
    #[dtype(i1 = lhs_ty)]
    pub lhs_mask_ty: Vec<Type<'a>>,
    #[dtype(i1 = lhs_ty)]
    pub rhs_mask_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("arm_sme.umops_4way", format = "$lhs `,` $rhs oilist( `acc` `` `(` $acc `)` | `masks` `` `(` $lhsMask `,` $rhsMask `)` ) attr-dict `:` type($lhs) `,` type($rhs) `into` type($result)", results(result))]
pub struct UMops4WayOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(lhs_ty)]
    pub rhs: Value<'a>,
    #[slot(lhs_mask_ty, name = "lhsMask")]
    pub lhs_mask: Vec<Value<'a>>,
    #[slot(rhs_mask_ty, name = "rhsMask")]
    pub rhs_mask: Vec<Value<'a>>,
    #[slot(result)]
    pub acc: Vec<Value<'a>>,
    pub lhs_ty: Type<'a>,
    #[dtype(i1 = lhs_ty)]
    pub lhs_mask_ty: Vec<Type<'a>>,
    #[dtype(i1 = lhs_ty)]
    pub rhs_mask_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("arm_sme.usmopa_4way", format = "$lhs `,` $rhs oilist( `acc` `` `(` $acc `)` | `masks` `` `(` $lhsMask `,` $rhsMask `)` ) attr-dict `:` type($lhs) `,` type($rhs) `into` type($result)", results(result))]
pub struct UsMopa4WayOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(lhs_ty)]
    pub rhs: Value<'a>,
    #[slot(lhs_mask_ty, name = "lhsMask")]
    pub lhs_mask: Vec<Value<'a>>,
    #[slot(rhs_mask_ty, name = "rhsMask")]
    pub rhs_mask: Vec<Value<'a>>,
    #[slot(result)]
    pub acc: Vec<Value<'a>>,
    pub lhs_ty: Type<'a>,
    #[dtype(i1 = lhs_ty)]
    pub lhs_mask_ty: Vec<Type<'a>>,
    #[dtype(i1 = lhs_ty)]
    pub rhs_mask_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("arm_sme.usmops_4way", format = "$lhs `,` $rhs oilist( `acc` `` `(` $acc `)` | `masks` `` `(` $lhsMask `,` $rhsMask `)` ) attr-dict `:` type($lhs) `,` type($rhs) `into` type($result)", results(result))]
pub struct UsMops4WayOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(lhs_ty)]
    pub rhs: Value<'a>,
    #[slot(lhs_mask_ty, name = "lhsMask")]
    pub lhs_mask: Vec<Value<'a>>,
    #[slot(rhs_mask_ty, name = "rhsMask")]
    pub rhs_mask: Vec<Value<'a>>,
    #[slot(result)]
    pub acc: Vec<Value<'a>>,
    pub lhs_ty: Type<'a>,
    #[dtype(i1 = lhs_ty)]
    pub lhs_mask_ty: Vec<Type<'a>>,
    #[dtype(i1 = lhs_ty)]
    pub rhs_mask_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("arm_sme.zero", format = "attr-dict `:` type($res)", results(res))]
pub struct ZeroOp<'a> {
    pub res: Type<'a>,
}

#[mlir::dialect(
    "arm_sme",
    ops = [CopyTileOp, ExtractTileSliceOp, FMopa2WayOp, FMops2WayOp, GetTileOp, InsertTileSliceOp, aarch64_sme_cntsd, aarch64_sme_ld1b_horiz, aarch64_sme_ld1b_vert, aarch64_sme_ld1d_horiz, aarch64_sme_ld1d_vert, aarch64_sme_ld1h_horiz, aarch64_sme_ld1h_vert, aarch64_sme_ld1q_horiz, aarch64_sme_ld1q_vert, aarch64_sme_ld1w_horiz, aarch64_sme_ld1w_vert, aarch64_sme_mopa, aarch64_sme_mopa_wide, aarch64_sme_mops, aarch64_sme_mops_wide, aarch64_sme_read_horiz, aarch64_sme_read_vert, aarch64_sme_smopa_wide, aarch64_sme_smopa_za32, aarch64_sme_smops_wide, aarch64_sme_smops_za32, aarch64_sme_st1b_horiz, aarch64_sme_st1b_vert, aarch64_sme_st1d_horiz, aarch64_sme_st1d_vert, aarch64_sme_st1h_horiz, aarch64_sme_st1h_vert, aarch64_sme_st1q_horiz, aarch64_sme_st1q_vert, aarch64_sme_st1w_horiz, aarch64_sme_st1w_vert, aarch64_sme_str, aarch64_sme_sumopa_wide, aarch64_sme_sumops_wide, aarch64_sme_umopa_wide, aarch64_sme_umopa_za32, aarch64_sme_umops_wide, aarch64_sme_umops_za32, aarch64_sme_usmopa_wide, aarch64_sme_usmops_wide, aarch64_sme_write_horiz, aarch64_sme_write_vert, aarch64_sme_zero, LoadTileSliceOp, OuterProductOp, SMopa2WayOp, SMopa4WayOp, SMops2WayOp, SMops4WayOp, StoreTileSliceOp, StreamingVLOp, SuMopa4WayOp, SuMops4WayOp, TileLoadOp, TileStoreOp, UMopa2WayOp, UMopa4WayOp, UMops2WayOp, UMops4WayOp, UsMopa4WayOp, UsMops4WayOp, ZeroOp],
    dependents = ["scf", "vector", "memref"]
)]
pub struct ArmSmeDialect;
