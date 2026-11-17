"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>>) -> tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, sym_name = "kernel"}> ({
  ^bb0(%arg10: tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>> loc("<stdin>":12:8)):
    %8 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":13:10)
    %9 = "tensor.dim"(%arg10, %8) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>>, index) -> index loc("<stdin>":14:10)
    %10 = "tensor.empty"(%9) : (index) -> tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":15:11)
    %11 = "linalg.generic"(%arg10, %10) <{doc = "X(i) = SUM A(i,j)", indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg11: f64 loc("<stdin>":17:10), %arg12: f64 loc("<stdin>":17:23)):
      %12 = "arith.addf"(%arg12, %arg11) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":18:13)
      "linalg.yield"(%12) : (f64) -> () loc("<stdin>":19:7)
    }) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>>, tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":16:11)
    "func.return"(%11) : (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":11:3)
  "func.func"() <{function_type = (tensor<8x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<8x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, sym_name = "matmul1"}> ({
  ^bb0(%arg5: tensor<8x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":24:8), %arg6: tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":24:42)):
    %4 = "tensor.empty"() : () -> tensor<8x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":25:10)
    %5 = "linalg.matmul"(%arg5, %arg6, %4) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: f64 loc("<stdin>":27:10), %arg8: f64 loc("<stdin>":27:22), %arg9: f64 loc("<stdin>":27:34)):
      %6 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":28:12)
      %7 = "arith.addf"(%arg9, %6) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":29:12)
      "linalg.yield"(%7) : (f64) -> () loc("<stdin>":30:7)
    }) : (tensor<8x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<8x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<8x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":26:10)
    "func.return"(%5) : (tensor<8x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":32:5)
  }) : () -> () loc("<stdin>":23:3)
  "func.func"() <{function_type = (tensor<8x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>, tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>) -> tensor<8x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>, sym_name = "matmul2"}> ({
  ^bb0(%arg0: tensor<8x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>> loc("<stdin>":35:8), %arg1: tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>> loc("<stdin>":35:42)):
    %0 = "tensor.empty"() : () -> tensor<8x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>> loc("<stdin>":36:10)
    %1 = "linalg.matmul"(%arg0, %arg1, %0) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f64 loc("<stdin>":38:10), %arg3: f64 loc("<stdin>":38:22), %arg4: f64 loc("<stdin>":38:34)):
      %2 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":39:12)
      %3 = "arith.addf"(%arg4, %2) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":40:12)
      "linalg.yield"(%3) : (f64) -> () loc("<stdin>":41:7)
    }) : (tensor<8x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>, tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>, tensor<8x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>) -> tensor<8x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>> loc("<stdin>":37:10)
    "func.return"(%1) : (tensor<8x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>) -> () loc("<stdin>":43:5)
  }) : () -> () loc("<stdin>":34:3)
}) : () -> () loc("<stdin>":10:1)
