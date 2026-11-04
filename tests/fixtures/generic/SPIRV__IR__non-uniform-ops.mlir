"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> vector<4xi32>, sym_name = "group_non_uniform_ballot"}> ({
  ^bb0(%arg0: i1):
    %0 = "spirv.GroupNonUniformBallot"(%arg0) <{execution_scope = #spirv.scope<Workgroup>}> : (i1) -> vector<4xi32>
    "func.return"(%0) : (vector<4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xi32>) -> i32, sym_name = "group_non_uniform_ballot_find_lsb"}> ({
  ^bb0(%arg0: vector<4xi32>):
    %0 = "spirv.GroupNonUniformBallotFindLSB"(%arg0) <{execution_scope = #spirv.scope<Subgroup>}> : (vector<4xi32>) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xi32>) -> i32, sym_name = "group_non_uniform_ballot_find_msb"}> ({
  ^bb0(%arg0: vector<4xi32>):
    %0 = "spirv.GroupNonUniformBallotFindMSB"(%arg0) <{execution_scope = #spirv.scope<Subgroup>}> : (vector<4xi32>) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "group_non_uniform_broadcast_scalar"}> ({
  ^bb0(%arg0: f32):
    %0 = "spirv.Constant"() <{value = 1 : i32}> : () -> i32
    %1 = "spirv.GroupNonUniformBroadcast"(%arg0, %0) <{execution_scope = #spirv.scope<Workgroup>}> : (f32, i32) -> f32
    "func.return"(%1) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf32>) -> vector<4xf32>, sym_name = "group_non_uniform_broadcast_vector"}> ({
  ^bb0(%arg0: vector<4xf32>):
    %0 = "spirv.Constant"() <{value = 1 : i32}> : () -> i32
    %1 = "spirv.GroupNonUniformBroadcast"(%arg0, %0) <{execution_scope = #spirv.scope<Subgroup>}> : (vector<4xf32>, i32) -> vector<4xf32>
    "func.return"(%1) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> i1, sym_name = "group_non_uniform_elect"}> ({
    %0 = "spirv.GroupNonUniformElect"() <{execution_scope = #spirv.scope<Workgroup>}> : () -> i1
    "func.return"(%0) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "group_non_uniform_fadd_reduce"}> ({
  ^bb0(%arg3: f32):
    %5 = "spirv.GroupNonUniformFAdd"(%arg3) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (f32) -> f32
    "func.return"(%5) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf32>) -> vector<2xf32>, sym_name = "group_non_uniform_fadd_clustered_reduce"}> ({
  ^bb0(%arg2: vector<2xf32>):
    %3 = "spirv.Constant"() <{value = 4 : i32}> : () -> i32
    %4 = "spirv.GroupNonUniformFAdd"(%arg2, %3) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<ClusteredReduce>}> : (vector<2xf32>, i32) -> vector<2xf32>
    "func.return"(%4) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> f32, sym_name = "group_non_uniform_fmul_reduce"}> ({
  ^bb0(%arg1: f32):
    %2 = "spirv.GroupNonUniformFMul"(%arg1) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (f32) -> f32
    "func.return"(%2) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf32>) -> vector<2xf32>, sym_name = "group_non_uniform_fmul_clustered_reduce"}> ({
  ^bb0(%arg0: vector<2xf32>):
    %0 = "spirv.Constant"() <{value = 4 : i32}> : () -> i32
    %1 = "spirv.GroupNonUniformFMul"(%arg0, %0) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<ClusteredReduce>}> : (vector<2xf32>, i32) -> vector<2xf32>
    "func.return"(%1) : (vector<2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "group_non_uniform_fmax_reduce"}> ({
  ^bb0(%arg0: f32):
    %0 = "spirv.GroupNonUniformFMax"(%arg0) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (f32) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "group_non_uniform_fmin_reduce"}> ({
  ^bb0(%arg0: f32):
    %0 = "spirv.GroupNonUniformFMin"(%arg0) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (f32) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "group_non_uniform_iadd_reduce"}> ({
  ^bb0(%arg1: i32):
    %2 = "spirv.GroupNonUniformIAdd"(%arg1) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i32) -> i32
    "func.return"(%2) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xi32>) -> vector<2xi32>, sym_name = "group_non_uniform_iadd_clustered_reduce"}> ({
  ^bb0(%arg0: vector<2xi32>):
    %0 = "spirv.Constant"() <{value = 4 : i32}> : () -> i32
    %1 = "spirv.GroupNonUniformIAdd"(%arg0, %0) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<ClusteredReduce>}> : (vector<2xi32>, i32) -> vector<2xi32>
    "func.return"(%1) : (vector<2xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "group_non_uniform_imul_reduce"}> ({
  ^bb0(%arg1: i32):
    %2 = "spirv.GroupNonUniformIMul"(%arg1) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i32) -> i32
    "func.return"(%2) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xi32>) -> vector<2xi32>, sym_name = "group_non_uniform_imul_clustered_reduce"}> ({
  ^bb0(%arg0: vector<2xi32>):
    %0 = "spirv.Constant"() <{value = 4 : i32}> : () -> i32
    %1 = "spirv.GroupNonUniformIMul"(%arg0, %0) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<ClusteredReduce>}> : (vector<2xi32>, i32) -> vector<2xi32>
    "func.return"(%1) : (vector<2xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "group_non_uniform_smax_reduce"}> ({
  ^bb0(%arg0: i32):
    %0 = "spirv.GroupNonUniformSMax"(%arg0) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "group_non_uniform_smin_reduce"}> ({
  ^bb0(%arg0: i32):
    %0 = "spirv.GroupNonUniformSMin"(%arg0) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, i32) -> f32, sym_name = "group_non_uniform_shuffle1"}> ({
  ^bb0(%arg2: f32, %arg3: i32):
    %1 = "spirv.GroupNonUniformShuffle"(%arg2, %arg3) <{execution_scope = #spirv.scope<Subgroup>}> : (f32, i32) -> f32
    "func.return"(%1) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf32>, i32) -> vector<2xf32>, sym_name = "group_non_uniform_shuffle2"}> ({
  ^bb0(%arg0: vector<2xf32>, %arg1: i32):
    %0 = "spirv.GroupNonUniformShuffle"(%arg0, %arg1) <{execution_scope = #spirv.scope<Subgroup>}> : (vector<2xf32>, i32) -> vector<2xf32>
    "func.return"(%0) : (vector<2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, i32) -> f32, sym_name = "group_non_uniform_shuffle1"}> ({
  ^bb0(%arg2: f32, %arg3: i32):
    %1 = "spirv.GroupNonUniformShuffleXor"(%arg2, %arg3) <{execution_scope = #spirv.scope<Subgroup>}> : (f32, i32) -> f32
    "func.return"(%1) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf32>, i32) -> vector<2xf32>, sym_name = "group_non_uniform_shuffle2"}> ({
  ^bb0(%arg0: vector<2xf32>, %arg1: i32):
    %0 = "spirv.GroupNonUniformShuffleXor"(%arg0, %arg1) <{execution_scope = #spirv.scope<Subgroup>}> : (vector<2xf32>, i32) -> vector<2xf32>
    "func.return"(%0) : (vector<2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, i32) -> f32, sym_name = "group_non_uniform_shuffle1"}> ({
  ^bb0(%arg2: f32, %arg3: i32):
    %1 = "spirv.GroupNonUniformShuffleUp"(%arg2, %arg3) <{execution_scope = #spirv.scope<Subgroup>}> : (f32, i32) -> f32
    "func.return"(%1) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf32>, i32) -> vector<2xf32>, sym_name = "group_non_uniform_shuffle2"}> ({
  ^bb0(%arg0: vector<2xf32>, %arg1: i32):
    %0 = "spirv.GroupNonUniformShuffleUp"(%arg0, %arg1) <{execution_scope = #spirv.scope<Subgroup>}> : (vector<2xf32>, i32) -> vector<2xf32>
    "func.return"(%0) : (vector<2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, i32) -> f32, sym_name = "group_non_uniform_shuffle1"}> ({
  ^bb0(%arg2: f32, %arg3: i32):
    %1 = "spirv.GroupNonUniformShuffleDown"(%arg2, %arg3) <{execution_scope = #spirv.scope<Subgroup>}> : (f32, i32) -> f32
    "func.return"(%1) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf32>, i32) -> vector<2xf32>, sym_name = "group_non_uniform_shuffle2"}> ({
  ^bb0(%arg0: vector<2xf32>, %arg1: i32):
    %0 = "spirv.GroupNonUniformShuffleDown"(%arg0, %arg1) <{execution_scope = #spirv.scope<Subgroup>}> : (vector<2xf32>, i32) -> vector<2xf32>
    "func.return"(%0) : (vector<2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "group_non_uniform_umax_reduce"}> ({
  ^bb0(%arg0: i32):
    %0 = "spirv.GroupNonUniformUMax"(%arg0) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "group_non_uniform_umin_reduce"}> ({
  ^bb0(%arg0: i32):
    %0 = "spirv.GroupNonUniformUMin"(%arg0) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "group_non_uniform_bitwise_and"}> ({
  ^bb0(%arg0: i32):
    %0 = "spirv.GroupNonUniformBitwiseAnd"(%arg0) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "group_non_uniform_bitwise_or"}> ({
  ^bb0(%arg0: i32):
    %0 = "spirv.GroupNonUniformBitwiseOr"(%arg0) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "group_non_uniform_bitwise_xor"}> ({
  ^bb0(%arg0: i32):
    %0 = "spirv.GroupNonUniformBitwiseXor"(%arg0) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> i1, sym_name = "group_non_uniform_logical_and"}> ({
  ^bb0(%arg0: i1):
    %0 = "spirv.GroupNonUniformLogicalAnd"(%arg0) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i1) -> i1
    "func.return"(%0) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> i1, sym_name = "group_non_uniform_logical_or"}> ({
  ^bb0(%arg0: i1):
    %0 = "spirv.GroupNonUniformLogicalOr"(%arg0) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i1) -> i1
    "func.return"(%0) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> i1, sym_name = "group_non_uniform_logical_xor"}> ({
  ^bb0(%arg0: i1):
    %0 = "spirv.GroupNonUniformLogicalXor"(%arg0) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i1) -> i1
    "func.return"(%0) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, i32) -> f32, sym_name = "group_non_uniform_rotate_khr"}> ({
  ^bb0(%arg0: f32, %arg1: i32):
    %0 = "spirv.GroupNonUniformRotateKHR"(%arg0, %arg1) <{execution_scope = #spirv.scope<Subgroup>}> : (f32, i32) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, i32) -> f32, sym_name = "group_non_uniform_rotate_khr"}> ({
  ^bb0(%arg0: f32, %arg1: i32):
    %0 = "spirv.Constant"() <{value = 4 : i32}> : () -> i32
    %1 = "spirv.GroupNonUniformRotateKHR"(%arg0, %arg1, %0) <{execution_scope = #spirv.scope<Workgroup>}> : (f32, i32, i32) -> f32
    "func.return"(%1) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> i1, sym_name = "group_non_uniform_all"}> ({
  ^bb0(%arg0: i1):
    %0 = "spirv.GroupNonUniformAll"(%arg0) <{execution_scope = #spirv.scope<Subgroup>}> : (i1) -> i1
    "func.return"(%0) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> i1, sym_name = "group_non_uniform_any"}> ({
  ^bb0(%arg0: i1):
    %0 = "spirv.GroupNonUniformAny"(%arg0) <{execution_scope = #spirv.scope<Subgroup>}> : (i1) -> i1
    "func.return"(%0) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> i1, sym_name = "group_non_uniform_all_equal"}> ({
  ^bb0(%arg0: f32):
    %0 = "spirv.GroupNonUniformAllEqual"(%arg0) <{execution_scope = #spirv.scope<Subgroup>}> : (f32) -> i1
    "func.return"(%0) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xi32>) -> i1, sym_name = "group_non_uniform_all_equal"}> ({
  ^bb0(%arg0: vector<4xi32>):
    %0 = "spirv.GroupNonUniformAllEqual"(%arg0) <{execution_scope = #spirv.scope<Subgroup>}> : (vector<4xi32>) -> i1
    "func.return"(%0) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "group_non_uniform_quad_swap"}> ({
  ^bb0(%arg0: f32):
    %0 = "spirv.Constant"() <{value = 0 : i32}> : () -> i32
    %1 = "spirv.GroupNonUniformQuadSwap"(%arg0, %0) <{execution_scope = #spirv.scope<Subgroup>}> : (f32, i32) -> f32
    "func.return"(%1) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf32>) -> vector<4xf32>, sym_name = "group_non_uniform_quad_swap"}> ({
  ^bb0(%arg0: vector<4xf32>):
    %0 = "spirv.Constant"() <{value = 0 : i32}> : () -> i32
    %1 = "spirv.GroupNonUniformQuadSwap"(%arg0, %0) <{execution_scope = #spirv.scope<Subgroup>}> : (vector<4xf32>, i32) -> vector<4xf32>
    "func.return"(%1) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
