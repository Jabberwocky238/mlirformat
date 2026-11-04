#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3, d4, d5, d6, d7)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2, d3, d4, d5, d6, d7) -> (d7 : compressed, d6 : compressed, d1 : compressed, d2 : compressed, d0 : compressed, d3 : compressed, d4 : compressed, d5 : compressed) }>
module {
  func.func @kernel_flatten(%arg0: tensor<7x3x3x3x3x3x5x3xf64, #sparse>, %arg1: tensor<7x3xf64>) -> tensor<7x3xf64> {
    %0 = linalg.generic {doc = "X(i,j) += A(i,j,k,l,m,n,o,p)", indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel", "reduction", "reduction", "reduction", "reduction", "reduction", "reduction"]} ins(%arg0 : tensor<7x3x3x3x3x3x5x3xf64, #sparse>) outs(%arg1 : tensor<7x3xf64>) {
    ^bb0(%in: f64, %out: f64):
      %1 = arith.addf %out, %in : f64
      linalg.yield %1 : f64
    } -> tensor<7x3xf64>
    return %0 : tensor<7x3xf64>
  }
  func.func private @getTensorFilename(index) -> !llvm.ptr
  func.func private @printMemrefF64(tensor<*xf64>)
  func.func @main() {
    %cst = arith.constant 0.000000e+00 : f64
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %c7 = arith.constant 7 : index
    %cst_0 = arith.constant dense<0.000000e+00> : tensor<7x3xf64>
    %0 = call @getTensorFilename(%c0) : (index) -> !llvm.ptr
    %1 = sparse_tensor.new %0 : !llvm.ptr to tensor<7x3x3x3x3x3x5x3xf64, #sparse>
    %2 = call @kernel_flatten(%1, %cst_0) : (tensor<7x3x3x3x3x3x5x3xf64, #sparse>, tensor<7x3xf64>) -> tensor<7x3xf64>
    %cast = tensor.cast %2 : tensor<7x3xf64> to tensor<*xf64>
    call @printMemrefF64(%cast) : (tensor<*xf64>) -> ()
    bufferization.dealloc_tensor %1 : tensor<7x3x3x3x3x3x5x3xf64, #sparse>
    bufferization.dealloc_tensor %2 : tensor<7x3xf64>
    return
  }
}

