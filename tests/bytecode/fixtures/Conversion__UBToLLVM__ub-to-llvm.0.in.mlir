"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "check_poison"}> ({
    %0 = "ub.poison"() <{value = #ub.poison}> : () -> index loc("<stdin>":3:10)
    %1 = "ub.poison"() <{value = #ub.poison}> : () -> i16 loc("<stdin>":4:10)
    %2 = "ub.poison"() <{value = #ub.poison}> : () -> f64 loc("<stdin>":5:10)
    %3 = "ub.poison"() <{value = #ub.poison}> : () -> !llvm.ptr loc("<stdin>":6:10)
    "func.return"() : () -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "check_unrechable"}> ({
    "ub.unreachable"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":9:3)
}) : () -> () loc("<stdin>":1:1)
