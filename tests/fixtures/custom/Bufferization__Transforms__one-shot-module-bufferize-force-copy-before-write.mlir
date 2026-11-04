module {
  func.func @foo(%arg0: tensor<?xf32>) -> tensor<?xf32> {
    %cst = arith.constant 1.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %inserted = tensor.insert %cst into %arg0[%c0] : tensor<?xf32>
    return %inserted : tensor<?xf32>
  }
  func.func @contains_to_buffer_op(%arg0: tensor<?xf32> {bufferization.writable = true}, %arg1: index) -> vector<5xf32> {
    %0 = bufferization.to_buffer %arg0 : tensor<?xf32> to memref<?xf32>
    %cst = arith.constant 0.000000e+00 : f32
    %1 = vector.transfer_read %0[%arg1], %cst : memref<?xf32>, vector<5xf32>
    return %1 : vector<5xf32>
  }
}

