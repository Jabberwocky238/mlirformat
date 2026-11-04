#map = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 32, crdWidth = 32 }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1024xf32, #sparse>, tensor<1024xf32>, tensor<1024xf32>) -> tensor<1024xf32>, sym_name = "mul_s"}> ({
  ^bb0(%arg0: tensor<1024xf32, #sparse>, %arg1: tensor<1024xf32>, %arg2: tensor<1024xf32>):
    %0 = "linalg.generic"(%arg0, %arg1, %arg2) <{doc = "x(i) = a(i) * b(i)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (tensor<1024xf32, #sparse>, tensor<1024xf32>, tensor<1024xf32>) -> tensor<1024xf32>
    "func.return"(%0) : (tensor<1024xf32>) -> ()
  }) : () -> ()
}) : () -> ()

