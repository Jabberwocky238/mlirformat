"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Physical64>, memory_model = #spirv.memory_model<OpenCL>, vce_triple = #spirv.vce<v1.0, [Kernel, Addresses, Vector16, Linkage], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> (), sym_name = "float_insts"}> ({
    ^bb0(%arg13: f32 loc("<stdin>":4:10)):
      %16 = "spirv.CL.exp"(%arg13) : (f32) -> f32 loc("<stdin>":5:13)
      %17 = "spirv.CL.fabs"(%arg13) : (f32) -> f32 loc("<stdin>":6:13)
      %18 = "spirv.CL.sin"(%arg13) : (f32) -> f32 loc("<stdin>":7:13)
      %19 = "spirv.CL.cos"(%arg13) : (f32) -> f32 loc("<stdin>":8:13)
      %20 = "spirv.CL.log"(%arg13) : (f32) -> f32 loc("<stdin>":9:13)
      %21 = "spirv.CL.exp2"(%arg13) : (f32) -> f32 loc("<stdin>":10:13)
      %22 = "spirv.CL.exp10"(%arg13) : (f32) -> f32 loc("<stdin>":11:13)
      %23 = "spirv.CL.log2"(%arg13) : (f32) -> f32 loc("<stdin>":12:13)
      %24 = "spirv.CL.log10"(%arg13) : (f32) -> f32 loc("<stdin>":13:13)
      %25 = "spirv.CL.sqrt"(%arg13) : (f32) -> f32 loc("<stdin>":14:13)
      %26 = "spirv.CL.ceil"(%arg13) : (f32) -> f32 loc("<stdin>":15:13)
      %27 = "spirv.CL.floor"(%arg13) : (f32) -> f32 loc("<stdin>":16:13)
      %28 = "spirv.CL.pow"(%arg13, %arg13) : (f32, f32) -> f32 loc("<stdin>":17:13)
      %29 = "spirv.CL.rsqrt"(%arg13) : (f32) -> f32 loc("<stdin>":18:13)
      %30 = "spirv.CL.erf"(%arg13) : (f32) -> f32 loc("<stdin>":19:13)
      %31 = "spirv.CL.erfc"(%arg13) : (f32) -> f32 loc("<stdin>":20:13)
      %32 = "spirv.CL.trunc"(%arg13) : (f32) -> f32 loc("<stdin>":21:13)
      %33 = "spirv.CL.cbrt"(%arg13) : (f32) -> f32 loc("<stdin>":22:13)
      %34 = "spirv.CL.copysign"(%arg13, %arg13) : (f32, f32) -> f32 loc("<stdin>":23:13)
      %35 = "spirv.CL.expm1"(%arg13) : (f32) -> f32 loc("<stdin>":24:13)
      %36 = "spirv.CL.fdim"(%arg13, %arg13) : (f32, f32) -> f32 loc("<stdin>":25:13)
      %37 = "spirv.CL.fmod"(%arg13, %arg13) : (f32, f32) -> f32 loc("<stdin>":26:13)
      %38 = "spirv.CL.hypot"(%arg13, %arg13) : (f32, f32) -> f32 loc("<stdin>":27:13)
      %39 = "spirv.CL.log1p"(%arg13) : (f32) -> f32 loc("<stdin>":28:13)
      "spirv.Return"() : () -> () loc("<stdin>":29:7)
    }) : () -> () loc("<stdin>":3:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> (), sym_name = "integer_insts"}> ({
    ^bb0(%arg12: i32 loc("<stdin>":32:10)):
      %14 = "spirv.CL.s_abs"(%arg12) : (i32) -> i32 loc("<stdin>":33:13)
      %15 = "spirv.CL.clz"(%arg12) : (i32) -> i32 loc("<stdin>":34:13)
      "spirv.Return"() : () -> () loc("<stdin>":35:7)
    }) : () -> () loc("<stdin>":31:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<16xf32>) -> (), sym_name = "vector_size16"}> ({
    ^bb0(%arg11: vector<16xf32> loc("<stdin>":38:10)):
      %13 = "spirv.CL.fabs"(%arg11) : (vector<16xf32>) -> vector<16xf32> loc("<stdin>":39:13)
      "spirv.Return"() : () -> () loc("<stdin>":40:7)
    }) : () -> () loc("<stdin>":37:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32, f32, f32) -> (), sym_name = "fma"}> ({
    ^bb0(%arg8: f32 loc("<stdin>":43:10), %arg9: f32 loc("<stdin>":43:22), %arg10: f32 loc("<stdin>":43:34)):
      %12 = "spirv.CL.fma"(%arg8, %arg9, %arg10) : (f32, f32, f32) -> f32 loc("<stdin>":44:13)
      "spirv.Return"() : () -> () loc("<stdin>":45:7)
    }) : () -> () loc("<stdin>":42:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32, i32) -> (), sym_name = "float_int_insts"}> ({
    ^bb0(%arg6: f32 loc("<stdin>":48:10), %arg7: i32 loc("<stdin>":48:22)):
      %9 = "spirv.CL.ldexp"(%arg6, %arg7) : (f32, i32) -> f32 loc("<stdin>":49:12)
      %10 = "spirv.CL.pown"(%arg6, %arg7) : (f32, i32) -> f32 loc("<stdin>":50:13)
      %11 = "spirv.CL.rootn"(%arg6, %arg7) : (f32, i32) -> f32 loc("<stdin>":51:13)
      "spirv.Return"() : () -> () loc("<stdin>":52:7)
    }) : () -> () loc("<stdin>":47:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<3xf32>, vector<3xi32>) -> (), sym_name = "float_int_vec_insts"}> ({
    ^bb0(%arg4: vector<3xf32> loc("<stdin>":55:10), %arg5: vector<3xi32> loc("<stdin>":55:32)):
      %6 = "spirv.CL.ldexp"(%arg4, %arg5) : (vector<3xf32>, vector<3xi32>) -> vector<3xf32> loc("<stdin>":56:12)
      %7 = "spirv.CL.pown"(%arg4, %arg5) : (vector<3xf32>, vector<3xi32>) -> vector<3xf32> loc("<stdin>":57:12)
      %8 = "spirv.CL.rootn"(%arg4, %arg5) : (vector<3xf32>, vector<3xi32>) -> vector<3xf32> loc("<stdin>":58:12)
      "spirv.Return"() : () -> () loc("<stdin>":59:7)
    }) : () -> () loc("<stdin>":54:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32, f32, i32, i32) -> (), sym_name = "maxmin"}> ({
    ^bb0(%arg0: f32 loc("<stdin>":62:10), %arg1: f32 loc("<stdin>":62:22), %arg2: i32 loc("<stdin>":62:34), %arg3: i32 loc("<stdin>":62:46)):
      %0 = "spirv.CL.fmax"(%arg0, %arg1) : (f32, f32) -> f32 loc("<stdin>":63:12)
      %1 = "spirv.CL.s_max"(%arg2, %arg3) : (i32, i32) -> i32 loc("<stdin>":64:12)
      %2 = "spirv.CL.u_max"(%arg2, %arg3) : (i32, i32) -> i32 loc("<stdin>":65:12)
      %3 = "spirv.CL.fmin"(%arg0, %arg1) : (f32, f32) -> f32 loc("<stdin>":66:12)
      %4 = "spirv.CL.s_min"(%arg2, %arg3) : (i32, i32) -> i32 loc("<stdin>":67:12)
      %5 = "spirv.CL.u_min"(%arg2, %arg3) : (i32, i32) -> i32 loc("<stdin>":68:12)
      "spirv.Return"() : () -> () loc("<stdin>":69:7)
    }) : () -> () loc("<stdin>":61:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
