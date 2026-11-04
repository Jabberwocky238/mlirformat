module {
  spirv.func @group_reduce_iadd(%arg0: i32) -> i32 "None" {
    %0 = spirv.GroupIAdd <Workgroup> <Reduce> %arg0 : i32
    spirv.ReturnValue %0 : i32
  }
  spirv.func @group_reduce_fadd(%arg0: f32) -> f32 "None" {
    %0 = spirv.GroupFAdd <Workgroup> <Reduce> %arg0 : f32
    spirv.ReturnValue %0 : f32
  }
  spirv.func @group_reduce_fmin(%arg0: f32) -> f32 "None" {
    %0 = spirv.GroupFMin <Workgroup> <Reduce> %arg0 : f32
    spirv.ReturnValue %0 : f32
  }
  spirv.func @group_reduce_umin(%arg0: i32) -> i32 "None" {
    %0 = spirv.GroupUMin <Workgroup> <Reduce> %arg0 : i32
    spirv.ReturnValue %0 : i32
  }
  spirv.func @group_reduce_smin(%arg0: i32) -> i32 "None" {
    %0 = spirv.GroupSMin <Workgroup> <Reduce> %arg0 : i32
    spirv.ReturnValue %0 : i32
  }
  spirv.func @group_reduce_fmax(%arg0: f32) -> f32 "None" {
    %0 = spirv.GroupFMax <Workgroup> <Reduce> %arg0 : f32
    spirv.ReturnValue %0 : f32
  }
  spirv.func @group_reduce_umax(%arg0: i32) -> i32 "None" {
    %0 = spirv.GroupUMax <Workgroup> <Reduce> %arg0 : i32
    spirv.ReturnValue %0 : i32
  }
  spirv.func @group_reduce_smax(%arg0: i32) -> i32 "None" {
    %0 = spirv.GroupSMax <Workgroup> <Reduce> %arg0 : i32
    spirv.ReturnValue %0 : i32
  }
  spirv.func @group_inclusive_scan_iadd(%arg0: i32) -> i32 "None" {
    %0 = spirv.GroupIAdd <Workgroup> <InclusiveScan> %arg0 : i32
    spirv.ReturnValue %0 : i32
  }
  spirv.func @group_inclusive_scan_fadd(%arg0: f32) -> f32 "None" {
    %0 = spirv.GroupFAdd <Workgroup> <InclusiveScan> %arg0 : f32
    spirv.ReturnValue %0 : f32
  }
  spirv.func @group_inclusive_scan_fmin(%arg0: f32) -> f32 "None" {
    %0 = spirv.GroupFMin <Workgroup> <InclusiveScan> %arg0 : f32
    spirv.ReturnValue %0 : f32
  }
  spirv.func @group_inclusive_scan_umin(%arg0: i32) -> i32 "None" {
    %0 = spirv.GroupUMin <Workgroup> <InclusiveScan> %arg0 : i32
    spirv.ReturnValue %0 : i32
  }
  spirv.func @group_inclusive_scan_smin(%arg0: i32) -> i32 "None" {
    %0 = spirv.GroupSMin <Workgroup> <InclusiveScan> %arg0 : i32
    spirv.ReturnValue %0 : i32
  }
  spirv.func @group_inclusive_scan_fmax(%arg0: f32) -> f32 "None" {
    %0 = spirv.GroupFMax <Workgroup> <InclusiveScan> %arg0 : f32
    spirv.ReturnValue %0 : f32
  }
  spirv.func @group_inclusive_scan_umax(%arg0: i32) -> i32 "None" {
    %0 = spirv.GroupUMax <Workgroup> <InclusiveScan> %arg0 : i32
    spirv.ReturnValue %0 : i32
  }
  spirv.func @group_inclusive_scan_smax(%arg0: i32) -> i32 "None" {
    %0 = spirv.GroupSMax <Workgroup> <ExclusiveScan> %arg0 : i32
    spirv.ReturnValue %0 : i32
  }
  spirv.func @group_exclusive_scan_iadd(%arg0: i32) -> i32 "None" {
    %0 = spirv.GroupIAdd <Workgroup> <ExclusiveScan> %arg0 : i32
    spirv.ReturnValue %0 : i32
  }
  spirv.func @group_exclusive_scan_fadd(%arg0: f32) -> f32 "None" {
    %0 = spirv.GroupFAdd <Workgroup> <ExclusiveScan> %arg0 : f32
    spirv.ReturnValue %0 : f32
  }
  spirv.func @group_exclusive_scan_fmin(%arg0: f32) -> f32 "None" {
    %0 = spirv.GroupFMin <Workgroup> <ExclusiveScan> %arg0 : f32
    spirv.ReturnValue %0 : f32
  }
  spirv.func @group_exclusive_scan_umin(%arg0: i32) -> i32 "None" {
    %0 = spirv.GroupUMin <Workgroup> <ExclusiveScan> %arg0 : i32
    spirv.ReturnValue %0 : i32
  }
  spirv.func @group_exclusive_scan_smin(%arg0: i32) -> i32 "None" {
    %0 = spirv.GroupSMin <Workgroup> <ExclusiveScan> %arg0 : i32
    spirv.ReturnValue %0 : i32
  }
  spirv.func @group_exclusive_scan_fmax(%arg0: f32) -> f32 "None" {
    %0 = spirv.GroupFMax <Workgroup> <ExclusiveScan> %arg0 : f32
    spirv.ReturnValue %0 : f32
  }
  spirv.func @group_exclusive_scan_umax(%arg0: i32) -> i32 "None" {
    %0 = spirv.GroupUMax <Workgroup> <ExclusiveScan> %arg0 : i32
    spirv.ReturnValue %0 : i32
  }
  spirv.func @group_exclusive_scan_smax(%arg0: i32) -> i32 "None" {
    %0 = spirv.GroupSMax <Workgroup> <ExclusiveScan> %arg0 : i32
    spirv.ReturnValue %0 : i32
  }
  spirv.func @subgroup_exclusive_scan_smax(%arg0: i32) -> i32 "None" {
    %0 = spirv.GroupSMax <Subgroup> <ExclusiveScan> %arg0 : i32
    spirv.ReturnValue %0 : i32
  }
}

