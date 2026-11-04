#map = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : dense, d1 : compressed, d2 : dense, d3 : dense) }>
module {
  func.func private @getTensorFilename(index) -> !llvm.ptr
  func.func @scale(%arg0: tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse> {
    %cst = arith.constant 3.000000e+00 : f64
    %0 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel", "parallel"]} outs(%arg0 : tensor<?x?xf64, #sparse>) {
    ^bb0(%out: f64):
      %1 = arith.mulf %out, %cst : f64
      linalg.yield %1 : f64
    } -> tensor<?x?xf64, #sparse>
    return %0 : tensor<?x?xf64, #sparse>
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f64
    %0 = call @getTensorFilename(%c0) : (index) -> !llvm.ptr
    %1 = sparse_tensor.new %0 : !llvm.ptr to tensor<?x?xf64, #sparse>
    sparse_tensor.print %1 : tensor<?x?xf64, #sparse>
    %2 = sparse_tensor.reinterpret_map %1 : tensor<?x?xf64, #sparse> to tensor<?x?x2x2xf64, #sparse1>
    sparse_tensor.print %2 : tensor<?x?x2x2xf64, #sparse1>
    %3 = call @scale(%1) : (tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse>
    sparse_tensor.print %3 : tensor<?x?xf64, #sparse>
    bufferization.dealloc_tensor %1 : tensor<?x?xf64, #sparse>
    return
  }
}

