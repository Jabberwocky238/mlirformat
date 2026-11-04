module {
  func.func @buffer_not_deallocated(%arg0: tensor<?xf32>, %arg1: i1) -> tensor<?xf32> {
    %0 = scf.if %arg1 -> (tensor<?xf32>) {
      %1 = "test.some_op"() : () -> index
      %2 = bufferization.alloc_tensor(%1) : tensor<?xf32>
      scf.yield %2 : tensor<?xf32>
    } else {
      scf.yield %arg0 : tensor<?xf32>
    }
    return %0 : tensor<?xf32>
  }
}

// -----
module {
  func.func @write_to_alloc_tensor_or_readonly_tensor(%arg0: tensor<i32>, %arg1: i1, %arg2: i32) -> tensor<i32> {
    %0 = scf.if %arg1 -> (tensor<i32>) {
      scf.yield %arg0 : tensor<i32>
    } else {
      %1 = bufferization.alloc_tensor() : tensor<i32>
      %inserted = tensor.insert %arg2 into %1[] : tensor<i32>
      scf.yield %inserted : tensor<i32>
    }
    return %0 : tensor<i32>
  }
}

