module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage], [SPV_KHR_linkonce_odr]> {
    spirv.func @linkonce_odr_fn() "None" attributes {linkage_attributes = #spirv.linkage_attributes<linkage_name = "linkonce_odr_fn", linkage_type = <LinkOnceODR>>} {
      spirv.Return
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, WeakLinkageAMD], [SPV_AMD_weak_linkage]> {
    spirv.func @weak_fn() "None" attributes {linkage_attributes = #spirv.linkage_attributes<linkage_name = "weak_fn", linkage_type = <Weak>>} {
      spirv.Return
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, WeakLinkageAMD], [SPV_AMD_weak_linkage]> {
    spirv.GlobalVariable @weak_var {linkage_attributes = #spirv.linkage_attributes<linkage_name = "weak_var", linkage_type = <Weak>>} : !spirv.ptr<i32, Private>
  }
}

