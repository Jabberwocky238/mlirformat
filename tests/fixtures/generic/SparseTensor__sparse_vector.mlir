#map = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : dense) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1024xf32, #sparse>, f32, tensor<1024xf32>) -> tensor<1024xf32>, sym_name = "scale_d"}> ({
  ^bb0(%arg0: tensor<1024xf32, #sparse>, %arg1: f32, %arg2: tensor<1024xf32>):
    %0 = "linalg.generic"(%arg0, %arg2) <{doc = "x(i) = a(i) * b", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      %1 = "arith.mulf"(%arg3, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (tensor<1024xf32, #sparse>, tensor<1024xf32>) -> tensor<1024xf32>
    "func.return"(%0) : (tensor<1024xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
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

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : dense) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1024xf32, #sparse>, tensor<1024xf32>, tensor<f32>) -> tensor<f32>, sym_name = "reduction_d"}> ({
  ^bb0(%arg0: tensor<1024xf32, #sparse>, %arg1: tensor<1024xf32>, %arg2: tensor<f32>):
    %0 = "linalg.generic"(%arg0, %arg1, %arg2) <{doc = "x += a(i) * b(i)", indexing_maps = [#map, #map, #map1], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<1024xf32, #sparse>, tensor<1024xf32>, tensor<f32>) -> tensor<f32>
    "func.return"(%0) : (tensor<f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<512x1024xf32, #sparse>, tensor<512x1024xf32>, tensor<512x1024xf32>) -> tensor<512x1024xf32>, sym_name = "mul_ds"}> ({
  ^bb0(%arg0: tensor<512x1024xf32, #sparse>, %arg1: tensor<512x1024xf32>, %arg2: tensor<512x1024xf32>):
    %0 = "linalg.generic"(%arg0, %arg1, %arg2) <{doc = "X(i,j) = A(i,j) * B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (tensor<512x1024xf32, #sparse>, tensor<512x1024xf32>, tensor<512x1024xf32>) -> tensor<512x1024xf32>
    "func.return"(%0) : (tensor<512x1024xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0 + 1, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x64xf64, #sparse>, tensor<33x64xf64>) -> tensor<33x64xf64>, sym_name = "add_dense"}> ({
  ^bb0(%arg0: tensor<32x64xf64, #sparse>, %arg1: tensor<33x64xf64>):
    %0 = "linalg.generic"(%arg0, %arg1) <{doc = "X(i+1,j) += A(i,j)", indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f64, %arg3: f64):
      %1 = "arith.addf"(%arg3, %arg2) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%1) : (f64) -> ()
    }) : (tensor<32x64xf64, #sparse>, tensor<33x64xf64>) -> tensor<33x64xf64>
    "func.return"(%0) : (tensor<33x64xf64>) -> ()
  }) : () -> ()
}) : () -> ()

