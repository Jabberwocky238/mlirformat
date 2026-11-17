"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "int"}> ({
  ^bb0(%arg2: i32 loc("<stdin>":3:8)):
    "func.return"(%arg2) : (i32) -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (index) -> index, sym_name = "index"}> ({
  ^bb0(%arg1: index loc("<stdin>":7:8)):
    "func.return"(%arg1) : (index) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = (index) -> index, sym_name = "call_with_one_result"}> ({
  ^bb0(%arg0: index loc("<stdin>":11:8)):
    %0 = "func.call"(%arg0) <{callee = @index}> : (index) -> index loc("<stdin>":12:10)
    "func.return"(%0) : (index) -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":10:3)
}) : () -> () loc("<stdin>":1:1)
