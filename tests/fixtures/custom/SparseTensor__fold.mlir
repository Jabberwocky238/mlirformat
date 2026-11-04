#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 3 : compressed, d0 mod 2 : dense, d1 mod 3 : dense) }>
#sparse4 = #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : dense, d1 : compressed, d2 : dense, d3 : dense) }>
module {
  func.func @sparse_nop_dense2dense_convert(%arg0: tensor<64xf32>) -> tensor<64xf32> {
    %0 = sparse_tensor.convert %arg0 : tensor<64xf32> to tensor<64xf32>
    return %0 : tensor<64xf32>
  }
  func.func @sparse_dce_convert(%arg0: tensor<64xf32>) {
    %0 = sparse_tensor.convert %arg0 : tensor<64xf32> to tensor<64xf32, #sparse>
    return
  }
  func.func @sparse_dce_getters(%arg0: tensor<64xf32, #sparse>) {
    %0 = sparse_tensor.positions %arg0 {level = 0 : index} : tensor<64xf32, #sparse> to memref<?xindex>
    %1 = sparse_tensor.coordinates %arg0 {level = 0 : index} : tensor<64xf32, #sparse> to memref<?xindex>
    %2 = sparse_tensor.values %arg0 : tensor<64xf32, #sparse> to memref<?xf32>
    return
  }
  func.func @sparse_concat_dce(%arg0: tensor<2xf64, #sparse>, %arg1: tensor<3xf64, #sparse>, %arg2: tensor<4xf64, #sparse>) {
    %0 = sparse_tensor.concatenate %arg0, %arg1, %arg2 {dimension = 0 : index} : tensor<2xf64, #sparse>, tensor<3xf64, #sparse>, tensor<4xf64, #sparse> to tensor<9xf64, #sparse>
    return
  }
  func.func @sparse_get_specifier_dce_fold(%arg0: !sparse_tensor.storage_specifier<#sparse1>, %arg1: index, %arg2: index) -> index {
    %0 = sparse_tensor.storage_specifier.set %arg0  lvl_sz at 0 with %arg1 : !sparse_tensor.storage_specifier<#sparse1>
    %1 = sparse_tensor.storage_specifier.set %0  pos_mem_sz at 0 with %arg2 : !sparse_tensor.storage_specifier<#sparse1>
    %2 = sparse_tensor.storage_specifier.get %1  lvl_sz at 0 : !sparse_tensor.storage_specifier<#sparse1>
    return %2 : index
  }
  func.func @sparse_reorder_coo(%arg0: tensor<?x?xf32, #sparse2>) -> tensor<?x?xf32, #sparse2> {
    %0 = sparse_tensor.reorder_coo  quick_sort %arg0 : tensor<?x?xf32, #sparse2> to tensor<?x?xf32, #sparse2>
    return %0 : tensor<?x?xf32, #sparse2>
  }
  func.func @sparse_crd_translate(%arg0: index, %arg1: index) -> (index, index) {
    %0:4 = sparse_tensor.crd_translate  dim_to_lvl[%arg0, %arg1] as #sparse3 : index, index, index, index
    %1:2 = sparse_tensor.crd_translate  lvl_to_dim[%0#0, %0#1, %0#2, %0#3] as #sparse3 : index, index
    return %1#0, %1#1 : index, index
  }
  func.func @sparse_lvl_0(%arg0: tensor<10x?xi32, #sparse3>) -> index {
    %c0 = arith.constant 0 : index
    %0 = sparse_tensor.lvl %arg0, %c0 : tensor<10x?xi32, #sparse3>
    return %0 : index
  }
  func.func @sparse_lvl_3(%arg0: tensor<?x?xi32, #sparse3>) -> index {
    %c3 = arith.constant 3 : index
    %0 = sparse_tensor.lvl %arg0, %c3 : tensor<?x?xi32, #sparse3>
    return %0 : index
  }
  func.func @sparse_reinterpret_map(%arg0: tensor<6x12xi32, #sparse3>) -> tensor<6x12xi32, #sparse3> {
    %0 = sparse_tensor.reinterpret_map %arg0 : tensor<6x12xi32, #sparse3> to tensor<3x4x2x3xi32, #sparse4>
    %1 = sparse_tensor.reinterpret_map %0 : tensor<3x4x2x3xi32, #sparse4> to tensor<6x12xi32, #sparse3>
    return %1 : tensor<6x12xi32, #sparse3>
  }
}

