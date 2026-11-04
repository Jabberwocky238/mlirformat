#map = affine_map<(d0, d1, d2, d3) -> (d0 + d1, d2 + d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d3)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>
module {
  func.func @conv2d(%arg0: tensor<8x8xi32>, %arg1: tensor<3x3xi32>, %arg2: tensor<6x6xi32>) -> tensor<6x6xi32> {
    %0 = linalg.conv_2d ins(%arg0, %arg1 : tensor<8x8xi32>, tensor<3x3xi32>) outs(%arg2 : tensor<6x6xi32>) -> tensor<6x6xi32>
    return %0 : tensor<6x6xi32>
  }
  func.func @conv2d_CSR_dense_rotated(%arg0: tensor<8x8xi32, #sparse>, %arg1: tensor<3x3xi32>) -> tensor<6x6xi32> {
    %cst = arith.constant dense<0> : tensor<6x6xi32>
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction", "reduction", "parallel"]} ins(%arg0, %arg1 : tensor<8x8xi32, #sparse>, tensor<3x3xi32>) outs(%cst : tensor<6x6xi32>) attrs =  {sorted = true} {
    ^bb0(%in: i32, %in_0: i32, %out: i32):
      %1 = arith.muli %in, %in_0 : i32
      %2 = arith.addi %out, %1 : i32
      linalg.yield %2 : i32
    } -> tensor<6x6xi32>
    return %0 : tensor<6x6xi32>
  }
  func.func @conv2d_sparse_out(%arg0: tensor<8x8xi32>, %arg1: tensor<3x3xi32>) -> tensor<6x6xi32, #sparse1> {
    %0 = tensor.empty() : tensor<6x6xi32, #sparse1>
    %1 = linalg.conv_2d ins(%arg0, %arg1 : tensor<8x8xi32>, tensor<3x3xi32>) outs(%0 : tensor<6x6xi32, #sparse1>) -> tensor<6x6xi32, #sparse1>
    return %1 : tensor<6x6xi32, #sparse1>
  }
  func.func @conv2d_all_sparse_DCSR(%arg0: tensor<8x8xi32, #sparse1>, %arg1: tensor<3x3xi32>) -> tensor<6x6xi32, #sparse1> {
    %0 = tensor.empty() : tensor<6x6xi32, #sparse1>
    %1 = linalg.conv_2d ins(%arg0, %arg1 : tensor<8x8xi32, #sparse1>, tensor<3x3xi32>) outs(%0 : tensor<6x6xi32, #sparse1>) -> tensor<6x6xi32, #sparse1>
    return %1 : tensor<6x6xi32, #sparse1>
  }
  func.func @conv2d_all_sparse_CSR(%arg0: tensor<8x8xi32, #sparse>, %arg1: tensor<3x3xi32>) -> tensor<6x6xi32, #sparse> {
    %0 = tensor.empty() : tensor<6x6xi32, #sparse>
    %1 = linalg.conv_2d ins(%arg0, %arg1 : tensor<8x8xi32, #sparse>, tensor<3x3xi32>) outs(%0 : tensor<6x6xi32, #sparse>) -> tensor<6x6xi32, #sparse>
    return %1 : tensor<6x6xi32, #sparse>
  }
  func.func @conv2d_all_sparse_CD(%arg0: tensor<8x8xi32, #sparse2>, %arg1: tensor<3x3xi32>) -> tensor<6x6xi32, #sparse2> {
    %0 = tensor.empty() : tensor<6x6xi32, #sparse2>
    %1 = linalg.conv_2d ins(%arg0, %arg1 : tensor<8x8xi32, #sparse2>, tensor<3x3xi32>) outs(%0 : tensor<6x6xi32, #sparse2>) -> tensor<6x6xi32, #sparse2>
    return %1 : tensor<6x6xi32, #sparse2>
  }
  func.func @conv2d_all_sparse_CSC(%arg0: tensor<8x8xi32, #sparse3>, %arg1: tensor<3x3xi32>) -> tensor<6x6xi32, #sparse3> {
    %0 = tensor.empty() : tensor<6x6xi32, #sparse3>
    %1 = linalg.conv_2d ins(%arg0, %arg1 : tensor<8x8xi32, #sparse3>, tensor<3x3xi32>) outs(%0 : tensor<6x6xi32, #sparse3>) -> tensor<6x6xi32, #sparse3>
    return %1 : tensor<6x6xi32, #sparse3>
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c0_i32 = arith.constant 0 : i32
    %cst = arith.constant dense<[[1, 0, -1], [0, 0, 0], [-1, 0, 1]]> : tensor<3x3xi32>
    %cst_0 = arith.constant dense<[[1, 2, 3, 4, 0, 6, 7, 8], [2, 2, 4, 4, 0, 0, 6, 8], [2, 2, 4, 4, 0, 0, 6, 8], [2, 2, 3, 4, 0, 0, 7, 8], [1, 3, 3, 4, 0, 0, 6, 8], [3, 2, 3, 4, 0, 0, 7, 8], [1, 3, 3, 4, 3, 6, 6, 8], [1, 3, 3, 4, 3, 0, 7, 8]]> : tensor<8x8xi32>
    %0 = sparse_tensor.convert %cst_0 : tensor<8x8xi32> to tensor<8x8xi32, #sparse1>
    %1 = sparse_tensor.convert %cst_0 : tensor<8x8xi32> to tensor<8x8xi32, #sparse>
    %2 = sparse_tensor.convert %cst_0 : tensor<8x8xi32> to tensor<8x8xi32, #sparse2>
    %3 = sparse_tensor.convert %cst_0 : tensor<8x8xi32> to tensor<8x8xi32, #sparse3>
    %cst_1 = arith.constant dense<0> : tensor<6x6xi32>
    %4 = call @conv2d(%cst_0, %cst, %cst_1) : (tensor<8x8xi32>, tensor<3x3xi32>, tensor<6x6xi32>) -> tensor<6x6xi32>
    %5 = call @conv2d_sparse_out(%cst_0, %cst) : (tensor<8x8xi32>, tensor<3x3xi32>) -> tensor<6x6xi32, #sparse1>
    %6 = call @conv2d_all_sparse_DCSR(%0, %cst) : (tensor<8x8xi32, #sparse1>, tensor<3x3xi32>) -> tensor<6x6xi32, #sparse1>
    %7 = call @conv2d_all_sparse_CSR(%1, %cst) : (tensor<8x8xi32, #sparse>, tensor<3x3xi32>) -> tensor<6x6xi32, #sparse>
    %8 = call @conv2d_all_sparse_CD(%2, %cst) : (tensor<8x8xi32, #sparse2>, tensor<3x3xi32>) -> tensor<6x6xi32, #sparse2>
    %9 = call @conv2d_all_sparse_CSC(%3, %cst) : (tensor<8x8xi32, #sparse3>, tensor<3x3xi32>) -> tensor<6x6xi32, #sparse3>
    %10 = call @conv2d_CSR_dense_rotated(%1, %cst) : (tensor<8x8xi32, #sparse>, tensor<3x3xi32>) -> tensor<6x6xi32>
    %11 = vector.transfer_read %4[%c0, %c0], %c0_i32 : tensor<6x6xi32>, vector<6x6xi32>
    vector.print %11 : vector<6x6xi32>
    sparse_tensor.print %5 : tensor<6x6xi32, #sparse1>
    sparse_tensor.print %6 : tensor<6x6xi32, #sparse1>
    sparse_tensor.print %7 : tensor<6x6xi32, #sparse>
    sparse_tensor.print %8 : tensor<6x6xi32, #sparse2>
    sparse_tensor.print %9 : tensor<6x6xi32, #sparse3>
    %12 = vector.transfer_read %10[%c0, %c0], %c0_i32 : tensor<6x6xi32>, vector<6x6xi32>
    vector.print %11 : vector<6x6xi32>
    bufferization.dealloc_tensor %0 : tensor<8x8xi32, #sparse1>
    bufferization.dealloc_tensor %1 : tensor<8x8xi32, #sparse>
    bufferization.dealloc_tensor %3 : tensor<8x8xi32, #sparse3>
    bufferization.dealloc_tensor %2 : tensor<8x8xi32, #sparse2>
    bufferization.dealloc_tensor %4 : tensor<6x6xi32>
    bufferization.dealloc_tensor %5 : tensor<6x6xi32, #sparse1>
    bufferization.dealloc_tensor %6 : tensor<6x6xi32, #sparse1>
    bufferization.dealloc_tensor %7 : tensor<6x6xi32, #sparse>
    bufferization.dealloc_tensor %8 : tensor<6x6xi32, #sparse2>
    bufferization.dealloc_tensor %9 : tensor<6x6xi32, #sparse3>
    bufferization.dealloc_tensor %10 : tensor<6x6xi32>
    return
  }
}

