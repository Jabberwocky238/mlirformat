"builtin.module"() ({
  "func.func"() <{function_type = () -> (index, index, index, index), sym_name = "merge_constants"}> ({
    %0 = "arith.constant"() <{value = 42 : index}> : () -> index loc("<stdin>":3:10)
    %1 = "arith.constant"() <{value = 42 : index}> : () -> index loc("<stdin>":4:10)
    %2 = "arith.constant"() <{value = 42 : index}> : () -> index loc("<stdin>":5:10)
    %3 = "arith.constant"() <{value = 42 : index}> : () -> index loc("<stdin>":6:10)
    "func.return"(%0, %1, %2, %3) : (index, index, index, index) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
