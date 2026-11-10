"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage, Bfloat16ConversionINTEL, Int16], [SPV_INTEL_bfloat16_conversion]>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> (), sym_name = "f32_to_bf16"}> ({
    ^bb0(%arg3: f32):
      %3 = "spirv.INTEL.ConvertFToBF16"(%arg3) : (f32) -> i16
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<2xf32>) -> (), sym_name = "f32_to_bf16_vec"}> ({
    ^bb0(%arg2: vector<2xf32>):
      %2 = "spirv.INTEL.ConvertFToBF16"(%arg2) : (vector<2xf32>) -> vector<2xi16>
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i16) -> (), sym_name = "bf16_to_f32"}> ({
    ^bb0(%arg1: i16):
      %1 = "spirv.INTEL.ConvertBF16ToF"(%arg1) : (i16) -> f32
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<2xi16>) -> (), sym_name = "bf16_to_f32_vec"}> ({
    ^bb0(%arg0: vector<2xi16>):
      %0 = "spirv.INTEL.ConvertBF16ToF"(%arg0) : (vector<2xi16>) -> vector<2xf32>
      "spirv.Return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage, TensorFloat32RoundingINTEL], [SPV_INTEL_tensor_float32_conversion]>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> (), sym_name = "f32_to_tf32"}> ({
    ^bb0(%arg1: f32):
      %1 = "spirv.INTEL.RoundFToTF32"(%arg1) : (f32) -> f32
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<2xf32>) -> (), sym_name = "f32_to_tf32_vec"}> ({
    ^bb0(%arg0: vector<2xf32>):
      %0 = "spirv.INTEL.RoundFToTF32"(%arg0) : (vector<2xf32>) -> vector<2xf32>
      "spirv.Return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Physical64>, memory_model = #spirv.memory_model<OpenCL>, vce_triple = #spirv.vce<v1.0, [Kernel, Addresses, Linkage, MaskedGatherScatterINTEL], [SPV_INTEL_masked_gather_scatter]>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4x!spirv.ptr<f32, CrossWorkgroup>>, i32, vector<4xi1>, vector<4xf32>) -> (), sym_name = "masked_gather_f32"}> ({
    ^bb0(%arg12: vector<4x!spirv.ptr<f32, CrossWorkgroup>>, %arg13: i32, %arg14: vector<4xi1>, %arg15: vector<4xf32>):
      %1 = "spirv.INTEL.MaskedGather"(%arg12, %arg13, %arg14, %arg15) : (vector<4x!spirv.ptr<f32, CrossWorkgroup>>, i32, vector<4xi1>, vector<4xf32>) -> vector<4xf32>
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4x!spirv.ptr<i32, CrossWorkgroup>>, i32, vector<4xi1>, vector<4xi32>) -> (), sym_name = "masked_gather_i32"}> ({
    ^bb0(%arg8: vector<4x!spirv.ptr<i32, CrossWorkgroup>>, %arg9: i32, %arg10: vector<4xi1>, %arg11: vector<4xi32>):
      %0 = "spirv.INTEL.MaskedGather"(%arg8, %arg9, %arg10, %arg11) : (vector<4x!spirv.ptr<i32, CrossWorkgroup>>, i32, vector<4xi1>, vector<4xi32>) -> vector<4xi32>
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4x!spirv.ptr<f32, CrossWorkgroup>>, i32, vector<4xi1>, vector<4xf32>) -> (), sym_name = "masked_scatter_f32"}> ({
    ^bb0(%arg4: vector<4x!spirv.ptr<f32, CrossWorkgroup>>, %arg5: i32, %arg6: vector<4xi1>, %arg7: vector<4xf32>):
      "spirv.INTEL.MaskedScatter"(%arg4, %arg5, %arg6, %arg7) : (vector<4x!spirv.ptr<f32, CrossWorkgroup>>, i32, vector<4xi1>, vector<4xf32>) -> ()
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4x!spirv.ptr<i32, CrossWorkgroup>>, i32, vector<4xi1>, vector<4xi32>) -> (), sym_name = "masked_scatter_i32"}> ({
    ^bb0(%arg0: vector<4x!spirv.ptr<i32, CrossWorkgroup>>, %arg1: i32, %arg2: vector<4xi1>, %arg3: vector<4xi32>):
      "spirv.INTEL.MaskedScatter"(%arg0, %arg1, %arg2, %arg3) : (vector<4x!spirv.ptr<i32, CrossWorkgroup>>, i32, vector<4xi1>, vector<4xi32>) -> ()
      "spirv.Return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage, SplitBarrierINTEL], [SPV_INTEL_split_barrier]>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "split_barrier"}> ({
      "spirv.INTEL.ControlBarrierArrive"() <{execution_scope = #spirv.scope<Workgroup>, memory_scope = #spirv.scope<Device>, memory_semantics = #spirv.memory_semantics<Acquire|UniformMemory>}> : () -> ()
      "spirv.INTEL.ControlBarrierWait"() <{execution_scope = #spirv.scope<Workgroup>, memory_scope = #spirv.scope<Device>, memory_semantics = #spirv.memory_semantics<Acquire|UniformMemory>}> : () -> ()
      "spirv.Return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

