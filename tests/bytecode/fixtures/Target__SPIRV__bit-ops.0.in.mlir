"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage, Int16, Int8], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "bitcount"}> ({
    ^bb0(%arg20: i32 loc("<stdin>":4:10)):
      %11 = "spirv.BitCount"(%arg20) : (i32) -> i32 loc("<stdin>":5:13)
      "spirv.ReturnValue"(%11) : (i32) -> () loc("<stdin>":6:7)
    }) : () -> () loc("<stdin>":3:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<3xi32>, vector<3xi32>, i32, i16) -> vector<3xi32>, sym_name = "bit_field_insert"}> ({
    ^bb0(%arg16: vector<3xi32> loc("<stdin>":9:10), %arg17: vector<3xi32> loc("<stdin>":9:33), %arg18: i32 loc("<stdin>":9:56), %arg19: i16 loc("<stdin>":9:69)):
      %10 = "spirv.BitFieldInsert"(%arg16, %arg17, %arg18, %arg19) : (vector<3xi32>, vector<3xi32>, i32, i16) -> vector<3xi32> loc("<stdin>":10:13)
      "spirv.ReturnValue"(%10) : (vector<3xi32>) -> () loc("<stdin>":11:7)
    }) : () -> () loc("<stdin>":8:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<3xi32>, i8, i8) -> vector<3xi32>, sym_name = "bit_field_s_extract"}> ({
    ^bb0(%arg13: vector<3xi32> loc("<stdin>":14:10), %arg14: i8 loc("<stdin>":14:33), %arg15: i8 loc("<stdin>":14:45)):
      %9 = "spirv.BitFieldSExtract"(%arg13, %arg14, %arg15) : (vector<3xi32>, i8, i8) -> vector<3xi32> loc("<stdin>":15:12)
      "spirv.ReturnValue"(%9) : (vector<3xi32>) -> () loc("<stdin>":16:7)
    }) : () -> () loc("<stdin>":13:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<3xi32>, i8, i8) -> vector<3xi32>, sym_name = "bit_field_u_extract"}> ({
    ^bb0(%arg10: vector<3xi32> loc("<stdin>":19:10), %arg11: i8 loc("<stdin>":19:33), %arg12: i8 loc("<stdin>":19:45)):
      %8 = "spirv.BitFieldUExtract"(%arg10, %arg11, %arg12) : (vector<3xi32>, i8, i8) -> vector<3xi32> loc("<stdin>":20:12)
      "spirv.ReturnValue"(%8) : (vector<3xi32>) -> () loc("<stdin>":21:7)
    }) : () -> () loc("<stdin>":18:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "bitreverse"}> ({
    ^bb0(%arg9: i32 loc("<stdin>":24:10)):
      %7 = "spirv.BitReverse"(%arg9) : (i32) -> i32 loc("<stdin>":25:12)
      "spirv.ReturnValue"(%7) : (i32) -> () loc("<stdin>":26:7)
    }) : () -> () loc("<stdin>":23:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "not"}> ({
    ^bb0(%arg8: i32 loc("<stdin>":29:10)):
      %6 = "spirv.Not"(%arg8) : (i32) -> i32 loc("<stdin>":30:12)
      "spirv.ReturnValue"(%6) : (i32) -> () loc("<stdin>":31:7)
    }) : () -> () loc("<stdin>":28:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32, i32) -> (), sym_name = "bitwise_scalar"}> ({
    ^bb0(%arg6: i32 loc("<stdin>":34:10), %arg7: i32 loc("<stdin>":34:22)):
      %3 = "spirv.BitwiseAnd"(%arg6, %arg7) : (i32, i32) -> i32 loc("<stdin>":35:12)
      %4 = "spirv.BitwiseOr"(%arg6, %arg7) : (i32, i32) -> i32 loc("<stdin>":36:12)
      %5 = "spirv.BitwiseXor"(%arg6, %arg7) : (i32, i32) -> i32 loc("<stdin>":37:12)
      "spirv.Return"() : () -> () loc("<stdin>":38:7)
    }) : () -> () loc("<stdin>":33:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32, i16) -> i32, sym_name = "shift_left_logical"}> ({
    ^bb0(%arg4: i32 loc("<stdin>":41:10), %arg5: i16 loc("<stdin>":41:22)):
      %2 = "spirv.ShiftLeftLogical"(%arg4, %arg5) : (i32, i16) -> i32 loc("<stdin>":42:12)
      "spirv.ReturnValue"(%2) : (i32) -> () loc("<stdin>":43:7)
    }) : () -> () loc("<stdin>":40:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi32>, vector<4xi8>) -> vector<4xi32>, sym_name = "shift_right_arithmetic"}> ({
    ^bb0(%arg2: vector<4xi32> loc("<stdin>":46:10), %arg3: vector<4xi8> loc("<stdin>":46:32)):
      %1 = "spirv.ShiftRightArithmetic"(%arg2, %arg3) : (vector<4xi32>, vector<4xi8>) -> vector<4xi32> loc("<stdin>":47:12)
      "spirv.ReturnValue"(%1) : (vector<4xi32>) -> () loc("<stdin>":48:7)
    }) : () -> () loc("<stdin>":45:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<2xi32>, vector<2xi8>) -> vector<2xi32>, sym_name = "shift_right_logical"}> ({
    ^bb0(%arg0: vector<2xi32> loc("<stdin>":51:10), %arg1: vector<2xi8> loc("<stdin>":51:32)):
      %0 = "spirv.ShiftRightLogical"(%arg0, %arg1) : (vector<2xi32>, vector<2xi8>) -> vector<2xi32> loc("<stdin>":52:12)
      "spirv.ReturnValue"(%0) : (vector<2xi32>) -> () loc("<stdin>":53:7)
    }) : () -> () loc("<stdin>":50:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
