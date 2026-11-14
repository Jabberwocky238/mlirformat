#![allow(non_camel_case_types, unused_imports, clippy::all, rustdoc::all)]

use mlirformat::{mlir, Attribute, Region, Str, Type, Value, __Vec as Vec};

#[mlir::op("gpu.all_reduce", results(result))]
pub struct AllReduceOp<'a> {
    #[slot(result)]
    pub value: Value<'a>,
    #[attr(dialect = "gpu<all_reduce_op")]
    pub op: Option<Attribute<'a>>,
    pub uniform: bool,
    pub body: Region<'a>,
    pub result: Type<'a>,
}

#[mlir::op("gpu.alloc", results(memref, async_token))]
pub struct AllocOp<'a> {
    #[slot(async_dependencies_ty, name = "asyncDependencies")]
    pub async_dependencies: Vec<Value<'a>>,
    #[slot(dynamic_sizes_ty, name = "dynamicSizes")]
    pub dynamic_sizes: Vec<Value<'a>>,
    #[slot(symbol_operands_ty, name = "symbolOperands")]
    pub symbol_operands: Vec<Value<'a>>,
    #[attr(name = "hostShared")]
    pub host_shared: bool,
    pub async_dependencies_ty: Vec<Type<'a>>,
    #[dtype(is = index)]
    pub dynamic_sizes_ty: Type<'a>,
    #[dtype(is = index)]
    pub symbol_operands_ty: Type<'a>,
    pub memref: Type<'a>,
    pub async_token: Vec<Type<'a>>,
}

#[mlir::op("gpu.ballot", format = "$predicate attr-dict `:` type($result)", results(result))]
pub struct BallotOp<'a> {
    #[slot(predicate_ty)]
    pub predicate: Value<'a>,
    #[dtype(is = i1)]
    pub predicate_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("gpu.barrier", format = "oilist( `named` `(` $named_barrier `:` type($named_barrier) `)` | `memfence` $address_spaces | `scope` $scope ) attr-dict")]
pub struct BarrierOp<'a> {
    #[slot(named_barrier_ty)]
    pub named_barrier: Vec<Value<'a>>,
    pub address_spaces: Option<Attribute<'a>>,
    #[attr(dialect = "gpu.barrier_scope", default = "<workgroup>")]
    pub scope: Option<Attribute<'a>>,
    pub named_barrier_ty: Vec<Type<'a>>,
}

#[mlir::op("gpu.binary")]
pub struct BinaryOp<'a> {
    #[attr(symbol)]
    pub sym_name: Attribute<'a>,
    #[attr(name = "offloadingHandler")]
    pub offloading_handler: Option<Attribute<'a>>,
    pub objects: Attribute<'a>,
}

#[mlir::op("gpu.block_dim", format = "$dimension (`upper_bound` $upper_bound^)? attr-dict", results(result))]
pub struct BlockDimOp<'a> {
    #[attr(dialect = "gpu<dim")]
    pub dimension: Attribute<'a>,
    #[attr(int = "index")]
    pub upper_bound: Option<Attribute<'a>>,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("gpu.block_id", format = "$dimension (`upper_bound` $upper_bound^)? attr-dict", results(result))]
pub struct BlockIdOp<'a> {
    #[attr(dialect = "gpu<dim")]
    pub dimension: Attribute<'a>,
    #[attr(int = "index")]
    pub upper_bound: Option<Attribute<'a>>,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("gpu.cluster_block_id", format = "$dimension (`upper_bound` $upper_bound^)? attr-dict", results(result))]
pub struct ClusterBlockIdOp<'a> {
    #[attr(dialect = "gpu<dim")]
    pub dimension: Attribute<'a>,
    #[attr(int = "index")]
    pub upper_bound: Option<Attribute<'a>>,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("gpu.cluster_dim_blocks", format = "$dimension (`upper_bound` $upper_bound^)? attr-dict", results(result))]
pub struct ClusterDimBlocksOp<'a> {
    #[attr(dialect = "gpu<dim")]
    pub dimension: Attribute<'a>,
    #[attr(int = "index")]
    pub upper_bound: Option<Attribute<'a>>,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("gpu.cluster_dim", format = "$dimension (`upper_bound` $upper_bound^)? attr-dict", results(result))]
pub struct ClusterDimOp<'a> {
    #[attr(dialect = "gpu<dim")]
    pub dimension: Attribute<'a>,
    #[attr(int = "index")]
    pub upper_bound: Option<Attribute<'a>>,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("gpu.cluster_id", format = "$dimension (`upper_bound` $upper_bound^)? attr-dict", results(result))]
pub struct ClusterIdOp<'a> {
    #[attr(dialect = "gpu<dim")]
    pub dimension: Attribute<'a>,
    #[attr(int = "index")]
    pub upper_bound: Option<Attribute<'a>>,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("gpu.create_2to4_spmat", results(sp_mat, async_token))]
pub struct Create2To4SpMatOp<'a> {
    #[slot(async_dependencies_ty, name = "asyncDependencies")]
    pub async_dependencies: Vec<Value<'a>>,
    #[slot(rows_ty)]
    pub rows: Value<'a>,
    #[slot(cols_ty)]
    pub cols: Value<'a>,
    #[slot(memref_ty)]
    pub memref: Value<'a>,
    #[attr(name = "pruneFlag", dialect = "gpu<prune_2to4_spmat_flag", default = "PRUNE_AND_CHECK")]
    pub prune_flag: Option<Attribute<'a>>,
    pub async_dependencies_ty: Vec<Type<'a>>,
    #[dtype(is = index)]
    pub rows_ty: Type<'a>,
    #[dtype(is = index)]
    pub cols_ty: Type<'a>,
    pub memref_ty: Type<'a>,
    pub sp_mat: Type<'a>,
    pub async_token: Vec<Type<'a>>,
}

