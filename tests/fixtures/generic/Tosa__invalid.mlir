"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_non_tosa_ops"}> ({
    %0 = "arith.constant"() <{value = 6 : index}> : () -> index
    %1 = "tensor.empty"(%0) : (index) -> tensor<?x27xi64>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

