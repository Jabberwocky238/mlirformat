"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x16xf32>) -> (), sym_name = "zero_results"}> ({
  ^bb0(%arg0: tensor<1x16xf32>):
    "tosa.custom"(%arg0) <{domain_name = "test", implementation_attrs = "{}", operator_name = "NoResult"}> : (tensor<1x16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

