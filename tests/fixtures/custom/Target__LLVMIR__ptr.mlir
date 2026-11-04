module {
  llvm.func @llvm_ptr_address_space(!ptr.ptr<#llvm.address_space<1>>, !ptr.ptr<#llvm.address_space<3>>) -> !ptr.ptr<#llvm.address_space<0>>
  llvm.func @llvm_ops_with_ptr_values(%arg0: !llvm.ptr) {
    %0 = llvm.load %arg0 : !llvm.ptr -> !ptr.ptr<#llvm.address_space<1>>
    llvm.store %0, %arg0 : !ptr.ptr<#llvm.address_space<1>>, !llvm.ptr
    llvm.return
  }
  llvm.func @ptr_add(%arg0: !ptr.ptr<#llvm.address_space<0>>, %arg1: i32) -> !ptr.ptr<#llvm.address_space<0>> {
    %0 = ptr.ptr_add %arg0, %arg1 : !ptr.ptr<#llvm.address_space<0>>, i32
    %1 = ptr.ptr_add %arg0, %arg1 : !ptr.ptr<#llvm.address_space<0>>, i32
    %2 = ptr.ptr_add nusw %arg0, %arg1 : !ptr.ptr<#llvm.address_space<0>>, i32
    %3 = ptr.ptr_add nuw %arg0, %arg1 : !ptr.ptr<#llvm.address_space<0>>, i32
    %4 = ptr.ptr_add inbounds %arg0, %arg1 : !ptr.ptr<#llvm.address_space<0>>, i32
    llvm.return %0 : !ptr.ptr<#llvm.address_space<0>>
  }
  llvm.func @type_offset(%arg0: !ptr.ptr<#llvm.address_space<0>>) -> !llvm.struct<(i32, i32, i32, i32)> {
    %0 = ptr.type_offset f64 : i32
    %1 = ptr.type_offset i8 : i32
    %2 = ptr.type_offset i16 : i32
    %3 = ptr.type_offset i32 : i32
    %4 = llvm.mlir.poison : !llvm.struct<(i32, i32, i32, i32)>
    %5 = llvm.insertvalue %0, %4[0] : !llvm.struct<(i32, i32, i32, i32)> 
    %6 = llvm.insertvalue %1, %5[1] : !llvm.struct<(i32, i32, i32, i32)> 
    %7 = llvm.insertvalue %2, %6[2] : !llvm.struct<(i32, i32, i32, i32)> 
    %8 = llvm.insertvalue %3, %7[3] : !llvm.struct<(i32, i32, i32, i32)> 
    llvm.return %8 : !llvm.struct<(i32, i32, i32, i32)>
  }
  llvm.func @load_ops(%arg0: !ptr.ptr<#llvm.address_space<0>>) {
    %0 = ptr.load %arg0 : !ptr.ptr<#llvm.address_space<0>> -> f32
    %1 = ptr.load volatile %arg0 : !ptr.ptr<#llvm.address_space<0>> -> f32
    %2 = ptr.load %arg0 nontemporal : !ptr.ptr<#llvm.address_space<0>> -> f32
    %3 = ptr.load %arg0 invariant : !ptr.ptr<#llvm.address_space<0>> -> f32
    %4 = ptr.load %arg0 invariant_group : !ptr.ptr<#llvm.address_space<0>> -> f32
    %5 = ptr.load %arg0 atomic monotonic alignment = 8 : !ptr.ptr<#llvm.address_space<0>> -> i64
    %6 = ptr.load volatile %arg0 atomic syncscope("workgroup") acquire nontemporal alignment = 4 : !ptr.ptr<#llvm.address_space<0>> -> i32
    llvm.return
  }
  llvm.func @store_ops(%arg0: !ptr.ptr<#llvm.address_space<0>>, %arg1: f32, %arg2: i64, %arg3: i32) {
    ptr.store %arg1, %arg0 : f32, !ptr.ptr<#llvm.address_space<0>>
    ptr.store volatile %arg1, %arg0 : f32, !ptr.ptr<#llvm.address_space<0>>
    ptr.store %arg1, %arg0 nontemporal : f32, !ptr.ptr<#llvm.address_space<0>>
    ptr.store %arg1, %arg0 invariant_group : f32, !ptr.ptr<#llvm.address_space<0>>
    ptr.store %arg2, %arg0 atomic monotonic alignment = 8 : i64, !ptr.ptr<#llvm.address_space<0>>
    ptr.store volatile %arg3, %arg0 atomic syncscope("workgroup") release nontemporal alignment = 4 : i32, !ptr.ptr<#llvm.address_space<0>>
    llvm.return
  }
  llvm.func @gather_ops(%arg0: vector<4x!ptr.ptr<#llvm.address_space<0>>>, %arg1: vector<4xi1>, %arg2: vector<4xf32>) -> vector<4xf32> {
    %0 = ptr.gather %arg0, %arg1, %arg2 : vector<4x!ptr.ptr<#llvm.address_space<0>>> -> vector<4xf32>
    %1 = ptr.gather %arg0, %arg1, %arg2 alignment = 4 : vector<4x!ptr.ptr<#llvm.address_space<0>>> -> vector<4xf32>
    llvm.return %0 : vector<4xf32>
  }
  llvm.func @gather_ops_i32(%arg0: vector<8x!ptr.ptr<#llvm.address_space<0>>>, %arg1: vector<8xi1>, %arg2: vector<8xi32>) -> vector<8xi32> {
    %0 = ptr.gather %arg0, %arg1, %arg2 alignment = 8 : vector<8x!ptr.ptr<#llvm.address_space<0>>> -> vector<8xi32>
    llvm.return %0 : vector<8xi32>
  }
  llvm.func @masked_load_ops(%arg0: !ptr.ptr<#llvm.address_space<0>>, %arg1: vector<4xi1>, %arg2: vector<4xf32>) -> vector<4xf32> {
    %0 = ptr.masked_load %arg0, %arg1, %arg2 : !ptr.ptr<#llvm.address_space<0>> -> vector<4xf32>
    %1 = ptr.masked_load %arg0, %arg1, %arg2 alignment = 16 : !ptr.ptr<#llvm.address_space<0>> -> vector<4xf32>
    llvm.return %0 : vector<4xf32>
  }
  llvm.func @masked_load_ops_i64(%arg0: !ptr.ptr<#llvm.address_space<0>>, %arg1: vector<8xi1>, %arg2: vector<8xi64>) -> vector<8xi64> {
    %0 = ptr.masked_load %arg0, %arg1, %arg2 alignment = 8 : !ptr.ptr<#llvm.address_space<0>> -> vector<8xi64>
    llvm.return %0 : vector<8xi64>
  }
  llvm.func @masked_store_ops(%arg0: !ptr.ptr<#llvm.address_space<0>>, %arg1: vector<4xf32>, %arg2: vector<4xi1>) {
    ptr.masked_store %arg1, %arg0, %arg2 : vector<4xf32>, !ptr.ptr<#llvm.address_space<0>>
    ptr.masked_store %arg1, %arg0, %arg2 alignment = 32 : vector<4xf32>, !ptr.ptr<#llvm.address_space<0>>
    llvm.return
  }
  llvm.func @masked_store_ops_i16(%arg0: !ptr.ptr<#llvm.address_space<0>>, %arg1: vector<8xi16>, %arg2: vector<8xi1>) {
    ptr.masked_store %arg1, %arg0, %arg2 alignment = 4 : vector<8xi16>, !ptr.ptr<#llvm.address_space<0>>
    llvm.return
  }
  llvm.func @scatter_ops(%arg0: vector<4xf32>, %arg1: vector<4x!ptr.ptr<#llvm.address_space<0>>>, %arg2: vector<4xi1>) {
    ptr.scatter %arg0, %arg1, %arg2 : vector<4xf32>, vector<4x!ptr.ptr<#llvm.address_space<0>>>
    ptr.scatter %arg0, %arg1, %arg2 alignment = 8 : vector<4xf32>, vector<4x!ptr.ptr<#llvm.address_space<0>>>
    llvm.return
  }
  llvm.func @scatter_ops_i64(%arg0: vector<8xi64>, %arg1: vector<8x!ptr.ptr<#llvm.address_space<0>>>, %arg2: vector<8xi1>) {
    ptr.scatter %arg0, %arg1, %arg2 alignment = 16 : vector<8xi64>, vector<8x!ptr.ptr<#llvm.address_space<0>>>
    llvm.return
  }
  llvm.func @mixed_masked_ops_address_spaces(%arg0: !ptr.ptr<#llvm.address_space<3>>, %arg1: vector<4x!ptr.ptr<#llvm.address_space<3>>>, %arg2: vector<4xi1>, %arg3: vector<4xf64>, %arg4: vector<4xf64>) {
    %0 = ptr.gather %arg1, %arg2, %arg4 alignment = 8 : vector<4x!ptr.ptr<#llvm.address_space<3>>> -> vector<4xf64>
    ptr.scatter %arg3, %arg1, %arg2 alignment = 8 : vector<4xf64>, vector<4x!ptr.ptr<#llvm.address_space<3>>>
    %1 = ptr.masked_load %arg0, %arg2, %arg4 alignment = 8 : !ptr.ptr<#llvm.address_space<3>> -> vector<4xf64>
    ptr.masked_store %arg3, %arg0, %arg2 alignment = 8 : vector<4xf64>, !ptr.ptr<#llvm.address_space<3>>
    llvm.return
  }
  llvm.func @ptr_add_vector(%arg0: vector<4x!ptr.ptr<#llvm.address_space<0>>>, %arg1: vector<4xi32>) -> vector<4x!ptr.ptr<#llvm.address_space<0>>> {
    %0 = ptr.ptr_add %arg0, %arg1 : vector<4x!ptr.ptr<#llvm.address_space<0>>>, vector<4xi32>
    llvm.return %0 : vector<4x!ptr.ptr<#llvm.address_space<0>>>
  }
  llvm.func @ptr_add_scalar_base_vector_offsets(%arg0: !ptr.ptr<#llvm.address_space<0>>, %arg1: vector<4xi32>) -> vector<4x!ptr.ptr<#llvm.address_space<0>>> {
    %0 = ptr.ptr_add %arg0, %arg1 : !ptr.ptr<#llvm.address_space<0>>, vector<4xi32>
    llvm.return %0 : vector<4x!ptr.ptr<#llvm.address_space<0>>>
  }
  llvm.func @ptr_add_vector_base_scalar_offset(%arg0: vector<4x!ptr.ptr<#llvm.address_space<0>>>, %arg1: i32) -> vector<4x!ptr.ptr<#llvm.address_space<0>>> {
    %0 = ptr.ptr_add %arg0, %arg1 : vector<4x!ptr.ptr<#llvm.address_space<0>>>, i32
    llvm.return %0 : vector<4x!ptr.ptr<#llvm.address_space<0>>>
  }
  llvm.func @nvvm_ptr_address_space(!ptr.ptr<#nvvm.memory_space<global>>, !ptr.ptr<#nvvm.memory_space<shared>>, !ptr.ptr<#nvvm.memory_space<constant>>, !ptr.ptr<#nvvm.memory_space<local>>, !ptr.ptr<#nvvm.memory_space<tensor>>, !ptr.ptr<#nvvm.memory_space<shared_cluster>>) -> !ptr.ptr<#nvvm.memory_space<generic>>
  llvm.func @llvm_ops_with_ptr_nvvm_values(%arg0: !llvm.ptr) {
    %0 = llvm.load %arg0 : !llvm.ptr -> !ptr.ptr<#nvvm.memory_space<global>>
    llvm.store %0, %arg0 : !ptr.ptr<#nvvm.memory_space<global>>, !llvm.ptr
    llvm.return
  }
  llvm.func @constant_address_op() -> !llvm.struct<(!ptr.ptr<#llvm.address_space<0>>, !ptr.ptr<#llvm.address_space<1>>, !ptr.ptr<#llvm.address_space<2>>)> {
    %0 = ptr.constant #ptr.null : !ptr.ptr<#llvm.address_space<0>>
    %1 = ptr.constant #ptr.address<4096> : !ptr.ptr<#llvm.address_space<1>>
    %2 = ptr.constant #ptr.address<3735928559> : !ptr.ptr<#llvm.address_space<2>>
    %3 = llvm.mlir.poison : !llvm.struct<(!ptr.ptr<#llvm.address_space<0>>, !ptr.ptr<#llvm.address_space<1>>, !ptr.ptr<#llvm.address_space<2>>)>
    %4 = llvm.insertvalue %0, %3[0] : !llvm.struct<(!ptr.ptr<#llvm.address_space<0>>, !ptr.ptr<#llvm.address_space<1>>, !ptr.ptr<#llvm.address_space<2>>)> 
    %5 = llvm.insertvalue %1, %4[1] : !llvm.struct<(!ptr.ptr<#llvm.address_space<0>>, !ptr.ptr<#llvm.address_space<1>>, !ptr.ptr<#llvm.address_space<2>>)> 
    %6 = llvm.insertvalue %2, %5[2] : !llvm.struct<(!ptr.ptr<#llvm.address_space<0>>, !ptr.ptr<#llvm.address_space<1>>, !ptr.ptr<#llvm.address_space<2>>)> 
    llvm.return %6 : !llvm.struct<(!ptr.ptr<#llvm.address_space<0>>, !ptr.ptr<#llvm.address_space<1>>, !ptr.ptr<#llvm.address_space<2>>)>
  }
  llvm.func @ptr_add_cst() -> !ptr.ptr<#llvm.address_space<0>> {
    %0 = llvm.mlir.constant(42 : i32) : i32
    %1 = ptr.constant #ptr.null : !ptr.ptr<#llvm.address_space<0>>
    %2 = ptr.ptr_add %1, %0 : !ptr.ptr<#llvm.address_space<0>>, i32
    llvm.return %2 : !ptr.ptr<#llvm.address_space<0>>
  }
  llvm.func @ptr_diff_scalar(%arg0: !ptr.ptr<#llvm.address_space<0>>, %arg1: !ptr.ptr<#llvm.address_space<0>>) -> i64 {
    %0 = ptr.ptr_diff %arg0, %arg1 : !ptr.ptr<#llvm.address_space<0>> -> i64
    llvm.return %0 : i64
  }
  llvm.func @ptr_diff_scalar_i32(%arg0: !ptr.ptr<#llvm.address_space<0>>, %arg1: !ptr.ptr<#llvm.address_space<0>>) -> i32 {
    %0 = ptr.ptr_diff %arg0, %arg1 : !ptr.ptr<#llvm.address_space<0>> -> i32
    llvm.return %0 : i32
  }
  llvm.func @ptr_diff_vector(%arg0: vector<4x!ptr.ptr<#llvm.address_space<0>>>, %arg1: vector<4x!ptr.ptr<#llvm.address_space<0>>>) -> vector<4xi64> {
    %0 = ptr.ptr_diff %arg0, %arg1 : vector<4x!ptr.ptr<#llvm.address_space<0>>> -> vector<4xi64>
    llvm.return %0 : vector<4xi64>
  }
  llvm.func @ptr_diff_vector_i32(%arg0: vector<8x!ptr.ptr<#llvm.address_space<0>>>, %arg1: vector<8x!ptr.ptr<#llvm.address_space<0>>>) -> vector<8xi32> {
    %0 = ptr.ptr_diff %arg0, %arg1 : vector<8x!ptr.ptr<#llvm.address_space<0>>> -> vector<8xi32>
    llvm.return %0 : vector<8xi32>
  }
  llvm.func @ptr_diff_with_constants() -> i64 {
    %0 = ptr.constant #ptr.address<8192> : !ptr.ptr<#llvm.address_space<0>>
    %1 = ptr.constant #ptr.address<4096> : !ptr.ptr<#llvm.address_space<0>>
    %2 = ptr.ptr_diff %0, %1 : !ptr.ptr<#llvm.address_space<0>> -> i64
    llvm.return %2 : i64
  }
  llvm.func @ptr_diff_with_flags_nsw(%arg0: !ptr.ptr<#llvm.address_space<0>>, %arg1: !ptr.ptr<#llvm.address_space<0>>) -> i64 {
    %0 = ptr.ptr_diff nsw %arg0, %arg1 : !ptr.ptr<#llvm.address_space<0>> -> i64
    llvm.return %0 : i64
  }
  llvm.func @ptr_diff_with_flags_nuw(%arg0: !ptr.ptr<#llvm.address_space<0>>, %arg1: !ptr.ptr<#llvm.address_space<0>>) -> i64 {
    %0 = ptr.ptr_diff nuw %arg0, %arg1 : !ptr.ptr<#llvm.address_space<0>> -> i64
    llvm.return %0 : i64
  }
  llvm.func @ptr_diff_with_flags_nsw_nuw(%arg0: !ptr.ptr<#llvm.address_space<0>>, %arg1: !ptr.ptr<#llvm.address_space<0>>) -> i64 {
    %0 = ptr.ptr_diff nuw|nsw %arg0, %arg1 : !ptr.ptr<#llvm.address_space<0>> -> i64
    llvm.return %0 : i64
  }
}

