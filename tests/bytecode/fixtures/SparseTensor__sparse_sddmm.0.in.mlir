"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<1024x1024xf64>, sym_name = "fold_yield_arg_zero"}> ({
    %16 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64 loc("<stdin>":10:11)
    %17 = "tensor.empty"() : () -> tensor<1024x1024xf64> loc("<stdin>":11:11)
    %18 = "linalg.generic"(%16, %17) <{indexing_maps = [affine_map<(d0, d1) -> ()>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg19: f64 loc("<stdin>":13:10), %arg20: f64 loc("<stdin>":13:23)):
      "linalg.yield"(%arg19) : (f64) -> () loc("<stdin>":14:7)
    }) : (f64, tensor<1024x1024xf64>) -> tensor<1024x1024xf64> loc("<stdin>":12:11)
    "func.return"(%18) : (tensor<1024x1024xf64>) -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":9:3)
  "func.func"() <{function_type = () -> tensor<32xf64>, sym_name = "fold_yield_direct_zero"}> ({
    %13 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64 loc("<stdin>":19:11)
    %14 = "tensor.empty"() : () -> tensor<32xf64> loc("<stdin>":20:11)
    %15 = "linalg.generic"(%14) <{indexing_maps = [affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg18: f64 loc("<stdin>":22:10)):
      "linalg.yield"(%13) : (f64) -> () loc("<stdin>":23:7)
    }) : (tensor<32xf64>) -> tensor<32xf64> loc("<stdin>":21:11)
    "func.return"(%15) : (tensor<32xf64>) -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":18:3)
  "func.func"() <{function_type = (tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64>, sym_name = "sampled_dd_unfused"}> ({
  ^bb0(%arg9: tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":28:8), %arg10: tensor<8x8xf64> loc("<stdin>":28:41), %arg11: tensor<8x8xf64> loc("<stdin>":28:66)):
    %7 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<8x8xf64>}> : () -> tensor<8x8xf64> loc("<stdin>":29:10)
    %8 = "linalg.generic"(%arg10, %arg11, %7) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d1, d0)>, affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>], iterator_types = [#linalg.iterator_type<reduction>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg15: f64 loc("<stdin>":31:10), %arg16: f64 loc("<stdin>":31:23), %arg17: f64 loc("<stdin>":31:36)):
      %11 = "arith.mulf"(%arg15, %arg16) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":32:13)
      %12 = "arith.addf"(%arg17, %11) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":33:13)
      "linalg.yield"(%12) : (f64) -> () loc("<stdin>":34:7)
    }) : (tensor<8x8xf64>, tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64> loc("<stdin>":30:10)
    %9 = "linalg.generic"(%8, %arg9, %7) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg12: f64 loc("<stdin>":37:10), %arg13: f64 loc("<stdin>":37:23), %arg14: f64 loc("<stdin>":37:36)):
      %10 = "arith.mulf"(%arg12, %arg13) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":38:13)
      "linalg.yield"(%10) : (f64) -> () loc("<stdin>":39:7)
    }) : (tensor<8x8xf64>, tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<8x8xf64>) -> tensor<8x8xf64> loc("<stdin>":36:10)
    "func.return"(%9) : (tensor<8x8xf64>) -> () loc("<stdin>":41:5)
  }) : () -> () loc("<stdin>":27:3)
  "func.func"() <{function_type = (tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, sym_name = "sparse_sampled_dd_unfused"}> ({
  ^bb0(%arg0: tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":44:8), %arg1: tensor<8x8xf64> loc("<stdin>":44:41), %arg2: tensor<8x8xf64> loc("<stdin>":44:65)):
    %0 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<8x8xf64>}> : () -> tensor<8x8xf64> loc("<stdin>":45:10)
    %1 = "linalg.generic"(%arg1, %arg2, %0) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d1, d0)>, affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>], iterator_types = [#linalg.iterator_type<reduction>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: f64 loc("<stdin>":47:10), %arg7: f64 loc("<stdin>":47:22), %arg8: f64 loc("<stdin>":47:34)):
      %5 = "arith.mulf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":48:12)
      %6 = "arith.addf"(%arg8, %5) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":49:12)
      "linalg.yield"(%6) : (f64) -> () loc("<stdin>":50:7)
    }) : (tensor<8x8xf64>, tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64> loc("<stdin>":46:10)
    %2 = "tensor.empty"() : () -> tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":52:10)
    %3 = "linalg.generic"(%1, %arg0, %2) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f64 loc("<stdin>":54:10), %arg4: f64 loc("<stdin>":54:22), %arg5: f64 loc("<stdin>":54:34)):
      %4 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":55:12)
      "linalg.yield"(%4) : (f64) -> () loc("<stdin>":56:7)
    }) : (tensor<8x8xf64>, tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":53:10)
    "func.return"(%3) : (tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":58:5)
  }) : () -> () loc("<stdin>":43:3)
}) : () -> () loc("<stdin>":8:1)
