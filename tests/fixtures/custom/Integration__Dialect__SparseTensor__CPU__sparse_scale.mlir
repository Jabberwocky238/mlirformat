#map = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
module {
  func.func @sparse_scale(%arg0: tensor<8x8xf32, #sparse>) -> tensor<8x8xf32, #sparse> {
    %cst = arith.constant 2.000000e+00 : f32
    %0 = linalg.generic {doc = "X(i,j) = X(i,j) * 2", indexing_maps = [#map], iterator_types = ["parallel", "parallel"]} outs(%arg0 : tensor<8x8xf32, #sparse>) {
    ^bb0(%out: f32):
      %1 = arith.mulf %out, %cst : f32
      linalg.yield %1 : f32
    } -> tensor<8x8xf32, #sparse>
    return %0 : tensor<8x8xf32, #sparse>
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant dense<[[1.000000e+00, 0.000000e+00, 1.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 1.000000e+00], [0.000000e+00, 2.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 3.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 4.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 1.000000e+00, 0.000000e+00, 0.000000e+00, 5.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 1.000000e+00, 1.000000e+00, 0.000000e+00, 0.000000e+00, 6.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 1.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 7.000000e+00, 1.000000e+00], [0.000000e+00, 0.000000e+00, 1.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 8.000000e+00]]> : tensor<8x8xf32>
    %0 = sparse_tensor.convert %cst_0 : tensor<8x8xf32> to tensor<8x8xf32, #sparse>
    %1 = call @sparse_scale(%0) : (tensor<8x8xf32, #sparse>) -> tensor<8x8xf32, #sparse>
    sparse_tensor.print %1 : tensor<8x8xf32, #sparse>
    bufferization.dealloc_tensor %0 : tensor<8x8xf32, #sparse>
    return
  }
}

