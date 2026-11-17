"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x8xf64>, tensor<8x8xf64>, tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, sym_name = "sparse_sampled_dd"}> ({
  ^bb0(%arg9: tensor<8x8xf64> loc("<stdin>":7:8), %arg10: tensor<8x8xf64> loc("<stdin>":7:32), %arg11: tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":7:57)):
    %7 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64 loc("<stdin>":8:10)
    %8 = "linalg.generic"(%arg9, %arg10, %arg11) <{doc = "S(i,j) += spy[S(i,j)] x SUM_k A(i,k) B(k,j)", indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg12: f64 loc("<stdin>":10:10), %arg13: f64 loc("<stdin>":10:23), %arg14: f64 loc("<stdin>":10:36)):
      %9 = "sparse_tensor.unary"(%arg14) ({
      ^bb0(%arg17: f64 loc("<stdin>":12:12)):
        %12 = "arith.mulf"(%arg12, %arg13) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":13:15)
        "sparse_tensor.yield"(%12) : (f64) -> () loc("<stdin>":14:9)
      }, {
      }) : (f64) -> f64 loc("<stdin>":11:12)
      %10 = "sparse_tensor.reduce"(%arg14, %9, %7) ({
      ^bb0(%arg15: f64 loc("<stdin>":18:12), %arg16: f64 loc("<stdin>":18:25)):
        %11 = "arith.addf"(%arg15, %arg16) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":19:15)
        "sparse_tensor.yield"(%11) : (f64) -> () loc("<stdin>":20:9)
      }) : (f64, f64, f64) -> f64 loc("<stdin>":17:13)
      "linalg.yield"(%10) : (f64) -> () loc("<stdin>":22:7)
    }) : (tensor<8x8xf64>, tensor<8x8xf64>, tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":9:10)
    "func.return"(%8) : (tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = (tensor<8x8xf64>, tensor<8x8xf64>, tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, sym_name = "sparse_unary_captures_sparse_arg"}> ({
  ^bb0(%arg0: tensor<8x8xf64> loc("<stdin>":27:8), %arg1: tensor<8x8xf64> loc("<stdin>":27:32), %arg2: tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":27:56)):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64 loc("<stdin>":28:10)
    %1 = "linalg.generic"(%arg0, %arg1, %arg2) <{doc = "S(i,j) += S(i,j) * SUM_k A(i,k) B(k,j)", indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f64 loc("<stdin>":30:10), %arg4: f64 loc("<stdin>":30:22), %arg5: f64 loc("<stdin>":30:34)):
      %2 = "sparse_tensor.unary"(%arg5) ({
      ^bb0(%arg8: f64 loc("<stdin>":32:12)):
        %5 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":33:14)
        %6 = "arith.mulf"(%arg5, %5) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":34:14)
        "sparse_tensor.yield"(%6) : (f64) -> () loc("<stdin>":35:9)
      }, {
      }) : (f64) -> f64 loc("<stdin>":31:12)
      %3 = "sparse_tensor.reduce"(%arg5, %2, %0) ({
      ^bb0(%arg6: f64 loc("<stdin>":39:12), %arg7: f64 loc("<stdin>":39:24)):
        %4 = "arith.addf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":40:14)
        "sparse_tensor.yield"(%4) : (f64) -> () loc("<stdin>":41:9)
      }) : (f64, f64, f64) -> f64 loc("<stdin>":38:12)
      "linalg.yield"(%3) : (f64) -> () loc("<stdin>":43:7)
    }) : (tensor<8x8xf64>, tensor<8x8xf64>, tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":29:10)
    "func.return"(%1) : (tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":45:5)
  }) : () -> () loc("<stdin>":26:3)
}) : () -> () loc("<stdin>":5:1)