#[mlir::op("gpu.create_bsr", results(spmat, async_token))]
pub struct CreateBsrOp<'a> {
    #[slot(async_dependencies_ty, name = "asyncDependencies")]
    pub async_dependencies: Vec<Value<'a>>,
    #[slot(brows_ty)]
    pub brows: Value<'a>,
    #[slot(bcols_ty)]
    pub bcols: Value<'a>,
    #[slot(bnnz_ty)]
    pub bnnz: Value<'a>,
    #[slot(r_block_size_ty, name = "rBlockSize")]
    pub r_block_size: Value<'a>,
    #[slot(c_block_size_ty, name = "cBlockSize")]
    pub c_block_size: Value<'a>,
    #[slot(b_row_pos_ty, name = "bRowPos")]
    pub b_row_pos: Value<'a>,
    #[slot(b_col_idxs_ty, name = "bColIdxs")]
    pub b_col_idxs: Value<'a>,
    #[slot(values_ty)]
    pub values: Value<'a>,
    pub async_dependencies_ty: Vec<Type<'a>>,
    #[dtype(is = index)]
    pub brows_ty: Type<'a>,
    #[dtype(is = index)]
    pub bcols_ty: Type<'a>,
    #[dtype(is = index)]
    pub bnnz_ty: Type<'a>,
    #[dtype(is = index)]
    pub r_block_size_ty: Type<'a>,
    #[dtype(is = index)]
    pub c_block_size_ty: Type<'a>,
    pub b_row_pos_ty: Type<'a>,
    pub b_col_idxs_ty: Type<'a>,
    pub values_ty: Type<'a>,
    pub spmat: Type<'a>,
    pub async_token: Vec<Type<'a>>,
}

#[mlir::op("gpu.create_coo_aos", results(spmat, async_token))]
pub struct CreateCooAoSOp<'a> {
    #[slot(async_dependencies_ty, name = "asyncDependencies")]
    pub async_dependencies: Vec<Value<'a>>,
    #[slot(rows_ty)]
    pub rows: Value<'a>,
    #[slot(cols_ty)]
    pub cols: Value<'a>,
    #[slot(nnz_ty)]
    pub nnz: Value<'a>,
    #[slot(idxs_ty)]
    pub idxs: Value<'a>,
    #[slot(values_ty)]
    pub values: Value<'a>,
    pub async_dependencies_ty: Vec<Type<'a>>,
    #[dtype(is = index)]
    pub rows_ty: Type<'a>,
    #[dtype(is = index)]
    pub cols_ty: Type<'a>,
    #[dtype(is = index)]
    pub nnz_ty: Type<'a>,
    pub idxs_ty: Type<'a>,
    pub values_ty: Type<'a>,
    pub spmat: Type<'a>,
    pub async_token: Vec<Type<'a>>,
}

#[mlir::op("gpu.create_coo", results(spmat, async_token))]
pub struct CreateCooOp<'a> {
    #[slot(async_dependencies_ty, name = "asyncDependencies")]
    pub async_dependencies: Vec<Value<'a>>,
    #[slot(rows_ty)]
    pub rows: Value<'a>,
    #[slot(cols_ty)]
    pub cols: Value<'a>,
    #[slot(nnz_ty)]
    pub nnz: Value<'a>,
    #[slot(row_idxs_ty, name = "rowIdxs")]
    pub row_idxs: Value<'a>,
    #[slot(col_idxs_ty, name = "colIdxs")]
    pub col_idxs: Value<'a>,
    #[slot(values_ty)]
    pub values: Value<'a>,
    pub async_dependencies_ty: Vec<Type<'a>>,
    #[dtype(is = index)]
    pub rows_ty: Type<'a>,
    #[dtype(is = index)]
    pub cols_ty: Type<'a>,
    #[dtype(is = index)]
    pub nnz_ty: Type<'a>,
    pub row_idxs_ty: Type<'a>,
    pub col_idxs_ty: Type<'a>,
    pub values_ty: Type<'a>,
    pub spmat: Type<'a>,
    pub async_token: Vec<Type<'a>>,
}

#[mlir::op("gpu.create_csc", results(spmat, async_token))]
pub struct CreateCscOp<'a> {
    #[slot(async_dependencies_ty, name = "asyncDependencies")]
    pub async_dependencies: Vec<Value<'a>>,
    #[slot(rows_ty)]
    pub rows: Value<'a>,
    #[slot(cols_ty)]
    pub cols: Value<'a>,
    #[slot(nnz_ty)]
    pub nnz: Value<'a>,
    #[slot(col_pos_ty, name = "colPos")]
    pub col_pos: Value<'a>,
    #[slot(row_idxs_ty, name = "rowIdxs")]
    pub row_idxs: Value<'a>,
    #[slot(values_ty)]
    pub values: Value<'a>,
    pub async_dependencies_ty: Vec<Type<'a>>,
    #[dtype(is = index)]
    pub rows_ty: Type<'a>,
    #[dtype(is = index)]
    pub cols_ty: Type<'a>,
    #[dtype(is = index)]
    pub nnz_ty: Type<'a>,
    pub col_pos_ty: Type<'a>,
    pub row_idxs_ty: Type<'a>,
    pub values_ty: Type<'a>,
    pub spmat: Type<'a>,
    pub async_token: Vec<Type<'a>>,
}

#[mlir::op("gpu.create_csr", results(spmat, async_token))]
pub struct CreateCsrOp<'a> {
    #[slot(async_dependencies_ty, name = "asyncDependencies")]
    pub async_dependencies: Vec<Value<'a>>,
    #[slot(rows_ty)]
    pub rows: Value<'a>,
    #[slot(cols_ty)]
    pub cols: Value<'a>,
    #[slot(nnz_ty)]
    pub nnz: Value<'a>,
    #[slot(row_pos_ty, name = "rowPos")]
    pub row_pos: Value<'a>,
    #[slot(col_idxs_ty, name = "colIdxs")]
    pub col_idxs: Value<'a>,
    #[slot(values_ty)]
    pub values: Value<'a>,
    pub async_dependencies_ty: Vec<Type<'a>>,
    #[dtype(is = index)]
    pub rows_ty: Type<'a>,
    #[dtype(is = index)]
    pub cols_ty: Type<'a>,
    #[dtype(is = index)]
    pub nnz_ty: Type<'a>,
    pub row_pos_ty: Type<'a>,
    pub col_idxs_ty: Type<'a>,
    pub values_ty: Type<'a>,
    pub spmat: Type<'a>,
    pub async_token: Vec<Type<'a>>,
}

