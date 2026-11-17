"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "private", sym_visibility = "private"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":3:8)):
    "func.return"(%arg0) : (i32) -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> i32, sym_name = "simple_private"}> ({
    %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":7:10)
    %1 = "func.call"(%0) <{callee = @private}> : (i32) -> i32 loc("<stdin>":8:10)
    "func.return"(%1) : (i32) -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":6:3)
}) : () -> () loc("<stdin>":1:1)
