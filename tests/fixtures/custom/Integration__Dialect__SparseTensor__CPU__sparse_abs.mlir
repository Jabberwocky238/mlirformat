#map = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @sparse_absf(%arg0: tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse> {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?xf64, #sparse>
    %0 = tensor.empty(%dim) : tensor<?xf64, #sparse>
    %1 = linalg.generic {doc = "x(i) = OP a(i)", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<?xf64, #sparse>) outs(%0 : tensor<?xf64, #sparse>) {
    ^bb0(%in: f64, %out: f64):
      %2 = math.absf %in : f64
      linalg.yield %2 : f64
    } -> tensor<?xf64, #sparse>
    return %1 : tensor<?xf64, #sparse>
  }
  func.func @sparse_absi(%arg0: tensor<?xi32, #sparse>) -> tensor<?xi32, #sparse> {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?xi32, #sparse>
    %0 = tensor.empty(%dim) : tensor<?xi32, #sparse>
    %1 = linalg.generic {doc = "x(i) = OP a(i)", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<?xi32, #sparse>) outs(%0 : tensor<?xi32, #sparse>) {
    ^bb0(%in: i32, %out: i32):
      %2 = math.absi %in : i32
      linalg.yield %2 : i32
    } -> tensor<?xi32, #sparse>
    return %1 : tensor<?xi32, #sparse>
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 99.989999999999994 : f64
    %c9999_i32 = arith.constant 9999 : i32
    %cst_0 = arith.constant 0x7FF0000001000000 : f64
    %cst_1 = arith.constant 0xFFF0000001000000 : f64
    %cst_2 = arith.constant 0x7FF0000000000000 : f64
    %cst_3 = arith.constant 0xFFF0000000000000 : f64
    %cst_4 = arith.constant sparse<[[0], [3], [5], [11], [13], [17], [18], [20], [21], [28], [29], [31]], [-1.500000e+00, 1.500000e+00, -1.020000e+01, 1.130000e+01, 1.000000e+00, -1.000000e+00, 0x7FF0000001000000, 0xFFF0000001000000, 0x7FF0000000000000, 0xFFF0000000000000, -0.000000e+00, 0.000000e+00]> : tensor<32xf64>
    %cst_5 = arith.constant sparse<[[0], [3], [5], [11], [13], [17], [18], [21], [31]], [-2147483648, -2147483647, -1000, -1, 0, 1, 1000, 2147483646, 2147483647]> : tensor<32xi32>
    %0 = sparse_tensor.convert %cst_4 : tensor<32xf64> to tensor<?xf64, #sparse>
    %1 = sparse_tensor.convert %cst_5 : tensor<32xi32> to tensor<?xi32, #sparse>
    %2 = call @sparse_absf(%0) : (tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>
    %3 = call @sparse_absi(%1) : (tensor<?xi32, #sparse>) -> tensor<?xi32, #sparse>
    sparse_tensor.print %2 : tensor<?xf64, #sparse>
    sparse_tensor.print %3 : tensor<?xi32, #sparse>
    bufferization.dealloc_tensor %0 : tensor<?xf64, #sparse>
    bufferization.dealloc_tensor %1 : tensor<?xi32, #sparse>
    bufferization.dealloc_tensor %2 : tensor<?xf64, #sparse>
    bufferization.dealloc_tensor %3 : tensor<?xi32, #sparse>
    return
  }
}

