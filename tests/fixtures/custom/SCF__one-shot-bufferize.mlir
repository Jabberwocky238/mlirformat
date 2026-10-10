module {
  func.func private @scf_for_yield_only(%arg0: tensor<?xf32> {bufferization.writable = false}, %arg1: tensor<?xf32> {bufferization.writable = true}, %arg2: index, %arg3: index, %arg4: index) -> (tensor<?xf32>, tensor<?xf32>) {
    %0 = scf.for %arg5 = %arg2 to %arg3 step %arg4 iter_args(%arg6 = %arg0) -> (tensor<?xf32>) {
      scf.yield %arg6 : tensor<?xf32>
    }
    %1 = scf.for %arg5 = %arg2 to %arg3 step %arg4 iter_args(%arg6 = %arg1) -> (tensor<?xf32>) {
      scf.yield %arg6 : tensor<?xf32>
    }
    return %0, %1 : tensor<?xf32>, tensor<?xf32>
  }
}

// -----
module {
  func.func @scf_for_is_reading(%arg0: tensor<?xf32>, %arg1: tensor<?xf32>, %arg2: index, %arg3: index) -> (f32, f32) {
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = scf.for %arg4 = %arg2 to %arg3 step %c1 iter_args(%arg5 = %arg0) -> (tensor<?xf32>) {
      %1 = linalg.fill ins(%cst : f32) outs(%arg5 : tensor<?xf32>) -> tensor<?xf32>
      scf.yield %arg1 : tensor<?xf32>
    }
    %extracted = tensor.extract %0[%c1] : tensor<?xf32>
    %extracted_0 = tensor.extract %arg0[%c1] : tensor<?xf32>
    return %extracted, %extracted_0 : f32, f32
  }
}

// -----
module {
  func.func @nested_scf_for(%arg0: tensor<?xf32> {bufferization.writable = true}, %arg1: vector<5xf32>) -> tensor<?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    %0 = scf.for %arg2 = %c0 to %c10 step %c1 iter_args(%arg3 = %arg0) -> (tensor<?xf32>) {
      %1 = scf.for %arg4 = %c0 to %c10 step %c1 iter_args(%arg5 = %arg3) -> (tensor<?xf32>) {
        %2 = vector.transfer_write %arg1, %arg5[%c0] : vector<5xf32>, tensor<?xf32>
        scf.yield %2 : tensor<?xf32>
      }
      scf.yield %1 : tensor<?xf32>
    }
    return %0 : tensor<?xf32>
  }
}

// -----
module {
  func.func private @scf_for_with_tensor.insert_slice(%arg0: tensor<?xf32> {bufferization.writable = false}, %arg1: tensor<?xf32> {bufferization.writable = true}, %arg2: tensor<4xf32> {bufferization.writable = false}, %arg3: index, %arg4: index, %arg5: index) -> (tensor<?xf32>, tensor<?xf32>) {
    %0:2 = scf.for %arg6 = %arg3 to %arg4 step %arg5 iter_args(%arg7 = %arg0, %arg8 = %arg1) -> (tensor<?xf32>, tensor<?xf32>) {
      %inserted_slice = tensor.insert_slice %arg2 into %arg7[0] [4] [1] : tensor<4xf32> into tensor<?xf32>
      %inserted_slice_0 = tensor.insert_slice %arg2 into %arg8[0] [4] [1] : tensor<4xf32> into tensor<?xf32>
      scf.yield %inserted_slice, %inserted_slice_0 : tensor<?xf32>, tensor<?xf32>
    }
    return %0#0, %0#1 : tensor<?xf32>, tensor<?xf32>
  }
}

// -----
module {
  func.func @execute_region_with_conflict(%arg0: tensor<?xf32> {bufferization.writable = true}) -> (f32, tensor<?xf32>, f32) {
    %cst = arith.constant 0.000000e+00 : f32
    %c7 = arith.constant 7 : index
    %0:3 = scf.execute_region -> (f32, tensor<?xf32>, f32) {
      %inserted = tensor.insert %cst into %arg0[%c7] : tensor<?xf32>
      scf.yield %cst, %inserted, %cst : f32, tensor<?xf32>, f32
    }
    %extracted = tensor.extract %arg0[%c7] : tensor<?xf32>
    return %0#0, %0#1, %extracted : f32, tensor<?xf32>, f32
  }
}

