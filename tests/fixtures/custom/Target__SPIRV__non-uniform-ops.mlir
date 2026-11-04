module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.3, [Shader, Linkage, GroupNonUniformBallot, GroupNonUniformArithmetic, GroupNonUniformClustered, GroupNonUniformShuffle, GroupNonUniformShuffleRelative, GroupNonUniformVote, GroupNonUniformQuad], []> {
    spirv.func @group_non_uniform_ballot(%arg0: i1) -> vector<4xi32> "None" {
      %0 = spirv.GroupNonUniformBallot <Workgroup> %arg0 : vector<4xi32>
      spirv.ReturnValue %0 : vector<4xi32>
    }
    spirv.func @group_non_uniform_broadcast(%arg0: f32) -> f32 "None" {
      %cst1_i32 = spirv.Constant 1 : i32
      %0 = spirv.GroupNonUniformBroadcast <Subgroup> %arg0, %cst1_i32 : f32, i32
      spirv.ReturnValue %0 : f32
    }
    spirv.func @group_non_uniform_elect() -> i1 "None" {
      %0 = spirv.GroupNonUniformElect <Workgroup> : i1
      spirv.ReturnValue %0 : i1
    }
    spirv.func @group_non_uniform_fadd_reduce(%arg0: f32) -> f32 "None" {
      %0 = spirv.GroupNonUniformFAdd <Workgroup> <Reduce> %arg0 : f32 -> f32
      spirv.ReturnValue %0 : f32
    }
    spirv.func @group_non_uniform_fmax_reduce(%arg0: f32) -> f32 "None" {
      %0 = spirv.GroupNonUniformFMax <Workgroup> <Reduce> %arg0 : f32 -> f32
      spirv.ReturnValue %0 : f32
    }
    spirv.func @group_non_uniform_fmin_reduce(%arg0: f32) -> f32 "None" {
      %0 = spirv.GroupNonUniformFMin <Workgroup> <Reduce> %arg0 : f32 -> f32
      spirv.ReturnValue %0 : f32
    }
    spirv.func @group_non_uniform_fmul_reduce(%arg0: f32) -> f32 "None" {
      %0 = spirv.GroupNonUniformFMul <Workgroup> <Reduce> %arg0 : f32 -> f32
      spirv.ReturnValue %0 : f32
    }
    spirv.func @group_non_uniform_iadd_reduce(%arg0: i32) -> i32 "None" {
      %0 = spirv.GroupNonUniformIAdd <Workgroup> <Reduce> %arg0 : i32 -> i32
      spirv.ReturnValue %0 : i32
    }
    spirv.func @group_non_uniform_iadd_clustered_reduce(%arg0: vector<2xi32>) -> vector<2xi32> "None" {
      %cst4_i32 = spirv.Constant 4 : i32
      %0 = spirv.GroupNonUniformIAdd <Workgroup> <ClusteredReduce> %arg0 cluster_size(%cst4_i32) : vector<2xi32>, i32 -> vector<2xi32>
      spirv.ReturnValue %0 : vector<2xi32>
    }
    spirv.func @group_non_uniform_imul_reduce(%arg0: i32) -> i32 "None" {
      %0 = spirv.GroupNonUniformIMul <Workgroup> <Reduce> %arg0 : i32 -> i32
      spirv.ReturnValue %0 : i32
    }
    spirv.func @group_non_uniform_smax_reduce(%arg0: i32) -> i32 "None" {
      %0 = spirv.GroupNonUniformSMax <Workgroup> <Reduce> %arg0 : i32 -> i32
      spirv.ReturnValue %0 : i32
    }
    spirv.func @group_non_uniform_smin_reduce(%arg0: i32) -> i32 "None" {
      %0 = spirv.GroupNonUniformSMin <Workgroup> <Reduce> %arg0 : i32 -> i32
      spirv.ReturnValue %0 : i32
    }
    spirv.func @group_non_uniform_umax_reduce(%arg0: i32) -> i32 "None" {
      %0 = spirv.GroupNonUniformUMax <Workgroup> <Reduce> %arg0 : i32 -> i32
      spirv.ReturnValue %0 : i32
    }
    spirv.func @group_non_uniform_umin_reduce(%arg0: i32) -> i32 "None" {
      %0 = spirv.GroupNonUniformUMin <Workgroup> <Reduce> %arg0 : i32 -> i32
      spirv.ReturnValue %0 : i32
    }
    spirv.func @group_non_uniform_shuffle(%arg0: f32, %arg1: i32) -> f32 "None" {
      %0 = spirv.GroupNonUniformShuffle <Subgroup> %arg0, %arg1 : f32, i32
      spirv.ReturnValue %0 : f32
    }
    spirv.func @group_non_uniform_shuffle_up(%arg0: f32, %arg1: i32) -> f32 "None" {
      %0 = spirv.GroupNonUniformShuffleUp <Subgroup> %arg0, %arg1 : f32, i32
      spirv.ReturnValue %0 : f32
    }
    spirv.func @group_non_uniform_shuffle_down(%arg0: f32, %arg1: i32) -> f32 "None" {
      %0 = spirv.GroupNonUniformShuffleDown <Subgroup> %arg0, %arg1 : f32, i32
      spirv.ReturnValue %0 : f32
    }
    spirv.func @group_non_uniform_shuffle_xor(%arg0: f32, %arg1: i32) -> f32 "None" {
      %0 = spirv.GroupNonUniformShuffleXor <Subgroup> %arg0, %arg1 : f32, i32
      spirv.ReturnValue %0 : f32
    }
    spirv.func @group_non_uniform_all(%arg0: i1) -> i1 "None" {
      %0 = spirv.GroupNonUniformAll <Subgroup> %arg0 : i1
      spirv.ReturnValue %0 : i1
    }
    spirv.func @group_non_uniform_any(%arg0: i1) -> i1 "None" {
      %0 = spirv.GroupNonUniformAny <Subgroup> %arg0 : i1
      spirv.ReturnValue %0 : i1
    }
    spirv.func @group_non_uniform_all_equal(%arg0: vector<4xi32>) -> i1 "None" {
      %0 = spirv.GroupNonUniformAllEqual <Subgroup> %arg0 : vector<4xi32>, i1
      spirv.ReturnValue %0 : i1
    }
    spirv.func @group_non_uniform_quad_swap_vec(%arg0: vector<4xf32>) -> vector<4xf32> "None" {
      %cst0_i32 = spirv.Constant 0 : i32
      %0 = spirv.GroupNonUniformQuadSwap <Subgroup> %arg0 %cst0_i32 : vector<4xf32>, i32
      spirv.ReturnValue %0 : vector<4xf32>
    }
    spirv.func @group_non_uniform_quad_swap_scalar(%arg0: f32) -> f32 "None" {
      %cst0_i32 = spirv.Constant 0 : i32
      %0 = spirv.GroupNonUniformQuadSwap <Subgroup> %arg0 %cst0_i32 : f32, i32
      spirv.ReturnValue %0 : f32
    }
  }
}

