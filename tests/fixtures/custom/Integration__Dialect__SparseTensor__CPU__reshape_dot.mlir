#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed(nonunique), d1 : singleton(nonunique), d2 : singleton), posWidth = 32, crdWidth = 32 }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton), posWidth = 32, crdWidth = 32 }>
module {
  func.func private @printMemref3dF32(tensor<?x?x?xf32> {bufferization.access = "read"}) attributes {llvm.emit_c_interface}
  func.func private @printMemref2dF32(tensor<?x?xf32> {bufferization.access = "read"}) attributes {llvm.emit_c_interface}
  func.func @test_sparse_rhs(%arg0: tensor<5x6xf32>, %arg1: tensor<6x2x3xf32, #sparse>) -> tensor<?x?x?xf32> {
    %collapsed = tensor.collapse_shape %arg1 [[0], [1, 2]] : tensor<6x2x3xf32, #sparse> into tensor<6x6xf32, #sparse1>
    %0 = tensor.empty() : tensor<5x6xf32>
    %cst = arith.constant 0.000000e+00 : f32
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<5x6xf32>) -> tensor<5x6xf32>
    %2 = linalg.matmul ins(%arg0, %collapsed : tensor<5x6xf32>, tensor<6x6xf32, #sparse1>) outs(%1 : tensor<5x6xf32>) -> tensor<5x6xf32>
    %expanded = tensor.expand_shape %2 [[0], [1, 2]] output_shape [5, 2, 3] : tensor<5x6xf32> into tensor<5x2x3xf32>
    %cast = tensor.cast %expanded : tensor<5x2x3xf32> to tensor<?x?x?xf32>
    bufferization.dealloc_tensor %collapsed : tensor<6x6xf32, #sparse1>
    return %cast : tensor<?x?x?xf32>
  }
  func.func @test_sparse_all(%arg0: tensor<5x6xf32, #sparse1>, %arg1: tensor<6x2x3xf32, #sparse>) -> tensor<?x?x?xf32> {
    %collapsed = tensor.collapse_shape %arg1 [[0], [1, 2]] : tensor<6x2x3xf32, #sparse> into tensor<6x6xf32, #sparse1>
    %0 = tensor.empty() : tensor<5x6xf32>
    %cst = arith.constant 0.000000e+00 : f32
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<5x6xf32>) -> tensor<5x6xf32>
    %2 = linalg.matmul ins(%arg0, %collapsed : tensor<5x6xf32, #sparse1>, tensor<6x6xf32, #sparse1>) outs(%1 : tensor<5x6xf32>) -> tensor<5x6xf32>
    %expanded = tensor.expand_shape %2 [[0], [1, 2]] output_shape [5, 2, 3] : tensor<5x6xf32> into tensor<5x2x3xf32>
    %cast = tensor.cast %expanded : tensor<5x2x3xf32> to tensor<?x?x?xf32>
    bufferization.dealloc_tensor %collapsed : tensor<6x6xf32, #sparse1>
    return %cast : tensor<?x?x?xf32>
  }
  func.func @test_dense(%arg0: tensor<5x6xf32>, %arg1: tensor<6x2x3xf32>) -> tensor<?x?x?xf32> {
    %collapsed = tensor.collapse_shape %arg1 [[0], [1, 2]] : tensor<6x2x3xf32> into tensor<6x6xf32>
    %0 = tensor.empty() : tensor<5x6xf32>
    %cst = arith.constant 0.000000e+00 : f32
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<5x6xf32>) -> tensor<5x6xf32>
    %2 = linalg.matmul ins(%arg0, %collapsed : tensor<5x6xf32>, tensor<6x6xf32>) outs(%1 : tensor<5x6xf32>) -> tensor<5x6xf32>
    %expanded = tensor.expand_shape %2 [[0], [1, 2]] output_shape [5, 2, 3] : tensor<5x6xf32> into tensor<5x2x3xf32>
    %cast = tensor.cast %expanded : tensor<5x2x3xf32> to tensor<?x?x?xf32>
    return %cast : tensor<?x?x?xf32>
  }
  func.func @test_sparse_all_2(%arg0: tensor<5x6xf32, #sparse1>, %arg1: tensor<2x3x6xf32, #sparse>) -> tensor<?x?x?xf32> {
    %collapsed = tensor.collapse_shape %arg1 [[0, 1], [2]] : tensor<2x3x6xf32, #sparse> into tensor<6x6xf32, #sparse1>
    %0 = tensor.empty() : tensor<5x6xf32>
    %cst = arith.constant 0.000000e+00 : f32
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<5x6xf32>) -> tensor<5x6xf32>
    %2 = linalg.matmul ins(%arg0, %collapsed : tensor<5x6xf32, #sparse1>, tensor<6x6xf32, #sparse1>) outs(%1 : tensor<5x6xf32>) -> tensor<5x6xf32>
    %expanded = tensor.expand_shape %2 [[0], [1, 2]] output_shape [5, 2, 3] : tensor<5x6xf32> into tensor<5x2x3xf32>
    %cast = tensor.cast %expanded : tensor<5x2x3xf32> to tensor<?x?x?xf32>
    bufferization.dealloc_tensor %collapsed : tensor<6x6xf32, #sparse1>
    return %cast : tensor<?x?x?xf32>
  }
  func.func @main() {
    %cst = arith.constant sparse<[[0, 0], [1, 1], [2, 2], [2, 3], [4, 5]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00]> : tensor<5x6xf32>
    %cst_0 = arith.constant sparse<[[0, 0, 0], [1, 1, 1], [2, 1, 1]], [6.000000e+00, 7.000000e+00, 8.000000e+00]> : tensor<6x2x3xf32>
    %cst_1 = arith.constant dense<[2, 3, 6]> : tensor<3xi32>
    %reshape = tensor.reshape %cst_0(%cst_1) : (tensor<6x2x3xf32>, tensor<3xi32>) -> tensor<2x3x6xf32>
    %0 = sparse_tensor.convert %cst : tensor<5x6xf32> to tensor<5x6xf32, #sparse1>
    %1 = sparse_tensor.convert %cst_0 : tensor<6x2x3xf32> to tensor<6x2x3xf32, #sparse>
    %2 = sparse_tensor.convert %reshape : tensor<2x3x6xf32> to tensor<2x3x6xf32, #sparse>
    %3 = call @test_dense(%cst, %cst_0) : (tensor<5x6xf32>, tensor<6x2x3xf32>) -> tensor<?x?x?xf32>
    call @printMemref3dF32(%3) : (tensor<?x?x?xf32>) -> ()
    %4 = call @test_sparse_rhs(%cst, %1) : (tensor<5x6xf32>, tensor<6x2x3xf32, #sparse>) -> tensor<?x?x?xf32>
    call @printMemref3dF32(%4) : (tensor<?x?x?xf32>) -> ()
    %5 = call @test_sparse_all(%0, %1) : (tensor<5x6xf32, #sparse1>, tensor<6x2x3xf32, #sparse>) -> tensor<?x?x?xf32>
    call @printMemref3dF32(%5) : (tensor<?x?x?xf32>) -> ()
    %6 = call @test_sparse_all_2(%0, %2) : (tensor<5x6xf32, #sparse1>, tensor<2x3x6xf32, #sparse>) -> tensor<?x?x?xf32>
    call @printMemref3dF32(%5) : (tensor<?x?x?xf32>) -> ()
    bufferization.dealloc_tensor %0 : tensor<5x6xf32, #sparse1>
    bufferization.dealloc_tensor %1 : tensor<6x2x3xf32, #sparse>
    bufferization.dealloc_tensor %2 : tensor<2x3x6xf32, #sparse>
    bufferization.dealloc_tensor %3 : tensor<?x?x?xf32>
    bufferization.dealloc_tensor %4 : tensor<?x?x?xf32>
    bufferization.dealloc_tensor %5 : tensor<?x?x?xf32>
    bufferization.dealloc_tensor %6 : tensor<?x?x?xf32>
    return
  }
}

