#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
module {
  func.func @kernel_sum_reduce(%arg0: tensor<?x?xf64, #sparse>, %arg1: tensor<f64>) -> tensor<f64> {
    %0 = linalg.generic {doc = "x += A(i,j)", indexing_maps = [#map, #map1], iterator_types = ["reduction", "reduction"]} ins(%arg0 : tensor<?x?xf64, #sparse>) outs(%arg1 : tensor<f64>) {
    ^bb0(%in: f64, %out: f64):
      %1 = arith.addf %out, %in : f64
      linalg.yield %1 : f64
    } -> tensor<f64>
    return %0 : tensor<f64>
  }
  func.func private @getTensorFilename(index) -> !llvm.ptr
  func.func @main() {
    %cst = arith.constant 0.000000e+00 : f64
    %c0 = arith.constant 0 : index
    %from_elements = tensor.from_elements %cst : tensor<f64>
    %0 = call @getTensorFilename(%c0) : (index) -> !llvm.ptr
    %1 = sparse_tensor.new %0 : !llvm.ptr to tensor<?x?xf64, #sparse>
    %2 = call @kernel_sum_reduce(%1, %from_elements) : (tensor<?x?xf64, #sparse>, tensor<f64>) -> tensor<f64>
    %extracted = tensor.extract %2[] : tensor<f64>
    vector.print %extracted : f64
    bufferization.dealloc_tensor %1 : tensor<?x?xf64, #sparse>
    bufferization.dealloc_tensor %2 : tensor<f64>
    return
  }
}

