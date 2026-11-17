"builtin.module"() ({
  "func.func"() <{function_type = () -> index, sym_name = "ub"}> ({
    %0 = "ub.poison"() <{value = #ub.poison}> : () -> index loc("<stdin>":3:10)
    "func.return"(%0) : (index) -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
