"builtin.module"() ({
  "func.func"() <{function_type = (i32, f32, i64, f64, !emitc.opaque<"unsigned">, !emitc.opaque<"std::valarray<int>">, !emitc.opaque<"custom">) -> (), sym_name = "cmp"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":3:8), %arg1: f32 loc("<stdin>":3:20), %arg2: i64 loc("<stdin>":3:32), %arg3: f64 loc("<stdin>":3:44), %arg4: !emitc.opaque<"unsigned"> loc("<stdin>":3:56), %arg5: !emitc.opaque<"std::valarray<int>"> loc("<stdin>":3:90), %arg6: !emitc.opaque<"custom"> loc("<stdin>":3:134)):
    %0 = "emitc.cmp"(%arg0, %arg2) <{predicate = 0 : i64}> : (i32, i64) -> i1 loc("<stdin>":4:10)
    %1 = "emitc.cmp"(%arg1, %arg3) <{predicate = 1 : i64}> : (f32, f64) -> i1 loc("<stdin>":5:10)
    %2 = "emitc.cmp"(%arg2, %arg4) <{predicate = 2 : i64}> : (i64, !emitc.opaque<"unsigned">) -> !emitc.opaque<"int"> loc("<stdin>":6:10)
    %3 = "emitc.cmp"(%arg3, %arg3) <{predicate = 3 : i64}> : (f64, f64) -> i1 loc("<stdin>":7:10)
    %4 = "emitc.cmp"(%arg6, %arg4) <{predicate = 4 : i64}> : (!emitc.opaque<"custom">, !emitc.opaque<"unsigned">) -> !emitc.opaque<"custom"> loc("<stdin>":8:10)
    %5 = "emitc.cmp"(%arg5, %arg5) <{predicate = 5 : i64}> : (!emitc.opaque<"std::valarray<int>">, !emitc.opaque<"std::valarray<int>">) -> !emitc.opaque<"std::valarray<bool>"> loc("<stdin>":9:10)
    %6 = "emitc.cmp"(%arg6, %arg6) <{predicate = 6 : i64}> : (!emitc.opaque<"custom">, !emitc.opaque<"custom">) -> !emitc.opaque<"custom"> loc("<stdin>":10:10)
    "func.return"() : () -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