#[mlir::op("gpu.create_dn_tensor", results(dn_tensor, async_token))]
pub struct CreateDnTensorOp<'a> {
    #[slot(async_dependencies_ty, name = "asyncDependencies")]
    pub async_dependencies: Vec<Value<'a>>,
    #[slot(memref_ty)]
    pub memref: Value<'a>,
    #[slot(dims_ty)]
    pub dims: Vec<Value<'a>>,
    pub async_dependencies_ty: Vec<Type<'a>>,
    pub memref_ty: Type<'a>,
    #[dtype(is = index)]
    pub dims_ty: Type<'a>,
    pub dn_tensor: Type<'a>,
    pub async_token: Vec<Type<'a>>,
}

#[mlir::op("gpu.dealloc", results(async_token))]
pub struct DeallocOp<'a> {
    #[slot(async_dependencies_ty, name = "asyncDependencies")]
    pub async_dependencies: Vec<Value<'a>>,
    #[slot(memref_ty)]
    pub memref: Value<'a>,
    pub async_dependencies_ty: Vec<Type<'a>>,
    pub memref_ty: Type<'a>,
    pub async_token: Vec<Type<'a>>,
}

#[mlir::op("gpu.destroy_dn_tensor", results(async_token))]
pub struct DestroyDnTensorOp<'a> {
    #[slot(async_dependencies_ty, name = "asyncDependencies")]
    pub async_dependencies: Vec<Value<'a>>,
    #[slot(dn_tensor_ty, name = "dnTensor")]
    pub dn_tensor: Value<'a>,
    pub async_dependencies_ty: Vec<Type<'a>>,
    pub dn_tensor_ty: Type<'a>,
    pub async_token: Vec<Type<'a>>,
}

#[mlir::op("gpu.destroy_sp_mat", results(async_token))]
pub struct DestroySpMatOp<'a> {
    #[slot(async_dependencies_ty, name = "asyncDependencies")]
    pub async_dependencies: Vec<Value<'a>>,
    #[slot(spmat_ty)]
    pub spmat: Value<'a>,
    pub async_dependencies_ty: Vec<Type<'a>>,
    pub spmat_ty: Type<'a>,
    pub async_token: Vec<Type<'a>>,
}

#[mlir::op("gpu.dynamic_shared_memory", format = "attr-dict `:` type($resultMemref)", results(result_memref))]
pub struct DynamicSharedMemoryOp<'a> {
    #[dtype(name = "resultMemref")]
    pub result_memref: Type<'a>,
}

#[mlir::op("gpu.func")]
pub struct GPUFuncOp<'a> {
    pub function_type: Attribute<'a>,
    pub arg_attrs: Option<Attribute<'a>>,
    pub res_attrs: Option<Attribute<'a>>,
    pub workgroup_attrib_attrs: Option<Attribute<'a>>,
    pub private_attrib_attrs: Option<Attribute<'a>>,
    pub known_block_size: Option<Attribute<'a>>,
    pub known_grid_size: Option<Attribute<'a>>,
    pub known_cluster_size: Option<Attribute<'a>>,
    #[attr(int = "i64")]
    pub workgroup_attributions: Option<Attribute<'a>>,
    pub kernel: bool,
    pub body: Region<'a>,
}

#[mlir::op("gpu.module", format = "$sym_name (`<` $offloadingHandler^ `>`)? ($targets^)? attr-dict-with-keyword $bodyRegion")]
pub struct GPUModuleOp<'a> {
    #[attr(symbol)]
    pub sym_name: Attribute<'a>,
    pub targets: Option<Attribute<'a>>,
    #[attr(name = "offloadingHandler")]
    pub offloading_handler: Option<Attribute<'a>>,
    #[region(name = "bodyRegion")]
    pub body_region: Region<'a>,
}

#[mlir::op("gpu.global_id", format = "$dimension (`upper_bound` $upper_bound^)? attr-dict", results(result))]
pub struct GlobalIdOp<'a> {
    #[attr(dialect = "gpu<dim")]
    pub dimension: Attribute<'a>,
    #[attr(int = "index")]
    pub upper_bound: Option<Attribute<'a>>,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("gpu.grid_dim", format = "$dimension (`upper_bound` $upper_bound^)? attr-dict", results(result))]
pub struct GridDimOp<'a> {
    #[attr(dialect = "gpu<dim")]
    pub dimension: Attribute<'a>,
    #[attr(int = "index")]
    pub upper_bound: Option<Attribute<'a>>,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("gpu.host_register", format = "$value attr-dict `:` type($value)")]
pub struct HostRegisterOp<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    pub value_ty: Type<'a>,
}

#[mlir::op("gpu.host_unregister", format = "$value attr-dict `:` type($value)")]
pub struct HostUnregisterOp<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    pub value_ty: Type<'a>,
}

#[mlir::op("gpu.initialize_named_barrier", format = "$member_count attr-dict `:` type($member_count) `->` type($result)", results(result))]
pub struct InitializeNamedBarrierOp<'a> {
    #[slot(member_count_ty)]
    pub member_count: Value<'a>,
    #[dtype(is = i32)]
    pub member_count_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("gpu.lane_id", format = "(`upper_bound` $upper_bound^)? attr-dict", results(result))]
pub struct LaneIdOp<'a> {
    #[attr(int = "index")]
    pub upper_bound: Option<Attribute<'a>>,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("gpu.launch_func", results(async_token))]
