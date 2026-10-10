"builtin.module"() ({
  "func.func"() <{function_type = (f32, vector<4xf32>) -> (f32, vector<4xf32>), sym_name = "pow_noop"}> ({
  ^bb0(%arg40: f32, %arg41: vector<4xf32>):
    %104 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %105 = "arith.constant"() <{value = dense<1.000000e+00> : vector<4xf32>}> : () -> vector<4xf32>
    %106 = "math.powf"(%arg40, %104) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %107 = "math.powf"(%arg41, %105) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    "func.return"(%106, %107) : (f32, vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<4xf32>) -> (f32, vector<4xf32>), sym_name = "pow_square"}> ({
  ^bb0(%arg38: f32, %arg39: vector<4xf32>):
    %100 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %101 = "arith.constant"() <{value = dense<2.000000e+00> : vector<4xf32>}> : () -> vector<4xf32>
    %102 = "math.powf"(%arg38, %100) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %103 = "math.powf"(%arg39, %101) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    "func.return"(%102, %103) : (f32, vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<4xf32>) -> (f32, vector<4xf32>), sym_name = "pow_square_fast"}> ({
  ^bb0(%arg36: f32, %arg37: vector<4xf32>):
    %96 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %97 = "arith.constant"() <{value = dense<2.000000e+00> : vector<4xf32>}> : () -> vector<4xf32>
    %98 = "math.powf"(%arg36, %96) <{fastmath = #arith.fastmath<fast>}> : (f32, f32) -> f32
    %99 = "math.powf"(%arg37, %97) <{fastmath = #arith.fastmath<fast>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    "func.return"(%98, %99) : (f32, vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<4xf32>) -> (f32, vector<4xf32>), sym_name = "pow_cube"}> ({
  ^bb0(%arg34: f32, %arg35: vector<4xf32>):
    %92 = "arith.constant"() <{value = 3.000000e+00 : f32}> : () -> f32
    %93 = "arith.constant"() <{value = dense<3.000000e+00> : vector<4xf32>}> : () -> vector<4xf32>
    %94 = "math.powf"(%arg34, %92) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %95 = "math.powf"(%arg35, %93) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    "func.return"(%94, %95) : (f32, vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<4xf32>) -> (f32, vector<4xf32>), sym_name = "pow_cube_fast"}> ({
  ^bb0(%arg32: f32, %arg33: vector<4xf32>):
    %88 = "arith.constant"() <{value = 3.000000e+00 : f32}> : () -> f32
    %89 = "arith.constant"() <{value = dense<3.000000e+00> : vector<4xf32>}> : () -> vector<4xf32>
    %90 = "math.powf"(%arg32, %88) <{fastmath = #arith.fastmath<fast>}> : (f32, f32) -> f32
    %91 = "math.powf"(%arg33, %89) <{fastmath = #arith.fastmath<fast>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    "func.return"(%90, %91) : (f32, vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<4xf32>) -> (f32, vector<4xf32>), sym_name = "pow_recip"}> ({
  ^bb0(%arg30: f32, %arg31: vector<4xf32>):
    %84 = "arith.constant"() <{value = -1.000000e+00 : f32}> : () -> f32
    %85 = "arith.constant"() <{value = dense<-1.000000e+00> : vector<4xf32>}> : () -> vector<4xf32>
    %86 = "math.powf"(%arg30, %84) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %87 = "math.powf"(%arg31, %85) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    "func.return"(%86, %87) : (f32, vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<4xf32>) -> (f32, vector<4xf32>), sym_name = "pow_recip_fast"}> ({
  ^bb0(%arg28: f32, %arg29: vector<4xf32>):
    %80 = "arith.constant"() <{value = -1.000000e+00 : f32}> : () -> f32
    %81 = "arith.constant"() <{value = dense<-1.000000e+00> : vector<4xf32>}> : () -> vector<4xf32>
    %82 = "math.powf"(%arg28, %80) <{fastmath = #arith.fastmath<fast>}> : (f32, f32) -> f32
    %83 = "math.powf"(%arg29, %81) <{fastmath = #arith.fastmath<fast>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    "func.return"(%82, %83) : (f32, vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<4xf32>) -> (f32, vector<4xf32>), sym_name = "pow_sqrt"}> ({
  ^bb0(%arg26: f32, %arg27: vector<4xf32>):
    %76 = "arith.constant"() <{value = 5.000000e-01 : f32}> : () -> f32
    %77 = "arith.constant"() <{value = dense<5.000000e-01> : vector<4xf32>}> : () -> vector<4xf32>
    %78 = "math.powf"(%arg26, %76) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %79 = "math.powf"(%arg27, %77) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    "func.return"(%78, %79) : (f32, vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<4xf32>) -> (f32, vector<4xf32>), sym_name = "pow_sqrt_fast"}> ({
  ^bb0(%arg24: f32, %arg25: vector<4xf32>):
    %72 = "arith.constant"() <{value = 5.000000e-01 : f32}> : () -> f32
    %73 = "arith.constant"() <{value = dense<5.000000e-01> : vector<4xf32>}> : () -> vector<4xf32>
    %74 = "math.powf"(%arg24, %72) <{fastmath = #arith.fastmath<fast>}> : (f32, f32) -> f32
    %75 = "math.powf"(%arg25, %73) <{fastmath = #arith.fastmath<fast>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    "func.return"(%74, %75) : (f32, vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<4xf32>) -> (f32, vector<4xf32>), sym_name = "pow_rsqrt"}> ({
  ^bb0(%arg22: f32, %arg23: vector<4xf32>):
    %68 = "arith.constant"() <{value = -5.000000e-01 : f32}> : () -> f32
    %69 = "arith.constant"() <{value = dense<-5.000000e-01> : vector<4xf32>}> : () -> vector<4xf32>
    %70 = "math.powf"(%arg22, %68) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %71 = "math.powf"(%arg23, %69) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    "func.return"(%70, %71) : (f32, vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<4xf32>) -> (f32, vector<4xf32>), sym_name = "pow_rsqrt_fast"}> ({
  ^bb0(%arg20: f32, %arg21: vector<4xf32>):
    %64 = "arith.constant"() <{value = -5.000000e-01 : f32}> : () -> f32
    %65 = "arith.constant"() <{value = dense<-5.000000e-01> : vector<4xf32>}> : () -> vector<4xf32>
    %66 = "math.powf"(%arg20, %64) <{fastmath = #arith.fastmath<fast>}> : (f32, f32) -> f32
    %67 = "math.powf"(%arg21, %65) <{fastmath = #arith.fastmath<fast>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    "func.return"(%66, %67) : (f32, vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<4xf32>) -> (f32, vector<4xf32>), sym_name = "pow_0_75"}> ({
  ^bb0(%arg18: f32, %arg19: vector<4xf32>):
    %60 = "arith.constant"() <{value = 7.500000e-01 : f32}> : () -> f32
    %61 = "arith.constant"() <{value = dense<7.500000e-01> : vector<4xf32>}> : () -> vector<4xf32>
    %62 = "math.powf"(%arg18, %60) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %63 = "math.powf"(%arg19, %61) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    "func.return"(%62, %63) : (f32, vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<4xf32>) -> (f32, vector<4xf32>), sym_name = "pow_0_75_fast"}> ({
  ^bb0(%arg16: f32, %arg17: vector<4xf32>):
    %56 = "arith.constant"() <{value = 7.500000e-01 : f32}> : () -> f32
    %57 = "arith.constant"() <{value = dense<7.500000e-01> : vector<4xf32>}> : () -> vector<4xf32>
    %58 = "math.powf"(%arg16, %56) <{fastmath = #arith.fastmath<fast>}> : (f32, f32) -> f32
    %59 = "math.powf"(%arg17, %57) <{fastmath = #arith.fastmath<fast>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    "func.return"(%58, %59) : (f32, vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, vector<4xi32>) -> (i32, vector<4xi32>), sym_name = "ipowi_zero_exp"}> ({
  ^bb0(%arg14: i32, %arg15: vector<4xi32>):
    %52 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %53 = "arith.constant"() <{value = dense<0> : vector<4xi32>}> : () -> vector<4xi32>
    %54 = "math.ipowi"(%arg14, %52) : (i32, i32) -> i32
    %55 = "math.ipowi"(%arg15, %53) : (vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    "func.return"(%54, %55) : (i32, vector<4xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, vector<4xi32>) -> (i32, vector<4xi32>, i32, vector<4xi32>), sym_name = "ipowi_exp_one"}> ({
  ^bb0(%arg12: i32, %arg13: vector<4xi32>):
    %44 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %45 = "arith.constant"() <{value = dense<1> : vector<4xi32>}> : () -> vector<4xi32>
    %46 = "math.ipowi"(%arg12, %44) : (i32, i32) -> i32
    %47 = "math.ipowi"(%arg13, %45) : (vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    %48 = "arith.constant"() <{value = -1 : i32}> : () -> i32
    %49 = "arith.constant"() <{value = dense<-1> : vector<4xi32>}> : () -> vector<4xi32>
    %50 = "math.ipowi"(%arg12, %48) : (i32, i32) -> i32
    %51 = "math.ipowi"(%arg13, %49) : (vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    "func.return"(%46, %47, %50, %51) : (i32, vector<4xi32>, i32, vector<4xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, vector<4xi32>) -> (i32, vector<4xi32>, i32, vector<4xi32>), sym_name = "ipowi_exp_two"}> ({
  ^bb0(%arg10: i32, %arg11: vector<4xi32>):
    %36 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %37 = "arith.constant"() <{value = dense<2> : vector<4xi32>}> : () -> vector<4xi32>
    %38 = "math.ipowi"(%arg10, %36) : (i32, i32) -> i32
    %39 = "math.ipowi"(%arg11, %37) : (vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    %40 = "arith.constant"() <{value = -2 : i32}> : () -> i32
    %41 = "arith.constant"() <{value = dense<-2> : vector<4xi32>}> : () -> vector<4xi32>
    %42 = "math.ipowi"(%arg10, %40) : (i32, i32) -> i32
    %43 = "math.ipowi"(%arg11, %41) : (vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    "func.return"(%38, %39, %42, %43) : (i32, vector<4xi32>, i32, vector<4xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, vector<4xi32>) -> (i32, vector<4xi32>, i32, vector<4xi32>), sym_name = "ipowi_exp_three"}> ({
  ^bb0(%arg8: i32, %arg9: vector<4xi32>):
    %28 = "arith.constant"() <{value = 3 : i32}> : () -> i32
    %29 = "arith.constant"() <{value = dense<3> : vector<4xi32>}> : () -> vector<4xi32>
    %30 = "math.ipowi"(%arg8, %28) : (i32, i32) -> i32
    %31 = "math.ipowi"(%arg9, %29) : (vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    %32 = "arith.constant"() <{value = -3 : i32}> : () -> i32
    %33 = "arith.constant"() <{value = dense<-3> : vector<4xi32>}> : () -> vector<4xi32>
    %34 = "math.ipowi"(%arg8, %32) : (i32, i32) -> i32
    %35 = "math.ipowi"(%arg9, %33) : (vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    "func.return"(%30, %31, %34, %35) : (i32, vector<4xi32>, i32, vector<4xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<4xf32>) -> (f32, vector<4xf32>), sym_name = "fpowi_zero_exp"}> ({
  ^bb0(%arg6: f32, %arg7: vector<4xf32>):
    %24 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %25 = "arith.constant"() <{value = dense<0> : vector<4xi32>}> : () -> vector<4xi32>
    %26 = "math.fpowi"(%arg6, %24) <{fastmath = #arith.fastmath<none>}> : (f32, i32) -> f32
    %27 = "math.fpowi"(%arg7, %25) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>, vector<4xi32>) -> vector<4xf32>
    "func.return"(%26, %27) : (f32, vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<4xf32>) -> (f32, vector<4xf32>, f32, vector<4xf32>), sym_name = "fpowi_exp_one"}> ({
  ^bb0(%arg4: f32, %arg5: vector<4xf32>):
    %16 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %17 = "arith.constant"() <{value = dense<1> : vector<4xi32>}> : () -> vector<4xi32>
    %18 = "math.fpowi"(%arg4, %16) <{fastmath = #arith.fastmath<none>}> : (f32, i32) -> f32
    %19 = "math.fpowi"(%arg5, %17) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>, vector<4xi32>) -> vector<4xf32>
    %20 = "arith.constant"() <{value = -1 : i32}> : () -> i32
    %21 = "arith.constant"() <{value = dense<-1> : vector<4xi32>}> : () -> vector<4xi32>
    %22 = "math.fpowi"(%arg4, %20) <{fastmath = #arith.fastmath<none>}> : (f32, i32) -> f32
    %23 = "math.fpowi"(%arg5, %21) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>, vector<4xi32>) -> vector<4xf32>
    "func.return"(%18, %19, %22, %23) : (f32, vector<4xf32>, f32, vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<4xf32>) -> (f32, vector<4xf32>, f32, vector<4xf32>), sym_name = "fpowi_exp_two"}> ({
  ^bb0(%arg2: f32, %arg3: vector<4xf32>):
    %8 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %9 = "arith.constant"() <{value = dense<2> : vector<4xi32>}> : () -> vector<4xi32>
    %10 = "math.fpowi"(%arg2, %8) <{fastmath = #arith.fastmath<none>}> : (f32, i32) -> f32
    %11 = "math.fpowi"(%arg3, %9) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>, vector<4xi32>) -> vector<4xf32>
    %12 = "arith.constant"() <{value = -2 : i32}> : () -> i32
    %13 = "arith.constant"() <{value = dense<-2> : vector<4xi32>}> : () -> vector<4xi32>
    %14 = "math.fpowi"(%arg2, %12) <{fastmath = #arith.fastmath<none>}> : (f32, i32) -> f32
    %15 = "math.fpowi"(%arg3, %13) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>, vector<4xi32>) -> vector<4xf32>
    "func.return"(%10, %11, %14, %15) : (f32, vector<4xf32>, f32, vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<4xf32>) -> (f32, vector<4xf32>, f32, vector<4xf32>), sym_name = "fpowi_exp_three"}> ({
  ^bb0(%arg0: f32, %arg1: vector<4xf32>):
    %0 = "arith.constant"() <{value = 3 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = dense<3> : vector<4xi32>}> : () -> vector<4xi32>
    %2 = "math.fpowi"(%arg0, %0) <{fastmath = #arith.fastmath<none>}> : (f32, i32) -> f32
    %3 = "math.fpowi"(%arg1, %1) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>, vector<4xi32>) -> vector<4xf32>
    %4 = "arith.constant"() <{value = -3 : i32}> : () -> i32
    %5 = "arith.constant"() <{value = dense<-3> : vector<4xi32>}> : () -> vector<4xi32>
    %6 = "math.fpowi"(%arg0, %4) <{fastmath = #arith.fastmath<none>}> : (f32, i32) -> f32
    %7 = "math.fpowi"(%arg1, %5) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>, vector<4xi32>) -> vector<4xf32>
    "func.return"(%2, %3, %6, %7) : (f32, vector<4xf32>, f32, vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

