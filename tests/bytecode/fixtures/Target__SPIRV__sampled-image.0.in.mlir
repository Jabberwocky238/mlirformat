"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Sampled1D, SampledRect, StorageImageExtendedFormats, Linkage], []>}> ({
    "spirv.GlobalVariable"() <{binding = 1 : i32, descriptor_set = 0 : i32, sym_name = "var0", type = !spirv.ptr<!spirv.sampled_image<!spirv.image<f32, Dim1D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Unknown>>, UniformConstant>}> : () -> () loc("<stdin>":3:5)
    "spirv.GlobalVariable"() <{binding = 0 : i32, descriptor_set = 0 : i32, sym_name = "var1", type = !spirv.ptr<!spirv.sampled_image<!spirv.image<si32, Cube, DepthUnknown, Arrayed, MultiSampled, NeedSampler, Unknown>>, UniformConstant>}> : () -> () loc("<stdin>":4:5)
    "spirv.GlobalVariable"() <{binding = 0 : i32, descriptor_set = 0 : i32, sym_name = "var2", type = !spirv.ptr<!spirv.sampled_image<!spirv.image<i32, Rect, DepthUnknown, Arrayed, MultiSampled, NeedSampler, R8ui>>, UniformConstant>}> : () -> () loc("<stdin>":5:5)
    "spirv.GlobalVariable"() <{binding = 2 : i32, descriptor_set = 0 : i32, sym_name = "var3", type = !spirv.ptr<!spirv.sampler, UniformConstant>}> : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
