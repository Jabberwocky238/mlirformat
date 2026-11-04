#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @main() {
    %cst = arith.constant 1.000000e+00 : f32
    %cst_0 = arith.constant 2.000000e+00 : f32
    %cst_1 = arith.constant 3.000000e+00 : f32
    %cst_2 = arith.constant 4.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %c8 = arith.constant 8 : index
    %c1023 = arith.constant 1023 : index
    %0 = tensor.empty() : tensor<1024xf32, #sparse>
    %inserted = tensor.insert %cst into %0[%c0] : tensor<1024xf32, #sparse>
    %inserted_3 = tensor.insert %cst_0 into %inserted[%c1] : tensor<1024xf32, #sparse>
    %inserted_4 = tensor.insert %cst_1 into %inserted_3[%c3] : tensor<1024xf32, #sparse>
    %inserted_5 = tensor.insert %cst_2 into %inserted_4[%c1023] : tensor<1024xf32, #sparse>
    %1 = sparse_tensor.load %inserted_5 hasInserts : tensor<1024xf32, #sparse>
    sparse_tensor.print %1 : tensor<1024xf32, #sparse>
    %2 = tensor.empty() : tensor<1024xf32, #sparse>
    %3 = scf.for %arg0 = %c0 to %c8 step %c1 iter_args(%arg1 = %2) -> (tensor<1024xf32, #sparse>) {
      %5 = arith.muli %arg0, %c3 : index
      %inserted_6 = tensor.insert %cst into %arg1[%5] : tensor<1024xf32, #sparse>
      scf.yield %inserted_6 : tensor<1024xf32, #sparse>
    }
    %4 = sparse_tensor.load %3 hasInserts : tensor<1024xf32, #sparse>
    sparse_tensor.print %4 : tensor<1024xf32, #sparse>
    bufferization.dealloc_tensor %1 : tensor<1024xf32, #sparse>
    bufferization.dealloc_tensor %4 : tensor<1024xf32, #sparse>
    return
  }
}

