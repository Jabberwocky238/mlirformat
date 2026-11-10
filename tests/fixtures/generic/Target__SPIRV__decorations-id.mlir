"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<OpenCL>, vce_triple = #spirv.vce<v1.2, [Kernel, Addresses, Linkage], []>}> ({
    "spirv.SpecConstant"() <{default_value = 16 : i32, sym_name = "sc_align"}> : () -> ()
    "spirv.GlobalVariable"() <{sym_name = "var", type = !spirv.ptr<f32, CrossWorkgroup>}> {alignment_id = @sc_align} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<OpenCL>, vce_triple = #spirv.vce<v1.2, [Kernel, Addresses, Linkage], []>}> ({
    "spirv.SpecConstant"() <{default_value = 1024 : i32, sym_name = "sc_offset"}> : () -> ()
    "spirv.GlobalVariable"() <{sym_name = "var", type = !spirv.ptr<f32, CrossWorkgroup>}> {max_byte_offset_id = @sc_offset} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.4, [Shader, Linkage], [SPV_GOOGLE_hlsl_functionality1]>}> ({
    "spirv.GlobalVariable"() <{binding = 1 : i32, descriptor_set = 0 : i32, sym_name = "counter", type = !spirv.ptr<!spirv.struct<(!spirv.array<1 x i32, stride=4> [0])>, StorageBuffer>}> : () -> ()
    "spirv.GlobalVariable"() <{binding = 0 : i32, descriptor_set = 0 : i32, sym_name = "var", type = !spirv.ptr<!spirv.struct<(!spirv.array<4 x f32, stride=4> [0])>, StorageBuffer>}> {counter_buffer = @counter} : () -> ()
  }) : () -> ()
}) : () -> ()

