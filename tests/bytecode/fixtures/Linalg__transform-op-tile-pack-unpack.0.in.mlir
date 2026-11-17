"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x256xf32>, tensor<4x8x32x32xf32>) -> tensor<4x8x32x32xf32>, sym_name = "NC_to_NCnc"}> ({
  ^bb0(%arg1: tensor<128x256xf32> loc("<stdin>":3:8), %arg2: tensor<4x8x32x32xf32> loc("<stdin>":3:36)):
    %2 = "linalg.pack"(%arg1, %arg2) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 32, 32>}> : (tensor<128x256xf32>, tensor<4x8x32x32xf32>) -> tensor<4x8x32x32xf32> loc("<stdin>":4:10)
    "func.return"(%2) : (tensor<4x8x32x32xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":9:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":10:12)
      %1:3 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 2, 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":11:14)
      "transform.yield"() : () -> () loc("<stdin>":12:7)
    }) : () -> () loc("<stdin>":8:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":7:3)
}) : () -> () loc("<stdin>":1:1)
