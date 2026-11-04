module {
  func.func @emitc_variable() {
    %0 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    %1 = "emitc.variable"() <{value = 42 : i32}> : () -> !emitc.lvalue<i32>
    %2 = "emitc.variable"() <{value = -1 : i32}> : () -> !emitc.lvalue<i32>
    %3 = "emitc.variable"() <{value = -1 : si8}> : () -> !emitc.lvalue<si8>
    %4 = "emitc.variable"() <{value = 255 : ui8}> : () -> !emitc.lvalue<ui8>
    %5 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<!emitc.ptr<i32>>
    %6 = "emitc.variable"() <{value = #emitc.opaque<"NULL">}> : () -> !emitc.lvalue<!emitc.ptr<i32>>
    %7 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.array<3x7xi32>
    %8 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.array<5x!emitc.ptr<i8>>
    return
  }
}

