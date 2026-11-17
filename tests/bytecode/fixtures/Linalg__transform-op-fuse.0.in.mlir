"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "fuse_unary"}> ({
  ^bb0(%arg1: tensor<?x?xf32> loc("<stdin>":3:8), %arg2: tensor<?x?xf32> loc("<stdin>":3:32)):
    %2 = "linalg.exp"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: f32 loc("<stdin>":5:10), %arg7: f32 loc("<stdin>":5:22)):
      %5 = "math.exp"(%arg6) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":6:12)
      "linalg.yield"(%5) : (f32) -> () loc("<stdin>":7:7)
    }) : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":4:10)
    %3 = "linalg.add"(%2, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":10:10), %arg4: f32 loc("<stdin>":10:22), %arg5: f32 loc("<stdin>":10:34)):
      %4 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":11:12)
      "linalg.yield"(%4) : (f32) -> () loc("<stdin>":12:7)
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":9:10)
    "func.return"(%3) : (tensor<?x?xf32>) -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":2:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":18:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.add"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":19:12)
      %1:3 = "transform.structured.fuse"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_tile_interchange = array<i64: 0, 1>, static_tile_sizes = array<i64: 32, 32>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":20:14)
      "transform.yield"() : () -> () loc("<stdin>":21:7)
    }) : () -> () loc("<stdin>":17:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":16:3)
}) : () -> () loc("<stdin>":1:1)
