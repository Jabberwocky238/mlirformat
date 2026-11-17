"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "emitc_variable"}> ({
    %0 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32> loc("<stdin>":3:10)
    %1 = "emitc.variable"() <{value = 42 : i32}> : () -> !emitc.lvalue<i32> loc("<stdin>":4:10)
    %2 = "emitc.variable"() <{value = -1 : i32}> : () -> !emitc.lvalue<i32> loc("<stdin>":5:10)
    %3 = "emitc.variable"() <{value = -1 : si8}> : () -> !emitc.lvalue<si8> loc("<stdin>":6:10)
    %4 = "emitc.variable"() <{value = 255 : ui8}> : () -> !emitc.lvalue<ui8> loc("<stdin>":7:10)
    %5 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<!emitc.ptr<i32>> loc("<stdin>":8:10)
    %6 = "emitc.variable"() <{value = #emitc.opaque<"NULL">}> : () -> !emitc.lvalue<!emitc.ptr<i32>> loc("<stdin>":9:10)
    %7 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.array<3x7xi32> loc("<stdin>":10:10)
    %8 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.array<5x!emitc.ptr<i8>> loc("<stdin>":11:10)
    "func.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