// -----
module {
  func.func @scf_if_inplace(%arg0: i1, %arg1: tensor<?xf32> {bufferization.writable = true}, %arg2: vector<5xf32>, %arg3: index) -> tensor<?xf32> {
    %0 = scf.if %arg0 -> (tensor<?xf32>) {
      scf.yield %arg1 : tensor<?xf32>
    } else {
      %1 = vector.transfer_write %arg2, %arg1[%arg3] : vector<5xf32>, tensor<?xf32>
      scf.yield %1 : tensor<?xf32>
    }
    return %0 : tensor<?xf32>
  }
}

// -----
module {
  func.func @scf_if_inside_scf_for(%arg0: tensor<?xf32> {bufferization.writable = true}, %arg1: vector<5xf32>, %arg2: index, %arg3: i1) -> tensor<?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    %0 = scf.for %arg4 = %c0 to %c10 step %c1 iter_args(%arg5 = %arg0) -> (tensor<?xf32>) {
      %1 = scf.if %arg3 -> (tensor<?xf32>) {
        scf.yield %arg5 : tensor<?xf32>
      } else {
        %2 = vector.transfer_write %arg1, %arg5[%arg2] : vector<5xf32>, tensor<?xf32>
        scf.yield %2 : tensor<?xf32>
      }
      scf.yield %1 : tensor<?xf32>
    }
    return %0 : tensor<?xf32>
  }
}

// -----
module {
  func.func @scf_if_non_equiv_yields(%arg0: i1, %arg1: tensor<4xf32> {bufferization.writable = false}, %arg2: tensor<4xf32> {bufferization.writable = false}) -> tensor<4xf32> {
    %0 = scf.if %arg0 -> (tensor<4xf32>) {
      scf.yield %arg1 : tensor<4xf32>
    } else {
      scf.yield %arg2 : tensor<4xf32>
    }
    return %0 : tensor<4xf32>
  }
}

// -----
module {
  func.func @scf_execute_region_yield_non_equivalent(%arg0: index, %arg1: index) -> f32 {
    %0 = scf.execute_region -> tensor<?xf32> {
      %1 = bufferization.alloc_tensor(%arg0) : tensor<?xf32>
      scf.yield %1 : tensor<?xf32>
    }
    %extracted = tensor.extract %0[%arg1] : tensor<?xf32>
    return %extracted : f32
  }
}

// -----
module {
  func.func @scf_for_yield_non_equivalent(%arg0: tensor<?xf32>, %arg1: index, %arg2: index, %arg3: index) -> tensor<?xf32> {
    %0 = scf.for %arg4 = %arg1 to %arg2 step %arg3 iter_args(%arg5 = %arg0) -> (tensor<?xf32>) {
      scf.yield %arg0 : tensor<?xf32>
    }
    return %0 : tensor<?xf32>
  }
}

// -----
module {
  func.func @scf_for_yield_allocation(%arg0: tensor<?xf32>, %arg1: index, %arg2: index, %arg3: index) -> tensor<?xf32> {
    %0 = scf.for %arg4 = %arg1 to %arg2 step %arg3 iter_args(%arg5 = %arg0) -> (tensor<?xf32>) {
      %1 = bufferization.alloc_tensor(%arg4) : tensor<?xf32>
      scf.yield %1 : tensor<?xf32>
    }
    return %0 : tensor<?xf32>
  }
}

// -----
module {
  func.func @scf_for_swapping_yields(%arg0: tensor<?xf32>, %arg1: tensor<?xf32> {bufferization.writable = true}, %arg2: tensor<4xf32>, %arg3: index, %arg4: index, %arg5: index) -> (f32, f32) {
    %0:2 = scf.for %arg6 = %arg3 to %arg4 step %arg5 iter_args(%arg7 = %arg0, %arg8 = %arg1) -> (tensor<?xf32>, tensor<?xf32>) {
      %inserted_slice = tensor.insert_slice %arg2 into %arg7[0] [4] [1] : tensor<4xf32> into tensor<?xf32>
      %inserted_slice_1 = tensor.insert_slice %arg2 into %arg8[0] [4] [1] : tensor<4xf32> into tensor<?xf32>
      scf.yield %inserted_slice_1, %inserted_slice : tensor<?xf32>, tensor<?xf32>
    }
    %extracted = tensor.extract %0#0[%arg5] : tensor<?xf32>
    %extracted_0 = tensor.extract %0#1[%arg5] : tensor<?xf32>
    return %extracted, %extracted_0 : f32, f32
  }
}

