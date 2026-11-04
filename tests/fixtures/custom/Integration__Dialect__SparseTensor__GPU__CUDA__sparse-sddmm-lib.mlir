#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>
module {
  llvm.func @mgpuCreateSparseEnv()
  llvm.func @mgpuDestroySparseEnv()
  func.func @SDDMM(%arg0: tensor<?x?xf32, #sparse>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32, #sparse> {
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
  func.func @SDDMM_block(%arg0: tensor<?x?xf32, #sparse1>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32, #sparse1> {
    %0 = linalg.generic {doc = "S(i,j) += spy[S(i,j)] x SUM_k A(i,k) B(k,j)", indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg1, %arg2 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg0 : tensor<?x?xf32, #sparse1>) {
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
    } -> tensor<?x?xf32, #sparse1>
    return %0 : tensor<?x?xf32, #sparse1>
  }
  func.func private @getTensorFilename(index) -> !llvm.ptr
  func.func @main() {
    llvm.call @mgpuCreateSparseEnv() : () -> ()
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c6 = arith.constant 6 : index
    %generated = tensor.generate %c4, %c4 {
    ^bb0(%arg0: index, %arg1: index):
      %5 = arith.addi %arg0, %c1 : index
      %6 = arith.index_cast %5 : index to i32
      %7 = arith.sitofp %6 : i32 to f32
      tensor.yield %7 : f32
    } : tensor<?x?xf32>
    %generated_0 = tensor.generate %c4, %c6 {
    ^bb0(%arg0: index, %arg1: index):
      %5 = arith.addi %arg1, %c1 : index
      %6 = arith.index_cast %5 : index to i32
      %7 = arith.sitofp %6 : i32 to f32
      tensor.yield %7 : f32
    } : tensor<?x?xf32>
    %0 = call @getTensorFilename(%c0) : (index) -> !llvm.ptr
    %1 = sparse_tensor.new %0 : !llvm.ptr to tensor<?x?xf32, #sparse>
    %2 = sparse_tensor.new %0 : !llvm.ptr to tensor<?x?xf32, #sparse1>
    %3 = call @SDDMM(%1, %generated, %generated_0) : (tensor<?x?xf32, #sparse>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32, #sparse>
    %4 = call @SDDMM_block(%2, %generated, %generated_0) : (tensor<?x?xf32, #sparse1>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32, #sparse1>
    sparse_tensor.print %3 : tensor<?x?xf32, #sparse>
    sparse_tensor.print %4 : tensor<?x?xf32, #sparse1>
    bufferization.dealloc_tensor %3 : tensor<?x?xf32, #sparse>
    bufferization.dealloc_tensor %4 : tensor<?x?xf32, #sparse1>
    llvm.call @mgpuDestroySparseEnv() : () -> ()
    return
  }
}

