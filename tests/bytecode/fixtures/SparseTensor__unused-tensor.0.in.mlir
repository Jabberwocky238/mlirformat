"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x4xf64>, tensor<8x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<2x4xf64>) -> tensor<2x4xf64>, sym_name = "b_ununsed"}> ({
  ^bb0(%arg0: tensor<2x4xf64> loc("<stdin>":6:8), %arg1: tensor<8x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":6:32), %arg2: tensor<2x4xf64> loc("<stdin>":6:65)):
    %0 = "linalg.generic"(%arg0, %arg1, %arg2) <{doc = "C(i,j) = SUM_k A(i,j)", indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f64 loc("<stdin>":8:10), %arg4: f64 loc("<stdin>":8:22), %arg5: f64 loc("<stdin>":8:34)):
      %1 = "arith.addf"(%arg5, %arg3) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":9:12)
      "linalg.yield"(%1) : (f64) -> () loc("<stdin>":10:7)
    }) : (tensor<2x4xf64>, tensor<8x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<2x4xf64>) -> tensor<2x4xf64> loc("<stdin>":7:10)
    "func.return"(%0) : (tensor<2x4xf64>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":4:1)
