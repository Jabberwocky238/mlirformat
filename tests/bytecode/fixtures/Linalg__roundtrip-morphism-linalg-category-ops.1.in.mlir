"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "unary_ops_non_identity"}> ({
  ^bb0(%arg0: tensor<?xf32> loc("<stdin>":6:8), %arg1: tensor<?x?xf32> loc("<stdin>":6:30)):
    %0 = "linalg.elementwise"(%arg0, %arg1) <{indexing_maps = [affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d1, d0)>], kind = #linalg.elementwise_kind<log>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":8:10), %arg3: f32 loc("<stdin>":8:22)):
      %1 = "math.log"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":9:12)
      "linalg.yield"(%1) : (f32) -> () loc("<stdin>":10:7)
    }) : (tensor<?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":7:10)
    "func.return"(%0) : (tensor<?x?xf32>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":4:1)
