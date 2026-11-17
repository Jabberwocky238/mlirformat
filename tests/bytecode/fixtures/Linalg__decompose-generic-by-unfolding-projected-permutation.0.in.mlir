"builtin.module"() ({
  "func.func"() <{function_type = (tensor<7x8x9xf32>, tensor<5x9x7x8x10xf32>, tensor<5x9x7x8x10xf32>) -> tensor<5x9x7x8x10xf32>, sym_name = "transpose_and_broadcast"}> ({
  ^bb0(%arg0: tensor<7x8x9xf32> loc("<stdin>":5:8), %arg1: tensor<5x9x7x8x10xf32> loc("<stdin>":5:34), %arg2: tensor<5x9x7x8x10xf32> loc("<stdin>":5:65)):
    %0 = "linalg.generic"(%arg0, %arg1, %arg2) <{indexing_maps = [affine_map<(d0, d1, d2, d3, d4) -> (d2, d3, d1)>, affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2, d3, d4)>, affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2, d3, d4)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":7:10), %arg4: f32 loc("<stdin>":7:22), %arg5: f32 loc("<stdin>":7:34)):
      %1 = "arith.divf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":8:12)
      "linalg.yield"(%1) : (f32) -> () loc("<stdin>":9:7)
    }) : (tensor<7x8x9xf32>, tensor<5x9x7x8x10xf32>, tensor<5x9x7x8x10xf32>) -> tensor<5x9x7x8x10xf32> loc("<stdin>":6:10)
    "func.return"(%0) : (tensor<5x9x7x8x10xf32>) -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":4:3)
}) : () -> () loc("<stdin>":3:1)
