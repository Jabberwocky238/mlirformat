"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64>, sym_name = "sampled_dd"}> ({
  ^bb0(%arg25: tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":10:8), %arg26: tensor<8x8xf64> loc("<stdin>":10:42), %arg27: tensor<8x8xf64> loc("<stdin>":10:67)):
    %30 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<8x8xf64>}> : () -> tensor<8x8xf64> loc("<stdin>":11:11)
    %31 = "linalg.generic"(%arg25, %arg26, %arg27, %30) <{doc = "X(i,j) += S(i,j) SUM_k A(i,k) B(k,j)", indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1)>, affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg28: f64 loc("<stdin>":13:10), %arg29: f64 loc("<stdin>":13:23), %arg30: f64 loc("<stdin>":13:36), %arg31: f64 loc("<stdin>":13:49)):
      %32 = "arith.mulf"(%arg29, %arg30) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":14:13)
      %33 = "arith.mulf"(%arg28, %32) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":15:13)
      %34 = "arith.addf"(%arg31, %33) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":16:13)
      "linalg.yield"(%34) : (f64) -> () loc("<stdin>":17:7)
    }) : (tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<8x8xf64>, tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64> loc("<stdin>":12:11)
    "func.return"(%31) : (tensor<8x8xf64>) -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":9:3)
  "func.func"() <{function_type = (tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64>, sym_name = "sampled_dd_unfused"}> ({
  ^bb0(%arg16: tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":22:8), %arg17: tensor<8x8xf64> loc("<stdin>":22:42), %arg18: tensor<8x8xf64> loc("<stdin>":22:67)):
    %24 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<8x8xf64>}> : () -> tensor<8x8xf64> loc("<stdin>":23:11)
    %25 = "linalg.generic"(%arg17, %arg18, %24) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d1, d0)>, affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>], iterator_types = [#linalg.iterator_type<reduction>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg22: f64 loc("<stdin>":25:10), %arg23: f64 loc("<stdin>":25:23), %arg24: f64 loc("<stdin>":25:36)):
      %28 = "arith.mulf"(%arg22, %arg23) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":26:13)
      %29 = "arith.addf"(%arg24, %28) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":27:13)
      "linalg.yield"(%29) : (f64) -> () loc("<stdin>":28:7)
    }) : (tensor<8x8xf64>, tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64> loc("<stdin>":24:11)
    %26 = "linalg.generic"(%25, %arg16, %24) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg19: f64 loc("<stdin>":31:10), %arg20: f64 loc("<stdin>":31:23), %arg21: f64 loc("<stdin>":31:36)):
      %27 = "arith.mulf"(%arg19, %arg20) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":32:13)
      "linalg.yield"(%27) : (f64) -> () loc("<stdin>":33:7)
    }) : (tensor<8x8xf64>, tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<8x8xf64>) -> tensor<8x8xf64> loc("<stdin>":30:11)
    "bufferization.dealloc_tensor"(%25) : (tensor<8x8xf64>) -> () loc("<stdin>":35:5)
    "func.return"(%26) : (tensor<8x8xf64>) -> () loc("<stdin>":36:5)
  }) : () -> () loc("<stdin>":21:3)
  "func.func"() <{function_type = (tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, sym_name = "sparse_sampled_dd"}> ({
  ^bb0(%arg9: tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":39:8), %arg10: tensor<8x8xf64> loc("<stdin>":39:41), %arg11: tensor<8x8xf64> loc("<stdin>":39:66)):
    %19 = "tensor.empty"() : () -> tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":40:11)
    %20 = "linalg.generic"(%arg9, %arg10, %arg11, %19) <{doc = "X(i,j) += S(i,j) SUM_k A(i,k) B(k,j)", indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1)>, affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg12: f64 loc("<stdin>":42:10), %arg13: f64 loc("<stdin>":42:23), %arg14: f64 loc("<stdin>":42:36), %arg15: f64 loc("<stdin>":42:49)):
      %21 = "arith.mulf"(%arg13, %arg14) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":43:13)
      %22 = "arith.mulf"(%arg12, %21) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":44:13)
      %23 = "arith.addf"(%arg15, %22) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":45:13)
      "linalg.yield"(%23) : (f64) -> () loc("<stdin>":46:7)
    }) : (tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<8x8xf64>, tensor<8x8xf64>, tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":41:11)
    "func.return"(%20) : (tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":48:5)
  }) : () -> () loc("<stdin>":38:3)
  "func.func"() <{function_type = (tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, sym_name = "sparse_sampled_dd_unfused"}> ({
  ^bb0(%arg0: tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":51:8), %arg1: tensor<8x8xf64> loc("<stdin>":51:41), %arg2: tensor<8x8xf64> loc("<stdin>":51:65)):
    %12 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<8x8xf64>}> : () -> tensor<8x8xf64> loc("<stdin>":52:11)
    %13 = "linalg.generic"(%arg1, %arg2, %12) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d1, d0)>, affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>], iterator_types = [#linalg.iterator_type<reduction>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: f64 loc("<stdin>":54:10), %arg7: f64 loc("<stdin>":54:22), %arg8: f64 loc("<stdin>":54:34)):
      %17 = "arith.mulf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":55:13)
      %18 = "arith.addf"(%arg8, %17) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":56:13)
      "linalg.yield"(%18) : (f64) -> () loc("<stdin>":57:7)
    }) : (tensor<8x8xf64>, tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64> loc("<stdin>":53:11)
    %14 = "tensor.empty"() : () -> tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":59:11)
    %15 = "linalg.generic"(%13, %arg0, %14) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f64 loc("<stdin>":61:10), %arg4: f64 loc("<stdin>":61:22), %arg5: f64 loc("<stdin>":61:34)):
      %16 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":62:13)
      "linalg.yield"(%16) : (f64) -> () loc("<stdin>":63:7)
    }) : (tensor<8x8xf64>, tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":60:11)
    "func.return"(%15) : (tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":65:5)
  }) : () -> () loc("<stdin>":50:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64 loc("<stdin>":68:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":69:10)
    %2 = "arith.constant"() <{value = sparse<[[0, 0], [7, 7]], [1.000000e+00, 2.000000e+00]> : tensor<8x8xf64>}> : () -> tensor<8x8xf64> loc("<stdin>":70:10)
    %3 = "sparse_tensor.convert"(%2) : (tensor<8x8xf64>) -> tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":71:10)
    %4 = "arith.constant"() <{value = dense<3.000000e+00> : tensor<8x8xf64>}> : () -> tensor<8x8xf64> loc("<stdin>":72:10)
    %5 = "arith.constant"() <{value = dense<4.000000e+00> : tensor<8x8xf64>}> : () -> tensor<8x8xf64> loc("<stdin>":73:10)
    %6 = "func.call"(%3, %4, %5) <{callee = @sampled_dd}> : (tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64> loc("<stdin>":74:10)
    %7 = "func.call"(%3, %4, %5) <{callee = @sampled_dd_unfused}> : (tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64> loc("<stdin>":75:10)
    %8 = "func.call"(%3, %4, %5) <{callee = @sparse_sampled_dd}> : (tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":76:10)
    %9 = "func.call"(%3, %4, %5) <{callee = @sparse_sampled_dd_unfused}> : (tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":77:10)
    %10 = "vector.transfer_read"(%6, %1, %1, %0) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (tensor<8x8xf64>, index, index, f64) -> vector<8x8xf64> loc("<stdin>":78:11)
    %11 = "vector.transfer_read"(%7, %1, %1, %0) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (tensor<8x8xf64>, index, index, f64) -> vector<8x8xf64> loc("<stdin>":79:11)
    "vector.print"(%10) <{punctuation = #vector.punctuation<newline>}> : (vector<8x8xf64>) -> () loc("<stdin>":80:5)
    "vector.print"(%11) <{punctuation = #vector.punctuation<newline>}> : (vector<8x8xf64>) -> () loc("<stdin>":81:5)
    "sparse_tensor.print"(%8) : (tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":82:5)
    "sparse_tensor.print"(%9) : (tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":83:5)
    "bufferization.dealloc_tensor"(%3) : (tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":84:5)
    "bufferization.dealloc_tensor"(%6) : (tensor<8x8xf64>) -> () loc("<stdin>":85:5)
    "bufferization.dealloc_tensor"(%7) : (tensor<8x8xf64>) -> () loc("<stdin>":86:5)
    "bufferization.dealloc_tensor"(%8) : (tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":87:5)
    "bufferization.dealloc_tensor"(%9) : (tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":88:5)
    "func.return"() : () -> () loc("<stdin>":89:5)
  }) : () -> () loc("<stdin>":67:3)
}) : () -> () loc("<stdin>":8:1)
