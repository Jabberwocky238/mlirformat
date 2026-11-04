#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
module {
  func.func @kernel_sum_reduce(%arg0: tensor<?x?xbf16, #sparse>, %arg1: tensor<bf16>) -> tensor<bf16> {
    %0 = linalg.generic {doc = "x += A(i,j)", indexing_maps = [#map, #map1], iterator_types = ["reduction", "reduction"]} ins(%arg0 : tensor<?x?xbf16, #sparse>) outs(%arg1 : tensor<bf16>) {
    ^bb0(%in: bf16, %out: bf16):
      %1 = arith.addf %out, %in : bf16
      linalg.yield %1 : bf16
    } -> tensor<bf16>
    return %0 : tensor<bf16>
  }
  func.func private @getTensorFilename(index) -> !llvm.ptr
  func.func @main() {
    %cst = arith.constant dense<[[1.101560e+00, 1.203130e+00, 0.000000e+00, 1.398440e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [3.093750e+00, 0.000000e+00, 3.296880e+00, 3.406250e+00]]> : tensor<3x4xbf16>
    %0 = sparse_tensor.convert %cst : tensor<3x4xbf16> to tensor<?x?xbf16, #sparse>
    %cst_0 = arith.constant 0.000000e+00 : bf16
    %from_elements = tensor.from_elements %cst_0 : tensor<bf16>
    %1 = call @kernel_sum_reduce(%0, %from_elements) : (tensor<?x?xbf16, #sparse>, tensor<bf16>) -> tensor<bf16>
    %extracted = tensor.extract %1[] : tensor<bf16>
    %2 = arith.extf %extracted : bf16 to f32
    vector.print %2 : f32
    bufferization.dealloc_tensor %0 : tensor<?x?xbf16, #sparse>
    bufferization.dealloc_tensor %1 : tensor<bf16>
    return
  }
}

