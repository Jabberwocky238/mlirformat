#map = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
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
}

