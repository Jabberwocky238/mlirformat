"builtin.module"() ({
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> (), sym_name = "f32_to_bf16"}> ({
  ^bb0(%arg0: f32):
    %0 = "spirv.INTEL.ConvertFToBF16"(%arg0) : (f32) -> i16
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<2xf32>) -> (), sym_name = "f32_to_bf16_vec"}> ({
  ^bb0(%arg0: vector<2xf32>):
    %0 = "spirv.INTEL.ConvertFToBF16"(%arg0) : (vector<2xf32>) -> vector<2xi16>
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i16) -> (), sym_name = "bf16_to_f32"}> ({
  ^bb0(%arg0: i16):
    %0 = "spirv.INTEL.ConvertBF16ToF"(%arg0) : (i16) -> f32
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<2xi16>) -> (), sym_name = "bf16_to_f32_vec"}> ({
  ^bb0(%arg0: vector<2xi16>):
    %0 = "spirv.INTEL.ConvertBF16ToF"(%arg0) : (vector<2xi16>) -> vector<2xf32>
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> (), sym_name = "f32_to_tf32"}> ({
  ^bb0(%arg0: f32):
    %0 = "spirv.INTEL.RoundFToTF32"(%arg0) : (f32) -> f32
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<2xf32>) -> (), sym_name = "f32_to_tf32_vec"}> ({
  ^bb0(%arg0: vector<2xf32>):
    %0 = "spirv.INTEL.RoundFToTF32"(%arg0) : (vector<2xf32>) -> vector<2xf32>
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "split_barrier"}> ({
    "spirv.INTEL.ControlBarrierArrive"() <{execution_scope = #spirv.scope<Workgroup>, memory_scope = #spirv.scope<Device>, memory_semantics = #spirv.memory_semantics<Acquire|UniformMemory>}> : () -> ()
    "spirv.INTEL.ControlBarrierWait"() <{execution_scope = #spirv.scope<Workgroup>, memory_scope = #spirv.scope<Device>, memory_semantics = #spirv.memory_semantics<Acquire|UniformMemory>}> : () -> ()
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4x!spirv.ptr<f32, CrossWorkgroup>>, i32, vector<4xi1>, vector<4xf32>) -> (), sym_name = "masked_gather"}> ({
  ^bb0(%arg0: vector<4x!spirv.ptr<f32, CrossWorkgroup>>, %arg1: i32, %arg2: vector<4xi1>, %arg3: vector<4xf32>):
    %0 = "spirv.INTEL.MaskedGather"(%arg0, %arg1, %arg2, %arg3) : (vector<4x!spirv.ptr<f32, CrossWorkgroup>>, i32, vector<4xi1>, vector<4xf32>) -> vector<4xf32>
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4x!spirv.ptr<i32, CrossWorkgroup>>, i32, vector<4xi1>, vector<4xi32>) -> (), sym_name = "masked_gather_i32"}> ({
  ^bb0(%arg0: vector<4x!spirv.ptr<i32, CrossWorkgroup>>, %arg1: i32, %arg2: vector<4xi1>, %arg3: vector<4xi32>):
    %0 = "spirv.INTEL.MaskedGather"(%arg0, %arg1, %arg2, %arg3) : (vector<4x!spirv.ptr<i32, CrossWorkgroup>>, i32, vector<4xi1>, vector<4xi32>) -> vector<4xi32>
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4x!spirv.ptr<f32, CrossWorkgroup>>, i32, vector<4xi1>, vector<4xf32>) -> (), sym_name = "masked_scatter"}> ({
  ^bb0(%arg0: vector<4x!spirv.ptr<f32, CrossWorkgroup>>, %arg1: i32, %arg2: vector<4xi1>, %arg3: vector<4xf32>):
    "spirv.INTEL.MaskedScatter"(%arg0, %arg1, %arg2, %arg3) : (vector<4x!spirv.ptr<f32, CrossWorkgroup>>, i32, vector<4xi1>, vector<4xf32>) -> ()
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [CacheControlsINTEL], [SPV_INTEL_cache_controls]>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "foo"}> ({
      %0 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> {cache_control_load_intel = [#spirv.cache_control_load_intel<cache_level = 0, load_cache_control = Uncached>, #spirv.cache_control_load_intel<cache_level = 1, load_cache_control = Cached>, #spirv.cache_control_load_intel<cache_level = 2, load_cache_control = InvalidateAfterR>]} : () -> !spirv.ptr<f32, Function>
      %1 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> {cache_control_store_intel = [#spirv.cache_control_store_intel<cache_level = 0, store_cache_control = Uncached>, #spirv.cache_control_store_intel<cache_level = 1, store_cache_control = WriteThrough>, #spirv.cache_control_store_intel<cache_level = 2, store_cache_control = WriteBack>]} : () -> !spirv.ptr<f32, Function>
      "spirv.Return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

