#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
#map2 = affine_map<(d0, d1) -> (d0)>
#map3 = affine_map<(d0, d1) -> ()>
#map4 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map5 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map6 = affine_map<(d0, d1, d2) -> (d2, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
#sparse4 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : loose_compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x16xf32, #sparse>, tensor<32x16xf32>, tensor<32x16xf32>) -> tensor<32x16xf32>, sym_name = "add_dd"}> ({
  ^bb0(%arg135: tensor<32x16xf32, #sparse>, %arg136: tensor<32x16xf32>, %arg137: tensor<32x16xf32>):
    %53 = "linalg.generic"(%arg135, %arg136, %arg137) <{doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg138: f32, %arg139: f32, %arg140: f32):
      %54 = "arith.addf"(%arg138, %arg139) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%54) : (f32) -> ()
    }) : (tensor<32x16xf32, #sparse>, tensor<32x16xf32>, tensor<32x16xf32>) -> tensor<32x16xf32>
    "func.return"(%53) : (tensor<32x16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32x16xf32, #sparse>, tensor<32x16xf32>, tensor<32x16xi1>) -> tensor<32x16xi1>, sym_name = "cmp_dd"}> ({
  ^bb0(%arg129: tensor<32x16xf32, #sparse>, %arg130: tensor<32x16xf32>, %arg131: tensor<32x16xi1>):
    %51 = "linalg.generic"(%arg129, %arg130, %arg131) <{doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg132: f32, %arg133: f32, %arg134: i1):
      %52 = "arith.cmpf"(%arg132, %arg133) <{fastmath = #arith.fastmath<none>, predicate = 11 : i64}> : (f32, f32) -> i1
      "linalg.yield"(%52) : (i1) -> ()
    }) : (tensor<32x16xf32, #sparse>, tensor<32x16xf32>, tensor<32x16xi1>) -> tensor<32x16xi1>
    "func.return"(%51) : (tensor<32x16xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32x16xf32, #sparse>, tensor<32x16xf32>, tensor<32x16xf32>) -> tensor<32x16xf32>, sym_name = "mul_dd"}> ({
  ^bb0(%arg123: tensor<32x16xf32, #sparse>, %arg124: tensor<32x16xf32>, %arg125: tensor<32x16xf32>):
    %49 = "linalg.generic"(%arg123, %arg124, %arg125) <{doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg126: f32, %arg127: f32, %arg128: f32):
      %50 = "arith.mulf"(%arg126, %arg127) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%50) : (f32) -> ()
    }) : (tensor<32x16xf32, #sparse>, tensor<32x16xf32>, tensor<32x16xf32>) -> tensor<32x16xf32>
    "func.return"(%49) : (tensor<32x16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32x16xf32, #sparse1>, tensor<32x16xf32>, tensor<32x16xf32>) -> tensor<32x16xf32>, sym_name = "add_ds"}> ({
  ^bb0(%arg117: tensor<32x16xf32, #sparse1>, %arg118: tensor<32x16xf32>, %arg119: tensor<32x16xf32>):
    %47 = "linalg.generic"(%arg117, %arg118, %arg119) <{doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg120: f32, %arg121: f32, %arg122: f32):
      %48 = "arith.addf"(%arg120, %arg121) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%48) : (f32) -> ()
    }) : (tensor<32x16xf32, #sparse1>, tensor<32x16xf32>, tensor<32x16xf32>) -> tensor<32x16xf32>
    "func.return"(%47) : (tensor<32x16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32x16xf32, #sparse1>, tensor<32x16xf32>, tensor<32x16xi1>) -> tensor<32x16xi1>, sym_name = "cmp_ds"}> ({
  ^bb0(%arg111: tensor<32x16xf32, #sparse1>, %arg112: tensor<32x16xf32>, %arg113: tensor<32x16xi1>):
    %45 = "linalg.generic"(%arg111, %arg112, %arg113) <{doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg114: f32, %arg115: f32, %arg116: i1):
      %46 = "arith.cmpf"(%arg114, %arg115) <{fastmath = #arith.fastmath<none>, predicate = 11 : i64}> : (f32, f32) -> i1
      "linalg.yield"(%46) : (i1) -> ()
    }) : (tensor<32x16xf32, #sparse1>, tensor<32x16xf32>, tensor<32x16xi1>) -> tensor<32x16xi1>
    "func.return"(%45) : (tensor<32x16xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32x16xf32, #sparse1>, tensor<32x16xf32>, tensor<32x16xf32>) -> tensor<32x16xf32>, sym_name = "mul_ds"}> ({
  ^bb0(%arg105: tensor<32x16xf32, #sparse1>, %arg106: tensor<32x16xf32>, %arg107: tensor<32x16xf32>):
    %43 = "linalg.generic"(%arg105, %arg106, %arg107) <{doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg108: f32, %arg109: f32, %arg110: f32):
      %44 = "arith.mulf"(%arg108, %arg109) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%44) : (f32) -> ()
    }) : (tensor<32x16xf32, #sparse1>, tensor<32x16xf32>, tensor<32x16xf32>) -> tensor<32x16xf32>
    "func.return"(%43) : (tensor<32x16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32x16xf32, #sparse2>, tensor<32x16xf32>, tensor<32x16xf32>) -> tensor<32x16xf32>, sym_name = "add_sd"}> ({
  ^bb0(%arg99: tensor<32x16xf32, #sparse2>, %arg100: tensor<32x16xf32>, %arg101: tensor<32x16xf32>):
    %41 = "linalg.generic"(%arg99, %arg100, %arg101) <{doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg102: f32, %arg103: f32, %arg104: f32):
      %42 = "arith.addf"(%arg102, %arg103) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%42) : (f32) -> ()
    }) : (tensor<32x16xf32, #sparse2>, tensor<32x16xf32>, tensor<32x16xf32>) -> tensor<32x16xf32>
    "func.return"(%41) : (tensor<32x16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32x16xf32, #sparse2>, tensor<32x16xf32>, tensor<32x16xi1>) -> tensor<32x16xi1>, sym_name = "cmp_sd"}> ({
  ^bb0(%arg93: tensor<32x16xf32, #sparse2>, %arg94: tensor<32x16xf32>, %arg95: tensor<32x16xi1>):
    %39 = "linalg.generic"(%arg93, %arg94, %arg95) <{doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg96: f32, %arg97: f32, %arg98: i1):
      %40 = "arith.cmpf"(%arg96, %arg97) <{fastmath = #arith.fastmath<none>, predicate = 11 : i64}> : (f32, f32) -> i1
      "linalg.yield"(%40) : (i1) -> ()
    }) : (tensor<32x16xf32, #sparse2>, tensor<32x16xf32>, tensor<32x16xi1>) -> tensor<32x16xi1>
    "func.return"(%39) : (tensor<32x16xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32x16xf32, #sparse2>, tensor<32x16xf32>, tensor<32x16xf32>) -> tensor<32x16xf32>, sym_name = "mul_sd"}> ({
  ^bb0(%arg87: tensor<32x16xf32, #sparse2>, %arg88: tensor<32x16xf32>, %arg89: tensor<32x16xf32>):
    %37 = "linalg.generic"(%arg87, %arg88, %arg89) <{doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg90: f32, %arg91: f32, %arg92: f32):
      %38 = "arith.mulf"(%arg90, %arg91) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%38) : (f32) -> ()
    }) : (tensor<32x16xf32, #sparse2>, tensor<32x16xf32>, tensor<32x16xf32>) -> tensor<32x16xf32>
    "func.return"(%37) : (tensor<32x16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32x16xf32, #sparse3>, tensor<32x16xf32>, tensor<32x16xf32>) -> tensor<32x16xf32>, sym_name = "add_ss"}> ({
  ^bb0(%arg81: tensor<32x16xf32, #sparse3>, %arg82: tensor<32x16xf32>, %arg83: tensor<32x16xf32>):
    %35 = "linalg.generic"(%arg81, %arg82, %arg83) <{doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg84: f32, %arg85: f32, %arg86: f32):
      %36 = "arith.addf"(%arg84, %arg85) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%36) : (f32) -> ()
    }) : (tensor<32x16xf32, #sparse3>, tensor<32x16xf32>, tensor<32x16xf32>) -> tensor<32x16xf32>
    "func.return"(%35) : (tensor<32x16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32x16xf32, #sparse3>, tensor<32x16xf32>, tensor<32x16xi1>) -> tensor<32x16xi1>, sym_name = "cmp_ss"}> ({
  ^bb0(%arg75: tensor<32x16xf32, #sparse3>, %arg76: tensor<32x16xf32>, %arg77: tensor<32x16xi1>):
    %33 = "linalg.generic"(%arg75, %arg76, %arg77) <{doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg78: f32, %arg79: f32, %arg80: i1):
      %34 = "arith.cmpf"(%arg78, %arg79) <{fastmath = #arith.fastmath<none>, predicate = 11 : i64}> : (f32, f32) -> i1
      "linalg.yield"(%34) : (i1) -> ()
    }) : (tensor<32x16xf32, #sparse3>, tensor<32x16xf32>, tensor<32x16xi1>) -> tensor<32x16xi1>
    "func.return"(%33) : (tensor<32x16xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32x16xf32, #sparse3>, tensor<32x16xf32>, tensor<32x16xf32>) -> tensor<32x16xf32>, sym_name = "mul_ss"}> ({
  ^bb0(%arg69: tensor<32x16xf32, #sparse3>, %arg70: tensor<32x16xf32>, %arg71: tensor<32x16xf32>):
    %31 = "linalg.generic"(%arg69, %arg70, %arg71) <{doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg72: f32, %arg73: f32, %arg74: f32):
      %32 = "arith.mulf"(%arg72, %arg73) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%32) : (f32) -> ()
    }) : (tensor<32x16xf32, #sparse3>, tensor<32x16xf32>, tensor<32x16xf32>) -> tensor<32x16xf32>
    "func.return"(%31) : (tensor<32x16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32x16xf32, #sparse3>, tensor<32x16xf32, #sparse3>, tensor<32x16xf32>) -> tensor<32x16xf32>, sym_name = "add_ss_ss"}> ({
  ^bb0(%arg63: tensor<32x16xf32, #sparse3>, %arg64: tensor<32x16xf32, #sparse3>, %arg65: tensor<32x16xf32>):
    %29 = "linalg.generic"(%arg63, %arg64, %arg65) <{doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg66: f32, %arg67: f32, %arg68: f32):
      %30 = "arith.addf"(%arg66, %arg67) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%30) : (f32) -> ()
    }) : (tensor<32x16xf32, #sparse3>, tensor<32x16xf32, #sparse3>, tensor<32x16xf32>) -> tensor<32x16xf32>
    "func.return"(%29) : (tensor<32x16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32x16xf32, #sparse3>, tensor<32x16xf32, #sparse3>, tensor<32x16xi1>) -> tensor<32x16xi1>, sym_name = "cmp_ss_ss"}> ({
  ^bb0(%arg57: tensor<32x16xf32, #sparse3>, %arg58: tensor<32x16xf32, #sparse3>, %arg59: tensor<32x16xi1>):
    %27 = "linalg.generic"(%arg57, %arg58, %arg59) <{doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg60: f32, %arg61: f32, %arg62: i1):
      %28 = "arith.cmpf"(%arg60, %arg61) <{fastmath = #arith.fastmath<none>, predicate = 11 : i64}> : (f32, f32) -> i1
      "linalg.yield"(%28) : (i1) -> ()
    }) : (tensor<32x16xf32, #sparse3>, tensor<32x16xf32, #sparse3>, tensor<32x16xi1>) -> tensor<32x16xi1>
    "func.return"(%27) : (tensor<32x16xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x3xf64, #sparse4>, tensor<2x3xf64, #sparse4>) -> tensor<2x3xf64, #sparse4>, sym_name = "sub_ss_batched"}> ({
  ^bb0(%arg52: tensor<2x3xf64, #sparse4>, %arg53: tensor<2x3xf64, #sparse4>):
    %24 = "tensor.empty"() : () -> tensor<2x3xf64, #sparse4>
    %25 = "linalg.generic"(%arg52, %arg53, %24) <{doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg54: f64, %arg55: f64, %arg56: f64):
      %26 = "arith.subf"(%arg54, %arg55) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%26) : (f64) -> ()
    }) : (tensor<2x3xf64, #sparse4>, tensor<2x3xf64, #sparse4>, tensor<2x3xf64, #sparse4>) -> tensor<2x3xf64, #sparse4>
    "func.return"(%25) : (tensor<2x3xf64, #sparse4>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32x16xf32, #sparse3>, tensor<32x16xf32, #sparse3>, tensor<32x16xf32>) -> tensor<32x16xf32>, sym_name = "mul_ss_ss"}> ({
  ^bb0(%arg46: tensor<32x16xf32, #sparse3>, %arg47: tensor<32x16xf32, #sparse3>, %arg48: tensor<32x16xf32>):
    %22 = "linalg.generic"(%arg46, %arg47, %arg48) <{doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg49: f32, %arg50: f32, %arg51: f32):
      %23 = "arith.mulf"(%arg49, %arg50) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%23) : (f32) -> ()
    }) : (tensor<32x16xf32, #sparse3>, tensor<32x16xf32, #sparse3>, tensor<32x16xf32>) -> tensor<32x16xf32>
    "func.return"(%22) : (tensor<32x16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32x16xf32, #sparse2>, tensor<32x16xf32, #sparse1>, tensor<32x16xf32>) -> tensor<32x16xf32>, sym_name = "add_sd_ds"}> ({
  ^bb0(%arg40: tensor<32x16xf32, #sparse2>, %arg41: tensor<32x16xf32, #sparse1>, %arg42: tensor<32x16xf32>):
    %20 = "linalg.generic"(%arg40, %arg41, %arg42) <{doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg43: f32, %arg44: f32, %arg45: f32):
      %21 = "arith.addf"(%arg43, %arg44) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%21) : (f32) -> ()
    }) : (tensor<32x16xf32, #sparse2>, tensor<32x16xf32, #sparse1>, tensor<32x16xf32>) -> tensor<32x16xf32>
    "func.return"(%20) : (tensor<32x16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32x16xf32, #sparse2>, tensor<32x16xf32, #sparse1>, tensor<32x16xf32>) -> tensor<32x16xf32>, sym_name = "mul_sd_ds"}> ({
  ^bb0(%arg34: tensor<32x16xf32, #sparse2>, %arg35: tensor<32x16xf32, #sparse1>, %arg36: tensor<32x16xf32>):
    %18 = "linalg.generic"(%arg34, %arg35, %arg36) <{doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg37: f32, %arg38: f32, %arg39: f32):
      %19 = "arith.mulf"(%arg37, %arg38) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%19) : (f32) -> ()
    }) : (tensor<32x16xf32, #sparse2>, tensor<32x16xf32, #sparse1>, tensor<32x16xf32>) -> tensor<32x16xf32>
    "func.return"(%18) : (tensor<32x16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<16x32xf32, #sparse1>, tensor<32xf32>, tensor<16xf32>) -> tensor<16xf32>, sym_name = "matvec"}> ({
  ^bb0(%arg28: tensor<16x32xf32, #sparse1>, %arg29: tensor<32xf32>, %arg30: tensor<16xf32>):
    %15 = "linalg.generic"(%arg28, %arg29, %arg30) <{doc = "x(i) += SUM_j A(i,j) * b(j)", indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg31: f32, %arg32: f32, %arg33: f32):
      %16 = "arith.mulf"(%arg31, %arg32) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %17 = "arith.addf"(%16, %arg33) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%17) : (f32) -> ()
    }) : (tensor<16x32xf32, #sparse1>, tensor<32xf32>, tensor<16xf32>) -> tensor<16xf32>
    "func.return"(%15) : (tensor<16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<10x20xf32, #sparse1>, tensor<f32>) -> tensor<f32>, sym_name = "sum_reduction"}> ({
  ^bb0(%arg24: tensor<10x20xf32, #sparse1>, %arg25: tensor<f32>):
    %13 = "linalg.generic"(%arg24, %arg25) <{doc = "x += SUM_ij A(i,j)", indexing_maps = [#map, #map3], iterator_types = [#linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg26: f32, %arg27: f32):
      %14 = "arith.addf"(%arg27, %arg26) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%14) : (f32) -> ()
    }) : (tensor<10x20xf32, #sparse1>, tensor<f32>) -> tensor<f32>
    "func.return"(%13) : (tensor<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse1>, tensor<?x?xf64>) -> tensor<?x?xf64>, sym_name = "scale"}> ({
  ^bb0(%arg20: tensor<?x?xf64, #sparse1>, %arg21: tensor<?x?xf64>):
    %10 = "arith.constant"() <{value = 2.000000e+00 : f64}> : () -> f64
    %11 = "linalg.generic"(%arg20, %arg21) <{doc = "X(i,j) = A(i,j) * SCALE", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg22: f64, %arg23: f64):
      %12 = "arith.mulf"(%arg22, %10) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%12) : (f64) -> ()
    }) : (tensor<?x?xf64, #sparse1>, tensor<?x?xf64>) -> tensor<?x?xf64>
    "func.return"(%11) : (tensor<?x?xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf32, #sparse3>, tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "sampled_dense_dense"}> ({
  ^bb0(%arg12: tensor<?x?xf32, #sparse3>, %arg13: tensor<?x?xf32>, %arg14: tensor<?x?xf32>, %arg15: tensor<?x?xf32>):
    %6 = "linalg.generic"(%arg12, %arg13, %arg14, %arg15) <{doc = "X(i,j) += S(i,j) SUM_k A(i,k) B(k,j)", indexing_maps = [#map4, #map5, #map6, #map4], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg16: f32, %arg17: f32, %arg18: f32, %arg19: f32):
      %7 = "arith.mulf"(%arg17, %arg18) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %8 = "arith.mulf"(%arg16, %7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %9 = "arith.addf"(%arg19, %8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%9) : (f32) -> ()
    }) : (tensor<?x?xf32, #sparse3>, tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%6) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf32, #sparse3>, tensor<?x?xf32, #sparse1>, tensor<?x?xf32, #sparse1>, tensor<?xf32>, tensor<f32>, tensor<?xf32>) -> tensor<?xf32>, sym_name = "sum_kernel_with_inv"}> ({
  ^bb0(%arg0: tensor<?x?xf32, #sparse3>, %arg1: tensor<?x?xf32, #sparse1>, %arg2: tensor<?x?xf32, #sparse1>, %arg3: tensor<?xf32>, %arg4: tensor<f32>, %arg5: tensor<?xf32>):
    %0 = "linalg.generic"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5) <{doc = "x(i) = SUM_j A(i,j) * B(i,j) * d(i) * e + C(i,j)", indexing_maps = [#map, #map, #map, #map2, #map3, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 5, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32):
      %1 = "arith.mulf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.mulf"(%1, %arg9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %3 = "arith.mulf"(%2, %arg10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%3, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %5 = "arith.addf"(%arg11, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<?x?xf32, #sparse3>, tensor<?x?xf32, #sparse1>, tensor<?x?xf32, #sparse1>, tensor<?xf32>, tensor<f32>, tensor<?xf32>) -> tensor<?xf32>
    "func.return"(%0) : (tensor<?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

