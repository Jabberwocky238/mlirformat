"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x32xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<32x32xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<32x32xf32>, sym_name = "storage_specifier_passthrough"}> ({
  ^bb0(%arg0: tensor<32x32xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":4:8), %arg1: tensor<32x32xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":4:43)):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":5:10)
    %1 = "tensor.empty"() : () -> tensor<32x32xf32> loc("<stdin>":6:10)
    %2 = "linalg.fill"(%0, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg5: f32 loc("<stdin>":8:10), %arg6: f32 loc("<stdin>":8:22)):
      "linalg.yield"(%arg5) : (f32) -> () loc("<stdin>":9:7)
    }) : (f32, tensor<32x32xf32>) -> tensor<32x32xf32> loc("<stdin>":7:10)
    %3 = "linalg.add"(%arg0, %arg1, %2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":12:10), %arg3: f32 loc("<stdin>":12:22), %arg4: f32 loc("<stdin>":12:34)):
      %4 = "arith.addf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":13:12)
      "linalg.yield"(%4) : (f32) -> () loc("<stdin>":14:7)
    }) : (tensor<32x32xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<32x32xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<32x32xf32>) -> tensor<32x32xf32> loc("<stdin>":11:10)
    "func.return"(%3) : (tensor<32x32xf32>) -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
