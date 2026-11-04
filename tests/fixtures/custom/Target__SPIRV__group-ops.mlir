module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.3, [Shader, Linkage, SubgroupBallotKHR, Groups, GroupNonUniformArithmetic, GroupUniformArithmeticKHR], [SPV_KHR_storage_buffer_storage_class, SPV_KHR_shader_ballot, SPV_KHR_uniform_group_instructions]> {
    spirv.func @subgroup_ballot(%arg0: i1) -> vector<4xi32> "None" {
      %0 = spirv.KHR.SubgroupBallot %arg0 : vector<4xi32>
      spirv.ReturnValue %0 : vector<4xi32>
    }
    spirv.func @group_broadcast_1(%arg0: f32, %arg1: i32) -> f32 "None" {
      %0 = spirv.GroupBroadcast <Workgroup> %arg0, %arg1 : f32, i32
      spirv.ReturnValue %0 : f32
    }
    spirv.func @group_broadcast_2(%arg0: f32, %arg1: vector<3xi32>) -> f32 "None" {
      %0 = spirv.GroupBroadcast <Workgroup> %arg0, %arg1 : f32, vector<3xi32>
      spirv.ReturnValue %0 : f32
    }
    spirv.func @group_iadd(%arg0: i32) -> i32 "None" {
      %0 = spirv.GroupIAdd <Workgroup> <Reduce> %arg0 : i32
      spirv.ReturnValue %0 : i32
    }
    spirv.func @group_fadd(%arg0: f32) -> f32 "None" {
      %0 = spirv.GroupFAdd <Workgroup> <Reduce> %arg0 : f32
      spirv.ReturnValue %0 : f32
    }
    spirv.func @group_fmin(%arg0: f32) -> f32 "None" {
      %0 = spirv.GroupFMin <Workgroup> <Reduce> %arg0 : f32
      spirv.ReturnValue %0 : f32
    }
    spirv.func @group_umin(%arg0: i32) -> i32 "None" {
      %0 = spirv.GroupUMin <Workgroup> <Reduce> %arg0 : i32
      spirv.ReturnValue %0 : i32
    }
    spirv.func @group_smin(%arg0: i32) -> i32 "None" {
      %0 = spirv.GroupSMin <Workgroup> <Reduce> %arg0 : i32
      spirv.ReturnValue %0 : i32
    }
    spirv.func @group_fmax(%arg0: f32) -> f32 "None" {
      %0 = spirv.GroupFMax <Workgroup> <Reduce> %arg0 : f32
      spirv.ReturnValue %0 : f32
    }
    spirv.func @group_umax(%arg0: i32) -> i32 "None" {
      %0 = spirv.GroupUMax <Workgroup> <Reduce> %arg0 : i32
      spirv.ReturnValue %0 : i32
    }
    spirv.func @group_smax(%arg0: i32) -> i32 "None" {
      %0 = spirv.GroupSMax <Workgroup> <Reduce> %arg0 : i32
      spirv.ReturnValue %0 : i32
    }
    spirv.func @group_imul(%arg0: i32) -> i32 "None" {
      %0 = spirv.KHR.GroupIMul <Workgroup> <Reduce> %arg0 : i32
      spirv.ReturnValue %0 : i32
    }
    spirv.func @group_fmul(%arg0: f32) -> f32 "None" {
      %0 = spirv.KHR.GroupFMul <Workgroup> <Reduce> %arg0 : f32
      spirv.ReturnValue %0 : f32
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.3, [Shader, GroupNonUniformBallot, Linkage], []> {
    spirv.func @group_non_uniform_ballot_bit_count(%arg0: vector<4xi32>) -> i32 "None" {
      %0 = spirv.GroupNonUniformBallotBitCount <Subgroup> <Reduce> %arg0 : vector<4xi32> -> i32
      spirv.ReturnValue %0 : i32
    }
  }
}