pub struct LaunchFuncOp<'a> {
    #[slot(async_dependencies_ty, name = "asyncDependencies")]
    pub async_dependencies: Vec<Value<'a>>,
    #[slot(grid_size_x_ty, name = "gridSizeX")]
    pub grid_size_x: Value<'a>,
    #[slot(grid_size_x_ty, name = "gridSizeY")]
    pub grid_size_y: Value<'a>,
    #[slot(grid_size_x_ty, name = "gridSizeZ")]
    pub grid_size_z: Value<'a>,
    #[slot(grid_size_x_ty, name = "blockSizeX")]
    pub block_size_x: Value<'a>,
    #[slot(grid_size_x_ty, name = "blockSizeY")]
    pub block_size_y: Value<'a>,
    #[slot(grid_size_x_ty, name = "blockSizeZ")]
    pub block_size_z: Value<'a>,
    #[slot(cluster_size_x_ty, name = "clusterSizeX")]
    pub cluster_size_x: Vec<Value<'a>>,
    #[slot(cluster_size_y_ty, name = "clusterSizeY")]
    pub cluster_size_y: Vec<Value<'a>>,
    #[slot(cluster_size_z_ty, name = "clusterSizeZ")]
    pub cluster_size_z: Vec<Value<'a>>,
    #[slot(dynamic_shared_memory_size_ty, name = "dynamicSharedMemorySize")]
    pub dynamic_shared_memory_size: Vec<Value<'a>>,
    #[slot(kernel_operands_ty, name = "kernelOperands")]
    pub kernel_operands: Vec<Value<'a>>,
    #[slot(async_object_ty, name = "asyncObject")]
    pub async_object: Vec<Value<'a>>,
    pub kernel: Attribute<'a>,
    pub cooperative: bool,
    pub async_dependencies_ty: Vec<Type<'a>>,
    pub grid_size_x_ty: Type<'a>,
    pub cluster_size_x_ty: Vec<Type<'a>>,
    pub cluster_size_y_ty: Vec<Type<'a>>,
    pub cluster_size_z_ty: Vec<Type<'a>>,
    #[dtype(is = i32)]
    pub dynamic_shared_memory_size_ty: Type<'a>,
    pub kernel_operands_ty: Vec<Type<'a>>,
    pub async_object_ty: Vec<Type<'a>>,
    pub async_token: Vec<Type<'a>>,
}

#[mlir::op("gpu.launch", results(async_token))]
pub struct LaunchOp<'a> {
    #[slot(async_dependencies_ty, name = "asyncDependencies")]
    pub async_dependencies: Vec<Value<'a>>,
    #[slot(grid_size_x_ty, name = "gridSizeX")]
    pub grid_size_x: Value<'a>,
    #[slot(grid_size_y_ty, name = "gridSizeY")]
    pub grid_size_y: Value<'a>,
    #[slot(grid_size_z_ty, name = "gridSizeZ")]
    pub grid_size_z: Value<'a>,
    #[slot(block_size_x_ty, name = "blockSizeX")]
    pub block_size_x: Value<'a>,
    #[slot(block_size_y_ty, name = "blockSizeY")]
    pub block_size_y: Value<'a>,
    #[slot(block_size_z_ty, name = "blockSizeZ")]
    pub block_size_z: Value<'a>,
    #[slot(cluster_size_x_ty, name = "clusterSizeX")]
    pub cluster_size_x: Vec<Value<'a>>,
    #[slot(cluster_size_y_ty, name = "clusterSizeY")]
    pub cluster_size_y: Vec<Value<'a>>,
    #[slot(cluster_size_z_ty, name = "clusterSizeZ")]
    pub cluster_size_z: Vec<Value<'a>>,
    #[slot(dynamic_shared_memory_size_ty, name = "dynamicSharedMemorySize")]
    pub dynamic_shared_memory_size: Vec<Value<'a>>,
    pub cooperative: bool,
    pub module: Option<Attribute<'a>>,
    pub function: Option<Attribute<'a>>,
    #[attr(int = "i64")]
    pub workgroup_attributions: Option<Attribute<'a>>,
    pub body: Region<'a>,
    pub async_dependencies_ty: Vec<Type<'a>>,
    #[dtype(is = index)]
    pub grid_size_x_ty: Type<'a>,
    #[dtype(is = index)]
    pub grid_size_y_ty: Type<'a>,
    #[dtype(is = index)]
    pub grid_size_z_ty: Type<'a>,
    #[dtype(is = index)]
    pub block_size_x_ty: Type<'a>,
    #[dtype(is = index)]
    pub block_size_y_ty: Type<'a>,
    #[dtype(is = index)]
    pub block_size_z_ty: Type<'a>,
    #[dtype(is = index)]
    pub cluster_size_x_ty: Type<'a>,
    #[dtype(is = index)]
    pub cluster_size_y_ty: Type<'a>,
    #[dtype(is = index)]
    pub cluster_size_z_ty: Type<'a>,
    #[dtype(is = i32)]
    pub dynamic_shared_memory_size_ty: Type<'a>,
    pub async_token: Vec<Type<'a>>,
}

#[mlir::op("gpu.memcpy", results(async_token))]
pub struct MemcpyOp<'a> {
    #[slot(async_dependencies_ty, name = "asyncDependencies")]
    pub async_dependencies: Vec<Value<'a>>,
    #[slot(dst_ty)]
    pub dst: Value<'a>,
    #[slot(src_ty)]
    pub src: Value<'a>,
    pub async_dependencies_ty: Vec<Type<'a>>,
    pub dst_ty: Type<'a>,
    pub src_ty: Type<'a>,
    pub async_token: Vec<Type<'a>>,
}

#[mlir::op("gpu.memset", results(async_token))]
pub struct MemsetOp<'a> {
    #[slot(async_dependencies_ty, name = "asyncDependencies")]
    pub async_dependencies: Vec<Value<'a>>,
    #[slot(dst_ty)]
    pub dst: Value<'a>,
    #[slot(value_ty)]
    pub value: Value<'a>,
    pub async_dependencies_ty: Vec<Type<'a>>,
    pub dst_ty: Type<'a>,
    pub value_ty: Type<'a>,
    pub async_token: Vec<Type<'a>>,
}

#[mlir::op("gpu.num_subgroups", format = "(`upper_bound` $upper_bound^)? attr-dict `:` type($result)", results(result))]
pub struct NumSubgroupsOp<'a> {
    #[attr(int = "index")]
    pub upper_bound: Option<Attribute<'a>>,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("gpu.printf", format = "$format attr-dict (`,` $args^ `:` type($args))?")]
