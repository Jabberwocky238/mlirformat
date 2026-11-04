#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x16xf32, #sparse>, tensor<f32>, f32, f32, tensor<32x16xf32>) -> tensor<32x16xf32>, sym_name = "mul"}> ({
  ^bb0(%arg0: tensor<32x16xf32, #sparse>, %arg1: tensor<f32>, %arg2: f32, %arg3: f32, %arg4: tensor<32x16xf32>):
    %0 = "arith.addf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %1 = "arith.constant"() <{value = 2.200000e+00 : f32}> : () -> f32
    %2 = "linalg.generic"(%arg0, %arg1, %arg2, %arg4) <{doc = "X(i,j) += A(i,j) * p * q * r * s * 2.2", indexing_maps = [#map, #map1, #map1, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg5: f32, %arg6: f32, %arg7: f32, %arg8: f32):
      %3 = "arith.mulf"(%arg5, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.mulf"(%3, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %5 = "arith.mulf"(%4, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %6 = "arith.mulf"(%5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %7 = "arith.mulf"(%6, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %8 = "arith.addf"(%7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%8) : (f32) -> ()
    }) : (tensor<32x16xf32, #sparse>, tensor<f32>, f32, tensor<32x16xf32>) -> tensor<32x16xf32>
    "func.return"(%2) : (tensor<32x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

