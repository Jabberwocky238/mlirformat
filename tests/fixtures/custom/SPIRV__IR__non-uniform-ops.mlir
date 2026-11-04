module {
  func.func @group_non_uniform_ballot(%arg0: i1) -> vector<4xi32> {
    %0 = spirv.GroupNonUniformBallot <Workgroup> %arg0 : vector<4xi32>
    return %0 : vector<4xi32>
  }
}

// -----
// -----
// -----
module {
  func.func @group_non_uniform_ballot_find_lsb(%arg0: vector<4xi32>) -> i32 {
    %0 = spirv.GroupNonUniformBallotFindLSB <Subgroup> %arg0 : vector<4xi32>, i32
    return %0 : i32
  }
}

// -----
// -----
// -----
module {
  func.func @group_non_uniform_ballot_find_msb(%arg0: vector<4xi32>) -> i32 {
    %0 = spirv.GroupNonUniformBallotFindMSB <Subgroup> %arg0 : vector<4xi32>, i32
    return %0 : i32
  }
}

// -----
// -----
// -----
module {
  func.func @group_non_uniform_broadcast_scalar(%arg0: f32) -> f32 {
    %cst1_i32 = spirv.Constant 1 : i32
    %0 = spirv.GroupNonUniformBroadcast <Workgroup> %arg0, %cst1_i32 : f32, i32
    return %0 : f32
  }
}

// -----
module {
  func.func @group_non_uniform_broadcast_vector(%arg0: vector<4xf32>) -> vector<4xf32> {
    %cst1_i32 = spirv.Constant 1 : i32
    %0 = spirv.GroupNonUniformBroadcast <Subgroup> %arg0, %cst1_i32 : vector<4xf32>, i32
    return %0 : vector<4xf32>
  }
}

// -----
// -----
// -----
module {
  func.func @group_non_uniform_elect() -> i1 {
    %0 = spirv.GroupNonUniformElect <Workgroup> : i1
    return %0 : i1
  }
}

