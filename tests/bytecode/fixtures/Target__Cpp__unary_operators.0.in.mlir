"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (), sym_name = "unary"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":3:8)):
    %0 = "emitc.unary_minus"(%arg0) : (i32) -> i32 loc("<stdin>":4:10)
    %1 = "emitc.unary_plus"(%arg0) : (i32) -> i32 loc("<stdin>":5:10)
    "func.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
