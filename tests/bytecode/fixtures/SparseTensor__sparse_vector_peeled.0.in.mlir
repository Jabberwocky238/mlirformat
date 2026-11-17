"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 32, crdWidth = 32 }>>, tensor<1024xf32>, tensor<1024xf32>) -> tensor<1024xf32>, sym_name = "mul_s"}> ({
  ^bb0(%arg0: tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 32, crdWidth = 32 }>> loc("<stdin>":5:8), %arg1: tensor<1024xf32> loc("<stdin>":5:42), %arg2: tensor<1024xf32> loc("<stdin>":5:67)):
    %0 = "linalg.generic"(%arg0, %arg1, %arg2) <{doc = "x(i) = a(i) * b(i)", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":7:10), %arg4: f32 loc("<stdin>":7:22), %arg5: f32 loc("<stdin>":7:34)):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":8:12)
      "linalg.yield"(%1) : (f32) -> () loc("<stdin>":9:7)
    }) : (tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 32, crdWidth = 32 }>>, tensor<1024xf32>, tensor<1024xf32>) -> tensor<1024xf32> loc("<stdin>":6:10)
    "func.return"(%0) : (tensor<1024xf32>) -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":4:3)
}) : () -> () loc("<stdin>":3:1)
