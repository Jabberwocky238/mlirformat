#map = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
module {
  func.func @kernel_eltwise_mult(%arg0: tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse> {
    %0 = linalg.generic {doc = "X(i,j) *= X(i,j)", indexing_maps = [#map], iterator_types = ["parallel", "parallel"]} outs(%arg0 : tensor<?x?xf64, #sparse>) {
    ^bb0(%out: f64):
      %1 = arith.mulf %out, %out : f64
      linalg.yield %1 : f64
    } -> tensor<?x?xf64, #sparse>
    return %0 : tensor<?x?xf64, #sparse>
  }
  func.func private @getTensorFilename(index) -> !llvm.ptr
  func.func @main() {
    %cst = arith.constant 0.000000e+00 : f64
    %c0 = arith.constant 0 : index
    %0 = call @getTensorFilename(%c0) : (index) -> !llvm.ptr
    %1 = sparse_tensor.new %0 : !llvm.ptr to tensor<?x?xf64, #sparse>
    %2 = call @kernel_eltwise_mult(%1) : (tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse>
    sparse_tensor.print %2 : tensor<?x?xf64, #sparse>
    bufferization.dealloc_tensor %1 : tensor<?x?xf64, #sparse>
    return
  }
}