// -----
module {
  func.func @scf_while(%arg0: tensor<?xi1>, %arg1: index) -> tensor<?xi1> {
    %0:2 = scf.while (%arg2 = %arg0, %arg3 = %arg1) : (tensor<?xi1>, index) -> (tensor<?xi1>, index) {
      %extracted = tensor.extract %arg2[%arg1] : tensor<?xi1>
      scf.condition(%extracted) %arg2, %arg1 : tensor<?xi1>, index
    } do {
    ^bb0(%arg2: tensor<?xi1>, %arg3: index):
      %1 = "dummy.some_op"() : () -> index
      %2 = "dummy.another_op"() : () -> i1
      %inserted = tensor.insert %2 into %arg2[%1] : tensor<?xi1>
      scf.yield %inserted, %arg3 : tensor<?xi1>, index
    }
    return %0#0 : tensor<?xi1>
  }
}

// -----
module {
  func.func @scf_while_non_equiv_condition(%arg0: tensor<5xi1>, %arg1: tensor<5xi1>, %arg2: index) -> (tensor<5xi1>, tensor<5xi1>) {
    %0:2 = scf.while (%arg3 = %arg0, %arg4 = %arg1) : (tensor<5xi1>, tensor<5xi1>) -> (tensor<5xi1>, tensor<5xi1>) {
      %extracted = tensor.extract %arg3[%arg2] : tensor<5xi1>
      scf.condition(%extracted) %arg4, %arg3 : tensor<5xi1>, tensor<5xi1>
    } do {
    ^bb0(%arg3: tensor<5xi1>, %arg4: tensor<5xi1>):
      %1 = "dummy.some_op"() : () -> index
      %2 = "dummy.another_op"() : () -> i1
      %inserted = tensor.insert %2 into %arg3[%1] : tensor<5xi1>
      scf.yield %inserted, %arg4 : tensor<5xi1>, tensor<5xi1>
    }
    return %0#0, %0#1 : tensor<5xi1>, tensor<5xi1>
  }
}

// -----
module {
  func.func @scf_while_non_equiv_condition_and_body(%arg0: tensor<5xi1>, %arg1: tensor<5xi1>, %arg2: index) -> (tensor<5xi1>, tensor<5xi1>) {
    %0:2 = scf.while (%arg3 = %arg0, %arg4 = %arg1) : (tensor<5xi1>, tensor<5xi1>) -> (tensor<5xi1>, tensor<5xi1>) {
      %extracted = tensor.extract %arg3[%arg2] : tensor<5xi1>
      scf.condition(%extracted) %arg4, %arg3 : tensor<5xi1>, tensor<5xi1>
    } do {
    ^bb0(%arg3: tensor<5xi1>, %arg4: tensor<5xi1>):
      %1 = "dummy.some_op"() : () -> index
      %2 = "dummy.another_op"() : () -> i1
      %inserted = tensor.insert %2 into %arg3[%1] : tensor<5xi1>
      scf.yield %arg4, %inserted : tensor<5xi1>, tensor<5xi1>
    }
    return %0#0, %0#1 : tensor<5xi1>, tensor<5xi1>
  }
}

// -----
module {
  func.func @scf_while_iter_arg_result_mismatch(%arg0: tensor<5xi1>, %arg1: tensor<5xi1>, %arg2: index) {
    scf.while (%arg3 = %arg1) : (tensor<5xi1>) -> () {
      %extracted = tensor.extract %arg0[%arg2] : tensor<5xi1>
      %extracted_0 = tensor.extract %arg3[%arg2] : tensor<5xi1>
      "dummy.use"(%extracted_0) : (i1) -> ()
      scf.condition(%extracted)
    } do {
      %0 = "dummy.some_op"() : () -> index
      %1 = "dummy.another_op"() : () -> i1
      %inserted = tensor.insert %1 into %arg0[%0] : tensor<5xi1>
      scf.yield %inserted : tensor<5xi1>
    }
    return
  }
}

