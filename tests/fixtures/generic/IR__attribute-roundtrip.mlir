"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<160xi1>, sym_name = "large_i1_tensor_roundtrip"}> ({
    %0 = "arith.constant"() <{value = dense<"0xFFF00000FF000000FF000000FF000000FF000000"> : tensor<160xi1>}> : () -> tensor<160xi1>
    %1 = "arith.constant"() <{value = dense<"0xFF000000FF000000FF000000FF000000FF0000F0"> : tensor<160xi1>}> : () -> tensor<160xi1>
    %2 = "arith.andi"(%0, %1) : (tensor<160xi1>, tensor<160xi1>) -> tensor<160xi1>
    "func.return"(%2) : (tensor<160xi1>) -> ()
  }) : () -> ()
}) : () -> ()

