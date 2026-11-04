#map = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @sparse_sign(%arg0: tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse> {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?xf64, #sparse>
    %0 = tensor.empty(%dim) : tensor<?xf64, #sparse>
    %1 = linalg.generic {doc = "x(i) = OP a(i)", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<?xf64, #sparse>) outs(%0 : tensor<?xf64, #sparse>) {
    ^bb0(%in: f64, %out: f64):
      %2 = sparse_tensor.unary %in : f64 to f64
       present = {
      ^bb0(%arg1: f64):
        %cst = arith.constant 0.000000e+00 : f64
        %3 = arith.cmpf one, %arg1, %cst : f64
        %4 = arith.uitofp %3 : i1 to f64
        %5 = math.copysign %4, %arg1 : f64
        %6 = arith.cmpf uno, %arg1, %arg1 : f64
        %7 = arith.select %6, %arg1, %5 : f64
        sparse_tensor.yield %7 : f64
      }
       absent = {
      }
      linalg.yield %2 : f64
    } -> tensor<?xf64, #sparse>
    return %1 : tensor<?xf64, #sparse>
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f64
    %cst_0 = arith.constant 0x7FF0000001000000 : f64
    %cst_1 = arith.constant 0xFFF0000001000000 : f64
    %cst_2 = arith.constant 0x7FF0000000000000 : f64
    %cst_3 = arith.constant 0xFFF0000000000000 : f64
    %cst_4 = arith.constant sparse<[[0], [3], [5], [11], [13], [17], [18], [20], [21], [28], [29], [31]], [-1.500000e+00, 1.500000e+00, -1.020000e+01, 1.130000e+01, 1.000000e+00, -1.000000e+00, 0x7FF0000001000000, 0xFFF0000001000000, 0x7FF0000000000000, 0xFFF0000000000000, -0.000000e+00, 0.000000e+00]> : tensor<32xf64>
    %0 = sparse_tensor.convert %cst_4 : tensor<32xf64> to tensor<?xf64, #sparse>
    %1 = call @sparse_sign(%0) : (tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>
    sparse_tensor.print %1 : tensor<?xf64, #sparse>
    bufferization.dealloc_tensor %0 : tensor<?xf64, #sparse>
    bufferization.dealloc_tensor %1 : tensor<?xf64, #sparse>
    return
  }
}

