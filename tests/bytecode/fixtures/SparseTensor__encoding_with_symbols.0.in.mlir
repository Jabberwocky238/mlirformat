"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x8xf32, #sparse_tensor.encoding<{ map = [s0](d0, d1) -> (d0 * (s0 * 3) : dense, d0 : dense, d1 : compressed) }>>) -> tensor<8x8xf32>, sym_name = "tensor_add"}> ({
  ^bb0(%arg0: tensor<8x8xf32, #sparse_tensor.encoding<{ map = [s0](d0, d1) -> (d0 * (s0 * 3) : dense, d0 : dense, d1 : compressed) }>> loc("<stdin>":4:8)):
    %0 = "tensor.empty"() : () -> tensor<8x8xf32> loc("<stdin>":5:10)
    %1 = "linalg.add"(%arg0, %arg0, %0) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg1: f32 loc("<stdin>":7:10), %arg2: f32 loc("<stdin>":7:22), %arg3: f32 loc("<stdin>":7:34)):
      %2 = "arith.addf"(%arg1, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":8:12)
      "linalg.yield"(%2) : (f32) -> () loc("<stdin>":9:7)
    }) : (tensor<8x8xf32, #sparse_tensor.encoding<{ map = [s0](d0, d1) -> (d0 * (s0 * 3) : dense, d0 : dense, d1 : compressed) }>>, tensor<8x8xf32, #sparse_tensor.encoding<{ map = [s0](d0, d1) -> (d0 * (s0 * 3) : dense, d0 : dense, d1 : compressed) }>>, tensor<8x8xf32>) -> tensor<8x8xf32> loc("<stdin>":6:10)
    "func.return"(%1) : (tensor<8x8xf32>) -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
