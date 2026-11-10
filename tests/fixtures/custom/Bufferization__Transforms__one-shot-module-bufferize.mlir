module {
  func.func private @private_func(tensor<?xf32>)
  func.func private @private_func_2d(tensor<?x?xf32>)
  func.func @empty_func() {
    return
  }
}

// -----
module {
  func.func private @external_func_with_return_val(tensor<4xi32>) -> f32
}

// -----
module {
  func.func private @foo(tensor<?xf32>) -> (f32, tensor<?xf32>, f32)
  func.func @call_to_unknown_tensor_returning_func(%arg0: tensor<?xf32>) {
    %0:3 = call @foo(%arg0) : (tensor<?xf32>) -> (f32, tensor<?xf32>, f32)
    return
  }
}

// -----
module {
  func.func @return_extract_slice(%arg0: index, %arg1: index) -> tensor<2x?xf32> {
    %0 = bufferization.alloc_tensor() : tensor<20x10xf32>
    %extracted_slice = tensor.extract_slice %0[%arg0, %arg0] [2, %arg1] [1, 1] : tensor<20x10xf32> to tensor<2x?xf32>
    return %extracted_slice : tensor<2x?xf32>
  }
}

// -----
module {
  func.func @foo(%arg0: tensor<3x8xf16>) -> tensor<3x8xf16> {
    return %arg0 : tensor<3x8xf16>
  }
  func.func @call_extract_slice(%arg0: tensor<4x8xf16>) -> tensor<3x8xf16> {
    %extracted_slice = tensor.extract_slice %arg0[1, 0] [3, 8] [1, 1] : tensor<4x8xf16> to tensor<3x8xf16>
    %0 = call @foo(%extracted_slice) : (tensor<3x8xf16>) -> tensor<3x8xf16>
    return %0 : tensor<3x8xf16>
  }
}

// -----
module {
  func.func private @private_func(tensor<?xf32>) -> f32
  func.func @main(%arg0: tensor<?xf32> {bufferization.writable = true}) -> f32 {
    %0 = call @private_func(%arg0) : (tensor<?xf32>) -> f32
    return %0 : f32
  }
}

// -----
module {
  func.func private @private_func(tensor<?xf32>) -> f32
  func.func @main(%arg0: tensor<?xf32> {bufferization.writable = false}) -> f32 {
    %0 = call @private_func(%arg0) : (tensor<?xf32>) -> f32
    return %0 : f32
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
  func.func private @inner_func(%arg0: tensor<?xf32>) -> (tensor<?xf32>, f32) {
    %cst = arith.constant 1.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %inserted = tensor.insert %cst into %arg0[%c0] : tensor<?xf32>
    %extracted = tensor.extract %inserted[%c1] : tensor<?xf32>
    return %inserted, %extracted : tensor<?xf32>, f32
  }
  func.func private @call_func_with_non_tensor_return(%arg0: tensor<?xf32> {bufferization.writable = true}) -> (f32, tensor<?xf32>) {
    %0:2 = call @inner_func(%arg0) : (tensor<?xf32>) -> (tensor<?xf32>, f32)
    return %0#1, %0#0 : f32, tensor<?xf32>
  }
}

// -----
module {
  func.func private @inner_func(%arg0: tensor<?xf32>) -> (tensor<?xf32>, f32) {
    %cst = arith.constant 1.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %inserted = tensor.insert %cst into %arg0[%c0] : tensor<?xf32>
    %extracted = tensor.extract %inserted[%c1] : tensor<?xf32>
    return %inserted, %extracted : tensor<?xf32>, f32
  }
  func.func @call_func_with_non_tensor_return(%arg0: tensor<?xf32> {bufferization.writable = false}) -> (f32, tensor<?xf32>) {
    %0:2 = call @inner_func(%arg0) : (tensor<?xf32>) -> (tensor<?xf32>, f32)
    return %0#1, %0#0 : f32, tensor<?xf32>
  }
}

// -----
module {
  func.func private @f0(tensor<?xf32>) -> f32
  func.func @f1(%arg0: tensor<?xf32>) -> f32 {
    %0 = call @f0(%arg0) : (tensor<?xf32>) -> f32
    return %0 : f32
  }
  func.func @f2(%arg0: tensor<?xf32>) -> f32 {
    %0 = call @f1(%arg0) : (tensor<?xf32>) -> f32
    return %0 : f32
  }
  func.func @main(%arg0: tensor<?xf32> {bufferization.writable = false}) -> f32 {
    %0 = call @f2(%arg0) : (tensor<?xf32>) -> f32
    return %0 : f32
  }
}

// -----
module {
  func.func private @does_not_read(%arg0: tensor<?xf32>) -> tensor<?xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = linalg.fill ins(%cst : f32) outs(%arg0 : tensor<?xf32>) -> tensor<?xf32>
    return %0 : tensor<?xf32>
  }
  func.func @main(%arg0: tensor<?xf32> {bufferization.writable = false}) -> f32 {
    %0 = call @does_not_read(%arg0) : (tensor<?xf32>) -> tensor<?xf32>
    %c4 = arith.constant 4 : index
    %extracted = tensor.extract %0[%c4] : tensor<?xf32>
    return %extracted : f32
  }
}

