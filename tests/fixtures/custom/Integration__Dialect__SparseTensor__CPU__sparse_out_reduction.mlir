#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
module {
  func.func @redsum(%arg0: tensor<?x?x?xi32, #sparse>, %arg1: tensor<?x?x?xi32, #sparse>) -> tensor<?x?xi32, #sparse1> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?x?xi32, #sparse>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?x?xi32, #sparse>
    %0 = tensor.empty(%dim, %dim_0) : tensor<?x?xi32, #sparse1>
    %1 = linalg.generic {doc = "X(i,j) = SUM_k A(i,j,k) * B(i,j,k)", indexing_maps = [#map, #map, #map1], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<?x?x?xi32, #sparse>, tensor<?x?x?xi32, #sparse>) outs(%0 : tensor<?x?xi32, #sparse1>) {
    ^bb0(%in: i32, %in_1: i32, %out: i32):
      %2 = arith.muli %in, %in_1 : i32
      %3 = arith.addi %out, %2 : i32
      linalg.yield %3 : i32
    } -> tensor<?x?xi32, #sparse1>
    return %1 : tensor<?x?xi32, #sparse1>
  }
  func.func @main() {
    %cst = arith.constant sparse<[[1, 1, 3], [2, 0, 0], [2, 2, 1], [2, 2, 2], [2, 2, 3]], [1, 2, 3, 4, 5]> : tensor<3x3x4xi32>
    %cst_0 = arith.constant sparse<[[1, 0, 0], [1, 1, 3], [2, 2, 1], [2, 2, 3]], [6, 7, 8, 9]> : tensor<3x3x4xi32>
    %0 = sparse_tensor.convert %cst : tensor<3x3x4xi32> to tensor<?x?x?xi32, #sparse>
    %1 = sparse_tensor.convert %cst_0 : tensor<3x3x4xi32> to tensor<?x?x?xi32, #sparse>
    %2 = call @redsum(%0, %1) : (tensor<?x?x?xi32, #sparse>, tensor<?x?x?xi32, #sparse>) -> tensor<?x?xi32, #sparse1>
    sparse_tensor.print %2 : tensor<?x?xi32, #sparse1>
    bufferization.dealloc_tensor %0 : tensor<?x?x?xi32, #sparse>
    bufferization.dealloc_tensor %1 : tensor<?x?x?xi32, #sparse>
    bufferization.dealloc_tensor %2 : tensor<?x?xi32, #sparse1>
    return
  }
}

