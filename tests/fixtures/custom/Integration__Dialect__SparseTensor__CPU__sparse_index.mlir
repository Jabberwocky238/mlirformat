#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
module {
  func.func @sparse_index_1d_conj(%arg0: tensor<8xi64, #sparse>) -> tensor<8xi64, #sparse> {
    %0 = tensor.empty() : tensor<8xi64, #sparse>
    %1 = linalg.generic {doc = "X(i) = a(i) op i", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<8xi64, #sparse>) outs(%0 : tensor<8xi64, #sparse>) {
    ^bb0(%in: i64, %out: i64):
      %2 = linalg.index 0 : index
      %3 = arith.index_cast %2 : index to i64
      %4 = arith.muli %in, %3 : i64
      linalg.yield %4 : i64
    } -> tensor<8xi64, #sparse>
    return %1 : tensor<8xi64, #sparse>
  }
  func.func @sparse_index_1d_disj(%arg0: tensor<8xi64, #sparse>) -> tensor<8xi64, #sparse> {
    %0 = tensor.empty() : tensor<8xi64, #sparse>
    %1 = linalg.generic {doc = "X(i) = a(i) op i", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<8xi64, #sparse>) outs(%0 : tensor<8xi64, #sparse>) {
    ^bb0(%in: i64, %out: i64):
      %2 = linalg.index 0 : index
      %3 = arith.index_cast %2 : index to i64
      %4 = arith.addi %in, %3 : i64
      linalg.yield %4 : i64
    } -> tensor<8xi64, #sparse>
    return %1 : tensor<8xi64, #sparse>
  }
  func.func @sparse_index_2d_conj(%arg0: tensor<3x4xi64, #sparse1>) -> tensor<3x4xi64, #sparse1> {
    %0 = tensor.empty() : tensor<3x4xi64, #sparse1>
    %1 = linalg.generic {doc = "X(i,j) = A(i,j) op i op j", indexing_maps = [#map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg0 : tensor<3x4xi64, #sparse1>) outs(%0 : tensor<3x4xi64, #sparse1>) {
    ^bb0(%in: i64, %out: i64):
      %2 = linalg.index 0 : index
      %3 = linalg.index 1 : index
      %4 = arith.index_cast %2 : index to i64
      %5 = arith.index_cast %3 : index to i64
      %6 = arith.muli %4, %in : i64
      %7 = arith.muli %5, %6 : i64
      linalg.yield %7 : i64
    } -> tensor<3x4xi64, #sparse1>
    return %1 : tensor<3x4xi64, #sparse1>
  }
  func.func @sparse_index_2d_disj(%arg0: tensor<3x4xi64, #sparse1>) -> tensor<3x4xi64, #sparse1> {
    %0 = tensor.empty() : tensor<3x4xi64, #sparse1>
    %1 = linalg.generic {doc = "X(i,j) = A(i,j) op i op j", indexing_maps = [#map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg0 : tensor<3x4xi64, #sparse1>) outs(%0 : tensor<3x4xi64, #sparse1>) {
    ^bb0(%in: i64, %out: i64):
      %2 = linalg.index 0 : index
      %3 = linalg.index 1 : index
      %4 = arith.index_cast %2 : index to i64
      %5 = arith.index_cast %3 : index to i64
      %6 = arith.addi %4, %in : i64
      %7 = arith.addi %5, %6 : i64
      linalg.yield %7 : i64
    } -> tensor<3x4xi64, #sparse1>
    return %1 : tensor<3x4xi64, #sparse1>
  }
  func.func @add_outer_2d(%arg0: tensor<2x3xf32, #sparse1>) -> tensor<2x3xf32, #sparse1> {
    %0 = tensor.empty() : tensor<2x3xf32, #sparse1>
    %1 = linalg.generic {doc = "X(i,j) = A(i,j) op i op j", indexing_maps = [#map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg0 : tensor<2x3xf32, #sparse1>) outs(%0 : tensor<2x3xf32, #sparse1>) {
    ^bb0(%in: f32, %out: f32):
      %2 = linalg.index 0 : index
      %3 = arith.index_cast %2 : index to i64
      %4 = arith.uitofp %3 : i64 to f32
      %5 = arith.addf %in, %4 : f32
      linalg.yield %5 : f32
    } -> tensor<2x3xf32, #sparse1>
    return %1 : tensor<2x3xf32, #sparse1>
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c-1_i64 = arith.constant -1 : i64
    %cst = arith.constant -1.000000e+00 : f32
    %cst_0 = arith.constant sparse<[[2], [4]], [10, 20]> : tensor<8xi64>
    %0 = sparse_tensor.convert %cst_0 : tensor<8xi64> to tensor<8xi64, #sparse>
    %cst_1 = arith.constant dense<[1, 2, 4, 8, 16, 32, 64, 128]> : tensor<8xi64>
    %1 = sparse_tensor.convert %cst_1 : tensor<8xi64> to tensor<8xi64, #sparse>
    %cst_2 = arith.constant sparse<[[1, 1], [2, 3]], [10, 20]> : tensor<3x4xi64>
    %2 = sparse_tensor.convert %cst_2 : tensor<3x4xi64> to tensor<3x4xi64, #sparse1>
    %cst_3 = arith.constant dense<[[1, 1, 1, 1], [1, 2, 1, 1], [1, 1, 3, 4]]> : tensor<3x4xi64>
    %3 = sparse_tensor.convert %cst_3 : tensor<3x4xi64> to tensor<3x4xi64, #sparse1>
    %cst_4 = arith.constant sparse<[[0, 1], [1, 2]], [1.000000e+01, 4.100000e+01]> : tensor<2x3xf32>
    %4 = sparse_tensor.convert %cst_4 : tensor<2x3xf32> to tensor<2x3xf32, #sparse1>
    %5 = call @sparse_index_1d_conj(%0) : (tensor<8xi64, #sparse>) -> tensor<8xi64, #sparse>
    %6 = call @sparse_index_1d_disj(%0) : (tensor<8xi64, #sparse>) -> tensor<8xi64, #sparse>
    %7 = call @sparse_index_1d_conj(%1) : (tensor<8xi64, #sparse>) -> tensor<8xi64, #sparse>
    %8 = call @sparse_index_1d_disj(%1) : (tensor<8xi64, #sparse>) -> tensor<8xi64, #sparse>
    %9 = call @sparse_index_2d_conj(%2) : (tensor<3x4xi64, #sparse1>) -> tensor<3x4xi64, #sparse1>
    %10 = call @sparse_index_2d_disj(%2) : (tensor<3x4xi64, #sparse1>) -> tensor<3x4xi64, #sparse1>
    %11 = call @sparse_index_2d_conj(%3) : (tensor<3x4xi64, #sparse1>) -> tensor<3x4xi64, #sparse1>
    %12 = call @sparse_index_2d_disj(%3) : (tensor<3x4xi64, #sparse1>) -> tensor<3x4xi64, #sparse1>
    sparse_tensor.print %5 : tensor<8xi64, #sparse>
    sparse_tensor.print %6 : tensor<8xi64, #sparse>
    sparse_tensor.print %7 : tensor<8xi64, #sparse>
    sparse_tensor.print %8 : tensor<8xi64, #sparse>
    sparse_tensor.print %9 : tensor<3x4xi64, #sparse1>
    sparse_tensor.print %10 : tensor<3x4xi64, #sparse1>
    sparse_tensor.print %11 : tensor<3x4xi64, #sparse1>
    sparse_tensor.print %12 : tensor<3x4xi64, #sparse1>
    %13 = call @add_outer_2d(%4) : (tensor<2x3xf32, #sparse1>) -> tensor<2x3xf32, #sparse1>
    sparse_tensor.print %13 : tensor<2x3xf32, #sparse1>
    bufferization.dealloc_tensor %0 : tensor<8xi64, #sparse>
    bufferization.dealloc_tensor %1 : tensor<8xi64, #sparse>
    bufferization.dealloc_tensor %5 : tensor<8xi64, #sparse>
    bufferization.dealloc_tensor %6 : tensor<8xi64, #sparse>
    bufferization.dealloc_tensor %7 : tensor<8xi64, #sparse>
    bufferization.dealloc_tensor %8 : tensor<8xi64, #sparse>
    bufferization.dealloc_tensor %2 : tensor<3x4xi64, #sparse1>
    bufferization.dealloc_tensor %3 : tensor<3x4xi64, #sparse1>
    bufferization.dealloc_tensor %9 : tensor<3x4xi64, #sparse1>
    bufferization.dealloc_tensor %10 : tensor<3x4xi64, #sparse1>
    bufferization.dealloc_tensor %11 : tensor<3x4xi64, #sparse1>
    bufferization.dealloc_tensor %12 : tensor<3x4xi64, #sparse1>
    bufferization.dealloc_tensor %4 : tensor<2x3xf32, #sparse1>
    bufferization.dealloc_tensor %13 : tensor<2x3xf32, #sparse1>
    return
  }
}

