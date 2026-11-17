"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 64, crdWidth = 64 }>>, tensor<32xf64>, tensor<32xf64>) -> tensor<32xf64>, sym_name = "mul64"}> ({
  ^bb0(%arg6: tensor<32xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 64, crdWidth = 64 }>> loc("<stdin>":6:8), %arg7: tensor<32xf64> loc("<stdin>":6:40), %arg8: tensor<32xf64> loc("<stdin>":6:63)):
    %2 = "linalg.generic"(%arg6, %arg7, %arg8) <{doc = "x(i) = a(i) * b(i)", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg9: f64 loc("<stdin>":8:10), %arg10: f64 loc("<stdin>":8:22), %arg11: f64 loc("<stdin>":8:35)):
      %3 = "arith.mulf"(%arg9, %arg10) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":9:12)
      "linalg.yield"(%3) : (f64) -> () loc("<stdin>":10:7)
    }) : (tensor<32xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 64, crdWidth = 64 }>>, tensor<32xf64>, tensor<32xf64>) -> tensor<32xf64> loc("<stdin>":7:10)
    "func.return"(%2) : (tensor<32xf64>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = (tensor<32xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 32, crdWidth = 32 }>>, tensor<32xf64>, tensor<32xf64>) -> tensor<32xf64>, sym_name = "mul32"}> ({
  ^bb0(%arg0: tensor<32xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 32, crdWidth = 32 }>> loc("<stdin>":15:8), %arg1: tensor<32xf64> loc("<stdin>":15:41), %arg2: tensor<32xf64> loc("<stdin>":15:64)):
    %0 = "linalg.generic"(%arg0, %arg1, %arg2) <{doc = "x(i) = a(i) * b(i)", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f64 loc("<stdin>":17:10), %arg4: f64 loc("<stdin>":17:22), %arg5: f64 loc("<stdin>":17:34)):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":18:12)
      "linalg.yield"(%1) : (f64) -> () loc("<stdin>":19:7)
    }) : (tensor<32xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 32, crdWidth = 32 }>>, tensor<32xf64>, tensor<32xf64>) -> tensor<32xf64> loc("<stdin>":16:10)
    "func.return"(%0) : (tensor<32xf64>) -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":14:3)
}) : () -> () loc("<stdin>":4:1)
