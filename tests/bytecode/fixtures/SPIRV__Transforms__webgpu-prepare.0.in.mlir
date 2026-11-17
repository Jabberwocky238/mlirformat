"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32, i32) -> !spirv.struct<(i32, i32)>, sym_name = "umul_extended_i32"}> ({
    ^bb0(%arg24: i32 loc("<stdin>":4:10), %arg25: i32 loc("<stdin>":4:23)):
      %15 = "spirv.UMulExtended"(%arg24, %arg25) : (i32, i32) -> !spirv.struct<(i32, i32)> loc("<stdin>":5:13)
      "spirv.ReturnValue"(%15) : (!spirv.struct<(i32, i32)>) -> () loc("<stdin>":6:7)
    }) : () -> () loc("<stdin>":3:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<3xi32>, vector<3xi32>) -> !spirv.struct<(vector<3xi32>, vector<3xi32>)>, sym_name = "umul_extended_vector_i32"}> ({
    ^bb0(%arg22: vector<3xi32> loc("<stdin>":9:10), %arg23: vector<3xi32> loc("<stdin>":9:33)):
      %14 = "spirv.UMulExtended"(%arg22, %arg23) : (vector<3xi32>, vector<3xi32>) -> !spirv.struct<(vector<3xi32>, vector<3xi32>)> loc("<stdin>":10:13)
      "spirv.ReturnValue"(%14) : (!spirv.struct<(vector<3xi32>, vector<3xi32>)>) -> () loc("<stdin>":11:7)
    }) : () -> () loc("<stdin>":8:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i16) -> !spirv.struct<(i16, i16)>, sym_name = "umul_extended_i16"}> ({
    ^bb0(%arg21: i16 loc("<stdin>":14:10)):
      %13 = "spirv.UMulExtended"(%arg21, %arg21) : (i16, i16) -> !spirv.struct<(i16, i16)> loc("<stdin>":15:13)
      "spirv.ReturnValue"(%13) : (!spirv.struct<(i16, i16)>) -> () loc("<stdin>":16:7)
    }) : () -> () loc("<stdin>":13:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32, i32) -> !spirv.struct<(i32, i32)>, sym_name = "smul_extended_i32"}> ({
    ^bb0(%arg19: i32 loc("<stdin>":19:10), %arg20: i32 loc("<stdin>":19:23)):
      %12 = "spirv.SMulExtended"(%arg19, %arg20) : (i32, i32) -> !spirv.struct<(i32, i32)> loc("<stdin>":20:13)
      "spirv.ReturnValue"(%12) : (!spirv.struct<(i32, i32)>) -> () loc("<stdin>":21:7)
    }) : () -> () loc("<stdin>":18:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<3xi32>, vector<3xi32>) -> !spirv.struct<(vector<3xi32>, vector<3xi32>)>, sym_name = "smul_extended_vector_i32"}> ({
    ^bb0(%arg17: vector<3xi32> loc("<stdin>":24:10), %arg18: vector<3xi32> loc("<stdin>":24:33)):
      %11 = "spirv.SMulExtended"(%arg17, %arg18) : (vector<3xi32>, vector<3xi32>) -> !spirv.struct<(vector<3xi32>, vector<3xi32>)> loc("<stdin>":25:13)
      "spirv.ReturnValue"(%11) : (!spirv.struct<(vector<3xi32>, vector<3xi32>)>) -> () loc("<stdin>":26:7)
    }) : () -> () loc("<stdin>":23:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i16) -> !spirv.struct<(i16, i16)>, sym_name = "smul_extended_i16"}> ({
    ^bb0(%arg16: i16 loc("<stdin>":29:10)):
      %10 = "spirv.SMulExtended"(%arg16, %arg16) : (i16, i16) -> !spirv.struct<(i16, i16)> loc("<stdin>":30:13)
      "spirv.ReturnValue"(%10) : (!spirv.struct<(i16, i16)>) -> () loc("<stdin>":31:7)
    }) : () -> () loc("<stdin>":28:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32, i32) -> !spirv.struct<(i32, i32)>, sym_name = "iaddcarry_i32"}> ({
    ^bb0(%arg14: i32 loc("<stdin>":34:10), %arg15: i32 loc("<stdin>":34:23)):
      %9 = "spirv.IAddCarry"(%arg14, %arg15) : (i32, i32) -> !spirv.struct<(i32, i32)> loc("<stdin>":35:12)
      "spirv.ReturnValue"(%9) : (!spirv.struct<(i32, i32)>) -> () loc("<stdin>":36:7)
    }) : () -> () loc("<stdin>":33:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<3xi32>, vector<3xi32>) -> !spirv.struct<(vector<3xi32>, vector<3xi32>)>, sym_name = "iaddcarry_vector_i32"}> ({
    ^bb0(%arg12: vector<3xi32> loc("<stdin>":39:10), %arg13: vector<3xi32> loc("<stdin>":39:33)):
      %8 = "spirv.IAddCarry"(%arg12, %arg13) : (vector<3xi32>, vector<3xi32>) -> !spirv.struct<(vector<3xi32>, vector<3xi32>)> loc("<stdin>":40:12)
      "spirv.ReturnValue"(%8) : (!spirv.struct<(vector<3xi32>, vector<3xi32>)>) -> () loc("<stdin>":41:7)
    }) : () -> () loc("<stdin>":38:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i16, i16) -> !spirv.struct<(i16, i16)>, sym_name = "iaddcarry_i16"}> ({
    ^bb0(%arg10: i16 loc("<stdin>":44:10), %arg11: i16 loc("<stdin>":44:23)):
      %7 = "spirv.IAddCarry"(%arg10, %arg11) : (i16, i16) -> !spirv.struct<(i16, i16)> loc("<stdin>":45:12)
      "spirv.ReturnValue"(%7) : (!spirv.struct<(i16, i16)>) -> () loc("<stdin>":46:7)
    }) : () -> () loc("<stdin>":43:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32, i32) -> !spirv.struct<(i32, i32)>, sym_name = "isubborrow_i32"}> ({
    ^bb0(%arg8: i32 loc("<stdin>":49:10), %arg9: i32 loc("<stdin>":49:22)):
      %6 = "spirv.ISubBorrow"(%arg8, %arg9) : (i32, i32) -> !spirv.struct<(i32, i32)> loc("<stdin>":50:12)
      "spirv.ReturnValue"(%6) : (!spirv.struct<(i32, i32)>) -> () loc("<stdin>":51:7)
    }) : () -> () loc("<stdin>":48:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<3xi32>, vector<3xi32>) -> !spirv.struct<(vector<3xi32>, vector<3xi32>)>, sym_name = "isubborrow_vector_i32"}> ({
    ^bb0(%arg6: vector<3xi32> loc("<stdin>":54:10), %arg7: vector<3xi32> loc("<stdin>":54:32)):
      %5 = "spirv.ISubBorrow"(%arg6, %arg7) : (vector<3xi32>, vector<3xi32>) -> !spirv.struct<(vector<3xi32>, vector<3xi32>)> loc("<stdin>":55:12)
      "spirv.ReturnValue"(%5) : (!spirv.struct<(vector<3xi32>, vector<3xi32>)>) -> () loc("<stdin>":56:7)
    }) : () -> () loc("<stdin>":53:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i16, i16) -> !spirv.struct<(i16, i16)>, sym_name = "isubborrow_i16"}> ({
    ^bb0(%arg4: i16 loc("<stdin>":59:10), %arg5: i16 loc("<stdin>":59:22)):
      %4 = "spirv.ISubBorrow"(%arg4, %arg5) : (i16, i16) -> !spirv.struct<(i16, i16)> loc("<stdin>":60:12)
      "spirv.ReturnValue"(%4) : (!spirv.struct<(i16, i16)>) -> () loc("<stdin>":61:7)
    }) : () -> () loc("<stdin>":58:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> i1, sym_name = "is_inf_f32"}> ({
    ^bb0(%arg3: f32 loc("<stdin>":64:10)):
      %3 = "spirv.IsInf"(%arg3) : (f32) -> i1 loc("<stdin>":65:12)
      "spirv.ReturnValue"(%3) : (i1) -> () loc("<stdin>":66:7)
    }) : () -> () loc("<stdin>":63:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xf32>) -> vector<4xi1>, sym_name = "is_inf_4xf32"}> ({
    ^bb0(%arg2: vector<4xf32> loc("<stdin>":69:10)):
      %2 = "spirv.IsInf"(%arg2) : (vector<4xf32>) -> vector<4xi1> loc("<stdin>":70:12)
      "spirv.ReturnValue"(%2) : (vector<4xi1>) -> () loc("<stdin>":71:7)
    }) : () -> () loc("<stdin>":68:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> i1, sym_name = "is_nan_f32"}> ({
    ^bb0(%arg1: f32 loc("<stdin>":74:10)):
      %1 = "spirv.IsNan"(%arg1) : (f32) -> i1 loc("<stdin>":75:12)
      "spirv.ReturnValue"(%1) : (i1) -> () loc("<stdin>":76:7)
    }) : () -> () loc("<stdin>":73:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xf32>) -> vector<4xi1>, sym_name = "is_nan_4xf32"}> ({
    ^bb0(%arg0: vector<4xf32> loc("<stdin>":79:10)):
      %0 = "spirv.IsNan"(%arg0) : (vector<4xf32>) -> vector<4xi1> loc("<stdin>":80:12)
      "spirv.ReturnValue"(%0) : (vector<4xi1>) -> () loc("<stdin>":81:7)
    }) : () -> () loc("<stdin>":78:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
