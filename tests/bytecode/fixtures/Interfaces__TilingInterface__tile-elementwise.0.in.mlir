"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x256xf32>, tensor<128x256xf32>, tensor<128x256xf32>) -> tensor<128x256xf32>, sym_name = "tile_elementwise"}> ({
  ^bb0(%arg1: tensor<128x256xf32> loc("<stdin>":4:8), %arg2: tensor<128x256xf32> loc("<stdin>":4:36), %arg3: tensor<128x256xf32> loc("<stdin>":4:64)):
    %2 = "linalg.elementwise"(%arg1, %arg2, %arg3) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], kind = #linalg.elementwise_kind<add>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32 loc("<stdin>":6:10), %arg5: f32 loc("<stdin>":6:22), %arg6: f32 loc("<stdin>":6:34)):
      %3 = "arith.addf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":7:12)
      "linalg.yield"(%3) : (f32) -> () loc("<stdin>":8:7)
    }) : (tensor<128x256xf32>, tensor<128x256xf32>, tensor<128x256xf32>) -> tensor<128x256xf32> loc("<stdin>":5:10)
    "func.return"(%2) : (tensor<128x256xf32>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":3:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":14:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.elementwise"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":15:12)
      %1:3 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 32, 64>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":16:14)
      "transform.yield"() : () -> () loc("<stdin>":17:7)
    }) : () -> () loc("<stdin>":13:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":12:3)
}) : () -> () loc("<stdin>":2:1)
