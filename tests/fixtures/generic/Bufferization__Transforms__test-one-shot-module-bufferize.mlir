"builtin.module"() <{sym_name = "BufferizeEncodingThroughFunctionBoundaryAndCustomOps"}> ({
  "func.func"() <{function_type = (tensor<?xf32, #test.tensor_encoding<"hello">>) -> tensor<?xf32, #test.tensor_encoding<"hello">>, sym_name = "inner_func"}> ({
  ^bb0(%arg1: tensor<?xf32, #test.tensor_encoding<"hello">>):
    "func.return"(%arg1) : (tensor<?xf32, #test.tensor_encoding<"hello">>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf32, #test.tensor_encoding<"hello">>) -> (tensor<?xf32, #test.tensor_encoding<"hello">>, tensor<?xf32, #test.tensor_encoding<"not hello">>), sym_name = "outer_func"}> ({
  ^bb0(%arg0: tensor<?xf32, #test.tensor_encoding<"hello">>):
    %0 = "func.call"(%arg0) <{callee = @inner_func}> : (tensor<?xf32, #test.tensor_encoding<"hello">>) -> tensor<?xf32, #test.tensor_encoding<"hello">>
    %1 = "test.create_tensor_op"() : () -> tensor<?xf32, #test.tensor_encoding<"not hello">>
    %2 = "test.dummy_tensor_op"(%1) : (tensor<?xf32, #test.tensor_encoding<"not hello">>) -> tensor<?xf32, #test.tensor_encoding<"not hello">>
    "func.return"(%0, %2) : (tensor<?xf32, #test.tensor_encoding<"hello">>, tensor<?xf32, #test.tensor_encoding<"not hello">>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!test.test_tensor<[4, 4], f64>) -> (!test.test_tensor<[4, 8], f64>, !test.test_tensor<[4, 8], f64>), sym_name = "custom_types"}> ({
  ^bb0(%arg0: !test.test_tensor<[4, 4], f64>):
    %0 = "test.dummy_tensor_op"(%arg0) : (!test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 8], f64>
    %1 = "test.create_tensor_op"() : () -> !test.test_tensor<[4, 4], f64>
    %2 = "test.dummy_tensor_op"(%1) : (!test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 8], f64>
    "func.return"(%0, %2) : (!test.test_tensor<[4, 8], f64>, !test.test_tensor<[4, 8], f64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 4], f64>, sym_name = "custom_types_foo"}> ({
  ^bb0(%arg1: !test.test_tensor<[4, 4], f64>):
    %2 = "test.dummy_tensor_op"(%arg1) : (!test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 4], f64>
    "func.return"(%2) : (!test.test_tensor<[4, 4], f64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 8], f64>, sym_name = "custom_types_bar"}> ({
  ^bb0(%arg0: !test.test_tensor<[4, 4], f64>):
    %0 = "func.call"(%arg0) <{callee = @custom_types_foo}> : (!test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 4], f64>
    %1 = "test.dummy_tensor_op"(%0) : (!test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 8], f64>
    "func.return"(%1) : (!test.test_tensor<[4, 8], f64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!test.test_tensor<[4, 4], f64>, index, index, index) -> !test.test_tensor<[4, 4], f64>, sym_name = "custom_types_scf_for_inplace"}> ({
  ^bb0(%arg0: !test.test_tensor<[4, 4], f64>, %arg1: index, %arg2: index, %arg3: index):
    %0 = "scf.for"(%arg1, %arg2, %arg3, %arg0) ({
    ^bb0(%arg4: index, %arg5: !test.test_tensor<[4, 4], f64>):
      %1 = "test.dummy_tensor_op"(%arg5) : (!test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 4], f64>
      "scf.yield"(%1) : (!test.test_tensor<[4, 4], f64>) -> ()
    }) : (index, index, index, !test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 4], f64>
    "func.return"(%0) : (!test.test_tensor<[4, 4], f64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 4], f64>, sym_name = "custom_types_identity_2d", sym_visibility = "private"}> ({
  ^bb0(%arg6: !test.test_tensor<[4, 4], f64>):
    %2 = "test.dummy_tensor_op"(%arg6) : (!test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 4], f64>
    "func.return"(%2) : (!test.test_tensor<[4, 4], f64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!test.test_tensor<[4, 4], f64>, index, index, index) -> !test.test_tensor<[4, 4], f64>, sym_name = "custom_types_scf_for_inplace_with_call"}> ({
  ^bb0(%arg0: !test.test_tensor<[4, 4], f64>, %arg1: index, %arg2: index, %arg3: index):
    %0 = "scf.for"(%arg1, %arg2, %arg3, %arg0) ({
    ^bb0(%arg4: index, %arg5: !test.test_tensor<[4, 4], f64>):
      %1 = "func.call"(%arg5) <{callee = @custom_types_identity_2d}> : (!test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 4], f64>
      "scf.yield"(%1) : (!test.test_tensor<[4, 4], f64>) -> ()
    }) : (index, index, index, !test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 4], f64>
    "func.return"(%0) : (!test.test_tensor<[4, 4], f64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!test.test_tensor<[4, 4], f64>, i1) -> !test.test_tensor<[4, 4], f64>, sym_name = "custom_types_scf_if_inplace"}> ({
  ^bb0(%arg0: !test.test_tensor<[4, 4], f64>, %arg1: i1):
    %0 = "scf.if"(%arg1) ({
      %1 = "test.dummy_tensor_op"(%arg0) : (!test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 4], f64>
      "scf.yield"(%1) : (!test.test_tensor<[4, 4], f64>) -> ()
    }, {
      "scf.yield"(%arg0) : (!test.test_tensor<[4, 4], f64>) -> ()
    }) : (i1) -> !test.test_tensor<[4, 4], f64>
    "func.return"(%0) : (!test.test_tensor<[4, 4], f64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 4], f64>, sym_name = "custom_types_identity_2d", sym_visibility = "private"}> ({
  ^bb0(%arg2: !test.test_tensor<[4, 4], f64>):
    %2 = "test.dummy_tensor_op"(%arg2) : (!test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 4], f64>
    "func.return"(%2) : (!test.test_tensor<[4, 4], f64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!test.test_tensor<[4, 4], f64>, i1) -> !test.test_tensor<[4, 4], f64>, sym_name = "custom_types_scf_if_inplace_with_call"}> ({
  ^bb0(%arg0: !test.test_tensor<[4, 4], f64>, %arg1: i1):
    %0 = "scf.if"(%arg1) ({
      %1 = "func.call"(%arg0) <{callee = @custom_types_identity_2d}> : (!test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 4], f64>
      "scf.yield"(%1) : (!test.test_tensor<[4, 4], f64>) -> ()
    }, {
      "scf.yield"(%arg0) : (!test.test_tensor<[4, 4], f64>) -> ()
    }) : (i1) -> !test.test_tensor<[4, 4], f64>
    "func.return"(%0) : (!test.test_tensor<[4, 4], f64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!test.test_tensor<[4, 4], f64>, i1) -> !test.test_tensor<[4, 4], f64>, sym_name = "scf_while_inplace"}> ({
  ^bb0(%arg0: !test.test_tensor<[4, 4], f64>, %arg1: i1):
    %0 = "scf.while"(%arg0) ({
    ^bb0(%arg3: !test.test_tensor<[4, 4], f64>):
      "scf.condition"(%arg1, %arg3) : (i1, !test.test_tensor<[4, 4], f64>) -> ()
    }, {
    ^bb0(%arg2: !test.test_tensor<[4, 4], f64>):
      %1 = "test.dummy_tensor_op"(%arg2) : (!test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 4], f64>
      "scf.yield"(%1) : (!test.test_tensor<[4, 4], f64>) -> ()
    }) : (!test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 4], f64>
    "func.return"(%0) : (!test.test_tensor<[4, 4], f64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 4], f64>, sym_name = "custom_types_identity_2d", sym_visibility = "private"}> ({
  ^bb0(%arg4: !test.test_tensor<[4, 4], f64>):
    %2 = "test.dummy_tensor_op"(%arg4) : (!test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 4], f64>
    "func.return"(%2) : (!test.test_tensor<[4, 4], f64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!test.test_tensor<[4, 4], f64>, i1) -> !test.test_tensor<[4, 4], f64>, sym_name = "scf_while_inplace"}> ({
  ^bb0(%arg0: !test.test_tensor<[4, 4], f64>, %arg1: i1):
    %0 = "scf.while"(%arg0) ({
    ^bb0(%arg3: !test.test_tensor<[4, 4], f64>):
      "scf.condition"(%arg1, %arg3) : (i1, !test.test_tensor<[4, 4], f64>) -> ()
    }, {
    ^bb0(%arg2: !test.test_tensor<[4, 4], f64>):
      %1 = "func.call"(%arg2) <{callee = @custom_types_identity_2d}> : (!test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 4], f64>
      "scf.yield"(%1) : (!test.test_tensor<[4, 4], f64>) -> ()
    }) : (!test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 4], f64>
    "func.return"(%0) : (!test.test_tensor<[4, 4], f64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() <{sym_name = "BufferizeEncodingForCustomOpsInsideScf"}> ({
  "func.func"() <{function_type = (tensor<42xf64, #test.tensor_encoding<"custom">>, index, index, index) -> tensor<42xf64, #test.tensor_encoding<"custom">>, sym_name = "custom_encoding_inside_scf"}> ({
  ^bb0(%arg0: tensor<42xf64, #test.tensor_encoding<"custom">>, %arg1: index, %arg2: index, %arg3: index):
    %0 = "scf.for"(%arg1, %arg2, %arg3, %arg0) ({
    ^bb0(%arg4: index, %arg5: tensor<42xf64, #test.tensor_encoding<"custom">>):
      %1 = "test.dummy_tensor_op"(%arg5) : (tensor<42xf64, #test.tensor_encoding<"custom">>) -> tensor<42xf64, #test.tensor_encoding<"custom">>
      "scf.yield"(%1) : (tensor<42xf64, #test.tensor_encoding<"custom">>) -> ()
    }) : (index, index, index, tensor<42xf64, #test.tensor_encoding<"custom">>) -> tensor<42xf64, #test.tensor_encoding<"custom">>
    "func.return"(%0) : (tensor<42xf64, #test.tensor_encoding<"custom">>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() <{sym_name = "BufferizeLayoutForFunction"}> ({
  "func.func"() <{function_type = () -> tensor<10xf32>, sym_name = "layout_for_func"}> ({
    %0 = "test.tensor_with_future_layout"() <{layout = #test.memref_layout<"layout_a">}> : () -> tensor<10xf32>
    "func.return"(%0) : (tensor<10xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() <{sym_name = "BufferizeLayoutMismatchInsideScfIf"}> ({
  "func.func"() <{function_type = (i1) -> tensor<10xf32>, sym_name = "mismatch_in_if"}> ({
  ^bb0(%arg0: i1):
    %0 = "scf.if"(%arg0) ({
      %2 = "test.tensor_with_future_layout"() <{layout = #test.memref_layout<"layout_a">}> : () -> tensor<10xf32>
      "scf.yield"(%2) : (tensor<10xf32>) -> ()
    }, {
      %1 = "test.tensor_with_future_layout"() <{layout = #test.memref_layout<"layout_b">}> : () -> tensor<10xf32>
      "scf.yield"(%1) : (tensor<10xf32>) -> ()
    }) : (i1) -> tensor<10xf32>
    "func.return"(%0) : (tensor<10xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() <{sym_name = "BufferizeLayoutMismatchInsideScfSwitch"}> ({
  "func.func"() <{function_type = (index) -> tensor<10xf32>, sym_name = "mismatch_in_switch"}> ({
  ^bb0(%arg0: index):
    %0 = "scf.index_switch"(%arg0) <{cases = array<i64: 0, 1>}> ({
      %3 = "test.tensor_with_future_layout"() <{layout = #test.memref_layout<"layout_c">}> : () -> tensor<10xf32>
      "scf.yield"(%3) : (tensor<10xf32>) -> ()
    }, {
      %2 = "test.tensor_with_future_layout"() <{layout = #test.memref_layout<"layout_a">}> : () -> tensor<10xf32>
      "scf.yield"(%2) : (tensor<10xf32>) -> ()
    }, {
      %1 = "test.tensor_with_future_layout"() <{layout = #test.memref_layout<"layout_b">}> : () -> tensor<10xf32>
      "scf.yield"(%1) : (tensor<10xf32>) -> ()
    }) : (index) -> tensor<10xf32>
    "func.return"(%0) : (tensor<10xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() <{sym_name = "BufferizeLayoutMismatchInsideScfFor"}> ({
  "func.func"() <{function_type = (index, index, index) -> tensor<10xf32>, sym_name = "mismatch_in_for"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index):
    %0 = "test.tensor_with_future_layout"() <{layout = #test.memref_layout<"layout_a">}> : () -> tensor<10xf32>
    %1 = "scf.for"(%arg0, %arg1, %arg2, %0) ({
    ^bb0(%arg3: index, %arg4: tensor<10xf32>):
      %2 = "test.force_new_layout"(%arg4) <{layout = #test.memref_layout<"layout_b">}> : (tensor<10xf32>) -> tensor<10xf32>
      "scf.yield"(%2) : (tensor<10xf32>) -> ()
    }) : (index, index, index, tensor<10xf32>) -> tensor<10xf32>
    "func.return"(%1) : (tensor<10xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() <{sym_name = "BufferizeLayoutMismatchInsideScfForWithUserType"}> ({
  "func.func"() <{function_type = (index, index, index) -> !test.test_tensor<[10], f32>, sym_name = "mismatch_in_for"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index):
    %0 = "test.tensor_with_future_layout"() <{layout = #test.memref_layout<"layout_a">}> : () -> !test.test_tensor<[10], f32>
    %1 = "scf.for"(%arg0, %arg1, %arg2, %0) ({
    ^bb0(%arg3: index, %arg4: !test.test_tensor<[10], f32>):
      %2 = "test.force_new_layout"(%arg4) <{layout = #test.memref_layout<"layout_b">}> : (!test.test_tensor<[10], f32>) -> !test.test_tensor<[10], f32>
      "scf.yield"(%2) : (!test.test_tensor<[10], f32>) -> ()
    }) : (index, index, index, !test.test_tensor<[10], f32>) -> !test.test_tensor<[10], f32>
    "func.return"(%1) : (!test.test_tensor<[10], f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() <{sym_name = "BufferizeLayoutMismatchInsideScfForWithSubviews"}> ({
  "func.func"() <{function_type = (index, index, index) -> tensor<10xf32>, sym_name = "mismatch_in_for"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "test.tensor_with_future_layout"() <{layout = #test.memref_layout<"layout_a">}> : () -> tensor<10xf32>
    %2 = "scf.for"(%arg0, %arg1, %arg2, %1) ({
    ^bb0(%arg3: index, %arg4: tensor<10xf32>):
      %3 = "tensor.extract_slice"(%arg4, %0) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 5>, static_strides = array<i64: 1>}> : (tensor<10xf32>, index) -> tensor<5xf32>
      %4 = "test.force_new_layout"(%3) <{layout = #test.memref_layout<"layout_b">}> : (tensor<5xf32>) -> tensor<5xf32>
      %5 = "tensor.insert_slice"(%4, %arg4, %0) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 5>, static_strides = array<i64: 1>}> : (tensor<5xf32>, tensor<10xf32>, index) -> tensor<10xf32>
      "scf.yield"(%5) : (tensor<10xf32>) -> ()
    }) : (index, index, index, tensor<10xf32>) -> tensor<10xf32>
    "func.return"(%2) : (tensor<10xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() <{sym_name = "BufferizeLayoutMismatchInScfExecuteRegion"}> ({
  "func.func"() <{function_type = (i1) -> tensor<10xf32>, sym_name = "mismatch_in_scf_execute_region"}> ({
  ^bb0(%arg0: i1):
    %0 = "scf.execute_region"() ({
      "cf.cond_br"(%arg0)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
    ^bb1:  // pred: ^bb0
      %1 = "test.tensor_with_future_layout"() <{layout = #test.memref_layout<"layout_a">}> : () -> tensor<10xf32>
      "cf.br"(%1)[^bb3] : (tensor<10xf32>) -> ()
    ^bb2:  // pred: ^bb0
      %2 = "test.tensor_with_future_layout"() <{layout = #test.memref_layout<"layout_b">}> : () -> tensor<10xf32>
      "cf.br"(%2)[^bb3] : (tensor<10xf32>) -> ()
    ^bb3(%3: tensor<10xf32>):  // 2 preds: ^bb1, ^bb2
      "scf.yield"(%3) : (tensor<10xf32>) -> ()
    }) : () -> tensor<10xf32>
    "func.return"(%0) : (tensor<10xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() <{sym_name = "BufferizeLayoutMismatchInScfExecuteRegionWithUserType"}> ({
  "func.func"() <{function_type = (i1) -> !test.test_tensor<[10], f32>, sym_name = "mismatch_in_scf_execute_region"}> ({
  ^bb0(%arg0: i1):
    %0 = "scf.execute_region"() ({
      "cf.cond_br"(%arg0)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
    ^bb1:  // pred: ^bb0
      %1 = "test.tensor_with_future_layout"() <{layout = #test.memref_layout<"layout_a">}> : () -> !test.test_tensor<[10], f32>
      "cf.br"(%1)[^bb3] : (!test.test_tensor<[10], f32>) -> ()
    ^bb2:  // pred: ^bb0
      %2 = "test.tensor_with_future_layout"() <{layout = #test.memref_layout<"layout_b">}> : () -> !test.test_tensor<[10], f32>
      "cf.br"(%2)[^bb3] : (!test.test_tensor<[10], f32>) -> ()
    ^bb3(%3: !test.test_tensor<[10], f32>):  // 2 preds: ^bb1, ^bb2
      "scf.yield"(%3) : (!test.test_tensor<[10], f32>) -> ()
    }) : () -> !test.test_tensor<[10], f32>
    "func.return"(%0) : (!test.test_tensor<[10], f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() <{sym_name = "BufferizeLayoutMismatchInArithSelect"}> ({
  "func.func"() <{function_type = (i1) -> tensor<10xf32>, sym_name = "mismatch_in_select"}> ({
  ^bb0(%arg0: i1):
    %0 = "test.tensor_with_future_layout"() <{layout = #test.memref_layout<"layout_a">}> : () -> tensor<10xf32>
    %1 = "test.tensor_with_future_layout"() <{layout = #test.memref_layout<"layout_b">}> : () -> tensor<10xf32>
    %2 = "arith.select"(%arg0, %0, %1) : (i1, tensor<10xf32>, tensor<10xf32>) -> tensor<10xf32>
    "func.return"(%2) : (tensor<10xf32>) -> ()
  }) : () -> ()
}) : () -> ()

