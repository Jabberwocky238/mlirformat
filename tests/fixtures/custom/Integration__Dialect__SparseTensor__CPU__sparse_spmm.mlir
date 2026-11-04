#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
module {
  func.func @kernel_spmm(%arg0: tensor<?x?xf64, #sparse>, %arg1: tensor<?x?xf64>, %arg2: tensor<?x?xf64>) -> tensor<?x?xf64> {
    %0 = linalg.generic {doc = "X(i,j) += A(i,k) * B(k,j)", indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<?x?xf64, #sparse>, tensor<?x?xf64>) outs(%arg2 : tensor<?x?xf64>) {
    ^bb0(%in: f64, %in_0: f64, %out: f64):
      %1 = arith.mulf %in, %in_0 : f64
      %2 = arith.addf %out, %1 : f64
      linalg.yield %2 : f64
    } -> tensor<?x?xf64>
    return %0 : tensor<?x?xf64>
  }
  func.func private @getTensorFilename(index) -> !llvm.ptr
  func.func @main() {
    %cst = arith.constant 0.000000e+00 : f64
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c256 = arith.constant 256 : index
    %0 = call @getTensorFilename(%c0) : (index) -> !llvm.ptr
    %1 = sparse_tensor.new %0 : !llvm.ptr to tensor<?x?xf64, #sparse>
    %generated = tensor.generate %c256, %c4 {
    ^bb0(%arg0: index, %arg1: index):
      %4 = arith.muli %arg0, %c4 : index
      %5 = arith.addi %arg1, %4 : index
      %6 = arith.index_cast %5 : index to i32
      %7 = arith.sitofp %6 : i32 to f64
      tensor.yield %7 : f64
    } : tensor<?x?xf64>
    %generated_0 = tensor.generate %c4, %c4 {
    ^bb0(%arg0: index, %arg1: index):
      tensor.yield %cst : f64
    } : tensor<?x?xf64>
    %2 = call @kernel_spmm(%1, %generated, %generated_0) : (tensor<?x?xf64, #sparse>, tensor<?x?xf64>, tensor<?x?xf64>) -> tensor<?x?xf64>
    %3 = vector.transfer_read %2[%c0, %c0], %cst : tensor<?x?xf64>, vector<4x4xf64>
    vector.print %3 : vector<4x4xf64>
    bufferization.dealloc_tensor %1 : tensor<?x?xf64, #sparse>
    bufferization.dealloc_tensor %generated : tensor<?x?xf64>
    bufferization.dealloc_tensor %2 : tensor<?x?xf64>
    return
  }
}

