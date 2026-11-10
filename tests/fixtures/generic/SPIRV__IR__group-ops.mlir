"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> vector<4xi32>, sym_name = "subgroup_ballot"}> ({
  ^bb0(%arg0: i1):
    %0 = "spirv.KHR.SubgroupBallot"(%arg0) : (i1) -> vector<4xi32>
    "func.return"(%0) : (vector<4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, i32) -> f32, sym_name = "group_broadcast_scalar"}> ({
  ^bb0(%arg0: f32, %arg1: i32):
    %0 = "spirv.GroupBroadcast"(%arg0, %arg1) <{execution_scope = #spirv.scope<Workgroup>}> : (f32, i32) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, vector<3xi32>) -> f32, sym_name = "group_broadcast_scalar_vector"}> ({
  ^bb0(%arg0: f32, %arg1: vector<3xi32>):
    %0 = "spirv.GroupBroadcast"(%arg0, %arg1) <{execution_scope = #spirv.scope<Workgroup>}> : (f32, vector<3xi32>) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf32>, vector<3xi32>) -> vector<4xf32>, sym_name = "group_broadcast_vector"}> ({
  ^bb0(%arg0: vector<4xf32>, %arg1: vector<3xi32>):
    %0 = "spirv.GroupBroadcast"(%arg0, %arg1) <{execution_scope = #spirv.scope<Subgroup>}> : (vector<4xf32>, vector<3xi32>) -> vector<4xf32>
    "func.return"(%0) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> vector<4xi32>, sym_name = "subgroup_ballot"}> ({
  ^bb0(%arg0: i1):
    %0 = "spirv.KHR.SubgroupBallot"(%arg0) : (i1) -> vector<4xi32>
    "func.return"(%0) : (vector<4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.ptr<i32, StorageBuffer>) -> i32, sym_name = "subgroup_block_read_intel"}> ({
  ^bb0(%arg0: !spirv.ptr<i32, StorageBuffer>):
    %0 = "spirv.INTEL.SubgroupBlockRead"(%arg0) : (!spirv.ptr<i32, StorageBuffer>) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.ptr<i32, StorageBuffer>) -> vector<3xi32>, sym_name = "subgroup_block_read_intel_vector"}> ({
  ^bb0(%arg0: !spirv.ptr<i32, StorageBuffer>):
    %0 = "spirv.INTEL.SubgroupBlockRead"(%arg0) : (!spirv.ptr<i32, StorageBuffer>) -> vector<3xi32>
    "func.return"(%0) : (vector<3xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "group_iadd"}> ({
  ^bb0(%arg0: i32):
    %0 = "spirv.GroupIAdd"(%arg0) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "group_fadd"}> ({
  ^bb0(%arg0: f32):
    %0 = "spirv.GroupFAdd"(%arg0) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (f32) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "group_fmin"}> ({
  ^bb0(%arg0: f32):
    %0 = "spirv.GroupFMin"(%arg0) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (f32) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "group_umin"}> ({
  ^bb0(%arg0: i32):
    %0 = "spirv.GroupUMin"(%arg0) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "group_smin"}> ({
  ^bb0(%arg0: i32):
    %0 = "spirv.GroupSMin"(%arg0) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "group_fmax"}> ({
  ^bb0(%arg0: f32):
    %0 = "spirv.GroupFMax"(%arg0) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (f32) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "group_umax"}> ({
  ^bb0(%arg0: i32):
    %0 = "spirv.GroupUMax"(%arg0) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "group_smax"}> ({
  ^bb0(%arg0: i32):
    %0 = "spirv.GroupSMax"(%arg0) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "group_imul"}> ({
  ^bb0(%arg0: i32):
    %0 = "spirv.KHR.GroupIMul"(%arg0) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "group_fmul"}> ({
  ^bb0(%arg0: f32):
    %0 = "spirv.KHR.GroupFMul"(%arg0) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (f32) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

