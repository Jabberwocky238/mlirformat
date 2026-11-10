"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "exp"}> ({
  ^bb0(%arg1: f32):
    %1 = "spirv.CL.exp"(%arg1) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf16>) -> (), sym_name = "expvec"}> ({
  ^bb0(%arg0: vector<3xf16>):
    %0 = "spirv.CL.exp"(%arg0) : (vector<3xf16>) -> vector<3xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "exp2"}> ({
  ^bb0(%arg1: f32):
    %1 = "spirv.CL.exp2"(%arg1) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf16>) -> (), sym_name = "exp2vec"}> ({
  ^bb0(%arg0: vector<3xf16>):
    %0 = "spirv.CL.exp2"(%arg0) : (vector<3xf16>) -> vector<3xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "exp10"}> ({
  ^bb0(%arg1: f32):
    %1 = "spirv.CL.exp10"(%arg1) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf16>) -> (), sym_name = "exp10vec"}> ({
  ^bb0(%arg0: vector<3xf16>):
    %0 = "spirv.CL.exp10"(%arg0) : (vector<3xf16>) -> vector<3xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "log2"}> ({
  ^bb0(%arg1: f32):
    %1 = "spirv.CL.log2"(%arg1) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf16>) -> (), sym_name = "log2vec"}> ({
  ^bb0(%arg0: vector<3xf16>):
    %0 = "spirv.CL.log2"(%arg0) : (vector<3xf16>) -> vector<3xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "log10"}> ({
  ^bb0(%arg1: f32):
    %1 = "spirv.CL.log10"(%arg1) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf16>) -> (), sym_name = "log10vec"}> ({
  ^bb0(%arg0: vector<3xf16>):
    %0 = "spirv.CL.log10"(%arg0) : (vector<3xf16>) -> vector<3xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "fabs"}> ({
  ^bb0(%arg2: f32):
    %2 = "spirv.CL.fabs"(%arg2) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf16>) -> (), sym_name = "fabsvec"}> ({
  ^bb0(%arg1: vector<3xf16>):
    %1 = "spirv.CL.fabs"(%arg1) : (vector<3xf16>) -> vector<3xf16>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64) -> (), sym_name = "fabsf64"}> ({
  ^bb0(%arg0: f64):
    %0 = "spirv.CL.fabs"(%arg0) : (f64) -> f64
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (), sym_name = "sabs"}> ({
  ^bb0(%arg3: i32):
    %3 = "spirv.CL.s_abs"(%arg3) : (i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xi16>) -> (), sym_name = "sabsvec"}> ({
  ^bb0(%arg2: vector<3xi16>):
    %2 = "spirv.CL.s_abs"(%arg2) : (vector<3xi16>) -> vector<3xi16>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64) -> (), sym_name = "sabsi64"}> ({
  ^bb0(%arg1: i64):
    %1 = "spirv.CL.s_abs"(%arg1) : (i64) -> i64
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i8) -> (), sym_name = "sabsi8"}> ({
  ^bb0(%arg0: i8):
    %0 = "spirv.CL.s_abs"(%arg0) : (i8) -> i8
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (), sym_name = "clz"}> ({
  ^bb0(%arg1: i32):
    %1 = "spirv.CL.clz"(%arg1) : (i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xi16>) -> (), sym_name = "clzvec"}> ({
  ^bb0(%arg0: vector<3xi16>):
    %0 = "spirv.CL.clz"(%arg0) : (vector<3xi16>) -> vector<3xi16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32, f32) -> (), sym_name = "fma"}> ({
  ^bb0(%arg0: f32, %arg1: f32, %arg2: f32):
    %0 = "spirv.CL.fma"(%arg0, %arg1, %arg2) : (f32, f32, f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<3xf32>, vector<3xf32>, vector<3xf32>) -> (), sym_name = "fma"}> ({
  ^bb0(%arg0: vector<3xf32>, %arg1: vector<3xf32>, %arg2: vector<3xf32>):
    %0 = "spirv.CL.fma"(%arg0, %arg1, %arg2) : (vector<3xf32>, vector<3xf32>, vector<3xf32>) -> vector<3xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32, f32) -> (), sym_name = "mix"}> ({
  ^bb0(%arg0: f32, %arg1: f32, %arg2: f32):
    %0 = "spirv.CL.mix"(%arg0, %arg1, %arg2) : (f32, f32, f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<3xf32>, vector<3xf32>, vector<3xf32>) -> (), sym_name = "mix"}> ({
  ^bb0(%arg0: vector<3xf32>, %arg1: vector<3xf32>, %arg2: vector<3xf32>):
    %0 = "spirv.CL.mix"(%arg0, %arg1, %arg2) : (vector<3xf32>, vector<3xf32>, vector<3xf32>) -> vector<3xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32) -> (), sym_name = "fmaxmin"}> ({
  ^bb0(%arg6: f32, %arg7: f32):
    %8 = "spirv.CL.fmax"(%arg6, %arg7) : (f32, f32) -> f32
    %9 = "spirv.CL.fmin"(%arg6, %arg7) : (f32, f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf16>, vector<3xf16>) -> (), sym_name = "fmaxminvec"}> ({
  ^bb0(%arg4: vector<3xf16>, %arg5: vector<3xf16>):
    %6 = "spirv.CL.fmax"(%arg4, %arg5) : (vector<3xf16>, vector<3xf16>) -> vector<3xf16>
    %7 = "spirv.CL.fmin"(%arg4, %arg5) : (vector<3xf16>, vector<3xf16>) -> vector<3xf16>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64, f64) -> (), sym_name = "fmaxminf64"}> ({
  ^bb0(%arg2: f64, %arg3: f64):
    %4 = "spirv.CL.fmax"(%arg2, %arg3) : (f64, f64) -> f64
    %5 = "spirv.CL.fmin"(%arg2, %arg3) : (f64, f64) -> f64
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "iminmax"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "spirv.CL.s_max"(%arg0, %arg1) : (i32, i32) -> i32
    %1 = "spirv.CL.u_max"(%arg0, %arg1) : (i32, i32) -> i32
    %2 = "spirv.CL.s_min"(%arg0, %arg1) : (i32, i32) -> i32
    %3 = "spirv.CL.u_min"(%arg0, %arg1) : (i32, i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "rint"}> ({
  ^bb0(%arg1: f32):
    %1 = "spirv.CL.rint"(%arg1) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf16>) -> (), sym_name = "rintvec"}> ({
  ^bb0(%arg0: vector<3xf16>):
    %0 = "spirv.CL.rint"(%arg0) : (vector<3xf16>) -> vector<3xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "trunc"}> ({
  ^bb0(%arg1: f32):
    %1 = "spirv.CL.trunc"(%arg1) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf16>) -> (), sym_name = "truncvec"}> ({
  ^bb0(%arg0: vector<3xf16>):
    %0 = "spirv.CL.trunc"(%arg0) : (vector<3xf16>) -> vector<3xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.ptr<i8, UniformConstant>, i32, i32) -> i32, sym_name = "printf"}> ({
  ^bb0(%arg0: !spirv.ptr<i8, UniformConstant>, %arg1: i32, %arg2: i32):
    %0 = "spirv.CL.printf"(%arg0, %arg1, %arg2) : (!spirv.ptr<i8, UniformConstant>, i32, i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "tan"}> ({
  ^bb0(%arg0: f32):
    %0 = "spirv.CL.tan"(%arg0) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf16>) -> (), sym_name = "tan"}> ({
  ^bb0(%arg0: vector<4xf16>):
    %0 = "spirv.CL.tan"(%arg0) : (vector<4xf16>) -> vector<4xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "atan"}> ({
  ^bb0(%arg0: f32):
    %0 = "spirv.CL.atan"(%arg0) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf16>) -> (), sym_name = "atan"}> ({
  ^bb0(%arg0: vector<4xf16>):
    %0 = "spirv.CL.atan"(%arg0) : (vector<4xf16>) -> vector<4xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "atanh"}> ({
  ^bb0(%arg0: f32):
    %0 = "spirv.CL.atanh"(%arg0) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf16>) -> (), sym_name = "atanh"}> ({
  ^bb0(%arg0: vector<4xf16>):
    %0 = "spirv.CL.atanh"(%arg0) : (vector<4xf16>) -> vector<4xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "sinh"}> ({
  ^bb0(%arg0: f32):
    %0 = "spirv.CL.sinh"(%arg0) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf16>) -> (), sym_name = "sinh"}> ({
  ^bb0(%arg0: vector<4xf16>):
    %0 = "spirv.CL.sinh"(%arg0) : (vector<4xf16>) -> vector<4xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "cosh"}> ({
  ^bb0(%arg0: f32):
    %0 = "spirv.CL.cosh"(%arg0) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf16>) -> (), sym_name = "cosh"}> ({
  ^bb0(%arg0: vector<4xf16>):
    %0 = "spirv.CL.cosh"(%arg0) : (vector<4xf16>) -> vector<4xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "erfc"}> ({
  ^bb0(%arg0: f32):
    %0 = "spirv.CL.erfc"(%arg0) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf16>) -> (), sym_name = "erfc"}> ({
  ^bb0(%arg0: vector<4xf16>):
    %0 = "spirv.CL.erfc"(%arg0) : (vector<4xf16>) -> vector<4xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "asin"}> ({
  ^bb0(%arg0: f32):
    %0 = "spirv.CL.asin"(%arg0) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf16>) -> (), sym_name = "asin"}> ({
  ^bb0(%arg0: vector<4xf16>):
    %0 = "spirv.CL.asin"(%arg0) : (vector<4xf16>) -> vector<4xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "asinh"}> ({
  ^bb0(%arg0: f32):
    %0 = "spirv.CL.asinh"(%arg0) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf16>) -> (), sym_name = "asinh"}> ({
  ^bb0(%arg0: vector<4xf16>):
    %0 = "spirv.CL.asinh"(%arg0) : (vector<4xf16>) -> vector<4xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "acos"}> ({
  ^bb0(%arg0: f32):
    %0 = "spirv.CL.acos"(%arg0) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf16>) -> (), sym_name = "acos"}> ({
  ^bb0(%arg0: vector<4xf16>):
    %0 = "spirv.CL.acos"(%arg0) : (vector<4xf16>) -> vector<4xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "acosh"}> ({
  ^bb0(%arg0: f32):
    %0 = "spirv.CL.acosh"(%arg0) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf16>) -> (), sym_name = "acosh"}> ({
  ^bb0(%arg0: vector<4xf16>):
    %0 = "spirv.CL.acosh"(%arg0) : (vector<4xf16>) -> vector<4xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "cbrt"}> ({
  ^bb0(%arg0: f32):
    %0 = "spirv.CL.cbrt"(%arg0) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf16>) -> (), sym_name = "cbrt"}> ({
  ^bb0(%arg0: vector<4xf16>):
    %0 = "spirv.CL.cbrt"(%arg0) : (vector<4xf16>) -> vector<4xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32) -> (), sym_name = "atan2"}> ({
  ^bb0(%arg0: f32, %arg1: f32):
    %0 = "spirv.CL.atan2"(%arg0, %arg1) : (f32, f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf16>, vector<4xf16>) -> (), sym_name = "atan2"}> ({
  ^bb0(%arg0: vector<4xf16>, %arg1: vector<4xf16>):
    %0 = "spirv.CL.atan2"(%arg0, %arg1) : (vector<4xf16>, vector<4xf16>) -> vector<4xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, i32) -> (), sym_name = "ldexp"}> ({
  ^bb0(%arg0: f32, %arg1: i32):
    %0 = "spirv.CL.ldexp"(%arg0, %arg1) : (f32, i32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<3xf32>, vector<3xi32>) -> (), sym_name = "ldexp_vec"}> ({
  ^bb0(%arg0: vector<3xf32>, %arg1: vector<3xi32>):
    %0 = "spirv.CL.ldexp"(%arg0, %arg1) : (vector<3xf32>, vector<3xi32>) -> vector<3xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, i32) -> (), sym_name = "pown"}> ({
  ^bb0(%arg0: f32, %arg1: i32):
    %0 = "spirv.CL.pown"(%arg0, %arg1) : (f32, i32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<3xf32>, vector<3xi32>) -> (), sym_name = "pown_vec"}> ({
  ^bb0(%arg0: vector<3xf32>, %arg1: vector<3xi32>):
    %0 = "spirv.CL.pown"(%arg0, %arg1) : (vector<3xf32>, vector<3xi32>) -> vector<3xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, i32) -> (), sym_name = "rootn"}> ({
  ^bb0(%arg0: f32, %arg1: i32):
    %0 = "spirv.CL.rootn"(%arg0, %arg1) : (f32, i32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<3xf32>, vector<3xi32>) -> (), sym_name = "rootn_vec"}> ({
  ^bb0(%arg0: vector<3xf32>, %arg1: vector<3xi32>):
    %0 = "spirv.CL.rootn"(%arg0, %arg1) : (vector<3xf32>, vector<3xi32>) -> vector<3xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32) -> (), sym_name = "copysign"}> ({
  ^bb0(%arg0: f32, %arg1: f32):
    %0 = "spirv.CL.copysign"(%arg0, %arg1) : (f32, f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf16>, vector<4xf16>) -> (), sym_name = "copysign"}> ({
  ^bb0(%arg0: vector<4xf16>, %arg1: vector<4xf16>):
    %0 = "spirv.CL.copysign"(%arg0, %arg1) : (vector<4xf16>, vector<4xf16>) -> vector<4xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "expm1"}> ({
  ^bb0(%arg0: f32):
    %0 = "spirv.CL.expm1"(%arg0) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf16>) -> (), sym_name = "expm1"}> ({
  ^bb0(%arg0: vector<4xf16>):
    %0 = "spirv.CL.expm1"(%arg0) : (vector<4xf16>) -> vector<4xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32) -> (), sym_name = "fdim"}> ({
  ^bb0(%arg0: f32, %arg1: f32):
    %0 = "spirv.CL.fdim"(%arg0, %arg1) : (f32, f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf16>, vector<4xf16>) -> (), sym_name = "fdim"}> ({
  ^bb0(%arg0: vector<4xf16>, %arg1: vector<4xf16>):
    %0 = "spirv.CL.fdim"(%arg0, %arg1) : (vector<4xf16>, vector<4xf16>) -> vector<4xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32) -> (), sym_name = "fmod"}> ({
  ^bb0(%arg0: f32, %arg1: f32):
    %0 = "spirv.CL.fmod"(%arg0, %arg1) : (f32, f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf16>, vector<4xf16>) -> (), sym_name = "fmod"}> ({
  ^bb0(%arg0: vector<4xf16>, %arg1: vector<4xf16>):
    %0 = "spirv.CL.fmod"(%arg0, %arg1) : (vector<4xf16>, vector<4xf16>) -> vector<4xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32) -> (), sym_name = "hypot"}> ({
  ^bb0(%arg0: f32, %arg1: f32):
    %0 = "spirv.CL.hypot"(%arg0, %arg1) : (f32, f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf16>, vector<4xf16>) -> (), sym_name = "hypot"}> ({
  ^bb0(%arg0: vector<4xf16>, %arg1: vector<4xf16>):
    %0 = "spirv.CL.hypot"(%arg0, %arg1) : (vector<4xf16>, vector<4xf16>) -> vector<4xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "log1p"}> ({
  ^bb0(%arg0: f32):
    %0 = "spirv.CL.log1p"(%arg0) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf16>) -> (), sym_name = "log1p"}> ({
  ^bb0(%arg0: vector<4xf16>):
    %0 = "spirv.CL.log1p"(%arg0) : (vector<4xf16>) -> vector<4xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

