#map = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x4xf32, #sparse>, tensor<8x8xf32>) -> tensor<8x8xf32>, sym_name = "padded_mul"}> ({
  ^bb0(%arg0: tensor<4x4xf32, #sparse>, %arg1: tensor<8x8xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "tensor.empty"() : () -> tensor<8x8xf32>
    %2 = "linalg.fill"(%0, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg7: f32, %arg8: f32):
      "linalg.yield"(%arg7) : (f32) -> ()
    }) : (f32, tensor<8x8xf32>) -> tensor<8x8xf32>
    %3 = "tensor.pad"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 2, 2>, static_low = array<i64: 2, 2>}> ({
    ^bb0(%arg5: index, %arg6: index):
      "tensor.yield"(%0) : (f32) -> ()
    }) : (tensor<4x4xf32, #sparse>) -> tensor<8x8xf32, #sparse>
    %4 = "linalg.generic"(%3, %arg1, %2) <{doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %5 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<8x8xf32, #sparse>, tensor<8x8xf32>, tensor<8x8xf32>) -> tensor<8x8xf32>
    "func.return"(%4) : (tensor<8x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

