"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage], [SPV_KHR_linkonce_odr]>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), linkage_attributes = #spirv.linkage_attributes<linkage_name = "linkonce_odr_fn", linkage_type = <LinkOnceODR>>, sym_name = "linkonce_odr_fn"}> ({
      "spirv.Return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, WeakLinkageAMD], [SPV_AMD_weak_linkage]>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), linkage_attributes = #spirv.linkage_attributes<linkage_name = "weak_fn", linkage_type = <Weak>>, sym_name = "weak_fn"}> ({
      "spirv.Return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, WeakLinkageAMD], [SPV_AMD_weak_linkage]>}> ({
    "spirv.GlobalVariable"() <{linkage_attributes = #spirv.linkage_attributes<linkage_name = "weak_var", linkage_type = <Weak>>, sym_name = "weak_var", type = !spirv.ptr<i32, Private>}> : () -> ()
  }) : () -> ()
}) : () -> ()