// -----
// -----
module {
  func.func @group_non_uniform_fadd_reduce(%arg0: f32) -> f32 {
    %0 = spirv.GroupNonUniformFAdd <Workgroup> <Reduce> %arg0 : f32 -> f32
    return %0 : f32
  }
  func.func @group_non_uniform_fadd_clustered_reduce(%arg0: vector<2xf32>) -> vector<2xf32> {
    %cst4_i32 = spirv.Constant 4 : i32
    %0 = spirv.GroupNonUniformFAdd <Workgroup> <ClusteredReduce> %arg0 cluster_size(%cst4_i32) : vector<2xf32>, i32 -> vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @group_non_uniform_fmul_reduce(%arg0: f32) -> f32 {
    %0 = spirv.GroupNonUniformFMul <Workgroup> <Reduce> %arg0 : f32 -> f32
    return %0 : f32
  }
  func.func @group_non_uniform_fmul_clustered_reduce(%arg0: vector<2xf32>) -> vector<2xf32> {
    %cst4_i32 = spirv.Constant 4 : i32
    %0 = spirv.GroupNonUniformFMul <Workgroup> <ClusteredReduce> %arg0 cluster_size(%cst4_i32) : vector<2xf32>, i32 -> vector<2xf32>
    return %0 : vector<2xf32>
  }
}

// -----
// -----
module {
  func.func @group_non_uniform_fmax_reduce(%arg0: f32) -> f32 {
    %0 = spirv.GroupNonUniformFMax <Workgroup> <Reduce> %arg0 : f32 -> f32
    return %0 : f32
  }
}

// -----
// -----
module {
  func.func @group_non_uniform_fmin_reduce(%arg0: f32) -> f32 {
    %0 = spirv.GroupNonUniformFMin <Workgroup> <Reduce> %arg0 : f32 -> f32
    return %0 : f32
  }
}

// -----
module {
  func.func @group_non_uniform_iadd_reduce(%arg0: i32) -> i32 {
    %0 = spirv.GroupNonUniformIAdd <Workgroup> <Reduce> %arg0 : i32 -> i32
    return %0 : i32
  }
  func.func @group_non_uniform_iadd_clustered_reduce(%arg0: vector<2xi32>) -> vector<2xi32> {
    %cst4_i32 = spirv.Constant 4 : i32
    %0 = spirv.GroupNonUniformIAdd <Workgroup> <ClusteredReduce> %arg0 cluster_size(%cst4_i32) : vector<2xi32>, i32 -> vector<2xi32>
    return %0 : vector<2xi32>
  }
}

// -----
// -----
// -----
// -----
// -----
module {
  func.func @group_non_uniform_imul_reduce(%arg0: i32) -> i32 {
    %0 = spirv.GroupNonUniformIMul <Workgroup> <Reduce> %arg0 : i32 -> i32
    return %0 : i32
  }
  func.func @group_non_uniform_imul_clustered_reduce(%arg0: vector<2xi32>) -> vector<2xi32> {
    %cst4_i32 = spirv.Constant 4 : i32
    %0 = spirv.GroupNonUniformIMul <Workgroup> <ClusteredReduce> %arg0 cluster_size(%cst4_i32) : vector<2xi32>, i32 -> vector<2xi32>
    return %0 : vector<2xi32>
  }
}

// -----
module {
  func.func @group_non_uniform_smax_reduce(%arg0: i32) -> i32 {
    %0 = spirv.GroupNonUniformSMax <Workgroup> <Reduce> %arg0 : i32 -> i32
    return %0 : i32
  }
}

// -----
module {
  func.func @group_non_uniform_smin_reduce(%arg0: i32) -> i32 {
    %0 = spirv.GroupNonUniformSMin <Workgroup> <Reduce> %arg0 : i32 -> i32
    return %0 : i32
  }
}

// -----
module {
  func.func @group_non_uniform_shuffle1(%arg0: f32, %arg1: i32) -> f32 {
    %0 = spirv.GroupNonUniformShuffle <Subgroup> %arg0, %arg1 : f32, i32
    return %0 : f32
  }
  func.func @group_non_uniform_shuffle2(%arg0: vector<2xf32>, %arg1: i32) -> vector<2xf32> {
    %0 = spirv.GroupNonUniformShuffle <Subgroup> %arg0, %arg1 : vector<2xf32>, i32
    return %0 : vector<2xf32>
  }
}

// -----
// -----
// -----
module {
  func.func @group_non_uniform_shuffle1(%arg0: f32, %arg1: i32) -> f32 {
    %0 = spirv.GroupNonUniformShuffleXor <Subgroup> %arg0, %arg1 : f32, i32
    return %0 : f32
  }
  func.func @group_non_uniform_shuffle2(%arg0: vector<2xf32>, %arg1: i32) -> vector<2xf32> {
    %0 = spirv.GroupNonUniformShuffleXor <Subgroup> %arg0, %arg1 : vector<2xf32>, i32
    return %0 : vector<2xf32>
  }
}

// -----
// -----
// -----
module {
  func.func @group_non_uniform_shuffle1(%arg0: f32, %arg1: i32) -> f32 {
    %0 = spirv.GroupNonUniformShuffleUp <Subgroup> %arg0, %arg1 : f32, i32
    return %0 : f32
  }
  func.func @group_non_uniform_shuffle2(%arg0: vector<2xf32>, %arg1: i32) -> vector<2xf32> {
    %0 = spirv.GroupNonUniformShuffleUp <Subgroup> %arg0, %arg1 : vector<2xf32>, i32
    return %0 : vector<2xf32>
  }
}

// -----
// -----
// -----
module {
  func.func @group_non_uniform_shuffle1(%arg0: f32, %arg1: i32) -> f32 {
    %0 = spirv.GroupNonUniformShuffleDown <Subgroup> %arg0, %arg1 : f32, i32
    return %0 : f32
  }
  func.func @group_non_uniform_shuffle2(%arg0: vector<2xf32>, %arg1: i32) -> vector<2xf32> {
    %0 = spirv.GroupNonUniformShuffleDown <Subgroup> %arg0, %arg1 : vector<2xf32>, i32
    return %0 : vector<2xf32>
  }
}

// -----
// -----
// -----
module {
  func.func @group_non_uniform_umax_reduce(%arg0: i32) -> i32 {
    %0 = spirv.GroupNonUniformUMax <Workgroup> <Reduce> %arg0 : i32 -> i32
    return %0 : i32
  }
}

// -----
module {
  func.func @group_non_uniform_umin_reduce(%arg0: i32) -> i32 {
    %0 = spirv.GroupNonUniformUMin <Workgroup> <Reduce> %arg0 : i32 -> i32
    return %0 : i32
  }
}

// -----
module {
  func.func @group_non_uniform_bitwise_and(%arg0: i32) -> i32 {
    %0 = spirv.GroupNonUniformBitwiseAnd <Workgroup> <Reduce> %arg0 : i32 -> i32
    return %0 : i32
  }
}

// -----
// -----
module {
  func.func @group_non_uniform_bitwise_or(%arg0: i32) -> i32 {
    %0 = spirv.GroupNonUniformBitwiseOr <Workgroup> <Reduce> %arg0 : i32 -> i32
    return %0 : i32
  }
}

// -----
// -----
module {
  func.func @group_non_uniform_bitwise_xor(%arg0: i32) -> i32 {
    %0 = spirv.GroupNonUniformBitwiseXor <Workgroup> <Reduce> %arg0 : i32 -> i32
    return %0 : i32
  }
}

// -----
// -----
module {
  func.func @group_non_uniform_logical_and(%arg0: i1) -> i1 {
    %0 = spirv.GroupNonUniformLogicalAnd <Workgroup> <Reduce> %arg0 : i1 -> i1
    return %0 : i1
  }
}

// -----
// -----
module {
  func.func @group_non_uniform_logical_or(%arg0: i1) -> i1 {
    %0 = spirv.GroupNonUniformLogicalOr <Workgroup> <Reduce> %arg0 : i1 -> i1
    return %0 : i1
  }
}

// -----
// -----
module {
  func.func @group_non_uniform_logical_xor(%arg0: i1) -> i1 {
    %0 = spirv.GroupNonUniformLogicalXor <Workgroup> <Reduce> %arg0 : i1 -> i1
    return %0 : i1
  }
}

// -----
// -----
module {
  func.func @group_non_uniform_rotate_khr(%arg0: f32, %arg1: i32) -> f32 {
    %0 = spirv.GroupNonUniformRotateKHR <Subgroup> %arg0, %arg1 : f32, i32 -> f32
    return %0 : f32
  }
}

// -----
module {
  func.func @group_non_uniform_rotate_khr(%arg0: f32, %arg1: i32) -> f32 {
    %cst4_i32 = spirv.Constant 4 : i32
    %0 = spirv.GroupNonUniformRotateKHR <Workgroup> %arg0, %arg1, cluster_size(%cst4_i32) : f32, i32, i32 -> f32
    return %0 : f32
  }
}

// -----
// -----
// -----
// -----
// -----
// -----
module {
  func.func @group_non_uniform_all(%arg0: i1) -> i1 {
    %0 = spirv.GroupNonUniformAll <Subgroup> %arg0 : i1
    return %0 : i1
  }
}

// -----
// -----
module {
  func.func @group_non_uniform_any(%arg0: i1) -> i1 {
    %0 = spirv.GroupNonUniformAny <Subgroup> %arg0 : i1
    return %0 : i1
  }
}

// -----
// -----
module {
  func.func @group_non_uniform_all_equal(%arg0: f32) -> i1 {
    %0 = spirv.GroupNonUniformAllEqual <Subgroup> %arg0 : f32, i1
    return %0 : i1
  }
}

// -----
module {
  func.func @group_non_uniform_all_equal(%arg0: vector<4xi32>) -> i1 {
    %0 = spirv.GroupNonUniformAllEqual <Subgroup> %arg0 : vector<4xi32>, i1
    return %0 : i1
  }
}

// -----
// -----
module {
  func.func @group_non_uniform_quad_swap(%arg0: f32) -> f32 {
    %cst0_i32 = spirv.Constant 0 : i32
    %0 = spirv.GroupNonUniformQuadSwap <Subgroup> %arg0 %cst0_i32 : f32, i32
    return %0 : f32
  }
}

// -----
module {
  func.func @group_non_uniform_quad_swap(%arg0: vector<4xf32>) -> vector<4xf32> {
    %cst0_i32 = spirv.Constant 0 : i32
    %0 = spirv.GroupNonUniformQuadSwap <Subgroup> %arg0 %cst0_i32 : vector<4xf32>, i32
    return %0 : vector<4xf32>
  }
}

// -----
// -----
// -----
