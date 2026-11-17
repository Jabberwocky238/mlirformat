"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<f32>, f32, f32, tensor<32x16xf32>) -> tensor<32x16xf32>, sym_name = "mul"}> ({
  ^bb0(%arg0: tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":6:8), %arg1: tensor<f32> loc("<stdin>":6:43), %arg2: f32 loc("<stdin>":6:63), %arg3: f32 loc("<stdin>":6:75), %arg4: tensor<32x16xf32> loc("<stdin>":6:87)):
    %0 = "arith.addf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":7:10)
    %1 = "arith.constant"() <{value = 2.200000e+00 : f32}> : () -> f32 loc("<stdin>":8:10)
    %2 = "linalg.generic"(%arg0, %arg1, %arg2, %arg4) <{doc = "X(i,j) += A(i,j) * p * q * r * s * 2.2", indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> ()>, affine_map<(d0, d1) -> ()>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg5: f32 loc("<stdin>":10:10), %arg6: f32 loc("<stdin>":10:22), %arg7: f32 loc("<stdin>":10:34), %arg8: f32 loc("<stdin>":10:46)):
      %3 = "arith.mulf"(%arg5, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":11:12)
      %4 = "arith.mulf"(%3, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":12:12)
      %5 = "arith.mulf"(%4, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":13:12)
      %6 = "arith.mulf"(%5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":14:12)
      %7 = "arith.mulf"(%6, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":15:12)
      %8 = "arith.addf"(%7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":16:12)
      "linalg.yield"(%8) : (f32) -> () loc("<stdin>":17:7)
    }) : (tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<f32>, f32, tensor<32x16xf32>) -> tensor<32x16xf32> loc("<stdin>":9:10)
    "func.return"(%2) : (tensor<32x16xf32>) -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":4:1)
