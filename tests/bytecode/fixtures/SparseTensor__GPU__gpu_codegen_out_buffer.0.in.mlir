"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x32xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<32x32xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<32x32xf32>, sym_name = "tensor_add"}> ({
  ^bb0(%arg0: tensor<32x32xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":5:8), %arg1: tensor<32x32xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":5:43)):
    %0 = "tensor.empty"() : () -> tensor<32x32xf32> loc("<stdin>":6:10)
    %1 = "linalg.generic"(%arg0, %arg1, %0) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":8:10), %arg3: f32 loc("<stdin>":8:22), %arg4: f32 loc("<stdin>":8:34)):
      %2 = "arith.addf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":9:12)
      "linalg.yield"(%2) : (f32) -> () loc("<stdin>":10:7)
    }) : (tensor<32x32xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<32x32xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<32x32xf32>) -> tensor<32x32xf32> loc("<stdin>":7:10)
    "func.return"(%1) : (tensor<32x32xf32>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":4:3)
}) : () -> () loc("<stdin>":3:1)