// -----
module {
  func.func private @some_external_func(tensor<4xi32>)
  func.func @main() {
    %cst = arith.constant dense<[1, 2, 3, 4]> : tensor<4xi32>
    call @some_external_func(%cst) : (tensor<4xi32>) -> ()
    return
  }
}

// -----
module {
  func.func private @some_external_func_within_scf_execute(tensor<4xi32>)
  func.func @main() {
    %cst = arith.constant dense<[1, 2, 3, 4]> : tensor<4xi32>
    scf.execute_region {
      func.call @some_external_func_within_scf_execute(%cst) : (tensor<4xi32>) -> ()
      scf.yield
    }
    return
  }
}

// -----
module {
  func.func private @execute_region_test(%arg0: tensor<?xf32>) -> (f32, tensor<?xf32>, f32) {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    %c7 = arith.constant 7 : index
    %0:3 = scf.execute_region -> (f32, tensor<?xf32>, f32) {
      %inserted = tensor.insert %cst_0 into %arg0[%c7] : tensor<?xf32>
      scf.yield %cst, %inserted, %cst_0 : f32, tensor<?xf32>, f32
    }
    return %0#0, %0#1, %0#2 : f32, tensor<?xf32>, f32
  }
}

// -----
module {
  func.func private @foo()
  func.func @no_inline_execute_region_not_canonicalized() {
    %c42_i32 = arith.constant 42 : i32
    %0 = scf.execute_region -> i32 no_inline {
      func.call @foo() : () -> ()
      scf.yield %c42_i32 : i32
    }
    return
  }
}

// -----
module {
  func.func private @some_external_func(tensor<?xf32>)
  func.func private @scf_for_with_tensor_insert_slice(%arg0: tensor<?xf32>, %arg1: tensor<?xf32>, %arg2: tensor<4xf32>, %arg3: index, %arg4: index, %arg5: index) -> (tensor<?xf32>, tensor<?xf32>) {
    %0:2 = scf.for %arg6 = %arg3 to %arg4 step %arg5 iter_args(%arg7 = %arg0, %arg8 = %arg1) -> (tensor<?xf32>, tensor<?xf32>) {
      %inserted_slice = tensor.insert_slice %arg2 into %arg7[%arg6] [4] [1] : tensor<4xf32> into tensor<?xf32>
      %inserted_slice_0 = tensor.insert_slice %arg2 into %arg8[%arg6] [4] [1] : tensor<4xf32> into tensor<?xf32>
      scf.yield %inserted_slice, %inserted_slice_0 : tensor<?xf32>, tensor<?xf32>
    }
    return %0#1, %0#0 : tensor<?xf32>, tensor<?xf32>
  }
  func.func @bar(%arg0: tensor<?xf32> {bufferization.writable = true}, %arg1: tensor<?xf32> {bufferization.writable = true}, %arg2: tensor<4xf32> {bufferization.writable = true}, %arg3: index, %arg4: index, %arg5: index) -> (tensor<?xf32>, tensor<?xf32>) {
    %0:2 = call @scf_for_with_tensor_insert_slice(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5) : (tensor<?xf32>, tensor<?xf32>, tensor<4xf32>, index, index, index) -> (tensor<?xf32>, tensor<?xf32>)
    call @some_external_func(%0#0) : (tensor<?xf32>) -> ()
    return %0#0, %0#1 : tensor<?xf32>, tensor<?xf32>
  }
}

// -----
module {
  func.func private @init_and_dot(%arg0: tensor<64xf32>, %arg1: tensor<64xf32>, %arg2: tensor<f32>) -> tensor<f32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = linalg.fill ins(%cst : f32) outs(%arg2 : tensor<f32>) -> tensor<f32>
    %1 = linalg.dot ins(%arg0, %arg1 : tensor<64xf32>, tensor<64xf32>) outs(%0 : tensor<f32>) -> tensor<f32>
    return %1 : tensor<f32>
  }
  func.func @main() {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    %cst_1 = arith.constant 2.000000e+00 : f32
    %0 = bufferization.alloc_tensor() : tensor<64xf32>
    %1 = bufferization.alloc_tensor() : tensor<64xf32>
    %2 = bufferization.alloc_tensor() : tensor<f32>
    %3 = linalg.fill ins(%cst_0 : f32) outs(%0 : tensor<64xf32>) -> tensor<64xf32>
    %4 = linalg.fill ins(%cst_1 : f32) outs(%1 : tensor<64xf32>) -> tensor<64xf32>
    %5 = linalg.fill ins(%cst : f32) outs(%2 : tensor<f32>) -> tensor<f32>
    %6 = call @init_and_dot(%3, %4, %5) : (tensor<64xf32>, tensor<64xf32>, tensor<f32>) -> tensor<f32>
    %cast = tensor.cast %6 : tensor<f32> to tensor<*xf32>
    call @printMemrefF32(%cast) : (tensor<*xf32>) -> ()
    return
  }
  func.func private @printMemrefF32(tensor<*xf32>)
}

