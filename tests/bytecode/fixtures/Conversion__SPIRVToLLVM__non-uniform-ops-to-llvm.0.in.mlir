"builtin.module"() ({
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "non_uniform_iadd"}> ({
  ^bb0(%arg17: i32 loc("<stdin>":3:8)):
    %21 = "spirv.GroupNonUniformIAdd"(%arg17) <{execution_scope = #spirv.scope<Subgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i32) -> i32 loc("<stdin>":4:11)
    "spirv.ReturnValue"(%21) : (i32) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> f32, sym_name = "non_uniform_fadd"}> ({
  ^bb0(%arg16: f32 loc("<stdin>":8:8)):
    %19 = "spirv.Constant"() <{value = 16 : i32}> : () -> i32 loc("<stdin>":9:11)
    %20 = "spirv.GroupNonUniformFAdd"(%arg16, %19) <{execution_scope = #spirv.scope<Subgroup>, group_operation = #spirv.group_operation<ClusteredReduce>}> : (f32, i32) -> f32 loc("<stdin>":10:11)
    "spirv.ReturnValue"(%20) : (f32) -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":7:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "non_uniform_imul"}> ({
  ^bb0(%arg15: i32 loc("<stdin>":14:8)):
    %17 = "spirv.Constant"() <{value = 16 : i32}> : () -> i32 loc("<stdin>":15:11)
    %18 = "spirv.GroupNonUniformIMul"(%arg15, %17) <{execution_scope = #spirv.scope<Subgroup>, group_operation = #spirv.group_operation<ClusteredReduce>}> : (i32, i32) -> i32 loc("<stdin>":16:11)
    "spirv.ReturnValue"(%18) : (i32) -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":13:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> f32, sym_name = "non_uniform_fmul"}> ({
  ^bb0(%arg14: f32 loc("<stdin>":20:8)):
    %16 = "spirv.GroupNonUniformFMul"(%arg14) <{execution_scope = #spirv.scope<Subgroup>, group_operation = #spirv.group_operation<Reduce>}> : (f32) -> f32 loc("<stdin>":21:11)
    "spirv.ReturnValue"(%16) : (f32) -> () loc("<stdin>":22:5)
  }) : () -> () loc("<stdin>":19:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "non_uniform_smin"}> ({
  ^bb0(%arg13: i32 loc("<stdin>":25:8)):
    %15 = "spirv.GroupNonUniformSMin"(%arg13) <{execution_scope = #spirv.scope<Subgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i32) -> i32 loc("<stdin>":26:11)
    "spirv.ReturnValue"(%15) : (i32) -> () loc("<stdin>":27:5)
  }) : () -> () loc("<stdin>":24:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "non_uniform_umin"}> ({
  ^bb0(%arg12: i32 loc("<stdin>":30:8)):
    %14 = "spirv.GroupNonUniformUMin"(%arg12) <{execution_scope = #spirv.scope<Subgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i32) -> i32 loc("<stdin>":31:11)
    "spirv.ReturnValue"(%14) : (i32) -> () loc("<stdin>":32:5)
  }) : () -> () loc("<stdin>":29:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> f32, sym_name = "non_uniform_fmin"}> ({
  ^bb0(%arg11: f32 loc("<stdin>":35:8)):
    %13 = "spirv.GroupNonUniformFMin"(%arg11) <{execution_scope = #spirv.scope<Subgroup>, group_operation = #spirv.group_operation<Reduce>}> : (f32) -> f32 loc("<stdin>":36:11)
    "spirv.ReturnValue"(%13) : (f32) -> () loc("<stdin>":37:5)
  }) : () -> () loc("<stdin>":34:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> f32, sym_name = "non_uniform_fmin_cluster"}> ({
  ^bb0(%arg10: f32 loc("<stdin>":40:8)):
    %11 = "spirv.Constant"() <{value = 16 : i32}> : () -> i32 loc("<stdin>":41:11)
    %12 = "spirv.GroupNonUniformFMin"(%arg10, %11) <{execution_scope = #spirv.scope<Subgroup>, group_operation = #spirv.group_operation<ClusteredReduce>}> : (f32, i32) -> f32 loc("<stdin>":42:11)
    "spirv.ReturnValue"(%12) : (f32) -> () loc("<stdin>":43:5)
  }) : () -> () loc("<stdin>":39:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "non_uniform_smax"}> ({
  ^bb0(%arg9: i32 loc("<stdin>":46:8)):
    %10 = "spirv.GroupNonUniformSMax"(%arg9) <{execution_scope = #spirv.scope<Subgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i32) -> i32 loc("<stdin>":47:11)
    "spirv.ReturnValue"(%10) : (i32) -> () loc("<stdin>":48:5)
  }) : () -> () loc("<stdin>":45:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "non_uniform_umax"}> ({
  ^bb0(%arg8: i32 loc("<stdin>":51:8)):
    %9 = "spirv.GroupNonUniformUMax"(%arg8) <{execution_scope = #spirv.scope<Subgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i32) -> i32 loc("<stdin>":52:10)
    "spirv.ReturnValue"(%9) : (i32) -> () loc("<stdin>":53:5)
  }) : () -> () loc("<stdin>":50:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> f32, sym_name = "non_uniform_fmax"}> ({
  ^bb0(%arg7: f32 loc("<stdin>":56:8)):
    %8 = "spirv.GroupNonUniformFMax"(%arg7) <{execution_scope = #spirv.scope<Subgroup>, group_operation = #spirv.group_operation<Reduce>}> : (f32) -> f32 loc("<stdin>":57:10)
    "spirv.ReturnValue"(%8) : (f32) -> () loc("<stdin>":58:5)
  }) : () -> () loc("<stdin>":55:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "non_uniform_smax_cluster"}> ({
  ^bb0(%arg6: i32 loc("<stdin>":61:8)):
    %6 = "spirv.Constant"() <{value = 16 : i32}> : () -> i32 loc("<stdin>":62:10)
    %7 = "spirv.GroupNonUniformSMax"(%arg6, %6) <{execution_scope = #spirv.scope<Subgroup>, group_operation = #spirv.group_operation<ClusteredReduce>}> : (i32, i32) -> i32 loc("<stdin>":63:10)
    "spirv.ReturnValue"(%7) : (i32) -> () loc("<stdin>":64:5)
  }) : () -> () loc("<stdin>":60:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "non_uniform_bitwise_and"}> ({
  ^bb0(%arg5: i32 loc("<stdin>":67:8)):
    %5 = "spirv.GroupNonUniformBitwiseAnd"(%arg5) <{execution_scope = #spirv.scope<Subgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i32) -> i32 loc("<stdin>":68:10)
    "spirv.ReturnValue"(%5) : (i32) -> () loc("<stdin>":69:5)
  }) : () -> () loc("<stdin>":66:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "non_uniform_bitwise_or"}> ({
  ^bb0(%arg4: i32 loc("<stdin>":72:8)):
    %4 = "spirv.GroupNonUniformBitwiseOr"(%arg4) <{execution_scope = #spirv.scope<Subgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i32) -> i32 loc("<stdin>":73:10)
    "spirv.ReturnValue"(%4) : (i32) -> () loc("<stdin>":74:5)
  }) : () -> () loc("<stdin>":71:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "non_uniform_bitwise_xor"}> ({
  ^bb0(%arg3: i32 loc("<stdin>":77:8)):
    %3 = "spirv.GroupNonUniformBitwiseXor"(%arg3) <{execution_scope = #spirv.scope<Subgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i32) -> i32 loc("<stdin>":78:10)
    "spirv.ReturnValue"(%3) : (i32) -> () loc("<stdin>":79:5)
  }) : () -> () loc("<stdin>":76:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i1) -> i1, sym_name = "non_uniform_logical_and"}> ({
  ^bb0(%arg2: i1 loc("<stdin>":82:8)):
    %2 = "spirv.GroupNonUniformLogicalAnd"(%arg2) <{execution_scope = #spirv.scope<Subgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i1) -> i1 loc("<stdin>":83:10)
    "spirv.ReturnValue"(%2) : (i1) -> () loc("<stdin>":84:5)
  }) : () -> () loc("<stdin>":81:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i1) -> i1, sym_name = "non_uniform_logical_or"}> ({
  ^bb0(%arg1: i1 loc("<stdin>":87:8)):
    %1 = "spirv.GroupNonUniformLogicalOr"(%arg1) <{execution_scope = #spirv.scope<Subgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i1) -> i1 loc("<stdin>":88:10)
    "spirv.ReturnValue"(%1) : (i1) -> () loc("<stdin>":89:5)
  }) : () -> () loc("<stdin>":86:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i1) -> i1, sym_name = "non_uniform_logical_xor"}> ({
  ^bb0(%arg0: i1 loc("<stdin>":92:8)):
    %0 = "spirv.GroupNonUniformLogicalXor"(%arg0) <{execution_scope = #spirv.scope<Subgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i1) -> i1 loc("<stdin>":93:10)
    "spirv.ReturnValue"(%0) : (i1) -> () loc("<stdin>":94:5)
  }) : () -> () loc("<stdin>":91:3)
}) : () -> () loc("<stdin>":1:1)
