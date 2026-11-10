#sparse = #sparse_tensor.encoding<{ map = [s0](d0, d1) -> (d0 * (s0 * 3) : dense, d0 : dense, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x8xf32, #sparse>) -> tensor<8x8xf32>, sym_name = "tensor_add"}> ({
  ^bb0(%arg0: tensor<8x8xf32, #sparse>):
    %0 = "tensor.empty"() : () -> tensor<8x8xf32>
    %1 = "linalg.add"(%arg0, %arg0, %0) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32, %arg3: f32):
      %2 = "arith.addf"(%arg1, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<8x8xf32, #sparse>, tensor<8x8xf32, #sparse>, tensor<8x8xf32>) -> tensor<8x8xf32>
    "func.return"(%1) : (tensor<8x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

