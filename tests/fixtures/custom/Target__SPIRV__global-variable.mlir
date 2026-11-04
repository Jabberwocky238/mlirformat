module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage], []> {
    spirv.GlobalVariable @var0 bind(1, 0) : !spirv.ptr<f32, Input>
    spirv.GlobalVariable @var1 bind(0, 1) : !spirv.ptr<f32, Output>
    spirv.GlobalVariable @var2 built_in("GlobalInvocationId") : !spirv.ptr<vector<3xi32>, Input>
    spirv.GlobalVariable @var3 built_in("GlobalInvocationId") : !spirv.ptr<vector<3xi32>, Input>
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage, Int8], []> {
    spirv.SpecConstant @sc = 1 : i8
    spirv.GlobalVariable @var initializer(@sc) : !spirv.ptr<i8, Uniform>
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage, Int8], []> {
    spirv.SpecConstant @sc0 = 1 : i8
    spirv.SpecConstant @sc1 = 2 : i8
    spirv.SpecConstant @sc2 = 3 : i8
    spirv.SpecConstantComposite @scc (@sc0, @sc1, @sc2) : !spirv.array<3 x i8>
    spirv.GlobalVariable @var initializer(@scc) : !spirv.ptr<!spirv.array<3 x i8>, Uniform>
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage], []> {
    spirv.GlobalVariable @globalInvocationID built_in("GlobalInvocationId") : !spirv.ptr<vector<3xi32>, Input>
    spirv.func @foo() "None" {
      %globalInvocationID_addr = spirv.mlir.addressof @globalInvocationID : !spirv.ptr<vector<3xi32>, Input>
      %cst0_i32 = spirv.Constant 0 : i32
      %0 = spirv.AccessChain %globalInvocationID_addr[%cst0_i32] : !spirv.ptr<vector<3xi32>, Input>, i32 -> !spirv.ptr<i32, Input>
      spirv.Return
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage], []> {
    spirv.GlobalVariable @var1 {linkage_attributes = #spirv.linkage_attributes<linkage_name = "outSideGlobalVar1", linkage_type = <Import>>} : !spirv.ptr<f32, Private>
  }
}

