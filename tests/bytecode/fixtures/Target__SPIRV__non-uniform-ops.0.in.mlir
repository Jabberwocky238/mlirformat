"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.3, [Shader, Linkage, GroupNonUniformBallot, GroupNonUniformArithmetic, GroupNonUniformClustered, GroupNonUniformShuffle, GroupNonUniformShuffleRelative, GroupNonUniformVote, GroupNonUniformQuad], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i1) -> vector<4xi32>, sym_name = "group_non_uniform_ballot"}> ({
    ^bb0(%arg26: i1 loc("<stdin>":4:10)):
      %25 = "spirv.GroupNonUniformBallot"(%arg26) <{execution_scope = #spirv.scope<Workgroup>}> : (i1) -> vector<4xi32> loc("<stdin>":5:13)
      "spirv.ReturnValue"(%25) : (vector<4xi32>) -> () loc("<stdin>":6:7)
    }) : () -> () loc("<stdin>":3:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> f32, sym_name = "group_non_uniform_broadcast"}> ({
    ^bb0(%arg25: f32 loc("<stdin>":9:10)):
      %23 = "spirv.Constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":10:13)
      %24 = "spirv.GroupNonUniformBroadcast"(%arg25, %23) <{execution_scope = #spirv.scope<Subgroup>}> : (f32, i32) -> f32 loc("<stdin>":11:13)
      "spirv.ReturnValue"(%24) : (f32) -> () loc("<stdin>":12:7)
    }) : () -> () loc("<stdin>":8:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> f32, sym_name = "group_non_uniform_broadcast_first"}> ({
    ^bb0(%arg24: f32 loc("<stdin>":15:10)):
      %22 = "spirv.GroupNonUniformBroadcastFirst"(%arg24) <{execution_scope = #spirv.scope<Subgroup>}> : (f32) -> f32 loc("<stdin>":16:13)
      "spirv.ReturnValue"(%22) : (f32) -> () loc("<stdin>":17:7)
    }) : () -> () loc("<stdin>":14:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> i1, sym_name = "group_non_uniform_elect"}> ({
      %21 = "spirv.GroupNonUniformElect"() <{execution_scope = #spirv.scope<Workgroup>}> : () -> i1 loc("<stdin>":20:13)
      "spirv.ReturnValue"(%21) : (i1) -> () loc("<stdin>":21:7)
    }) : () -> () loc("<stdin>":19:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> f32, sym_name = "group_non_uniform_fadd_reduce"}> ({
    ^bb0(%arg23: f32 loc("<stdin>":24:10)):
      %20 = "spirv.GroupNonUniformFAdd"(%arg23) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (f32) -> f32 loc("<stdin>":25:13)
      "spirv.ReturnValue"(%20) : (f32) -> () loc("<stdin>":26:7)
    }) : () -> () loc("<stdin>":23:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> f32, sym_name = "group_non_uniform_fmax_reduce"}> ({
    ^bb0(%arg22: f32 loc("<stdin>":29:10)):
      %19 = "spirv.GroupNonUniformFMax"(%arg22) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (f32) -> f32 loc("<stdin>":30:13)
      "spirv.ReturnValue"(%19) : (f32) -> () loc("<stdin>":31:7)
    }) : () -> () loc("<stdin>":28:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> f32, sym_name = "group_non_uniform_fmin_reduce"}> ({
    ^bb0(%arg21: f32 loc("<stdin>":34:10)):
      %18 = "spirv.GroupNonUniformFMin"(%arg21) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (f32) -> f32 loc("<stdin>":35:13)
      "spirv.ReturnValue"(%18) : (f32) -> () loc("<stdin>":36:7)
    }) : () -> () loc("<stdin>":33:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> f32, sym_name = "group_non_uniform_fmul_reduce"}> ({
    ^bb0(%arg20: f32 loc("<stdin>":39:10)):
      %17 = "spirv.GroupNonUniformFMul"(%arg20) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (f32) -> f32 loc("<stdin>":40:13)
      "spirv.ReturnValue"(%17) : (f32) -> () loc("<stdin>":41:7)
    }) : () -> () loc("<stdin>":38:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "group_non_uniform_iadd_reduce"}> ({
    ^bb0(%arg19: i32 loc("<stdin>":44:10)):
      %16 = "spirv.GroupNonUniformIAdd"(%arg19) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i32) -> i32 loc("<stdin>":45:13)
      "spirv.ReturnValue"(%16) : (i32) -> () loc("<stdin>":46:7)
    }) : () -> () loc("<stdin>":43:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<2xi32>) -> vector<2xi32>, sym_name = "group_non_uniform_iadd_clustered_reduce"}> ({
    ^bb0(%arg18: vector<2xi32> loc("<stdin>":49:10)):
      %14 = "spirv.Constant"() <{value = 4 : i32}> : () -> i32 loc("<stdin>":50:13)
      %15 = "spirv.GroupNonUniformIAdd"(%arg18, %14) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<ClusteredReduce>}> : (vector<2xi32>, i32) -> vector<2xi32> loc("<stdin>":51:13)
      "spirv.ReturnValue"(%15) : (vector<2xi32>) -> () loc("<stdin>":52:7)
    }) : () -> () loc("<stdin>":48:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "group_non_uniform_imul_reduce"}> ({
    ^bb0(%arg17: i32 loc("<stdin>":55:10)):
      %13 = "spirv.GroupNonUniformIMul"(%arg17) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i32) -> i32 loc("<stdin>":56:13)
      "spirv.ReturnValue"(%13) : (i32) -> () loc("<stdin>":57:7)
    }) : () -> () loc("<stdin>":54:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "group_non_uniform_smax_reduce"}> ({
    ^bb0(%arg16: i32 loc("<stdin>":60:10)):
      %12 = "spirv.GroupNonUniformSMax"(%arg16) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i32) -> i32 loc("<stdin>":61:13)
      "spirv.ReturnValue"(%12) : (i32) -> () loc("<stdin>":62:7)
    }) : () -> () loc("<stdin>":59:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "group_non_uniform_smin_reduce"}> ({
    ^bb0(%arg15: i32 loc("<stdin>":65:10)):
      %11 = "spirv.GroupNonUniformSMin"(%arg15) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i32) -> i32 loc("<stdin>":66:13)
      "spirv.ReturnValue"(%11) : (i32) -> () loc("<stdin>":67:7)
    }) : () -> () loc("<stdin>":64:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "group_non_uniform_umax_reduce"}> ({
    ^bb0(%arg14: i32 loc("<stdin>":70:10)):
      %10 = "spirv.GroupNonUniformUMax"(%arg14) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i32) -> i32 loc("<stdin>":71:13)
      "spirv.ReturnValue"(%10) : (i32) -> () loc("<stdin>":72:7)
    }) : () -> () loc("<stdin>":69:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "group_non_uniform_umin_reduce"}> ({
    ^bb0(%arg13: i32 loc("<stdin>":75:10)):
      %9 = "spirv.GroupNonUniformUMin"(%arg13) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i32) -> i32 loc("<stdin>":76:12)
      "spirv.ReturnValue"(%9) : (i32) -> () loc("<stdin>":77:7)
    }) : () -> () loc("<stdin>":74:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32, i32) -> f32, sym_name = "group_non_uniform_shuffle"}> ({
    ^bb0(%arg11: f32 loc("<stdin>":80:10), %arg12: i32 loc("<stdin>":80:23)):
      %8 = "spirv.GroupNonUniformShuffle"(%arg11, %arg12) <{execution_scope = #spirv.scope<Subgroup>}> : (f32, i32) -> f32 loc("<stdin>":81:12)
      "spirv.ReturnValue"(%8) : (f32) -> () loc("<stdin>":82:7)
    }) : () -> () loc("<stdin>":79:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32, i32) -> f32, sym_name = "group_non_uniform_shuffle_up"}> ({
    ^bb0(%arg9: f32 loc("<stdin>":85:10), %arg10: i32 loc("<stdin>":85:22)):
      %7 = "spirv.GroupNonUniformShuffleUp"(%arg9, %arg10) <{execution_scope = #spirv.scope<Subgroup>}> : (f32, i32) -> f32 loc("<stdin>":86:12)
      "spirv.ReturnValue"(%7) : (f32) -> () loc("<stdin>":87:7)
    }) : () -> () loc("<stdin>":84:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32, i32) -> f32, sym_name = "group_non_uniform_shuffle_down"}> ({
    ^bb0(%arg7: f32 loc("<stdin>":90:10), %arg8: i32 loc("<stdin>":90:22)):
      %6 = "spirv.GroupNonUniformShuffleDown"(%arg7, %arg8) <{execution_scope = #spirv.scope<Subgroup>}> : (f32, i32) -> f32 loc("<stdin>":91:12)
      "spirv.ReturnValue"(%6) : (f32) -> () loc("<stdin>":92:7)
    }) : () -> () loc("<stdin>":89:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32, i32) -> f32, sym_name = "group_non_uniform_shuffle_xor"}> ({
    ^bb0(%arg5: f32 loc("<stdin>":95:10), %arg6: i32 loc("<stdin>":95:22)):
      %5 = "spirv.GroupNonUniformShuffleXor"(%arg5, %arg6) <{execution_scope = #spirv.scope<Subgroup>}> : (f32, i32) -> f32 loc("<stdin>":96:12)
      "spirv.ReturnValue"(%5) : (f32) -> () loc("<stdin>":97:7)
    }) : () -> () loc("<stdin>":94:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i1) -> i1, sym_name = "group_non_uniform_all"}> ({
    ^bb0(%arg4: i1 loc("<stdin>":100:10)):
      %4 = "spirv.GroupNonUniformAll"(%arg4) <{execution_scope = #spirv.scope<Subgroup>}> : (i1) -> i1 loc("<stdin>":101:12)
      "spirv.ReturnValue"(%4) : (i1) -> () loc("<stdin>":102:7)
    }) : () -> () loc("<stdin>":99:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i1) -> i1, sym_name = "group_non_uniform_any"}> ({
    ^bb0(%arg3: i1 loc("<stdin>":105:10)):
      %3 = "spirv.GroupNonUniformAny"(%arg3) <{execution_scope = #spirv.scope<Subgroup>}> : (i1) -> i1 loc("<stdin>":106:12)
      "spirv.ReturnValue"(%3) : (i1) -> () loc("<stdin>":107:7)
    }) : () -> () loc("<stdin>":104:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi32>) -> i1, sym_name = "group_non_uniform_all_equal"}> ({
    ^bb0(%arg2: vector<4xi32> loc("<stdin>":110:10)):
      %2 = "spirv.GroupNonUniformAllEqual"(%arg2) <{execution_scope = #spirv.scope<Subgroup>}> : (vector<4xi32>) -> i1 loc("<stdin>":111:12)
      "spirv.ReturnValue"(%2) : (i1) -> () loc("<stdin>":112:7)
    }) : () -> () loc("<stdin>":109:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xf32>) -> vector<4xf32>, sym_name = "group_non_uniform_quad_swap_vec"}> ({
    ^bb0(%arg1: vector<4xf32> loc("<stdin>":115:10)):
      %1 = "spirv.GroupNonUniformQuadSwap"(%arg1) <{direction = #spirv.quad_swap_direction<Vertical>, execution_scope = #spirv.scope<Subgroup>}> : (vector<4xf32>) -> vector<4xf32> loc("<stdin>":116:12)
      "spirv.ReturnValue"(%1) : (vector<4xf32>) -> () loc("<stdin>":117:7)
    }) : () -> () loc("<stdin>":114:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> f32, sym_name = "group_non_uniform_quad_swap_scalar"}> ({
    ^bb0(%arg0: f32 loc("<stdin>":120:10)):
      %0 = "spirv.GroupNonUniformQuadSwap"(%arg0) <{direction = #spirv.quad_swap_direction<Horizontal>, execution_scope = #spirv.scope<Subgroup>}> : (f32) -> f32 loc("<stdin>":121:12)
      "spirv.ReturnValue"(%0) : (f32) -> () loc("<stdin>":122:7)
    }) : () -> () loc("<stdin>":119:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