// -----
module {
  func.func private @parallel_insert_slice_no_conflict(%arg0: index, %arg1: index, %arg2: tensor<?xf32> {bufferization.writable = true}, %arg3: tensor<?xf32> {bufferization.writable = true}) -> (tensor<?xf32>, f32) {
    %cst = arith.constant 4.200000e+01 : f32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = scf.forall (%arg4) in (%arg1) shared_outs(%arg5 = %arg3) -> (tensor<?xf32>) {
      %extracted_slice = tensor.extract_slice %arg5[5] [%arg0] [%c1] : tensor<?xf32> to tensor<?xf32>
      %1 = linalg.fill ins(%cst : f32) outs(%extracted_slice : tensor<?xf32>) -> tensor<?xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %1 into %arg5[5] [%arg0] [%c1] : tensor<?xf32> into tensor<?xf32>
      }
    } {keep_this_attribute}
    %extracted = tensor.extract %0[%c0] : tensor<?xf32>
    return %0, %extracted : tensor<?xf32>, f32
  }
}

// -----
module {
  func.func @parallel_insert_slice_with_conflict(%arg0: index, %arg1: index, %arg2: tensor<?xf32> {bufferization.writable = true}, %arg3: tensor<?xf32> {bufferization.writable = true}) -> (f32, f32) {
    %cst = arith.constant 4.200000e+01 : f32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = scf.forall (%arg4) in (%arg1) shared_outs(%arg5 = %arg3) -> (tensor<?xf32>) {
      %extracted_slice = tensor.extract_slice %arg5[5] [%arg0] [%c1] : tensor<?xf32> to tensor<?xf32>
      %1 = linalg.fill ins(%cst : f32) outs(%extracted_slice : tensor<?xf32>) -> tensor<?xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %1 into %arg5[5] [%arg0] [%c1] : tensor<?xf32> into tensor<?xf32>
      }
    }
    %extracted = tensor.extract %arg3[%c0] : tensor<?xf32>
    %extracted_0 = tensor.extract %0[%c0] : tensor<?xf32>
    return %extracted_0, %extracted : f32, f32
  }
}

// -----
#map = affine_map<(d0) -> (d0 * 4)>
#map1 = affine_map<(d0) -> (d0 * 2)>
module {
  func.func @matmul(%arg0: tensor<8x8xf32>, %arg1: tensor<8x8xf32>, %arg2: tensor<8x8xf32> {bufferization.writable = true}) -> tensor<8x8xf32> {
    %c2 = arith.constant 2 : index
    %c4 = arith.constant 4 : index
    %0 = scf.forall (%arg3, %arg4) in (%c2, %c4) shared_outs(%arg5 = %arg2) -> (tensor<8x8xf32>) {
      %1 = affine.apply #map(%arg3)
      %extracted_slice = tensor.extract_slice %arg0[%1, 0] [4, 8] [1, 1] : tensor<8x8xf32> to tensor<4x8xf32>
      %2 = affine.apply #map1(%arg4)
      %extracted_slice_0 = tensor.extract_slice %arg1[0, %2] [8, 4] [1, 1] : tensor<8x8xf32> to tensor<8x4xf32>
      %extracted_slice_1 = tensor.extract_slice %arg5[%1, %2] [4, 4] [1, 1] : tensor<8x8xf32> to tensor<4x4xf32>
      %3 = linalg.matmul ins(%extracted_slice, %extracted_slice_0 : tensor<4x8xf32>, tensor<8x4xf32>) outs(%extracted_slice_1 : tensor<4x4xf32>) -> tensor<4x4xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %3 into %arg5[%1, %2] [4, 4] [1, 1] : tensor<4x4xf32> into tensor<8x8xf32>
      }
    }
    return %0 : tensor<8x8xf32>
  }
}

// -----
module {
  func.func @scf_foreach_private_var(%arg0: tensor<10xf32>) -> f32 {
    %c2 = arith.constant 2 : index
    %c5 = arith.constant 5 : index
    %0 = scf.forall (%arg1) in (%c2) shared_outs(%arg2 = %arg0) -> (tensor<10xf32>) {
      %1 = arith.muli %c5, %arg1 : index
      %extracted_slice = tensor.extract_slice %arg2[%1] [5] [1] : tensor<10xf32> to tensor<5xf32>
      %extracted_0 = tensor.extract %arg0[%arg1] : tensor<10xf32>
      %inserted = tensor.insert %extracted_0 into %extracted_slice[%c2] : tensor<5xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %inserted into %arg2[%1] [5] [1] : tensor<5xf32> into tensor<10xf32>
      }
    }
    %extracted = tensor.extract %0[%c2] : tensor<10xf32>
    return %extracted : f32
  }
}

