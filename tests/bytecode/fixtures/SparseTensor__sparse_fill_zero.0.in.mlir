"builtin.module"() ({
  "func.func"() <{function_type = (tensor<100x200xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<200x300xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<100x300xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, sym_name = "fill_zero_after_alloc"}> ({
  ^bb0(%arg0: tensor<100x200xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":7:8), %arg1: tensor<200x300xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":7:45)):
    %0 = "tensor.empty"() : () -> tensor<100x300xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":8:10)
    %1 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64 loc("<stdin>":9:10)
    %2 = "linalg.fill"(%1, %0) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg5: f64 loc("<stdin>":11:10), %arg6: f64 loc("<stdin>":11:22)):
      "linalg.yield"(%arg5) : (f64) -> () loc("<stdin>":12:7)
    }) : (f64, tensor<100x300xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<100x300xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":10:10)
    %3 = "linalg.matmul"(%arg0, %arg1, %2) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f64 loc("<stdin>":15:10), %arg3: f64 loc("<stdin>":15:22), %arg4: f64 loc("<stdin>":15:34)):
      %4 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":16:12)
      %5 = "arith.addf"(%arg4, %4) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":17:12)
      "linalg.yield"(%5) : (f64) -> () loc("<stdin>":18:7)
    }) : (tensor<100x200xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<200x300xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<100x300xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<100x300xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":14:10)
    "func.return"(%3) : (tensor<100x300xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":6:3)
}) : () -> () loc("<stdin>":5:1)
