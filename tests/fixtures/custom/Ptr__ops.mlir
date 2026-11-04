module {
  func.func @ptr_add_type_offset(%arg0: !ptr.ptr<#ptr.generic_space>) -> !ptr.ptr<#ptr.generic_space> {
    %0 = ptr.type_offset f32 : index
    %1 = ptr.ptr_add %arg0, %0 : !ptr.ptr<#ptr.generic_space>, index
    %2 = ptr.ptr_add %arg0, %0 : !ptr.ptr<#ptr.generic_space>, index
    %3 = ptr.ptr_add nusw %arg0, %0 : !ptr.ptr<#ptr.generic_space>, index
    %4 = ptr.ptr_add nuw %arg0, %0 : !ptr.ptr<#ptr.generic_space>, index
    %5 = ptr.ptr_add inbounds %arg0, %0 : !ptr.ptr<#ptr.generic_space>, index
    return %1 : !ptr.ptr<#ptr.generic_space>
  }
  func.func @cast_ops(%arg0: memref<f32, #ptr.generic_space>) -> memref<f32, #ptr.generic_space> {
    %0 = ptr.to_ptr %arg0 : memref<f32, #ptr.generic_space> -> <#ptr.generic_space>
    %1 = ptr.get_metadata %arg0 : memref<f32, #ptr.generic_space>
    %2 = ptr.from_ptr %0 metadata %1 : <#ptr.generic_space> -> memref<f32, #ptr.generic_space>
    %3 = ptr.from_ptr %0 : <#ptr.generic_space> -> memref<f32, #ptr.generic_space>
    return %2 : memref<f32, #ptr.generic_space>
  }
  func.func @load_ops(%arg0: !ptr.ptr<#ptr.generic_space>) -> (f32, f32, f32, f32, f32, i64, i32) {
    %0 = ptr.load %arg0 : !ptr.ptr<#ptr.generic_space> -> f32
    %1 = ptr.load volatile %arg0 : !ptr.ptr<#ptr.generic_space> -> f32
    %2 = ptr.load %arg0 nontemporal : !ptr.ptr<#ptr.generic_space> -> f32
    %3 = ptr.load %arg0 invariant : !ptr.ptr<#ptr.generic_space> -> f32
    %4 = ptr.load %arg0 invariant_group : !ptr.ptr<#ptr.generic_space> -> f32
    %5 = ptr.load %arg0 atomic monotonic alignment = 8 : !ptr.ptr<#ptr.generic_space> -> i64
    %6 = ptr.load volatile %arg0 atomic syncscope("workgroup") acquire nontemporal alignment = 4 : !ptr.ptr<#ptr.generic_space> -> i32
    return %0, %1, %2, %3, %4, %5, %6 : f32, f32, f32, f32, f32, i64, i32
  }
  func.func @store_ops(%arg0: !ptr.ptr<#ptr.generic_space>, %arg1: f32, %arg2: i64, %arg3: i32) {
    ptr.store %arg1, %arg0 : f32, !ptr.ptr<#ptr.generic_space>
    ptr.store volatile %arg1, %arg0 : f32, !ptr.ptr<#ptr.generic_space>
    ptr.store %arg1, %arg0 nontemporal : f32, !ptr.ptr<#ptr.generic_space>
    ptr.store %arg1, %arg0 invariant_group : f32, !ptr.ptr<#ptr.generic_space>
    ptr.store %arg2, %arg0 atomic monotonic alignment = 8 : i64, !ptr.ptr<#ptr.generic_space>
    ptr.store volatile %arg3, %arg0 atomic syncscope("workgroup") release nontemporal alignment = 4 : i32, !ptr.ptr<#ptr.generic_space>
    return
  }
  func.func @llvm_load(%arg0: !ptr.ptr<#llvm.address_space<1>>) -> (f32, i32) {
    %0 = ptr.load %arg0 : !ptr.ptr<#llvm.address_space<1>> -> f32
    %1 = ptr.load volatile %arg0 atomic acquire alignment = 4 : !ptr.ptr<#llvm.address_space<1>> -> i32
    return %0, %1 : f32, i32
  }
  func.func @llvm_store(%arg0: !ptr.ptr<#llvm.address_space<2>>, %arg1: f32, %arg2: i64) {
    ptr.store %arg1, %arg0 : f32, !ptr.ptr<#llvm.address_space<2>>
    ptr.store %arg2, %arg0 atomic release alignment = 8 : i64, !ptr.ptr<#llvm.address_space<2>>
    return
  }
  func.func @gather_ops(%arg0: vector<4x!ptr.ptr<#ptr.generic_space>>, %arg1: vector<4xi1>, %arg2: vector<4xf32>) -> vector<4xf32> {
    %0 = ptr.gather %arg0, %arg1, %arg2 : vector<4x!ptr.ptr<#ptr.generic_space>> -> vector<4xf32>
    %1 = ptr.gather %arg0, %arg1, %arg2 alignment = 8 : vector<4x!ptr.ptr<#ptr.generic_space>> -> vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @gather_ops_tensor(%arg0: tensor<8x!ptr.ptr<#ptr.generic_space>>, %arg1: tensor<8xi1>, %arg2: tensor<8xi32>) -> tensor<8xi32> {
    %0 = ptr.gather %arg0, %arg1, %arg2 : tensor<8x!ptr.ptr<#ptr.generic_space>> -> tensor<8xi32>
    %1 = ptr.gather %arg0, %arg1, %arg2 alignment = 4 : tensor<8x!ptr.ptr<#ptr.generic_space>> -> tensor<8xi32>
    return %0 : tensor<8xi32>
  }
  func.func @scatter_ops(%arg0: vector<4xf32>, %arg1: vector<4x!ptr.ptr<#ptr.generic_space>>, %arg2: vector<4xi1>) {
    ptr.scatter %arg0, %arg1, %arg2 : vector<4xf32>, vector<4x!ptr.ptr<#ptr.generic_space>>
    ptr.scatter %arg0, %arg1, %arg2 alignment = 16 : vector<4xf32>, vector<4x!ptr.ptr<#ptr.generic_space>>
    return
  }
  func.func @scatter_ops_tensor(%arg0: tensor<8xi64>, %arg1: tensor<8x!ptr.ptr<#ptr.generic_space>>, %arg2: tensor<8xi1>) {
    ptr.scatter %arg0, %arg1, %arg2 : tensor<8xi64>, tensor<8x!ptr.ptr<#ptr.generic_space>>
    ptr.scatter %arg0, %arg1, %arg2 alignment = 8 : tensor<8xi64>, tensor<8x!ptr.ptr<#ptr.generic_space>>
    return
  }
  func.func @masked_load_ops(%arg0: !ptr.ptr<#ptr.generic_space>, %arg1: vector<4xi1>, %arg2: vector<4xf32>) -> vector<4xf32> {
    %0 = ptr.masked_load %arg0, %arg1, %arg2 : !ptr.ptr<#ptr.generic_space> -> vector<4xf32>
    %1 = ptr.masked_load %arg0, %arg1, %arg2 alignment = 16 : !ptr.ptr<#ptr.generic_space> -> vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @masked_load_ops_tensor(%arg0: !ptr.ptr<#ptr.generic_space>, %arg1: tensor<8xi1>, %arg2: tensor<8xi32>) -> tensor<8xi32> {
    %0 = ptr.masked_load %arg0, %arg1, %arg2 : !ptr.ptr<#ptr.generic_space> -> tensor<8xi32>
    %1 = ptr.masked_load %arg0, %arg1, %arg2 alignment = 4 : !ptr.ptr<#ptr.generic_space> -> tensor<8xi32>
    return %0 : tensor<8xi32>
  }
  func.func @masked_store_ops(%arg0: vector<4xf32>, %arg1: !ptr.ptr<#ptr.generic_space>, %arg2: vector<4xi1>) {
    ptr.masked_store %arg0, %arg1, %arg2 : vector<4xf32>, !ptr.ptr<#ptr.generic_space>
    ptr.masked_store %arg0, %arg1, %arg2 alignment = 32 : vector<4xf32>, !ptr.ptr<#ptr.generic_space>
    return
  }
  func.func @masked_store_ops_tensor(%arg0: tensor<8xi64>, %arg1: !ptr.ptr<#ptr.generic_space>, %arg2: tensor<8xi1>) {
    ptr.masked_store %arg0, %arg1, %arg2 : tensor<8xi64>, !ptr.ptr<#ptr.generic_space>
    ptr.masked_store %arg0, %arg1, %arg2 alignment = 8 : tensor<8xi64>, !ptr.ptr<#ptr.generic_space>
    return
  }
  func.func @llvm_masked_ops(%arg0: !ptr.ptr<#llvm.address_space<3>>, %arg1: vector<4x!ptr.ptr<#llvm.address_space<3>>>, %arg2: vector<4xi1>, %arg3: vector<4xf32>, %arg4: vector<4xf32>) -> vector<4xf32> {
    %0 = ptr.gather %arg1, %arg2, %arg4 alignment = 4 : vector<4x!ptr.ptr<#llvm.address_space<3>>> -> vector<4xf32>
    ptr.scatter %arg3, %arg1, %arg2 alignment = 4 : vector<4xf32>, vector<4x!ptr.ptr<#llvm.address_space<3>>>
    %1 = ptr.masked_load %arg0, %arg2, %arg4 alignment = 4 : !ptr.ptr<#llvm.address_space<3>> -> vector<4xf32>
    ptr.masked_store %arg3, %arg0, %arg2 alignment = 4 : vector<4xf32>, !ptr.ptr<#llvm.address_space<3>>
    return %0 : vector<4xf32>
  }
  func.func @ptr_add_vector(%arg0: vector<4x!ptr.ptr<#ptr.generic_space>>, %arg1: vector<4xindex>) -> vector<4x!ptr.ptr<#ptr.generic_space>> {
    %0 = ptr.ptr_add %arg0, %arg1 : vector<4x!ptr.ptr<#ptr.generic_space>>, vector<4xindex>
    %1 = ptr.ptr_add %arg0, %arg1 : vector<4x!ptr.ptr<#ptr.generic_space>>, vector<4xindex>
    %2 = ptr.ptr_add nusw %arg0, %arg1 : vector<4x!ptr.ptr<#ptr.generic_space>>, vector<4xindex>
    %3 = ptr.ptr_add nuw %arg0, %arg1 : vector<4x!ptr.ptr<#ptr.generic_space>>, vector<4xindex>
    %4 = ptr.ptr_add inbounds %arg0, %arg1 : vector<4x!ptr.ptr<#ptr.generic_space>>, vector<4xindex>
    return %0 : vector<4x!ptr.ptr<#ptr.generic_space>>
  }
  func.func @ptr_add_tensor(%arg0: tensor<8x!ptr.ptr<#ptr.generic_space>>, %arg1: tensor<8xi64>) -> tensor<8x!ptr.ptr<#ptr.generic_space>> {
    %0 = ptr.ptr_add %arg0, %arg1 : tensor<8x!ptr.ptr<#ptr.generic_space>>, tensor<8xi64>
    return %0 : tensor<8x!ptr.ptr<#ptr.generic_space>>
  }
  func.func @ptr_add_tensor_2d(%arg0: tensor<4x8x!ptr.ptr<#ptr.generic_space>>, %arg1: tensor<4x8xindex>) -> tensor<4x8x!ptr.ptr<#ptr.generic_space>> {
    %0 = ptr.ptr_add %arg0, %arg1 : tensor<4x8x!ptr.ptr<#ptr.generic_space>>, tensor<4x8xindex>
    %1 = ptr.ptr_add nuw %arg0, %arg1 : tensor<4x8x!ptr.ptr<#ptr.generic_space>>, tensor<4x8xindex>
    return %0 : tensor<4x8x!ptr.ptr<#ptr.generic_space>>
  }
  func.func @ptr_add_scalar_base_vector_offsets(%arg0: !ptr.ptr<#ptr.generic_space>, %arg1: vector<4xindex>) -> vector<4x!ptr.ptr<#ptr.generic_space>> {
    %0 = ptr.ptr_add %arg0, %arg1 : !ptr.ptr<#ptr.generic_space>, vector<4xindex>
    %1 = ptr.ptr_add %arg0, %arg1 : !ptr.ptr<#ptr.generic_space>, vector<4xindex>
    %2 = ptr.ptr_add nusw %arg0, %arg1 : !ptr.ptr<#ptr.generic_space>, vector<4xindex>
    %3 = ptr.ptr_add nuw %arg0, %arg1 : !ptr.ptr<#ptr.generic_space>, vector<4xindex>
    %4 = ptr.ptr_add inbounds %arg0, %arg1 : !ptr.ptr<#ptr.generic_space>, vector<4xindex>
    return %0 : vector<4x!ptr.ptr<#ptr.generic_space>>
  }
  func.func @ptr_add_scalar_base_tensor_offsets(%arg0: !ptr.ptr<#ptr.generic_space>, %arg1: tensor<8xi64>) -> tensor<8x!ptr.ptr<#ptr.generic_space>> {
    %0 = ptr.ptr_add %arg0, %arg1 : !ptr.ptr<#ptr.generic_space>, tensor<8xi64>
    %1 = ptr.ptr_add %arg0, %arg1 : !ptr.ptr<#ptr.generic_space>, tensor<8xi64>
    %2 = ptr.ptr_add nusw %arg0, %arg1 : !ptr.ptr<#ptr.generic_space>, tensor<8xi64>
    %3 = ptr.ptr_add nuw %arg0, %arg1 : !ptr.ptr<#ptr.generic_space>, tensor<8xi64>
    %4 = ptr.ptr_add inbounds %arg0, %arg1 : !ptr.ptr<#ptr.generic_space>, tensor<8xi64>
    return %0 : tensor<8x!ptr.ptr<#ptr.generic_space>>
  }
  func.func @ptr_add_vector_base_scalar_offset(%arg0: vector<4x!ptr.ptr<#ptr.generic_space>>, %arg1: index) -> vector<4x!ptr.ptr<#ptr.generic_space>> {
    %0 = ptr.ptr_add %arg0, %arg1 : vector<4x!ptr.ptr<#ptr.generic_space>>, index
    %1 = ptr.ptr_add %arg0, %arg1 : vector<4x!ptr.ptr<#ptr.generic_space>>, index
    %2 = ptr.ptr_add nusw %arg0, %arg1 : vector<4x!ptr.ptr<#ptr.generic_space>>, index
    %3 = ptr.ptr_add nuw %arg0, %arg1 : vector<4x!ptr.ptr<#ptr.generic_space>>, index
    %4 = ptr.ptr_add inbounds %arg0, %arg1 : vector<4x!ptr.ptr<#ptr.generic_space>>, index
    return %0 : vector<4x!ptr.ptr<#ptr.generic_space>>
  }
  func.func @ptr_add_tensor_base_scalar_offset(%arg0: tensor<8x!ptr.ptr<#ptr.generic_space>>, %arg1: i64) -> tensor<8x!ptr.ptr<#ptr.generic_space>> {
    %0 = ptr.ptr_add %arg0, %arg1 : tensor<8x!ptr.ptr<#ptr.generic_space>>, i64
    %1 = ptr.ptr_add %arg0, %arg1 : tensor<8x!ptr.ptr<#ptr.generic_space>>, i64
    %2 = ptr.ptr_add nusw %arg0, %arg1 : tensor<8x!ptr.ptr<#ptr.generic_space>>, i64
    %3 = ptr.ptr_add nuw %arg0, %arg1 : tensor<8x!ptr.ptr<#ptr.generic_space>>, i64
    %4 = ptr.ptr_add inbounds %arg0, %arg1 : tensor<8x!ptr.ptr<#ptr.generic_space>>, i64
    return %0 : tensor<8x!ptr.ptr<#ptr.generic_space>>
  }
  func.func @constant_null_ops() -> (!ptr.ptr<#ptr.generic_space>, !ptr.ptr<#llvm.address_space<1>>) {
    %0 = ptr.constant #ptr.null : !ptr.ptr<#ptr.generic_space>
    %1 = ptr.constant #ptr.null : !ptr.ptr<#llvm.address_space<1>>
    return %0, %1 : !ptr.ptr<#ptr.generic_space>, !ptr.ptr<#llvm.address_space<1>>
  }
  func.func @constant_address_ops() -> (!ptr.ptr<#ptr.generic_space>, !ptr.ptr<#llvm.address_space<1>>, !ptr.ptr<#llvm.address_space<3>>) {
    %0 = ptr.constant #ptr.address<0> : !ptr.ptr<#ptr.generic_space>
    %1 = ptr.constant #ptr.address<4096> : !ptr.ptr<#llvm.address_space<1>>
    %2 = ptr.constant #ptr.address<3735928559> : !ptr.ptr<#llvm.address_space<3>>
    return %0, %1, %2 : !ptr.ptr<#ptr.generic_space>, !ptr.ptr<#llvm.address_space<1>>, !ptr.ptr<#llvm.address_space<3>>
  }
  func.func @constant_large_address_ops() -> (!ptr.ptr<#ptr.generic_space>, !ptr.ptr<#llvm.address_space<0>>) {
    %0 = ptr.constant #ptr.address<4294967295> : !ptr.ptr<#ptr.generic_space>
    %1 = ptr.constant #ptr.address<1311768467463790320> : !ptr.ptr<#llvm.address_space<0>>
    return %0, %1 : !ptr.ptr<#ptr.generic_space>, !ptr.ptr<#llvm.address_space<0>>
  }
  func.func @ptr_diff_scalar_ops(%arg0: !ptr.ptr<#ptr.generic_space>, %arg1: !ptr.ptr<#ptr.generic_space>) -> (i64, index, i32) {
    %0 = ptr.ptr_diff %arg0, %arg1 : !ptr.ptr<#ptr.generic_space> -> i64
    %1 = ptr.ptr_diff %arg0, %arg1 : !ptr.ptr<#ptr.generic_space> -> index
    %2 = ptr.ptr_diff nuw %arg0, %arg1 : !ptr.ptr<#ptr.generic_space> -> i32
    return %0, %1, %2 : i64, index, i32
  }
  func.func @ptr_diff_vector_ops(%arg0: vector<4x!ptr.ptr<#ptr.generic_space>>, %arg1: vector<4x!ptr.ptr<#ptr.generic_space>>) -> (vector<4xi64>, vector<4xindex>) {
    %0 = ptr.ptr_diff %arg0, %arg1 : vector<4x!ptr.ptr<#ptr.generic_space>> -> vector<4xi64>
    %1 = ptr.ptr_diff %arg0, %arg1 : vector<4x!ptr.ptr<#ptr.generic_space>> -> vector<4xindex>
    return %0, %1 : vector<4xi64>, vector<4xindex>
  }
  func.func @ptr_diff_tensor_ops(%arg0: tensor<8x!ptr.ptr<#ptr.generic_space>>, %arg1: tensor<8x!ptr.ptr<#ptr.generic_space>>) -> (tensor<8xi64>, tensor<8xi32>) {
    %0 = ptr.ptr_diff nsw %arg0, %arg1 : tensor<8x!ptr.ptr<#ptr.generic_space>> -> tensor<8xi64>
    %1 = ptr.ptr_diff nuw|nsw %arg0, %arg1 : tensor<8x!ptr.ptr<#ptr.generic_space>> -> tensor<8xi32>
    return %0, %1 : tensor<8xi64>, tensor<8xi32>
  }
  func.func @ptr_diff_tensor_2d_ops(%arg0: tensor<4x8x!ptr.ptr<#ptr.generic_space>>, %arg1: tensor<4x8x!ptr.ptr<#ptr.generic_space>>) -> tensor<4x8xi64> {
    %0 = ptr.ptr_diff %arg0, %arg1 : tensor<4x8x!ptr.ptr<#ptr.generic_space>> -> tensor<4x8xi64>
    return %0 : tensor<4x8xi64>
  }
}

