"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x3xf32>, tensor<?x?xf32>, index, index, index, index, index, index) -> tensor<?x?xf32>, sym_name = "insert_slice_to_copy"}> ({
  ^bb0(%arg1: tensor<2x3xf32>, %arg2: tensor<?x?xf32>, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index):
    %3 = "tensor.insert_slice"(%arg1, %arg2, %arg3, %arg4, %arg7, %arg8) <{operandSegmentSizes = array<i32: 1, 1, 2, 0, 2>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 2, 3>, static_strides = array<i64: -9223372036854775808, -9223372036854775808>}> : (tensor<2x3xf32>, tensor<?x?xf32>, index, index, index, index) -> tensor<?x?xf32>
    "func.return"(%3) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.insert_slice"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.insert_slice_to_copy"(%0) : (!transform.any_op) -> !transform.any_op
      %2 = "transform.cast"(%1) : (!transform.any_op) -> !transform.op<"linalg.copy">
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>, index, index, index, index, index, index) -> tensor<?x?xf32>, sym_name = "insert_slice_to_copy"}> ({
  ^bb0(%arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index):
    %3 = "tensor.insert_slice"(%arg1, %arg2, %arg3, %arg4, %arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1, 2, 2, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>, tensor<?x?xf32>, index, index, index, index) -> tensor<?x?xf32>
    "func.return"(%3) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.insert_slice"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.insert_slice_to_copy"(%0) : (!transform.any_op) -> !transform.any_op
      %2 = "transform.cast"(%1) : (!transform.any_op) -> !transform.op<"linalg.copy">
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x3xf32>, tensor<?x?xf32>, index, index, index, index, index, index) -> tensor<?x?xf32>, sym_name = "insert_slice_to_copy"}> ({
  ^bb0(%arg1: tensor<2x3xf32>, %arg2: tensor<?x?xf32>, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index):
    %3 = "tensor.extract_slice"(%arg2, %arg3, %arg4, %arg7, %arg8) <{operandSegmentSizes = array<i32: 1, 2, 0, 2>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 2, 3>, static_strides = array<i64: -9223372036854775808, -9223372036854775808>}> : (tensor<?x?xf32>, index, index, index, index) -> tensor<2x3xf32>
    %4 = "linalg.copy"(%arg1, %3) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg9: f32, %arg10: f32):
      "linalg.yield"(%arg9) : (f32) -> ()
    }) : (tensor<2x3xf32>, tensor<2x3xf32>) -> tensor<2x3xf32>
    %5 = "tensor.insert_slice"(%4, %arg2, %arg3, %arg4, %arg7, %arg8) <{operandSegmentSizes = array<i32: 1, 1, 2, 0, 2>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 2, 3>, static_strides = array<i64: -9223372036854775808, -9223372036854775808>}> : (tensor<2x3xf32>, tensor<?x?xf32>, index, index, index, index) -> tensor<?x?xf32>
    "func.return"(%5) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.insert_slice"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.insert_slice_to_copy"(%0) : (!transform.any_op) -> !transform.any_op
      %2 = "transform.cast"(%1) : (!transform.any_op) -> !transform.op<"linalg.copy">
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, index, index) -> (), sym_name = "parallel_insert_slice_to_copy"}> ({
  ^bb0(%arg1: tensor<?x?xf32>, %arg2: index, %arg3: index):
    %3 = "scf.forall"(%arg1) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>, staticLowerBound = array<i64: 0, 0>, staticStep = array<i64: 1, 1>, staticUpperBound = array<i64: 27, 8>}> ({
    ^bb0(%arg4: index, %arg5: index, %arg6: tensor<?x?xf32>):
      %4 = "make_me_a_tensor"() : () -> tensor<?x?xf32>
      "scf.forall.in_parallel"() ({
        "tensor.parallel_insert_slice"(%4, %arg6, %arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 0, 2, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>, tensor<?x?xf32>, index, index) -> ()
      }) : () -> ()
    }) : (tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.parallel_insert_slice"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.insert_slice_to_copy"(%0) : (!transform.any_op) -> !transform.any_op
      %2 = "transform.cast"(%1) : (!transform.any_op) -> !transform.op<"linalg.copy">
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

