"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32, f32, i32) -> (), sym_name = "math"}> ({
    ^bb0(%arg33: f32 loc("<stdin>":4:10), %arg34: f32 loc("<stdin>":4:23), %arg35: i32 loc("<stdin>":4:36)):
      %34 = "spirv.GL.Exp"(%arg33) : (f32) -> f32 loc("<stdin>":5:13)
      %35 = "spirv.GL.Sqrt"(%arg33) : (f32) -> f32 loc("<stdin>":6:13)
      %36 = "spirv.GL.Cos"(%arg33) : (f32) -> f32 loc("<stdin>":7:13)
      %37 = "spirv.GL.Sin"(%arg33) : (f32) -> f32 loc("<stdin>":8:13)
      %38 = "spirv.GL.Tan"(%arg33) : (f32) -> f32 loc("<stdin>":9:13)
      %39 = "spirv.GL.Acos"(%arg33) : (f32) -> f32 loc("<stdin>":10:13)
      %40 = "spirv.GL.Asin"(%arg33) : (f32) -> f32 loc("<stdin>":11:13)
      %41 = "spirv.GL.Atan"(%arg33) : (f32) -> f32 loc("<stdin>":12:13)
      %42 = "spirv.GL.Atan2"(%arg33, %arg34) : (f32, f32) -> f32 loc("<stdin>":13:13)
      %43 = "spirv.GL.Sinh"(%arg33) : (f32) -> f32 loc("<stdin>":14:13)
      %44 = "spirv.GL.Cosh"(%arg33) : (f32) -> f32 loc("<stdin>":15:13)
      %45 = "spirv.GL.Pow"(%arg33, %arg34) : (f32, f32) -> f32 loc("<stdin>":16:13)
      %46 = "spirv.GL.Round"(%arg33) : (f32) -> f32 loc("<stdin>":17:13)
      %47 = "spirv.GL.Trunc"(%arg33) : (f32) -> f32 loc("<stdin>":18:13)
      %48 = "spirv.GL.FrexpStruct"(%arg33) : (f32) -> !spirv.struct<(f32, i32)> loc("<stdin>":19:13)
      %49 = "spirv.GL.Ldexp"(%arg33, %arg35) : (f32, i32) -> f32 loc("<stdin>":20:13)
      %50 = "spirv.GL.FMix"(%arg33, %arg34, %arg33) : (f32, f32, f32) -> f32 loc("<stdin>":21:13)
      %51 = "spirv.GL.Fract"(%arg33) : (f32) -> f32 loc("<stdin>":22:13)
      %52 = "spirv.GL.Asinh"(%arg33) : (f32) -> f32 loc("<stdin>":23:13)
      %53 = "spirv.GL.Acosh"(%arg33) : (f32) -> f32 loc("<stdin>":24:13)
      %54 = "spirv.GL.Atanh"(%arg33) : (f32) -> f32 loc("<stdin>":25:13)
      %55 = "spirv.GL.Log2"(%arg33) : (f32) -> f32 loc("<stdin>":26:13)
      %56 = "spirv.GL.Tanh"(%arg33) : (f32) -> f32 loc("<stdin>":27:13)
      %57 = "spirv.GL.Exp2"(%arg33) : (f32) -> f32 loc("<stdin>":28:13)
      %58 = "spirv.GL.Radians"(%arg33) : (f32) -> f32 loc("<stdin>":29:13)
      %59 = "spirv.GL.Degrees"(%arg33) : (f32) -> f32 loc("<stdin>":30:13)
      "spirv.Return"() : () -> () loc("<stdin>":31:7)
    }) : () -> () loc("<stdin>":3:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32, f32, i32, i32) -> (), sym_name = "maxmin"}> ({
    ^bb0(%arg29: f32 loc("<stdin>":34:10), %arg30: f32 loc("<stdin>":34:23), %arg31: i32 loc("<stdin>":34:36), %arg32: i32 loc("<stdin>":34:49)):
      %26 = "spirv.GL.FMax"(%arg29, %arg30) : (f32, f32) -> f32 loc("<stdin>":35:13)
      %27 = "spirv.GL.SMax"(%arg31, %arg32) : (i32, i32) -> i32 loc("<stdin>":36:13)
      %28 = "spirv.GL.UMax"(%arg31, %arg32) : (i32, i32) -> i32 loc("<stdin>":37:13)
      %29 = "spirv.GL.FMin"(%arg29, %arg30) : (f32, f32) -> f32 loc("<stdin>":38:13)
      %30 = "spirv.GL.SMin"(%arg31, %arg32) : (i32, i32) -> i32 loc("<stdin>":39:13)
      %31 = "spirv.GL.UMin"(%arg31, %arg32) : (i32, i32) -> i32 loc("<stdin>":40:13)
      %32 = "spirv.GL.NMax"(%arg29, %arg30) : (f32, f32) -> f32 loc("<stdin>":41:13)
      %33 = "spirv.GL.NMin"(%arg29, %arg30) : (f32, f32) -> f32 loc("<stdin>":42:13)
      "spirv.Return"() : () -> () loc("<stdin>":43:7)
    }) : () -> () loc("<stdin>":33:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32, f32, f32) -> (), sym_name = "fclamp"}> ({
    ^bb0(%arg26: f32 loc("<stdin>":46:10), %arg27: f32 loc("<stdin>":46:23), %arg28: f32 loc("<stdin>":46:36)):
      %25 = "spirv.GL.FClamp"(%arg26, %arg27, %arg28) : (f32, f32, f32) -> f32 loc("<stdin>":47:13)
      "spirv.Return"() : () -> () loc("<stdin>":48:7)
    }) : () -> () loc("<stdin>":45:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32, f32, f32) -> (), sym_name = "nclamp"}> ({
    ^bb0(%arg23: f32 loc("<stdin>":51:10), %arg24: f32 loc("<stdin>":51:23), %arg25: f32 loc("<stdin>":51:36)):
      %24 = "spirv.GL.NClamp"(%arg23, %arg24, %arg25) : (f32, f32, f32) -> f32 loc("<stdin>":52:13)
      "spirv.Return"() : () -> () loc("<stdin>":53:7)
    }) : () -> () loc("<stdin>":50:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (ui32, ui32, ui32) -> (), sym_name = "uclamp"}> ({
    ^bb0(%arg20: ui32 loc("<stdin>":56:10), %arg21: ui32 loc("<stdin>":56:24), %arg22: ui32 loc("<stdin>":56:38)):
      %23 = "spirv.GL.UClamp"(%arg20, %arg21, %arg22) : (ui32, ui32, ui32) -> ui32 loc("<stdin>":57:13)
      "spirv.Return"() : () -> () loc("<stdin>":58:7)
    }) : () -> () loc("<stdin>":55:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (si32, si32, si32) -> (), sym_name = "sclamp"}> ({
    ^bb0(%arg17: si32 loc("<stdin>":61:10), %arg18: si32 loc("<stdin>":61:24), %arg19: si32 loc("<stdin>":61:38)):
      %22 = "spirv.GL.SClamp"(%arg17, %arg18, %arg19) : (si32, si32, si32) -> si32 loc("<stdin>":62:13)
      "spirv.Return"() : () -> () loc("<stdin>":63:7)
    }) : () -> () loc("<stdin>":60:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32, f32, f32) -> (), sym_name = "fma"}> ({
    ^bb0(%arg14: f32 loc("<stdin>":66:10), %arg15: f32 loc("<stdin>":66:23), %arg16: f32 loc("<stdin>":66:36)):
      %21 = "spirv.GL.Fma"(%arg14, %arg15, %arg16) : (f32, f32, f32) -> f32 loc("<stdin>":67:13)
      "spirv.Return"() : () -> () loc("<stdin>":68:7)
    }) : () -> () loc("<stdin>":65:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> (), sym_name = "findilsb"}> ({
    ^bb0(%arg13: i32 loc("<stdin>":71:10)):
      %20 = "spirv.GL.FindILsb"(%arg13) : (i32) -> i32 loc("<stdin>":72:13)
      "spirv.Return"() : () -> () loc("<stdin>":73:7)
    }) : () -> () loc("<stdin>":70:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> (), sym_name = "findsmsb"}> ({
    ^bb0(%arg12: i32 loc("<stdin>":76:10)):
      %19 = "spirv.GL.FindSMsb"(%arg12) : (i32) -> i32 loc("<stdin>":77:13)
      "spirv.Return"() : () -> () loc("<stdin>":78:7)
    }) : () -> () loc("<stdin>":75:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> (), sym_name = "findumsb"}> ({
    ^bb0(%arg11: i32 loc("<stdin>":81:10)):
      %18 = "spirv.GL.FindUMsb"(%arg11) : (i32) -> i32 loc("<stdin>":82:13)
      "spirv.Return"() : () -> () loc("<stdin>":83:7)
    }) : () -> () loc("<stdin>":80:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32, vector<3xf32>, vector<3xf32>, vector<3xi32>) -> (), sym_name = "vector"}> ({
    ^bb0(%arg7: f32 loc("<stdin>":86:10), %arg8: vector<3xf32> loc("<stdin>":86:22), %arg9: vector<3xf32> loc("<stdin>":86:44), %arg10: vector<3xi32> loc("<stdin>":86:66)):
      %6 = "spirv.GL.Cross"(%arg8, %arg9) : (vector<3xf32>, vector<3xf32>) -> vector<3xf32> loc("<stdin>":87:12)
      %7 = "spirv.GL.Normalize"(%arg7) : (f32) -> f32 loc("<stdin>":88:12)
      %8 = "spirv.GL.Normalize"(%arg8) : (vector<3xf32>) -> vector<3xf32> loc("<stdin>":89:12)
      %9 = "spirv.GL.Reflect"(%arg7, %arg7) : (f32, f32) -> f32 loc("<stdin>":90:12)
      %10 = "spirv.GL.Reflect"(%arg8, %arg9) : (vector<3xf32>, vector<3xf32>) -> vector<3xf32> loc("<stdin>":91:13)
      %11 = "spirv.GL.Distance"(%arg7, %arg7) : (f32, f32) -> f32 loc("<stdin>":92:13)
      %12 = "spirv.GL.Distance"(%arg8, %arg9) : (vector<3xf32>, vector<3xf32>) -> f32 loc("<stdin>":93:13)
      %13 = "spirv.GL.FindILsb"(%arg10) : (vector<3xi32>) -> vector<3xi32> loc("<stdin>":94:13)
      %14 = "spirv.GL.FindSMsb"(%arg10) : (vector<3xi32>) -> vector<3xi32> loc("<stdin>":95:13)
      %15 = "spirv.GL.FindUMsb"(%arg10) : (vector<3xi32>) -> vector<3xi32> loc("<stdin>":96:13)
      %16 = "spirv.GL.Length"(%arg7) : (f32) -> f32 loc("<stdin>":97:13)
      %17 = "spirv.GL.Length"(%arg8) : (vector<3xf32>) -> f32 loc("<stdin>":98:13)
      "spirv.Return"() : () -> () loc("<stdin>":99:7)
    }) : () -> () loc("<stdin>":85:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> (), sym_name = "pack_half_2x16"}> ({
    ^bb0(%arg6: i32 loc("<stdin>":102:10)):
      %4 = "spirv.GL.UnpackHalf2x16"(%arg6) : (i32) -> vector<2xf32> loc("<stdin>":103:12)
      %5 = "spirv.GL.PackHalf2x16"(%4) : (vector<2xf32>) -> i32 loc("<stdin>":104:12)
      "spirv.Return"() : () -> () loc("<stdin>":105:7)
    }) : () -> () loc("<stdin>":101:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> (), sym_name = "pack_snorm_4x8"}> ({
    ^bb0(%arg5: i32 loc("<stdin>":108:10)):
      %2 = "spirv.GL.UnpackSnorm4x8"(%arg5) : (i32) -> vector<4xf32> loc("<stdin>":109:12)
      %3 = "spirv.GL.PackSnorm4x8"(%2) : (vector<4xf32>) -> i32 loc("<stdin>":110:12)
      "spirv.Return"() : () -> () loc("<stdin>":111:7)
    }) : () -> () loc("<stdin>":107:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32, f32) -> (), sym_name = "step"}> ({
    ^bb0(%arg3: f32 loc("<stdin>":114:10), %arg4: f32 loc("<stdin>":114:22)):
      %1 = "spirv.GL.Step"(%arg3, %arg4) : (f32, f32) -> f32 loc("<stdin>":115:12)
      "spirv.Return"() : () -> () loc("<stdin>":116:7)
    }) : () -> () loc("<stdin>":113:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32, f32, f32) -> (), sym_name = "smoothstep"}> ({
    ^bb0(%arg0: f32 loc("<stdin>":119:10), %arg1: f32 loc("<stdin>":119:22), %arg2: f32 loc("<stdin>":119:34)):
      %0 = "spirv.GL.SmoothStep"(%arg0, %arg1, %arg2) : (f32, f32, f32) -> f32 loc("<stdin>":120:12)
      "spirv.Return"() : () -> () loc("<stdin>":121:7)
    }) : () -> () loc("<stdin>":118:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
