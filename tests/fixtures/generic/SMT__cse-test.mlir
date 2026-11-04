"builtin.module"() ({
  "func.func"() <{function_type = (i8) -> (!smt.bool, !smt.bool), sym_name = "declare_const_cse"}> ({
  ^bb0(%arg0: i8):
    %0 = "smt.declare_fun"() <{namePrefix = "a"}> : () -> !smt.bool
    %1 = "smt.declare_fun"() <{namePrefix = "a"}> : () -> !smt.bool
    %2 = "smt.declare_fun"() <{namePrefix = "a"}> : () -> !smt.bool
    "func.return"(%0, %1) : (!smt.bool, !smt.bool) -> ()
  }) : () -> ()
}) : () -> ()

