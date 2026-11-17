"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> i32, sym_name = "tensor_extract_constant"}> ({
  ^bb0(%arg0: index loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:22), %arg2: index loc("<stdin>":3:36)):
    %0 = "arith.constant"() <{value = dense<[[[1, 2, 3], [4, 5, 6]], [[7, 8, 9], [10, 11, 12]]]> : tensor<2x2x3xi32>}> : () -> tensor<2x2x3xi32> loc("<stdin>":4:10)
    %1 = "tensor.extract"(%0, %arg0, %arg1, %arg2) : (tensor<2x2x3xi32>, index, index, index) -> i32 loc("<stdin>":5:10)
    "func.return"(%1) : (i32) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
