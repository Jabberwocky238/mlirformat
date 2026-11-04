"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage], []>}> ({
    "spirv.GlobalVariable"() <{binding = 0 : i32, descriptor_set = 1 : i32, sym_name = "var0", type = !spirv.ptr<f32, Input>}> : () -> ()
    "spirv.GlobalVariable"() <{binding = 1 : i32, descriptor_set = 0 : i32, sym_name = "var1", type = !spirv.ptr<f32, Output>}> : () -> ()
    "spirv.GlobalVariable"() <{built_in = "GlobalInvocationId", sym_name = "var2", type = !spirv.ptr<vector<3xi32>, Input>}> : () -> ()
    "spirv.GlobalVariable"() <{built_in = "GlobalInvocationId", sym_name = "var3", type = !spirv.ptr<vector<3xi32>, Input>}> : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage, Int8], []>}> ({
    "spirv.SpecConstant"() <{default_value = 1 : i8, sym_name = "sc"}> : () -> ()
    "spirv.GlobalVariable"() <{initializer = @sc, sym_name = "var", type = !spirv.ptr<i8, Uniform>}> : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage, Int8], []>}> ({
    "spirv.SpecConstant"() <{default_value = 1 : i8, sym_name = "sc0"}> : () -> ()
    "spirv.SpecConstant"() <{default_value = 2 : i8, sym_name = "sc1"}> : () -> ()
    "spirv.SpecConstant"() <{default_value = 3 : i8, sym_name = "sc2"}> : () -> ()
    "spirv.SpecConstantComposite"() <{constituents = [@sc0, @sc1, @sc2], sym_name = "scc", type = !spirv.array<3 x i8>}> : () -> ()
    "spirv.GlobalVariable"() <{initializer = @scc, sym_name = "var", type = !spirv.ptr<!spirv.array<3 x i8>, Uniform>}> : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage], []>}> ({
    "spirv.GlobalVariable"() <{built_in = "GlobalInvocationId", sym_name = "globalInvocationID", type = !spirv.ptr<vector<3xi32>, Input>}> : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "foo"}> ({
      %0 = "spirv.mlir.addressof"() <{variable = @globalInvocationID}> : () -> !spirv.ptr<vector<3xi32>, Input>
      %1 = "spirv.Constant"() <{value = 0 : i32}> : () -> i32
      %2 = "spirv.AccessChain"(%0, %1) : (!spirv.ptr<vector<3xi32>, Input>, i32) -> !spirv.ptr<i32, Input>
      "spirv.Return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage], []>}> ({
    "spirv.GlobalVariable"() <{linkage_attributes = #spirv.linkage_attributes<linkage_name = "outSideGlobalVar1", linkage_type = <Import>>, sym_name = "var1", type = !spirv.ptr<f32, Private>}> : () -> ()
  }) : () -> ()
}) : () -> ()

