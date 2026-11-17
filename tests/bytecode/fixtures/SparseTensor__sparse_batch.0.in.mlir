"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x4x2xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : batch, d1 : dense, d2 : compressed) }>>) -> tensor<8x4x2xf32>, sym_name = "main"}> ({
  ^bb0(%arg0: tensor<8x4x2xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : batch, d1 : dense, d2 : compressed) }>> loc("<stdin>":5:8)):
    %0 = "tensor.empty"() : () -> tensor<8x4x2xf32> loc("<stdin>":6:10)
    %1 = "linalg.generic"(%arg0, %0) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32 loc("<stdin>":8:10), %arg2: f32 loc("<stdin>":8:22)):
      %2 = "arith.negf"(%arg1) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":9:12)
      "linalg.yield"(%2) : (f32) -> () loc("<stdin>":10:7)
    }) : (tensor<8x4x2xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : batch, d1 : dense, d2 : compressed) }>>, tensor<8x4x2xf32>) -> tensor<8x4x2xf32> loc("<stdin>":7:10)
    "func.return"(%1) : (tensor<8x4x2xf32>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":4:3)
}) : () -> () loc("<stdin>":3:1)
