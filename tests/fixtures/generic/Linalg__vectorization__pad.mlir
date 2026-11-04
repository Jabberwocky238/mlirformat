"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, index, index) -> tensor<2x4xf32>, sym_name = "test_masked_vectorize_pad"}> ({
  ^bb0(%arg1: tensor<?x?xf32>, %arg2: index, %arg3: index):
    %1 = "arith.constant"() <{value = 4.243000e+01 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "tensor.pad"(%arg1, %2, %arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 2>, static_high = array<i64: -9223372036854775808, -9223372036854775808>, static_low = array<i64: 0, -9223372036854775808>}> ({
    ^bb0(%arg4: index, %arg5: index):
      "tensor.yield"(%1) : (f32) -> ()
    }) : (tensor<?x?xf32>, index, index, index) -> tensor<2x4xf32>
    "func.return"(%3) : (tensor<2x4xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.pad"]}> : (!transform.any_op) -> !transform.any_op
      "transform.structured.vectorize"(%0) <{scalable_sizes = array<i1: false, false>, static_vector_sizes = array<i64: 2, 4>}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, index, index) -> tensor<?x?xf32>, sym_name = "test_masked_vectorize_dynamic_pad"}> ({
  ^bb0(%arg1: tensor<?x?xf32>, %arg2: index, %arg3: index):
    %1 = "arith.constant"() <{value = 4.243000e+01 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "tensor.pad"(%arg1, %2, %arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 2>, static_high = array<i64: -9223372036854775808, -9223372036854775808>, static_low = array<i64: 0, -9223372036854775808>}> ({
    ^bb0(%arg4: index, %arg5: index):
      "tensor.yield"(%1) : (f32) -> ()
    }) : (tensor<?x?xf32>, index, index, index) -> tensor<?x?xf32>
    "func.return"(%3) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.pad"]}> : (!transform.any_op) -> !transform.any_op
      "transform.structured.vectorize"(%0) <{scalable_sizes = array<i1: false, false>, static_vector_sizes = array<i64: 2, 4>}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, index, index, index) -> tensor<1x4xf32>, sym_name = "test_masked_vectorize_non_zero_low_pad_unit_res_dim"}> ({
  ^bb0(%arg1: tensor<?x?xf32>, %arg2: index, %arg3: index, %arg4: index):
    %1 = "arith.constant"() <{value = 4.243000e+01 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "tensor.pad"(%arg1, %arg4, %2, %arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 2, 2>, static_high = array<i64: -9223372036854775808, -9223372036854775808>, static_low = array<i64: -9223372036854775808, -9223372036854775808>}> ({
    ^bb0(%arg5: index, %arg6: index):
      "tensor.yield"(%1) : (f32) -> ()
    }) : (tensor<?x?xf32>, index, index, index, index) -> tensor<1x4xf32>
    "func.return"(%3) : (tensor<1x4xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.pad"]}> : (!transform.any_op) -> !transform.any_op
      "transform.structured.vectorize"(%0) <{scalable_sizes = array<i1: false, false>, static_vector_sizes = array<i64: 1, 4>}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

