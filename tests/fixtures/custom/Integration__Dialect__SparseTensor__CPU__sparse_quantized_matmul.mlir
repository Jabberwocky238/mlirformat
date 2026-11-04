#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
module {
  func.func @quantized_matmul(%arg0: tensor<5x3xi8>, %arg1: tensor<3x6xi8, #sparse>, %arg2: tensor<5x6xi32>) -> tensor<5x6xi32> {
    %c0_i32 = arith.constant 0 : i32
    %c2_i32 = arith.constant 2 : i32
    %0 = linalg.quantized_matmul ins(%arg0, %arg1, %c2_i32, %c0_i32 : tensor<5x3xi8>, tensor<3x6xi8, #sparse>, i32, i32) outs(%arg2 : tensor<5x6xi32>) -> tensor<5x6xi32>
    return %0 : tensor<5x6xi32>
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c0_i32 = arith.constant 0 : i32
    %cst = arith.constant dense<[[-128, 3, 127], [0, 0, 0], [11, 1, 0], [0, 5, -1], [13, 0, 3]]> : tensor<5x3xi8>
    %cst_0 = arith.constant dense<[[127, 0, -128, 0, 0, 3], [0, 0, 0, 0, 0, 0], [0, 0, 0, 100, 10, 0]]> : tensor<3x6xi8>
    %0 = sparse_tensor.convert %cst_0 : tensor<3x6xi8> to tensor<3x6xi8, #sparse>
    %cst_1 = arith.constant dense<0> : tensor<5x6xi32>
    %1 = call @quantized_matmul(%cst, %0, %cst_1) : (tensor<5x3xi8>, tensor<3x6xi8, #sparse>, tensor<5x6xi32>) -> tensor<5x6xi32>
    %2 = vector.transfer_read %1[%c0, %c0], %c0_i32 : tensor<5x6xi32>, vector<5x6xi32>
    vector.print %2 : vector<5x6xi32>
    bufferization.dealloc_tensor %0 : tensor<3x6xi8, #sparse>
    bufferization.dealloc_tensor %1 : tensor<5x6xi32>
    return
  }
}

