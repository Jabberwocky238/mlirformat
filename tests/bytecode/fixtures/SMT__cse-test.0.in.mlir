"builtin.module"() ({
  "func.func"() <{function_type = (i8) -> (!smt.bool, !smt.bool), sym_name = "declare_const_cse"}> ({
  ^bb0(%arg0: i8 loc("<stdin>":3:8)):
    %0 = "smt.declare_fun"() <{namePrefix = "a"}> : () -> !smt.bool loc("<stdin>":4:10)
    %1 = "smt.declare_fun"() <{namePrefix = "a"}> : () -> !smt.bool loc("<stdin>":5:10)
    %2 = "smt.declare_fun"() <{namePrefix = "a"}> : () -> !smt.bool loc("<stdin>":6:10)
    "func.return"(%0, %1) : (!smt.bool, !smt.bool) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
