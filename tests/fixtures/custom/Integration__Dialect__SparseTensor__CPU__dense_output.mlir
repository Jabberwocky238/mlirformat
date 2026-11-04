#map = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>
module {
  func.func @dense_output(%arg0: tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse1> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 2.000000e+00 : f64
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf64, #sparse>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?xf64, #sparse>
    %0 = tensor.empty(%dim, %dim_0) : tensor<?x?xf64, #sparse1>
    %1 = linalg.generic {doc = "X(i,j) = A(i,j) * 2", indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0 : tensor<?x?xf64, #sparse>) outs(%0 : tensor<?x?xf64, #sparse1>) {
    ^bb0(%in: f64, %out: f64):
      %2 = arith.mulf %in, %cst : f64
      linalg.yield %2 : f64
    } -> tensor<?x?xf64, #sparse1>
    return %1 : tensor<?x?xf64, #sparse1>
  }
  func.func private @getTensorFilename(index) -> !llvm.ptr
  func.func @main() {
    %cst = arith.constant 0.000000e+00 : f64
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = call @getTensorFilename(%c0) : (index) -> !llvm.ptr
    %1 = sparse_tensor.new %0 : !llvm.ptr to tensor<?x?xf64, #sparse>
    %2 = call @dense_output(%1) : (tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse1>
    sparse_tensor.print %2 : tensor<?x?xf64, #sparse1>
    bufferization.dealloc_tensor %1 : tensor<?x?xf64, #sparse>
    bufferization.dealloc_tensor %2 : tensor<?x?xf64, #sparse1>
    return
  }
}

