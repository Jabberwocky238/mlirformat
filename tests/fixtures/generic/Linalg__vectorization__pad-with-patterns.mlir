"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x?x2xf32>, f32) -> tensor<2x3x4xf32>, sym_name = "pad_static"}> ({
  ^bb0(%arg1: tensor<2x?x2xf32>, %arg2: f32):
    %3 = "tensor.pad"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 0, 1, 0>, static_low = array<i64: 0, 0, 2>}> ({
    ^bb0(%arg3: index, %arg4: index, %arg5: index):
      "tensor.yield"(%arg2) : (f32) -> ()
    }) : (tensor<2x?x2xf32>) -> tensor<2x3x4xf32>
    "func.return"(%3) : (tensor<2x3x4xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.pad"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) <{vectorize_padding}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x5x2xf32>, f32) -> tensor<2x6x4xf32>, sym_name = "pad_static_source"}> ({
  ^bb0(%arg1: tensor<2x5x2xf32>, %arg2: f32):
    %3 = "tensor.pad"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 0, 1, 0>, static_low = array<i64: 0, 0, 2>}> ({
    ^bb0(%arg3: index, %arg4: index, %arg5: index):
      "tensor.yield"(%arg2) : (f32) -> ()
    }) : (tensor<2x5x2xf32>) -> tensor<2x6x4xf32>
    "func.return"(%3) : (tensor<2x6x4xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.pad"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) <{vectorize_padding}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x2x2x?xf32>, index, index, f32) -> tensor<6x?x?x?xf32>, sym_name = "pad_static_dynamic"}> ({
  ^bb0(%arg1: tensor<1x2x2x?xf32>, %arg2: index, %arg3: index, %arg4: f32):
    %3 = "tensor.pad"(%arg1, %arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 1>, static_high = array<i64: 3, 3, -9223372036854775808, 2>, static_low = array<i64: 2, -9223372036854775808, 3, 3>}> ({
    ^bb0(%arg5: index, %arg6: index, %arg7: index, %arg8: index):
      "tensor.yield"(%arg4) : (f32) -> ()
    }) : (tensor<1x2x2x?xf32>, index, index) -> tensor<6x?x?x?xf32>
    "func.return"(%3) : (tensor<6x?x?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.pad"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) <{vectorize_padding}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x5x2xcomplex<f32>>, complex<f32>) -> tensor<2x6x4xcomplex<f32>>, sym_name = "pad_static_complex"}> ({
  ^bb0(%arg1: tensor<2x5x2xcomplex<f32>>, %arg2: complex<f32>):
    %3 = "tensor.pad"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 0, 1, 0>, static_low = array<i64: 0, 0, 2>}> ({
    ^bb0(%arg3: index, %arg4: index, %arg5: index):
      "tensor.yield"(%arg2) : (complex<f32>) -> ()
    }) : (tensor<2x5x2xcomplex<f32>>) -> tensor<2x6x4xcomplex<f32>>
    "func.return"(%3) : (tensor<2x6x4xcomplex<f32>>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.pad"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) <{vectorize_padding}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<12x13xf32>, sym_name = "make_vector", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x5x6xf32>) -> tensor<1x12x13xf32>, sym_name = "pad_and_insert_slice_dest"}> ({
  ^bb0(%arg1: tensor<1x5x6xf32>):
    %3 = "arith.constant"() <{value = 5.000000e+00 : f32}> : () -> f32
    %4 = "tensor.pad"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 0, 7, 7>, static_low = array<i64: 0, 0, 0>}> ({
    ^bb0(%arg2: index, %arg3: index, %arg4: index):
      "tensor.yield"(%3) : (f32) -> ()
    }) : (tensor<1x5x6xf32>) -> tensor<1x12x13xf32>
    %5 = "func.call"() <{callee = @make_vector}> : () -> tensor<12x13xf32>
    %6 = "tensor.insert_slice"(%5, %4) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0>, static_sizes = array<i64: 1, 12, 13>, static_strides = array<i64: 1, 1, 1>}> : (tensor<12x13xf32>, tensor<1x12x13xf32>) -> tensor<1x12x13xf32>
    "func.return"(%6) : (tensor<1x12x13xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.pad"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) <{vectorize_padding}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<5x6xf32>) -> tensor<12x13xf32>, sym_name = "pad_tensor_non_const_pad_value"}> ({
  ^bb0(%arg1: tensor<5x6xf32>):
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 5.000000e+00 : f32}> : () -> f32
    %5 = "tensor.pad"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 4, 3>, static_low = array<i64: 3, 4>}> ({
    ^bb0(%arg2: index, %arg3: index):
      %6 = "arith.index_cast"(%arg2) : (index) -> i32
      %7 = "arith.index_cast"(%arg3) : (index) -> i32
      %8 = "arith.sitofp"(%6) : (i32) -> f32
      %9 = "arith.sitofp"(%7) : (i32) -> f32
      %10 = "arith.mulf"(%8, %9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "tensor.yield"(%10) : (f32) -> ()
    }) : (tensor<5x6xf32>) -> tensor<12x13xf32>
    "func.return"(%5) : (tensor<12x13xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.pad"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) <{vectorize_padding}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x2x2x?xf32>, index, index, f32) -> tensor<6x?x?x?xf32>, sym_name = "test_masked_pad_static_dynamic"}> ({
  ^bb0(%arg1: tensor<1x2x2x?xf32>, %arg2: index, %arg3: index, %arg4: f32):
    %3 = "tensor.pad"(%arg1, %arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 1>, static_high = array<i64: 3, 3, -9223372036854775808, 2>, static_low = array<i64: 2, -9223372036854775808, 3, 3>}> ({
    ^bb0(%arg5: index, %arg6: index, %arg7: index, %arg8: index):
      "tensor.yield"(%arg4) : (f32) -> ()
    }) : (tensor<1x2x2x?xf32>, index, index) -> tensor<6x?x?x?xf32>
    "func.return"(%3) : (tensor<6x?x?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.pad"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) <{vectorize_padding}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

