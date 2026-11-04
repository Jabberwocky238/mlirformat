"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<OpenCL>, vce_triple = #spirv.vce<v1.0, [Kernel, Linkage], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32, i32) -> (), sym_name = "iequal_scalar"}> ({
    ^bb0(%arg20: i32, %arg21: i32):
      %26 = "spirv.IEqual"(%arg20, %arg21) : (i32, i32) -> i1
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi32>, vector<4xi32>) -> (), sym_name = "inotequal_vector"}> ({
    ^bb0(%arg18: vector<4xi32>, %arg19: vector<4xi32>):
      %25 = "spirv.INotEqual"(%arg18, %arg19) : (vector<4xi32>, vector<4xi32>) -> vector<4xi1>
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi32>, vector<4xi32>) -> (), sym_name = "sgt_vector"}> ({
    ^bb0(%arg16: vector<4xi32>, %arg17: vector<4xi32>):
      %24 = "spirv.SGreaterThan"(%arg16, %arg17) : (vector<4xi32>, vector<4xi32>) -> vector<4xi1>
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi32>, vector<4xi32>) -> (), sym_name = "sge_vector"}> ({
    ^bb0(%arg14: vector<4xi32>, %arg15: vector<4xi32>):
      %23 = "spirv.SGreaterThanEqual"(%arg14, %arg15) : (vector<4xi32>, vector<4xi32>) -> vector<4xi1>
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi32>, vector<4xi32>) -> (), sym_name = "slt_vector"}> ({
    ^bb0(%arg12: vector<4xi32>, %arg13: vector<4xi32>):
      %22 = "spirv.SLessThan"(%arg12, %arg13) : (vector<4xi32>, vector<4xi32>) -> vector<4xi1>
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi32>, vector<4xi32>) -> (), sym_name = "slte_vector"}> ({
    ^bb0(%arg10: vector<4xi32>, %arg11: vector<4xi32>):
      %21 = "spirv.SLessThanEqual"(%arg10, %arg11) : (vector<4xi32>, vector<4xi32>) -> vector<4xi1>
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi32>, vector<4xi32>) -> (), sym_name = "ugt_vector"}> ({
    ^bb0(%arg8: vector<4xi32>, %arg9: vector<4xi32>):
      %20 = "spirv.UGreaterThan"(%arg8, %arg9) : (vector<4xi32>, vector<4xi32>) -> vector<4xi1>
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi32>, vector<4xi32>) -> (), sym_name = "ugte_vector"}> ({
    ^bb0(%arg6: vector<4xi32>, %arg7: vector<4xi32>):
      %19 = "spirv.UGreaterThanEqual"(%arg6, %arg7) : (vector<4xi32>, vector<4xi32>) -> vector<4xi1>
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi32>, vector<4xi32>) -> (), sym_name = "ult_vector"}> ({
    ^bb0(%arg4: vector<4xi32>, %arg5: vector<4xi32>):
      %18 = "spirv.ULessThan"(%arg4, %arg5) : (vector<4xi32>, vector<4xi32>) -> vector<4xi1>
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi32>, vector<4xi32>) -> (), sym_name = "ulte_vector"}> ({
    ^bb0(%arg2: vector<4xi32>, %arg3: vector<4xi32>):
      %17 = "spirv.ULessThanEqual"(%arg2, %arg3) : (vector<4xi32>, vector<4xi32>) -> vector<4xi1>
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32, f32) -> (), sym_name = "cmpf"}> ({
    ^bb0(%arg0: f32, %arg1: f32):
      %0 = "spirv.FOrdEqual"(%arg0, %arg1) : (f32, f32) -> i1
      %1 = "spirv.FOrdGreaterThan"(%arg0, %arg1) : (f32, f32) -> i1
      %2 = "spirv.FOrdGreaterThanEqual"(%arg0, %arg1) : (f32, f32) -> i1
      %3 = "spirv.FOrdLessThan"(%arg0, %arg1) : (f32, f32) -> i1
      %4 = "spirv.FOrdLessThanEqual"(%arg0, %arg1) : (f32, f32) -> i1
      %5 = "spirv.FOrdNotEqual"(%arg0, %arg1) : (f32, f32) -> i1
      %6 = "spirv.FUnordEqual"(%arg0, %arg1) : (f32, f32) -> i1
      %7 = "spirv.FUnordGreaterThan"(%arg0, %arg1) : (f32, f32) -> i1
      %8 = "spirv.FUnordGreaterThanEqual"(%arg0, %arg1) : (f32, f32) -> i1
      %9 = "spirv.FUnordLessThan"(%arg0, %arg1) : (f32, f32) -> i1
      %10 = "spirv.FUnordLessThanEqual"(%arg0, %arg1) : (f32, f32) -> i1
      %11 = "spirv.FUnordNotEqual"(%arg0, %arg1) : (f32, f32) -> i1
      %12 = "spirv.Ordered"(%arg0, %arg1) : (f32, f32) -> i1
      %13 = "spirv.Unordered"(%arg0, %arg1) : (f32, f32) -> i1
      %14 = "spirv.IsNan"(%arg0) : (f32) -> i1
      %15 = "spirv.IsInf"(%arg1) : (f32) -> i1
      %16 = "spirv.IsFinite"(%arg0) : (f32) -> i1
      "spirv.Return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.4, [Shader, Linkage], []>}> ({
    "spirv.SpecConstant"() <{default_value = true, sym_name = "condition_scalar"}> : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "select"}> ({
      %0 = "spirv.Constant"() <{value = 4.000000e+00 : f32}> : () -> f32
      %1 = "spirv.Constant"() <{value = 5.000000e+00 : f32}> : () -> f32
      %2 = "spirv.mlir.referenceof"() <{spec_const = @condition_scalar}> : () -> i1
      %3 = "spirv.Select"(%2, %0, %1) : (i1, f32, f32) -> f32
      %4 = "spirv.Constant"() <{value = dense<[2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00]> : vector<4xf32>}> : () -> vector<4xf32>
      %5 = "spirv.Constant"() <{value = dense<[6.000000e+00, 7.000000e+00, 8.000000e+00, 9.000000e+00]> : vector<4xf32>}> : () -> vector<4xf32>
      %6 = "spirv.Select"(%2, %4, %5) : (i1, vector<4xf32>, vector<4xf32>) -> vector<4xf32>
      %7 = "spirv.Constant"() <{value = dense<true> : vector<4xi1>}> : () -> vector<4xi1>
      %8 = "spirv.Select"(%7, %4, %5) : (vector<4xi1>, vector<4xf32>, vector<4xf32>) -> vector<4xf32>
      "spirv.Return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.4, [Shader, Linkage, BFloat16TypeKHR], [SPV_KHR_bfloat16]>}> ({
    "spirv.SpecConstant"() <{default_value = true, sym_name = "condition_scalar"}> : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "select_bf16"}> ({
      %0 = "spirv.Constant"() <{value = 4.000000e+00 : bf16}> : () -> bf16
      %1 = "spirv.Constant"() <{value = 5.000000e+00 : bf16}> : () -> bf16
      %2 = "spirv.mlir.referenceof"() <{spec_const = @condition_scalar}> : () -> i1
      %3 = "spirv.Select"(%2, %0, %1) : (i1, bf16, bf16) -> bf16
      %4 = "spirv.Constant"() <{value = dense<[2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00]> : vector<4xbf16>}> : () -> vector<4xbf16>
      %5 = "spirv.Constant"() <{value = dense<[6.000000e+00, 7.000000e+00, 8.000000e+00, 9.000000e+00]> : vector<4xbf16>}> : () -> vector<4xbf16>
      %6 = "spirv.Select"(%2, %4, %5) : (i1, vector<4xbf16>, vector<4xbf16>) -> vector<4xbf16>
      %7 = "spirv.Constant"() <{value = dense<true> : vector<4xi1>}> : () -> vector<4xi1>
      %8 = "spirv.Select"(%7, %4, %5) : (vector<4xi1>, vector<4xbf16>, vector<4xbf16>) -> vector<4xbf16>
      "spirv.Return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

