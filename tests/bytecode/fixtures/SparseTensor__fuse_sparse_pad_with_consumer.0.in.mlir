"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x4xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<8x8xf32>) -> tensor<8x8xf32>, sym_name = "padded_mul"}> ({
  ^bb0(%arg0: tensor<4x4xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":5:8), %arg1: tensor<8x8xf32> loc("<stdin>":5:41)):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":6:10)
    %1 = "tensor.empty"() : () -> tensor<8x8xf32> loc("<stdin>":7:10)
    %2 = "linalg.fill"(%0, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg7: f32 loc("<stdin>":9:10), %arg8: f32 loc("<stdin>":9:22)):
      "linalg.yield"(%arg7) : (f32) -> () loc("<stdin>":10:7)
    }) : (f32, tensor<8x8xf32>) -> tensor<8x8xf32> loc("<stdin>":8:10)
    %3 = "tensor.pad"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 2, 2>, static_low = array<i64: 2, 2>}> ({
    ^bb0(%arg5: index loc("<stdin>":13:10), %arg6: index loc("<stdin>":13:24)):
      "tensor.yield"(%0) : (f32) -> () loc("<stdin>":14:7)
    }) : (tensor<4x4xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<8x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":12:10)
    %4 = "linalg.generic"(%3, %arg1, %2) <{doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":17:10), %arg3: f32 loc("<stdin>":17:22), %arg4: f32 loc("<stdin>":17:34)):
      %5 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":18:12)
      "linalg.yield"(%5) : (f32) -> () loc("<stdin>":19:7)
    }) : (tensor<8x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<8x8xf32>, tensor<8x8xf32>) -> tensor<8x8xf32> loc("<stdin>":16:10)
    "func.return"(%4) : (tensor<8x8xf32>) -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":4:3)
}) : () -> () loc("<stdin>":3:1)
