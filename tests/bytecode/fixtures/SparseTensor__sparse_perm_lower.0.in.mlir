"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : dense, d0 : dense, d1 : dense) }>>, tensor<f32>) -> tensor<f32>, sym_name = "sparse_dynamic_dims"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : dense, d0 : dense, d1 : dense) }>> loc("<stdin>":6:8), %arg1: tensor<f32> loc("<stdin>":6:43)):
    %0 = "linalg.generic"(%arg0, %arg1) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d2, d0, d1)>, affine_map<(d0, d1, d2) -> ()>], iterator_types = [#linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":8:10), %arg3: f32 loc("<stdin>":8:22)):
      %1 = "arith.addf"(%arg3, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":9:12)
      "linalg.yield"(%1) : (f32) -> () loc("<stdin>":10:7)
    }) : (tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : dense, d0 : dense, d1 : dense) }>>, tensor<f32>) -> tensor<f32> loc("<stdin>":7:10)
    "func.return"(%0) : (tensor<f32>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":4:1)
