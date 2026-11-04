#map = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
module {
  func.func @dense_index(%arg0: tensor<?x?xi64, #sparse>) -> tensor<?x?xi64, #sparse> {
    %c0 = arith.constant 0 : index
    %c0_0 = arith.constant 0 : index
    %0 = sparse_tensor.lvl %arg0, %c0 : tensor<?x?xi64, #sparse>
    %1 = sparse_tensor.lvl %arg0, %c0_0 : tensor<?x?xi64, #sparse>
    %2 = tensor.empty(%0, %1) : tensor<?x?xi64, #sparse>
    %3 = linalg.generic {doc = "X(i,j) = A(i,j) * i * j", indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0 : tensor<?x?xi64, #sparse>) outs(%2 : tensor<?x?xi64, #sparse>) {
    ^bb0(%in: i64, %out: i64):
      %4 = linalg.index 0 : index
      %5 = linalg.index 1 : index
      %6 = arith.index_cast %4 : index to i64
      %7 = arith.index_cast %5 : index to i64
      %8 = arith.muli %6, %in : i64
      %9 = arith.muli %7, %8 : i64
      linalg.yield %9 : i64
    } -> tensor<?x?xi64, #sparse>
    return %3 : tensor<?x?xi64, #sparse>
  }
  func.func @sparse_index(%arg0: tensor<?x?xi64, #sparse1>) -> tensor<?x?xi64, #sparse1> {
    %c0 = arith.constant 0 : index
    %c0_0 = arith.constant 0 : index
    %0 = sparse_tensor.lvl %arg0, %c0 : tensor<?x?xi64, #sparse1>
    %1 = sparse_tensor.lvl %arg0, %c0_0 : tensor<?x?xi64, #sparse1>
    %2 = tensor.empty(%0, %1) : tensor<?x?xi64, #sparse1>
    %3 = linalg.generic {doc = "X(i,j) = A(i,j) * i * j", indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0 : tensor<?x?xi64, #sparse1>) outs(%2 : tensor<?x?xi64, #sparse1>) {
    ^bb0(%in: i64, %out: i64):
      %4 = linalg.index 0 : index
      %5 = linalg.index 1 : index
      %6 = arith.index_cast %4 : index to i64
      %7 = arith.index_cast %5 : index to i64
      %8 = arith.muli %6, %in : i64
      %9 = arith.muli %7, %8 : i64
      linalg.yield %9 : i64
    } -> tensor<?x?xi64, #sparse1>
    return %3 : tensor<?x?xi64, #sparse1>
  }
}