// -----
module {
  func.func @scf_foreach_privatized_but_not_copied(%arg0: tensor<10xf32>, %arg1: tensor<10xf32>) -> f32 {
    %c2 = arith.constant 2 : index
    %c5 = arith.constant 5 : index
    %0 = scf.forall (%arg2) in (%c2) shared_outs(%arg3 = %arg0) -> (tensor<10xf32>) {
      %1 = arith.muli %c5, %arg2 : index
      %extracted_slice = tensor.extract_slice %arg3[%1] [5] [1] : tensor<10xf32> to tensor<5xf32>
      %extracted_0 = tensor.extract %arg1[%arg2] : tensor<10xf32>
      %inserted = tensor.insert %extracted_0 into %extracted_slice[%c2] : tensor<5xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %inserted into %arg3[%1] [5] [1] : tensor<5xf32> into tensor<10xf32>
      }
    }
    %extracted = tensor.extract %0[%c2] : tensor<10xf32>
    return %extracted : f32
  }
}

// -----
module {
  func.func @scf_if_memory_space(%arg0: i1, %arg1: f32, %arg2: f32) -> (f32, f32) {
    %c0 = arith.constant 0 : index
    %0 = bufferization.alloc_tensor() {memory_space = 1 : i64} : tensor<5xf32>
    %1 = linalg.fill ins(%arg2 : f32) outs(%0 : tensor<5xf32>) -> tensor<5xf32>
    %2 = scf.if %arg0 -> (tensor<5xf32>) {
      scf.yield %1 : tensor<5xf32>
    } else {
      %inserted = tensor.insert %arg1 into %1[%c0] : tensor<5xf32>
      scf.yield %inserted : tensor<5xf32>
    }
    %extracted = tensor.extract %1[%c0] : tensor<5xf32>
    %extracted_0 = tensor.extract %2[%c0] : tensor<5xf32>
    return %extracted, %extracted_0 : f32, f32
  }
}

// -----
module {
  func.func @scf_execute_region_memory_space(%arg0: f32) -> f32 {
    %c0 = arith.constant 0 : index
    %0 = scf.execute_region -> tensor<5xf32> {
      %1 = bufferization.alloc_tensor() {memory_space = 1 : i64} : tensor<5xf32>
      %inserted = tensor.insert %arg0 into %1[%c0] : tensor<5xf32>
      scf.yield %inserted : tensor<5xf32>
    }
    %extracted = tensor.extract %0[%c0] : tensor<5xf32>
    return %extracted : f32
  }
}

// -----
module {
  func.func @scf_for_swapping_yields_memory_space(%arg0: index, %arg1: tensor<4xf32>, %arg2: index, %arg3: index, %arg4: index) -> (f32, f32) {
    %0 = bufferization.alloc_tensor(%arg0) {memory_space = 1 : i64} : tensor<?xf32>
    %1 = bufferization.alloc_tensor(%arg0) {memory_space = 1 : i64} : tensor<?xf32>
    %2:2 = scf.for %arg5 = %arg2 to %arg3 step %arg4 iter_args(%arg6 = %0, %arg7 = %1) -> (tensor<?xf32>, tensor<?xf32>) {
      %inserted_slice = tensor.insert_slice %arg1 into %arg6[0] [4] [1] : tensor<4xf32> into tensor<?xf32>
      %inserted_slice_1 = tensor.insert_slice %arg1 into %arg7[0] [4] [1] : tensor<4xf32> into tensor<?xf32>
      scf.yield %inserted_slice_1, %inserted_slice : tensor<?xf32>, tensor<?xf32>
    }
    %extracted = tensor.extract %2#0[%arg4] : tensor<?xf32>
    %extracted_0 = tensor.extract %2#1[%arg4] : tensor<?xf32>
    return %extracted, %extracted_0 : f32, f32
  }
}

