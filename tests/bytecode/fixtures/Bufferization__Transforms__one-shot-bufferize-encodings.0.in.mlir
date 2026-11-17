"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<128xf32>, sym_name = "alloc_tesor_with_space_no_encoding"}> ({
    %0 = "bufferization.alloc_tensor"() <{memory_space = 1 : i64, operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> tensor<128xf32> loc("<stdin>":3:10)
    "func.return"(%0) : (tensor<128xf32>) -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
