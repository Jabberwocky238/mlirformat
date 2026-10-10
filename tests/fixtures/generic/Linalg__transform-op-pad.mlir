#map = affine_map<()[s0] -> (-s0 + 12, 7)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<24x12xf32>, tensor<12x25xf32>, tensor<24x25xf32>, index, index, index) -> tensor<24x25xf32>, sym_name = "static_sizes_output_divisible"}> ({
  ^bb0(%arg1: tensor<24x12xf32>, %arg2: tensor<12x25xf32>, %arg3: tensor<24x25xf32>, %arg4: index, %arg5: index, %arg6: index):
    %3 = "affine.min"(%arg6) <{map = #map}> : (index) -> index
    %4 = "tensor.extract_slice"(%arg1, %arg4, %arg6, %3) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 4, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<24x12xf32>, index, index, index) -> tensor<4x?xf32>
    %5 = "tensor.extract_slice"(%arg2, %arg6, %arg5, %3) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, 5>, static_strides = array<i64: 1, 1>}> : (tensor<12x25xf32>, index, index, index) -> tensor<?x5xf32>
    %6 = "tensor.extract_slice"(%arg3, %arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 4, 5>, static_strides = array<i64: 1, 1>}> : (tensor<24x25xf32>, index, index) -> tensor<4x5xf32>
    %7 = "linalg.matmul"(%4, %5, %6) <{indexing_maps = [#map1, #map2, #map3], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: f32, %arg8: f32, %arg9: f32):
      %9 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %10 = "arith.addf"(%arg9, %9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%10) : (f32) -> ()
    }) : (tensor<4x?xf32>, tensor<?x5xf32>, tensor<4x5xf32>) -> tensor<4x5xf32>
    %8 = "tensor.insert_slice"(%7, %arg3, %arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 4, 5>, static_strides = array<i64: 1, 1>}> : (tensor<4x5xf32>, tensor<24x25xf32>, index, index) -> tensor<24x25xf32>
    "func.return"(%8) : (tensor<24x25xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.pad"(%0) <{copy_back_op = "bufferization.materialize_in_destination", nofold_flags = [1, 1, 0], padding_dimensions = [0, 1, 2], padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32], transpose_paddings = []}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.op<"bufferization.materialize_in_destination">)
      %2 = "transform.num_associations"(%1#2) : (!transform.op<"bufferization.materialize_in_destination">) -> !transform.param<i64>
      "transform.debug.emit_param_as_remark"(%2) : (!transform.param<i64>) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<()[s0] -> (-s0 + 12, 7)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<24x12xf32>, tensor<12x25xf32>, tensor<24x25xf32>, index, index, index) -> tensor<24x25xf32>, sym_name = "pad_to_multiple"}> ({
  ^bb0(%arg1: tensor<24x12xf32>, %arg2: tensor<12x25xf32>, %arg3: tensor<24x25xf32>, %arg4: index, %arg5: index, %arg6: index):
    %2 = "affine.min"(%arg6) <{map = #map}> : (index) -> index
    %3 = "tensor.extract_slice"(%arg1, %arg4, %arg6, %2) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 4, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<24x12xf32>, index, index, index) -> tensor<4x?xf32>
    %4 = "tensor.extract_slice"(%arg2, %arg6, %arg5, %2) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, 5>, static_strides = array<i64: 1, 1>}> : (tensor<12x25xf32>, index, index, index) -> tensor<?x5xf32>
    %5 = "tensor.extract_slice"(%arg3, %arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 4, 5>, static_strides = array<i64: 1, 1>}> : (tensor<24x25xf32>, index, index) -> tensor<4x5xf32>
    %6 = "linalg.matmul"(%3, %4, %5) <{indexing_maps = [#map1, #map2, #map3], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: f32, %arg8: f32, %arg9: f32):
      %8 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %9 = "arith.addf"(%arg9, %8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%9) : (f32) -> ()
    }) : (tensor<4x?xf32>, tensor<?x5xf32>, tensor<4x5xf32>) -> tensor<4x5xf32>
    %7 = "tensor.insert_slice"(%6, %arg3, %arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 4, 5>, static_strides = array<i64: 1, 1>}> : (tensor<4x5xf32>, tensor<24x25xf32>, index, index) -> tensor<24x25xf32>
    "func.return"(%7) : (tensor<24x25xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.pad"(%0) <{copy_back_op = "bufferization.materialize_in_destination", nofold_flags = [1, 1, 0], padding_dimensions = [0, 1, 2], padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32], static_pad_to_multiple_of = array<i64: 2, 2, 1>, transpose_paddings = []}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<()[s0] -> (-s0 + 12, 7)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<24x12xf32>, tensor<12x25xf32>, tensor<24x25xf32>, index, index, index) -> tensor<24x25xf32>, sym_name = "parametrized_pad_to_multiple"}> ({
  ^bb0(%arg1: tensor<24x12xf32>, %arg2: tensor<12x25xf32>, %arg3: tensor<24x25xf32>, %arg4: index, %arg5: index, %arg6: index):
    %3 = "affine.min"(%arg6) <{map = #map}> : (index) -> index
    %4 = "tensor.extract_slice"(%arg1, %arg4, %arg6, %3) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 4, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<24x12xf32>, index, index, index) -> tensor<4x?xf32>
    %5 = "tensor.extract_slice"(%arg2, %arg6, %arg5, %3) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, 5>, static_strides = array<i64: 1, 1>}> : (tensor<12x25xf32>, index, index, index) -> tensor<?x5xf32>
    %6 = "tensor.extract_slice"(%arg3, %arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 4, 5>, static_strides = array<i64: 1, 1>}> : (tensor<24x25xf32>, index, index) -> tensor<4x5xf32>
    %7 = "linalg.matmul"(%4, %5, %6) <{indexing_maps = [#map1, #map2, #map3], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: f32, %arg8: f32, %arg9: f32):
      %9 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %10 = "arith.addf"(%arg9, %9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%10) : (f32) -> ()
    }) : (tensor<4x?xf32>, tensor<?x5xf32>, tensor<4x5xf32>) -> tensor<4x5xf32>
    %8 = "tensor.insert_slice"(%7, %arg3, %arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 4, 5>, static_strides = array<i64: 1, 1>}> : (tensor<4x5xf32>, tensor<24x25xf32>, index, index) -> tensor<24x25xf32>
    "func.return"(%8) : (tensor<24x25xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.param.constant"() <{value = 2 : i64}> : () -> !transform.param<i64>
      %2:3 = "transform.structured.pad"(%0, %1) <{copy_back_op = "bufferization.materialize_in_destination", nofold_flags = [1, 1, 0], padding_dimensions = [0, 1, 2], padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32], static_pad_to_multiple_of = array<i64: -9223372036854775808, 2, 1>, transpose_paddings = []}> : (!transform.any_op, !transform.param<i64>) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<()[s0] -> (-s0 + 12, 7)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<24x12xf32>, tensor<12x25xf32>, tensor<24x25xf32>, index, index, index) -> tensor<24x25xf32>, sym_name = "static_sizes_output_divisible_on_empty_op"}> ({
  ^bb0(%arg1: tensor<24x12xf32>, %arg2: tensor<12x25xf32>, %arg3: tensor<24x25xf32>, %arg4: index, %arg5: index, %arg6: index):
    %2 = "affine.min"(%arg6) <{map = #map}> : (index) -> index
    %3 = "tensor.empty"(%2) : (index) -> tensor<4x?xf32>
    %4 = "tensor.empty"(%2) : (index) -> tensor<?x5xf32>
    %5 = "tensor.empty"() : () -> tensor<4x5xf32>
    %6 = "linalg.matmul"(%3, %4, %5) <{indexing_maps = [#map1, #map2, #map3], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: f32, %arg8: f32, %arg9: f32):
      %8 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %9 = "arith.addf"(%arg9, %8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%9) : (f32) -> ()
    }) : (tensor<4x?xf32>, tensor<?x5xf32>, tensor<4x5xf32>) -> tensor<4x5xf32>
    %7 = "tensor.insert_slice"(%6, %arg3, %arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 4, 5>, static_strides = array<i64: 1, 1>}> : (tensor<4x5xf32>, tensor<24x25xf32>, index, index) -> tensor<24x25xf32>
    "func.return"(%7) : (tensor<24x25xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.pad"(%0) <{copy_back_op = "bufferization.materialize_in_destination", nofold_flags = [1, 1, 0], padding_dimensions = [0, 1, 2], padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32], transpose_paddings = []}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<24x12xf32>, tensor<12x25xf32>, tensor<24x25xf32>) -> tensor<24x25xf32>, sym_name = "pad"}> ({
  ^bb0(%arg1: tensor<24x12xf32>, %arg2: tensor<12x25xf32>, %arg3: tensor<24x25xf32>):
    %2 = "linalg.matmul"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (tensor<24x12xf32>, tensor<12x25xf32>, tensor<24x25xf32>) -> tensor<24x25xf32>
    "func.return"(%2) : (tensor<24x25xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.pad"(%0) <{copy_back_op = "bufferization.materialize_in_destination", nofold_flags = [1, 1, 0], padding_dimensions = [0, 1, 2], padding_values = [0 : i32, 0.000000e+00 : f32, 0.000000e+00 : f32], transpose_paddings = []}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<24x12xf32>, tensor<12x25xf32>, tensor<24x25xf32>) -> tensor<24x25xf32>, sym_name = "pad"}> ({
  ^bb0(%arg1: tensor<24x12xf32>, %arg2: tensor<12x25xf32>, %arg3: tensor<24x25xf32>):
    %2 = "linalg.matmul"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (tensor<24x12xf32>, tensor<12x25xf32>, tensor<24x25xf32>) -> tensor<24x25xf32>
    "func.return"(%2) : (tensor<24x25xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.pad"(%0) <{copy_back_op = "bufferization.materialize_in_destination", nofold_flags = [1, 1, 0], padding_dimensions = [0, 1, 2], padding_values = ["{foo}", 0.000000e+00 : f32, 0.000000e+00 : f32], transpose_paddings = []}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<24x12xf32>, tensor<12x25xf32>, tensor<24x25xf32>) -> tensor<24x25xf32>, sym_name = "zero_pad_static"}> ({
  ^bb0(%arg1: tensor<24x12xf32>, %arg2: tensor<12x25xf32>, %arg3: tensor<24x25xf32>):
    %2 = "linalg.matmul"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (tensor<24x12xf32>, tensor<12x25xf32>, tensor<24x25xf32>) -> tensor<24x25xf32>
    "func.return"(%2) : (tensor<24x25xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.pad"(%0) <{copy_back_op = "bufferization.materialize_in_destination", nofold_flags = [1, 1, 0], padding_dimensions = [0, 1, 2], padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32], transpose_paddings = []}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x12xf32>, tensor<12x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "zero_pad_dynamic"}> ({
  ^bb0(%arg1: tensor<?x12xf32>, %arg2: tensor<12x?xf32>, %arg3: tensor<?x?xf32>):
    %2 = "linalg.matmul"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (tensor<?x12xf32>, tensor<12x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%2) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.pad"(%0) <{copy_back_op = "bufferization.materialize_in_destination", nofold_flags = [1, 1, 1], padding_dimensions = [2], padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32], transpose_paddings = []}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x12xf32>, tensor<12x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "negative_no_ub_estimate"}> ({
  ^bb0(%arg1: tensor<?x12xf32>, %arg2: tensor<12x?xf32>, %arg3: tensor<?x?xf32>):
    %2 = "linalg.matmul"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (tensor<?x12xf32>, tensor<12x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%2) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.pad"(%0) <{copy_back_op = "bufferization.materialize_in_destination", nofold_flags = [1, 1, 1], padding_dimensions = [1], padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32], transpose_paddings = []}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x12xf32>, tensor<12x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "use_prescribed_tensor_shapes"}> ({
  ^bb0(%arg1: tensor<?x12xf32>, %arg2: tensor<12x?xf32>, %arg3: tensor<?x?xf32>):
    %3 = "linalg.matmul"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %4 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %5 = "arith.addf"(%arg6, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<?x12xf32>, tensor<12x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%3) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.pad"(%0) <{copy_back_op = "bufferization.materialize_in_destination", nofold_flags = [], padding_dimensions = [1], padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32], static_pad_to_multiple_of = array<i64: 7>, transpose_paddings = [], use_prescribed_tensor_shapes}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %2 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%2) <{apply_cse, max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.canonicalization"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (-d0 + 2044, 16)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x2044xf32>, tensor<2044x128xf32>) -> tensor<128x128xf32>, sym_name = "outs_not_produced_by_empty_or_extract_slice"}> ({
  ^bb0(%arg1: tensor<128x2044xf32>, %arg2: tensor<2044x128xf32>):
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3 = "tensor.empty"() : () -> tensor<128x128xf32>
    %4 = "linalg.fill"(%2, %3) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg8: f32, %arg9: f32):
      "linalg.yield"(%arg8) : (f32) -> ()
    }) : (f32, tensor<128x128xf32>) -> tensor<128x128xf32>
    %5 = "arith.constant"() <{value = 0 : index}> : () -> index
    %6 = "arith.constant"() <{value = 16 : index}> : () -> index
    %7 = "arith.constant"() <{value = 2044 : index}> : () -> index
    %8 = "scf.for"(%5, %7, %6, %4) ({
    ^bb0(%arg3: index, %arg4: tensor<128x128xf32>):
      %9 = "affine.min"(%arg3) <{map = #map}> : (index) -> index
      %10 = "tensor.extract_slice"(%arg1, %arg3, %9) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 0, -9223372036854775808>, static_sizes = array<i64: 128, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<128x2044xf32>, index, index) -> tensor<128x?xf32>
      %11 = "tensor.extract_slice"(%arg2, %arg3, %9) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: -9223372036854775808, 128>, static_strides = array<i64: 1, 1>}> : (tensor<2044x128xf32>, index, index) -> tensor<?x128xf32>
      %12 = "linalg.matmul"(%10, %11, %arg4) <{indexing_maps = [#map1, #map2, #map3], operandSegmentSizes = array<i32: 2, 1>}> ({
      ^bb0(%arg5: f32, %arg6: f32, %arg7: f32):
        %13 = "arith.mulf"(%arg5, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        %14 = "arith.addf"(%arg7, %13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "linalg.yield"(%14) : (f32) -> ()
      }) : (tensor<128x?xf32>, tensor<?x128xf32>, tensor<128x128xf32>) -> tensor<128x128xf32>
      "scf.yield"(%12) : (tensor<128x128xf32>) -> ()
    }) : (index, index, index, tensor<128x128xf32>) -> tensor<128x128xf32>
    "func.return"(%8) : (tensor<128x128xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.pad"(%0) <{copy_back_op = "bufferization.materialize_in_destination", nofold_flags = [1, 1, 1], padding_dimensions = [0, 1, 2], padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32], transpose_paddings = []}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<()[s0] -> (-s0 + 12, 7)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<24x12xf32>, tensor<12x25xf32>, tensor<24x25xf32>, index, index, index) -> tensor<24x25xf32>, sym_name = "pack_everything"}> ({
  ^bb0(%arg1: tensor<24x12xf32>, %arg2: tensor<12x25xf32>, %arg3: tensor<24x25xf32>, %arg4: index, %arg5: index, %arg6: index):
    %2 = "affine.min"(%arg6) <{map = #map}> : (index) -> index
    %3 = "tensor.extract_slice"(%arg1, %arg4, %arg6, %2) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 4, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<24x12xf32>, index, index, index) -> tensor<4x?xf32>
    %4 = "tensor.extract_slice"(%arg2, %arg6, %arg5, %2) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, 5>, static_strides = array<i64: 1, 1>}> : (tensor<12x25xf32>, index, index, index) -> tensor<?x5xf32>
    %5 = "tensor.extract_slice"(%arg3, %arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 4, 5>, static_strides = array<i64: 1, 1>}> : (tensor<24x25xf32>, index, index) -> tensor<4x5xf32>
    %6 = "linalg.matmul"(%3, %4, %5) <{indexing_maps = [#map1, #map2, #map3], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: f32, %arg8: f32, %arg9: f32):
      %8 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %9 = "arith.addf"(%arg9, %8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%9) : (f32) -> ()
    }) : (tensor<4x?xf32>, tensor<?x5xf32>, tensor<4x5xf32>) -> tensor<4x5xf32>
    %7 = "tensor.insert_slice"(%6, %arg3, %arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 4, 5>, static_strides = array<i64: 1, 1>}> : (tensor<4x5xf32>, tensor<24x25xf32>, index, index) -> tensor<24x25xf32>
    "func.return"(%7) : (tensor<24x25xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.pad"(%0) <{copy_back_op = "bufferization.materialize_in_destination", nofold_flags = [1, 1, 1], padding_dimensions = [0, 1, 2], padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32], transpose_paddings = []}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "dyn_pad_tiling"}> ({
  ^bb0(%arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>, %arg3: tensor<?x?xf32>):
    %6 = "linalg.matmul"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %7 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %8 = "arith.addf"(%arg6, %7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%8) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%6) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.pad"(%0) <{copy_back_op = "bufferization.materialize_in_destination", nofold_flags = [], padding_dimensions = [2], padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32], static_pad_to_multiple_of = array<i64: 32>, transpose_paddings = [], use_prescribed_tensor_shapes}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %2:2 = "transform.structured.tile_using_for"(%1#0) <{scalable_sizes = array<i1: false, false, false>, static_sizes = array<i64: 0, 0, 32>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %3 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %4 = "transform.apply_registered_pass"(%3) <{options = {}, pass_name = "resolve-shaped-type-result-dims"}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%4) <{apply_cse, max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.canonicalization"() : () -> ()
      }) : (!transform.any_op) -> ()
      %5 = "transform.structured.match"(%arg0) <{ops = ["affine.min", "affine.max"]}> : (!transform.any_op) -> !transform.any_op
      "transform.affine.simplify_min_max_affine_ops"(%5) : (!transform.any_op) -> ()
      "transform.apply_patterns"(%4) <{apply_cse, max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.canonicalization"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

