#map = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32xf64, #sparse>, tensor<32xf64>) -> tensor<32xf64>, sym_name = "abs"}> ({
  ^bb0(%arg40: tensor<32xf64, #sparse>, %arg41: tensor<32xf64>):
    %30 = "linalg.generic"(%arg40, %arg41) <{doc = "x(i) = OP a(i)", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg42: f64, %arg43: f64):
      %31 = "math.absf"(%arg42) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64
      "linalg.yield"(%31) : (f64) -> ()
    }) : (tensor<32xf64, #sparse>, tensor<32xf64>) -> tensor<32xf64>
    "func.return"(%30) : (tensor<32xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xf64, #sparse>, tensor<32xf64>) -> tensor<32xf64>, sym_name = "ceil"}> ({
  ^bb0(%arg36: tensor<32xf64, #sparse>, %arg37: tensor<32xf64>):
    %28 = "linalg.generic"(%arg36, %arg37) <{doc = "x(i) = OP a(i)", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg38: f64, %arg39: f64):
      %29 = "math.ceil"(%arg38) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64
      "linalg.yield"(%29) : (f64) -> ()
    }) : (tensor<32xf64, #sparse>, tensor<32xf64>) -> tensor<32xf64>
    "func.return"(%28) : (tensor<32xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xf64, #sparse>, tensor<32xf64>) -> tensor<32xf64>, sym_name = "floor"}> ({
  ^bb0(%arg32: tensor<32xf64, #sparse>, %arg33: tensor<32xf64>):
    %26 = "linalg.generic"(%arg32, %arg33) <{doc = "x(i) = OP a(i)", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg34: f64, %arg35: f64):
      %27 = "math.floor"(%arg34) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64
      "linalg.yield"(%27) : (f64) -> ()
    }) : (tensor<32xf64, #sparse>, tensor<32xf64>) -> tensor<32xf64>
    "func.return"(%26) : (tensor<32xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xf64, #sparse>, tensor<32xf64>) -> tensor<32xf64>, sym_name = "neg"}> ({
  ^bb0(%arg28: tensor<32xf64, #sparse>, %arg29: tensor<32xf64>):
    %24 = "linalg.generic"(%arg28, %arg29) <{doc = "x(i) = OP a(i)", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg30: f64, %arg31: f64):
      %25 = "arith.negf"(%arg30) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64
      "linalg.yield"(%25) : (f64) -> ()
    }) : (tensor<32xf64, #sparse>, tensor<32xf64>) -> tensor<32xf64>
    "func.return"(%24) : (tensor<32xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xf64, #sparse>, tensor<32xf64>, tensor<32xf64>) -> tensor<32xf64>, sym_name = "add"}> ({
  ^bb0(%arg22: tensor<32xf64, #sparse>, %arg23: tensor<32xf64>, %arg24: tensor<32xf64>):
    %22 = "linalg.generic"(%arg22, %arg23, %arg24) <{doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg25: f64, %arg26: f64, %arg27: f64):
      %23 = "arith.addf"(%arg25, %arg26) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%23) : (f64) -> ()
    }) : (tensor<32xf64, #sparse>, tensor<32xf64>, tensor<32xf64>) -> tensor<32xf64>
    "func.return"(%22) : (tensor<32xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xf64, #sparse>, tensor<32xf64>, tensor<32xf64>) -> tensor<32xf64>, sym_name = "sub"}> ({
  ^bb0(%arg16: tensor<32xf64, #sparse>, %arg17: tensor<32xf64>, %arg18: tensor<32xf64>):
    %20 = "linalg.generic"(%arg16, %arg17, %arg18) <{doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg19: f64, %arg20: f64, %arg21: f64):
      %21 = "arith.subf"(%arg19, %arg20) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%21) : (f64) -> ()
    }) : (tensor<32xf64, #sparse>, tensor<32xf64>, tensor<32xf64>) -> tensor<32xf64>
    "func.return"(%20) : (tensor<32xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xf64, #sparse>, tensor<32xf64>, tensor<32xf64>) -> tensor<32xf64>, sym_name = "mul"}> ({
  ^bb0(%arg10: tensor<32xf64, #sparse>, %arg11: tensor<32xf64>, %arg12: tensor<32xf64>):
    %18 = "linalg.generic"(%arg10, %arg11, %arg12) <{doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg13: f64, %arg14: f64, %arg15: f64):
      %19 = "arith.mulf"(%arg13, %arg14) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%19) : (f64) -> ()
    }) : (tensor<32xf64, #sparse>, tensor<32xf64>, tensor<32xf64>) -> tensor<32xf64>
    "func.return"(%18) : (tensor<32xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xf64, #sparse>, tensor<32xf64>) -> tensor<32xf64>, sym_name = "divbyc"}> ({
  ^bb0(%arg6: tensor<32xf64, #sparse>, %arg7: tensor<32xf64>):
    %15 = "arith.constant"() <{value = 2.000000e+00 : f64}> : () -> f64
    %16 = "linalg.generic"(%arg6, %arg7) <{doc = "x(i) = a(i) OP c", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg8: f64, %arg9: f64):
      %17 = "arith.divf"(%arg8, %15) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%17) : (f64) -> ()
    }) : (tensor<32xf64, #sparse>, tensor<32xf64>) -> tensor<32xf64>
    "func.return"(%16) : (tensor<32xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xf64, #sparse>) -> tensor<32xf64, #sparse>, sym_name = "zero_preserving_math"}> ({
  ^bb0(%arg3: tensor<32xf64, #sparse>):
    %4 = "arith.constant"() <{value = 32 : index}> : () -> index
    %5 = "tensor.empty"() : () -> tensor<32xf64, #sparse>
    %6 = "linalg.generic"(%arg3, %5) <{doc = "x(i) = OP a(i)", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f64, %arg5: f64):
      %7 = "math.absf"(%arg4) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64
      %8 = "math.ceil"(%7) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64
      %9 = "math.floor"(%8) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64
      %10 = "math.sqrt"(%9) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64
      %11 = "math.expm1"(%10) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64
      %12 = "math.log1p"(%11) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64
      %13 = "math.sin"(%12) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64
      %14 = "math.tanh"(%13) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64
      "linalg.yield"(%14) : (f64) -> ()
    }) : (tensor<32xf64, #sparse>, tensor<32xf64, #sparse>) -> tensor<32xf64, #sparse>
    "func.return"(%6) : (tensor<32xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xcomplex<f64>, #sparse>) -> tensor<32xcomplex<f64>, #sparse>, sym_name = "complex_divbyc"}> ({
  ^bb0(%arg0: tensor<32xcomplex<f64>, #sparse>):
    %0 = "complex.constant"() <{value = [0.000000e+00, 1.000000e+00]}> : () -> complex<f64>
    %1 = "tensor.empty"() : () -> tensor<32xcomplex<f64>, #sparse>
    %2 = "linalg.generic"(%arg0, %1) <{doc = "x(i) = a(i) OP c", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: complex<f64>, %arg2: complex<f64>):
      %3 = "complex.div"(%arg1, %0) <{fastmath = #arith.fastmath<none>}> : (complex<f64>, complex<f64>) -> complex<f64>
      "linalg.yield"(%3) : (complex<f64>) -> ()
    }) : (tensor<32xcomplex<f64>, #sparse>, tensor<32xcomplex<f64>, #sparse>) -> tensor<32xcomplex<f64>, #sparse>
    "func.return"(%2) : (tensor<32xcomplex<f64>, #sparse>) -> ()
  }) : () -> ()
}) : () -> ()

