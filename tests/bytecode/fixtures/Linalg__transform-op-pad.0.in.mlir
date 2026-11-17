"builtin.module"() ({
  "func.func"() <{function_type = (tensor<24x12xf32>, tensor<12x25xf32>, tensor<24x25xf32>, index, index, index) -> tensor<24x25xf32>, sym_name = "pad_to_multiple"}> ({
  ^bb0(%arg1: tensor<24x12xf32> loc("<stdin>":7:8), %arg2: tensor<12x25xf32> loc("<stdin>":7:34), %arg3: tensor<24x25xf32> loc("<stdin>":7:60), %arg4: index loc("<stdin>":7:86), %arg5: index loc("<stdin>":7:100), %arg6: index loc("<stdin>":7:114)):
    %2 = "affine.min"(%arg6) <{map = affine_map<()[s0] -> (-s0 + 12, 7)>}> : (index) -> index loc("<stdin>":8:10)
    %3 = "tensor.extract_slice"(%arg1, %arg4, %arg6, %2) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 4, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<24x12xf32>, index, index, index) -> tensor<4x?xf32> loc("<stdin>":9:10)
    %4 = "tensor.extract_slice"(%arg2, %arg6, %arg5, %2) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, 5>, static_strides = array<i64: 1, 1>}> : (tensor<12x25xf32>, index, index, index) -> tensor<?x5xf32> loc("<stdin>":10:10)
    %5 = "tensor.extract_slice"(%arg3, %arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 4, 5>, static_strides = array<i64: 1, 1>}> : (tensor<24x25xf32>, index, index) -> tensor<4x5xf32> loc("<stdin>":11:10)
    %6 = "linalg.matmul"(%3, %4, %5) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: f32 loc("<stdin>":13:10), %arg8: f32 loc("<stdin>":13:22), %arg9: f32 loc("<stdin>":13:34)):
      %8 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":14:12)
      %9 = "arith.addf"(%arg9, %8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":15:12)
      "linalg.yield"(%9) : (f32) -> () loc("<stdin>":16:7)
    }) : (tensor<4x?xf32>, tensor<?x5xf32>, tensor<4x5xf32>) -> tensor<4x5xf32> loc("<stdin>":12:10)
    %7 = "tensor.insert_slice"(%6, %arg3, %arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 4, 5>, static_strides = array<i64: 1, 1>}> : (tensor<4x5xf32>, tensor<24x25xf32>, index, index) -> tensor<24x25xf32> loc("<stdin>":18:10)
    "func.return"(%7) : (tensor<24x25xf32>) -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":6:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":23:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":24:12)
      %1:3 = "transform.structured.pad"(%0) <{copy_back_op = "bufferization.materialize_in_destination", nofold_flags = [1, 1, 0], padding_dimensions = [0, 1, 2], padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32], static_pad_to_multiple_of = array<i64: 2, 2, 1>, transpose_paddings = []}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":25:14)
      "transform.yield"() : () -> () loc("<stdin>":26:7)
    }) : () -> () loc("<stdin>":22:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":21:3)
}) : () -> () loc("<stdin>":5:1)
