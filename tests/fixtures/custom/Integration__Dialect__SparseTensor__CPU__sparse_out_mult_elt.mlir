#map = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
module {
  func.func @sparse_mult_elt(%arg0: tensor<32x16xf32, #sparse>, %arg1: tensor<32x16xf32, #sparse>) -> tensor<32x16xf32, #sparse> {
    %0 = tensor.empty() : tensor<32x16xf32, #sparse>
    %1 = linalg.generic {doc = "X(i,j) = A(i,j) * B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<32x16xf32, #sparse>, tensor<32x16xf32, #sparse>) outs(%0 : tensor<32x16xf32, #sparse>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %2 = arith.mulf %in, %in_0 : f32
      linalg.yield %2 : f32
    } -> tensor<32x16xf32, #sparse>
    return %1 : tensor<32x16xf32, #sparse>
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant sparse<[[2, 2], [15, 15], [31, 0], [31, 14]], [2.000000e+00, 3.000000e+00, -2.000000e+00, 4.000000e+00]> : tensor<32x16xf32>
    %cst_1 = arith.constant sparse<[[1, 1], [2, 0], [2, 2], [2, 15], [31, 0], [31, 15]], [5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00, -1.000000e+01, 9.000000e+00]> : tensor<32x16xf32>
    %0 = sparse_tensor.convert %cst_0 : tensor<32x16xf32> to tensor<32x16xf32, #sparse>
    %1 = sparse_tensor.convert %cst_1 : tensor<32x16xf32> to tensor<32x16xf32, #sparse>
    %2 = call @sparse_mult_elt(%0, %1) : (tensor<32x16xf32, #sparse>, tensor<32x16xf32, #sparse>) -> tensor<32x16xf32, #sparse>
    sparse_tensor.print %2 : tensor<32x16xf32, #sparse>
    bufferization.dealloc_tensor %0 : tensor<32x16xf32, #sparse>
    bufferization.dealloc_tensor %1 : tensor<32x16xf32, #sparse>
    bufferization.dealloc_tensor %2 : tensor<32x16xf32, #sparse>
    return
  }
}

