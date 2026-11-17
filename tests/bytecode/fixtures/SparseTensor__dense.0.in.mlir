"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>>, tensor<32x16xf32>) -> tensor<32x16xf32>, sym_name = "dense1"}> ({
  ^bb0(%arg8: tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>> loc("<stdin>":7:8), %arg9: tensor<32x16xf32> loc("<stdin>":7:43)):
    %5 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":8:10)
    %6 = "linalg.generic"(%arg8, %arg9) <{doc = "X(i,j) = A(i,j) + 1", indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg10: f32 loc("<stdin>":10:10), %arg11: f32 loc("<stdin>":10:23)):
      %7 = "arith.addf"(%arg10, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":11:12)
      "linalg.yield"(%7) : (f32) -> () loc("<stdin>":12:7)
    }) : (tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>>, tensor<32x16xf32>) -> tensor<32x16xf32> loc("<stdin>":9:10)
    "func.return"(%6) : (tensor<32x16xf32>) -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = (tensor<32x16xf32>, tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>>) -> tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>>, sym_name = "dense2"}> ({
  ^bb0(%arg4: tensor<32x16xf32> loc("<stdin>":17:8), %arg5: tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>> loc("<stdin>":17:34)):
    %2 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":18:10)
    %3 = "linalg.generic"(%arg4, %arg5) <{doc = "X(i,j) = A(i,j) + 1", indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: f32 loc("<stdin>":20:10), %arg7: f32 loc("<stdin>":20:22)):
      %4 = "arith.addf"(%arg6, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":21:12)
      "linalg.yield"(%4) : (f32) -> () loc("<stdin>":22:7)
    }) : (tensor<32x16xf32>, tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>>) -> tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>> loc("<stdin>":19:10)
    "func.return"(%3) : (tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>>) -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":16:3)
  "func.func"() <{function_type = (tensor<32x16x8xf32>, tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>>) -> tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>>, sym_name = "dense3"}> ({
  ^bb0(%arg0: tensor<32x16x8xf32> loc("<stdin>":27:8), %arg1: tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>> loc("<stdin>":27:36)):
    %0 = "linalg.generic"(%arg0, %arg1) <{doc = "X(i,j) += A(i,j,k)", indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":29:10), %arg3: f32 loc("<stdin>":29:22)):
      %1 = "arith.addf"(%arg3, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":30:12)
      "linalg.yield"(%1) : (f32) -> () loc("<stdin>":31:7)
    }) : (tensor<32x16x8xf32>, tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>>) -> tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>> loc("<stdin>":28:10)
    "func.return"(%0) : (tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>>) -> () loc("<stdin>":33:5)
  }) : () -> () loc("<stdin>":26:3)
}) : () -> () loc("<stdin>":5:1)