// -----
module {
  func.func @scf_for_yield_alias_of_non_equivalent(%arg0: index) -> tensor<?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 5.000000e+00 : f32
    %generated = tensor.generate %arg0 {
    ^bb0(%arg1: index):
      tensor.yield %cst : f32
    } : tensor<?xf32>
    %0 = scf.for %arg1 = %c0 to %arg0 step %c1 iter_args(%arg2 = %generated) -> (tensor<?xf32>) {
      %1 = arith.subi %arg1, %c1 : index
      %extracted_slice = tensor.extract_slice %generated[%1] [%arg0] [1] : tensor<?xf32> to tensor<?xf32>
      %extracted = tensor.extract %extracted_slice[%c0] : tensor<?xf32>
      %2 = arith.mulf %cst, %extracted : f32
      %inserted = tensor.insert %2 into %arg2[%arg1] : tensor<?xf32>
      scf.yield %inserted : tensor<?xf32>
    }
    return %0 : tensor<?xf32>
  }
}

// -----
module {
  func.func @scf_for_buffer_type_mismatch(%arg0: index, %arg1: index) -> f32 {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    %0 = bufferization.alloc_tensor(%arg0) : tensor<?xf32>
    %extracted_slice = tensor.extract_slice %0[1] [%arg1] [1] : tensor<?xf32> to tensor<?xf32>
    %1 = scf.for %arg2 = %c0 to %c10 step %c1 iter_args(%arg3 = %extracted_slice) -> (tensor<?xf32>) {
      %2 = "test.dummy"() : () -> index
      %extracted_slice_0 = tensor.extract_slice %arg3[1] [%2] [1] : tensor<?xf32> to tensor<?xf32>
      scf.yield %extracted_slice_0 : tensor<?xf32>
    }
    %extracted = tensor.extract %1[%c1] : tensor<?xf32>
    return %extracted : f32
  }
}

// -----
module {
  func.func @scf_while_buffer_type_mismatch(%arg0: index, %arg1: index) -> f32 {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    %cst = arith.constant 5.500000e+00 : f32
    %0 = bufferization.alloc_tensor(%arg0) : tensor<?xf32>
    %extracted_slice = tensor.extract_slice %0[1] [%arg1] [1] : tensor<?xf32> to tensor<?xf32>
    %1 = scf.while (%arg2 = %extracted_slice) : (tensor<?xf32>) -> tensor<?xf32> {
      %2 = "test.condition"() : () -> i1
      %3 = "test.dummy"() : () -> index
      %extracted_slice_0 = tensor.extract_slice %arg2[1] [%3] [1] : tensor<?xf32> to tensor<?xf32>
      scf.condition(%2) %extracted_slice_0 : tensor<?xf32>
    } do {
    ^bb0(%arg2: tensor<?xf32>):
      %2 = "test.dummy"() : () -> index
      %inserted = tensor.insert %cst into %arg2[%2] : tensor<?xf32>
      scf.yield %inserted : tensor<?xf32>
    }
    %extracted = tensor.extract %1[%c1] : tensor<?xf32>
    return %extracted : f32
  }
}

// -----
module {
  func.func @non_tensor_for_arg(%arg0: tensor<?xf32> {bufferization.writable = true}) -> tensor<?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 2.000000e+00 : f32
    %c10 = arith.constant 10 : index
    %0:2 = scf.for %arg1 = %c0 to %c10 step %c1 iter_args(%arg2 = %c1, %arg3 = %arg0) -> (index, tensor<?xf32>) {
      %inserted = tensor.insert %cst into %arg3[%arg2] : tensor<?xf32>
      scf.yield %arg2, %inserted : index, tensor<?xf32>
    }
    return %0#1 : tensor<?xf32>
  }
}

// -----
module {
  func.func @buffer_type_of_collapse_shape(%arg0: tensor<f64>) {
    %true = arith.constant true
    %0 = scf.while (%arg1 = %arg0) : (tensor<f64>) -> tensor<f64> {
      scf.condition(%true) %arg1 : tensor<f64>
    } do {
    ^bb0(%arg1: tensor<f64>):
      %1 = bufferization.alloc_tensor() : tensor<1xf64>
      %collapsed = tensor.collapse_shape %1 [] : tensor<1xf64> into tensor<f64>
      scf.yield %collapsed : tensor<f64>
    }
    return
  }
}

