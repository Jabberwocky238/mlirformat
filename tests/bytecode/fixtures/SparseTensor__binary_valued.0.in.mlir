"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x3x8xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : dense, d2 : compressed), explicitVal = 1.000000e+00 : f32 }>>) -> tensor<f32>, sym_name = "sum_squares"}> ({
  ^bb0(%arg9: tensor<2x3x8xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : dense, d2 : compressed), explicitVal = 1.000000e+00 : f32 }>> loc("<stdin>":6:8)):
    %8 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":7:10)
    %9 = "tensor.empty"() : () -> tensor<2x3x8xf32> loc("<stdin>":8:10)
    %10 = "linalg.generic"(%arg9, %arg9, %9) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg14: f32 loc("<stdin>":10:10), %arg15: f32 loc("<stdin>":10:23), %arg16: f32 loc("<stdin>":10:36)):
      %15 = "arith.mulf"(%arg14, %arg15) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":11:13)
      "linalg.yield"(%15) : (f32) -> () loc("<stdin>":12:7)
    }) : (tensor<2x3x8xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : dense, d2 : compressed), explicitVal = 1.000000e+00 : f32 }>>, tensor<2x3x8xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : dense, d2 : compressed), explicitVal = 1.000000e+00 : f32 }>>, tensor<2x3x8xf32>) -> tensor<2x3x8xf32> loc("<stdin>":9:11)
    %11 = "tensor.empty"() : () -> tensor<f32> loc("<stdin>":14:11)
    %12 = "linalg.fill"(%8, %11) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg12: f32 loc("<stdin>":16:10), %arg13: f32 loc("<stdin>":16:23)):
      "linalg.yield"(%arg12) : (f32) -> () loc("<stdin>":17:7)
    }) : (f32, tensor<f32>) -> tensor<f32> loc("<stdin>":15:11)
    %13 = "linalg.generic"(%10, %12) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> ()>], iterator_types = [#linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg10: f32 loc("<stdin>":20:10), %arg11: f32 loc("<stdin>":20:23)):
      %14 = "arith.addf"(%arg10, %arg11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":21:13)
      "linalg.yield"(%14) : (f32) -> () loc("<stdin>":22:7)
    }) : (tensor<2x3x8xf32>, tensor<f32>) -> tensor<f32> loc("<stdin>":19:11)
    "func.return"(%13) : (tensor<f32>) -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = (tensor<2x3x8xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : dense, d2 : compressed), explicitVal = 1.000000e+00 : f32 }>>, tensor<2x3x8xf32>) -> tensor<f32>, sym_name = "sum_products"}> ({
  ^bb0(%arg0: tensor<2x3x8xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : dense, d2 : compressed), explicitVal = 1.000000e+00 : f32 }>> loc("<stdin>":27:8), %arg1: tensor<2x3x8xf32> loc("<stdin>":27:43)):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":28:10)
    %1 = "tensor.empty"() : () -> tensor<2x3x8xf32> loc("<stdin>":29:10)
    %2 = "linalg.generic"(%arg0, %arg1, %1) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: f32 loc("<stdin>":31:10), %arg7: f32 loc("<stdin>":31:22), %arg8: f32 loc("<stdin>":31:34)):
      %7 = "arith.mulf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":32:12)
      "linalg.yield"(%7) : (f32) -> () loc("<stdin>":33:7)
    }) : (tensor<2x3x8xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : dense, d2 : compressed), explicitVal = 1.000000e+00 : f32 }>>, tensor<2x3x8xf32>, tensor<2x3x8xf32>) -> tensor<2x3x8xf32> loc("<stdin>":30:10)
    %3 = "tensor.empty"() : () -> tensor<f32> loc("<stdin>":35:10)
    %4 = "linalg.fill"(%0, %3) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32 loc("<stdin>":37:10), %arg5: f32 loc("<stdin>":37:22)):
      "linalg.yield"(%arg4) : (f32) -> () loc("<stdin>":38:7)
    }) : (f32, tensor<f32>) -> tensor<f32> loc("<stdin>":36:10)
    %5 = "linalg.generic"(%2, %4) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> ()>], iterator_types = [#linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":41:10), %arg3: f32 loc("<stdin>":41:22)):
      %6 = "arith.addf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":42:12)
      "linalg.yield"(%6) : (f32) -> () loc("<stdin>":43:7)
    }) : (tensor<2x3x8xf32>, tensor<f32>) -> tensor<f32> loc("<stdin>":40:10)
    "func.return"(%5) : (tensor<f32>) -> () loc("<stdin>":45:5)
  }) : () -> () loc("<stdin>":26:3)
}) : () -> () loc("<stdin>":4:1)
