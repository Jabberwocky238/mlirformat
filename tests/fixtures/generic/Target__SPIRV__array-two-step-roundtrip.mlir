"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage], [SPV_KHR_storage_buffer_storage_class]>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<!spirv.array<4 x !spirv.array<4 x f32, stride=4>, stride=128>, StorageBuffer>, i32, i32) -> (), sym_name = "array_stride"}> ({
    ^bb0(%arg0: !spirv.ptr<!spirv.array<4 x !spirv.array<4 x f32, stride=4>, stride=128>, StorageBuffer>, %arg1: i32, %arg2: i32):
      %0 = "spirv.AccessChain"(%arg0, %arg1, %arg2) : (!spirv.ptr<!spirv.array<4 x !spirv.array<4 x f32, stride=4>, stride=128>, StorageBuffer>, i32, i32) -> !spirv.ptr<f32, StorageBuffer>
      "spirv.Return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage, Float16], [SPV_KHR_storage_buffer_storage_class]>}> ({
    "spirv.GlobalVariable"() <{sym_name = "var0", type = !spirv.ptr<!spirv.rtarray<f32, stride=4>, StorageBuffer>}> : () -> ()
    "spirv.GlobalVariable"() <{sym_name = "var1", type = !spirv.ptr<!spirv.rtarray<vector<4xf16>>, Input>}> : () -> ()
  }) : () -> ()
}) : () -> ()

