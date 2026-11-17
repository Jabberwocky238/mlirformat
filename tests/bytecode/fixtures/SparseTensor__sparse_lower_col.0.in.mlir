"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x64xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>, tensor<64xf64>, tensor<32xf64>) -> tensor<32xf64>, sym_name = "matvec"}> ({
  ^bb0(%arg0: tensor<32x64xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>> loc("<stdin>":7:8), %arg1: tensor<64xf64> loc("<stdin>":7:43), %arg2: tensor<32xf64> loc("<stdin>":7:66)):
    %0 = "linalg.generic"(%arg0, %arg1, %arg2) <{doc = "x(i) += A(i,j) * b(j)", indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f64 loc("<stdin>":9:10), %arg4: f64 loc("<stdin>":9:22), %arg5: f64 loc("<stdin>":9:34)):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":10:12)
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":11:12)
      "linalg.yield"(%2) : (f64) -> () loc("<stdin>":12:7)
    }) : (tensor<32x64xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>, tensor<64xf64>, tensor<32xf64>) -> tensor<32xf64> loc("<stdin>":8:10)
    "func.return"(%0) : (tensor<32xf64>) -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":6:3)
}) : () -> () loc("<stdin>":5:1)
