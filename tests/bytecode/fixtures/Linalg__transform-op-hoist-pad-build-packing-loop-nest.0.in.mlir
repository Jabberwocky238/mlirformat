"builtin.module"() ({
  "func.func"() <{function_type = (tensor<24x12xf32>, tensor<12x25xf32>, tensor<24x25xf32>) -> tensor<24x25xf32>, sym_name = "pad_and_hoist_lhs"}> ({
  ^bb0(%arg1: tensor<24x12xf32> loc("<stdin>":6:8), %arg2: tensor<12x25xf32> loc("<stdin>":6:34), %arg3: tensor<24x25xf32> loc("<stdin>":6:60)):
    %5 = "linalg.matmul"(%arg1, %arg2, %arg3) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32 loc("<stdin>":8:10), %arg5: f32 loc("<stdin>":8:22), %arg6: f32 loc("<stdin>":8:34)):
      %6 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":9:12)
      %7 = "arith.addf"(%arg6, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":10:12)
      "linalg.yield"(%7) : (f32) -> () loc("<stdin>":11:7)
    }) : (tensor<24x12xf32>, tensor<12x25xf32>, tensor<24x25xf32>) -> tensor<24x25xf32> loc("<stdin>":7:10)
    "func.return"(%5) : (tensor<24x25xf32>) -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":5:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":17:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":18:12)
      %1:2 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false>, static_sizes = array<i64: 5>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":19:14)
      %2:3 = "transform.structured.pad"(%1#0) <{copy_back_op = "bufferization.materialize_in_destination", nofold_flags = [], padding_dimensions = [0, 1, 2], padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32], transpose_paddings = []}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":20:14)
      %3 = "transform.get_producer_of_operand"(%2#0) <{operand_number = 0 : i64}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":21:12)
      %4 = "transform.structured.hoist_pad.build_packing_loop_nest"(%3, %1#1) <{transpose = array<i64>}> : (!transform.any_op, !transform.any_op) -> !transform.any_op loc("<stdin>":22:12)
      "transform.yield"() : () -> () loc("<stdin>":23:7)
    }) : () -> () loc("<stdin>":16:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":15:3)
}) : () -> () loc("<stdin>":4:1)
