#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map4 = affine_map<(d0, d1, d2) -> (d2, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>
module {
  func.func @sparse_simply_dynamic1(%arg0: tensor<32x16xf32, #sparse>) -> tensor<32x16xf32, #sparse> {
    %cst = arith.constant 2.000000e+00 : f32
    %0 = linalg.generic {doc = "X(i,j) *= 2 or X(i,j) += X(i,j)", indexing_maps = [#map], iterator_types = ["parallel", "parallel"]} outs(%arg0 : tensor<32x16xf32, #sparse>) {
    ^bb0(%out: f32):
      %1 = arith.mulf %out, %cst : f32
      linalg.yield %1 : f32
    } -> tensor<32x16xf32, #sparse>
    return %0 : tensor<32x16xf32, #sparse>
  }
  func.func @sparse_simply_dynamic2(%arg0: tensor<32x16xf32, #sparse>) -> tensor<32x16xf32, #sparse> {
    %0 = linalg.generic {doc = "X(i,j) *= 2 or X(i,j) += X(i,j)", indexing_maps = [#map], iterator_types = ["parallel", "parallel"]} outs(%arg0 : tensor<32x16xf32, #sparse>) {
    ^bb0(%out: f32):
      %1 = arith.addf %out, %out : f32
      linalg.yield %1 : f32
    } -> tensor<32x16xf32, #sparse>
    return %0 : tensor<32x16xf32, #sparse>
  }
  func.func @sparse_truly_dynamic(%arg0: tensor<10x20xf32, #sparse1>) -> tensor<10x20xf32, #sparse> {
    %cst = arith.constant 2.000000e+00 : f32
    %0 = tensor.empty() : tensor<10x20xf32, #sparse>
    %1 = linalg.generic {doc = "X(i,j) = A(i,j) * 2.0", indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0 : tensor<10x20xf32, #sparse1>) outs(%0 : tensor<10x20xf32, #sparse>) {
    ^bb0(%in: f32, %out: f32):
      %2 = arith.mulf %in, %cst : f32
      linalg.yield %2 : f32
    } -> tensor<10x20xf32, #sparse>
    return %1 : tensor<10x20xf32, #sparse>
  }
  func.func @sumred(%arg0: tensor<?x?x?xi32, #sparse2>, %arg1: tensor<?x?x?xi32, #sparse2>) -> tensor<?x?xi32, #sparse> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?x?xi32, #sparse2>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?x?xi32, #sparse2>
    %0 = tensor.empty(%dim, %dim_0) : tensor<?x?xi32, #sparse>
    %1 = linalg.generic {doc = "X(i,j) = SUM_k A(i,j,k) * B(i,j,k)", indexing_maps = [#map1, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<?x?x?xi32, #sparse2>, tensor<?x?x?xi32, #sparse2>) outs(%0 : tensor<?x?xi32, #sparse>) {
    ^bb0(%in: i32, %in_1: i32, %out: i32):
      %2 = arith.muli %in, %in_1 : i32
      %3 = arith.addi %out, %2 : i32
      linalg.yield %3 : i32
    } -> tensor<?x?xi32, #sparse>
    return %1 : tensor<?x?xi32, #sparse>
  }
  func.func @matmat(%arg0: tensor<?x?xf32, #sparse>, %arg1: tensor<?x?xf32, #sparse>) -> tensor<?x?xf32, #sparse> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf32, #sparse>
    %dim_0 = tensor.dim %arg1, %c1 : tensor<?x?xf32, #sparse>
    %0 = tensor.empty(%dim, %dim_0) : tensor<?x?xf32, #sparse>
    %1 = linalg.generic {doc = "C(i,j) = SUM_k A(i,k) * B(k,j)", indexing_maps = [#map3, #map4, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<?x?xf32, #sparse>, tensor<?x?xf32, #sparse>) outs(%0 : tensor<?x?xf32, #sparse>) {
    ^bb0(%in: f32, %in_1: f32, %out: f32):
      %2 = arith.mulf %in, %in_1 : f32
      %3 = arith.addf %out, %2 : f32
      linalg.yield %3 : f32
    } -> tensor<?x?xf32, #sparse>
    return %1 : tensor<?x?xf32, #sparse>
  }
}

