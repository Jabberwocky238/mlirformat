"builtin.module"() ({
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32, i32) -> (), sym_name = "iadd_scalar"}> ({
  ^bb0(%arg50: i32 loc("<stdin>":3:8), %arg51: i32 loc("<stdin>":3:21)):
    %27 = "spirv.IAdd"(%arg50, %arg51) : (i32, i32) -> i32 loc("<stdin>":4:11)
    "spirv.Return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi64>, vector<4xi64>) -> (), sym_name = "iadd_vector"}> ({
  ^bb0(%arg48: vector<4xi64> loc("<stdin>":8:8), %arg49: vector<4xi64> loc("<stdin>":8:31)):
    %26 = "spirv.IAdd"(%arg48, %arg49) : (vector<4xi64>, vector<4xi64>) -> vector<4xi64> loc("<stdin>":9:11)
    "spirv.Return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i8, i8) -> (), sym_name = "isub_scalar"}> ({
  ^bb0(%arg46: i8 loc("<stdin>":13:8), %arg47: i8 loc("<stdin>":13:20)):
    %25 = "spirv.ISub"(%arg46, %arg47) : (i8, i8) -> i8 loc("<stdin>":14:11)
    "spirv.Return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<2xi16>, vector<2xi16>) -> (), sym_name = "isub_vector"}> ({
  ^bb0(%arg44: vector<2xi16> loc("<stdin>":18:8), %arg45: vector<2xi16> loc("<stdin>":18:31)):
    %24 = "spirv.ISub"(%arg44, %arg45) : (vector<2xi16>, vector<2xi16>) -> vector<2xi16> loc("<stdin>":19:11)
    "spirv.Return"() : () -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32, i32) -> (), sym_name = "imul_scalar"}> ({
  ^bb0(%arg42: i32 loc("<stdin>":23:8), %arg43: i32 loc("<stdin>":23:21)):
    %23 = "spirv.IMul"(%arg42, %arg43) : (i32, i32) -> i32 loc("<stdin>":24:11)
    "spirv.Return"() : () -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<3xi32>, vector<3xi32>) -> (), sym_name = "imul_vector"}> ({
  ^bb0(%arg40: vector<3xi32> loc("<stdin>":28:8), %arg41: vector<3xi32> loc("<stdin>":28:31)):
    %22 = "spirv.IMul"(%arg40, %arg41) : (vector<3xi32>, vector<3xi32>) -> vector<3xi32> loc("<stdin>":29:11)
    "spirv.Return"() : () -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":27:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f16, f16) -> (), sym_name = "fadd_scalar"}> ({
  ^bb0(%arg38: f16 loc("<stdin>":33:8), %arg39: f16 loc("<stdin>":33:21)):
    %21 = "spirv.FAdd"(%arg38, %arg39) : (f16, f16) -> f16 loc("<stdin>":34:11)
    "spirv.Return"() : () -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":32:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xf32>, vector<4xf32>) -> (), sym_name = "fadd_vector"}> ({
  ^bb0(%arg36: vector<4xf32> loc("<stdin>":38:8), %arg37: vector<4xf32> loc("<stdin>":38:31)):
    %20 = "spirv.FAdd"(%arg36, %arg37) : (vector<4xf32>, vector<4xf32>) -> vector<4xf32> loc("<stdin>":39:11)
    "spirv.Return"() : () -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":37:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32, f32) -> (), sym_name = "fsub_scalar"}> ({
  ^bb0(%arg34: f32 loc("<stdin>":43:8), %arg35: f32 loc("<stdin>":43:21)):
    %19 = "spirv.FSub"(%arg34, %arg35) : (f32, f32) -> f32 loc("<stdin>":44:11)
    "spirv.Return"() : () -> () loc("<stdin>":45:5)
  }) : () -> () loc("<stdin>":42:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<2xf32>, vector<2xf32>) -> (), sym_name = "fsub_vector"}> ({
  ^bb0(%arg32: vector<2xf32> loc("<stdin>":48:8), %arg33: vector<2xf32> loc("<stdin>":48:31)):
    %18 = "spirv.FSub"(%arg32, %arg33) : (vector<2xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":49:11)
    "spirv.Return"() : () -> () loc("<stdin>":50:5)
  }) : () -> () loc("<stdin>":47:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32, f32) -> (), sym_name = "fdiv_scalar"}> ({
  ^bb0(%arg30: f32 loc("<stdin>":53:8), %arg31: f32 loc("<stdin>":53:21)):
    %17 = "spirv.FDiv"(%arg30, %arg31) : (f32, f32) -> f32 loc("<stdin>":54:11)
    "spirv.Return"() : () -> () loc("<stdin>":55:5)
  }) : () -> () loc("<stdin>":52:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<3xf64>, vector<3xf64>) -> (), sym_name = "fdiv_vector"}> ({
  ^bb0(%arg28: vector<3xf64> loc("<stdin>":58:8), %arg29: vector<3xf64> loc("<stdin>":58:31)):
    %16 = "spirv.FDiv"(%arg28, %arg29) : (vector<3xf64>, vector<3xf64>) -> vector<3xf64> loc("<stdin>":59:11)
    "spirv.Return"() : () -> () loc("<stdin>":60:5)
  }) : () -> () loc("<stdin>":57:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32, f32) -> (), sym_name = "fmul_scalar"}> ({
  ^bb0(%arg26: f32 loc("<stdin>":63:8), %arg27: f32 loc("<stdin>":63:21)):
    %15 = "spirv.FMul"(%arg26, %arg27) : (f32, f32) -> f32 loc("<stdin>":64:11)
    "spirv.Return"() : () -> () loc("<stdin>":65:5)
  }) : () -> () loc("<stdin>":62:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<2xf32>, vector<2xf32>) -> (), sym_name = "fmul_vector"}> ({
  ^bb0(%arg24: vector<2xf32> loc("<stdin>":68:8), %arg25: vector<2xf32> loc("<stdin>":68:31)):
    %14 = "spirv.FMul"(%arg24, %arg25) : (vector<2xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":69:11)
    "spirv.Return"() : () -> () loc("<stdin>":70:5)
  }) : () -> () loc("<stdin>":67:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32, f32) -> (), sym_name = "frem_scalar"}> ({
  ^bb0(%arg22: f32 loc("<stdin>":73:8), %arg23: f32 loc("<stdin>":73:21)):
    %13 = "spirv.FRem"(%arg22, %arg23) : (f32, f32) -> f32 loc("<stdin>":74:11)
    "spirv.Return"() : () -> () loc("<stdin>":75:5)
  }) : () -> () loc("<stdin>":72:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<3xf64>, vector<3xf64>) -> (), sym_name = "frem_vector"}> ({
  ^bb0(%arg20: vector<3xf64> loc("<stdin>":78:8), %arg21: vector<3xf64> loc("<stdin>":78:31)):
    %12 = "spirv.FRem"(%arg20, %arg21) : (vector<3xf64>, vector<3xf64>) -> vector<3xf64> loc("<stdin>":79:11)
    "spirv.Return"() : () -> () loc("<stdin>":80:5)
  }) : () -> () loc("<stdin>":77:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f64) -> (), sym_name = "fneg_scalar"}> ({
  ^bb0(%arg19: f64 loc("<stdin>":83:8)):
    %11 = "spirv.FNegate"(%arg19) : (f64) -> f64 loc("<stdin>":84:11)
    "spirv.Return"() : () -> () loc("<stdin>":85:5)
  }) : () -> () loc("<stdin>":82:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<2xf32>) -> (), sym_name = "fneg_vector"}> ({
  ^bb0(%arg18: vector<2xf32> loc("<stdin>":88:8)):
    %10 = "spirv.FNegate"(%arg18) : (vector<2xf32>) -> vector<2xf32> loc("<stdin>":89:11)
    "spirv.Return"() : () -> () loc("<stdin>":90:5)
  }) : () -> () loc("<stdin>":87:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32, i32) -> (), sym_name = "udiv_scalar"}> ({
  ^bb0(%arg16: i32 loc("<stdin>":93:8), %arg17: i32 loc("<stdin>":93:21)):
    %9 = "spirv.UDiv"(%arg16, %arg17) : (i32, i32) -> i32 loc("<stdin>":94:10)
    "spirv.Return"() : () -> () loc("<stdin>":95:5)
  }) : () -> () loc("<stdin>":92:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<3xi64>, vector<3xi64>) -> (), sym_name = "udiv_vector"}> ({
  ^bb0(%arg14: vector<3xi64> loc("<stdin>":98:8), %arg15: vector<3xi64> loc("<stdin>":98:31)):
    %8 = "spirv.UDiv"(%arg14, %arg15) : (vector<3xi64>, vector<3xi64>) -> vector<3xi64> loc("<stdin>":99:10)
    "spirv.Return"() : () -> () loc("<stdin>":100:5)
  }) : () -> () loc("<stdin>":97:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32, i32) -> (), sym_name = "umod_scalar"}> ({
  ^bb0(%arg12: i32 loc("<stdin>":103:8), %arg13: i32 loc("<stdin>":103:21)):
    %7 = "spirv.UMod"(%arg12, %arg13) : (i32, i32) -> i32 loc("<stdin>":104:10)
    "spirv.Return"() : () -> () loc("<stdin>":105:5)
  }) : () -> () loc("<stdin>":102:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<3xi64>, vector<3xi64>) -> (), sym_name = "umod_vector"}> ({
  ^bb0(%arg10: vector<3xi64> loc("<stdin>":108:8), %arg11: vector<3xi64> loc("<stdin>":108:31)):
    %6 = "spirv.UMod"(%arg10, %arg11) : (vector<3xi64>, vector<3xi64>) -> vector<3xi64> loc("<stdin>":109:10)
    "spirv.Return"() : () -> () loc("<stdin>":110:5)
  }) : () -> () loc("<stdin>":107:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i16, i16) -> (), sym_name = "sdiv_scalar"}> ({
  ^bb0(%arg8: i16 loc("<stdin>":113:8), %arg9: i16 loc("<stdin>":113:20)):
    %5 = "spirv.SDiv"(%arg8, %arg9) : (i16, i16) -> i16 loc("<stdin>":114:10)
    "spirv.Return"() : () -> () loc("<stdin>":115:5)
  }) : () -> () loc("<stdin>":112:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<2xi64>, vector<2xi64>) -> (), sym_name = "sdiv_vector"}> ({
  ^bb0(%arg6: vector<2xi64> loc("<stdin>":118:8), %arg7: vector<2xi64> loc("<stdin>":118:30)):
    %4 = "spirv.SDiv"(%arg6, %arg7) : (vector<2xi64>, vector<2xi64>) -> vector<2xi64> loc("<stdin>":119:10)
    "spirv.Return"() : () -> () loc("<stdin>":120:5)
  }) : () -> () loc("<stdin>":117:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32, i32) -> (), sym_name = "srem_scalar"}> ({
  ^bb0(%arg4: i32 loc("<stdin>":123:8), %arg5: i32 loc("<stdin>":123:20)):
    %3 = "spirv.SRem"(%arg4, %arg5) : (i32, i32) -> i32 loc("<stdin>":124:10)
    "spirv.Return"() : () -> () loc("<stdin>":125:5)
  }) : () -> () loc("<stdin>":122:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi32>, vector<4xi32>) -> (), sym_name = "srem_vector"}> ({
  ^bb0(%arg2: vector<4xi32> loc("<stdin>":128:8), %arg3: vector<4xi32> loc("<stdin>":128:30)):
    %2 = "spirv.SRem"(%arg2, %arg3) : (vector<4xi32>, vector<4xi32>) -> vector<4xi32> loc("<stdin>":129:10)
    "spirv.Return"() : () -> () loc("<stdin>":130:5)
  }) : () -> () loc("<stdin>":127:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> (), sym_name = "snegate_scalar"}> ({
  ^bb0(%arg1: i32 loc("<stdin>":133:8)):
    %1 = "spirv.SNegate"(%arg1) : (i32) -> i32 loc("<stdin>":134:10)
    "spirv.Return"() : () -> () loc("<stdin>":135:5)
  }) : () -> () loc("<stdin>":132:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi32>) -> (), sym_name = "snegate_vector"}> ({
  ^bb0(%arg0: vector<4xi32> loc("<stdin>":138:8)):
    %0 = "spirv.SNegate"(%arg0) : (vector<4xi32>) -> vector<4xi32> loc("<stdin>":139:10)
    "spirv.Return"() : () -> () loc("<stdin>":140:5)
  }) : () -> () loc("<stdin>":137:3)
}) : () -> () loc("<stdin>":1:1)
