"builtin.module"() ({
  "func.func"() <{function_type = (f32, tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "scale_dd"}> ({
  ^bb0(%arg11: f32 loc("<stdin>":9:8), %arg12: tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>> loc("<stdin>":9:21), %arg13: tensor<?x?xf32> loc("<stdin>":9:55)):
    %5 = "linalg.generic"(%arg12, %arg13) <{doc = "X(i,j) = A(i,j) * SCALE", indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg14: f32 loc("<stdin>":11:10), %arg15: f32 loc("<stdin>":11:23)):
      %6 = "arith.mulf"(%arg14, %arg11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":12:12)
      "linalg.yield"(%6) : (f32) -> () loc("<stdin>":13:7)
    }) : (tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>>, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":10:10)
    "func.return"(%5) : (tensor<?x?xf32>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = (f32, tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "scale_ss"}> ({
  ^bb0(%arg6: f32 loc("<stdin>":18:8), %arg7: tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":18:20), %arg8: tensor<?x?xf32> loc("<stdin>":18:54)):
    %3 = "linalg.generic"(%arg7, %arg8) <{doc = "X(i,j) = A(i,j) * SCALE", indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg9: f32 loc("<stdin>":20:10), %arg10: f32 loc("<stdin>":20:22)):
      %4 = "arith.mulf"(%arg9, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":21:12)
      "linalg.yield"(%4) : (f32) -> () loc("<stdin>":22:7)
    }) : (tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":19:10)
    "func.return"(%3) : (tensor<?x?xf32>) -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (tensor<16x32xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<32xf32>, tensor<16xf32>) -> tensor<16xf32>, sym_name = "matvec"}> ({
  ^bb0(%arg0: tensor<16x32xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":27:8), %arg1: tensor<32xf32> loc("<stdin>":27:44), %arg2: tensor<16xf32> loc("<stdin>":27:67)):
    %0 = "linalg.generic"(%arg0, %arg1, %arg2) <{doc = "x(i) += A(i,j) * b(j)", indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":29:10), %arg4: f32 loc("<stdin>":29:22), %arg5: f32 loc("<stdin>":29:34)):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":30:12)
      %2 = "arith.addf"(%1, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":31:12)
      "linalg.yield"(%2) : (f32) -> () loc("<stdin>":32:7)
    }) : (tensor<16x32xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<32xf32>, tensor<16xf32>) -> tensor<16xf32> loc("<stdin>":28:10)
    "func.return"(%0) : (tensor<16xf32>) -> () loc("<stdin>":34:5)
  }) : () -> () loc("<stdin>":26:3)
}) : () -> () loc("<stdin>":7:1)
