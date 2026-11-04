#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (3)>
#map2 = affine_map<(d0) -> (d0 + 2)>
#map3 = affine_map<(d0, d1) -> (d0, d1)>
#map4 = affine_map<(d0, d1) -> (d0 + 2, d1 + 3)>
#map5 = affine_map<(d0, d1) -> (d0 + 2, d1)>
#map6 = affine_map<(d0, d1) -> (d0, d1 + 3)>
#map7 = affine_map<(d0, d1) -> (2, d1)>
#map8 = affine_map<(d0, d1) -> (d0, 3)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : dense) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32xf32, #sparse>, tensor<4xf32>, tensor<32xf32>) -> tensor<32xf32>, sym_name = "mul_inv_dense1d"}> ({
  ^bb0(%arg29: tensor<32xf32, #sparse>, %arg30: tensor<4xf32>, %arg31: tensor<32xf32>):
    %15 = "linalg.generic"(%arg29, %arg30, %arg31) <{doc = "x(i) += a(i) * b(3)", indexing_maps = [#map, #map1, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg32: f32, %arg33: f32, %arg34: f32):
      %16 = "arith.mulf"(%arg32, %arg33) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %17 = "arith.addf"(%arg34, %16) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%17) : (f32) -> ()
    }) : (tensor<32xf32, #sparse>, tensor<4xf32>, tensor<32xf32>) -> tensor<32xf32>
    "func.return"(%15) : (tensor<32xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xf32, #sparse1>, tensor<4xf32, #sparse1>) -> tensor<32xf32, #sparse1>, sym_name = "mul_inv_enc_dense1d"}> ({
  ^bb0(%arg24: tensor<32xf32, #sparse1>, %arg25: tensor<4xf32, #sparse1>):
    %11 = "tensor.empty"() : () -> tensor<32xf32, #sparse1>
    %12 = "linalg.generic"(%arg24, %arg25, %11) <{doc = "x(i) += a(i) * b(3)", indexing_maps = [#map, #map1, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg26: f32, %arg27: f32, %arg28: f32):
      %13 = "arith.mulf"(%arg26, %arg27) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %14 = "arith.addf"(%arg28, %13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%14) : (f32) -> ()
    }) : (tensor<32xf32, #sparse1>, tensor<4xf32, #sparse1>, tensor<32xf32, #sparse1>) -> tensor<32xf32, #sparse1>
    "func.return"(%12) : (tensor<32xf32, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xi32, #sparse>, tensor<34xi32>, tensor<32xi32>) -> tensor<32xi32>, sym_name = "and_affine_dense1d"}> ({
  ^bb0(%arg18: tensor<32xi32, #sparse>, %arg19: tensor<34xi32>, %arg20: tensor<32xi32>):
    %9 = "linalg.generic"(%arg18, %arg19, %arg20) <{doc = "x(i) = a(i) & b(i+2)", indexing_maps = [#map, #map2, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg21: i32, %arg22: i32, %arg23: i32):
      %10 = "arith.andi"(%arg21, %arg22) : (i32, i32) -> i32
      "linalg.yield"(%10) : (i32) -> ()
    }) : (tensor<32xi32, #sparse>, tensor<34xi32>, tensor<32xi32>) -> tensor<32xi32>
    "func.return"(%9) : (tensor<32xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32x16xf64, #sparse2>, tensor<34x19xf64>, tensor<32x16xf64>) -> tensor<32x16xf64>, sym_name = "mul_affine_dense2d"}> ({
  ^bb0(%arg12: tensor<32x16xf64, #sparse2>, %arg13: tensor<34x19xf64>, %arg14: tensor<32x16xf64>):
    %6 = "linalg.generic"(%arg12, %arg13, %arg14) <{doc = "x(i,j) += a(i,j) * b(i+2,j+3)", indexing_maps = [#map3, #map4, #map3], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg15: f64, %arg16: f64, %arg17: f64):
      %7 = "arith.mulf"(%arg15, %arg16) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %8 = "arith.addf"(%arg17, %7) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%8) : (f64) -> ()
    }) : (tensor<32x16xf64, #sparse2>, tensor<34x19xf64>, tensor<32x16xf64>) -> tensor<32x16xf64>
    "func.return"(%6) : (tensor<32x16xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<34x16xf64, #sparse2>, tensor<32x19xf64, #sparse3>, tensor<32x16xf64>) -> tensor<32x16xf64>, sym_name = "mul_affine_dense_dim_2d"}> ({
  ^bb0(%arg6: tensor<34x16xf64, #sparse2>, %arg7: tensor<32x19xf64, #sparse3>, %arg8: tensor<32x16xf64>):
    %3 = "linalg.generic"(%arg6, %arg7, %arg8) <{doc = "x(i,j) += a(i+2,j) * b(i,j+3)", indexing_maps = [#map5, #map6, #map3], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg9: f64, %arg10: f64, %arg11: f64):
      %4 = "arith.mulf"(%arg9, %arg10) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %5 = "arith.addf"(%arg11, %4) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%5) : (f64) -> ()
    }) : (tensor<34x16xf64, #sparse2>, tensor<32x19xf64, #sparse3>, tensor<32x16xf64>) -> tensor<32x16xf64>
    "func.return"(%3) : (tensor<32x16xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<34x16xf64, #sparse2>, tensor<32x19xf64, #sparse3>, tensor<32x16xf64>) -> tensor<32x16xf64>, sym_name = "mul_const_affine_dense_dim_2d"}> ({
  ^bb0(%arg0: tensor<34x16xf64, #sparse2>, %arg1: tensor<32x19xf64, #sparse3>, %arg2: tensor<32x16xf64>):
    %0 = "linalg.generic"(%arg0, %arg1, %arg2) <{doc = "x(i,j) += a(2,j) * b(i,3)", indexing_maps = [#map7, #map8, #map3], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f64, %arg4: f64, %arg5: f64):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%2) : (f64) -> ()
    }) : (tensor<34x16xf64, #sparse2>, tensor<32x19xf64, #sparse3>, tensor<32x16xf64>) -> tensor<32x16xf64>
    "func.return"(%0) : (tensor<32x16xf64>) -> ()
  }) : () -> ()
}) : () -> ()

