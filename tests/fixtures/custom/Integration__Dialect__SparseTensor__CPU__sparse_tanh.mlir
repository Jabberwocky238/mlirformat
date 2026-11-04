#map = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @sparse_tanh(%arg0: tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse> {
    %0 = linalg.generic {doc = "X(i) = OP X(i)", indexing_maps = [#map], iterator_types = ["parallel"]} outs(%arg0 : tensor<?xf64, #sparse>) {
    ^bb0(%out: f64):
      %1 = math.tanh %out : f64
      linalg.yield %1 : f64
    } -> tensor<?xf64, #sparse>
    return %0 : tensor<?xf64, #sparse>
  }
  func.func @main() {
    %cst = arith.constant sparse<[[0], [3], [11], [17], [20], [21], [28], [29], [31]], [-1.000000e+00, 1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 1.000000e+02]> : tensor<32xf64>
    %0 = sparse_tensor.convert %cst : tensor<32xf64> to tensor<?xf64, #sparse>
    %1 = call @sparse_tanh(%0) : (tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>
    sparse_tensor.print %1 : tensor<?xf64, #sparse>
    bufferization.dealloc_tensor %0 : tensor<?xf64, #sparse>
    return
  }
}

