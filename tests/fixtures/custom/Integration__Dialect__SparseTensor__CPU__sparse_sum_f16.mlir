#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
module {
  func.func @kernel_sum_reduce(%arg0: tensor<?x?xf16, #sparse>, %arg1: tensor<f16>) -> tensor<f16> {
    %0 = linalg.generic {doc = "x += A(i,j)", indexing_maps = [#map, #map1], iterator_types = ["reduction", "reduction"]} ins(%arg0 : tensor<?x?xf16, #sparse>) outs(%arg1 : tensor<f16>) {
    ^bb0(%in: f16, %out: f16):
      %1 = arith.addf %out, %in : f16
      linalg.yield %1 : f16
    } -> tensor<f16>
    return %0 : tensor<f16>
  }
  func.func private @getTensorFilename(index) -> !llvm.ptr
  func.func @main() {
    %cst = arith.constant dense<[[1.099610e+00, 1.200200e+00, 0.000000e+00, 1.400390e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [3.099610e+00, 0.000000e+00, 3.300780e+00, 3.400390e+00]]> : tensor<3x4xf16>
    %0 = sparse_tensor.convert %cst : tensor<3x4xf16> to tensor<?x?xf16, #sparse>
    %cst_0 = arith.constant 0.000000e+00 : f16
    %from_elements = tensor.from_elements %cst_0 : tensor<f16>
    %1 = call @kernel_sum_reduce(%0, %from_elements) : (tensor<?x?xf16, #sparse>, tensor<f16>) -> tensor<f16>
    %extracted = tensor.extract %1[] : tensor<f16>
    %2 = arith.extf %extracted : f16 to f32
    vector.print %2 : f32
    bufferization.dealloc_tensor %1 : tensor<f16>
    bufferization.dealloc_tensor %0 : tensor<?x?xf16, #sparse>
    return
  }
}

