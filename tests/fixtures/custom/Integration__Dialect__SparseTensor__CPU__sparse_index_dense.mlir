#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
module {
  func.func @sparse_index_1d_conj(%arg0: tensor<8xi64, #sparse>) -> tensor<8xi64> {
    %0 = tensor.empty() : tensor<8xi64>
    %1 = linalg.generic {doc = "X(i) = a(i) op i", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<8xi64, #sparse>) outs(%0 : tensor<8xi64>) {
    ^bb0(%in: i64, %out: i64):
      %2 = linalg.index 0 : index
      %3 = arith.index_cast %2 : index to i64
      %4 = arith.muli %in, %3 : i64
      linalg.yield %4 : i64
    } -> tensor<8xi64>
    return %1 : tensor<8xi64>
  }
  func.func @sparse_index_1d_disj(%arg0: tensor<8xi64, #sparse>) -> tensor<8xi64> {
    %0 = tensor.empty() : tensor<8xi64>
    %1 = linalg.generic {doc = "X(i) = a(i) op i", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<8xi64, #sparse>) outs(%0 : tensor<8xi64>) {
    ^bb0(%in: i64, %out: i64):
      %2 = linalg.index 0 : index
      %3 = arith.index_cast %2 : index to i64
      %4 = arith.addi %in, %3 : i64
      linalg.yield %4 : i64
    } -> tensor<8xi64>
    return %1 : tensor<8xi64>
  }
  func.func @sparse_index_2d_conj(%arg0: tensor<3x4xi64, #sparse1>) -> tensor<3x4xi64> {
    %0 = tensor.empty() : tensor<3x4xi64>
    %1 = linalg.generic {doc = "X(i,j) = A(i,j) op i op j", indexing_maps = [#map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg0 : tensor<3x4xi64, #sparse1>) outs(%0 : tensor<3x4xi64>) {
    ^bb0(%in: i64, %out: i64):
      %2 = linalg.index 0 : index
      %3 = linalg.index 1 : index
      %4 = arith.index_cast %2 : index to i64
      %5 = arith.index_cast %3 : index to i64
      %6 = arith.muli %4, %in : i64
      %7 = arith.muli %5, %6 : i64
      linalg.yield %7 : i64
    } -> tensor<3x4xi64>
    return %1 : tensor<3x4xi64>
  }
  func.func @sparse_index_2d_disj(%arg0: tensor<3x4xi64, #sparse1>) -> tensor<3x4xi64> {
    %0 = tensor.empty() : tensor<3x4xi64>
    %1 = linalg.generic {doc = "X(i,j) = A(i,j) op i op j", indexing_maps = [#map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg0 : tensor<3x4xi64, #sparse1>) outs(%0 : tensor<3x4xi64>) {
    ^bb0(%in: i64, %out: i64):
      %2 = linalg.index 0 : index
      %3 = linalg.index 1 : index
      %4 = arith.index_cast %2 : index to i64
      %5 = arith.index_cast %3 : index to i64
      %6 = arith.addi %4, %in : i64
      %7 = arith.addi %5, %6 : i64
      linalg.yield %7 : i64
    } -> tensor<3x4xi64>
    return %1 : tensor<3x4xi64>
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c-1_i64 = arith.constant -1 : i64
    %cst = arith.constant sparse<[[2], [4]], [10, 20]> : tensor<8xi64>
    %0 = sparse_tensor.convert %cst : tensor<8xi64> to tensor<8xi64, #sparse>
    %cst_0 = arith.constant dense<[1, 2, 4, 8, 16, 32, 64, 128]> : tensor<8xi64>
    %1 = sparse_tensor.convert %cst_0 : tensor<8xi64> to tensor<8xi64, #sparse>
    %cst_1 = arith.constant sparse<[[1, 1], [2, 3]], [10, 20]> : tensor<3x4xi64>
    %2 = sparse_tensor.convert %cst_1 : tensor<3x4xi64> to tensor<3x4xi64, #sparse1>
    %cst_2 = arith.constant dense<[[1, 1, 1, 1], [1, 2, 1, 1], [1, 1, 3, 4]]> : tensor<3x4xi64>
    %3 = sparse_tensor.convert %cst_2 : tensor<3x4xi64> to tensor<3x4xi64, #sparse1>
    %4 = call @sparse_index_1d_conj(%0) : (tensor<8xi64, #sparse>) -> tensor<8xi64>
    %5 = call @sparse_index_1d_disj(%0) : (tensor<8xi64, #sparse>) -> tensor<8xi64>
    %6 = call @sparse_index_1d_conj(%1) : (tensor<8xi64, #sparse>) -> tensor<8xi64>
    %7 = call @sparse_index_1d_disj(%1) : (tensor<8xi64, #sparse>) -> tensor<8xi64>
    %8 = call @sparse_index_2d_conj(%2) : (tensor<3x4xi64, #sparse1>) -> tensor<3x4xi64>
    %9 = call @sparse_index_2d_disj(%2) : (tensor<3x4xi64, #sparse1>) -> tensor<3x4xi64>
    %10 = call @sparse_index_2d_conj(%3) : (tensor<3x4xi64, #sparse1>) -> tensor<3x4xi64>
    %11 = call @sparse_index_2d_disj(%3) : (tensor<3x4xi64, #sparse1>) -> tensor<3x4xi64>
    %12 = vector.transfer_read %4[%c0], %c-1_i64 : tensor<8xi64>, vector<8xi64>
    %13 = vector.transfer_read %5[%c0], %c-1_i64 : tensor<8xi64>, vector<8xi64>
    %14 = vector.transfer_read %6[%c0], %c-1_i64 : tensor<8xi64>, vector<8xi64>
    %15 = vector.transfer_read %7[%c0], %c-1_i64 : tensor<8xi64>, vector<8xi64>
    %16 = vector.transfer_read %8[%c0, %c0], %c-1_i64 : tensor<3x4xi64>, vector<3x4xi64>
    %17 = vector.transfer_read %9[%c0, %c0], %c-1_i64 : tensor<3x4xi64>, vector<3x4xi64>
    %18 = vector.transfer_read %10[%c0, %c0], %c-1_i64 : tensor<3x4xi64>, vector<3x4xi64>
    %19 = vector.transfer_read %11[%c0, %c0], %c-1_i64 : tensor<3x4xi64>, vector<3x4xi64>
    vector.print %12 : vector<8xi64>
    vector.print %13 : vector<8xi64>
    vector.print %14 : vector<8xi64>
    vector.print %15 : vector<8xi64>
    vector.print %16 : vector<3x4xi64>
    vector.print %17 : vector<3x4xi64>
    vector.print %18 : vector<3x4xi64>
    vector.print %19 : vector<3x4xi64>
    bufferization.dealloc_tensor %0 : tensor<8xi64, #sparse>
    bufferization.dealloc_tensor %1 : tensor<8xi64, #sparse>
    bufferization.dealloc_tensor %2 : tensor<3x4xi64, #sparse1>
    bufferization.dealloc_tensor %3 : tensor<3x4xi64, #sparse1>
    bufferization.dealloc_tensor %4 : tensor<8xi64>
    bufferization.dealloc_tensor %5 : tensor<8xi64>
    bufferization.dealloc_tensor %6 : tensor<8xi64>
    bufferization.dealloc_tensor %7 : tensor<8xi64>
    bufferization.dealloc_tensor %8 : tensor<3x4xi64>
    bufferization.dealloc_tensor %9 : tensor<3x4xi64>
    bufferization.dealloc_tensor %10 : tensor<3x4xi64>
    bufferization.dealloc_tensor %11 : tensor<3x4xi64>
    return
  }
}

