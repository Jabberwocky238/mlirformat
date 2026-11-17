"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 4 : compressed, d0 mod 2 : dense, d1 mod 4 : dense) }>>) -> tensor<32x32xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 4 : compressed, d0 mod 2 : dense, d1 mod 4 : dense) }>>, sym_name = "mul"}> ({
  ^bb0(%arg0: tensor<32x32xf32> loc("<stdin>":6:8), %arg1: tensor<32x32xf32> loc("<stdin>":6:34), %arg2: tensor<32x32xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 4 : compressed, d0 mod 2 : dense, d1 mod 4 : dense) }>> loc("<stdin>":6:60)):
    %0 = "linalg.generic"(%arg0, %arg1, %arg2) <{doc = "X(i,j) *= A(i,j) * B(j,i)", indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1, d0)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":8:10), %arg4: f32 loc("<stdin>":8:22), %arg5: f32 loc("<stdin>":8:34)):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":9:12)
      %2 = "arith.mulf"(%1, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":10:12)
      "linalg.yield"(%2) : (f32) -> () loc("<stdin>":11:7)
    }) : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 4 : compressed, d0 mod 2 : dense, d1 mod 4 : dense) }>>) -> tensor<32x32xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 4 : compressed, d0 mod 2 : dense, d1 mod 4 : dense) }>> loc("<stdin>":7:10)
    "func.return"(%0) : (tensor<32x32xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 4 : compressed, d0 mod 2 : dense, d1 mod 4 : dense) }>>) -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":4:1)
