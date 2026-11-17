"builtin.module"() ({
  "func.func"() <{function_type = (tensor<5xf32>, tensor<5xf32>) -> tensor<5xf32>, sym_name = "static_dims"}> ({
  ^bb0(%arg0: tensor<5xf32> loc("<stdin>":4:8), %arg1: tensor<5xf32> loc("<stdin>":4:30)):
    %0 = "tensor.empty"() : () -> tensor<5xf32> loc("<stdin>":5:10)
    %1 = "linalg.generic"(%arg0, %arg1, %0) <{indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":7:10), %arg3: f32 loc("<stdin>":7:22), %arg4: f32 loc("<stdin>":7:34)):
      %2 = "arith.addf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":8:12)
      "linalg.yield"(%2) : (f32) -> () loc("<stdin>":9:7)
    }) : (tensor<5xf32>, tensor<5xf32>, tensor<5xf32>) -> tensor<5xf32> loc("<stdin>":6:10)
    "func.return"(%1) : (tensor<5xf32>) -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