// -----
module {
  func.func private @external_func(tensor<?xf32>)
  func.func @callee(%arg0: tensor<?xf32> {bufferization.buffer_layout = affine_map<(d0)[s0, s1] -> (d0)>}, %arg1: tensor<?xf32>, %arg2: tensor<?xf32>) {
    call @external_func(%arg0) : (tensor<?xf32>) -> ()
    call @external_func(%arg1) : (tensor<?xf32>) -> ()
    call @external_func(%arg2) : (tensor<?xf32>) -> ()
    return
  }
  func.func @entry(%arg0: tensor<?xf32> {bufferization.buffer_layout = affine_map<(d0)[s0, s1] -> (d0)>, bufferization.writable = false}, %arg1: tensor<?xf32> {bufferization.buffer_layout = affine_map<(d0)[s0, s1] -> (d0)>, bufferization.writable = false}, %arg2: tensor<?xf32> {bufferization.writable = false}) {
    call @callee(%arg0, %arg1, %arg2) : (tensor<?xf32>, tensor<?xf32>, tensor<?xf32>) -> ()
    return
  }
}

// -----
module {
  func.func private @inner_func(%arg0: tensor<?xf32>) -> tensor<?xf32> {
    %cst = arith.constant 1.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %inserted = tensor.insert %cst into %arg0[%c0] : tensor<?xf32>
    return %inserted : tensor<?xf32>
  }
  func.func @equivalent_func_arg(%arg0: tensor<?xf32> {bufferization.writable = true}, %arg1: index, %arg2: index, %arg3: index) -> tensor<?xf32> {
    %0 = scf.for %arg4 = %arg1 to %arg2 step %arg3 iter_args(%arg5 = %arg0) -> (tensor<?xf32>) {
      %1 = func.call @inner_func(%arg5) : (tensor<?xf32>) -> tensor<?xf32>
      scf.yield %1 : tensor<?xf32>
    }
    return %0 : tensor<?xf32>
  }
}

// -----
module {
  func.func @inner_func_2(%arg0: tensor<?xf32>) -> tensor<?xf32> {
    %cst = arith.constant 1.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %inserted = tensor.insert %cst into %arg0[%c0] : tensor<?xf32>
    return %inserted : tensor<?xf32>
  }
  func.func @equivalent_func_arg_2(%arg0: tensor<?xf32> {bufferization.writable = true}, %arg1: index, %arg2: index, %arg3: index) -> tensor<?xf32> {
    %0 = scf.for %arg4 = %arg1 to %arg2 step %arg3 iter_args(%arg5 = %arg0) -> (tensor<?xf32>) {
      %1 = func.call @inner_func_2(%arg5) : (tensor<?xf32>) -> tensor<?xf32>
      scf.yield %arg5 : tensor<?xf32>
    }
    return %0 : tensor<?xf32>
  }
}

// -----
module {
  func.func @transfer_read(%arg0: tensor<?xf32> {bufferization.writable = false}) -> vector<4xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c0], %cst : tensor<?xf32>, vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @main() {
    %cst = arith.constant dense<[1.000000e+00, 2.000000e+00, 3.000000e+00]> : tensor<3xf32>
    %cast = tensor.cast %cst : tensor<3xf32> to tensor<*xf32>
    call @maybe_writing_func(%cast) : (tensor<*xf32>) -> ()
    return
  }
  func.func private @maybe_writing_func(tensor<*xf32>)
}

