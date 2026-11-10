#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x8xf64>, tensor<8x8xf64>, tensor<8x8xf64, #sparse>) -> tensor<8x8xf64, #sparse>, sym_name = "sparse_sampled_dd"}> ({
  ^bb0(%arg9: tensor<8x8xf64>, %arg10: tensor<8x8xf64>, %arg11: tensor<8x8xf64, #sparse>):
    %7 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %8 = "linalg.generic"(%arg9, %arg10, %arg11) <{doc = "S(i,j) += spy[S(i,j)] x SUM_k A(i,k) B(k,j)", indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg12: f64, %arg13: f64, %arg14: f64):
      %9 = "sparse_tensor.unary"(%arg14) ({
      ^bb0(%arg17: f64):
        %12 = "arith.mulf"(%arg12, %arg13) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
        "sparse_tensor.yield"(%12) : (f64) -> ()
      }, {
      }) : (f64) -> f64
      %10 = "sparse_tensor.reduce"(%arg14, %9, %7) ({
      ^bb0(%arg15: f64, %arg16: f64):
        %11 = "arith.addf"(%arg15, %arg16) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
        "sparse_tensor.yield"(%11) : (f64) -> ()
      }) : (f64, f64, f64) -> f64
      "linalg.yield"(%10) : (f64) -> ()
    }) : (tensor<8x8xf64>, tensor<8x8xf64>, tensor<8x8xf64, #sparse>) -> tensor<8x8xf64, #sparse>
    "func.return"(%8) : (tensor<8x8xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xf64>, tensor<8x8xf64>, tensor<8x8xf64, #sparse>) -> tensor<8x8xf64, #sparse>, sym_name = "sparse_unary_captures_sparse_arg"}> ({
  ^bb0(%arg0: tensor<8x8xf64>, %arg1: tensor<8x8xf64>, %arg2: tensor<8x8xf64, #sparse>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %1 = "linalg.generic"(%arg0, %arg1, %arg2) <{doc = "S(i,j) += S(i,j) * SUM_k A(i,k) B(k,j)", indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f64, %arg4: f64, %arg5: f64):
      %2 = "sparse_tensor.unary"(%arg5) ({
      ^bb0(%arg8: f64):
        %5 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
        %6 = "arith.mulf"(%arg5, %5) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
        "sparse_tensor.yield"(%6) : (f64) -> ()
      }, {
      }) : (f64) -> f64
      %3 = "sparse_tensor.reduce"(%arg5, %2, %0) ({
      ^bb0(%arg6: f64, %arg7: f64):
        %4 = "arith.addf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
        "sparse_tensor.yield"(%4) : (f64) -> ()
      }) : (f64, f64, f64) -> f64
      "linalg.yield"(%3) : (f64) -> ()
    }) : (tensor<8x8xf64>, tensor<8x8xf64>, tensor<8x8xf64, #sparse>) -> tensor<8x8xf64, #sparse>
    "func.return"(%1) : (tensor<8x8xf64, #sparse>) -> ()
  }) : () -> ()
}) : () -> ()

