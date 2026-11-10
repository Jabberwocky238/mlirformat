module @BufferizeEncodingThroughFunctionBoundaryAndCustomOps {
  func.func @inner_func(%arg0: tensor<?xf32, #test.tensor_encoding<"hello">>) -> tensor<?xf32, #test.tensor_encoding<"hello">> {
    return %arg0 : tensor<?xf32, #test.tensor_encoding<"hello">>
  }
  func.func @outer_func(%arg0: tensor<?xf32, #test.tensor_encoding<"hello">>) -> (tensor<?xf32, #test.tensor_encoding<"hello">>, tensor<?xf32, #test.tensor_encoding<"not hello">>) {
    %0 = call @inner_func(%arg0) : (tensor<?xf32, #test.tensor_encoding<"hello">>) -> tensor<?xf32, #test.tensor_encoding<"hello">>
    %1 = "test.create_tensor_op"() : () -> tensor<?xf32, #test.tensor_encoding<"not hello">>
    %2 = "test.dummy_tensor_op"(%1) : (tensor<?xf32, #test.tensor_encoding<"not hello">>) -> tensor<?xf32, #test.tensor_encoding<"not hello">>
    return %0, %2 : tensor<?xf32, #test.tensor_encoding<"hello">>, tensor<?xf32, #test.tensor_encoding<"not hello">>
  }
}

// -----
module {
  func.func @custom_types(%arg0: !test.test_tensor<[4, 4], f64>) -> (!test.test_tensor<[4, 8], f64>, !test.test_tensor<[4, 8], f64>) {
    %0 = "test.dummy_tensor_op"(%arg0) : (!test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 8], f64>
    %1 = "test.create_tensor_op"() : () -> !test.test_tensor<[4, 4], f64>
    %2 = "test.dummy_tensor_op"(%1) : (!test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 8], f64>
    return %0, %2 : !test.test_tensor<[4, 8], f64>, !test.test_tensor<[4, 8], f64>
  }
}

// -----
module {
  func.func @custom_types_foo(%arg0: !test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 4], f64> {
    %0 = "test.dummy_tensor_op"(%arg0) : (!test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 4], f64>
    return %0 : !test.test_tensor<[4, 4], f64>
  }
  func.func @custom_types_bar(%arg0: !test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 8], f64> {
    %0 = call @custom_types_foo(%arg0) : (!test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 4], f64>
    %1 = "test.dummy_tensor_op"(%0) : (!test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 8], f64>
    return %1 : !test.test_tensor<[4, 8], f64>
  }
}

// -----
module {
  func.func @custom_types_scf_for_inplace(%arg0: !test.test_tensor<[4, 4], f64>, %arg1: index, %arg2: index, %arg3: index) -> !test.test_tensor<[4, 4], f64> {
    %0 = scf.for %arg4 = %arg1 to %arg2 step %arg3 iter_args(%arg5 = %arg0) -> (!test.test_tensor<[4, 4], f64>) {
      %1 = "test.dummy_tensor_op"(%arg5) : (!test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 4], f64>
      scf.yield %1 : !test.test_tensor<[4, 4], f64>
    }
    return %0 : !test.test_tensor<[4, 4], f64>
  }
}

// -----
module {
  func.func private @custom_types_identity_2d(%arg0: !test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 4], f64> {
    %0 = "test.dummy_tensor_op"(%arg0) : (!test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 4], f64>
    return %0 : !test.test_tensor<[4, 4], f64>
  }
  func.func @custom_types_scf_for_inplace_with_call(%arg0: !test.test_tensor<[4, 4], f64>, %arg1: index, %arg2: index, %arg3: index) -> !test.test_tensor<[4, 4], f64> {
    %0 = scf.for %arg4 = %arg1 to %arg2 step %arg3 iter_args(%arg5 = %arg0) -> (!test.test_tensor<[4, 4], f64>) {
      %1 = func.call @custom_types_identity_2d(%arg5) : (!test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 4], f64>
      scf.yield %1 : !test.test_tensor<[4, 4], f64>
    }
    return %0 : !test.test_tensor<[4, 4], f64>
  }
}

// -----
module {
  func.func @custom_types_scf_if_inplace(%arg0: !test.test_tensor<[4, 4], f64>, %arg1: i1) -> !test.test_tensor<[4, 4], f64> {
    %0 = scf.if %arg1 -> (!test.test_tensor<[4, 4], f64>) {
      %1 = "test.dummy_tensor_op"(%arg0) : (!test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 4], f64>
      scf.yield %1 : !test.test_tensor<[4, 4], f64>
    } else {
      scf.yield %arg0 : !test.test_tensor<[4, 4], f64>
    }
    return %0 : !test.test_tensor<[4, 4], f64>
  }
}

// -----
module {
  func.func private @custom_types_identity_2d(%arg0: !test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 4], f64> {
    %0 = "test.dummy_tensor_op"(%arg0) : (!test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 4], f64>
    return %0 : !test.test_tensor<[4, 4], f64>
  }
  func.func @custom_types_scf_if_inplace_with_call(%arg0: !test.test_tensor<[4, 4], f64>, %arg1: i1) -> !test.test_tensor<[4, 4], f64> {
    %0 = scf.if %arg1 -> (!test.test_tensor<[4, 4], f64>) {
      %1 = func.call @custom_types_identity_2d(%arg0) : (!test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 4], f64>
      scf.yield %1 : !test.test_tensor<[4, 4], f64>
    } else {
      scf.yield %arg0 : !test.test_tensor<[4, 4], f64>
    }
    return %0 : !test.test_tensor<[4, 4], f64>
  }
}

// -----
module {
  func.func @scf_while_inplace(%arg0: !test.test_tensor<[4, 4], f64>, %arg1: i1) -> !test.test_tensor<[4, 4], f64> {
    %0 = scf.while (%arg2 = %arg0) : (!test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 4], f64> {
      scf.condition(%arg1) %arg2 : !test.test_tensor<[4, 4], f64>
    } do {
    ^bb0(%arg2: !test.test_tensor<[4, 4], f64>):
      %1 = "test.dummy_tensor_op"(%arg2) : (!test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 4], f64>
      scf.yield %1 : !test.test_tensor<[4, 4], f64>
    }
    return %0 : !test.test_tensor<[4, 4], f64>
  }
}

// -----
module {
  func.func private @custom_types_identity_2d(%arg0: !test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 4], f64> {
    %0 = "test.dummy_tensor_op"(%arg0) : (!test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 4], f64>
    return %0 : !test.test_tensor<[4, 4], f64>
  }
  func.func @scf_while_inplace(%arg0: !test.test_tensor<[4, 4], f64>, %arg1: i1) -> !test.test_tensor<[4, 4], f64> {
    %0 = scf.while (%arg2 = %arg0) : (!test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 4], f64> {
      scf.condition(%arg1) %arg2 : !test.test_tensor<[4, 4], f64>
    } do {
    ^bb0(%arg2: !test.test_tensor<[4, 4], f64>):
      %1 = func.call @custom_types_identity_2d(%arg2) : (!test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 4], f64>
      scf.yield %1 : !test.test_tensor<[4, 4], f64>
    }
    return %0 : !test.test_tensor<[4, 4], f64>
  }
}

// -----
module @BufferizeEncodingForCustomOpsInsideScf {
  func.func @custom_encoding_inside_scf(%arg0: tensor<42xf64, #test.tensor_encoding<"custom">>, %arg1: index, %arg2: index, %arg3: index) -> tensor<42xf64, #test.tensor_encoding<"custom">> {
    %0 = scf.for %arg4 = %arg1 to %arg2 step %arg3 iter_args(%arg5 = %arg0) -> (tensor<42xf64, #test.tensor_encoding<"custom">>) {
      %1 = "test.dummy_tensor_op"(%arg5) : (tensor<42xf64, #test.tensor_encoding<"custom">>) -> tensor<42xf64, #test.tensor_encoding<"custom">>
      scf.yield %1 : tensor<42xf64, #test.tensor_encoding<"custom">>
    }
    return %0 : tensor<42xf64, #test.tensor_encoding<"custom">>
  }
}

// -----
module @BufferizeLayoutForFunction {
  func.func @layout_for_func() -> tensor<10xf32> {
    %0 = "test.tensor_with_future_layout"() <{layout = #test.memref_layout<"layout_a">}> : () -> tensor<10xf32>
    return %0 : tensor<10xf32>
  }
}

// -----
module @BufferizeLayoutMismatchInsideScfIf {
  func.func @mismatch_in_if(%arg0: i1) -> tensor<10xf32> {
    %0 = scf.if %arg0 -> (tensor<10xf32>) {
      %1 = "test.tensor_with_future_layout"() <{layout = #test.memref_layout<"layout_a">}> : () -> tensor<10xf32>
      scf.yield %1 : tensor<10xf32>
    } else {
      %1 = "test.tensor_with_future_layout"() <{layout = #test.memref_layout<"layout_b">}> : () -> tensor<10xf32>
      scf.yield %1 : tensor<10xf32>
    }
    return %0 : tensor<10xf32>
  }
}

// -----
module @BufferizeLayoutMismatchInsideScfSwitch {
  func.func @mismatch_in_switch(%arg0: index) -> tensor<10xf32> {
    %0 = scf.index_switch %arg0 -> tensor<10xf32> 
    case 0 {
      %1 = "test.tensor_with_future_layout"() <{layout = #test.memref_layout<"layout_a">}> : () -> tensor<10xf32>
      scf.yield %1 : tensor<10xf32>
    }
    case 1 {
      %1 = "test.tensor_with_future_layout"() <{layout = #test.memref_layout<"layout_b">}> : () -> tensor<10xf32>
      scf.yield %1 : tensor<10xf32>
    }
    default {
      %1 = "test.tensor_with_future_layout"() <{layout = #test.memref_layout<"layout_c">}> : () -> tensor<10xf32>
      scf.yield %1 : tensor<10xf32>
    }
    return %0 : tensor<10xf32>
  }
}

// -----
module @BufferizeLayoutMismatchInsideScfFor {
  func.func @mismatch_in_for(%arg0: index, %arg1: index, %arg2: index) -> tensor<10xf32> {
    %0 = "test.tensor_with_future_layout"() <{layout = #test.memref_layout<"layout_a">}> : () -> tensor<10xf32>
    %1 = scf.for %arg3 = %arg0 to %arg1 step %arg2 iter_args(%arg4 = %0) -> (tensor<10xf32>) {
      %2 = "test.force_new_layout"(%arg4) <{layout = #test.memref_layout<"layout_b">}> : (tensor<10xf32>) -> tensor<10xf32>
      scf.yield %2 : tensor<10xf32>
    }
    return %1 : tensor<10xf32>
  }
}

// -----
module @BufferizeLayoutMismatchInsideScfForWithUserType {
  func.func @mismatch_in_for(%arg0: index, %arg1: index, %arg2: index) -> !test.test_tensor<[10], f32> {
    %0 = "test.tensor_with_future_layout"() <{layout = #test.memref_layout<"layout_a">}> : () -> !test.test_tensor<[10], f32>
    %1 = scf.for %arg3 = %arg0 to %arg1 step %arg2 iter_args(%arg4 = %0) -> (!test.test_tensor<[10], f32>) {
      %2 = "test.force_new_layout"(%arg4) <{layout = #test.memref_layout<"layout_b">}> : (!test.test_tensor<[10], f32>) -> !test.test_tensor<[10], f32>
      scf.yield %2 : !test.test_tensor<[10], f32>
    }
    return %1 : !test.test_tensor<[10], f32>
  }
}

// -----
module @BufferizeLayoutMismatchInsideScfForWithSubviews {
  func.func @mismatch_in_for(%arg0: index, %arg1: index, %arg2: index) -> tensor<10xf32> {
    %c0 = arith.constant 0 : index
    %0 = "test.tensor_with_future_layout"() <{layout = #test.memref_layout<"layout_a">}> : () -> tensor<10xf32>
    %1 = scf.for %arg3 = %arg0 to %arg1 step %arg2 iter_args(%arg4 = %0) -> (tensor<10xf32>) {
      %extracted_slice = tensor.extract_slice %arg4[%c0] [5] [1] : tensor<10xf32> to tensor<5xf32>
      %2 = "test.force_new_layout"(%extracted_slice) <{layout = #test.memref_layout<"layout_b">}> : (tensor<5xf32>) -> tensor<5xf32>
      %inserted_slice = tensor.insert_slice %2 into %arg4[%c0] [5] [1] : tensor<5xf32> into tensor<10xf32>
      scf.yield %inserted_slice : tensor<10xf32>
    }
    return %1 : tensor<10xf32>
  }
}

// -----
module @BufferizeLayoutMismatchInScfExecuteRegion {
  func.func @mismatch_in_scf_execute_region(%arg0: i1) -> tensor<10xf32> {
    %0 = scf.execute_region -> tensor<10xf32> {
      cf.cond_br %arg0, ^bb1, ^bb2
    ^bb1:  // pred: ^bb0
      %1 = "test.tensor_with_future_layout"() <{layout = #test.memref_layout<"layout_a">}> : () -> tensor<10xf32>
      cf.br ^bb3(%1 : tensor<10xf32>)
    ^bb2:  // pred: ^bb0
      %2 = "test.tensor_with_future_layout"() <{layout = #test.memref_layout<"layout_b">}> : () -> tensor<10xf32>
      cf.br ^bb3(%2 : tensor<10xf32>)
    ^bb3(%3: tensor<10xf32>):  // 2 preds: ^bb1, ^bb2
      scf.yield %3 : tensor<10xf32>
    }
    return %0 : tensor<10xf32>
  }
}

// -----
module @BufferizeLayoutMismatchInScfExecuteRegionWithUserType {
  func.func @mismatch_in_scf_execute_region(%arg0: i1) -> !test.test_tensor<[10], f32> {
    %0 = scf.execute_region -> !test.test_tensor<[10], f32> {
      cf.cond_br %arg0, ^bb1, ^bb2
    ^bb1:  // pred: ^bb0
      %1 = "test.tensor_with_future_layout"() <{layout = #test.memref_layout<"layout_a">}> : () -> !test.test_tensor<[10], f32>
      cf.br ^bb3(%1 : !test.test_tensor<[10], f32>)
    ^bb2:  // pred: ^bb0
      %2 = "test.tensor_with_future_layout"() <{layout = #test.memref_layout<"layout_b">}> : () -> !test.test_tensor<[10], f32>
      cf.br ^bb3(%2 : !test.test_tensor<[10], f32>)
    ^bb3(%3: !test.test_tensor<[10], f32>):  // 2 preds: ^bb1, ^bb2
      scf.yield %3 : !test.test_tensor<[10], f32>
    }
    return %0 : !test.test_tensor<[10], f32>
  }
}

// -----
module @BufferizeLayoutMismatchInArithSelect {
  func.func @mismatch_in_select(%arg0: i1) -> tensor<10xf32> {
    %0 = "test.tensor_with_future_layout"() <{layout = #test.memref_layout<"layout_a">}> : () -> tensor<10xf32>
    %1 = "test.tensor_with_future_layout"() <{layout = #test.memref_layout<"layout_b">}> : () -> tensor<10xf32>
    %2 = arith.select %arg0, %0, %1 : tensor<10xf32>
    return %2 : tensor<10xf32>
  }
}

