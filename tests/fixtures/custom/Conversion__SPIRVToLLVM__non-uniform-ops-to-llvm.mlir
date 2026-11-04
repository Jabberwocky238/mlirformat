module {
  spirv.func @non_uniform_iadd(%arg0: i32) -> i32 "None" {
    %0 = spirv.GroupNonUniformIAdd <Subgroup> <Reduce> %arg0 : i32 -> i32
    spirv.ReturnValue %0 : i32
  }
  spirv.func @non_uniform_fadd(%arg0: f32) -> f32 "None" {
    %cst16_i32 = spirv.Constant 16 : i32
    %0 = spirv.GroupNonUniformFAdd <Subgroup> <ClusteredReduce> %arg0 cluster_size(%cst16_i32) : f32, i32 -> f32
    spirv.ReturnValue %0 : f32
  }
  spirv.func @non_uniform_imul(%arg0: i32) -> i32 "None" {
    %cst16_i32 = spirv.Constant 16 : i32
    %0 = spirv.GroupNonUniformIMul <Subgroup> <ClusteredReduce> %arg0 cluster_size(%cst16_i32) : i32, i32 -> i32
    spirv.ReturnValue %0 : i32
  }
  spirv.func @non_uniform_fmul(%arg0: f32) -> f32 "None" {
    %0 = spirv.GroupNonUniformFMul <Subgroup> <Reduce> %arg0 : f32 -> f32
    spirv.ReturnValue %0 : f32
  }
  spirv.func @non_uniform_smin(%arg0: i32) -> i32 "None" {
    %0 = spirv.GroupNonUniformSMin <Subgroup> <Reduce> %arg0 : i32 -> i32
    spirv.ReturnValue %0 : i32
  }
  spirv.func @non_uniform_umin(%arg0: i32) -> i32 "None" {
    %0 = spirv.GroupNonUniformUMin <Subgroup> <Reduce> %arg0 : i32 -> i32
    spirv.ReturnValue %0 : i32
  }
  spirv.func @non_uniform_fmin(%arg0: f32) -> f32 "None" {
    %0 = spirv.GroupNonUniformFMin <Subgroup> <Reduce> %arg0 : f32 -> f32
    spirv.ReturnValue %0 : f32
  }
  spirv.func @non_uniform_fmin_cluster(%arg0: f32) -> f32 "None" {
    %cst16_i32 = spirv.Constant 16 : i32
    %0 = spirv.GroupNonUniformFMin <Subgroup> <ClusteredReduce> %arg0 cluster_size(%cst16_i32) : f32, i32 -> f32
    spirv.ReturnValue %0 : f32
  }
  spirv.func @non_uniform_smax(%arg0: i32) -> i32 "None" {
    %0 = spirv.GroupNonUniformSMax <Subgroup> <Reduce> %arg0 : i32 -> i32
    spirv.ReturnValue %0 : i32
  }
  spirv.func @non_uniform_umax(%arg0: i32) -> i32 "None" {
    %0 = spirv.GroupNonUniformUMax <Subgroup> <Reduce> %arg0 : i32 -> i32
    spirv.ReturnValue %0 : i32
  }
  spirv.func @non_uniform_fmax(%arg0: f32) -> f32 "None" {
    %0 = spirv.GroupNonUniformFMax <Subgroup> <Reduce> %arg0 : f32 -> f32
    spirv.ReturnValue %0 : f32
  }
  spirv.func @non_uniform_smax_cluster(%arg0: i32) -> i32 "None" {
    %cst16_i32 = spirv.Constant 16 : i32
    %0 = spirv.GroupNonUniformSMax <Subgroup> <ClusteredReduce> %arg0 cluster_size(%cst16_i32) : i32, i32 -> i32
    spirv.ReturnValue %0 : i32
  }
  spirv.func @non_uniform_bitwise_and(%arg0: i32) -> i32 "None" {
    %0 = spirv.GroupNonUniformBitwiseAnd <Subgroup> <Reduce> %arg0 : i32 -> i32
    spirv.ReturnValue %0 : i32
  }
  spirv.func @non_uniform_bitwise_or(%arg0: i32) -> i32 "None" {
    %0 = spirv.GroupNonUniformBitwiseOr <Subgroup> <Reduce> %arg0 : i32 -> i32
    spirv.ReturnValue %0 : i32
  }
  spirv.func @non_uniform_bitwise_xor(%arg0: i32) -> i32 "None" {
    %0 = spirv.GroupNonUniformBitwiseXor <Subgroup> <Reduce> %arg0 : i32 -> i32
    spirv.ReturnValue %0 : i32
  }
  spirv.func @non_uniform_logical_and(%arg0: i1) -> i1 "None" {
    %0 = spirv.GroupNonUniformLogicalAnd <Subgroup> <Reduce> %arg0 : i1 -> i1
    spirv.ReturnValue %0 : i1
  }
  spirv.func @non_uniform_logical_or(%arg0: i1) -> i1 "None" {
    %0 = spirv.GroupNonUniformLogicalOr <Subgroup> <Reduce> %arg0 : i1 -> i1
    spirv.ReturnValue %0 : i1
  }
  spirv.func @non_uniform_logical_xor(%arg0: i1) -> i1 "None" {
    %0 = spirv.GroupNonUniformLogicalXor <Subgroup> <Reduce> %arg0 : i1 -> i1
    spirv.ReturnValue %0 : i1
  }
}

