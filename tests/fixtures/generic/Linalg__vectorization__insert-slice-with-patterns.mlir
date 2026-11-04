"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x2x3xf32>, tensor<9x8x7x1x2x3xf32>) -> tensor<9x8x7x1x2x3xf32>, sym_name = "insert_static_slice_default_pad"}> ({
  ^bb0(%arg1: tensor<1x2x3xf32>, %arg2: tensor<9x8x7x1x2x3xf32>):
    %3 = "tensor.insert_slice"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0, 0, 0, 0>, static_sizes = array<i64: 1, 1, 1, 1, 2, 3>, static_strides = array<i64: 1, 1, 1, 1, 1, 1>}> : (tensor<1x2x3xf32>, tensor<9x8x7x1x2x3xf32>) -> tensor<9x8x7x1x2x3xf32>
    "func.return"(%3) : (tensor<9x8x7x1x2x3xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.insert_slice"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) <{vectorize_padding}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x2x3xf32>, f32) -> tensor<9x8x7x1x2x3xf32>, sym_name = "insert_static_slice_non_zero_pad"}> ({
  ^bb0(%arg1: tensor<1x2x3xf32>, %arg2: f32):
    %3 = "tensor.empty"() : () -> tensor<9x8x7x1x2x3xf32>
    %4 = "linalg.fill"(%arg2, %3) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      "linalg.yield"(%arg3) : (f32) -> ()
    }) : (f32, tensor<9x8x7x1x2x3xf32>) -> tensor<9x8x7x1x2x3xf32>
    %5 = "tensor.insert_slice"(%arg1, %4) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0, 0, 0, 0>, static_sizes = array<i64: 1, 1, 1, 1, 2, 3>, static_strides = array<i64: 1, 1, 1, 1, 1, 1>}> : (tensor<1x2x3xf32>, tensor<9x8x7x1x2x3xf32>) -> tensor<9x8x7x1x2x3xf32>
    "func.return"(%5) : (tensor<9x8x7x1x2x3xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.insert_slice"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x?x3xf32>, f32, index) -> tensor<9x8x7x1x2x3xf32>, sym_name = "insert_dynamic_slice_non_zero_pad"}> ({
  ^bb0(%arg1: tensor<1x?x3xf32>, %arg2: f32, %arg3: index):
    %3 = "tensor.empty"() : () -> tensor<9x8x7x1x2x3xf32>
    %4 = "linalg.fill"(%arg2, %3) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      "linalg.yield"(%arg4) : (f32) -> ()
    }) : (f32, tensor<9x8x7x1x2x3xf32>) -> tensor<9x8x7x1x2x3xf32>
    %5 = "tensor.insert_slice"(%arg1, %4, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 0, 1, 0>, static_offsets = array<i64: 0, 0, 0, 0, 0, 0>, static_sizes = array<i64: 1, 1, 1, 1, -9223372036854775808, 3>, static_strides = array<i64: 1, 1, 1, 1, 1, 1>}> : (tensor<1x?x3xf32>, tensor<9x8x7x1x2x3xf32>, index) -> tensor<9x8x7x1x2x3xf32>
    "func.return"(%5) : (tensor<9x8x7x1x2x3xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.insert_slice"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

