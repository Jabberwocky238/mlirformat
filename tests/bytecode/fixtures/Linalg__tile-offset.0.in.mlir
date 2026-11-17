"builtin.module"() ({
  "func.func"() <{function_type = (tensor<9xf32>) -> tensor<6xf32>, sym_name = "tile_offset"}> ({
  ^bb0(%arg1: tensor<9xf32> loc("<stdin>":5:8)):
    %2 = "tensor.empty"() : () -> tensor<6xf32> loc("<stdin>":6:10)
    %3 = "linalg.generic"(%arg1, %2) <{indexing_maps = [affine_map<(d0) -> (d0 + 3)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":8:10), %arg3: f32 loc("<stdin>":8:22)):
      "linalg.yield"(%arg2) : (f32) -> () loc("<stdin>":9:7)
    }) : (tensor<9xf32>, tensor<6xf32>) -> tensor<6xf32> loc("<stdin>":7:10)
    "func.return"(%3) : (tensor<6xf32>) -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":4:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":15:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":16:12)
      %1:2 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false>, static_sizes = array<i64: 3>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":17:14)
      "transform.yield"() : () -> () loc("<stdin>":18:7)
    }) : () -> () loc("<stdin>":14:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":13:3)
}) : () -> () loc("<stdin>":3:1)
