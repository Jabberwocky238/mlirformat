"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>>) -> tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>>, sym_name = "sparse_scale"}> ({
  ^bb0(%arg12: tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>> loc("<stdin>":7:8)):
    %5 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32 loc("<stdin>":8:10)
    %6 = "linalg.generic"(%arg12) <{doc = "X(i,j) = X(i,j) * 2.0", indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg13: f32 loc("<stdin>":10:10)):
      %7 = "arith.mulf"(%arg13, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":11:12)
      "linalg.yield"(%7) : (f32) -> () loc("<stdin>":12:7)
    }) : (tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>>) -> tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>> loc("<stdin>":9:10)
    "func.return"(%6) : (tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>>) -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = (tensor<32x64xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>>, tensor<64xf64>, tensor<32xf64>) -> tensor<32xf64>, sym_name = "matvec"}> ({
  ^bb0(%arg6: tensor<32x64xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>> loc("<stdin>":17:8), %arg7: tensor<64xf64> loc("<stdin>":17:43), %arg8: tensor<32xf64> loc("<stdin>":17:66)):
    %2 = "linalg.generic"(%arg6, %arg7, %arg8) <{doc = "x(i) += A(i,j) * b(j)", indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg9: f64 loc("<stdin>":19:10), %arg10: f64 loc("<stdin>":19:22), %arg11: f64 loc("<stdin>":19:35)):
      %3 = "arith.mulf"(%arg9, %arg10) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":20:12)
      %4 = "arith.addf"(%arg11, %3) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":21:12)
      "linalg.yield"(%4) : (f64) -> () loc("<stdin>":22:7)
    }) : (tensor<32x64xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>>, tensor<64xf64>, tensor<32xf64>) -> tensor<32xf64> loc("<stdin>":18:10)
    "func.return"(%2) : (tensor<32xf64>) -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":16:3)
  "func.func"() <{function_type = (tensor<32x64xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>>, tensor<32x64xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>>, tensor<32x64xf64>) -> tensor<32x64xf64>, sym_name = "mateltmul"}> ({
  ^bb0(%arg0: tensor<32x64xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>> loc("<stdin>":27:8), %arg1: tensor<32x64xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>> loc("<stdin>":27:43), %arg2: tensor<32x64xf64> loc("<stdin>":27:78)):
    %0 = "linalg.generic"(%arg0, %arg1, %arg2) <{doc = "Z(i,j) = X(i,j) * Y(i,j)", indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f64 loc("<stdin>":29:10), %arg4: f64 loc("<stdin>":29:22), %arg5: f64 loc("<stdin>":29:34)):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":30:12)
      "linalg.yield"(%1) : (f64) -> () loc("<stdin>":31:7)
    }) : (tensor<32x64xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>>, tensor<32x64xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>>, tensor<32x64xf64>) -> tensor<32x64xf64> loc("<stdin>":28:10)
    "func.return"(%0) : (tensor<32x64xf64>) -> () loc("<stdin>":33:5)
  }) : () -> () loc("<stdin>":26:3)
}) : () -> () loc("<stdin>":5:1)
