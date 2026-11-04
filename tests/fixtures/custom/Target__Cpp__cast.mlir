module {
  func.func @cast(%arg0: i32) {
    %0 = emitc.cast %arg0 : i32 to ui32
    %1 = emitc.cast %arg0 : i32 to i64
    %2 = emitc.cast %arg0 : i32 to ui64
    %3 = emitc.cast %arg0 : i32 to f32
    %4 = emitc.cast %arg0 : i32 to f64
    %5 = emitc.cast %arg0 : i32 to i1
    %6 = emitc.cast %arg0 : i32 to !emitc.opaque<"mytype">
    return
  }
  func.func @cast_ptr(%arg0: !emitc.ptr<!emitc.opaque<"void">>) {
    %0 = emitc.cast %arg0 : !emitc.ptr<!emitc.opaque<"void">> to !emitc.ptr<i32>
    return
  }
}

