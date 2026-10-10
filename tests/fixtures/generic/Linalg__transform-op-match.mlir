"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "bar"}> ({
    %2 = "arith.constant"() <{value = 0 : i32}> {my_attr} : () -> i32
    %3 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["arith.constant"]}> : (!transform.any_op) -> !transform.any_op
      "transform.debug.emit_remark_at"(%0) <{message = "matched op name"}> : (!transform.any_op) -> ()
      "transform.test_consume_operand"(%0) : (!transform.any_op) -> ()
      %1 = "transform.structured.match"(%arg0) <{op_attrs = {my_attr}, ops = ["arith.constant"]}> : (!transform.any_op) -> !transform.any_op
      "transform.debug.emit_remark_at"(%1) <{message = "matched attr name"}> : (!transform.any_op) -> ()
      "transform.test_consume_operand"(%1) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "by_type"}> ({
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{filter_result_type = f32, ops = ["arith.constant"]}> : (!transform.any_op) -> !transform.any_op
      "transform.debug.emit_remark_at"(%0) <{message = "matched op name"}> : (!transform.any_op) -> ()
      "transform.test_consume_operand"(%0) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "by_operand_type"}> ({
    %4 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %5 = "arith.constant"() <{value = 8 : i32}> : () -> i32
    %6 = "math.fpowi"(%4, %5) <{fastmath = #arith.fastmath<none>}> : (f32, i32) -> f32
    %7 = "arith.addf"(%4, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %8 = "arith.fptoui"(%7) : (f32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{filter_operand_types = [f32], ops = ["arith.fptoui"]}> : (!transform.any_op) -> !transform.any_op
      "transform.debug.emit_remark_at"(%0) <{message = "matched op name"}> : (!transform.any_op) -> ()
      "transform.test_consume_operand"(%0) : (!transform.any_op) -> ()
      %1 = "transform.structured.match"(%arg0) <{filter_operand_types = [f32], ops = ["arith.addf"]}> : (!transform.any_op) -> !transform.any_op
      "transform.debug.emit_remark_at"(%1) <{message = "matched op name"}> : (!transform.any_op) -> ()
      "transform.test_consume_operand"(%1) : (!transform.any_op) -> ()
      %2 = "transform.structured.match"(%arg0) <{filter_operand_types = [i32], ops = ["arith.fptoui"]}> : (!transform.any_op) -> !transform.any_op
      "transform.debug.emit_remark_at"(%2) <{message = "should not match"}> : (!transform.any_op) -> ()
      "transform.test_consume_operand"(%2) : (!transform.any_op) -> ()
      %3 = "transform.structured.match"(%arg0) <{filter_operand_types = [f32], ops = ["math.fpowi"]}> : (!transform.any_op) -> !transform.any_op
      "transform.debug.emit_remark_at"(%3) <{message = "should not match"}> : (!transform.any_op) -> ()
      "transform.test_consume_operand"(%3) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x4xf32>, tensor<4x4xf32>, tensor<4x4xf32>) -> (), sym_name = "foo"}> ({
  ^bb0(%arg1: tensor<4x4xf32>, %arg2: tensor<4x4xf32>, %arg3: tensor<4x4xf32>):
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "linalg.fill"(%1, %arg3) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg7: f32, %arg8: f32):
      "linalg.yield"(%arg7) : (f32) -> ()
    }) : (f32, tensor<4x4xf32>) -> tensor<4x4xf32>
    %3 = "linalg.matmul"(%arg1, %arg2, %2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %4 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %5 = "arith.addf"(%arg6, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<4x4xf32>, tensor<4x4xf32>, tensor<4x4xf32>) -> tensor<4x4xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{interface = 1 : i32}> : (!transform.any_op) -> !transform.any_op
      "transform.debug.emit_remark_at"(%0) <{message = "tileable"}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d0, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<12x128x32xf32>) -> tensor<128x12x32xf32>, sym_name = "match_complex_attribute"}> ({
  ^bb0(%arg1: tensor<12x128x32xf32>):
    %3 = "tensor.empty"() : () -> tensor<128x12x32xf32>
    %4 = "linalg.generic"(%arg1, %3) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      "linalg.yield"(%arg2) : (f32) -> ()
    }) : (tensor<12x128x32xf32>, tensor<128x12x32xf32>) -> tensor<128x12x32xf32>
    "func.return"(%4) : (tensor<128x12x32xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{op_attrs = {iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>]}, ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      "transform.debug.emit_remark_at"(%0) <{message = "matched complex attr"}> : (!transform.any_op) -> ()
      "transform.test_consume_operand"(%0) : (!transform.any_op) -> ()
      %1 = "transform.structured.match"(%arg0) <{op_attrs = {iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>]}}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.num_associations"(%1) : (!transform.any_op) -> !transform.param<i64>
      "transform.debug.emit_param_as_remark"(%2) : (!transform.param<i64>) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "callee", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "foo"}> ({
  ^bb0(%arg1: index, %arg2: index, %arg3: index):
    "scf.for"(%arg1, %arg2, %arg3) ({
    ^bb0(%arg6: index):
      "func.call"() <{callee = @callee}> : () -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "scf.parallel"(%arg1, %arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
    ^bb0(%arg5: index):
      "func.call"() <{callee = @callee}> : () -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index) -> ()
    "scf.forall"(%arg2) <{operandSegmentSizes = array<i32: 0, 1, 0, 0>, staticLowerBound = array<i64: 0>, staticStep = array<i64: 1>, staticUpperBound = array<i64: -9223372036854775808>}> ({
    ^bb0(%arg4: index):
      "func.call"() <{callee = @callee}> : () -> ()
      "scf.forall.in_parallel"() ({
      ^bb0:
      }) : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{interface = 2 : i32}> : (!transform.any_op) -> !transform.any_op
      "transform.debug.emit_remark_at"(%0) <{message = "loop-like"}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

