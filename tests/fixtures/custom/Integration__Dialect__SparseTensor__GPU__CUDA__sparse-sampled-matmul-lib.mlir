#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
module {
  llvm.func @mgpuCreateSparseEnv()
  llvm.func @mgpuDestroySparseEnv()
  func.func @sampled_dense_dense(%arg0: tensor<?x?xf32, #sparse>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32, #sparse> {
    %0 = linalg.generic {doc = "S(i,j) += spy[S(i,j)] x SUM_k A(i,k) B(k,j)", indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg1, %arg2 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg0 : tensor<?x?xf32, #sparse>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %cst = arith.constant 0.000000e+00 : f32
      %1 = sparse_tensor.unary %out : f32 to f32
       present = {
      ^bb0(%arg3: f32):
        %3 = arith.mulf %in, %in_0 : f32
        sparse_tensor.yield %3 : f32
      }
       absent = {
      }
      %2 = sparse_tensor.reduce %out, %1, %cst : f32 {
      ^bb0(%arg3: f32, %arg4: f32):
        %3 = arith.addf %arg3, %arg4 : f32
        sparse_tensor.yield %3 : f32
      }
      linalg.yield %2 : f32
    } -> tensor<?x?xf32, #sparse>
    return %0 : tensor<?x?xf32, #sparse>
  }
  func.func private @getTensorFilename(index) -> !llvm.ptr
  func.func @main() {
    llvm.call @mgpuCreateSparseEnv() : () -> ()
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c5 = arith.constant 5 : index
    %c10 = arith.constant 10 : index
    %generated = tensor.generate %c5, %c10 {
    ^bb0(%arg0: index, %arg1: index):
      %5 = arith.addi %arg0, %c1 : index
      %6 = arith.index_cast %5 : index to i32
      %7 = arith.sitofp %6 : i32 to f32
      tensor.yield %7 : f32
    } : tensor<?x?xf32>
    %generated_0 = tensor.generate %c10, %c5 {
    ^bb0(%arg0: index, %arg1: index):
      %5 = arith.addi %arg1, %c1 : index
      %6 = arith.index_cast %5 : index to i32
      %7 = arith.sitofp %6 : i32 to f32
      tensor.yield %7 : f32
    } : tensor<?x?xf32>
    %0 = call @getTensorFilename(%c0) : (index) -> !llvm.ptr
    %1 = sparse_tensor.new %0 : !llvm.ptr to tensor<?x?xf32, #sparse>
    %2 = call @sampled_dense_dense(%1, %generated, %generated_0) : (tensor<?x?xf32, #sparse>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32, #sparse>
    sparse_tensor.print %2 : tensor<?x?xf32, #sparse>
    %cst_1 = arith.constant sparse<[[0, 0], [0, 1], [1, 0], [3, 4], [7, 7]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00]> : tensor<8x8xf32>
    %3 = sparse_tensor.convert %cst_1 : tensor<8x8xf32> to tensor<?x?xf32, #sparse>
    %cst_2 = arith.constant dense<2.000000e+00> : tensor<8x8xf32>
    %cst_3 = arith.constant dense<1.000000e+00> : tensor<8x8xf32>
    %cast = tensor.cast %cst_2 : tensor<8x8xf32> to tensor<?x?xf32>
    %cast_4 = tensor.cast %cst_3 : tensor<8x8xf32> to tensor<?x?xf32>
    %4 = call @sampled_dense_dense(%3, %cast, %cast_4) : (tensor<?x?xf32, #sparse>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32, #sparse>
    sparse_tensor.print %4 : tensor<?x?xf32, #sparse>
    bufferization.dealloc_tensor %2 : tensor<?x?xf32, #sparse>
    bufferization.dealloc_tensor %4 : tensor<?x?xf32, #sparse>
    llvm.call @mgpuDestroySparseEnv() : () -> ()
    return
  }
}

