"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.3, [Shader, Linkage, SubgroupBallotKHR, Groups, GroupNonUniformArithmetic, GroupUniformArithmeticKHR], [SPV_KHR_storage_buffer_storage_class, SPV_KHR_shader_ballot, SPV_KHR_uniform_group_instructions]>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i1) -> vector<4xi32>, sym_name = "subgroup_ballot"}> ({
    ^bb0(%arg14: i1 loc("<stdin>":4:10)):
      %12 = "spirv.KHR.SubgroupBallot"(%arg14) : (i1) -> vector<4xi32> loc("<stdin>":5:13)
      "spirv.ReturnValue"(%12) : (vector<4xi32>) -> () loc("<stdin>":6:7)
    }) : () -> () loc("<stdin>":3:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32, i32) -> f32, sym_name = "group_broadcast_1"}> ({
    ^bb0(%arg12: f32 loc("<stdin>":9:10), %arg13: i32 loc("<stdin>":9:23)):
      %11 = "spirv.GroupBroadcast"(%arg12, %arg13) <{execution_scope = #spirv.scope<Workgroup>}> : (f32, i32) -> f32 loc("<stdin>":10:13)
      "spirv.ReturnValue"(%11) : (f32) -> () loc("<stdin>":11:7)
    }) : () -> () loc("<stdin>":8:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32, vector<3xi32>) -> f32, sym_name = "group_broadcast_2"}> ({
    ^bb0(%arg10: f32 loc("<stdin>":14:10), %arg11: vector<3xi32> loc("<stdin>":14:23)):
      %10 = "spirv.GroupBroadcast"(%arg10, %arg11) <{execution_scope = #spirv.scope<Workgroup>}> : (f32, vector<3xi32>) -> f32 loc("<stdin>":15:13)
      "spirv.ReturnValue"(%10) : (f32) -> () loc("<stdin>":16:7)
    }) : () -> () loc("<stdin>":13:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "group_iadd"}> ({
    ^bb0(%arg9: i32 loc("<stdin>":19:10)):
      %9 = "spirv.GroupIAdd"(%arg9) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i32) -> i32 loc("<stdin>":20:12)
      "spirv.ReturnValue"(%9) : (i32) -> () loc("<stdin>":21:7)
    }) : () -> () loc("<stdin>":18:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> f32, sym_name = "group_fadd"}> ({
    ^bb0(%arg8: f32 loc("<stdin>":24:10)):
      %8 = "spirv.GroupFAdd"(%arg8) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (f32) -> f32 loc("<stdin>":25:12)
      "spirv.ReturnValue"(%8) : (f32) -> () loc("<stdin>":26:7)
    }) : () -> () loc("<stdin>":23:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> f32, sym_name = "group_fmin"}> ({
    ^bb0(%arg7: f32 loc("<stdin>":29:10)):
      %7 = "spirv.GroupFMin"(%arg7) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (f32) -> f32 loc("<stdin>":30:12)
      "spirv.ReturnValue"(%7) : (f32) -> () loc("<stdin>":31:7)
    }) : () -> () loc("<stdin>":28:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "group_umin"}> ({
    ^bb0(%arg6: i32 loc("<stdin>":34:10)):
      %6 = "spirv.GroupUMin"(%arg6) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i32) -> i32 loc("<stdin>":35:12)
      "spirv.ReturnValue"(%6) : (i32) -> () loc("<stdin>":36:7)
    }) : () -> () loc("<stdin>":33:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "group_smin"}> ({
    ^bb0(%arg5: i32 loc("<stdin>":39:10)):
      %5 = "spirv.GroupSMin"(%arg5) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i32) -> i32 loc("<stdin>":40:12)
      "spirv.ReturnValue"(%5) : (i32) -> () loc("<stdin>":41:7)
    }) : () -> () loc("<stdin>":38:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> f32, sym_name = "group_fmax"}> ({
    ^bb0(%arg4: f32 loc("<stdin>":44:10)):
      %4 = "spirv.GroupFMax"(%arg4) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (f32) -> f32 loc("<stdin>":45:12)
      "spirv.ReturnValue"(%4) : (f32) -> () loc("<stdin>":46:7)
    }) : () -> () loc("<stdin>":43:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "group_umax"}> ({
    ^bb0(%arg3: i32 loc("<stdin>":49:10)):
      %3 = "spirv.GroupUMax"(%arg3) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i32) -> i32 loc("<stdin>":50:12)
      "spirv.ReturnValue"(%3) : (i32) -> () loc("<stdin>":51:7)
    }) : () -> () loc("<stdin>":48:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "group_smax"}> ({
    ^bb0(%arg2: i32 loc("<stdin>":54:10)):
      %2 = "spirv.GroupSMax"(%arg2) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i32) -> i32 loc("<stdin>":55:12)
      "spirv.ReturnValue"(%2) : (i32) -> () loc("<stdin>":56:7)
    }) : () -> () loc("<stdin>":53:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "group_imul"}> ({
    ^bb0(%arg1: i32 loc("<stdin>":59:10)):
      %1 = "spirv.KHR.GroupIMul"(%arg1) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i32) -> i32 loc("<stdin>":60:12)
      "spirv.ReturnValue"(%1) : (i32) -> () loc("<stdin>":61:7)
    }) : () -> () loc("<stdin>":58:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> f32, sym_name = "group_fmul"}> ({
    ^bb0(%arg0: f32 loc("<stdin>":64:10)):
      %0 = "spirv.KHR.GroupFMul"(%arg0) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (f32) -> f32 loc("<stdin>":65:12)
      "spirv.ReturnValue"(%0) : (f32) -> () loc("<stdin>":66:7)
    }) : () -> () loc("<stdin>":63:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
