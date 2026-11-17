"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>, sym_name = "broadcast_first_dimension"}> ({
  ^bb0(%arg8: tensor<?x?xf32> loc("<stdin>":3:8), %arg9: tensor<?x?x?xf32> loc("<stdin>":3:32)):
    %2 = "linalg.broadcast"(%arg8, %arg9) <{dimensions = array<i64: 0>}> ({
    ^bb0(%arg10: f32 loc("<stdin>":5:10), %arg11: f32 loc("<stdin>":5:23)):
      "linalg.yield"(%arg10) : (f32) -> () loc("<stdin>":6:7)
    }) : (tensor<?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32> loc("<stdin>":4:10)
    "func.return"(%2) : (tensor<?x?x?xf32>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (tensor<3x5xf32>, tensor<3x4x5xf32>) -> tensor<3x4x5xf32>, sym_name = "broadcast_mid_dimension"}> ({
  ^bb0(%arg4: tensor<3x5xf32> loc("<stdin>":11:8), %arg5: tensor<3x4x5xf32> loc("<stdin>":11:32)):
    %1 = "linalg.broadcast"(%arg4, %arg5) <{dimensions = array<i64: 1>}> ({
    ^bb0(%arg6: f32 loc("<stdin>":13:10), %arg7: f32 loc("<stdin>":13:22)):
      "linalg.yield"(%arg6) : (f32) -> () loc("<stdin>":14:7)
    }) : (tensor<3x5xf32>, tensor<3x4x5xf32>) -> tensor<3x4x5xf32> loc("<stdin>":12:10)
    "func.return"(%1) : (tensor<3x4x5xf32>) -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":10:3)
  "func.func"() <{function_type = (tensor<4x5x7xf32>, tensor<3x4x5x6x7x8x9xf32>) -> tensor<3x4x5x6x7x8x9xf32>, sym_name = "broadcast_multiple_dimensions"}> ({
  ^bb0(%arg0: tensor<4x5x7xf32> loc("<stdin>":19:8), %arg1: tensor<3x4x5x6x7x8x9xf32> loc("<stdin>":19:34)):
    %0 = "linalg.broadcast"(%arg0, %arg1) <{dimensions = array<i64: 0, 3, 5, 6>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":21:10), %arg3: f32 loc("<stdin>":21:22)):
      "linalg.yield"(%arg2) : (f32) -> () loc("<stdin>":22:7)
    }) : (tensor<4x5x7xf32>, tensor<3x4x5x6x7x8x9xf32>) -> tensor<3x4x5x6x7x8x9xf32> loc("<stdin>":20:10)
    "func.return"(%0) : (tensor<3x4x5x6x7x8x9xf32>) -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":18:3)
}) : () -> () loc("<stdin>":1:1)