// -----
module {
  llvm.func @llvm_func()
  func.func @call_llvm_func() {
    llvm.call @llvm_func() : () -> ()
    return
  }
}

// -----
module {
  func.func @to_buffer_op_unsupported(%arg0: tensor<?xf32> {bufferization.writable = true}, %arg1: index, %arg2: index, %arg3: index, %arg4: vector<5xf32>) -> vector<5xf32> {
    %0 = bufferization.to_buffer %arg0 : tensor<?xf32> to memref<?xf32>
    "test.foo"(%0) : (memref<?xf32>) -> ()
    %cst = arith.constant 0.000000e+00 : f32
    %1 = vector.transfer_read %arg0[%arg3], %cst : tensor<?xf32>, vector<5xf32>
    return %1 : vector<5xf32>
  }
}

// -----
module {
  func.func @br_in_func(%arg0: tensor<5xf32>) -> tensor<5xf32> {
    cf.br ^bb1(%arg0 : tensor<5xf32>)
  ^bb1(%0: tensor<5xf32>):  // pred: ^bb0
    return %0 : tensor<5xf32>
  }
}

// -----
module {
  func.func @foo(%arg0: memref<5xf32>) -> memref<5xf32> {
    %0 = tensor.empty() : tensor<5xf32>
    %1 = call @bar(%0, %arg0) : (tensor<5xf32>, memref<5xf32>) -> memref<5xf32>
    return %1 : memref<5xf32>
  }
  func.func @bar(%arg0: tensor<5xf32>, %arg1: memref<5xf32>) -> memref<5xf32> {
    %0 = call @foo(%arg1) : (memref<5xf32>) -> memref<5xf32>
    return %0 : memref<5xf32>
  }
}

// -----
module {
  func.func @foo(%arg0: tensor<5xf32>) -> tensor<5xf32> {
    %0 = call @foo(%arg0) : (tensor<5xf32>) -> tensor<5xf32>
    %c0 = arith.constant 0 : index
    %extracted = tensor.extract %arg0[%c0] : tensor<5xf32>
    vector.print %extracted : f32
    return %0 : tensor<5xf32>
  }
}

// -----
module {
  func.func @foo(%arg0: tensor<5xf32>) -> tensor<5xf32> {
    %0 = call @bar(%arg0) : (tensor<5xf32>) -> tensor<5xf32>
    return %0 : tensor<5xf32>
  }
  func.func @bar(%arg0: tensor<5xf32>) -> tensor<5xf32> {
    %0 = call @foo(%arg0) : (tensor<5xf32>) -> tensor<5xf32>
    return %0 : tensor<5xf32>
  }
}

// -----
module {
  func.func @result_type_mismatch(%arg0: i1) -> tensor<5xf32> {
    %0 = tensor.empty() : tensor<10xf32>
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    %extracted_slice = tensor.extract_slice %0[0] [5] [2] : tensor<10xf32> to tensor<5xf32>
    return %extracted_slice : tensor<5xf32>
  ^bb2:  // pred: ^bb0
    %extracted_slice_0 = tensor.extract_slice %0[2] [5] [1] : tensor<10xf32> to tensor<5xf32>
    return %extracted_slice_0 : tensor<5xf32>
  }
}

// -----
module {
  func.func @outer_func(%arg0: tensor<5xf32>) -> tensor<5xf32> {
    return %arg0 : tensor<5xf32>
  }
  module @inner_module {
    func.func @inner_func(%arg0: tensor<5xf32> {bufferization.writable = false}) -> tensor<5xf32> {
      return %arg0 : tensor<5xf32>
    }
  }
}

// -----
module {
  func.func @ranked_return_via_unranked_call(%arg0: tensor<64x20x40xf32>) -> tensor<64x20x40xf32> {
    %cast = tensor.cast %arg0 : tensor<64x20x40xf32> to tensor<*xf32>
    %0 = call @relu_unranked(%cast) : (tensor<*xf32>) -> tensor<*xf32>
    %cast_0 = tensor.cast %0 : tensor<*xf32> to tensor<64x20x40xf32>
    return %cast_0 : tensor<64x20x40xf32>
  }
  func.func private @relu_unranked(tensor<*xf32>) -> tensor<*xf32>
}

