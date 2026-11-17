"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "bitwise"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":3:8), %arg1: i32 loc("<stdin>":3:20)):
    %0 = "emitc.bitwise_and"(%arg0, %arg1) : (i32, i32) -> i32 loc("<stdin>":4:10)
    %1 = "emitc.bitwise_left_shift"(%arg0, %arg1) : (i32, i32) -> i32 loc("<stdin>":5:10)
    %2 = "emitc.bitwise_not"(%arg0) : (i32) -> i32 loc("<stdin>":6:10)
    %3 = "emitc.bitwise_or"(%arg0, %arg1) : (i32, i32) -> i32 loc("<stdin>":7:10)
    %4 = "emitc.bitwise_right_shift"(%arg0, %arg1) : (i32, i32) -> i32 loc("<stdin>":8:10)
    %5 = "emitc.bitwise_xor"(%arg0, %arg1) : (i32, i32) -> i32 loc("<stdin>":9:10)
    "func.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
