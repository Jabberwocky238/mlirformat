module {
  func.func @subgroup_ballot(%arg0: i1) -> vector<4xi32> {
    %0 = spirv.KHR.SubgroupBallot %arg0 : vector<4xi32>
    return %0 : vector<4xi32>
  }
}

// -----
module {
  func.func @group_broadcast_scalar(%arg0: f32, %arg1: i32) -> f32 {
    %0 = spirv.GroupBroadcast <Workgroup> %arg0, %arg1 : f32, i32
    return %0 : f32
  }
}

// -----
module {
  func.func @group_broadcast_scalar_vector(%arg0: f32, %arg1: vector<3xi32>) -> f32 {
    %0 = spirv.GroupBroadcast <Workgroup> %arg0, %arg1 : f32, vector<3xi32>
    return %0 : f32
  }
}

// -----
module {
  func.func @group_broadcast_vector(%arg0: vector<4xf32>, %arg1: vector<3xi32>) -> vector<4xf32> {
    %0 = spirv.GroupBroadcast <Subgroup> %arg0, %arg1 : vector<4xf32>, vector<3xi32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @subgroup_ballot(%arg0: i1) -> vector<4xi32> {
    %0 = spirv.KHR.SubgroupBallot %arg0 : vector<4xi32>
    return %0 : vector<4xi32>
  }
}

// -----
module {
  func.func @subgroup_block_read_intel(%arg0: !spirv.ptr<i32, StorageBuffer>) -> i32 {
    %0 = spirv.INTEL.SubgroupBlockRead %arg0 : !spirv.ptr<i32, StorageBuffer> -> i32
    return %0 : i32
  }
}

// -----
module {
  func.func @subgroup_block_read_intel_vector(%arg0: !spirv.ptr<i32, StorageBuffer>) -> vector<3xi32> {
    %0 = spirv.INTEL.SubgroupBlockRead %arg0 : !spirv.ptr<i32, StorageBuffer> -> vector<3xi32>
    return %0 : vector<3xi32>
  }
}

// -----
module {
  func.func @group_iadd(%arg0: i32) -> i32 {
    %0 = spirv.GroupIAdd <Workgroup> <Reduce> %arg0 : i32
    return %0 : i32
  }
}

// -----
module {
  func.func @group_fadd(%arg0: f32) -> f32 {
    %0 = spirv.GroupFAdd <Workgroup> <Reduce> %arg0 : f32
    return %0 : f32
  }
}

// -----
module {
  func.func @group_fmin(%arg0: f32) -> f32 {
    %0 = spirv.GroupFMin <Workgroup> <Reduce> %arg0 : f32
    return %0 : f32
  }
}

// -----
module {
  func.func @group_umin(%arg0: i32) -> i32 {
    %0 = spirv.GroupUMin <Workgroup> <Reduce> %arg0 : i32
    return %0 : i32
  }
}

// -----
module {
  func.func @group_smin(%arg0: i32) -> i32 {
    %0 = spirv.GroupSMin <Workgroup> <Reduce> %arg0 : i32
    return %0 : i32
  }
}

// -----
module {
  func.func @group_fmax(%arg0: f32) -> f32 {
    %0 = spirv.GroupFMax <Workgroup> <Reduce> %arg0 : f32
    return %0 : f32
  }
}

// -----
module {
  func.func @group_umax(%arg0: i32) -> i32 {
    %0 = spirv.GroupUMax <Workgroup> <Reduce> %arg0 : i32
    return %0 : i32
  }
}

// -----
module {
  func.func @group_smax(%arg0: i32) -> i32 {
    %0 = spirv.GroupSMax <Workgroup> <Reduce> %arg0 : i32
    return %0 : i32
  }
}

// -----
module {
  func.func @group_imul(%arg0: i32) -> i32 {
    %0 = spirv.KHR.GroupIMul <Workgroup> <Reduce> %arg0 : i32
    return %0 : i32
  }
}

// -----
module {
  func.func @group_fmul(%arg0: f32) -> f32 {
    %0 = spirv.KHR.GroupFMul <Workgroup> <Reduce> %arg0 : f32
    return %0 : f32
  }
}

