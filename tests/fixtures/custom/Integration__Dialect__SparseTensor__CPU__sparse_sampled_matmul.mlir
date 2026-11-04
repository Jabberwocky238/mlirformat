#map = affine_map<(d0, d1, d2) -> (d0, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d2, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed), posWidth = 32, crdWidth = 32 }>
module {
  func.func @sampled_dense_dense(%arg0: tensor<?x?xf32, #sparse>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>, %arg3: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.generic {doc = "X(i,j) += S(i,j) SUM_k A(i,k) B(k,j)", indexing_maps = [#map, #map1, #map2, #map], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1, %arg2 : tensor<?x?xf32, #sparse>, tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg3 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %in_1: f32, %out: f32):
      %1 = arith.mulf %in_0, %in_1 : f32
      %2 = arith.mulf %in, %1 : f32
      %3 = arith.addf %out, %2 : f32
      linalg.yield %3 : f32
    } -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
  func.func private @getTensorFilename(index) -> !llvm.ptr
  func.func @main() {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c5 = arith.constant 5 : index
    %c10 = arith.constant 10 : index
    %generated = tensor.generate %c5, %c5 {
    ^bb0(%arg0: index, %arg1: index):
      tensor.yield %cst : f32
    } : tensor<?x?xf32>
    %generated_0 = tensor.generate %c5, %c10 {
    ^bb0(%arg0: index, %arg1: index):
      %3 = arith.addi %arg0, %c1 : index
      %4 = arith.index_cast %3 : index to i32
      %5 = arith.sitofp %4 : i32 to f32
      tensor.yield %5 : f32
    } : tensor<?x?xf32>
    %generated_1 = tensor.generate %c10, %c5 {
    ^bb0(%arg0: index, %arg1: index):
      %3 = arith.addi %arg1, %c1 : index
      %4 = arith.index_cast %3 : index to i32
      %5 = arith.sitofp %4 : i32 to f32
      tensor.yield %5 : f32
    } : tensor<?x?xf32>
    %0 = call @getTensorFilename(%c0) : (index) -> !llvm.ptr
    %1 = sparse_tensor.new %0 : !llvm.ptr to tensor<?x?xf32, #sparse>
    %2 = call @sampled_dense_dense(%1, %generated_0, %generated_1, %generated) : (tensor<?x?xf32, #sparse>, tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    scf.for %arg0 = %c0 to %c5 step %c1 {
      %3 = vector.transfer_read %2[%arg0, %c0], %cst : tensor<?x?xf32>, vector<5xf32>
      vector.print %3 : vector<5xf32>
    }
    bufferization.dealloc_tensor %1 : tensor<?x?xf32, #sparse>
    bufferization.dealloc_tensor %2 : tensor<?x?xf32>
    bufferization.dealloc_tensor %generated_0 : tensor<?x?xf32>
    bufferization.dealloc_tensor %generated_1 : tensor<?x?xf32>
    return
  }
}

