"builtin.module"() ({
  "func.func"() <{function_type = (!emitc.array<4x8xf32>, !emitc.array<3x5xf32>, index, index) -> (), sym_name = "load_store_array"}> ({
  ^bb0(%arg13: !emitc.array<4x8xf32> loc("<stdin>":3:8), %arg14: !emitc.array<3x5xf32> loc("<stdin>":3:39), %arg15: index loc("<stdin>":3:70), %arg16: index loc("<stdin>":3:85)):
    %12 = "emitc.subscript"(%arg13, %arg15, %arg16) : (!emitc.array<4x8xf32>, index, index) -> !emitc.lvalue<f32> loc("<stdin>":4:11)
    %13 = "emitc.subscript"(%arg14, %arg15, %arg16) : (!emitc.array<3x5xf32>, index, index) -> !emitc.lvalue<f32> loc("<stdin>":5:11)
    %14 = "emitc.load"(%12) : (!emitc.lvalue<f32>) -> f32 loc("<stdin>":6:11)
    "emitc.assign"(%13, %14) : (!emitc.lvalue<f32>, f32) -> () loc("<stdin>":7:5)
    "func.return"() : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (!emitc.ptr<f32>, !emitc.ptr<f32>, index, index) -> (), sym_name = "load_store_pointer"}> ({
  ^bb0(%arg9: !emitc.ptr<f32> loc("<stdin>":11:8), %arg10: !emitc.ptr<f32> loc("<stdin>":11:32), %arg11: index loc("<stdin>":11:57), %arg12: index loc("<stdin>":11:72)):
    %9 = "emitc.subscript"(%arg9, %arg11) : (!emitc.ptr<f32>, index) -> !emitc.lvalue<f32> loc("<stdin>":12:10)
    %10 = "emitc.subscript"(%arg10, %arg12) : (!emitc.ptr<f32>, index) -> !emitc.lvalue<f32> loc("<stdin>":13:11)
    %11 = "emitc.load"(%9) : (!emitc.lvalue<f32>) -> f32 loc("<stdin>":14:11)
    "emitc.assign"(%10, %11) : (!emitc.lvalue<f32>, f32) -> () loc("<stdin>":15:5)
    "func.return"() : () -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":10:3)
  "func.func"() <{function_type = (!emitc.opaque<"std::map<char, int>">, !emitc.opaque<"std::map<char, int>">, !emitc.opaque<"char">, !emitc.opaque<"char">) -> (), sym_name = "load_store_opaque"}> ({
  ^bb0(%arg5: !emitc.opaque<"std::map<char, int>"> loc("<stdin>":19:8), %arg6: !emitc.opaque<"std::map<char, int>"> loc("<stdin>":19:53), %arg7: !emitc.opaque<"char"> loc("<stdin>":19:98), %arg8: !emitc.opaque<"char"> loc("<stdin>":19:128)):
    %6 = "emitc.subscript"(%arg5, %arg7) : (!emitc.opaque<"std::map<char, int>">, !emitc.opaque<"char">) -> !emitc.lvalue<!emitc.opaque<"int">> loc("<stdin>":20:10)
    %7 = "emitc.subscript"(%arg6, %arg8) : (!emitc.opaque<"std::map<char, int>">, !emitc.opaque<"char">) -> !emitc.lvalue<!emitc.opaque<"int">> loc("<stdin>":21:10)
    %8 = "emitc.load"(%6) : (!emitc.lvalue<!emitc.opaque<"int">>) -> !emitc.opaque<"int"> loc("<stdin>":22:10)
    "emitc.assign"(%7, %8) : (!emitc.lvalue<!emitc.opaque<"int">>, !emitc.opaque<"int">) -> () loc("<stdin>":23:5)
    "func.return"() : () -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":18:3)
  "emitc.func"() <{function_type = (f32) -> (), sym_name = "func1"}> ({
  ^bb0(%arg4: f32 loc("<stdin>":27:8)):
    "emitc.return"() : () -> () loc("<stdin>":28:5)
  }) : () -> () loc("<stdin>":26:3)
  "emitc.func"() <{function_type = (!emitc.array<4x8xf32>, i32, i16, i8) -> (), sym_name = "call_arg"}> ({
  ^bb0(%arg0: !emitc.array<4x8xf32> loc("<stdin>":31:8), %arg1: i32 loc("<stdin>":31:38), %arg2: i16 loc("<stdin>":31:50), %arg3: i8 loc("<stdin>":31:62)):
    %0 = "emitc.subscript"(%arg0, %arg1, %arg2) : (!emitc.array<4x8xf32>, i32, i16) -> !emitc.lvalue<f32> loc("<stdin>":32:10)
    %1 = "emitc.subscript"(%arg0, %arg2, %arg3) : (!emitc.array<4x8xf32>, i16, i8) -> !emitc.lvalue<f32> loc("<stdin>":33:10)
    %2 = "emitc.load"(%0) : (!emitc.lvalue<f32>) -> f32 loc("<stdin>":34:10)
    "emitc.call"(%2) <{callee = @func1}> : (f32) -> () loc("<stdin>":35:5)
    %3 = "emitc.load"(%1) : (!emitc.lvalue<f32>) -> f32 loc("<stdin>":36:10)
    "emitc.call_opaque"(%3) <{callee = "func2"}> : (f32) -> () loc("<stdin>":37:5)
    %4 = "emitc.load"(%0) : (!emitc.lvalue<f32>) -> f32 loc("<stdin>":38:10)
    %5 = "emitc.load"(%1) : (!emitc.lvalue<f32>) -> f32 loc("<stdin>":39:10)
    "emitc.call_opaque"(%4, %5) <{args = [1 : index, 0 : index], callee = "func3"}> : (f32, f32) -> () loc("<stdin>":40:5)
    "emitc.return"() : () -> () loc("<stdin>":41:5)
  }) : () -> () loc("<stdin>":30:3)
}) : () -> () loc("<stdin>":1:1)