pub struct PrintfOp<'a> {
    #[slot(args_ty)]
    pub args: Vec<Value<'a>>,
    pub format: Attribute<'a>,
    pub args_ty: Vec<Type<'a>>,
}

#[mlir::op("gpu.return", format = "attr-dict ($operands^ `:` type($operands))?")]
pub struct ReturnOp<'a> {
    #[slot(operands_ty)]
    pub operands: Vec<Value<'a>>,
    pub operands_ty: Vec<Type<'a>>,
}

#[mlir::op("gpu.rotate", format = "$value `,` $offset `,` $width attr-dict `:` type($value)", results(rotate_result, valid))]
pub struct RotateOp<'a> {
    #[slot(rotate_result)]
    pub value: Value<'a>,
    #[attr(int = "i32")]
    pub offset: Attribute<'a>,
    #[attr(int = "i32")]
    pub width: Attribute<'a>,
    pub rotate_result: Type<'a>,
    #[dtype(is = i1)]
    pub valid: Type<'a>,
}

#[mlir::op("gpu.sddmm_buffer_size", results(buffer_sz, async_token))]
pub struct SDDMMBufferSizeOp<'a> {
    #[slot(async_dependencies_ty, name = "asyncDependencies")]
    pub async_dependencies: Vec<Value<'a>>,
    #[slot(dnmat_a_ty, name = "dnmatA")]
    pub dnmat_a: Value<'a>,
    #[slot(dnmat_b_ty, name = "dnmatB")]
    pub dnmat_b: Value<'a>,
    #[slot(spmat_c_ty, name = "spmatC")]
    pub spmat_c: Value<'a>,
    #[attr(name = "modeA", dialect = "gpu<mat_transpose_mode", default = "NON_TRANSPOSE")]
    pub mode_a: Option<Attribute<'a>>,
    #[attr(name = "modeB", dialect = "gpu<mat_transpose_mode", default = "NON_TRANSPOSE")]
    pub mode_b: Option<Attribute<'a>>,
    #[attr(name = "computeType")]
    pub compute_type: Attribute<'a>,
    pub async_dependencies_ty: Vec<Type<'a>>,
    pub dnmat_a_ty: Type<'a>,
    pub dnmat_b_ty: Type<'a>,
    pub spmat_c_ty: Type<'a>,
    #[dtype(is = index)]
    pub buffer_sz: Type<'a>,
    pub async_token: Vec<Type<'a>>,
}

#[mlir::op("gpu.sddmm", results(async_token))]
pub struct SDDMMOp<'a> {
    #[slot(async_dependencies_ty, name = "asyncDependencies")]
    pub async_dependencies: Vec<Value<'a>>,
    #[slot(dnmat_a_ty, name = "dnmatA")]
    pub dnmat_a: Value<'a>,
    #[slot(dnmat_b_ty, name = "dnmatB")]
    pub dnmat_b: Value<'a>,
    #[slot(spmat_c_ty, name = "spmatC")]
    pub spmat_c: Value<'a>,
    #[slot(buffer_ty)]
    pub buffer: Value<'a>,
    #[attr(name = "modeA", dialect = "gpu<mat_transpose_mode", default = "NON_TRANSPOSE")]
    pub mode_a: Option<Attribute<'a>>,
    #[attr(name = "modeB", dialect = "gpu<mat_transpose_mode", default = "NON_TRANSPOSE")]
    pub mode_b: Option<Attribute<'a>>,
    #[attr(name = "computeType")]
    pub compute_type: Attribute<'a>,
    pub async_dependencies_ty: Vec<Type<'a>>,
    pub dnmat_a_ty: Type<'a>,
    pub dnmat_b_ty: Type<'a>,
    pub spmat_c_ty: Type<'a>,
    pub buffer_ty: Type<'a>,
    pub async_token: Vec<Type<'a>>,
}

#[mlir::op("gpu.set_csr_pointers", results(async_token))]
pub struct SetCsrPointersOp<'a> {
    #[slot(async_dependencies_ty, name = "asyncDependencies")]
    pub async_dependencies: Vec<Value<'a>>,
    #[slot(spmat_ty)]
    pub spmat: Value<'a>,
    #[slot(positions_ty)]
    pub positions: Value<'a>,
    #[slot(coordinates_ty)]
    pub coordinates: Value<'a>,
    #[slot(values_ty)]
    pub values: Value<'a>,
    pub async_dependencies_ty: Vec<Type<'a>>,
    pub spmat_ty: Type<'a>,
    pub positions_ty: Type<'a>,
    pub coordinates_ty: Type<'a>,
    pub values_ty: Type<'a>,
    pub async_token: Vec<Type<'a>>,
}

#[mlir::op("gpu.set_default_device", format = "attr-dict $devIndex")]
pub struct SetDefaultDeviceOp<'a> {
    #[slot(dev_index_ty, name = "devIndex")]
    pub dev_index: Value<'a>,
    #[dtype(is = i32)]
    pub dev_index_ty: Type<'a>,
}

#[mlir::op("gpu.shuffle", format = "$mode $value `,` $offset `,` $width attr-dict `:` type($value)", results(shuffle_result, valid))]
pub struct ShuffleOp<'a> {
    #[slot(shuffle_result)]
    pub value: Value<'a>,
    #[slot(offset_ty)]
    pub offset: Value<'a>,
    #[slot(width_ty)]
    pub width: Value<'a>,
    #[attr(dialect = "gpu<shuffle_mode")]
    pub mode: Attribute<'a>,
    #[dtype(is = i32)]
    pub offset_ty: Type<'a>,
    #[dtype(is = i32)]
    pub width_ty: Type<'a>,
    pub shuffle_result: Type<'a>,
    #[dtype(is = i1)]
    pub valid: Type<'a>,
}

