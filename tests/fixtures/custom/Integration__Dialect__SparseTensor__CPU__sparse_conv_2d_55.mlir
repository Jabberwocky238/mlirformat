#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
module {
  func.func @conv2d(%arg0: tensor<10x10xi32>, %arg1: tensor<5x5xi32>, %arg2: tensor<6x6xi32>) -> tensor<6x6xi32> {
    %0 = linalg.conv_2d ins(%arg0, %arg1 : tensor<10x10xi32>, tensor<5x5xi32>) outs(%arg2 : tensor<6x6xi32>) -> tensor<6x6xi32>
    return %0 : tensor<6x6xi32>
  }
  func.func @conv2d_ss(%arg0: tensor<10x10xi32, #sparse>, %arg1: tensor<5x5xi32, #sparse>, %arg2: tensor<6x6xi32>) -> tensor<6x6xi32> {
    %0 = linalg.conv_2d ins(%arg0, %arg1 : tensor<10x10xi32, #sparse>, tensor<5x5xi32, #sparse>) outs(%arg2 : tensor<6x6xi32>) -> tensor<6x6xi32>
    return %0 : tensor<6x6xi32>
  }
  func.func @conv2d_bs(%arg0: tensor<10x10xi32, #sparse1>, %arg1: tensor<5x5xi32, #sparse>, %arg2: tensor<6x6xi32>) -> tensor<6x6xi32> {
    %0 = linalg.conv_2d ins(%arg0, %arg1 : tensor<10x10xi32, #sparse1>, tensor<5x5xi32, #sparse>) outs(%arg2 : tensor<6x6xi32>) -> tensor<6x6xi32>
    return %0 : tensor<6x6xi32>
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c0_i32 = arith.constant 0 : i32
    %cst = arith.constant dense<[[-1, -2, -3, -4, -5], [-6, -7, -8, -9, -10], [-11, -12, -13, -14, -15], [-16, -17, -18, -19, -20], [-21, -22, -23, -24, -25]]> : tensor<5x5xi32>
    %cst_0 = arith.constant dense<[[0, 1, 2, 3, 4, 5, 6, 7, 8, 9], [10, 11, 12, 13, 14, 15, 16, 17, 18, 19], [20, 21, 22, 23, 24, 25, 26, 27, 28, 29], [30, 31, 32, 33, 34, 35, 36, 37, 38, 39], [40, 41, 42, 43, 44, 45, 46, 47, 48, 49], [50, 51, 52, 53, 54, 55, 56, 57, 58, 59], [60, 61, 62, 63, 64, 65, 66, 67, 68, 69], [70, 71, 72, 73, 74, 75, 76, 77, 78, 79], [80, 81, 82, 83, 84, 85, 86, 87, 88, 89], [90, 91, 92, 93, 94, 95, 96, 97, 98, 99]]> : tensor<10x10xi32>
    %cst_1 = arith.constant dense<[[0, -1, 0, -2, 0], [0, 0, 0, 0, 0], [0, 0, 8, 0, 0], [-3, 0, 0, -4, 0], [0, 0, -5, 0, -6]]> : tensor<5x5xi32>
    %cst_2 = arith.constant dense<[[0, 1, 2, 3, 0, 0, 0, 0, 0, 0], [0, 4, 0, 0, 5, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 6, 0, 0, 7], [0, 0, 0, 0, 0, 0, 0, 8, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 9, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 10, 0, 0, 0, 0, 0]]> : tensor<10x10xi32>
    %0 = sparse_tensor.convert %cst_0 : tensor<10x10xi32> to tensor<10x10xi32, #sparse>
    %1 = sparse_tensor.convert %cst_0 : tensor<10x10xi32> to tensor<10x10xi32, #sparse1>
    %2 = sparse_tensor.convert %cst : tensor<5x5xi32> to tensor<5x5xi32, #sparse>
    %3 = sparse_tensor.convert %cst_2 : tensor<10x10xi32> to tensor<10x10xi32, #sparse>
    %4 = sparse_tensor.convert %cst_2 : tensor<10x10xi32> to tensor<10x10xi32, #sparse1>
    %5 = sparse_tensor.convert %cst_1 : tensor<5x5xi32> to tensor<5x5xi32, #sparse>
    %cst_3 = arith.constant dense<0> : tensor<6x6xi32>
    %6 = call @conv2d(%cst_0, %cst, %cst_3) : (tensor<10x10xi32>, tensor<5x5xi32>, tensor<6x6xi32>) -> tensor<6x6xi32>
    %cst_4 = arith.constant dense<0> : tensor<6x6xi32>
    %7 = call @conv2d_ss(%0, %2, %cst_4) : (tensor<10x10xi32, #sparse>, tensor<5x5xi32, #sparse>, tensor<6x6xi32>) -> tensor<6x6xi32>
    %cst_5 = arith.constant dense<0> : tensor<6x6xi32>
    %8 = call @conv2d_bs(%1, %2, %cst_5) : (tensor<10x10xi32, #sparse1>, tensor<5x5xi32, #sparse>, tensor<6x6xi32>) -> tensor<6x6xi32>
    %cst_6 = arith.constant dense<0> : tensor<6x6xi32>
    %9 = call @conv2d(%cst_2, %cst_1, %cst_6) : (tensor<10x10xi32>, tensor<5x5xi32>, tensor<6x6xi32>) -> tensor<6x6xi32>
    %cst_7 = arith.constant dense<0> : tensor<6x6xi32>
    %10 = call @conv2d_ss(%3, %5, %cst_7) : (tensor<10x10xi32, #sparse>, tensor<5x5xi32, #sparse>, tensor<6x6xi32>) -> tensor<6x6xi32>
    %cst_8 = arith.constant dense<0> : tensor<6x6xi32>
    %11 = call @conv2d_bs(%4, %5, %cst_8) : (tensor<10x10xi32, #sparse1>, tensor<5x5xi32, #sparse>, tensor<6x6xi32>) -> tensor<6x6xi32>
    %12 = vector.transfer_read %6[%c0, %c0], %c0_i32 : tensor<6x6xi32>, vector<6x6xi32>
    vector.print %12 : vector<6x6xi32>
    %13 = vector.transfer_read %7[%c0, %c0], %c0_i32 : tensor<6x6xi32>, vector<6x6xi32>
    vector.print %13 : vector<6x6xi32>
    %14 = vector.transfer_read %8[%c0, %c0], %c0_i32 : tensor<6x6xi32>, vector<6x6xi32>
    vector.print %14 : vector<6x6xi32>
    %15 = vector.transfer_read %9[%c0, %c0], %c0_i32 : tensor<6x6xi32>, vector<6x6xi32>
    vector.print %15 : vector<6x6xi32>
    %16 = vector.transfer_read %10[%c0, %c0], %c0_i32 : tensor<6x6xi32>, vector<6x6xi32>
    vector.print %16 : vector<6x6xi32>
    %17 = vector.transfer_read %11[%c0, %c0], %c0_i32 : tensor<6x6xi32>, vector<6x6xi32>
    vector.print %17 : vector<6x6xi32>
    bufferization.dealloc_tensor %0 : tensor<10x10xi32, #sparse>
    bufferization.dealloc_tensor %1 : tensor<10x10xi32, #sparse1>
    bufferization.dealloc_tensor %2 : tensor<5x5xi32, #sparse>
    bufferization.dealloc_tensor %3 : tensor<10x10xi32, #sparse>
    bufferization.dealloc_tensor %4 : tensor<10x10xi32, #sparse1>
    bufferization.dealloc_tensor %5 : tensor<5x5xi32, #sparse>
    bufferization.dealloc_tensor %6 : tensor<6x6xi32>
    bufferization.dealloc_tensor %7 : tensor<6x6xi32>
    bufferization.dealloc_tensor %8 : tensor<6x6xi32>
    bufferization.dealloc_tensor %9 : tensor<6x6xi32>
    bufferization.dealloc_tensor %10 : tensor<6x6xi32>
    bufferization.dealloc_tensor %11 : tensor<6x6xi32>
    return
  }
}

