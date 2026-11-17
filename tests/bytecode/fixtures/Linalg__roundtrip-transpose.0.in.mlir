"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x64xf32>, tensor<64x16xf32>) -> tensor<64x16xf32>, sym_name = "transpose2D"}> ({
  ^bb0(%arg4: tensor<16x64xf32> loc("<stdin>":3:8), %arg5: tensor<64x16xf32> loc("<stdin>":3:34)):
    %1 = "linalg.transpose"(%arg4, %arg5) <{permutation = array<i64: 1, 0>}> ({
    ^bb0(%arg6: f32 loc("<stdin>":5:10), %arg7: f32 loc("<stdin>":5:22)):
      "linalg.yield"(%arg6) : (f32) -> () loc("<stdin>":6:7)
    }) : (tensor<16x64xf32>, tensor<64x16xf32>) -> tensor<64x16xf32> loc("<stdin>":4:10)
    "func.return"(%1) : (tensor<64x16xf32>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (tensor<7x8x9xf32>, tensor<9x7x8xf32>) -> tensor<9x7x8xf32>, sym_name = "transpose3D"}> ({
  ^bb0(%arg0: tensor<7x8x9xf32> loc("<stdin>":11:8), %arg1: tensor<9x7x8xf32> loc("<stdin>":11:34)):
    %0 = "linalg.transpose"(%arg0, %arg1) <{permutation = array<i64: 2, 0, 1>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":13:10), %arg3: f32 loc("<stdin>":13:22)):
      "linalg.yield"(%arg2) : (f32) -> () loc("<stdin>":14:7)
    }) : (tensor<7x8x9xf32>, tensor<9x7x8xf32>) -> tensor<9x7x8xf32> loc("<stdin>":12:10)
    "func.return"(%0) : (tensor<9x7x8xf32>) -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":10:3)
}) : () -> () loc("<stdin>":1:1)
