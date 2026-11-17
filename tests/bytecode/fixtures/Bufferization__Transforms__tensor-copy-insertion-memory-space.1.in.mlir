"builtin.module"() ({
  "func.func"() <{function_type = () -> (tensor<10xf32>, tensor<10xf32>), sym_name = "alloc_tensor_copy"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":5:10)
    %2 = "bufferization.alloc_tensor"() <{memory_space = 1 : ui64, operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> tensor<10xf32> loc("<stdin>":6:10)
    %3 = "tensor.insert"(%1, %2, %0) : (f32, tensor<10xf32>, index) -> tensor<10xf32> loc("<stdin>":7:10)
    "func.return"(%3, %2) : (tensor<10xf32>, tensor<10xf32>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
