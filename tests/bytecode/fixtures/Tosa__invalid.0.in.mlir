"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_non_tosa_ops"}> ({
    %0 = "arith.constant"() <{value = 6 : index}> : () -> index loc("<stdin>":3:10)
    %1 = "tensor.empty"(%0) : (index) -> tensor<?x27xi64> loc("<stdin>":4:10)
    "func.return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
