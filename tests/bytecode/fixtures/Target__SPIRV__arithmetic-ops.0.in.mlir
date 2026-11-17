"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage, BFloat16TypeKHR, BFloat16DotProductKHR], [SPV_KHR_bfloat16]>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32, f32) -> (), sym_name = "fmul"}> ({
    ^bb0(%arg36: f32 loc("<stdin>":4:10), %arg37: f32 loc("<stdin>":4:23)):
      %19 = "spirv.FMul"(%arg36, %arg37) : (f32, f32) -> f32 loc("<stdin>":5:13)
      "spirv.Return"() : () -> () loc("<stdin>":6:7)
    }) : () -> () loc("<stdin>":3:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xf32>, vector<4xf32>) -> (), sym_name = "fadd"}> ({
    ^bb0(%arg34: vector<4xf32> loc("<stdin>":9:10), %arg35: vector<4xf32> loc("<stdin>":9:33)):
      %18 = "spirv.FAdd"(%arg34, %arg35) : (vector<4xf32>, vector<4xf32>) -> vector<4xf32> loc("<stdin>":10:13)
      "spirv.Return"() : () -> () loc("<stdin>":11:7)
    }) : () -> () loc("<stdin>":8:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xf32>, vector<4xf32>) -> (), sym_name = "fdiv"}> ({
    ^bb0(%arg32: vector<4xf32> loc("<stdin>":14:10), %arg33: vector<4xf32> loc("<stdin>":14:33)):
      %17 = "spirv.FDiv"(%arg32, %arg33) : (vector<4xf32>, vector<4xf32>) -> vector<4xf32> loc("<stdin>":15:13)
      "spirv.Return"() : () -> () loc("<stdin>":16:7)
    }) : () -> () loc("<stdin>":13:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xf32>, vector<4xf32>) -> (), sym_name = "fmod"}> ({
    ^bb0(%arg30: vector<4xf32> loc("<stdin>":19:10), %arg31: vector<4xf32> loc("<stdin>":19:33)):
      %16 = "spirv.FMod"(%arg30, %arg31) : (vector<4xf32>, vector<4xf32>) -> vector<4xf32> loc("<stdin>":20:13)
      "spirv.Return"() : () -> () loc("<stdin>":21:7)
    }) : () -> () loc("<stdin>":18:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xf32>) -> (), sym_name = "fnegate"}> ({
    ^bb0(%arg29: vector<4xf32> loc("<stdin>":24:10)):
      %15 = "spirv.FNegate"(%arg29) : (vector<4xf32>) -> vector<4xf32> loc("<stdin>":25:13)
      "spirv.Return"() : () -> () loc("<stdin>":26:7)
    }) : () -> () loc("<stdin>":23:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xf32>, vector<4xf32>) -> (), sym_name = "fsub"}> ({
    ^bb0(%arg27: vector<4xf32> loc("<stdin>":29:10), %arg28: vector<4xf32> loc("<stdin>":29:33)):
      %14 = "spirv.FSub"(%arg27, %arg28) : (vector<4xf32>, vector<4xf32>) -> vector<4xf32> loc("<stdin>":30:13)
      "spirv.Return"() : () -> () loc("<stdin>":31:7)
    }) : () -> () loc("<stdin>":28:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xf32>, vector<4xf32>) -> (), sym_name = "frem"}> ({
    ^bb0(%arg25: vector<4xf32> loc("<stdin>":34:10), %arg26: vector<4xf32> loc("<stdin>":34:33)):
      %13 = "spirv.FRem"(%arg25, %arg26) : (vector<4xf32>, vector<4xf32>) -> vector<4xf32> loc("<stdin>":35:13)
      "spirv.Return"() : () -> () loc("<stdin>":36:7)
    }) : () -> () loc("<stdin>":33:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi32>, vector<4xi32>) -> (), sym_name = "iadd"}> ({
    ^bb0(%arg23: vector<4xi32> loc("<stdin>":39:10), %arg24: vector<4xi32> loc("<stdin>":39:33)):
      %12 = "spirv.IAdd"(%arg23, %arg24) : (vector<4xi32>, vector<4xi32>) -> vector<4xi32> loc("<stdin>":40:13)
      "spirv.Return"() : () -> () loc("<stdin>":41:7)
    }) : () -> () loc("<stdin>":38:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi32>, vector<4xi32>) -> (), sym_name = "isub"}> ({
    ^bb0(%arg21: vector<4xi32> loc("<stdin>":44:10), %arg22: vector<4xi32> loc("<stdin>":44:33)):
      %11 = "spirv.ISub"(%arg21, %arg22) : (vector<4xi32>, vector<4xi32>) -> vector<4xi32> loc("<stdin>":45:13)
      "spirv.Return"() : () -> () loc("<stdin>":46:7)
    }) : () -> () loc("<stdin>":43:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi32>, vector<4xi32>) -> (), sym_name = "imul"}> ({
    ^bb0(%arg19: vector<4xi32> loc("<stdin>":49:10), %arg20: vector<4xi32> loc("<stdin>":49:33)):
      %10 = "spirv.IMul"(%arg19, %arg20) : (vector<4xi32>, vector<4xi32>) -> vector<4xi32> loc("<stdin>":50:13)
      "spirv.Return"() : () -> () loc("<stdin>":51:7)
    }) : () -> () loc("<stdin>":48:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32, i32) -> (), sym_name = "isub_borrow"}> ({
    ^bb0(%arg17: i32 loc("<stdin>":54:10), %arg18: i32 loc("<stdin>":54:23)):
      %9 = "spirv.ISubBorrow"(%arg17, %arg18) : (i32, i32) -> !spirv.struct<(i32, i32)> loc("<stdin>":55:12)
      "spirv.Return"() : () -> () loc("<stdin>":56:7)
    }) : () -> () loc("<stdin>":53:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi32>, vector<4xi32>) -> (), sym_name = "isub_borrow_vector"}> ({
    ^bb0(%arg15: vector<4xi32> loc("<stdin>":59:10), %arg16: vector<4xi32> loc("<stdin>":59:33)):
      %8 = "spirv.ISubBorrow"(%arg15, %arg16) : (vector<4xi32>, vector<4xi32>) -> !spirv.struct<(vector<4xi32>, vector<4xi32>)> loc("<stdin>":60:12)
      "spirv.Return"() : () -> () loc("<stdin>":61:7)
    }) : () -> () loc("<stdin>":58:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi32>, vector<4xi32>) -> (), sym_name = "udiv"}> ({
    ^bb0(%arg13: vector<4xi32> loc("<stdin>":64:10), %arg14: vector<4xi32> loc("<stdin>":64:33)):
      %7 = "spirv.UDiv"(%arg13, %arg14) : (vector<4xi32>, vector<4xi32>) -> vector<4xi32> loc("<stdin>":65:12)
      "spirv.Return"() : () -> () loc("<stdin>":66:7)
    }) : () -> () loc("<stdin>":63:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi32>, vector<4xi32>) -> (), sym_name = "umod"}> ({
    ^bb0(%arg11: vector<4xi32> loc("<stdin>":69:10), %arg12: vector<4xi32> loc("<stdin>":69:33)):
      %6 = "spirv.UMod"(%arg11, %arg12) : (vector<4xi32>, vector<4xi32>) -> vector<4xi32> loc("<stdin>":70:12)
      "spirv.Return"() : () -> () loc("<stdin>":71:7)
    }) : () -> () loc("<stdin>":68:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi32>, vector<4xi32>) -> (), sym_name = "sdiv"}> ({
    ^bb0(%arg9: vector<4xi32> loc("<stdin>":74:10), %arg10: vector<4xi32> loc("<stdin>":74:32)):
      %5 = "spirv.SDiv"(%arg9, %arg10) : (vector<4xi32>, vector<4xi32>) -> vector<4xi32> loc("<stdin>":75:12)
      "spirv.Return"() : () -> () loc("<stdin>":76:7)
    }) : () -> () loc("<stdin>":73:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi32>, vector<4xi32>) -> (), sym_name = "smod"}> ({
    ^bb0(%arg7: vector<4xi32> loc("<stdin>":79:10), %arg8: vector<4xi32> loc("<stdin>":79:32)):
      %4 = "spirv.SMod"(%arg7, %arg8) : (vector<4xi32>, vector<4xi32>) -> vector<4xi32> loc("<stdin>":80:12)
      "spirv.Return"() : () -> () loc("<stdin>":81:7)
    }) : () -> () loc("<stdin>":78:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi32>) -> (), sym_name = "snegate"}> ({
    ^bb0(%arg6: vector<4xi32> loc("<stdin>":84:10)):
      %3 = "spirv.SNegate"(%arg6) : (vector<4xi32>) -> vector<4xi32> loc("<stdin>":85:12)
      "spirv.Return"() : () -> () loc("<stdin>":86:7)
    }) : () -> () loc("<stdin>":83:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi32>, vector<4xi32>) -> (), sym_name = "srem"}> ({
    ^bb0(%arg4: vector<4xi32> loc("<stdin>":89:10), %arg5: vector<4xi32> loc("<stdin>":89:32)):
      %2 = "spirv.SRem"(%arg4, %arg5) : (vector<4xi32>, vector<4xi32>) -> vector<4xi32> loc("<stdin>":90:12)
      "spirv.Return"() : () -> () loc("<stdin>":91:7)
    }) : () -> () loc("<stdin>":88:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xf32>, f32) -> (), sym_name = "vector_times_scalar"}> ({
    ^bb0(%arg2: vector<4xf32> loc("<stdin>":94:10), %arg3: f32 loc("<stdin>":94:32)):
      %1 = "spirv.VectorTimesScalar"(%arg2, %arg3) : (vector<4xf32>, f32) -> vector<4xf32> loc("<stdin>":95:12)
      "spirv.Return"() : () -> () loc("<stdin>":96:7)
    }) : () -> () loc("<stdin>":93:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xbf16>, vector<4xbf16>) -> (), sym_name = "dot_bf16"}> ({
    ^bb0(%arg0: vector<4xbf16> loc("<stdin>":99:10), %arg1: vector<4xbf16> loc("<stdin>":99:33)):
      %0 = "spirv.Dot"(%arg0, %arg1) : (vector<4xbf16>, vector<4xbf16>) -> bf16 loc("<stdin>":100:12)
      "spirv.Return"() : () -> () loc("<stdin>":101:7)
    }) : () -> () loc("<stdin>":98:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
