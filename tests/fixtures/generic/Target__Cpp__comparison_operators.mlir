"builtin.module"() ({
  "func.func"() <{function_type = (i32, f32, i64, f64, !emitc.opaque<"unsigned">, !emitc.opaque<"std::valarray<int>">, !emitc.opaque<"custom">) -> (), sym_name = "cmp"}> ({
  ^bb0(%arg0: i32, %arg1: f32, %arg2: i64, %arg3: f64, %arg4: !emitc.opaque<"unsigned">, %arg5: !emitc.opaque<"std::valarray<int>">, %arg6: !emitc.opaque<"custom">):
    %0 = "emitc.cmp"(%arg0, %arg2) <{predicate = 0 : i64}> : (i32, i64) -> i1
    %1 = "emitc.cmp"(%arg1, %arg3) <{predicate = 1 : i64}> : (f32, f64) -> i1
    %2 = "emitc.cmp"(%arg2, %arg4) <{predicate = 2 : i64}> : (i64, !emitc.opaque<"unsigned">) -> !emitc.opaque<"int">
    %3 = "emitc.cmp"(%arg3, %arg3) <{predicate = 3 : i64}> : (f64, f64) -> i1
    %4 = "emitc.cmp"(%arg6, %arg4) <{predicate = 4 : i64}> : (!emitc.opaque<"custom">, !emitc.opaque<"unsigned">) -> !emitc.opaque<"custom">
    %5 = "emitc.cmp"(%arg5, %arg5) <{predicate = 5 : i64}> : (!emitc.opaque<"std::valarray<int>">, !emitc.opaque<"std::valarray<int>">) -> !emitc.opaque<"std::valarray<bool>">
    %6 = "emitc.cmp"(%arg6, %arg6) <{predicate = 6 : i64}> : (!emitc.opaque<"custom">, !emitc.opaque<"custom">) -> !emitc.opaque<"custom">
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

