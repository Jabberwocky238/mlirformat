"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "exp"}> ({
  ^bb0(%arg1: f32):
    %1 = "spirv.GL.Exp"(%arg1) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf16>) -> (), sym_name = "expvec"}> ({
  ^bb0(%arg0: vector<3xf16>):
    %0 = "spirv.GL.Exp"(%arg0) : (vector<3xf16>) -> vector<3xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32) -> (), sym_name = "fmaxmin"}> ({
  ^bb0(%arg6: f32, %arg7: f32):
    %8 = "spirv.GL.FMax"(%arg6, %arg7) : (f32, f32) -> f32
    %9 = "spirv.GL.FMin"(%arg6, %arg7) : (f32, f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf16>, vector<3xf16>) -> (), sym_name = "fmaxminvec"}> ({
  ^bb0(%arg4: vector<3xf16>, %arg5: vector<3xf16>):
    %6 = "spirv.GL.FMax"(%arg4, %arg5) : (vector<3xf16>, vector<3xf16>) -> vector<3xf16>
    %7 = "spirv.GL.FMin"(%arg4, %arg5) : (vector<3xf16>, vector<3xf16>) -> vector<3xf16>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64, f64) -> (), sym_name = "fmaxminf64"}> ({
  ^bb0(%arg2: f64, %arg3: f64):
    %4 = "spirv.GL.FMax"(%arg2, %arg3) : (f64, f64) -> f64
    %5 = "spirv.GL.FMin"(%arg2, %arg3) : (f64, f64) -> f64
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "iminmax"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "spirv.GL.SMax"(%arg0, %arg1) : (i32, i32) -> i32
    %1 = "spirv.GL.UMax"(%arg0, %arg1) : (i32, i32) -> i32
    %2 = "spirv.GL.SMin"(%arg0, %arg1) : (i32, i32) -> i32
    %3 = "spirv.GL.UMin"(%arg0, %arg1) : (i32, i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "inversesqrt"}> ({
  ^bb0(%arg1: f32):
    %1 = "spirv.GL.InverseSqrt"(%arg1) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf16>) -> (), sym_name = "inversesqrtvec"}> ({
  ^bb0(%arg0: vector<3xf16>):
    %0 = "spirv.GL.InverseSqrt"(%arg0) : (vector<3xf16>) -> vector<3xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "sqrt"}> ({
  ^bb0(%arg27: f32):
    %25 = "spirv.GL.Sqrt"(%arg27) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf16>) -> (), sym_name = "sqrtvec"}> ({
  ^bb0(%arg26: vector<3xf16>):
    %24 = "spirv.GL.Sqrt"(%arg26) : (vector<3xf16>) -> vector<3xf16>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> (), sym_name = "cos"}> ({
  ^bb0(%arg25: f32):
    %23 = "spirv.GL.Cos"(%arg25) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf16>) -> (), sym_name = "cosvec"}> ({
  ^bb0(%arg24: vector<3xf16>):
    %22 = "spirv.GL.Cos"(%arg24) : (vector<3xf16>) -> vector<3xf16>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> (), sym_name = "sin"}> ({
  ^bb0(%arg23: f32):
    %21 = "spirv.GL.Sin"(%arg23) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf16>) -> (), sym_name = "sinvec"}> ({
  ^bb0(%arg22: vector<3xf16>):
    %20 = "spirv.GL.Sin"(%arg22) : (vector<3xf16>) -> vector<3xf16>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> (), sym_name = "tan"}> ({
  ^bb0(%arg21: f32):
    %19 = "spirv.GL.Tan"(%arg21) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf16>) -> (), sym_name = "tanvec"}> ({
  ^bb0(%arg20: vector<3xf16>):
    %18 = "spirv.GL.Tan"(%arg20) : (vector<3xf16>) -> vector<3xf16>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> (), sym_name = "acos"}> ({
  ^bb0(%arg19: f32):
    %17 = "spirv.GL.Acos"(%arg19) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf16>) -> (), sym_name = "acosvec"}> ({
  ^bb0(%arg18: vector<3xf16>):
    %16 = "spirv.GL.Acos"(%arg18) : (vector<3xf16>) -> vector<3xf16>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> (), sym_name = "asin"}> ({
  ^bb0(%arg17: f32):
    %15 = "spirv.GL.Asin"(%arg17) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf16>) -> (), sym_name = "asinvec"}> ({
  ^bb0(%arg16: vector<3xf16>):
    %14 = "spirv.GL.Asin"(%arg16) : (vector<3xf16>) -> vector<3xf16>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> (), sym_name = "atan"}> ({
  ^bb0(%arg15: f32):
    %13 = "spirv.GL.Atan"(%arg15) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf16>) -> (), sym_name = "atanvec"}> ({
  ^bb0(%arg14: vector<3xf16>):
    %12 = "spirv.GL.Atan"(%arg14) : (vector<3xf16>) -> vector<3xf16>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> (), sym_name = "sinh"}> ({
  ^bb0(%arg13: f32):
    %11 = "spirv.GL.Sinh"(%arg13) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf16>) -> (), sym_name = "sinhvec"}> ({
  ^bb0(%arg12: vector<3xf16>):
    %10 = "spirv.GL.Sinh"(%arg12) : (vector<3xf16>) -> vector<3xf16>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> (), sym_name = "cosh"}> ({
  ^bb0(%arg11: f32):
    %9 = "spirv.GL.Cosh"(%arg11) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf16>) -> (), sym_name = "coshvec"}> ({
  ^bb0(%arg10: vector<3xf16>):
    %8 = "spirv.GL.Cosh"(%arg10) : (vector<3xf16>) -> vector<3xf16>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> (), sym_name = "asinh"}> ({
  ^bb0(%arg9: f32):
    %7 = "spirv.GL.Asinh"(%arg9) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf16>) -> (), sym_name = "asinhvec"}> ({
  ^bb0(%arg8: vector<3xf16>):
    %6 = "spirv.GL.Asinh"(%arg8) : (vector<3xf16>) -> vector<3xf16>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> (), sym_name = "acosh"}> ({
  ^bb0(%arg7: f32):
    %5 = "spirv.GL.Acosh"(%arg7) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf16>) -> (), sym_name = "acoshvec"}> ({
  ^bb0(%arg6: vector<3xf16>):
    %4 = "spirv.GL.Acosh"(%arg6) : (vector<3xf16>) -> vector<3xf16>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> (), sym_name = "atanh"}> ({
  ^bb0(%arg5: f32):
    %3 = "spirv.GL.Atanh"(%arg5) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf16>) -> (), sym_name = "atanhvec"}> ({
  ^bb0(%arg4: vector<3xf16>):
    %2 = "spirv.GL.Atanh"(%arg4) : (vector<3xf16>) -> vector<3xf16>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, f32) -> (), sym_name = "atan2"}> ({
  ^bb0(%arg2: f32, %arg3: f32):
    %1 = "spirv.GL.Atan2"(%arg2, %arg3) : (f32, f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf16>, vector<3xf16>) -> (), sym_name = "atan2vec"}> ({
  ^bb0(%arg0: vector<3xf16>, %arg1: vector<3xf16>):
    %0 = "spirv.GL.Atan2"(%arg0, %arg1) : (vector<3xf16>, vector<3xf16>) -> vector<3xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32) -> (), sym_name = "pow"}> ({
  ^bb0(%arg2: f32, %arg3: f32):
    %1 = "spirv.GL.Pow"(%arg2, %arg3) : (f32, f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf16>, vector<3xf16>) -> (), sym_name = "powvec"}> ({
  ^bb0(%arg0: vector<3xf16>, %arg1: vector<3xf16>):
    %0 = "spirv.GL.Pow"(%arg0, %arg1) : (vector<3xf16>, vector<3xf16>) -> vector<3xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "round"}> ({
  ^bb0(%arg3: f32):
    %3 = "spirv.GL.Round"(%arg3) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf16>) -> (), sym_name = "roundvec"}> ({
  ^bb0(%arg2: vector<3xf16>):
    %2 = "spirv.GL.Round"(%arg2) : (vector<3xf16>) -> vector<3xf16>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> (), sym_name = "round_even"}> ({
  ^bb0(%arg1: f32):
    %1 = "spirv.GL.RoundEven"(%arg1) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf16>) -> (), sym_name = "round_even_vec"}> ({
  ^bb0(%arg0: vector<3xf16>):
    %0 = "spirv.GL.RoundEven"(%arg0) : (vector<3xf16>) -> vector<3xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "trunc"}> ({
  ^bb0(%arg1: f32):
    %1 = "spirv.GL.Trunc"(%arg1) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf16>) -> (), sym_name = "trunc_vec"}> ({
  ^bb0(%arg0: vector<3xf16>):
    %0 = "spirv.GL.Trunc"(%arg0) : (vector<3xf16>) -> vector<3xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32, f32) -> (), sym_name = "fclamp"}> ({
  ^bb0(%arg0: f32, %arg1: f32, %arg2: f32):
    %0 = "spirv.GL.FClamp"(%arg0, %arg1, %arg2) : (f32, f32, f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<3xf32>, vector<3xf32>, vector<3xf32>) -> (), sym_name = "fclamp"}> ({
  ^bb0(%arg0: vector<3xf32>, %arg1: vector<3xf32>, %arg2: vector<3xf32>):
    %0 = "spirv.GL.FClamp"(%arg0, %arg1, %arg2) : (vector<3xf32>, vector<3xf32>, vector<3xf32>) -> vector<3xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (ui32, ui32, ui32) -> (), sym_name = "uclamp"}> ({
  ^bb0(%arg0: ui32, %arg1: ui32, %arg2: ui32):
    %0 = "spirv.GL.UClamp"(%arg0, %arg1, %arg2) : (ui32, ui32, ui32) -> ui32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xi32>, vector<4xi32>, vector<4xi32>) -> (), sym_name = "uclamp"}> ({
  ^bb0(%arg0: vector<4xi32>, %arg1: vector<4xi32>, %arg2: vector<4xi32>):
    %0 = "spirv.GL.UClamp"(%arg0, %arg1, %arg2) : (vector<4xi32>, vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (si32, si32, si32) -> (), sym_name = "uclamp"}> ({
  ^bb0(%arg0: si32, %arg1: si32, %arg2: si32):
    %0 = "spirv.GL.UClamp"(%arg0, %arg1, %arg2) : (si32, si32, si32) -> si32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (si32, si32, si32) -> (), sym_name = "sclamp"}> ({
  ^bb0(%arg0: si32, %arg1: si32, %arg2: si32):
    %0 = "spirv.GL.SClamp"(%arg0, %arg1, %arg2) : (si32, si32, si32) -> si32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xsi32>, vector<4xsi32>, vector<4xsi32>) -> (), sym_name = "sclamp"}> ({
  ^bb0(%arg0: vector<4xsi32>, %arg1: vector<4xsi32>, %arg2: vector<4xsi32>):
    %0 = "spirv.GL.SClamp"(%arg0, %arg1, %arg2) : (vector<4xsi32>, vector<4xsi32>, vector<4xsi32>) -> vector<4xsi32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32, i32) -> (), sym_name = "sclamp"}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i32):
    %0 = "spirv.GL.SClamp"(%arg0, %arg1, %arg2) : (i32, i32, i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32, f32) -> (), sym_name = "fma"}> ({
  ^bb0(%arg0: f32, %arg1: f32, %arg2: f32):
    %0 = "spirv.GL.Fma"(%arg0, %arg1, %arg2) : (f32, f32, f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<3xf32>, vector<3xf32>, vector<3xf32>) -> (), sym_name = "fma"}> ({
  ^bb0(%arg0: vector<3xf32>, %arg1: vector<3xf32>, %arg2: vector<3xf32>):
    %0 = "spirv.GL.Fma"(%arg0, %arg1, %arg2) : (vector<3xf32>, vector<3xf32>, vector<3xf32>) -> vector<3xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "frexp_struct"}> ({
  ^bb0(%arg2: f32):
    %2 = "spirv.GL.FrexpStruct"(%arg2) : (f32) -> !spirv.struct<(f32, i32)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64) -> (), sym_name = "frexp_struct_64"}> ({
  ^bb0(%arg1: f64):
    %1 = "spirv.GL.FrexpStruct"(%arg1) : (f64) -> !spirv.struct<(f64, i32)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf32>) -> (), sym_name = "frexp_struct_vec"}> ({
  ^bb0(%arg0: vector<3xf32>):
    %0 = "spirv.GL.FrexpStruct"(%arg0) : (vector<3xf32>) -> !spirv.struct<(vector<3xf32>, vector<3xi32>)>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, i32) -> (), sym_name = "ldexp"}> ({
  ^bb0(%arg0: f32, %arg1: i32):
    %0 = "spirv.GL.Ldexp"(%arg0, %arg1) : (f32, i32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<3xf32>, vector<3xi32>) -> (), sym_name = "ldexp_vec"}> ({
  ^bb0(%arg0: vector<3xf32>, %arg1: vector<3xi32>):
    %0 = "spirv.GL.Ldexp"(%arg0, %arg1) : (vector<3xf32>, vector<3xi32>) -> vector<3xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32, f32) -> (), sym_name = "fmix"}> ({
  ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
    %1 = "spirv.GL.FMix"(%arg3, %arg4, %arg5) : (f32, f32, f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf32>, vector<3xf32>, vector<3xf32>) -> (), sym_name = "fmix_vector"}> ({
  ^bb0(%arg0: vector<3xf32>, %arg1: vector<3xf32>, %arg2: vector<3xf32>):
    %0 = "spirv.GL.FMix"(%arg0, %arg1, %arg2) : (vector<3xf32>, vector<3xf32>, vector<3xf32>) -> vector<3xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (), sym_name = "findimsb_scalar_i32"}> ({
  ^bb0(%arg3: i32):
    %3 = "spirv.GL.FindILsb"(%arg3) : (i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xi32>) -> (), sym_name = "findimsb_vector_i32"}> ({
  ^bb0(%arg2: vector<3xi32>):
    %2 = "spirv.GL.FindILsb"(%arg2) : (vector<3xi32>) -> vector<3xi32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16) -> (), sym_name = "findimsb_scalar_i16"}> ({
  ^bb0(%arg1: i16):
    %1 = "spirv.GL.FindILsb"(%arg1) : (i16) -> i16
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xi64>) -> (), sym_name = "findimsb_vector_i64"}> ({
  ^bb0(%arg0: vector<3xi64>):
    %0 = "spirv.GL.FindILsb"(%arg0) : (vector<3xi64>) -> vector<3xi64>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (), sym_name = "findsmsb_scalar"}> ({
  ^bb0(%arg1: i32):
    %1 = "spirv.GL.FindSMsb"(%arg1) : (i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xi32>) -> (), sym_name = "findsmsb_vector"}> ({
  ^bb0(%arg0: vector<3xi32>):
    %0 = "spirv.GL.FindSMsb"(%arg0) : (vector<3xi32>) -> vector<3xi32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (), sym_name = "findumsb"}> ({
  ^bb0(%arg1: i32):
    %1 = "spirv.GL.FindUMsb"(%arg1) : (i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xi32>) -> (), sym_name = "findumsb_vector"}> ({
  ^bb0(%arg0: vector<3xi32>):
    %0 = "spirv.GL.FindUMsb"(%arg0) : (vector<3xi32>) -> vector<3xi32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32) -> (), sym_name = "distance_scalar"}> ({
  ^bb0(%arg2: f32, %arg3: f32):
    %1 = "spirv.GL.Distance"(%arg2, %arg3) : (f32, f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf32>, vector<3xf32>) -> (), sym_name = "distance_vector"}> ({
  ^bb0(%arg0: vector<3xf32>, %arg1: vector<3xf32>):
    %0 = "spirv.GL.Distance"(%arg0, %arg1) : (vector<3xf32>, vector<3xf32>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<3xf32>, vector<3xf32>) -> (), sym_name = "cross"}> ({
  ^bb0(%arg0: vector<3xf32>, %arg1: vector<3xf32>):
    %0 = "spirv.GL.Cross"(%arg0, %arg1) : (vector<3xf32>, vector<3xf32>) -> vector<3xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "normalize_scalar"}> ({
  ^bb0(%arg1: f32):
    %1 = "spirv.GL.Normalize"(%arg1) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf32>) -> (), sym_name = "normalize_vector"}> ({
  ^bb0(%arg0: vector<3xf32>):
    %0 = "spirv.GL.Normalize"(%arg0) : (vector<3xf32>) -> vector<3xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32) -> (), sym_name = "reflect_scalar"}> ({
  ^bb0(%arg2: f32, %arg3: f32):
    %1 = "spirv.GL.Reflect"(%arg2, %arg3) : (f32, f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf32>, vector<3xf32>) -> (), sym_name = "reflect_vector"}> ({
  ^bb0(%arg0: vector<3xf32>, %arg1: vector<3xf32>):
    %0 = "spirv.GL.Reflect"(%arg0, %arg1) : (vector<3xf32>, vector<3xf32>) -> vector<3xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32) -> (), sym_name = "step_scalar"}> ({
  ^bb0(%arg2: f32, %arg3: f32):
    %1 = "spirv.GL.Step"(%arg2, %arg3) : (f32, f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf32>, vector<3xf32>) -> (), sym_name = "step_vector"}> ({
  ^bb0(%arg0: vector<3xf32>, %arg1: vector<3xf32>):
    %0 = "spirv.GL.Step"(%arg0, %arg1) : (vector<3xf32>, vector<3xf32>) -> vector<3xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32, f32) -> (), sym_name = "smoothstep_scalar"}> ({
  ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
    %1 = "spirv.GL.SmoothStep"(%arg3, %arg4, %arg5) : (f32, f32, f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf32>, vector<3xf32>, vector<3xf32>) -> (), sym_name = "smoothstep_vector"}> ({
  ^bb0(%arg0: vector<3xf32>, %arg1: vector<3xf32>, %arg2: vector<3xf32>):
    %0 = "spirv.GL.SmoothStep"(%arg0, %arg1, %arg2) : (vector<3xf32>, vector<3xf32>, vector<3xf32>) -> vector<3xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "fract"}> ({
  ^bb0(%arg1: f32):
    %1 = "spirv.GL.Fract"(%arg1) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf16>) -> (), sym_name = "fractvec"}> ({
  ^bb0(%arg0: vector<3xf16>):
    %0 = "spirv.GL.Fract"(%arg0) : (vector<3xf16>) -> vector<3xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "log2"}> ({
  ^bb0(%arg1: f32):
    %1 = "spirv.GL.Log2"(%arg1) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf16>) -> (), sym_name = "log2vec"}> ({
  ^bb0(%arg0: vector<3xf16>):
    %0 = "spirv.GL.Log2"(%arg0) : (vector<3xf16>) -> vector<3xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "tanh"}> ({
  ^bb0(%arg1: f32):
    %1 = "spirv.GL.Tanh"(%arg1) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf16>) -> (), sym_name = "tanhvec"}> ({
  ^bb0(%arg0: vector<3xf16>):
    %0 = "spirv.GL.Tanh"(%arg0) : (vector<3xf16>) -> vector<3xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "exp2"}> ({
  ^bb0(%arg1: f32):
    %1 = "spirv.GL.Exp2"(%arg1) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf16>) -> (), sym_name = "exp2vec"}> ({
  ^bb0(%arg0: vector<3xf16>):
    %0 = "spirv.GL.Exp2"(%arg0) : (vector<3xf16>) -> vector<3xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2xf32>) -> (), sym_name = "pack_half_2x16"}> ({
  ^bb0(%arg0: vector<2xf32>):
    %0 = "spirv.GL.PackHalf2x16"(%arg0) : (vector<2xf32>) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (), sym_name = "unpack_half_2x16"}> ({
  ^bb0(%arg0: i32):
    %0 = "spirv.GL.UnpackHalf2x16"(%arg0) : (i32) -> vector<2xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf32>) -> (), sym_name = "pack_snorm_4x8"}> ({
  ^bb0(%arg0: vector<4xf32>):
    %0 = "spirv.GL.PackSnorm4x8"(%arg0) : (vector<4xf32>) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (), sym_name = "unpack_snorm_4x8"}> ({
  ^bb0(%arg0: i32):
    %0 = "spirv.GL.UnpackSnorm4x8"(%arg0) : (i32) -> vector<4xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "length"}> ({
  ^bb0(%arg1: f32):
    %1 = "spirv.GL.Length"(%arg1) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf32>) -> (), sym_name = "lengthvec"}> ({
  ^bb0(%arg0: vector<3xf32>):
    %0 = "spirv.GL.Length"(%arg0) : (vector<3xf32>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "radians"}> ({
  ^bb0(%arg1: f32):
    %1 = "spirv.GL.Radians"(%arg1) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf16>) -> (), sym_name = "radiansvec"}> ({
  ^bb0(%arg0: vector<3xf16>):
    %0 = "spirv.GL.Radians"(%arg0) : (vector<3xf16>) -> vector<3xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "degrees"}> ({
  ^bb0(%arg1: f32):
    %1 = "spirv.GL.Degrees"(%arg1) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf16>) -> (), sym_name = "degreesvec"}> ({
  ^bb0(%arg0: vector<3xf16>):
    %0 = "spirv.GL.Degrees"(%arg0) : (vector<3xf16>) -> vector<3xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32) -> (), sym_name = "nmax"}> ({
  ^bb0(%arg2: f32, %arg3: f32):
    %1 = "spirv.GL.NMax"(%arg2, %arg3) : (f32, f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf16>, vector<3xf16>) -> (), sym_name = "nmaxvec"}> ({
  ^bb0(%arg0: vector<3xf16>, %arg1: vector<3xf16>):
    %0 = "spirv.GL.NMax"(%arg0, %arg1) : (vector<3xf16>, vector<3xf16>) -> vector<3xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32) -> (), sym_name = "nmin"}> ({
  ^bb0(%arg2: f32, %arg3: f32):
    %1 = "spirv.GL.NMin"(%arg2, %arg3) : (f32, f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf16>, vector<3xf16>) -> (), sym_name = "nminvec"}> ({
  ^bb0(%arg0: vector<3xf16>, %arg1: vector<3xf16>):
    %0 = "spirv.GL.NMin"(%arg0, %arg1) : (vector<3xf16>, vector<3xf16>) -> vector<3xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32, f32) -> (), sym_name = "nclamp"}> ({
  ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
    %1 = "spirv.GL.NClamp"(%arg3, %arg4, %arg5) : (f32, f32, f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf32>, vector<3xf32>, vector<3xf32>) -> (), sym_name = "nclampvec"}> ({
  ^bb0(%arg0: vector<3xf32>, %arg1: vector<3xf32>, %arg2: vector<3xf32>):
    %0 = "spirv.GL.NClamp"(%arg0, %arg1, %arg2) : (vector<3xf32>, vector<3xf32>, vector<3xf32>) -> vector<3xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

