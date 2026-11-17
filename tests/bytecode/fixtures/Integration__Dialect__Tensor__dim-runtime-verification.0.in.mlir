"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":3:10)
    %1 = "tensor.empty"() : () -> tensor<1xf32> loc("<stdin>":4:10)
    %2 = "tensor.dim"(%1, %0) : (tensor<1xf32>, index) -> index loc("<stdin>":5:10)
    "func.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
