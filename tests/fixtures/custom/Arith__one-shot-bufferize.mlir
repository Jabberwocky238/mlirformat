module {
  func.func @write_to_select_op_source(%arg0: tensor<?xf32> {bufferization.writable = true}, %arg1: tensor<?xf32> {bufferization.writable = true}, %arg2: i1) -> (tensor<?xf32>, tensor<?xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %inserted = tensor.insert %cst into %arg0[%c0] : tensor<?xf32>
    %0 = arith.select %arg2, %arg0, %arg1 : tensor<?xf32>
    return %0, %inserted : tensor<?xf32>, tensor<?xf32>
  }
}

// -----
module {
  func.func @write_after_select_read_one(%arg0: tensor<?xf32> {bufferization.writable = true}, %arg1: tensor<?xf32> {bufferization.writable = true}, %arg2: i1) -> (f32, tensor<?xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %0 = arith.select %arg2, %arg0, %arg1 : tensor<?xf32>
    %inserted = tensor.insert %cst into %0[%c0] : tensor<?xf32>
    %extracted = tensor.extract %arg0[%c0] : tensor<?xf32>
    return %extracted, %inserted : f32, tensor<?xf32>
  }
}

