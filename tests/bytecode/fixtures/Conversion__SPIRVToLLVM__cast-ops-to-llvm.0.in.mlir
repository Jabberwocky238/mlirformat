"builtin.module"() ({
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> (), sym_name = "bitcast_float_to_integer_scalar"}> ({
  ^bb0(%arg30: f32 loc("<stdin>":3:8)):
    %30 = "spirv.Bitcast"(%arg30) : (f32) -> i32 loc("<stdin>":4:11)
    "spirv.Return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<3xf32>) -> (), sym_name = "bitcast_float_to_integer_vector"}> ({
  ^bb0(%arg29: vector<3xf32> loc("<stdin>":8:8)):
    %29 = "spirv.Bitcast"(%arg29) : (vector<3xf32>) -> vector<3xi32> loc("<stdin>":9:11)
    "spirv.Return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<2xf32>) -> (), sym_name = "bitcast_vector_to_scalar"}> ({
  ^bb0(%arg28: vector<2xf32> loc("<stdin>":13:8)):
    %28 = "spirv.Bitcast"(%arg28) : (vector<2xf32>) -> i64 loc("<stdin>":14:11)
    "spirv.Return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f64) -> (), sym_name = "bitcast_scalar_to_vector"}> ({
  ^bb0(%arg27: f64 loc("<stdin>":18:8)):
    %27 = "spirv.Bitcast"(%arg27) : (f64) -> vector<2xi32> loc("<stdin>":19:11)
    "spirv.Return"() : () -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xf32>) -> (), sym_name = "bitcast_vector_to_vector"}> ({
  ^bb0(%arg26: vector<4xf32> loc("<stdin>":23:8)):
    %26 = "spirv.Bitcast"(%arg26) : (vector<4xf32>) -> vector<2xi64> loc("<stdin>":24:11)
    "spirv.Return"() : () -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<f32, Function>) -> (), sym_name = "bitcast_pointer"}> ({
  ^bb0(%arg25: !spirv.ptr<f32, Function> loc("<stdin>":28:8)):
    %25 = "spirv.Bitcast"(%arg25) : (!spirv.ptr<f32, Function>) -> !spirv.ptr<i32, Function> loc("<stdin>":29:11)
    "spirv.Return"() : () -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":27:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> (), sym_name = "convert_float_to_signed_scalar"}> ({
  ^bb0(%arg24: f32 loc("<stdin>":33:8)):
    %24 = "spirv.ConvertFToS"(%arg24) : (f32) -> i32 loc("<stdin>":34:11)
    "spirv.Return"() : () -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":32:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<2xf32>) -> (), sym_name = "convert_float_to_signed_vector"}> ({
  ^bb0(%arg23: vector<2xf32> loc("<stdin>":38:8)):
    %23 = "spirv.ConvertFToS"(%arg23) : (vector<2xf32>) -> vector<2xi32> loc("<stdin>":39:11)
    "spirv.Return"() : () -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":37:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> (), sym_name = "convert_float_to_unsigned_scalar"}> ({
  ^bb0(%arg22: f32 loc("<stdin>":43:8)):
    %22 = "spirv.ConvertFToU"(%arg22) : (f32) -> i32 loc("<stdin>":44:11)
    "spirv.Return"() : () -> () loc("<stdin>":45:5)
  }) : () -> () loc("<stdin>":42:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<2xf32>) -> (), sym_name = "convert_float_to_unsigned_vector"}> ({
  ^bb0(%arg21: vector<2xf32> loc("<stdin>":48:8)):
    %21 = "spirv.ConvertFToU"(%arg21) : (vector<2xf32>) -> vector<2xi32> loc("<stdin>":49:11)
    "spirv.Return"() : () -> () loc("<stdin>":50:5)
  }) : () -> () loc("<stdin>":47:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> (), sym_name = "convert_signed_to_float_scalar"}> ({
  ^bb0(%arg20: i32 loc("<stdin>":53:8)):
    %20 = "spirv.ConvertSToF"(%arg20) : (i32) -> f32 loc("<stdin>":54:11)
    "spirv.Return"() : () -> () loc("<stdin>":55:5)
  }) : () -> () loc("<stdin>":52:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<3xi32>) -> (), sym_name = "convert_signed_to_float_vector"}> ({
  ^bb0(%arg19: vector<3xi32> loc("<stdin>":58:8)):
    %19 = "spirv.ConvertSToF"(%arg19) : (vector<3xi32>) -> vector<3xf32> loc("<stdin>":59:11)
    "spirv.Return"() : () -> () loc("<stdin>":60:5)
  }) : () -> () loc("<stdin>":57:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> (), sym_name = "convert_unsigned_to_float_scalar"}> ({
  ^bb0(%arg18: i32 loc("<stdin>":63:8)):
    %18 = "spirv.ConvertUToF"(%arg18) : (i32) -> f32 loc("<stdin>":64:11)
    "spirv.Return"() : () -> () loc("<stdin>":65:5)
  }) : () -> () loc("<stdin>":62:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<3xi32>) -> (), sym_name = "convert_unsigned_to_float_vector"}> ({
  ^bb0(%arg17: vector<3xi32> loc("<stdin>":68:8)):
    %17 = "spirv.ConvertUToF"(%arg17) : (vector<3xi32>) -> vector<3xf32> loc("<stdin>":69:11)
    "spirv.Return"() : () -> () loc("<stdin>":70:5)
  }) : () -> () loc("<stdin>":67:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32, f64) -> (), sym_name = "fconvert_scalar"}> ({
  ^bb0(%arg15: f32 loc("<stdin>":73:8), %arg16: f64 loc("<stdin>":73:21)):
    %15 = "spirv.FConvert"(%arg15) : (f32) -> f64 loc("<stdin>":74:11)
    %16 = "spirv.FConvert"(%arg16) : (f64) -> f32 loc("<stdin>":75:11)
    "spirv.Return"() : () -> () loc("<stdin>":76:5)
  }) : () -> () loc("<stdin>":72:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<2xf32>, vector<2xf64>) -> (), sym_name = "fconvert_vector"}> ({
  ^bb0(%arg13: vector<2xf32> loc("<stdin>":79:8), %arg14: vector<2xf64> loc("<stdin>":79:31)):
    %13 = "spirv.FConvert"(%arg13) : (vector<2xf32>) -> vector<2xf64> loc("<stdin>":80:11)
    %14 = "spirv.FConvert"(%arg14) : (vector<2xf64>) -> vector<2xf32> loc("<stdin>":81:11)
    "spirv.Return"() : () -> () loc("<stdin>":82:5)
  }) : () -> () loc("<stdin>":78:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32, i64) -> (), sym_name = "sconvert_scalar"}> ({
  ^bb0(%arg11: i32 loc("<stdin>":85:8), %arg12: i64 loc("<stdin>":85:21)):
    %11 = "spirv.SConvert"(%arg11) : (i32) -> i64 loc("<stdin>":86:11)
    %12 = "spirv.SConvert"(%arg12) : (i64) -> i32 loc("<stdin>":87:11)
    "spirv.Return"() : () -> () loc("<stdin>":88:5)
  }) : () -> () loc("<stdin>":84:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<3xi32>, vector<3xi64>) -> (), sym_name = "sconvert_vector"}> ({
  ^bb0(%arg9: vector<3xi32> loc("<stdin>":91:8), %arg10: vector<3xi64> loc("<stdin>":91:30)):
    %9 = "spirv.SConvert"(%arg9) : (vector<3xi32>) -> vector<3xi64> loc("<stdin>":92:10)
    %10 = "spirv.SConvert"(%arg10) : (vector<3xi64>) -> vector<3xi32> loc("<stdin>":93:11)
    "spirv.Return"() : () -> () loc("<stdin>":94:5)
  }) : () -> () loc("<stdin>":90:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32, i64) -> (), sym_name = "uconvert_scalar"}> ({
  ^bb0(%arg7: i32 loc("<stdin>":97:8), %arg8: i64 loc("<stdin>":97:20)):
    %7 = "spirv.UConvert"(%arg7) : (i32) -> i64 loc("<stdin>":98:10)
    %8 = "spirv.UConvert"(%arg8) : (i64) -> i32 loc("<stdin>":99:10)
    "spirv.Return"() : () -> () loc("<stdin>":100:5)
  }) : () -> () loc("<stdin>":96:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<3xi32>, vector<3xi64>) -> (), sym_name = "uconvert_vector"}> ({
  ^bb0(%arg5: vector<3xi32> loc("<stdin>":103:8), %arg6: vector<3xi64> loc("<stdin>":103:30)):
    %5 = "spirv.UConvert"(%arg5) : (vector<3xi32>) -> vector<3xi64> loc("<stdin>":104:10)
    %6 = "spirv.UConvert"(%arg6) : (vector<3xi64>) -> vector<3xi32> loc("<stdin>":105:10)
    "spirv.Return"() : () -> () loc("<stdin>":106:5)
  }) : () -> () loc("<stdin>":102:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<i32, Generic>) -> (), sym_name = "convert_ptr_to_u"}> ({
  ^bb0(%arg4: !spirv.ptr<i32, Generic> loc("<stdin>":109:8)):
    %4 = "spirv.ConvertPtrToU"(%arg4) : (!spirv.ptr<i32, Generic>) -> i32 loc("<stdin>":110:10)
    "spirv.Return"() : () -> () loc("<stdin>":111:5)
  }) : () -> () loc("<stdin>":108:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> (), sym_name = "convert_u_to_ptr"}> ({
  ^bb0(%arg3: i32 loc("<stdin>":114:8)):
    %3 = "spirv.ConvertUToPtr"(%arg3) : (i32) -> !spirv.ptr<i32, Generic> loc("<stdin>":115:10)
    "spirv.Return"() : () -> () loc("<stdin>":116:5)
  }) : () -> () loc("<stdin>":113:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<f32, CrossWorkgroup>) -> (), sym_name = "ptr_cast_to_generic"}> ({
  ^bb0(%arg2: !spirv.ptr<f32, CrossWorkgroup> loc("<stdin>":119:8)):
    %2 = "spirv.PtrCastToGeneric"(%arg2) : (!spirv.ptr<f32, CrossWorkgroup>) -> !spirv.ptr<f32, Generic> loc("<stdin>":120:10)
    "spirv.Return"() : () -> () loc("<stdin>":121:5)
  }) : () -> () loc("<stdin>":118:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<vector<2xi32>, Generic>) -> (), sym_name = "generic_cast_to_ptr"}> ({
  ^bb0(%arg1: !spirv.ptr<vector<2xi32>, Generic> loc("<stdin>":124:8)):
    %1 = "spirv.GenericCastToPtr"(%arg1) : (!spirv.ptr<vector<2xi32>, Generic>) -> !spirv.ptr<vector<2xi32>, CrossWorkgroup> loc("<stdin>":125:10)
    "spirv.Return"() : () -> () loc("<stdin>":126:5)
  }) : () -> () loc("<stdin>":123:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<vector<2xi32>, Generic>) -> (), sym_name = "generic_cast_to_ptr_explicit"}> ({
  ^bb0(%arg0: !spirv.ptr<vector<2xi32>, Generic> loc("<stdin>":129:8)):
    %0 = "spirv.GenericCastToPtrExplicit"(%arg0) : (!spirv.ptr<vector<2xi32>, Generic>) -> !spirv.ptr<vector<2xi32>, CrossWorkgroup> loc("<stdin>":130:10)
    "spirv.Return"() : () -> () loc("<stdin>":131:5)
  }) : () -> () loc("<stdin>":128:3)
}) : () -> () loc("<stdin>":1:1)
