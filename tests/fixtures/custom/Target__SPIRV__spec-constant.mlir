module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage], []> {
    spirv.SpecConstant @sc_true = true
    spirv.SpecConstant @sc_false spec_id(1) = false
    spirv.SpecConstant @sc_int = -5 : i32
    spirv.SpecConstant @sc_float spec_id(5) = 1.000000e+00 : f32
    spirv.SpecConstantComposite @scc (@sc_int, @sc_int) : !spirv.array<2 x i32>
    spirv.func @use() -> i32 "None" {
      %0 = spirv.mlir.referenceof @sc_int : i32
      %1 = spirv.IAdd %0, %0 : i32
      spirv.ReturnValue %1 : i32
    }
    spirv.func @use_composite() -> i32 "None" {
      %0 = spirv.mlir.referenceof @scc : !spirv.array<2 x i32>
      %1 = spirv.CompositeExtract %0[0 : i32] : !spirv.array<2 x i32>
      %2 = spirv.CompositeExtract %0[1 : i32] : !spirv.array<2 x i32>
      %3 = spirv.IAdd %1, %2 : i32
      spirv.ReturnValue %3 : i32
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage], []> {
    spirv.SpecConstant @sc_f32_1 = 1.500000e+00 : f32
    spirv.SpecConstant @sc_f32_2 = 2.500000e+00 : f32
    spirv.SpecConstant @sc_f32_3 = 3.500000e+00 : f32
    spirv.SpecConstant @sc_i32_1 = 1 : i32
    spirv.SpecConstantComposite @scc_array (@sc_f32_1, @sc_f32_2, @sc_f32_3) : !spirv.array<3 x f32>
    spirv.SpecConstantComposite @scc_struct (@sc_i32_1, @sc_f32_2, @sc_f32_3) : !spirv.struct<(i32, f32, f32)>
    spirv.SpecConstantComposite @scc_vector (@sc_f32_1, @sc_f32_2, @sc_f32_3) : vector<3xf32>
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage], []> {
    spirv.SpecConstant @sc_f32_1 = 1.500000e+00 : f32
    spirv.SpecConstant @sc_f32_2 = 2.500000e+00 : f32
    spirv.SpecConstant @sc_f32_3 = 3.500000e+00 : f32
    spirv.SpecConstant @sc_i32_1 = 1 : i32
    spirv.SpecConstantComposite @scc_array (@sc_f32_1, @sc_f32_2, @sc_f32_3) : !spirv.array<3 x f32>
    spirv.SpecConstantComposite @scc_struct (@sc_i32_1, @sc_f32_2, @sc_f32_3) : !spirv.struct<(i32, f32, f32)>
    spirv.SpecConstantComposite @scc_vector (@sc_f32_1, @sc_f32_2, @sc_f32_3) : vector<3xf32>
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage, ReplicatedCompositesEXT], [SPV_EXT_replicated_composites]> {
    spirv.SpecConstant @sc_i32_1 = 1 : i32
    spirv.EXT.SpecConstantCompositeReplicate @scc_splat_array_of_i32 (@sc_i32_1) : !spirv.array<3 x i32>
    spirv.EXT.SpecConstantCompositeReplicate @scc_splat_struct_of_i32 (@sc_i32_1) : !spirv.struct<(i32, i32, i32)>
    spirv.EXT.SpecConstantCompositeReplicate @scc_splat_vector_of_i32 (@sc_i32_1) : vector<3xi32>
    spirv.SpecConstant @sc_f32_1 = 1.000000e+00 : f32
    spirv.EXT.SpecConstantCompositeReplicate @scc_splat_array_of_f32 (@sc_f32_1) : !spirv.array<3 x f32>
    spirv.EXT.SpecConstantCompositeReplicate @scc_splat_struct_of_f32 (@sc_f32_1) : !spirv.struct<(f32, f32, f32)>
    spirv.EXT.SpecConstantCompositeReplicate @scc_splat_vector_of_f32 (@sc_f32_1) : vector<3xf32>
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage], []> {
    spirv.SpecConstant @sc_i32_1 = 1 : i32
    spirv.func @use_composite() -> i32 "None" {
      %0 = spirv.mlir.referenceof @sc_i32_1 : i32
      %cst0_i32 = spirv.Constant 0 : i32
      %1 = spirv.SpecConstantOperation wraps "spirv.ISub"(%0, %cst0_i32) : (i32, i32) -> i32
      %2 = spirv.SpecConstantOperation wraps "spirv.IMul"(%1, %1) : (i32, i32) -> i32
      spirv.ReturnValue %2 : i32
    }
  }
}

