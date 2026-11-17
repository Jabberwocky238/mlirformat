"builtin.module"() ({
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "group_reduce_iadd"}> ({
  ^bb0(%arg24: i32 loc("<stdin>":3:8)):
    %24 = "spirv.GroupIAdd"(%arg24) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i32) -> i32 loc("<stdin>":4:11)
    "spirv.ReturnValue"(%24) : (i32) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> f32, sym_name = "group_reduce_fadd"}> ({
  ^bb0(%arg23: f32 loc("<stdin>":8:8)):
    %23 = "spirv.GroupFAdd"(%arg23) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (f32) -> f32 loc("<stdin>":9:11)
    "spirv.ReturnValue"(%23) : (f32) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> f32, sym_name = "group_reduce_fmin"}> ({
  ^bb0(%arg22: f32 loc("<stdin>":13:8)):
    %22 = "spirv.GroupFMin"(%arg22) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (f32) -> f32 loc("<stdin>":14:11)
    "spirv.ReturnValue"(%22) : (f32) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "group_reduce_umin"}> ({
  ^bb0(%arg21: i32 loc("<stdin>":18:8)):
    %21 = "spirv.GroupUMin"(%arg21) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i32) -> i32 loc("<stdin>":19:11)
    "spirv.ReturnValue"(%21) : (i32) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "group_reduce_smin"}> ({
  ^bb0(%arg20: i32 loc("<stdin>":23:8)):
    %20 = "spirv.GroupSMin"(%arg20) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i32) -> i32 loc("<stdin>":24:11)
    "spirv.ReturnValue"(%20) : (i32) -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> f32, sym_name = "group_reduce_fmax"}> ({
  ^bb0(%arg19: f32 loc("<stdin>":28:8)):
    %19 = "spirv.GroupFMax"(%arg19) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (f32) -> f32 loc("<stdin>":29:11)
    "spirv.ReturnValue"(%19) : (f32) -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":27:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "group_reduce_umax"}> ({
  ^bb0(%arg18: i32 loc("<stdin>":33:8)):
    %18 = "spirv.GroupUMax"(%arg18) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i32) -> i32 loc("<stdin>":34:11)
    "spirv.ReturnValue"(%18) : (i32) -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":32:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "group_reduce_smax"}> ({
  ^bb0(%arg17: i32 loc("<stdin>":38:8)):
    %17 = "spirv.GroupSMax"(%arg17) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (i32) -> i32 loc("<stdin>":39:11)
    "spirv.ReturnValue"(%17) : (i32) -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":37:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "group_inclusive_scan_iadd"}> ({
  ^bb0(%arg16: i32 loc("<stdin>":43:8)):
    %16 = "spirv.GroupIAdd"(%arg16) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<InclusiveScan>}> : (i32) -> i32 loc("<stdin>":44:11)
    "spirv.ReturnValue"(%16) : (i32) -> () loc("<stdin>":45:5)
  }) : () -> () loc("<stdin>":42:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> f32, sym_name = "group_inclusive_scan_fadd"}> ({
  ^bb0(%arg15: f32 loc("<stdin>":48:8)):
    %15 = "spirv.GroupFAdd"(%arg15) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<InclusiveScan>}> : (f32) -> f32 loc("<stdin>":49:11)
    "spirv.ReturnValue"(%15) : (f32) -> () loc("<stdin>":50:5)
  }) : () -> () loc("<stdin>":47:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> f32, sym_name = "group_inclusive_scan_fmin"}> ({
  ^bb0(%arg14: f32 loc("<stdin>":53:8)):
    %14 = "spirv.GroupFMin"(%arg14) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<InclusiveScan>}> : (f32) -> f32 loc("<stdin>":54:11)
    "spirv.ReturnValue"(%14) : (f32) -> () loc("<stdin>":55:5)
  }) : () -> () loc("<stdin>":52:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "group_inclusive_scan_umin"}> ({
  ^bb0(%arg13: i32 loc("<stdin>":58:8)):
    %13 = "spirv.GroupUMin"(%arg13) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<InclusiveScan>}> : (i32) -> i32 loc("<stdin>":59:11)
    "spirv.ReturnValue"(%13) : (i32) -> () loc("<stdin>":60:5)
  }) : () -> () loc("<stdin>":57:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "group_inclusive_scan_smin"}> ({
  ^bb0(%arg12: i32 loc("<stdin>":63:8)):
    %12 = "spirv.GroupSMin"(%arg12) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<InclusiveScan>}> : (i32) -> i32 loc("<stdin>":64:11)
    "spirv.ReturnValue"(%12) : (i32) -> () loc("<stdin>":65:5)
  }) : () -> () loc("<stdin>":62:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> f32, sym_name = "group_inclusive_scan_fmax"}> ({
  ^bb0(%arg11: f32 loc("<stdin>":68:8)):
    %11 = "spirv.GroupFMax"(%arg11) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<InclusiveScan>}> : (f32) -> f32 loc("<stdin>":69:11)
    "spirv.ReturnValue"(%11) : (f32) -> () loc("<stdin>":70:5)
  }) : () -> () loc("<stdin>":67:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "group_inclusive_scan_umax"}> ({
  ^bb0(%arg10: i32 loc("<stdin>":73:8)):
    %10 = "spirv.GroupUMax"(%arg10) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<InclusiveScan>}> : (i32) -> i32 loc("<stdin>":74:11)
    "spirv.ReturnValue"(%10) : (i32) -> () loc("<stdin>":75:5)
  }) : () -> () loc("<stdin>":72:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "group_inclusive_scan_smax"}> ({
  ^bb0(%arg9: i32 loc("<stdin>":78:8)):
    %9 = "spirv.GroupSMax"(%arg9) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<ExclusiveScan>}> : (i32) -> i32 loc("<stdin>":79:10)
    "spirv.ReturnValue"(%9) : (i32) -> () loc("<stdin>":80:5)
  }) : () -> () loc("<stdin>":77:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "group_exclusive_scan_iadd"}> ({
  ^bb0(%arg8: i32 loc("<stdin>":83:8)):
    %8 = "spirv.GroupIAdd"(%arg8) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<ExclusiveScan>}> : (i32) -> i32 loc("<stdin>":84:10)
    "spirv.ReturnValue"(%8) : (i32) -> () loc("<stdin>":85:5)
  }) : () -> () loc("<stdin>":82:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> f32, sym_name = "group_exclusive_scan_fadd"}> ({
  ^bb0(%arg7: f32 loc("<stdin>":88:8)):
    %7 = "spirv.GroupFAdd"(%arg7) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<ExclusiveScan>}> : (f32) -> f32 loc("<stdin>":89:10)
    "spirv.ReturnValue"(%7) : (f32) -> () loc("<stdin>":90:5)
  }) : () -> () loc("<stdin>":87:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> f32, sym_name = "group_exclusive_scan_fmin"}> ({
  ^bb0(%arg6: f32 loc("<stdin>":93:8)):
    %6 = "spirv.GroupFMin"(%arg6) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<ExclusiveScan>}> : (f32) -> f32 loc("<stdin>":94:10)
    "spirv.ReturnValue"(%6) : (f32) -> () loc("<stdin>":95:5)
  }) : () -> () loc("<stdin>":92:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "group_exclusive_scan_umin"}> ({
  ^bb0(%arg5: i32 loc("<stdin>":98:8)):
    %5 = "spirv.GroupUMin"(%arg5) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<ExclusiveScan>}> : (i32) -> i32 loc("<stdin>":99:10)
    "spirv.ReturnValue"(%5) : (i32) -> () loc("<stdin>":100:5)
  }) : () -> () loc("<stdin>":97:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "group_exclusive_scan_smin"}> ({
  ^bb0(%arg4: i32 loc("<stdin>":103:8)):
    %4 = "spirv.GroupSMin"(%arg4) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<ExclusiveScan>}> : (i32) -> i32 loc("<stdin>":104:10)
    "spirv.ReturnValue"(%4) : (i32) -> () loc("<stdin>":105:5)
  }) : () -> () loc("<stdin>":102:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> f32, sym_name = "group_exclusive_scan_fmax"}> ({
  ^bb0(%arg3: f32 loc("<stdin>":108:8)):
    %3 = "spirv.GroupFMax"(%arg3) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<ExclusiveScan>}> : (f32) -> f32 loc("<stdin>":109:10)
    "spirv.ReturnValue"(%3) : (f32) -> () loc("<stdin>":110:5)
  }) : () -> () loc("<stdin>":107:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "group_exclusive_scan_umax"}> ({
  ^bb0(%arg2: i32 loc("<stdin>":113:8)):
    %2 = "spirv.GroupUMax"(%arg2) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<ExclusiveScan>}> : (i32) -> i32 loc("<stdin>":114:10)
    "spirv.ReturnValue"(%2) : (i32) -> () loc("<stdin>":115:5)
  }) : () -> () loc("<stdin>":112:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "group_exclusive_scan_smax"}> ({
  ^bb0(%arg1: i32 loc("<stdin>":118:8)):
    %1 = "spirv.GroupSMax"(%arg1) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<ExclusiveScan>}> : (i32) -> i32 loc("<stdin>":119:10)
    "spirv.ReturnValue"(%1) : (i32) -> () loc("<stdin>":120:5)
  }) : () -> () loc("<stdin>":117:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "subgroup_exclusive_scan_smax"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":123:8)):
    %0 = "spirv.GroupSMax"(%arg0) <{execution_scope = #spirv.scope<Subgroup>, group_operation = #spirv.group_operation<ExclusiveScan>}> : (i32) -> i32 loc("<stdin>":124:10)
    "spirv.ReturnValue"(%0) : (i32) -> () loc("<stdin>":125:5)
  }) : () -> () loc("<stdin>":122:3)
}) : () -> () loc("<stdin>":1:1)
