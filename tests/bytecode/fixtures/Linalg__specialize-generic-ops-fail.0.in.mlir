"builtin.module"() ({
  "func.func"() <{function_type = (tensor<7x8xf32>, tensor<8x7x9xf32>) -> tensor<8x7x9xf32>, sym_name = "transpose_and_broadcast"}> ({
  ^bb0(%arg0: tensor<7x8xf32> loc("<stdin>":5:8), %arg1: tensor<8x7x9xf32> loc("<stdin>":5:32)):
    %0 = "linalg.generic"(%arg0, %arg1) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d1, d0)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":7:10), %arg3: f32 loc("<stdin>":7:22)):
      "linalg.yield"(%arg2) : (f32) -> () loc("<stdin>":8:7)
    }) : (tensor<7x8xf32>, tensor<8x7x9xf32>) -> tensor<8x7x9xf32> loc("<stdin>":6:10)
    "func.return"(%0) : (tensor<8x7x9xf32>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":4:3)
}) : () -> () loc("<stdin>":3:1)
