"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "logical"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":3:8), %arg1: i32 loc("<stdin>":3:20)):
    %0 = "emitc.logical_and"(%arg0, %arg1) : (i32, i32) -> i1 loc("<stdin>":4:10)
    %1 = "emitc.logical_not"(%arg0) : (i32) -> i1 loc("<stdin>":5:10)
    %2 = "emitc.logical_or"(%arg0, %arg1) : (i32, i32) -> i1 loc("<stdin>":6:10)
    "func.return"() : () -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
