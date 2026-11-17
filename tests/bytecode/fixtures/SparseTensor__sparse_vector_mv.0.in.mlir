"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>>, tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>, sym_name = "kernel_matvec"}> ({
  ^bb0(%arg0: tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>> loc("<stdin>":7:8), %arg1: tensor<?xf32> loc("<stdin>":7:41), %arg2: tensor<?xf32> loc("<stdin>":7:63)):
    %0 = "linalg.generic"(%arg0, %arg1, %arg2) <{doc = "X(i) += A(i,j) * B(j)", indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":9:10), %arg4: f32 loc("<stdin>":9:22), %arg5: f32 loc("<stdin>":9:34)):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":10:12)
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":11:12)
      "linalg.yield"(%2) : (f32) -> () loc("<stdin>":12:7)
    }) : (tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>>, tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32> loc("<stdin>":8:10)
    "func.return"(%0) : (tensor<?xf32>) -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":6:3)
}) : () -> () loc("<stdin>":5:1)
