"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage], []>}> ({
    "spirv.GlobalVariable"() <{binding = 0 : i32, descriptor_set = 1 : i32, sym_name = "var0", type = !spirv.ptr<f32, Input>}> : () -> () loc("<stdin>":3:5)
    "spirv.GlobalVariable"() <{binding = 1 : i32, descriptor_set = 0 : i32, sym_name = "var1", type = !spirv.ptr<f32, Output>}> : () -> () loc("<stdin>":4:5)
    "spirv.GlobalVariable"() <{built_in = "GlobalInvocationId", sym_name = "var2", type = !spirv.ptr<vector<3xi32>, Input>}> : () -> () loc("<stdin>":5:5)
    "spirv.GlobalVariable"() <{built_in = "GlobalInvocationId", sym_name = "var3", type = !spirv.ptr<vector<3xi32>, Input>}> : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
