"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f64>, tensor<64x32xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<64x32xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<f64>, sym_name = "sparse_matrix_sum"}> ({
  ^bb0(%arg0: tensor<f64> loc("<stdin>":6:8), %arg1: tensor<64x32xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":6:28), %arg2: tensor<64x32xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":6:63)):
    %0 = "linalg.generic"(%arg1, %arg2, %arg0) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> ()>], iterator_types = [#linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f64 loc("<stdin>":8:10), %arg4: f64 loc("<stdin>":8:22), %arg5: f64 loc("<stdin>":8:34)):
      %1 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":9:12)
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":10:12)
      "linalg.yield"(%2) : (f64) -> () loc("<stdin>":11:7)
    }) : (tensor<64x32xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<64x32xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<f64>) -> tensor<f64> loc("<stdin>":7:10)
    "func.return"(%0) : (tensor<f64>) -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":4:1)
