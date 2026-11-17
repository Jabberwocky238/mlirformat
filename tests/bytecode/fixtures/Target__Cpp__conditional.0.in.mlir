"builtin.module"() ({
  "func.func"() <{function_type = (i1, i32, i32) -> (), sym_name = "cond"}> ({
  ^bb0(%arg0: i1 loc("<stdin>":3:8), %arg1: i32 loc("<stdin>":3:19), %arg2: i32 loc("<stdin>":3:31)):
    %0 = "emitc.conditional"(%arg0, %arg1, %arg2) : (i1, i32, i32) -> i32 loc("<stdin>":4:10)
    "func.return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