#[mlir::op("gpu.spgemm_copy", results(async_token))]
pub struct SpGEMMCopyOp<'a> {
    #[slot(async_dependencies_ty, name = "asyncDependencies")]
    pub async_dependencies: Vec<Value<'a>>,
    #[slot(desc_ty)]
    pub desc: Value<'a>,
    #[slot(spmat_a_ty, name = "spmatA")]
    pub spmat_a: Value<'a>,
    #[slot(spmat_b_ty, name = "spmatB")]
    pub spmat_b: Value<'a>,
    #[slot(spmat_c_ty, name = "spmatC")]
    pub spmat_c: Value<'a>,
    #[attr(name = "modeA", dialect = "gpu<mat_transpose_mode", default = "NON_TRANSPOSE")]
    pub mode_a: Option<Attribute<'a>>,
    #[attr(name = "modeB", dialect = "gpu<mat_transpose_mode", default = "NON_TRANSPOSE")]
    pub mode_b: Option<Attribute<'a>>,
    #[attr(name = "computeType")]
    pub compute_type: Attribute<'a>,
    pub async_dependencies_ty: Vec<Type<'a>>,
    pub desc_ty: Type<'a>,
    pub spmat_a_ty: Type<'a>,
    pub spmat_b_ty: Type<'a>,
    pub spmat_c_ty: Type<'a>,
    pub async_token: Vec<Type<'a>>,
}

#[mlir::op("gpu.spgemm_create_descr", results(desc, async_token))]
pub struct SpGEMMCreateDescrOp<'a> {
    #[slot(async_dependencies_ty, name = "asyncDependencies")]
    pub async_dependencies: Vec<Value<'a>>,
    pub async_dependencies_ty: Vec<Type<'a>>,
    pub desc: Type<'a>,
    pub async_token: Vec<Type<'a>>,
}

#[mlir::op("gpu.spgemm_destroy_descr", results(async_token))]
pub struct SpGEMMDestroyDescrOp<'a> {
    #[slot(async_dependencies_ty, name = "asyncDependencies")]
    pub async_dependencies: Vec<Value<'a>>,
    #[slot(desc_ty)]
    pub desc: Value<'a>,
    pub async_dependencies_ty: Vec<Type<'a>>,
    pub desc_ty: Type<'a>,
    pub async_token: Vec<Type<'a>>,
}

#[mlir::op("gpu.spgemm_work_estimation_or_compute", results(buffer_sz_new, async_token))]
pub struct SpGEMMWorkEstimationOrComputeOp<'a> {
    #[slot(async_dependencies_ty, name = "asyncDependencies")]
    pub async_dependencies: Vec<Value<'a>>,
    #[slot(desc_ty)]
    pub desc: Value<'a>,
    #[slot(spmat_a_ty, name = "spmatA")]
    pub spmat_a: Value<'a>,
    #[slot(spmat_b_ty, name = "spmatB")]
    pub spmat_b: Value<'a>,
    #[slot(spmat_c_ty, name = "spmatC")]
    pub spmat_c: Value<'a>,
    #[slot(buffer_sz_ty, name = "bufferSz")]
    pub buffer_sz: Value<'a>,
    #[slot(buffer_ty)]
    pub buffer: Value<'a>,
    #[attr(name = "modeA", dialect = "gpu<mat_transpose_mode", default = "NON_TRANSPOSE")]
    pub mode_a: Option<Attribute<'a>>,
    #[attr(name = "modeB", dialect = "gpu<mat_transpose_mode", default = "NON_TRANSPOSE")]
    pub mode_b: Option<Attribute<'a>>,
    #[attr(name = "computeType")]
    pub compute_type: Attribute<'a>,
    #[attr(dialect = "gpu<spgemm_work_estimation_or_compute_kind")]
    pub kind: Attribute<'a>,
    pub async_dependencies_ty: Vec<Type<'a>>,
    pub desc_ty: Type<'a>,
    pub spmat_a_ty: Type<'a>,
    pub spmat_b_ty: Type<'a>,
    pub spmat_c_ty: Type<'a>,
    #[dtype(is = index)]
    pub buffer_sz_ty: Type<'a>,
    pub buffer_ty: Type<'a>,
    #[dtype(is = index)]
    pub buffer_sz_new: Type<'a>,
    pub async_token: Vec<Type<'a>>,
}

#[mlir::op("gpu.spmm_buffer_size", results(buffer_szs, async_token))]
pub struct SpMMBufferSizeOp<'a> {
    #[slot(async_dependencies_ty, name = "asyncDependencies")]
    pub async_dependencies: Vec<Value<'a>>,
    #[slot(spmat_a_ty, name = "spmatA")]
    pub spmat_a: Value<'a>,
    #[slot(dnmat_b_ty, name = "dnmatB")]
    pub dnmat_b: Value<'a>,
    #[slot(dnmat_c_ty, name = "dnmatC")]
    pub dnmat_c: Value<'a>,
    #[attr(name = "modeA", dialect = "gpu<mat_transpose_mode", default = "NON_TRANSPOSE")]
    pub mode_a: Option<Attribute<'a>>,
    #[attr(name = "modeB", dialect = "gpu<mat_transpose_mode", default = "NON_TRANSPOSE")]
    pub mode_b: Option<Attribute<'a>>,
    #[attr(name = "computeType")]
    pub compute_type: Attribute<'a>,
    pub async_dependencies_ty: Vec<Type<'a>>,
    pub spmat_a_ty: Type<'a>,
    pub dnmat_b_ty: Type<'a>,
    pub dnmat_c_ty: Type<'a>,
    #[dtype(is = index)]
    pub buffer_szs: Type<'a>,
    pub async_token: Vec<Type<'a>>,
}

#[mlir::op("gpu.spmm", results(async_token))]
pub struct SpMMOp<'a> {
    #[slot(async_dependencies_ty, name = "asyncDependencies")]
    pub async_dependencies: Vec<Value<'a>>,
    #[slot(spmat_a_ty, name = "spmatA")]
    pub spmat_a: Value<'a>,
    #[slot(dnmat_b_ty, name = "dnmatB")]
    pub dnmat_b: Value<'a>,
    #[slot(dnmat_c_ty, name = "dnmatC")]
    pub dnmat_c: Value<'a>,
    #[slot(buffers_ty)]
    pub buffers: Vec<Value<'a>>,
    #[attr(name = "modeA", dialect = "gpu<mat_transpose_mode", default = "NON_TRANSPOSE")]
    pub mode_a: Option<Attribute<'a>>,
    #[attr(name = "modeB", dialect = "gpu<mat_transpose_mode", default = "NON_TRANSPOSE")]
    pub mode_b: Option<Attribute<'a>>,
    #[attr(name = "computeType")]
    pub compute_type: Attribute<'a>,
    pub async_dependencies_ty: Vec<Type<'a>>,
    pub spmat_a_ty: Type<'a>,
    pub dnmat_b_ty: Type<'a>,
    pub dnmat_c_ty: Type<'a>,
    pub buffers_ty: Vec<Type<'a>>,
    pub async_token: Vec<Type<'a>>,
}

