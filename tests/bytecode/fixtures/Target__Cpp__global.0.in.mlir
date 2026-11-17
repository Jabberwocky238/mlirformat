"builtin.module"() ({
  "emitc.global"() <{extern_specifier, sym_name = "decl", type = i8}> : () -> () loc("<stdin>":2:3)
  "emitc.global"() <{sym_name = "uninit", type = i32}> : () -> () loc("<stdin>":3:3)
  "emitc.global"() <{initial_value = 4 : i32, sym_name = "myglobal_int", type = i32}> : () -> () loc("<stdin>":4:3)
  "emitc.global"() <{initial_value = dense<4.000000e+00> : tensor<2xf32>, sym_name = "myglobal", type = !emitc.array<2xf32>}> : () -> () loc("<stdin>":5:3)
  "emitc.global"() <{const_specifier, initial_value = dense<2> : tensor<2xi16>, sym_name = "myconstant", type = !emitc.array<2xi16>}> : () -> () loc("<stdin>":6:3)
  "emitc.global"() <{const_specifier, initial_value = dense<1> : tensor<2x3xi16>, sym_name = "myconstant_2d", type = !emitc.array<2x3xi16>}> : () -> () loc("<stdin>":7:3)
  "emitc.global"() <{const_specifier, extern_specifier, sym_name = "extern_constant", type = !emitc.array<2xi16>}> : () -> () loc("<stdin>":8:3)
  "emitc.global"() <{static_specifier, sym_name = "static_var", type = f32}> : () -> () loc("<stdin>":9:3)
  "emitc.global"() <{const_specifier, initial_value = 3.000000e+00 : f32, static_specifier, sym_name = "static_const", type = f32}> : () -> () loc("<stdin>":10:3)
  "emitc.global"() <{initial_value = #emitc.opaque<"CHAR_MIN">, sym_name = "opaque_init", type = !emitc.opaque<"char">}> : () -> () loc("<stdin>":11:3)
  "func.func"() <{function_type = () -> i32, sym_name = "use_global_scalar_read"}> ({
    %14 = "emitc.get_global"() <{name = @myglobal_int}> : () -> !emitc.lvalue<i32> loc("<stdin>":13:11)
    %15 = "emitc.load"(%14) : (!emitc.lvalue<i32>) -> i32 loc("<stdin>":14:11)
    "func.return"(%15) : (i32) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (i32) -> (), sym_name = "use_global_scalar_write"}> ({
  ^bb0(%arg6: i32 loc("<stdin>":18:8)):
    %13 = "emitc.get_global"() <{name = @myglobal_int}> : () -> !emitc.lvalue<i32> loc("<stdin>":19:11)
    "emitc.assign"(%13, %arg6) : (!emitc.lvalue<i32>, i32) -> () loc("<stdin>":20:5)
    "func.return"() : () -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (index) -> f32, sym_name = "use_global_array_read"}> ({
  ^bb0(%arg5: index loc("<stdin>":24:8)):
    %10 = "emitc.get_global"() <{name = @myglobal}> : () -> !emitc.array<2xf32> loc("<stdin>":25:11)
    %11 = "emitc.subscript"(%10, %arg5) : (!emitc.array<2xf32>, index) -> !emitc.lvalue<f32> loc("<stdin>":26:11)
    %12 = "emitc.load"(%11) : (!emitc.lvalue<f32>) -> f32 loc("<stdin>":27:11)
    "func.return"(%12) : (f32) -> () loc("<stdin>":28:5)
  }) : () -> () loc("<stdin>":23:3)
  "func.func"() <{function_type = (index, f32) -> (), sym_name = "use_global_array_write"}> ({
  ^bb0(%arg3: index loc("<stdin>":31:8), %arg4: f32 loc("<stdin>":31:22)):
    %8 = "emitc.get_global"() <{name = @myglobal}> : () -> !emitc.array<2xf32> loc("<stdin>":32:10)
    %9 = "emitc.subscript"(%8, %arg3) : (!emitc.array<2xf32>, index) -> !emitc.lvalue<f32> loc("<stdin>":33:10)
    "emitc.assign"(%9, %arg4) : (!emitc.lvalue<f32>, f32) -> () loc("<stdin>":34:5)
    "func.return"() : () -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":30:3)
  "func.func"() <{function_type = (index) -> !emitc.ptr<i16>, sym_name = "use_const_global_array_pointer_address_of"}> ({
  ^bb0(%arg2: index loc("<stdin>":38:8)):
    %5 = "emitc.get_global"() <{name = @myconstant}> : () -> !emitc.array<2xi16> loc("<stdin>":39:10)
    %6 = "emitc.subscript"(%5, %arg2) : (!emitc.array<2xi16>, index) -> !emitc.lvalue<i16> loc("<stdin>":40:10)
    %7 = "emitc.address_of"(%6) : (!emitc.lvalue<i16>) -> !emitc.ptr<i16> loc("<stdin>":41:10)
    "func.return"(%7) : (!emitc.ptr<i16>) -> () loc("<stdin>":42:5)
  }) : () -> () loc("<stdin>":37:3)
  "func.func"() <{function_type = () -> !emitc.ptr<f32>, sym_name = "use_const_global_scalar_pointer_address_of"}> ({
    %3 = "emitc.get_global"() <{name = @static_const}> : () -> !emitc.lvalue<f32> loc("<stdin>":45:10)
    %4 = "emitc.address_of"(%3) : (!emitc.lvalue<f32>) -> !emitc.ptr<f32> loc("<stdin>":46:10)
    "func.return"(%4) : (!emitc.ptr<f32>) -> () loc("<stdin>":47:5)
  }) : () -> () loc("<stdin>":44:3)
  "func.func"() <{function_type = (index, index) -> !emitc.ptr<i16>, sym_name = "use_const_global_2d_array_pointer_address_of"}> ({
  ^bb0(%arg0: index loc("<stdin>":50:8), %arg1: index loc("<stdin>":50:22)):
    %0 = "emitc.get_global"() <{name = @myconstant_2d}> : () -> !emitc.array<2x3xi16> loc("<stdin>":51:10)
    %1 = "emitc.subscript"(%0, %arg0, %arg1) : (!emitc.array<2x3xi16>, index, index) -> !emitc.lvalue<i16> loc("<stdin>":52:10)
    %2 = "emitc.address_of"(%1) : (!emitc.lvalue<i16>) -> !emitc.ptr<i16> loc("<stdin>":53:10)
    "func.return"(%2) : (!emitc.ptr<i16>) -> () loc("<stdin>":54:5)
  }) : () -> () loc("<stdin>":49:3)
}) : () -> () loc("<stdin>":1:1)
