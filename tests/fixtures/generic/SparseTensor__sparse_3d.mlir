#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d2, d1)>
#map3 = affine_map<(d0, d1, d2, d3) -> (d3, d1)>
#map4 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
#map5 = affine_map<(d0, d1, d2) -> ()>
#map6 = affine_map<(d0, d1, d2) -> (d0)>
#map7 = affine_map<(d0, d1, d2) -> (d1)>
#map8 = affine_map<(d0, d1, d2) -> (d2)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : dense, d2 : dense) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : dense, d2 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : compressed, d2 : dense) }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : compressed, d2 : compressed) }>
#sparse4 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : dense, d2 : dense) }>
#sparse5 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : dense, d2 : compressed) }>
#sparse6 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : dense) }>
#sparse7 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>
#sparse8 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : dense) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x16x8xf32, #sparse>, tensor<32x16x8xf32>, tensor<32x16x8xf32>) -> tensor<32x16x8xf32>, sym_name = "add_ddd"}> ({
  ^bb0(%arg116: tensor<32x16x8xf32, #sparse>, %arg117: tensor<32x16x8xf32>, %arg118: tensor<32x16x8xf32>):
    %42 = "linalg.generic"(%arg116, %arg117, %arg118) <{doc = "X(i,j,k) = A(i,j,k) OP B(i,j,k)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg119: f32, %arg120: f32, %arg121: f32):
      %43 = "arith.addf"(%arg119, %arg120) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%43) : (f32) -> ()
    }) : (tensor<32x16x8xf32, #sparse>, tensor<32x16x8xf32>, tensor<32x16x8xf32>) -> tensor<32x16x8xf32>
    "func.return"(%42) : (tensor<32x16x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32x16x8xf32, #sparse>, tensor<32x16x8xf32>, tensor<32x16x8xf32>) -> tensor<32x16x8xf32>, sym_name = "mul_ddd"}> ({
  ^bb0(%arg110: tensor<32x16x8xf32, #sparse>, %arg111: tensor<32x16x8xf32>, %arg112: tensor<32x16x8xf32>):
    %40 = "linalg.generic"(%arg110, %arg111, %arg112) <{doc = "X(i,j,k) = A(i,j,k) OP B(i,j,k)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg113: f32, %arg114: f32, %arg115: f32):
      %41 = "arith.mulf"(%arg113, %arg114) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%41) : (f32) -> ()
    }) : (tensor<32x16x8xf32, #sparse>, tensor<32x16x8xf32>, tensor<32x16x8xf32>) -> tensor<32x16x8xf32>
    "func.return"(%40) : (tensor<32x16x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32x16x8xf32, #sparse1>, tensor<32x16x8xf32>, tensor<32x16x8xf32>) -> tensor<32x16x8xf32>, sym_name = "add_dds"}> ({
  ^bb0(%arg104: tensor<32x16x8xf32, #sparse1>, %arg105: tensor<32x16x8xf32>, %arg106: tensor<32x16x8xf32>):
    %38 = "linalg.generic"(%arg104, %arg105, %arg106) <{doc = "X(i,j,k) = A(i,j,k) OP B(i,j,k)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg107: f32, %arg108: f32, %arg109: f32):
      %39 = "arith.addf"(%arg107, %arg108) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%39) : (f32) -> ()
    }) : (tensor<32x16x8xf32, #sparse1>, tensor<32x16x8xf32>, tensor<32x16x8xf32>) -> tensor<32x16x8xf32>
    "func.return"(%38) : (tensor<32x16x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32x16x8xf32, #sparse1>, tensor<32x16x8xf32>, tensor<32x16x8xf32>) -> tensor<32x16x8xf32>, sym_name = "mul_dds"}> ({
  ^bb0(%arg98: tensor<32x16x8xf32, #sparse1>, %arg99: tensor<32x16x8xf32>, %arg100: tensor<32x16x8xf32>):
    %36 = "linalg.generic"(%arg98, %arg99, %arg100) <{doc = "X(i,j,k) = A(i,j,k) OP B(i,j,k)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg101: f32, %arg102: f32, %arg103: f32):
      %37 = "arith.mulf"(%arg101, %arg102) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%37) : (f32) -> ()
    }) : (tensor<32x16x8xf32, #sparse1>, tensor<32x16x8xf32>, tensor<32x16x8xf32>) -> tensor<32x16x8xf32>
    "func.return"(%36) : (tensor<32x16x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32x16x8xf32, #sparse2>, tensor<32x16x8xf32>, tensor<32x16x8xf32>) -> tensor<32x16x8xf32>, sym_name = "add_dsd"}> ({
  ^bb0(%arg92: tensor<32x16x8xf32, #sparse2>, %arg93: tensor<32x16x8xf32>, %arg94: tensor<32x16x8xf32>):
    %34 = "linalg.generic"(%arg92, %arg93, %arg94) <{doc = "X(i,j,k) = A(i,j,k) OP B(i,j,k)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg95: f32, %arg96: f32, %arg97: f32):
      %35 = "arith.addf"(%arg95, %arg96) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%35) : (f32) -> ()
    }) : (tensor<32x16x8xf32, #sparse2>, tensor<32x16x8xf32>, tensor<32x16x8xf32>) -> tensor<32x16x8xf32>
    "func.return"(%34) : (tensor<32x16x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32x16x8xf32, #sparse2>, tensor<32x16x8xf32>, tensor<32x16x8xf32>) -> tensor<32x16x8xf32>, sym_name = "mul_dsd"}> ({
  ^bb0(%arg86: tensor<32x16x8xf32, #sparse2>, %arg87: tensor<32x16x8xf32>, %arg88: tensor<32x16x8xf32>):
    %32 = "linalg.generic"(%arg86, %arg87, %arg88) <{doc = "X(i,j,k) = A(i,j,k) OP B(i,j,k)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg89: f32, %arg90: f32, %arg91: f32):
      %33 = "arith.mulf"(%arg89, %arg90) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%33) : (f32) -> ()
    }) : (tensor<32x16x8xf32, #sparse2>, tensor<32x16x8xf32>, tensor<32x16x8xf32>) -> tensor<32x16x8xf32>
    "func.return"(%32) : (tensor<32x16x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32x16x8xf32, #sparse3>, tensor<32x16x8xf32>, tensor<32x16x8xf32>) -> tensor<32x16x8xf32>, sym_name = "add_dss"}> ({
  ^bb0(%arg80: tensor<32x16x8xf32, #sparse3>, %arg81: tensor<32x16x8xf32>, %arg82: tensor<32x16x8xf32>):
    %30 = "linalg.generic"(%arg80, %arg81, %arg82) <{doc = "X(i,j,k) = A(i,j,k) OP B(i,j,k)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg83: f32, %arg84: f32, %arg85: f32):
      %31 = "arith.addf"(%arg83, %arg84) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%31) : (f32) -> ()
    }) : (tensor<32x16x8xf32, #sparse3>, tensor<32x16x8xf32>, tensor<32x16x8xf32>) -> tensor<32x16x8xf32>
    "func.return"(%30) : (tensor<32x16x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32x16x8xf32, #sparse3>, tensor<32x16x8xf32>, tensor<32x16x8xf32>) -> tensor<32x16x8xf32>, sym_name = "mul_dss"}> ({
  ^bb0(%arg74: tensor<32x16x8xf32, #sparse3>, %arg75: tensor<32x16x8xf32>, %arg76: tensor<32x16x8xf32>):
    %28 = "linalg.generic"(%arg74, %arg75, %arg76) <{doc = "X(i,j,k) = A(i,j,k) OP B(i,j,k)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg77: f32, %arg78: f32, %arg79: f32):
      %29 = "arith.mulf"(%arg77, %arg78) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%29) : (f32) -> ()
    }) : (tensor<32x16x8xf32, #sparse3>, tensor<32x16x8xf32>, tensor<32x16x8xf32>) -> tensor<32x16x8xf32>
    "func.return"(%28) : (tensor<32x16x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32x16x8xf32, #sparse4>, tensor<32x16x8xf32>, tensor<32x16x8xf32>) -> tensor<32x16x8xf32>, sym_name = "add_sdd"}> ({
  ^bb0(%arg68: tensor<32x16x8xf32, #sparse4>, %arg69: tensor<32x16x8xf32>, %arg70: tensor<32x16x8xf32>):
    %26 = "linalg.generic"(%arg68, %arg69, %arg70) <{doc = "X(i,j,k) = A(i,j,k) OP B(i,j,k)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg71: f32, %arg72: f32, %arg73: f32):
      %27 = "arith.addf"(%arg71, %arg72) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%27) : (f32) -> ()
    }) : (tensor<32x16x8xf32, #sparse4>, tensor<32x16x8xf32>, tensor<32x16x8xf32>) -> tensor<32x16x8xf32>
    "func.return"(%26) : (tensor<32x16x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32x16x8xf32, #sparse4>, tensor<32x16x8xf32>, tensor<32x16x8xf32>) -> tensor<32x16x8xf32>, sym_name = "mul_sdd"}> ({
  ^bb0(%arg62: tensor<32x16x8xf32, #sparse4>, %arg63: tensor<32x16x8xf32>, %arg64: tensor<32x16x8xf32>):
    %24 = "linalg.generic"(%arg62, %arg63, %arg64) <{doc = "X(i,j,k) = A(i,j,k) OP B(i,j,k)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg65: f32, %arg66: f32, %arg67: f32):
      %25 = "arith.mulf"(%arg65, %arg66) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%25) : (f32) -> ()
    }) : (tensor<32x16x8xf32, #sparse4>, tensor<32x16x8xf32>, tensor<32x16x8xf32>) -> tensor<32x16x8xf32>
    "func.return"(%24) : (tensor<32x16x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32x16x8xf32, #sparse5>, tensor<32x16x8xf32>, tensor<32x16x8xf32>) -> tensor<32x16x8xf32>, sym_name = "add_sds"}> ({
  ^bb0(%arg56: tensor<32x16x8xf32, #sparse5>, %arg57: tensor<32x16x8xf32>, %arg58: tensor<32x16x8xf32>):
    %22 = "linalg.generic"(%arg56, %arg57, %arg58) <{doc = "X(i,j,k) = A(i,j,k) OP B(i,j,k)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg59: f32, %arg60: f32, %arg61: f32):
      %23 = "arith.addf"(%arg59, %arg60) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%23) : (f32) -> ()
    }) : (tensor<32x16x8xf32, #sparse5>, tensor<32x16x8xf32>, tensor<32x16x8xf32>) -> tensor<32x16x8xf32>
    "func.return"(%22) : (tensor<32x16x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32x16x8xf32, #sparse5>, tensor<32x16x8xf32>, tensor<32x16x8xf32>) -> tensor<32x16x8xf32>, sym_name = "mul_sds"}> ({
  ^bb0(%arg50: tensor<32x16x8xf32, #sparse5>, %arg51: tensor<32x16x8xf32>, %arg52: tensor<32x16x8xf32>):
    %20 = "linalg.generic"(%arg50, %arg51, %arg52) <{doc = "X(i,j,k) = A(i,j,k) OP B(i,j,k)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg53: f32, %arg54: f32, %arg55: f32):
      %21 = "arith.mulf"(%arg53, %arg54) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%21) : (f32) -> ()
    }) : (tensor<32x16x8xf32, #sparse5>, tensor<32x16x8xf32>, tensor<32x16x8xf32>) -> tensor<32x16x8xf32>
    "func.return"(%20) : (tensor<32x16x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32x16x8xf32, #sparse6>, tensor<32x16x8xf32>, tensor<32x16x8xf32>) -> tensor<32x16x8xf32>, sym_name = "add_ssd"}> ({
  ^bb0(%arg44: tensor<32x16x8xf32, #sparse6>, %arg45: tensor<32x16x8xf32>, %arg46: tensor<32x16x8xf32>):
    %18 = "linalg.generic"(%arg44, %arg45, %arg46) <{doc = "X(i,j,k) = A(i,j,k) OP B(i,j,k)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg47: f32, %arg48: f32, %arg49: f32):
      %19 = "arith.addf"(%arg47, %arg48) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%19) : (f32) -> ()
    }) : (tensor<32x16x8xf32, #sparse6>, tensor<32x16x8xf32>, tensor<32x16x8xf32>) -> tensor<32x16x8xf32>
    "func.return"(%18) : (tensor<32x16x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32x16x8xf32, #sparse6>, tensor<32x16x8xf32>, tensor<32x16x8xf32>) -> tensor<32x16x8xf32>, sym_name = "mul_ssd"}> ({
  ^bb0(%arg38: tensor<32x16x8xf32, #sparse6>, %arg39: tensor<32x16x8xf32>, %arg40: tensor<32x16x8xf32>):
    %16 = "linalg.generic"(%arg38, %arg39, %arg40) <{doc = "X(i,j,k) = A(i,j,k) OP B(i,j,k)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg41: f32, %arg42: f32, %arg43: f32):
      %17 = "arith.mulf"(%arg41, %arg42) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%17) : (f32) -> ()
    }) : (tensor<32x16x8xf32, #sparse6>, tensor<32x16x8xf32>, tensor<32x16x8xf32>) -> tensor<32x16x8xf32>
    "func.return"(%16) : (tensor<32x16x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32x16x8xf32, #sparse7>, tensor<32x16x8xf32>, tensor<32x16x8xf32>) -> tensor<32x16x8xf32>, sym_name = "add_sss"}> ({
  ^bb0(%arg32: tensor<32x16x8xf32, #sparse7>, %arg33: tensor<32x16x8xf32>, %arg34: tensor<32x16x8xf32>):
    %14 = "linalg.generic"(%arg32, %arg33, %arg34) <{doc = "X(i,j,k) = A(i,j,k) OP B(i,j,k)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg35: f32, %arg36: f32, %arg37: f32):
      %15 = "arith.addf"(%arg35, %arg36) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%15) : (f32) -> ()
    }) : (tensor<32x16x8xf32, #sparse7>, tensor<32x16x8xf32>, tensor<32x16x8xf32>) -> tensor<32x16x8xf32>
    "func.return"(%14) : (tensor<32x16x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32x16x8xf32, #sparse7>, tensor<32x16x8xf32>, tensor<32x16x8xf32>) -> tensor<32x16x8xf32>, sym_name = "mul_sss"}> ({
  ^bb0(%arg26: tensor<32x16x8xf32, #sparse7>, %arg27: tensor<32x16x8xf32>, %arg28: tensor<32x16x8xf32>):
    %12 = "linalg.generic"(%arg26, %arg27, %arg28) <{doc = "X(i,j,k) = A(i,j,k) OP B(i,j,k)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg29: f32, %arg30: f32, %arg31: f32):
      %13 = "arith.mulf"(%arg29, %arg30) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%13) : (f32) -> ()
    }) : (tensor<32x16x8xf32, #sparse7>, tensor<32x16x8xf32>, tensor<32x16x8xf32>) -> tensor<32x16x8xf32>
    "func.return"(%12) : (tensor<32x16x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?x?xf32, #sparse1>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "kernel_3d"}> ({
  ^bb0(%arg18: tensor<?x?xf32>, %arg19: tensor<?x?x?xf32, #sparse1>, %arg20: tensor<?x?xf32>, %arg21: tensor<?x?xf32>):
    %8 = "linalg.generic"(%arg19, %arg20, %arg21, %arg18) <{doc = "A(i,j) += SUM_k,l B(i,k,l) * C(k,j) * D(l,j)", indexing_maps = [#map1, #map2, #map3, #map4], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg22: f32, %arg23: f32, %arg24: f32, %arg25: f32):
      %9 = "arith.mulf"(%arg22, %arg23) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %10 = "arith.mulf"(%9, %arg24) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %11 = "arith.addf"(%10, %arg25) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%11) : (f32) -> ()
    }) : (tensor<?x?x?xf32, #sparse1>, tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%8) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<10x20x30xf32, #sparse7>, tensor<f32>) -> tensor<f32>, sym_name = "sum_reduction"}> ({
  ^bb0(%arg14: tensor<10x20x30xf32, #sparse7>, %arg15: tensor<f32>):
    %6 = "linalg.generic"(%arg14, %arg15) <{doc = "x += SUM_ijk A(i,j,k)", indexing_maps = [#map, #map5], iterator_types = [#linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg16: f32, %arg17: f32):
      %7 = "arith.addf"(%arg17, %arg16) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (tensor<10x20x30xf32, #sparse7>, tensor<f32>) -> tensor<f32>
    "func.return"(%6) : (tensor<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?xf32>, tensor<?xf32, #sparse8>, tensor<f32>) -> tensor<f32>, sym_name = "sum_reduction_inv"}> ({
  ^bb0(%arg8: tensor<?x?x?xf32>, %arg9: tensor<?xf32, #sparse8>, %arg10: tensor<f32>):
    %3 = "linalg.generic"(%arg8, %arg9, %arg10) <{doc = "x += SUM_i A(i,j,k) * b(i)", indexing_maps = [#map, #map6, #map5], iterator_types = [#linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg11: f32, %arg12: f32, %arg13: f32):
      %4 = "arith.mulf"(%arg11, %arg12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %5 = "arith.addf"(%arg13, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<?x?x?xf32>, tensor<?xf32, #sparse8>, tensor<f32>) -> tensor<f32>
    "func.return"(%3) : (tensor<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<10xf32, #sparse8>, tensor<20xf32>, tensor<30xf32>, tensor<10x20x30xf32>) -> tensor<10x20x30xf32>, sym_name = "invariants"}> ({
  ^bb0(%arg0: tensor<10xf32, #sparse8>, %arg1: tensor<20xf32>, %arg2: tensor<30xf32>, %arg3: tensor<10x20x30xf32>):
    %0 = "linalg.generic"(%arg0, %arg1, %arg2, %arg3) <{doc = "X(i,j,k) = a(i) * b(j) * c(k)", indexing_maps = [#map6, #map7, #map8, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32, %arg7: f32):
      %1 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.mulf"(%1, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<10xf32, #sparse8>, tensor<20xf32>, tensor<30xf32>, tensor<10x20x30xf32>) -> tensor<10x20x30xf32>
    "func.return"(%0) : (tensor<10x20x30xf32>) -> ()
  }) : () -> ()
}) : () -> ()