#[mlir::op("gpu.spmv_buffer_size", results(buffer_sz, async_token))]
pub struct SpMVBufferSizeOp<'a> {
    #[slot(async_dependencies_ty, name = "asyncDependencies")]
    pub async_dependencies: Vec<Value<'a>>,
    #[slot(spmat_a_ty, name = "spmatA")]
    pub spmat_a: Value<'a>,
    #[slot(dn_x_ty, name = "dnX")]
    pub dn_x: Value<'a>,
    #[slot(dn_y_ty, name = "dnY")]
    pub dn_y: Value<'a>,
    #[attr(name = "modeA", dialect = "gpu<mat_transpose_mode", default = "NON_TRANSPOSE")]
    pub mode_a: Option<Attribute<'a>>,
    #[attr(name = "computeType")]
    pub compute_type: Attribute<'a>,
    pub async_dependencies_ty: Vec<Type<'a>>,
    pub spmat_a_ty: Type<'a>,
    pub dn_x_ty: Type<'a>,
    pub dn_y_ty: Type<'a>,
    #[dtype(is = index)]
    pub buffer_sz: Type<'a>,
    pub async_token: Vec<Type<'a>>,
}

#[mlir::op("gpu.spmv", results(async_token))]
pub struct SpMVOp<'a> {
    #[slot(async_dependencies_ty, name = "asyncDependencies")]
    pub async_dependencies: Vec<Value<'a>>,
    #[slot(spmat_a_ty, name = "spmatA")]
    pub spmat_a: Value<'a>,
    #[slot(dn_x_ty, name = "dnX")]
    pub dn_x: Value<'a>,
    #[slot(dn_y_ty, name = "dnY")]
    pub dn_y: Value<'a>,
    #[slot(buffer_ty)]
    pub buffer: Value<'a>,
    #[attr(name = "modeA", dialect = "gpu<mat_transpose_mode", default = "NON_TRANSPOSE")]
    pub mode_a: Option<Attribute<'a>>,
    #[attr(name = "computeType")]
    pub compute_type: Attribute<'a>,
    pub async_dependencies_ty: Vec<Type<'a>>,
    pub spmat_a_ty: Type<'a>,
    pub dn_x_ty: Type<'a>,
    pub dn_y_ty: Type<'a>,
    pub buffer_ty: Type<'a>,
    pub async_token: Vec<Type<'a>>,
}

#[mlir::op("gpu.spmat_get_size", results(rows, cols, nnz, async_token))]
pub struct SpMatGetSizeOp<'a> {
    #[slot(async_dependencies_ty, name = "asyncDependencies")]
    pub async_dependencies: Vec<Value<'a>>,
    #[slot(spmat_ty)]
    pub spmat: Value<'a>,
    pub async_dependencies_ty: Vec<Type<'a>>,
    pub spmat_ty: Type<'a>,
    #[dtype(is = index)]
    pub rows: Type<'a>,
    #[dtype(is = index)]
    pub cols: Type<'a>,
    #[dtype(is = index)]
    pub nnz: Type<'a>,
    pub async_token: Vec<Type<'a>>,
}

#[mlir::op("gpu.subgroup_broadcast", format = "$src `,` $broadcast_type ($lane^)? attr-dict `:` type($result)", results(result))]
pub struct SubgroupBroadcastOp<'a> {
    #[slot(result)]
    pub src: Value<'a>,
    #[slot(lane_ty)]
    pub lane: Vec<Value<'a>>,
    #[attr(dialect = "gpu<broadcast")]
    pub broadcast_type: Attribute<'a>,
    #[dtype(is = i32)]
    pub lane_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("gpu.subgroup_id", format = "(`upper_bound` $upper_bound^)? attr-dict `:` type($result)", results(result))]
pub struct SubgroupIdOp<'a> {
    #[attr(int = "index")]
    pub upper_bound: Option<Attribute<'a>>,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("gpu.subgroup_mma_compute", format = "$opA`,` $opB`,` $opC attr-dict `:` type($opA)`,` type($opB) `->` type($res)", results(res))]
pub struct SubgroupMmaComputeOp<'a> {
    #[slot(op_a_ty, name = "opA")]
    pub op_a: Value<'a>,
    #[slot(op_b_ty, name = "opB")]
    pub op_b: Value<'a>,
    #[slot(res, name = "opC")]
    pub op_c: Value<'a>,
    pub a_transpose: bool,
    pub b_transpose: bool,
    pub op_a_ty: Type<'a>,
    pub op_b_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("gpu.subgroup_mma_constant_matrix", format = "$value attr-dict `:` type($res)", results(res))]
pub struct SubgroupMmaConstantMatrixOp<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[dtype(el = res)]
    pub value_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("gpu.subgroup_mma_elementwise", format = "$opType $args attr-dict `:` functional-type($args, $res)", results(res))]
pub struct SubgroupMmaElementwiseOp<'a> {
    #[slot(args_ty)]
    pub args: Vec<Value<'a>>,
    #[attr(name = "opType", dialect = "gpu<mma_element_wise")]
    pub op_type: Attribute<'a>,
    pub args_ty: Vec<Type<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("gpu.subgroup_mma_extract_thread_local", format = "$matrix`[`$indices`]` attr-dict `:` type($matrix) `->` type($res)", results(res))]
pub struct SubgroupMmaExtractThreadLocalOp<'a> {
    #[slot(matrix_ty)]
    pub matrix: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    pub matrix_ty: Type<'a>,
    #[dtype(is = index)]
    pub indices_ty: Type<'a>,
    #[dtype(el = matrix_ty)]
    pub res: Type<'a>,
}

