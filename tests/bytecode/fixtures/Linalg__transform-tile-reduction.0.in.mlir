"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?xf32>) -> tensor<?xf32>, sym_name = "reduction_tile"}> ({
  ^bb0(%arg1: tensor<?x?xf32> loc("<stdin>":5:8), %arg2: tensor<?xf32> loc("<stdin>":5:32)):
    %2 = "linalg.generic"(%arg1, %arg2) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":7:10), %arg4: f32 loc("<stdin>":7:22)):
      %3 = "arith.mulf"(%arg3, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":8:12)
      %4 = "arith.addf"(%3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":9:12)
      "linalg.yield"(%4) : (f32) -> () loc("<stdin>":10:7)
    }) : (tensor<?x?xf32>, tensor<?xf32>) -> tensor<?xf32> loc("<stdin>":6:10)
    "func.return"(%2) : (tensor<?xf32>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":4:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":16:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":17:12)
      %1:4 = "transform.structured.tile_reduction_using_for"(%0) <{reduction_dims = [], tile_sizes = [0, 5]}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":18:14)
      "transform.yield"() : () -> () loc("<stdin>":19:7)
    }) : () -> () loc("<stdin>":15:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":14:3)
}) : () -> () loc("<stdin>":3:1)
