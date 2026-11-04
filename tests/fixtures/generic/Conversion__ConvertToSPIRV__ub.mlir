"builtin.module"() ({
  "func.func"() <{function_type = () -> index, sym_name = "ub"}> ({
    %0 = "ub.poison"() <{value = #ub.poison}> : () -> index
    "func.return"(%0) : (index) -> ()
  }) : () -> ()
}) : () -> ()

