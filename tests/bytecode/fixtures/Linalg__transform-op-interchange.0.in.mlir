"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "interchange_generic"}> ({
  ^bb0(%arg1: tensor<?x?xf32> loc("<stdin>":4:8), %arg2: tensor<?x?xf32> loc("<stdin>":4:32)):
    %2 = "linalg.generic"(%arg1, %arg2) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":6:10), %arg4: f32 loc("<stdin>":6:22)):
      %3 = "math.exp"(%arg3) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":7:12)
      "linalg.yield"(%3) : (f32) -> () loc("<stdin>":8:7)
    }) : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":5:10)
    "func.return"(%2) : (tensor<?x?xf32>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":3:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":14:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":15:12)
      %1 = "transform.structured.interchange"(%0) <{iterator_interchange = array<i64: 1, 0>}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":16:12)
      "transform.yield"() : () -> () loc("<stdin>":17:7)
    }) : () -> () loc("<stdin>":13:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":12:3)
}) : () -> () loc("<stdin>":2:1)
