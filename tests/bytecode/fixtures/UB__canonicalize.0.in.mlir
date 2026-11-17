"builtin.module"() ({
  "func.func"() <{function_type = () -> (i32, i32), sym_name = "merge_poison"}> ({
    %0 = "ub.poison"() <{value = #ub.poison}> : () -> i32 loc("<stdin>":3:10)
    %1 = "ub.poison"() <{value = #ub.poison}> : () -> i32 loc("<stdin>":4:10)
    "func.return"(%0, %1) : (i32, i32) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
