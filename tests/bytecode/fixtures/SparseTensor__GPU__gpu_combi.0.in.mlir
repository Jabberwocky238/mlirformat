"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1024x8xf64>, tensor<8x1024xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<1024x1024xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<1024x1024xf64>, sym_name = "matmuls"}> ({
  ^bb0(%arg0: tensor<1024x8xf64> loc("<stdin>":7:8), %arg1: tensor<8x1024xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":7:35), %arg2: tensor<1024x1024xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":7:71)):
    %0 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<1024x1024xf64>}> : () -> tensor<1024x1024xf64> loc("<stdin>":8:10)
    %1 = "linalg.matmul"(%arg0, %arg1, %0) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: f64 loc("<stdin>":10:10), %arg7: f64 loc("<stdin>":10:22), %arg8: f64 loc("<stdin>":10:34)):
      %5 = "arith.mulf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":11:12)
      %6 = "arith.addf"(%arg8, %5) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":12:12)
      "linalg.yield"(%6) : (f64) -> () loc("<stdin>":13:7)
    }) : (tensor<1024x8xf64>, tensor<8x1024xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<1024x1024xf64>) -> tensor<1024x1024xf64> loc("<stdin>":9:10)
    %2 = "linalg.matmul"(%1, %arg2, %0) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f64 loc("<stdin>":16:10), %arg4: f64 loc("<stdin>":16:22), %arg5: f64 loc("<stdin>":16:34)):
      %3 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":17:12)
      %4 = "arith.addf"(%arg5, %3) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":18:12)
      "linalg.yield"(%4) : (f64) -> () loc("<stdin>":19:7)
    }) : (tensor<1024x1024xf64>, tensor<1024x1024xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<1024x1024xf64>) -> tensor<1024x1024xf64> loc("<stdin>":15:10)
    "func.return"(%2) : (tensor<1024x1024xf64>) -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":6:3)
}) : () -> () loc("<stdin>":5:1)
