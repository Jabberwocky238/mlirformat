"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1x42xf32>) -> tensor<1x1x42xf32>, sym_name = "drop_outermost_unit_dims"}> ({
  ^bb0(%arg0: tensor<1x1x42xf32> loc("<stdin>":4:8)):
    %0 = "tensor.empty"() : () -> tensor<1x1x42xf32> loc("<stdin>":5:10)
    %1 = "linalg.generic"(%arg0, %0) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32 loc("<stdin>":7:10), %arg2: f32 loc("<stdin>":7:22)):
      %2 = "arith.addf"(%arg1, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":8:12)
      "linalg.yield"(%2) : (f32) -> () loc("<stdin>":9:7)
    }) : (tensor<1x1x42xf32>, tensor<1x1x42xf32>) -> tensor<1x1x42xf32> loc("<stdin>":6:10)
    "func.return"(%1) : (tensor<1x1x42xf32>) -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