// -----
module {
  func.func @non_block_argument_yield() {
    %true = arith.constant true
    %0 = bufferization.alloc_tensor() : tensor<i32>
    %1 = scf.while (%arg0 = %0) : (tensor<i32>) -> tensor<i32> {
      scf.condition(%true) %arg0 : tensor<i32>
    } do {
    ^bb0(%arg0: tensor<i32>):
      %2 = scf.while (%arg1 = %0) : (tensor<i32>) -> tensor<i32> {
        scf.condition(%true) %arg1 : tensor<i32>
      } do {
      ^bb0(%arg1: tensor<i32>):
        scf.yield %0 : tensor<i32>
      }
      scf.yield %2 : tensor<i32>
    }
    return
  }
}

// -----
module {
  func.func @regression_cast_in_loop() -> tensor<2xindex> {
    %false = arith.constant false
    %c0 = arith.constant 0 : index
    %0 = bufferization.alloc_tensor() : tensor<2xindex>
    %1 = scf.while (%arg0 = %0) : (tensor<2xindex>) -> tensor<2xindex> {
      scf.condition(%false) %arg0 : tensor<2xindex>
    } do {
    ^bb0(%arg0: tensor<2xindex>):
      %cast = tensor.cast %0 : tensor<2xindex> to tensor<?xindex>
      %inserted = tensor.insert %c0 into %cast[%c0] : tensor<?xindex>
      %cast_0 = tensor.cast %inserted : tensor<?xindex> to tensor<2xindex>
      scf.yield %cast_0 : tensor<2xindex>
    }
    return %1 : tensor<2xindex>
  }
}

// -----
module {
  func.func @elide_copy_of_non_writing_scf_if(%arg0: i1, %arg1: index, %arg2: index, %arg3: f32) -> (tensor<10xf32>, f32) {
    %0 = scf.if %arg0 -> (tensor<10xf32>) {
      %1 = bufferization.alloc_tensor() : tensor<10xf32>
      scf.yield %1 : tensor<10xf32>
    } else {
      %1 = bufferization.alloc_tensor() : tensor<10xf32>
      scf.yield %1 : tensor<10xf32>
    }
    %inserted = tensor.insert %arg3 into %0[%arg1] : tensor<10xf32>
    %extracted = tensor.extract %0[%arg2] : tensor<10xf32>
    return %inserted, %extracted : tensor<10xf32>, f32
  }
}

// -----
module {
  func.func @index_switch(%arg0: index, %arg1: tensor<5xf32>, %arg2: tensor<5xf32>) -> tensor<5xf32> {
    %0 = bufferization.alloc_tensor() : tensor<5xf32>
    %1 = scf.index_switch %arg0 -> tensor<5xf32> 
    case 2 {
      scf.yield %0 : tensor<5xf32>
    }
    case 5 {
      scf.yield %arg1 : tensor<5xf32>
    }
    default {
      scf.yield %arg2 : tensor<5xf32>
    }
    return %1 : tensor<5xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
module {
  func.func @check_scfforall_inplace_bufferizer(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?xf32> {bufferization.writable = true}) -> tensor<?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg2, %c0 : tensor<?xf32>
    %dim_0 = tensor.dim %arg1, %c1 : tensor<?x?xf32>
    %0 = scf.forall (%arg3) in (%c1) shared_outs(%arg4 = %arg2) -> (tensor<?xf32>) {
      %extracted_slice = tensor.extract_slice %arg0[0, 0] [%dim, %dim_0] [1, 1] : tensor<?x?xf32> to tensor<?x?xf32>
      %extracted_slice_1 = tensor.extract_slice %arg1[0, 0] [%dim, %dim_0] [1, 1] : tensor<?x?xf32> to tensor<?x?xf32>
      %1 = linalg.generic {indexing_maps = [#map, #map, #map1], iterator_types = ["parallel", "reduction"]} ins(%extracted_slice, %extracted_slice_1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg4 : tensor<?xf32>) {
      ^bb0(%in: f32, %in_2: f32, %out: f32):
        %2 = arith.mulf %in, %in_2 : f32
        %3 = arith.addf %2, %out : f32
        linalg.yield %3 : f32
      } -> tensor<?xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %1 into %arg4[0] [%dim] [1] : tensor<?xf32> into tensor<?xf32>
      }
    }
    return %0 : tensor<?xf32>
  }
}

