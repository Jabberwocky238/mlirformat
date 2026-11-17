"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<32xf64>) -> tensor<32xf64>, sym_name = "abs"}> ({
  ^bb0(%arg40: tensor<32xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":5:8), %arg41: tensor<32xf64> loc("<stdin>":5:41)):
    %30 = "linalg.generic"(%arg40, %arg41) <{doc = "x(i) = OP a(i)", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg42: f64 loc("<stdin>":7:10), %arg43: f64 loc("<stdin>":7:23)):
      %31 = "math.absf"(%arg42) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64 loc("<stdin>":8:13)
      "linalg.yield"(%31) : (f64) -> () loc("<stdin>":9:7)
    }) : (tensor<32xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<32xf64>) -> tensor<32xf64> loc("<stdin>":6:11)
    "func.return"(%30) : (tensor<32xf64>) -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":4:3)
  "func.func"() <{function_type = (tensor<32xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<32xf64>) -> tensor<32xf64>, sym_name = "ceil"}> ({
  ^bb0(%arg36: tensor<32xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":14:8), %arg37: tensor<32xf64> loc("<stdin>":14:41)):
    %28 = "linalg.generic"(%arg36, %arg37) <{doc = "x(i) = OP a(i)", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg38: f64 loc("<stdin>":16:10), %arg39: f64 loc("<stdin>":16:23)):
      %29 = "math.ceil"(%arg38) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64 loc("<stdin>":17:13)
      "linalg.yield"(%29) : (f64) -> () loc("<stdin>":18:7)
    }) : (tensor<32xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<32xf64>) -> tensor<32xf64> loc("<stdin>":15:11)
    "func.return"(%28) : (tensor<32xf64>) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":13:3)
  "func.func"() <{function_type = (tensor<32xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<32xf64>) -> tensor<32xf64>, sym_name = "floor"}> ({
  ^bb0(%arg32: tensor<32xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":23:8), %arg33: tensor<32xf64> loc("<stdin>":23:41)):
    %26 = "linalg.generic"(%arg32, %arg33) <{doc = "x(i) = OP a(i)", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg34: f64 loc("<stdin>":25:10), %arg35: f64 loc("<stdin>":25:23)):
      %27 = "math.floor"(%arg34) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64 loc("<stdin>":26:13)
      "linalg.yield"(%27) : (f64) -> () loc("<stdin>":27:7)
    }) : (tensor<32xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<32xf64>) -> tensor<32xf64> loc("<stdin>":24:11)
    "func.return"(%26) : (tensor<32xf64>) -> () loc("<stdin>":29:5)
  }) : () -> () loc("<stdin>":22:3)
  "func.func"() <{function_type = (tensor<32xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<32xf64>) -> tensor<32xf64>, sym_name = "neg"}> ({
  ^bb0(%arg28: tensor<32xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":32:8), %arg29: tensor<32xf64> loc("<stdin>":32:41)):
    %24 = "linalg.generic"(%arg28, %arg29) <{doc = "x(i) = OP a(i)", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg30: f64 loc("<stdin>":34:10), %arg31: f64 loc("<stdin>":34:23)):
      %25 = "arith.negf"(%arg30) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64 loc("<stdin>":35:13)
      "linalg.yield"(%25) : (f64) -> () loc("<stdin>":36:7)
    }) : (tensor<32xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<32xf64>) -> tensor<32xf64> loc("<stdin>":33:11)
    "func.return"(%24) : (tensor<32xf64>) -> () loc("<stdin>":38:5)
  }) : () -> () loc("<stdin>":31:3)
  "func.func"() <{function_type = (tensor<32xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<32xf64>, tensor<32xf64>) -> tensor<32xf64>, sym_name = "add"}> ({
  ^bb0(%arg22: tensor<32xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":41:8), %arg23: tensor<32xf64> loc("<stdin>":41:41), %arg24: tensor<32xf64> loc("<stdin>":41:65)):
    %22 = "linalg.generic"(%arg22, %arg23, %arg24) <{doc = "x(i) = a(i) OP b(i)", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg25: f64 loc("<stdin>":43:10), %arg26: f64 loc("<stdin>":43:23), %arg27: f64 loc("<stdin>":43:36)):
      %23 = "arith.addf"(%arg25, %arg26) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":44:13)
      "linalg.yield"(%23) : (f64) -> () loc("<stdin>":45:7)
    }) : (tensor<32xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<32xf64>, tensor<32xf64>) -> tensor<32xf64> loc("<stdin>":42:11)
    "func.return"(%22) : (tensor<32xf64>) -> () loc("<stdin>":47:5)
  }) : () -> () loc("<stdin>":40:3)
  "func.func"() <{function_type = (tensor<32xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<32xf64>, tensor<32xf64>) -> tensor<32xf64>, sym_name = "sub"}> ({
  ^bb0(%arg16: tensor<32xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":50:8), %arg17: tensor<32xf64> loc("<stdin>":50:41), %arg18: tensor<32xf64> loc("<stdin>":50:65)):
    %20 = "linalg.generic"(%arg16, %arg17, %arg18) <{doc = "x(i) = a(i) OP b(i)", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg19: f64 loc("<stdin>":52:10), %arg20: f64 loc("<stdin>":52:23), %arg21: f64 loc("<stdin>":52:36)):
      %21 = "arith.subf"(%arg19, %arg20) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":53:13)
      "linalg.yield"(%21) : (f64) -> () loc("<stdin>":54:7)
    }) : (tensor<32xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<32xf64>, tensor<32xf64>) -> tensor<32xf64> loc("<stdin>":51:11)
    "func.return"(%20) : (tensor<32xf64>) -> () loc("<stdin>":56:5)
  }) : () -> () loc("<stdin>":49:3)
  "func.func"() <{function_type = (tensor<32xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<32xf64>, tensor<32xf64>) -> tensor<32xf64>, sym_name = "mul"}> ({
  ^bb0(%arg10: tensor<32xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":59:8), %arg11: tensor<32xf64> loc("<stdin>":59:41), %arg12: tensor<32xf64> loc("<stdin>":59:65)):
    %18 = "linalg.generic"(%arg10, %arg11, %arg12) <{doc = "x(i) = a(i) OP b(i)", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg13: f64 loc("<stdin>":61:10), %arg14: f64 loc("<stdin>":61:23), %arg15: f64 loc("<stdin>":61:36)):
      %19 = "arith.mulf"(%arg13, %arg14) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":62:13)
      "linalg.yield"(%19) : (f64) -> () loc("<stdin>":63:7)
    }) : (tensor<32xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<32xf64>, tensor<32xf64>) -> tensor<32xf64> loc("<stdin>":60:11)
    "func.return"(%18) : (tensor<32xf64>) -> () loc("<stdin>":65:5)
  }) : () -> () loc("<stdin>":58:3)
  "func.func"() <{function_type = (tensor<32xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<32xf64>) -> tensor<32xf64>, sym_name = "divbyc"}> ({
  ^bb0(%arg6: tensor<32xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":68:8), %arg7: tensor<32xf64> loc("<stdin>":68:40)):
    %15 = "arith.constant"() <{value = 2.000000e+00 : f64}> : () -> f64 loc("<stdin>":69:11)
    %16 = "linalg.generic"(%arg6, %arg7) <{doc = "x(i) = a(i) OP c", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg8: f64 loc("<stdin>":71:10), %arg9: f64 loc("<stdin>":71:22)):
      %17 = "arith.divf"(%arg8, %15) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":72:13)
      "linalg.yield"(%17) : (f64) -> () loc("<stdin>":73:7)
    }) : (tensor<32xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<32xf64>) -> tensor<32xf64> loc("<stdin>":70:11)
    "func.return"(%16) : (tensor<32xf64>) -> () loc("<stdin>":75:5)
  }) : () -> () loc("<stdin>":67:3)
  "func.func"() <{function_type = (tensor<32xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<32xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, sym_name = "zero_preserving_math"}> ({
  ^bb0(%arg3: tensor<32xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":78:8)):
    %4 = "arith.constant"() <{value = 32 : index}> : () -> index loc("<stdin>":79:10)
    %5 = "tensor.empty"() : () -> tensor<32xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":80:10)
    %6 = "linalg.generic"(%arg3, %5) <{doc = "x(i) = OP a(i)", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f64 loc("<stdin>":82:10), %arg5: f64 loc("<stdin>":82:22)):
      %7 = "math.absf"(%arg4) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64 loc("<stdin>":83:12)
      %8 = "math.ceil"(%7) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64 loc("<stdin>":84:12)
      %9 = "math.floor"(%8) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64 loc("<stdin>":85:12)
      %10 = "math.sqrt"(%9) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64 loc("<stdin>":86:13)
      %11 = "math.expm1"(%10) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64 loc("<stdin>":87:13)
      %12 = "math.log1p"(%11) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64 loc("<stdin>":88:13)
      %13 = "math.sin"(%12) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64 loc("<stdin>":89:13)
      %14 = "math.tanh"(%13) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64 loc("<stdin>":90:13)
      "linalg.yield"(%14) : (f64) -> () loc("<stdin>":91:7)
    }) : (tensor<32xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<32xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<32xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":81:10)
    "func.return"(%6) : (tensor<32xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":93:5)
  }) : () -> () loc("<stdin>":77:3)
  "func.func"() <{function_type = (tensor<32xcomplex<f64>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<32xcomplex<f64>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, sym_name = "complex_divbyc"}> ({
  ^bb0(%arg0: tensor<32xcomplex<f64>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":96:8)):
    %0 = "complex.constant"() <{value = [0.000000e+00, 1.000000e+00]}> : () -> complex<f64> loc("<stdin>":97:10)
    %1 = "tensor.empty"() : () -> tensor<32xcomplex<f64>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":98:10)
    %2 = "linalg.generic"(%arg0, %1) <{doc = "x(i) = a(i) OP c", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: complex<f64> loc("<stdin>":100:10), %arg2: complex<f64> loc("<stdin>":100:31)):
      %3 = "complex.div"(%arg1, %0) <{fastmath = #arith.fastmath<none>}> : (complex<f64>, complex<f64>) -> complex<f64> loc("<stdin>":101:12)
      "linalg.yield"(%3) : (complex<f64>) -> () loc("<stdin>":102:7)
    }) : (tensor<32xcomplex<f64>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<32xcomplex<f64>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<32xcomplex<f64>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":99:10)
    "func.return"(%2) : (tensor<32xcomplex<f64>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":104:5)
  }) : () -> () loc("<stdin>":95:3)
}) : () -> () loc("<stdin>":3:1)
