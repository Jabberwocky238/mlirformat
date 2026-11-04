#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : dense, d2 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : compressed, d2 : compressed) }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : dense, d2 : compressed) }>
module {
  func.func @alloc_3d_filled_f32(%arg0: index, %arg1: index, %arg2: index, %arg3: f32) -> tensor<?x?x?xf32> {
    %0 = tensor.empty(%arg0, %arg1, %arg2) : tensor<?x?x?xf32>
    %1 = linalg.fill ins(%arg3 : f32) outs(%0 : tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    return %1 : tensor<?x?x?xf32>
  }
  func.func @conv_3d(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?x?x?xf32>, %arg2: tensor<?x?x?xf32>) -> tensor<?x?x?xf32> {
    %0 = linalg.conv_3d ins(%arg0, %arg1 : tensor<?x?x?xf32>, tensor<?x?x?xf32>) outs(%arg2 : tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    return %0 : tensor<?x?x?xf32>
  }
  func.func @conv_3d_CCC(%arg0: tensor<?x?x?xf32, #sparse>, %arg1: tensor<?x?x?xf32>) -> tensor<?x?x?xf32, #sparse> {
    %c6 = arith.constant 6 : index
    %0 = tensor.empty(%c6, %c6, %c6) : tensor<?x?x?xf32, #sparse>
    %1 = linalg.conv_3d ins(%arg0, %arg1 : tensor<?x?x?xf32, #sparse>, tensor<?x?x?xf32>) outs(%0 : tensor<?x?x?xf32, #sparse>) -> tensor<?x?x?xf32, #sparse>
    return %1 : tensor<?x?x?xf32, #sparse>
  }
  func.func @conv_3d_CDC(%arg0: tensor<?x?x?xf32, #sparse1>, %arg1: tensor<?x?x?xf32>) -> tensor<?x?x?xf32, #sparse1> {
    %c6 = arith.constant 6 : index
    %0 = tensor.empty(%c6, %c6, %c6) : tensor<?x?x?xf32, #sparse1>
    %1 = linalg.conv_3d ins(%arg0, %arg1 : tensor<?x?x?xf32, #sparse1>, tensor<?x?x?xf32>) outs(%0 : tensor<?x?x?xf32, #sparse1>) -> tensor<?x?x?xf32, #sparse1>
    return %1 : tensor<?x?x?xf32, #sparse1>
  }
  func.func @conv_3d_DCC(%arg0: tensor<?x?x?xf32, #sparse2>, %arg1: tensor<?x?x?xf32>) -> tensor<?x?x?xf32, #sparse2> {
    %c6 = arith.constant 6 : index
    %0 = tensor.empty(%c6, %c6, %c6) : tensor<?x?x?xf32, #sparse2>
    %1 = linalg.conv_3d ins(%arg0, %arg1 : tensor<?x?x?xf32, #sparse2>, tensor<?x?x?xf32>) outs(%0 : tensor<?x?x?xf32, #sparse2>) -> tensor<?x?x?xf32, #sparse2>
    return %1 : tensor<?x?x?xf32, #sparse2>
  }
  func.func @conv_3d_DDC(%arg0: tensor<?x?x?xf32, #sparse3>, %arg1: tensor<?x?x?xf32>) -> tensor<?x?x?xf32, #sparse3> {
    %c6 = arith.constant 6 : index
    %0 = tensor.empty(%c6, %c6, %c6) : tensor<?x?x?xf32, #sparse3>
    %1 = linalg.conv_3d ins(%arg0, %arg1 : tensor<?x?x?xf32, #sparse3>, tensor<?x?x?xf32>) outs(%0 : tensor<?x?x?xf32, #sparse3>) -> tensor<?x?x?xf32, #sparse3>
    return %1 : tensor<?x?x?xf32, #sparse3>
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %c6 = arith.constant 6 : index
    %c8 = arith.constant 8 : index
    %cst = arith.constant 1.000000e+01 : f32
    %cst_0 = arith.constant 2.000000e+00 : f32
    %cst_1 = arith.constant 0.000000e+00 : f32
    %0 = call @alloc_3d_filled_f32(%c3, %c3, %c3, %cst_0) : (index, index, index, f32) -> tensor<?x?x?xf32>
    %1 = call @alloc_3d_filled_f32(%c8, %c8, %c8, %cst_0) : (index, index, index, f32) -> tensor<?x?x?xf32>
    %inserted = tensor.insert %cst into %1[%c0, %c3, %c0] : tensor<?x?x?xf32>
    %2 = call @alloc_3d_filled_f32(%c6, %c6, %c6, %cst_1) : (index, index, index, f32) -> tensor<?x?x?xf32>
    %3 = sparse_tensor.convert %inserted : tensor<?x?x?xf32> to tensor<?x?x?xf32, #sparse>
    %4 = sparse_tensor.convert %inserted : tensor<?x?x?xf32> to tensor<?x?x?xf32, #sparse1>
    %5 = sparse_tensor.convert %inserted : tensor<?x?x?xf32> to tensor<?x?x?xf32, #sparse2>
    %6 = sparse_tensor.convert %inserted : tensor<?x?x?xf32> to tensor<?x?x?xf32, #sparse3>
    %7 = call @conv_3d(%inserted, %0, %2) : (tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    %8 = call @conv_3d_CCC(%3, %0) : (tensor<?x?x?xf32, #sparse>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32, #sparse>
    %9 = call @conv_3d_CDC(%4, %0) : (tensor<?x?x?xf32, #sparse1>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32, #sparse1>
    %10 = call @conv_3d_DCC(%5, %0) : (tensor<?x?x?xf32, #sparse2>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32, #sparse2>
    %11 = call @conv_3d_DDC(%6, %0) : (tensor<?x?x?xf32, #sparse3>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32, #sparse3>
    %12 = vector.transfer_read %7[%c0, %c0, %c0], %cst_1 : tensor<?x?x?xf32>, vector<6x6x6xf32>
    vector.print %12 : vector<6x6x6xf32>
    sparse_tensor.print %8 : tensor<?x?x?xf32, #sparse>
    sparse_tensor.print %9 : tensor<?x?x?xf32, #sparse1>
    sparse_tensor.print %11 : tensor<?x?x?xf32, #sparse3>
    sparse_tensor.print %10 : tensor<?x?x?xf32, #sparse2>
    bufferization.dealloc_tensor %inserted : tensor<?x?x?xf32>
    bufferization.dealloc_tensor %0 : tensor<?x?x?xf32>
    bufferization.dealloc_tensor %2 : tensor<?x?x?xf32>
    bufferization.dealloc_tensor %4 : tensor<?x?x?xf32, #sparse1>
    bufferization.dealloc_tensor %3 : tensor<?x?x?xf32, #sparse>
    bufferization.dealloc_tensor %6 : tensor<?x?x?xf32, #sparse3>
    bufferization.dealloc_tensor %5 : tensor<?x?x?xf32, #sparse2>
    bufferization.dealloc_tensor %8 : tensor<?x?x?xf32, #sparse>
    bufferization.dealloc_tensor %9 : tensor<?x?x?xf32, #sparse1>
    bufferization.dealloc_tensor %11 : tensor<?x?x?xf32, #sparse3>
    bufferization.dealloc_tensor %10 : tensor<?x?x?xf32, #sparse2>
    return
  }
}

