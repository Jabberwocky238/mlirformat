#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : dense) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32xf32, #sparse>, f32, tensor<32xf32>) -> tensor<32xf32>, sym_name = "add_d"}> ({
  ^bb0(%arg121: tensor<32xf32, #sparse>, %arg122: f32, %arg123: tensor<32xf32>):
    %53 = "linalg.generic"(%arg121, %arg123) <{doc = "x(i) = a(i) OP b", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg124: f32, %arg125: f32):
      %54 = "arith.addf"(%arg124, %arg122) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%54) : (f32) -> ()
    }) : (tensor<32xf32, #sparse>, tensor<32xf32>) -> tensor<32xf32>
    "func.return"(%53) : (tensor<32xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xf32, #sparse>, f32) -> tensor<32xf32>, sym_name = "add_d_init"}> ({
  ^bb0(%arg117: tensor<32xf32, #sparse>, %arg118: f32):
    %50 = "tensor.empty"() : () -> tensor<32xf32>
    %51 = "linalg.generic"(%arg117, %50) <{doc = "x(i) = a(i) OP b", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg119: f32, %arg120: f32):
      %52 = "arith.addf"(%arg119, %arg118) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%52) : (f32) -> ()
    }) : (tensor<32xf32, #sparse>, tensor<32xf32>) -> tensor<32xf32>
    "func.return"(%51) : (tensor<32xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xf32, #sparse>, f32, tensor<32xf32>) -> tensor<32xf32>, sym_name = "mul_d"}> ({
  ^bb0(%arg112: tensor<32xf32, #sparse>, %arg113: f32, %arg114: tensor<32xf32>):
    %48 = "linalg.generic"(%arg112, %arg114) <{doc = "x(i) = a(i) OP b", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg115: f32, %arg116: f32):
      %49 = "arith.mulf"(%arg115, %arg113) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%49) : (f32) -> ()
    }) : (tensor<32xf32, #sparse>, tensor<32xf32>) -> tensor<32xf32>
    "func.return"(%48) : (tensor<32xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xf32, #sparse1>, f32, tensor<32xf32>) -> tensor<32xf32>, sym_name = "add_s"}> ({
  ^bb0(%arg107: tensor<32xf32, #sparse1>, %arg108: f32, %arg109: tensor<32xf32>):
    %46 = "linalg.generic"(%arg107, %arg109) <{doc = "x(i) = a(i) OP b", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg110: f32, %arg111: f32):
      %47 = "arith.addf"(%arg110, %arg108) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%47) : (f32) -> ()
    }) : (tensor<32xf32, #sparse1>, tensor<32xf32>) -> tensor<32xf32>
    "func.return"(%46) : (tensor<32xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xf32, #sparse1>, tensor<32xf32>) -> tensor<32xf32>, sym_name = "repeated_add_s"}> ({
  ^bb0(%arg103: tensor<32xf32, #sparse1>, %arg104: tensor<32xf32>):
    %42 = "linalg.generic"(%arg103, %arg104) <{doc = "x(i) = a(i) OP b", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg105: f32, %arg106: f32):
      %43 = "arith.addf"(%arg105, %arg105) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %44 = "arith.addf"(%arg105, %arg105) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %45 = "arith.addf"(%43, %44) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%45) : (f32) -> ()
    }) : (tensor<32xf32, #sparse1>, tensor<32xf32>) -> tensor<32xf32>
    "func.return"(%42) : (tensor<32xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xf32, #sparse1>, f32, tensor<32xf32>) -> tensor<32xf32>, sym_name = "mul_s"}> ({
  ^bb0(%arg98: tensor<32xf32, #sparse1>, %arg99: f32, %arg100: tensor<32xf32>):
    %40 = "linalg.generic"(%arg98, %arg100) <{doc = "x(i) = a(i) OP b", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg101: f32, %arg102: f32):
      %41 = "arith.mulf"(%arg101, %arg99) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%41) : (f32) -> ()
    }) : (tensor<32xf32, #sparse1>, tensor<32xf32>) -> tensor<32xf32>
    "func.return"(%40) : (tensor<32xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xf32, #sparse>, tensor<32xf32>, tensor<32xf32>) -> tensor<32xf32>, sym_name = "add_dd"}> ({
  ^bb0(%arg92: tensor<32xf32, #sparse>, %arg93: tensor<32xf32>, %arg94: tensor<32xf32>):
    %38 = "linalg.generic"(%arg92, %arg93, %arg94) <{doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg95: f32, %arg96: f32, %arg97: f32):
      %39 = "arith.addf"(%arg95, %arg96) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%39) : (f32) -> ()
    }) : (tensor<32xf32, #sparse>, tensor<32xf32>, tensor<32xf32>) -> tensor<32xf32>
    "func.return"(%38) : (tensor<32xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xf32, #sparse>, tensor<32xf32>, tensor<32xf32>) -> tensor<32xf32>, sym_name = "mul_dd"}> ({
  ^bb0(%arg86: tensor<32xf32, #sparse>, %arg87: tensor<32xf32>, %arg88: tensor<32xf32>):
    %36 = "linalg.generic"(%arg86, %arg87, %arg88) <{doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg89: f32, %arg90: f32, %arg91: f32):
      %37 = "arith.mulf"(%arg89, %arg90) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%37) : (f32) -> ()
    }) : (tensor<32xf32, #sparse>, tensor<32xf32>, tensor<32xf32>) -> tensor<32xf32>
    "func.return"(%36) : (tensor<32xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xf32>, tensor<32xf32, #sparse1>, tensor<32xf32>) -> tensor<32xf32>, sym_name = "add_ds"}> ({
  ^bb0(%arg80: tensor<32xf32>, %arg81: tensor<32xf32, #sparse1>, %arg82: tensor<32xf32>):
    %34 = "linalg.generic"(%arg80, %arg81, %arg82) <{doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg83: f32, %arg84: f32, %arg85: f32):
      %35 = "arith.addf"(%arg83, %arg84) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%35) : (f32) -> ()
    }) : (tensor<32xf32>, tensor<32xf32, #sparse1>, tensor<32xf32>) -> tensor<32xf32>
    "func.return"(%34) : (tensor<32xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xf32>, tensor<32xf32, #sparse1>, tensor<32xf32>) -> tensor<32xf32>, sym_name = "mul_ds"}> ({
  ^bb0(%arg74: tensor<32xf32>, %arg75: tensor<32xf32, #sparse1>, %arg76: tensor<32xf32>):
    %32 = "linalg.generic"(%arg74, %arg75, %arg76) <{doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg77: f32, %arg78: f32, %arg79: f32):
      %33 = "arith.mulf"(%arg77, %arg78) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%33) : (f32) -> ()
    }) : (tensor<32xf32>, tensor<32xf32, #sparse1>, tensor<32xf32>) -> tensor<32xf32>
    "func.return"(%32) : (tensor<32xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xf32, #sparse1>, tensor<32xf32>, tensor<32xf32>) -> tensor<32xf32>, sym_name = "add_sd"}> ({
  ^bb0(%arg68: tensor<32xf32, #sparse1>, %arg69: tensor<32xf32>, %arg70: tensor<32xf32>):
    %30 = "linalg.generic"(%arg68, %arg69, %arg70) <{doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg71: f32, %arg72: f32, %arg73: f32):
      %31 = "arith.addf"(%arg71, %arg72) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%31) : (f32) -> ()
    }) : (tensor<32xf32, #sparse1>, tensor<32xf32>, tensor<32xf32>) -> tensor<32xf32>
    "func.return"(%30) : (tensor<32xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xf32, #sparse1>, tensor<32xf32>, tensor<32xf32>) -> tensor<32xf32>, sym_name = "mul_sd"}> ({
  ^bb0(%arg62: tensor<32xf32, #sparse1>, %arg63: tensor<32xf32>, %arg64: tensor<32xf32>):
    %28 = "linalg.generic"(%arg62, %arg63, %arg64) <{doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg65: f32, %arg66: f32, %arg67: f32):
      %29 = "arith.mulf"(%arg65, %arg66) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%29) : (f32) -> ()
    }) : (tensor<32xf32, #sparse1>, tensor<32xf32>, tensor<32xf32>) -> tensor<32xf32>
    "func.return"(%28) : (tensor<32xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xf32, #sparse1>, tensor<32xf32, #sparse1>, tensor<32xf32>) -> tensor<32xf32>, sym_name = "add_ss"}> ({
  ^bb0(%arg56: tensor<32xf32, #sparse1>, %arg57: tensor<32xf32, #sparse1>, %arg58: tensor<32xf32>):
    %26 = "linalg.generic"(%arg56, %arg57, %arg58) <{doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg59: f32, %arg60: f32, %arg61: f32):
      %27 = "arith.addf"(%arg59, %arg60) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%27) : (f32) -> ()
    }) : (tensor<32xf32, #sparse1>, tensor<32xf32, #sparse1>, tensor<32xf32>) -> tensor<32xf32>
    "func.return"(%26) : (tensor<32xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xf32, #sparse1>, tensor<32xf32, #sparse1>, tensor<32xf32>) -> tensor<32xf32>, sym_name = "mul_ss"}> ({
  ^bb0(%arg50: tensor<32xf32, #sparse1>, %arg51: tensor<32xf32, #sparse1>, %arg52: tensor<32xf32>):
    %24 = "linalg.generic"(%arg50, %arg51, %arg52) <{doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg53: f32, %arg54: f32, %arg55: f32):
      %25 = "arith.mulf"(%arg53, %arg54) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%25) : (f32) -> ()
    }) : (tensor<32xf32, #sparse1>, tensor<32xf32, #sparse1>, tensor<32xf32>) -> tensor<32xf32>
    "func.return"(%24) : (tensor<32xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<16xf32, #sparse1>, tensor<16xf32, #sparse1>, f32, tensor<16xf32>) -> tensor<16xf32>, sym_name = "two_way_inv"}> ({
  ^bb0(%arg43: tensor<16xf32, #sparse1>, %arg44: tensor<16xf32, #sparse1>, %arg45: f32, %arg46: tensor<16xf32>):
    %20 = "linalg.generic"(%arg43, %arg44, %arg46) <{doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg47: f32, %arg48: f32, %arg49: f32):
      %21 = "arith.mulf"(%arg47, %arg45) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %22 = "arith.mulf"(%arg48, %arg45) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %23 = "arith.addf"(%21, %22) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%23) : (f32) -> ()
    }) : (tensor<16xf32, #sparse1>, tensor<16xf32, #sparse1>, tensor<16xf32>) -> tensor<16xf32>
    "func.return"(%20) : (tensor<16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<16xf32, #sparse1>, tensor<16xf32, #sparse1>, f32, tensor<16xf32>) -> tensor<16xf32>, sym_name = "two_way_inv_alt"}> ({
  ^bb0(%arg36: tensor<16xf32, #sparse1>, %arg37: tensor<16xf32, #sparse1>, %arg38: f32, %arg39: tensor<16xf32>):
    %17 = "linalg.generic"(%arg36, %arg37, %arg39) <{doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg40: f32, %arg41: f32, %arg42: f32):
      %18 = "arith.addf"(%arg40, %arg41) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %19 = "arith.mulf"(%18, %arg38) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%19) : (f32) -> ()
    }) : (tensor<16xf32, #sparse1>, tensor<16xf32, #sparse1>, tensor<16xf32>) -> tensor<16xf32>
    "func.return"(%17) : (tensor<16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf32, #sparse1>, tensor<f32>) -> tensor<f32>, sym_name = "sum_reduction"}> ({
  ^bb0(%arg32: tensor<?xf32, #sparse1>, %arg33: tensor<f32>):
    %15 = "linalg.generic"(%arg32, %arg33) <{doc = "x += SUM_i a(i)", indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg34: f32, %arg35: f32):
      %16 = "arith.addf"(%arg35, %arg34) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%16) : (f32) -> ()
    }) : (tensor<?xf32, #sparse1>, tensor<f32>) -> tensor<f32>
    "func.return"(%15) : (tensor<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<16xf32, #sparse1>, tensor<16xf32, #sparse1>, tensor<f32>) -> tensor<f32>, sym_name = "sum_reduction_ss"}> ({
  ^bb0(%arg26: tensor<16xf32, #sparse1>, %arg27: tensor<16xf32, #sparse1>, %arg28: tensor<f32>):
    %12 = "linalg.generic"(%arg26, %arg27, %arg28) <{doc = "x += SUM_i a(i) + b(i)", indexing_maps = [#map, #map, #map1], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg29: f32, %arg30: f32, %arg31: f32):
      %13 = "arith.addf"(%arg29, %arg30) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %14 = "arith.addf"(%arg31, %13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%14) : (f32) -> ()
    }) : (tensor<16xf32, #sparse1>, tensor<16xf32, #sparse1>, tensor<f32>) -> tensor<f32>
    "func.return"(%12) : (tensor<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<16xf32, #sparse1>, tensor<f32>, tensor<16xf32, #sparse1>, tensor<f32>) -> tensor<f32>, sym_name = "sum_reduction_inv"}> ({
  ^bb0(%arg18: tensor<16xf32, #sparse1>, %arg19: tensor<f32>, %arg20: tensor<16xf32, #sparse1>, %arg21: tensor<f32>):
    %8 = "linalg.generic"(%arg18, %arg19, %arg20, %arg21) <{doc = "x += SUM_i a(i) * b + c(i)", indexing_maps = [#map, #map1, #map, #map1], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg22: f32, %arg23: f32, %arg24: f32, %arg25: f32):
      %9 = "arith.mulf"(%arg22, %arg23) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %10 = "arith.addf"(%9, %arg24) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %11 = "arith.addf"(%arg25, %10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%11) : (f32) -> ()
    }) : (tensor<16xf32, #sparse1>, tensor<f32>, tensor<16xf32, #sparse1>, tensor<f32>) -> tensor<f32>
    "func.return"(%8) : (tensor<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf64>, tensor<?xf64, #sparse1>, tensor<?xf64>, tensor<?xf64, #sparse1>, tensor<?xf64>) -> tensor<?xf64>, sym_name = "four_tensors_op"}> ({
  ^bb0(%arg8: tensor<?xf64>, %arg9: tensor<?xf64, #sparse1>, %arg10: tensor<?xf64>, %arg11: tensor<?xf64, #sparse1>, %arg12: tensor<?xf64>):
    %4 = "linalg.generic"(%arg8, %arg9, %arg10, %arg11, %arg12) <{doc = "X(i) = A(i) + B(i) + C(i) + D(i)", indexing_maps = [#map, #map, #map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 4, 1>}> ({
    ^bb0(%arg13: f64, %arg14: f64, %arg15: f64, %arg16: f64, %arg17: f64):
      %5 = "arith.addf"(%arg13, %arg14) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %6 = "arith.addf"(%arg15, %arg16) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %7 = "arith.addf"(%5, %6) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%7) : (f64) -> ()
    }) : (tensor<?xf64>, tensor<?xf64, #sparse1>, tensor<?xf64>, tensor<?xf64, #sparse1>, tensor<?xf64>) -> tensor<?xf64>
    "func.return"(%4) : (tensor<?xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf64, #sparse1>, tensor<?xf64, #sparse1>, tensor<?xf64, #sparse1>, tensor<f64>) -> tensor<f64>, sym_name = "red3s"}> ({
  ^bb0(%arg0: tensor<?xf64, #sparse1>, %arg1: tensor<?xf64, #sparse1>, %arg2: tensor<?xf64, #sparse1>, %arg3: tensor<f64>):
    %0 = "linalg.generic"(%arg0, %arg1, %arg2, %arg3) <{doc = "x += a(i) + b(i) + c(i)", indexing_maps = [#map, #map, #map, #map1], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg4: f64, %arg5: f64, %arg6: f64, %arg7: f64):
      %1 = "arith.addf"(%arg7, %arg4) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %2 = "arith.addf"(%1, %arg5) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %3 = "arith.addf"(%2, %arg6) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%3) : (f64) -> ()
    }) : (tensor<?xf64, #sparse1>, tensor<?xf64, #sparse1>, tensor<?xf64, #sparse1>, tensor<f64>) -> tensor<f64>
    "func.return"(%0) : (tensor<f64>) -> ()
  }) : () -> ()
}) : () -> ()

