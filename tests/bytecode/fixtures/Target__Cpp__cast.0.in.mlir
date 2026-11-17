"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (), sym_name = "cast"}> ({
  ^bb0(%arg1: i32 loc("<stdin>":3:8)):
    %1 = "emitc.cast"(%arg1) : (i32) -> ui32 loc("<stdin>":4:10)
    %2 = "emitc.cast"(%arg1) : (i32) -> i64 loc("<stdin>":5:10)
    %3 = "emitc.cast"(%arg1) : (i32) -> ui64 loc("<stdin>":6:10)
    %4 = "emitc.cast"(%arg1) : (i32) -> f32 loc("<stdin>":7:10)
    %5 = "emitc.cast"(%arg1) : (i32) -> f64 loc("<stdin>":8:10)
    %6 = "emitc.cast"(%arg1) : (i32) -> i1 loc("<stdin>":9:10)
    %7 = "emitc.cast"(%arg1) : (i32) -> !emitc.opaque<"mytype"> loc("<stdin>":10:10)
    "func.return"() : () -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (!emitc.ptr<!emitc.opaque<"void">>) -> (), sym_name = "cast_ptr"}> ({
  ^bb0(%arg0: !emitc.ptr<!emitc.opaque<"void">> loc("<stdin>":14:8)):
    %0 = "emitc.cast"(%arg0) : (!emitc.ptr<!emitc.opaque<"void">>) -> !emitc.ptr<i32> loc("<stdin>":15:10)
    "func.return"() : () -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":13:3)
}) : () -> () loc("<stdin>":1:1)
