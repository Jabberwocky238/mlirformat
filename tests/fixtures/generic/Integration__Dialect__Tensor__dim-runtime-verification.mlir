"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 4 : index}> : () -> index
    %1 = "tensor.empty"() : () -> tensor<1xf32>
    %2 = "tensor.dim"(%1, %0) : (tensor<1xf32>, index) -> index
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

