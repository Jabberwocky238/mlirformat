"builtin.module"() ({
  "emitc.global"() <{extern_specifier, sym_name = "decl", type = i8}> : () -> ()
  "emitc.global"() <{sym_name = "uninit", type = i32}> : () -> ()
  "emitc.global"() <{initial_value = 4 : i32, sym_name = "myglobal_int", type = i32}> : () -> ()
  "emitc.global"() <{initial_value = dense<4.000000e+00> : tensor<2xf32>, sym_name = "myglobal", type = !emitc.array<2xf32>}> : () -> ()
  "emitc.global"() <{const_specifier, initial_value = dense<2> : tensor<2xi16>, sym_name = "myconstant", type = !emitc.array<2xi16>}> : () -> ()
  "emitc.global"() <{const_specifier, initial_value = dense<1> : tensor<2x3xi16>, sym_name = "myconstant_2d", type = !emitc.array<2x3xi16>}> : () -> ()
  "emitc.global"() <{const_specifier, extern_specifier, sym_name = "extern_constant", type = !emitc.array<2xi16>}> : () -> ()
  "emitc.global"() <{static_specifier, sym_name = "static_var", type = f32}> : () -> ()
  "emitc.global"() <{const_specifier, initial_value = 3.000000e+00 : f32, static_specifier, sym_name = "static_const", type = f32}> : () -> ()
  "emitc.global"() <{initial_value = #emitc.opaque<"CHAR_MIN">, sym_name = "opaque_init", type = !emitc.opaque<"char">}> : () -> ()
  "func.func"() <{function_type = () -> i32, sym_name = "use_global_scalar_read"}> ({
    %22 = "emitc.get_global"() <{name = @myglobal_int}> : () -> !emitc.lvalue<i32>
    %23 = "emitc.load"(%22) : (!emitc.lvalue<i32>) -> i32
    "func.return"(%23) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "use_global_scalar_write"}> ({
  ^bb0(%arg9: i32):
    %21 = "emitc.get_global"() <{name = @myglobal_int}> : () -> !emitc.lvalue<i32>
    "emitc.assign"(%21, %arg9) : (!emitc.lvalue<i32>, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> f32, sym_name = "use_global_array_read"}> ({
  ^bb0(%arg8: index):
    %18 = "emitc.get_global"() <{name = @myglobal}> : () -> !emitc.array<2xf32>
    %19 = "emitc.subscript"(%18, %arg8) : (!emitc.array<2xf32>, index) -> !emitc.lvalue<f32>
    %20 = "emitc.load"(%19) : (!emitc.lvalue<f32>) -> f32
    "func.return"(%20) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, f32) -> (), sym_name = "use_global_array_write"}> ({
  ^bb0(%arg6: index, %arg7: f32):
    %16 = "emitc.get_global"() <{name = @myglobal}> : () -> !emitc.array<2xf32>
    %17 = "emitc.subscript"(%16, %arg6) : (!emitc.array<2xf32>, index) -> !emitc.lvalue<f32>
    "emitc.assign"(%17, %arg7) : (!emitc.lvalue<f32>, f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> !emitc.ptr<i16>, sym_name = "use_const_global_array_pointer"}> ({
  ^bb0(%arg5: index):
    %13 = "emitc.get_global"() <{name = @myconstant}> : () -> !emitc.array<2xi16>
    %14 = "emitc.subscript"(%13, %arg5) : (!emitc.array<2xi16>, index) -> !emitc.lvalue<i16>
    %15 = "emitc.apply"(%14) <{applicableOperator = "&"}> : (!emitc.lvalue<i16>) -> !emitc.ptr<i16>
    "func.return"(%15) : (!emitc.ptr<i16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> !emitc.ptr<f32>, sym_name = "use_const_global_scalar_pointer"}> ({
    %11 = "emitc.get_global"() <{name = @static_const}> : () -> !emitc.lvalue<f32>
    %12 = "emitc.apply"(%11) <{applicableOperator = "&"}> : (!emitc.lvalue<f32>) -> !emitc.ptr<f32>
    "func.return"(%12) : (!emitc.ptr<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> !emitc.ptr<i16>, sym_name = "use_const_global_2d_array_pointer"}> ({
  ^bb0(%arg3: index, %arg4: index):
    %8 = "emitc.get_global"() <{name = @myconstant_2d}> : () -> !emitc.array<2x3xi16>
    %9 = "emitc.subscript"(%8, %arg3, %arg4) : (!emitc.array<2x3xi16>, index, index) -> !emitc.lvalue<i16>
    %10 = "emitc.apply"(%9) <{applicableOperator = "&"}> : (!emitc.lvalue<i16>) -> !emitc.ptr<i16>
    "func.return"(%10) : (!emitc.ptr<i16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> !emitc.ptr<i16>, sym_name = "use_const_global_array_pointer_address_of"}> ({
  ^bb0(%arg2: index):
    %5 = "emitc.get_global"() <{name = @myconstant}> : () -> !emitc.array<2xi16>
    %6 = "emitc.subscript"(%5, %arg2) : (!emitc.array<2xi16>, index) -> !emitc.lvalue<i16>
    %7 = "emitc.address_of"(%6) : (!emitc.lvalue<i16>) -> !emitc.ptr<i16>
    "func.return"(%7) : (!emitc.ptr<i16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> !emitc.ptr<f32>, sym_name = "use_const_global_scalar_pointer_address_of"}> ({
    %3 = "emitc.get_global"() <{name = @static_const}> : () -> !emitc.lvalue<f32>
    %4 = "emitc.address_of"(%3) : (!emitc.lvalue<f32>) -> !emitc.ptr<f32>
    "func.return"(%4) : (!emitc.ptr<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> !emitc.ptr<i16>, sym_name = "use_const_global_2d_array_pointer_address_of"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "emitc.get_global"() <{name = @myconstant_2d}> : () -> !emitc.array<2x3xi16>
    %1 = "emitc.subscript"(%0, %arg0, %arg1) : (!emitc.array<2x3xi16>, index, index) -> !emitc.lvalue<i16>
    %2 = "emitc.address_of"(%1) : (!emitc.lvalue<i16>) -> !emitc.ptr<i16>
    "func.return"(%2) : (!emitc.ptr<i16>) -> ()
  }) : () -> ()
}) : () -> ()

