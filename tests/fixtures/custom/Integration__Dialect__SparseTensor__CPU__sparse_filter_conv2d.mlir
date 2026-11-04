#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
module {
  func.func @conv2d(%arg0: tensor<8x8xi32>, %arg1: tensor<3x3xi32, #sparse>, %arg2: tensor<6x6xi32>) -> tensor<6x6xi32> {
    %0 = linalg.conv_2d ins(%arg0, %arg1 : tensor<8x8xi32>, tensor<3x3xi32, #sparse>) outs(%arg2 : tensor<6x6xi32>) -> tensor<6x6xi32>
    return %0 : tensor<6x6xi32>
  }
  func.func @conv2d_sparse_out(%arg0: tensor<8x8xi32>, %arg1: tensor<3x3xi32, #sparse>) -> tensor<6x6xi32, #sparse> {
    %0 = tensor.empty() : tensor<6x6xi32, #sparse>
    %1 = linalg.conv_2d ins(%arg0, %arg1 : tensor<8x8xi32>, tensor<3x3xi32, #sparse>) outs(%0 : tensor<6x6xi32, #sparse>) -> tensor<6x6xi32, #sparse>
    return %1 : tensor<6x6xi32, #sparse>
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c0_i32 = arith.constant 0 : i32
    %cst = arith.constant dense<[[1, 0, -1], [0, 0, 0], [-1, 0, 1]]> : tensor<3x3xi32>
    %0 = sparse_tensor.convert %cst : tensor<3x3xi32> to tensor<3x3xi32, #sparse>
    %cst_0 = arith.constant dense<[[1, 2, 3, 4, 0, 6, 7, 8], [2, 2, 4, 4, 0, 0, 6, 8], [2, 2, 4, 4, 0, 0, 6, 8], [2, 2, 3, 4, 0, 0, 7, 8], [1, 3, 3, 4, 0, 0, 6, 8], [3, 2, 3, 4, 0, 0, 7, 8], [1, 3, 3, 4, 3, 6, 6, 8], [1, 3, 3, 4, 3, 0, 7, 8]]> : tensor<8x8xi32>
    %cst_1 = arith.constant dense<0> : tensor<6x6xi32>
    %1 = call @conv2d(%cst_0, %0, %cst_1) : (tensor<8x8xi32>, tensor<3x3xi32, #sparse>, tensor<6x6xi32>) -> tensor<6x6xi32>
    %2 = call @conv2d_sparse_out(%cst_0, %0) : (tensor<8x8xi32>, tensor<3x3xi32, #sparse>) -> tensor<6x6xi32, #sparse>
    %3 = vector.transfer_read %1[%c0, %c0], %c0_i32 : tensor<6x6xi32>, vector<6x6xi32>
    vector.print %3 : vector<6x6xi32>
    sparse_tensor.print %2 : tensor<6x6xi32, #sparse>
    bufferization.dealloc_tensor %0 : tensor<3x3xi32, #sparse>
    bufferization.dealloc_tensor %1 : tensor<6x6xi32>
    bufferization.dealloc_tensor %2 : tensor<6x6xi32, #sparse>
    return
  }
}