#[mlir::op("gpu.subgroup_mma_insert_thread_local", format = "$value`,` $matrix`[`$indices`]` attr-dict `:` type($value)`,` type($matrix) `->` type($res)", results(res))]
pub struct SubgroupMmaInsertThreadLocalOp<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[slot(matrix_ty)]
    pub matrix: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    #[dtype(el = matrix_ty)]
    pub value_ty: Type<'a>,
    pub matrix_ty: Type<'a>,
    #[dtype(is = index)]
    pub indices_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("gpu.subgroup_mma_load_matrix", format = "$srcMemref`[`$indices`]` attr-dict `:` type($srcMemref) `->` type($res)", results(res))]
pub struct SubgroupMmaLoadMatrixOp<'a> {
    #[slot(src_memref_ty, name = "srcMemref")]
    pub src_memref: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    #[attr(name = "leadDimension", int = "index")]
    pub lead_dimension: Attribute<'a>,
    pub transpose: bool,
    pub src_memref_ty: Type<'a>,
    #[dtype(is = index)]
    pub indices_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("gpu.subgroup_mma_store_matrix", format = "$src`,` $dstMemref`[`$indices`]` attr-dict `:` type($src)`,` type($dstMemref)")]
pub struct SubgroupMmaStoreMatrixOp<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(dst_memref_ty, name = "dstMemref")]
    pub dst_memref: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    #[attr(name = "leadDimension", int = "index")]
    pub lead_dimension: Attribute<'a>,
    pub transpose: bool,
    pub src_ty: Type<'a>,
    pub dst_memref_ty: Type<'a>,
    #[dtype(is = index)]
    pub indices_ty: Type<'a>,
}

#[mlir::op("gpu.subgroup_reduce", results(result))]
pub struct SubgroupReduceOp<'a> {
    #[slot(result)]
    pub value: Value<'a>,
    #[attr(dialect = "gpu<all_reduce_op")]
    pub op: Attribute<'a>,
    pub uniform: bool,
    #[attr(int = "i32")]
    pub cluster_size: Option<Attribute<'a>>,
    #[attr(int = "i32", default = "1")]
    pub cluster_stride: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("gpu.subgroup_size", format = "(`upper_bound` $upper_bound^)? attr-dict `:` type($result)", results(result))]
pub struct SubgroupSizeOp<'a> {
    #[attr(int = "index")]
    pub upper_bound: Option<Attribute<'a>>,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("gpu.terminator", format = "attr-dict")]
pub struct TerminatorOp<'a> {
}

#[mlir::op("gpu.thread_id", format = "$dimension (`upper_bound` $upper_bound^)? attr-dict", results(result))]
pub struct ThreadIdOp<'a> {
    #[attr(dialect = "gpu<dim")]
    pub dimension: Attribute<'a>,
    #[attr(int = "index")]
    pub upper_bound: Option<Attribute<'a>>,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("gpu.wait", results(async_token))]
pub struct WaitOp<'a> {
    #[slot(async_dependencies_ty, name = "asyncDependencies")]
    pub async_dependencies: Vec<Value<'a>>,
    pub async_dependencies_ty: Vec<Type<'a>>,
    pub async_token: Vec<Type<'a>>,
}

#[mlir::op("gpu.warp_execute_on_lane_0", results(results))]
pub struct WarpExecuteOnLane0Op<'a> {
    #[slot(laneid_ty)]
    pub laneid: Value<'a>,
    #[slot(args_ty)]
    pub args: Vec<Value<'a>>,
    #[attr(int = "i64")]
    pub warp_size: Attribute<'a>,
    #[region(name = "warpRegion")]
    pub warp_region: Region<'a>,
    #[dtype(is = index)]
    pub laneid_ty: Type<'a>,
    pub args_ty: Vec<Type<'a>>,
    pub results: Vec<Type<'a>>,
}

#[mlir::op("gpu.yield", format = "attr-dict ($values^ `:` type($values))?")]
pub struct YieldOp<'a> {
    #[slot(values_ty)]
    pub values: Vec<Value<'a>>,
    pub values_ty: Vec<Type<'a>>,
}

#[mlir::dialect(
    "gpu",
    ops = [AllReduceOp, AllocOp, BallotOp, BarrierOp, BinaryOp, BlockDimOp, BlockIdOp, ClusterBlockIdOp, ClusterDimBlocksOp, ClusterDimOp, ClusterIdOp, Create2To4SpMatOp, CreateBsrOp, CreateCooAoSOp, CreateCooOp, CreateCscOp, CreateCsrOp, CreateDnTensorOp, DeallocOp, DestroyDnTensorOp, DestroySpMatOp, DynamicSharedMemoryOp, GPUFuncOp, GPUModuleOp, GlobalIdOp, GridDimOp, HostRegisterOp, HostUnregisterOp, InitializeNamedBarrierOp, LaneIdOp, LaunchFuncOp, LaunchOp, MemcpyOp, MemsetOp, NumSubgroupsOp, PrintfOp, ReturnOp, RotateOp, SDDMMBufferSizeOp, SDDMMOp, SetCsrPointersOp, SetDefaultDeviceOp, ShuffleOp, SpGEMMCopyOp, SpGEMMCreateDescrOp, SpGEMMDestroyDescrOp, SpGEMMWorkEstimationOrComputeOp, SpMMBufferSizeOp, SpMMOp, SpMVBufferSizeOp, SpMVOp, SpMatGetSizeOp, SubgroupBroadcastOp, SubgroupIdOp, SubgroupMmaComputeOp, SubgroupMmaConstantMatrixOp, SubgroupMmaElementwiseOp, SubgroupMmaExtractThreadLocalOp, SubgroupMmaInsertThreadLocalOp, SubgroupMmaLoadMatrixOp, SubgroupMmaStoreMatrixOp, SubgroupReduceOp, SubgroupSizeOp, TerminatorOp, ThreadIdOp, WaitOp, WarpExecuteOnLane0Op, YieldOp],
    dependents = ["arith"]
)]
pub struct GpuDialect;
