#map = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>
module {
  func.func @foo(%arg0: tensor<3xi32> {bufferization.writable = false}, %arg1: tensor<11xi32> {bufferization.writable = false}, %arg2: tensor<3xf64> {bufferization.writable = false}) -> index {
    %0 = sparse_tensor.assemble (%arg1, %arg0), %arg2 : (tensor<11xi32>, tensor<3xi32>), tensor<3xf64> to tensor<10x10xf64, #sparse>
    %cst = arith.constant 2.000000e+00 : f64
    %1 = linalg.generic {doc = "X(i,j) = X(i,j) * 2", indexing_maps = [#map], iterator_types = ["parallel", "parallel"]} outs(%0 : tensor<10x10xf64, #sparse>) {
    ^bb0(%out: f64):
      %3 = arith.mulf %out, %cst : f64
      linalg.yield %3 : f64
    } -> tensor<10x10xf64, #sparse>
    %2 = sparse_tensor.number_of_entries %1 : tensor<10x10xf64, #sparse>
    return %2 : index
  }
  func.func @bar(%arg0: tensor<3xi32> {bufferization.writable = true}, %arg1: tensor<11xi32> {bufferization.writable = true}, %arg2: tensor<3xf64> {bufferization.writable = true}) -> index {
    %0 = sparse_tensor.assemble (%arg1, %arg0), %arg2 : (tensor<11xi32>, tensor<3xi32>), tensor<3xf64> to tensor<10x10xf64, #sparse>
    %cst = arith.constant 2.000000e+00 : f64
    %1 = linalg.generic {doc = "X(i,j) = X(i,j) * 2", indexing_maps = [#map], iterator_types = ["parallel", "parallel"]} outs(%0 : tensor<10x10xf64, #sparse>) {
    ^bb0(%out: f64):
      %3 = arith.mulf %out, %cst : f64
      linalg.yield %3 : f64
    } -> tensor<10x10xf64, #sparse>
    %2 = sparse_tensor.number_of_entries %1 : tensor<10x10xf64, #sparse>
    return %2 : index
  }
}

