module {
  func.func @no_conflict(%arg0: f32, %arg1: f32, %arg2: index) -> tensor<3xf32> {
    %from_elements = tensor.from_elements %arg0, %arg0, %arg0 : tensor<3xf32>
    %inserted = tensor.insert %arg1 into %from_elements[%arg2] : tensor<3xf32>
    return %inserted : tensor<3xf32>
  }
}

// -----
module {
  func.func @use_tensor_func_arg(%arg0: tensor<?xf32>) -> vector<4xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c0], %cst : tensor<?xf32>, vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @return_tensor(%arg0: tensor<?xf32>, %arg1: vector<4xf32>) -> tensor<?xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_write %arg1, %arg0[%c0] : vector<4xf32>, tensor<?xf32>
    return %0 : tensor<?xf32>
  }
}

// -----
module {
  func.func @func_without_tensor_args(%arg0: vector<10xf32>) {
    %0 = bufferization.alloc_tensor() : tensor<10xf32>
    %c0 = arith.constant 0 : index
    %1 = vector.transfer_write %arg0, %0[%c0] : vector<10xf32>, tensor<10xf32>
    %cst = arith.constant 0.000000e+00 : f32
    %2 = vector.transfer_read %1[%c0], %cst : tensor<10xf32>, vector<11xf32>
    vector.print %2 : vector<11xf32>
    return
  }
}

// -----
module {
  func.func private @private_func(tensor<?xf32>)
  func.func @empty_func() {
    return
  }
}

// -----
module {
  func.func @read_after_write_conflict(%arg0: f32, %arg1: index, %arg2: index) -> (f32, f32) {
    %0 = "test.dummy_op"() : () -> tensor<10xf32>
    %inserted = tensor.insert %arg0 into %0[%arg2] : tensor<10xf32>
    %1 = "test.some_use"(%0) : (tensor<10xf32>) -> f32
    %extracted = tensor.extract %inserted[%arg1] : tensor<10xf32>
    return %1, %extracted : f32, f32
  }
}

// -----
module {
  func.func @copy_deallocated() -> tensor<10xf32> {
    %0 = bufferization.alloc_tensor() : tensor<10xf32>
    return %0 : tensor<10xf32>
  }
}

// -----
module {
  func.func @select_different_tensors(%arg0: tensor<?xf32>, %arg1: index, %arg2: index, %arg3: i1) -> f32 {
    %0 = bufferization.alloc_tensor(%arg1) : tensor<?xf32>
    %1 = arith.select %arg3, %0, %arg0 : tensor<?xf32>
    %extracted = tensor.extract %1[%arg2] : tensor<?xf32>
    return %extracted : f32
  }
}

// -----
module {
  func.func @alloc_tensor_with_copy(%arg0: tensor<5xf32>) -> tensor<5xf32> {
    %0 = bufferization.alloc_tensor() copy(%arg0) : tensor<5xf32>
    return %0 : tensor<5xf32>
  }
}

// -----
module {
  func.func @alloc_tensor_with_memory_space() -> tensor<5xf32> {
    %0 = bufferization.alloc_tensor() {memory_space = 1 : i64} : tensor<5xf32>
    return %0 : tensor<5xf32>
  }
}

// -----
module {
  func.func @read_of_alias(%arg0: tensor<100xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: f32) -> (f32, f32) {
    %inserted = tensor.insert %arg6 into %arg0[%arg1] : tensor<100xf32>
    %extracted_slice = tensor.extract_slice %arg0[%arg2] [%arg5] [1] : tensor<100xf32> to tensor<?xf32>
    %extracted = tensor.extract %extracted_slice[%arg3] : tensor<?xf32>
    %extracted_0 = tensor.extract %inserted[%arg3] : tensor<100xf32>
    return %extracted, %extracted_0 : f32, f32
  }
}

// -----
module {
  func.func @from_unranked_to_unranked(%arg0: tensor<*xi32>) -> tensor<*xi32> {
    %cast = tensor.cast %arg0 : tensor<*xi32> to tensor<*xi32>
    return %cast : tensor<*xi32>
  }
}

// -----
module {
  func.func @tensor_copy(%arg0: tensor<5xf32>) -> tensor<5xf32> {
    %0 = bufferization.alloc_tensor() : tensor<5xf32>
    %1 = bufferization.materialize_in_destination %arg0 in %0 : (tensor<5xf32>, tensor<5xf32>) -> tensor<5xf32>
    return %1 : tensor<5xf32>
  }
}

// -----
module {
  func.func @materialize_in_destination_buffer(%arg0: tensor<5xf32>, %arg1: memref<5xf32>) {
    bufferization.materialize_in_destination %arg0 in restrict writable %arg1 : (tensor<5xf32>, memref<5xf32>) -> ()
    return
  }
}

