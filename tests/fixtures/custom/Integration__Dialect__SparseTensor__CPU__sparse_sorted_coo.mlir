#map = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed(nonunique), d0 : singleton(soa)) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed(nonunique), d1 : singleton(nonunique, soa), d2 : singleton(soa)) }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : compressed(nonunique), d0 : singleton(nonunique, soa), d1 : singleton(soa)) }>
module {
  func.func private @getTensorFilename(index) -> !llvm.ptr
  func.func @sparse_scale(%arg0: tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse> {
    %cst = arith.constant 2.000000e+00 : f64
    %0 = linalg.generic {doc = "X(i,j) = X(i,j) * 2.0", indexing_maps = [#map], iterator_types = ["parallel", "parallel"]} outs(%arg0 : tensor<?x?xf64, #sparse>) {
    ^bb0(%out: f64):
      %1 = arith.mulf %out, %cst : f64
      linalg.yield %1 : f64
    } -> tensor<?x?xf64, #sparse>
    return %0 : tensor<?x?xf64, #sparse>
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = call @getTensorFilename(%c0) : (index) -> !llvm.ptr
    %1 = call @getTensorFilename(%c1) : (index) -> !llvm.ptr
    %2 = sparse_tensor.new %0 : !llvm.ptr to tensor<?x?xf64, #sparse>
    %3 = sparse_tensor.new %0 : !llvm.ptr to tensor<?x?xf64, #sparse1>
    %4 = sparse_tensor.new %1 : !llvm.ptr to tensor<?x?x?xf64, #sparse2>
    %5 = sparse_tensor.new %1 : !llvm.ptr to tensor<?x?x?xf64, #sparse3>
    %cst = arith.constant sparse<[[0, 0], [1, 3], [2, 0], [2, 3], [3, 1], [4, 1]], [6.000000e+00, 5.000000e+00, 4.000000e+00, 3.000000e+00, 2.000000e+00, 1.100000e+01]> : tensor<5x4xf64>
    %6 = sparse_tensor.convert %cst : tensor<5x4xf64> to tensor<?x?xf64, #sparse>
    sparse_tensor.print %2 : tensor<?x?xf64, #sparse>
    sparse_tensor.print %3 : tensor<?x?xf64, #sparse1>
    sparse_tensor.print %4 : tensor<?x?x?xf64, #sparse2>
    sparse_tensor.print %5 : tensor<?x?x?xf64, #sparse3>
    sparse_tensor.print %6 : tensor<?x?xf64, #sparse>
    %7 = call @sparse_scale(%6) : (tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse>
    sparse_tensor.print %7 : tensor<?x?xf64, #sparse>
    bufferization.dealloc_tensor %2 : tensor<?x?xf64, #sparse>
    bufferization.dealloc_tensor %3 : tensor<?x?xf64, #sparse1>
    bufferization.dealloc_tensor %4 : tensor<?x?x?xf64, #sparse2>
    bufferization.dealloc_tensor %5 : tensor<?x?x?xf64, #sparse3>
    bufferization.dealloc_tensor %6 : tensor<?x?xf64, #sparse>
    return
  }
}

