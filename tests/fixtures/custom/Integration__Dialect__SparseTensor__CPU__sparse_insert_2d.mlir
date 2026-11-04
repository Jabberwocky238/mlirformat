#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
#sparse4 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>
module {
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %cst = arith.constant 1.000000e+00 : f64
    %cst_0 = arith.constant 2.000000e+00 : f64
    %cst_1 = arith.constant 3.000000e+00 : f64
    %cst_2 = arith.constant 4.000000e+00 : f64
    %0 = tensor.empty() : tensor<4x3xf64, #sparse>
    %inserted = tensor.insert %cst into %0[%c0, %c0] : tensor<4x3xf64, #sparse>
    %inserted_3 = tensor.insert %cst_0 into %inserted[%c2, %c2] : tensor<4x3xf64, #sparse>
    %inserted_4 = tensor.insert %cst_1 into %inserted_3[%c3, %c0] : tensor<4x3xf64, #sparse>
    %inserted_5 = tensor.insert %cst_2 into %inserted_4[%c3, %c2] : tensor<4x3xf64, #sparse>
    %1 = sparse_tensor.load %inserted_5 hasInserts : tensor<4x3xf64, #sparse>
    sparse_tensor.print %1 : tensor<4x3xf64, #sparse>
    %2 = tensor.empty() : tensor<4x3xf64, #sparse1>
    %inserted_6 = tensor.insert %cst into %2[%c0, %c0] : tensor<4x3xf64, #sparse1>
    %inserted_7 = tensor.insert %cst_0 into %inserted_6[%c2, %c2] : tensor<4x3xf64, #sparse1>
    %inserted_8 = tensor.insert %cst_1 into %inserted_7[%c3, %c0] : tensor<4x3xf64, #sparse1>
    %inserted_9 = tensor.insert %cst_2 into %inserted_8[%c3, %c2] : tensor<4x3xf64, #sparse1>
    %3 = sparse_tensor.load %inserted_9 hasInserts : tensor<4x3xf64, #sparse1>
    sparse_tensor.print %3 : tensor<4x3xf64, #sparse1>
    %4 = tensor.empty() : tensor<4x3xf64, #sparse2>
    %inserted_10 = tensor.insert %cst into %4[%c0, %c0] : tensor<4x3xf64, #sparse2>
    %inserted_11 = tensor.insert %cst_0 into %inserted_10[%c2, %c2] : tensor<4x3xf64, #sparse2>
    %inserted_12 = tensor.insert %cst_1 into %inserted_11[%c3, %c0] : tensor<4x3xf64, #sparse2>
    %inserted_13 = tensor.insert %cst_2 into %inserted_12[%c3, %c2] : tensor<4x3xf64, #sparse2>
    %5 = sparse_tensor.load %inserted_13 hasInserts : tensor<4x3xf64, #sparse2>
    sparse_tensor.print %5 : tensor<4x3xf64, #sparse2>
    %6 = tensor.empty() : tensor<4x3xf64, #sparse3>
    %inserted_14 = tensor.insert %cst into %6[%c0, %c0] : tensor<4x3xf64, #sparse3>
    %inserted_15 = tensor.insert %cst_0 into %inserted_14[%c2, %c2] : tensor<4x3xf64, #sparse3>
    %inserted_16 = tensor.insert %cst_1 into %inserted_15[%c3, %c0] : tensor<4x3xf64, #sparse3>
    %inserted_17 = tensor.insert %cst_2 into %inserted_16[%c3, %c2] : tensor<4x3xf64, #sparse3>
    %7 = sparse_tensor.load %inserted_17 hasInserts : tensor<4x3xf64, #sparse3>
    sparse_tensor.print %7 : tensor<4x3xf64, #sparse3>
    %8 = tensor.empty() : tensor<4x3xf64, #sparse4>
    %inserted_18 = tensor.insert %cst into %8[%c0, %c0] : tensor<4x3xf64, #sparse4>
    %inserted_19 = tensor.insert %cst_0 into %inserted_18[%c2, %c2] : tensor<4x3xf64, #sparse4>
    %inserted_20 = tensor.insert %cst_1 into %inserted_19[%c3, %c0] : tensor<4x3xf64, #sparse4>
    %inserted_21 = tensor.insert %cst_2 into %inserted_20[%c3, %c2] : tensor<4x3xf64, #sparse4>
    %9 = sparse_tensor.load %inserted_21 hasInserts : tensor<4x3xf64, #sparse4>
    sparse_tensor.print %9 : tensor<4x3xf64, #sparse4>
    bufferization.dealloc_tensor %1 : tensor<4x3xf64, #sparse>
    bufferization.dealloc_tensor %3 : tensor<4x3xf64, #sparse1>
    bufferization.dealloc_tensor %5 : tensor<4x3xf64, #sparse2>
    bufferization.dealloc_tensor %7 : tensor<4x3xf64, #sparse3>
    bufferization.dealloc_tensor %9 : tensor<4x3xf64, #sparse4>
    return
  }
}

