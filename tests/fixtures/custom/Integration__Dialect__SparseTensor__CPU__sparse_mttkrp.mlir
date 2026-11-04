#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d3, d1)>
#map3 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>
module {
  func.func private @printMemrefF64(tensor<*xf64>)
  func.func @kernel_mttkrp(%arg0: tensor<?x?x?xf64, #sparse>, %arg1: tensor<?x?xf64>, %arg2: tensor<?x?xf64>, %arg3: tensor<?x?xf64>) -> tensor<?x?xf64> {
    %0 = linalg.generic {doc = "A(i,j) += B(i,k,l) * D(l,j) * C(k,j)", indexing_maps = [#map, #map1, #map2, #map3], iterator_types = ["parallel", "parallel", "reduction", "reduction"]} ins(%arg0, %arg1, %arg2 : tensor<?x?x?xf64, #sparse>, tensor<?x?xf64>, tensor<?x?xf64>) outs(%arg3 : tensor<?x?xf64>) {
    ^bb0(%in: f64, %in_0: f64, %in_1: f64, %out: f64):
      %1 = arith.mulf %in, %in_0 : f64
      %2 = arith.mulf %in_1, %1 : f64
      %3 = arith.addf %out, %2 : f64
      linalg.yield %3 : f64
    } -> tensor<?x?xf64>
    return %0 : tensor<?x?xf64>
  }
  func.func private @getTensorFilename(index) -> !llvm.ptr
  func.func @main() {
    %cst = arith.constant 0.000000e+00 : f64
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %0 = call @getTensorFilename(%c0) : (index) -> !llvm.ptr
    %1 = sparse_tensor.new %0 : !llvm.ptr to tensor<?x?x?xf64, #sparse>
    %dim = tensor.dim %1, %c0 : tensor<?x?x?xf64, #sparse>
    %c5 = arith.constant 5 : index
    %dim_0 = tensor.dim %1, %c1 : tensor<?x?x?xf64, #sparse>
    %dim_1 = tensor.dim %1, %c2 : tensor<?x?x?xf64, #sparse>
    %generated = tensor.generate %dim_0, %c5 {
    ^bb0(%arg0: index, %arg1: index):
      %3 = arith.muli %arg0, %c5 : index
      %4 = arith.addi %3, %arg1 : index
      %5 = arith.index_cast %4 : index to i32
      %6 = arith.sitofp %5 : i32 to f64
      tensor.yield %6 : f64
    } : tensor<?x?xf64>
    %generated_2 = tensor.generate %dim_1, %c5 {
    ^bb0(%arg0: index, %arg1: index):
      %3 = arith.muli %arg0, %c5 : index
      %4 = arith.addi %3, %arg1 : index
      %5 = arith.index_cast %4 : index to i32
      %6 = arith.sitofp %5 : i32 to f64
      tensor.yield %6 : f64
    } : tensor<?x?xf64>
    %generated_3 = tensor.generate %dim, %c5 {
    ^bb0(%arg0: index, %arg1: index):
      tensor.yield %cst : f64
    } : tensor<?x?xf64>
    %2 = call @kernel_mttkrp(%1, %generated, %generated_2, %generated_3) : (tensor<?x?x?xf64, #sparse>, tensor<?x?xf64>, tensor<?x?xf64>, tensor<?x?xf64>) -> tensor<?x?xf64>
    %cast = tensor.cast %2 : tensor<?x?xf64> to tensor<*xf64>
    call @printMemrefF64(%cast) : (tensor<*xf64>) -> ()
    bufferization.dealloc_tensor %1 : tensor<?x?x?xf64, #sparse>
    bufferization.dealloc_tensor %generated : tensor<?x?xf64>
    bufferization.dealloc_tensor %generated_2 : tensor<?x?xf64>
    bufferization.dealloc_tensor %generated_3 : tensor<?x?xf64>
    return
  }
}

