"builtin.module"() ({
  "func.func"() <{function_type = (!emitc.array<4x8xf32>, !emitc.array<3x5xf32>, index, index) -> (), sym_name = "load_store_array"}> ({
  ^bb0(%arg13: !emitc.array<4x8xf32>, %arg14: !emitc.array<3x5xf32>, %arg15: index, %arg16: index):
    %12 = "emitc.subscript"(%arg13, %arg15, %arg16) : (!emitc.array<4x8xf32>, index, index) -> !emitc.lvalue<f32>
    %13 = "emitc.subscript"(%arg14, %arg15, %arg16) : (!emitc.array<3x5xf32>, index, index) -> !emitc.lvalue<f32>
    %14 = "emitc.load"(%12) : (!emitc.lvalue<f32>) -> f32
    "emitc.assign"(%13, %14) : (!emitc.lvalue<f32>, f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!emitc.ptr<f32>, !emitc.ptr<f32>, index, index) -> (), sym_name = "load_store_pointer"}> ({
  ^bb0(%arg9: !emitc.ptr<f32>, %arg10: !emitc.ptr<f32>, %arg11: index, %arg12: index):
    %9 = "emitc.subscript"(%arg9, %arg11) : (!emitc.ptr<f32>, index) -> !emitc.lvalue<f32>
    %10 = "emitc.subscript"(%arg10, %arg12) : (!emitc.ptr<f32>, index) -> !emitc.lvalue<f32>
    %11 = "emitc.load"(%9) : (!emitc.lvalue<f32>) -> f32
    "emitc.assign"(%10, %11) : (!emitc.lvalue<f32>, f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!emitc.opaque<"std::map<char, int>">, !emitc.opaque<"std::map<char, int>">, !emitc.opaque<"char">, !emitc.opaque<"char">) -> (), sym_name = "load_store_opaque"}> ({
  ^bb0(%arg5: !emitc.opaque<"std::map<char, int>">, %arg6: !emitc.opaque<"std::map<char, int>">, %arg7: !emitc.opaque<"char">, %arg8: !emitc.opaque<"char">):
    %6 = "emitc.subscript"(%arg5, %arg7) : (!emitc.opaque<"std::map<char, int>">, !emitc.opaque<"char">) -> !emitc.lvalue<!emitc.opaque<"int">>
    %7 = "emitc.subscript"(%arg6, %arg8) : (!emitc.opaque<"std::map<char, int>">, !emitc.opaque<"char">) -> !emitc.lvalue<!emitc.opaque<"int">>
    %8 = "emitc.load"(%6) : (!emitc.lvalue<!emitc.opaque<"int">>) -> !emitc.opaque<"int">
    "emitc.assign"(%7, %8) : (!emitc.lvalue<!emitc.opaque<"int">>, !emitc.opaque<"int">) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "emitc.func"() <{function_type = (f32) -> (), sym_name = "func1"}> ({
  ^bb0(%arg4: f32):
    "emitc.return"() : () -> ()
  }) : () -> ()
  "emitc.func"() <{function_type = (!emitc.array<4x8xf32>, i32, i16, i8) -> (), sym_name = "call_arg"}> ({
  ^bb0(%arg0: !emitc.array<4x8xf32>, %arg1: i32, %arg2: i16, %arg3: i8):
    %0 = "emitc.subscript"(%arg0, %arg1, %arg2) : (!emitc.array<4x8xf32>, i32, i16) -> !emitc.lvalue<f32>
    %1 = "emitc.subscript"(%arg0, %arg2, %arg3) : (!emitc.array<4x8xf32>, i16, i8) -> !emitc.lvalue<f32>
    %2 = "emitc.load"(%0) : (!emitc.lvalue<f32>) -> f32
    "emitc.call"(%2) <{callee = @func1}> : (f32) -> ()
    %3 = "emitc.load"(%1) : (!emitc.lvalue<f32>) -> f32
    "emitc.call_opaque"(%3) <{callee = "func2"}> : (f32) -> ()
    %4 = "emitc.load"(%0) : (!emitc.lvalue<f32>) -> f32
    %5 = "emitc.load"(%1) : (!emitc.lvalue<f32>) -> f32
    "emitc.call_opaque"(%4, %5) <{args = [1 : index, 0 : index], callee = "func3"}> : (f32, f32) -> ()
    "emitc.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

