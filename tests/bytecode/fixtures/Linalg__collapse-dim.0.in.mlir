"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x32x10x4096xf32>, tensor<2x32xf32>) -> tensor<2x32xf32>, sym_name = "collapse_reduction"}> ({
  ^bb0(%arg0: tensor<2x32x10x4096xf32> loc("<stdin>":5:8), %arg1: tensor<2x32xf32> loc("<stdin>":5:41)):
    %0 = "linalg.generic"(%arg0, %arg1) <{indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":7:10), %arg3: f32 loc("<stdin>":7:22)):
      %1 = "arith.addf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":8:12)
      "linalg.yield"(%1) : (f32) -> () loc("<stdin>":9:7)
    }) : (tensor<2x32x10x4096xf32>, tensor<2x32xf32>) -> tensor<2x32xf32> loc("<stdin>":6:10)
    "func.return"(%0) : (tensor<2x32xf32>) -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":4:3)
}) : () -> () loc("<stdin>":3:1)
