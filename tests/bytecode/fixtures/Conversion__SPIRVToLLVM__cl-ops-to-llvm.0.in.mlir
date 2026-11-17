"builtin.module"() ({
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32, vector<3xf32>) -> (), sym_name = "cl_unary_float"}> ({
  ^bb0(%arg13: f32 loc("<stdin>":3:8), %arg14: vector<3xf32> loc("<stdin>":3:21)):
    %13 = "spirv.CL.ceil"(%arg13) : (f32) -> f32 loc("<stdin>":4:11)
    %14 = "spirv.CL.cos"(%arg13) : (f32) -> f32 loc("<stdin>":5:11)
    %15 = "spirv.CL.exp"(%arg13) : (f32) -> f32 loc("<stdin>":6:11)
    %16 = "spirv.CL.exp2"(%arg13) : (f32) -> f32 loc("<stdin>":7:11)
    %17 = "spirv.CL.exp10"(%arg13) : (f32) -> f32 loc("<stdin>":8:11)
    %18 = "spirv.CL.fabs"(%arg13) : (f32) -> f32 loc("<stdin>":9:11)
    %19 = "spirv.CL.floor"(%arg13) : (f32) -> f32 loc("<stdin>":10:11)
    %20 = "spirv.CL.log"(%arg13) : (f32) -> f32 loc("<stdin>":11:11)
    %21 = "spirv.CL.log2"(%arg13) : (f32) -> f32 loc("<stdin>":12:11)
    %22 = "spirv.CL.log10"(%arg13) : (f32) -> f32 loc("<stdin>":13:11)
    %23 = "spirv.CL.rint"(%arg13) : (f32) -> f32 loc("<stdin>":14:11)
    %24 = "spirv.CL.round"(%arg13) : (f32) -> f32 loc("<stdin>":15:11)
    %25 = "spirv.CL.sin"(%arg13) : (f32) -> f32 loc("<stdin>":16:11)
    %26 = "spirv.CL.sinh"(%arg13) : (f32) -> f32 loc("<stdin>":17:11)
    %27 = "spirv.CL.cosh"(%arg13) : (f32) -> f32 loc("<stdin>":18:11)
    %28 = "spirv.CL.tan"(%arg13) : (f32) -> f32 loc("<stdin>":19:11)
    %29 = "spirv.CL.tanh"(%arg13) : (f32) -> f32 loc("<stdin>":20:11)
    %30 = "spirv.CL.asin"(%arg13) : (f32) -> f32 loc("<stdin>":21:11)
    %31 = "spirv.CL.acos"(%arg13) : (f32) -> f32 loc("<stdin>":22:11)
    %32 = "spirv.CL.atan"(%arg13) : (f32) -> f32 loc("<stdin>":23:11)
    %33 = "spirv.CL.sqrt"(%arg13) : (f32) -> f32 loc("<stdin>":24:11)
    %34 = "spirv.CL.trunc"(%arg13) : (f32) -> f32 loc("<stdin>":25:11)
    %35 = "spirv.CL.sin"(%arg14) : (vector<3xf32>) -> vector<3xf32> loc("<stdin>":26:11)
    "spirv.Return"() : () -> () loc("<stdin>":27:5)
  }) : () -> () loc("<stdin>":2:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32, f32) -> (), sym_name = "cl_binary_float"}> ({
  ^bb0(%arg11: f32 loc("<stdin>":30:8), %arg12: f32 loc("<stdin>":30:21)):
    %7 = "spirv.CL.pow"(%arg11, %arg12) : (f32, f32) -> f32 loc("<stdin>":31:10)
    %8 = "spirv.CL.atan2"(%arg11, %arg12) : (f32, f32) -> f32 loc("<stdin>":32:10)
    %9 = "spirv.CL.fmax"(%arg11, %arg12) : (f32, f32) -> f32 loc("<stdin>":33:10)
    %10 = "spirv.CL.fmin"(%arg11, %arg12) : (f32, f32) -> f32 loc("<stdin>":34:11)
    %11 = "spirv.CL.copysign"(%arg11, %arg12) : (f32, f32) -> f32 loc("<stdin>":35:11)
    %12 = "spirv.CL.fmod"(%arg11, %arg12) : (f32, f32) -> f32 loc("<stdin>":36:11)
    "spirv.Return"() : () -> () loc("<stdin>":37:5)
  }) : () -> () loc("<stdin>":29:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32, f32, f32) -> (), sym_name = "cl_fma"}> ({
  ^bb0(%arg8: f32 loc("<stdin>":40:8), %arg9: f32 loc("<stdin>":40:20), %arg10: f32 loc("<stdin>":40:32)):
    %6 = "spirv.CL.fma"(%arg8, %arg9, %arg10) : (f32, f32, f32) -> f32 loc("<stdin>":41:10)
    "spirv.Return"() : () -> () loc("<stdin>":42:5)
  }) : () -> () loc("<stdin>":39:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32, i32) -> (), sym_name = "cl_integer"}> ({
  ^bb0(%arg6: i32 loc("<stdin>":45:8), %arg7: i32 loc("<stdin>":45:20)):
    %2 = "spirv.CL.s_max"(%arg6, %arg7) : (i32, i32) -> i32 loc("<stdin>":46:10)
    %3 = "spirv.CL.s_min"(%arg6, %arg7) : (i32, i32) -> i32 loc("<stdin>":47:10)
    %4 = "spirv.CL.u_max"(%arg6, %arg7) : (i32, i32) -> i32 loc("<stdin>":48:10)
    %5 = "spirv.CL.u_min"(%arg6, %arg7) : (i32, i32) -> i32 loc("<stdin>":49:10)
    "spirv.Return"() : () -> () loc("<stdin>":50:5)
  }) : () -> () loc("<stdin>":44:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32, f32, f32) -> (), sym_name = "mix_scalar"}> ({
  ^bb0(%arg3: f32 loc("<stdin>":53:8), %arg4: f32 loc("<stdin>":53:20), %arg5: f32 loc("<stdin>":53:32)):
    %1 = "spirv.CL.mix"(%arg3, %arg4, %arg5) : (f32, f32, f32) -> f32 loc("<stdin>":54:10)
    "spirv.Return"() : () -> () loc("<stdin>":55:5)
  }) : () -> () loc("<stdin>":52:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xf32>, vector<4xf32>, vector<4xf32>) -> (), sym_name = "mix_vector"}> ({
  ^bb0(%arg0: vector<4xf32> loc("<stdin>":58:8), %arg1: vector<4xf32> loc("<stdin>":58:30), %arg2: vector<4xf32> loc("<stdin>":58:52)):
    %0 = "spirv.CL.mix"(%arg0, %arg1, %arg2) : (vector<4xf32>, vector<4xf32>, vector<4xf32>) -> vector<4xf32> loc("<stdin>":59:10)
    "spirv.Return"() : () -> () loc("<stdin>":60:5)
  }) : () -> () loc("<stdin>":57:3)
}) : () -> () loc("<stdin>":1:1)
