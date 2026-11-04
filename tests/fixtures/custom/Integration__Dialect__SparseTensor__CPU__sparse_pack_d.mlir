#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed), posWidth = 64, crdWidth = 32 }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : dense, d2 : compressed), posWidth = 64, crdWidth = 32 }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : compressed, d2 : dense), posWidth = 64, crdWidth = 32 }>
module {
  func.func @main() {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant dense<[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00]> : tensor<8xf32>
    %cst_1 = arith.constant dense<[0, 3]> : tensor<2xi64>
    %cst_2 = arith.constant dense<[0, 2, 3]> : tensor<3xi32>
    %cst_3 = arith.constant dense<[0, 2, 4, 5]> : tensor<4xi64>
    %cst_4 = arith.constant dense<[0, 1, 1, 2, 1]> : tensor<5xi32>
    %cst_5 = arith.constant dense<[0, 2, 4, 5, 7, 8]> : tensor<6xi64>
    %cst_6 = arith.constant dense<[0, 1, 0, 1, 0, 0, 1, 0]> : tensor<8xi32>
    %0 = sparse_tensor.assemble (%cst_1, %cst_2, %cst_3, %cst_4, %cst_5, %cst_6), %cst_0 : (tensor<2xi64>, tensor<3xi32>, tensor<4xi64>, tensor<5xi32>, tensor<6xi64>, tensor<8xi32>), tensor<8xf32> to tensor<4x3x2xf32, #sparse>
    %cst_7 = arith.constant dense<[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00, 9.000000e+00, 1.000000e+01, 1.100000e+01, 1.200000e+01, 1.300000e+01, 1.400000e+01, 1.500000e+01, 1.600000e+01]> : tensor<16xf32>
    %cst_8 = arith.constant dense<[0, 2, 3, 4, 6, 6, 7, 9, 11, 13, 14, 15, 16]> : tensor<13xi64>
    %cst_9 = arith.constant dense<[0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1]> : tensor<16xi32>
    %1 = sparse_tensor.assemble (%cst_8, %cst_9), %cst_7 : (tensor<13xi64>, tensor<16xi32>), tensor<16xf32> to tensor<4x3x2xf32, #sparse1>
    %cst_10 = arith.constant dense<[1.000000e+00, 2.000000e+00, 0.000000e+00, 3.000000e+00, 4.000000e+00, 0.000000e+00, 5.000000e+00, 6.000000e+00, 0.000000e+00, 7.000000e+00, 8.000000e+00, 9.000000e+00, 1.000000e+01, 1.100000e+01, 1.200000e+01, 1.300000e+01, 1.400000e+01, 0.000000e+00, 0.000000e+00, 1.500000e+01, 0.000000e+00, 1.600000e+01]> : tensor<22xf32>
    %cst_11 = arith.constant dense<[0, 3, 5, 8, 11]> : tensor<5xi64>
    %cst_12 = arith.constant dense<[0, 1, 2, 0, 2, 0, 1, 2, 0, 1, 2]> : tensor<11xi32>
    %2 = sparse_tensor.assemble (%cst_11, %cst_12), %cst_10 : (tensor<5xi64>, tensor<11xi32>), tensor<22xf32> to tensor<4x3x2xf32, #sparse2>
    sparse_tensor.print %0 : tensor<4x3x2xf32, #sparse>
    sparse_tensor.print %1 : tensor<4x3x2xf32, #sparse1>
    sparse_tensor.print %2 : tensor<4x3x2xf32, #sparse2>
    %3 = sparse_tensor.has_runtime_library
    scf.if %3 {
      bufferization.dealloc_tensor %0 : tensor<4x3x2xf32, #sparse>
      bufferization.dealloc_tensor %1 : tensor<4x3x2xf32, #sparse1>
      bufferization.dealloc_tensor %2 : tensor<4x3x2xf32, #sparse2>
    }
    return
  }
}

