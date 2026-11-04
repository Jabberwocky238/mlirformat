#map = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<10xi32, #sparse>, tensor<10xf32>) -> tensor<10xf32>, sym_name = "allout_inplace"}> ({
  ^bb0(%arg7: tensor<10xi32, #sparse>, %arg8: tensor<10xf32>):
    %5 = "linalg.generic"(%arg7, %arg8) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg9: i32, %arg10: f32):
      %6 = "arith.sitofp"(%arg9) : (i32) -> f32
      "linalg.yield"(%6) : (f32) -> ()
    }) : (tensor<10xi32, #sparse>, tensor<10xf32>) -> tensor<10xf32>
    "func.return"(%5) : (tensor<10xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<10xi32, #sparse>) -> tensor<10xf32>, sym_name = "allout_materialize"}> ({
  ^bb0(%arg4: tensor<10xi32, #sparse>):
    %2 = "tensor.empty"() : () -> tensor<10xf32>
    %3 = "linalg.generic"(%arg4, %2) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg5: i32, %arg6: f32):
      %4 = "arith.sitofp"(%arg5) : (i32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (tensor<10xi32, #sparse>, tensor<10xf32>) -> tensor<10xf32>
    "func.return"(%3) : (tensor<10xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<10xf32, #sparse>, tensor<10xf32>) -> tensor<10xf32>, sym_name = "update_inplace"}> ({
  ^bb0(%arg0: tensor<10xf32, #sparse>, %arg1: tensor<10xf32>):
    %0 = "linalg.generic"(%arg0, %arg1) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %1 = "arith.addf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (tensor<10xf32, #sparse>, tensor<10xf32>) -> tensor<10xf32>
    "func.return"(%0) : (tensor<10xf32>) -> ()
  }) : () -> ()
}) : () -> ()

