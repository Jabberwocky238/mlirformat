module {
  func.func @cmp(%arg0: i32, %arg1: f32, %arg2: i64, %arg3: f64, %arg4: !emitc.opaque<"unsigned">, %arg5: !emitc.opaque<"std::valarray<int>">, %arg6: !emitc.opaque<"custom">) {
    %0 = emitc.cmp eq, %arg0, %arg2 : (i32, i64) -> i1
    %1 = emitc.cmp ne, %arg1, %arg3 : (f32, f64) -> i1
    %2 = emitc.cmp lt, %arg2, %arg4 : (i64, !emitc.opaque<"unsigned">) -> !emitc.opaque<"int">
    %3 = emitc.cmp le, %arg3, %arg3 : (f64, f64) -> i1
    %4 = emitc.cmp gt, %arg6, %arg4 : (!emitc.opaque<"custom">, !emitc.opaque<"unsigned">) -> !emitc.opaque<"custom">
    %5 = emitc.cmp ge, %arg5, %arg5 : (!emitc.opaque<"std::valarray<int>">, !emitc.opaque<"std::valarray<int>">) -> !emitc.opaque<"std::valarray<bool>">
    %6 = emitc.cmp three_way, %arg6, %arg6 : (!emitc.opaque<"custom">, !emitc.opaque<"custom">) -> !emitc.opaque<"custom">
    return
  }
}

