"builtin.module"() ({
  "func.func"() <{function_type = () -> !async.token, sym_name = "create_token"}> ({
    %9 = "async.runtime.create"() : () -> !async.token loc("<stdin>":3:10)
    "func.return"(%9) : (!async.token) -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> !async.value<f32>, sym_name = "create_value"}> ({
    %8 = "async.runtime.create"() : () -> !async.value<f32> loc("<stdin>":7:10)
    "func.return"(%8) : (!async.value<f32>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = () -> !async.group, sym_name = "create_group"}> ({
    %6 = "arith.constant"() <{value = 10 : index}> : () -> index loc("<stdin>":11:10)
    %7 = "async.runtime.create_group"(%6) : (index) -> !async.group loc("<stdin>":12:10)
    "func.return"(%7) : (!async.group) -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":10:3)
  "func.func"() <{function_type = (!async.token) -> (), sym_name = "set_token_available"}> ({
  ^bb0(%arg24: !async.token loc("<stdin>":16:8)):
    "async.runtime.set_available"(%arg24) : (!async.token) -> () loc("<stdin>":17:5)
    "func.return"() : () -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":15:3)
  "func.func"() <{function_type = (!async.value<f32>) -> (), sym_name = "set_value_available"}> ({
  ^bb0(%arg23: !async.value<f32> loc("<stdin>":21:8)):
    "async.runtime.set_available"(%arg23) : (!async.value<f32>) -> () loc("<stdin>":22:5)
    "func.return"() : () -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":20:3)
  "func.func"() <{function_type = (!async.token) -> (), sym_name = "set_token_error"}> ({
  ^bb0(%arg22: !async.token loc("<stdin>":26:8)):
    "async.runtime.set_error"(%arg22) : (!async.token) -> () loc("<stdin>":27:5)
    "func.return"() : () -> () loc("<stdin>":28:5)
  }) : () -> () loc("<stdin>":25:3)
  "func.func"() <{function_type = (!async.value<f32>) -> (), sym_name = "set_value_error"}> ({
  ^bb0(%arg21: !async.value<f32> loc("<stdin>":31:8)):
    "async.runtime.set_error"(%arg21) : (!async.value<f32>) -> () loc("<stdin>":32:5)
    "func.return"() : () -> () loc("<stdin>":33:5)
  }) : () -> () loc("<stdin>":30:3)
  "func.func"() <{function_type = (!async.token) -> i1, sym_name = "is_token_error"}> ({
  ^bb0(%arg20: !async.token loc("<stdin>":36:8)):
    %5 = "async.runtime.is_error"(%arg20) : (!async.token) -> i1 loc("<stdin>":37:10)
    "func.return"(%5) : (i1) -> () loc("<stdin>":38:5)
  }) : () -> () loc("<stdin>":35:3)
  "func.func"() <{function_type = (!async.value<f32>) -> i1, sym_name = "is_value_error"}> ({
  ^bb0(%arg19: !async.value<f32> loc("<stdin>":41:8)):
    %4 = "async.runtime.is_error"(%arg19) : (!async.value<f32>) -> i1 loc("<stdin>":42:10)
    "func.return"(%4) : (i1) -> () loc("<stdin>":43:5)
  }) : () -> () loc("<stdin>":40:3)
  "func.func"() <{function_type = (!async.group) -> i1, sym_name = "is_group_error"}> ({
  ^bb0(%arg18: !async.group loc("<stdin>":46:8)):
    %3 = "async.runtime.is_error"(%arg18) : (!async.group) -> i1 loc("<stdin>":47:10)
    "func.return"(%3) : (i1) -> () loc("<stdin>":48:5)
  }) : () -> () loc("<stdin>":45:3)
  "func.func"() <{function_type = (!async.token) -> (), sym_name = "await_token"}> ({
  ^bb0(%arg17: !async.token loc("<stdin>":51:8)):
    "async.runtime.await"(%arg17) : (!async.token) -> () loc("<stdin>":52:5)
    "func.return"() : () -> () loc("<stdin>":53:5)
  }) : () -> () loc("<stdin>":50:3)
  "func.func"() <{function_type = (!async.value<f32>) -> (), sym_name = "await_value"}> ({
  ^bb0(%arg16: !async.value<f32> loc("<stdin>":56:8)):
    "async.runtime.await"(%arg16) : (!async.value<f32>) -> () loc("<stdin>":57:5)
    "func.return"() : () -> () loc("<stdin>":58:5)
  }) : () -> () loc("<stdin>":55:3)
  "func.func"() <{function_type = (!async.group) -> (), sym_name = "await_group"}> ({
  ^bb0(%arg15: !async.group loc("<stdin>":61:8)):
    "async.runtime.await"(%arg15) : (!async.group) -> () loc("<stdin>":62:5)
    "func.return"() : () -> () loc("<stdin>":63:5)
  }) : () -> () loc("<stdin>":60:3)
  "func.func"() <{function_type = (!async.token, !async.coro.handle) -> (), sym_name = "await_and_resume_token"}> ({
  ^bb0(%arg13: !async.token loc("<stdin>":66:8), %arg14: !async.coro.handle loc("<stdin>":66:30)):
    "async.runtime.await_and_resume"(%arg13, %arg14) : (!async.token, !async.coro.handle) -> () loc("<stdin>":67:5)
    "func.return"() : () -> () loc("<stdin>":68:5)
  }) : () -> () loc("<stdin>":65:3)
  "func.func"() <{function_type = (!async.value<f32>, !async.coro.handle) -> (), sym_name = "await_and_resume_value"}> ({
  ^bb0(%arg11: !async.value<f32> loc("<stdin>":71:8), %arg12: !async.coro.handle loc("<stdin>":71:35)):
    "async.runtime.await_and_resume"(%arg11, %arg12) : (!async.value<f32>, !async.coro.handle) -> () loc("<stdin>":72:5)
    "func.return"() : () -> () loc("<stdin>":73:5)
  }) : () -> () loc("<stdin>":70:3)
  "func.func"() <{function_type = (!async.group, !async.coro.handle) -> (), sym_name = "await_and_resume_group"}> ({
  ^bb0(%arg9: !async.group loc("<stdin>":76:8), %arg10: !async.coro.handle loc("<stdin>":76:29)):
    "async.runtime.await_and_resume"(%arg9, %arg10) : (!async.group, !async.coro.handle) -> () loc("<stdin>":77:5)
    "func.return"() : () -> () loc("<stdin>":78:5)
  }) : () -> () loc("<stdin>":75:3)
  "func.func"() <{function_type = (!async.coro.handle) -> (), sym_name = "resume"}> ({
  ^bb0(%arg8: !async.coro.handle loc("<stdin>":81:8)):
    "async.runtime.resume"(%arg8) : (!async.coro.handle) -> () loc("<stdin>":82:5)
    "func.return"() : () -> () loc("<stdin>":83:5)
  }) : () -> () loc("<stdin>":80:3)
  "func.func"() <{function_type = (f32, !async.value<f32>) -> (), sym_name = "store"}> ({
  ^bb0(%arg6: f32 loc("<stdin>":86:8), %arg7: !async.value<f32> loc("<stdin>":86:20)):
    "async.runtime.store"(%arg6, %arg7) : (f32, !async.value<f32>) -> () loc("<stdin>":87:5)
    "func.return"() : () -> () loc("<stdin>":88:5)
  }) : () -> () loc("<stdin>":85:3)
  "func.func"() <{function_type = (!async.value<f32>) -> f32, sym_name = "load"}> ({
  ^bb0(%arg5: !async.value<f32> loc("<stdin>":91:8)):
    %2 = "async.runtime.load"(%arg5) : (!async.value<f32>) -> f32 loc("<stdin>":92:10)
    "func.return"(%2) : (f32) -> () loc("<stdin>":93:5)
  }) : () -> () loc("<stdin>":90:3)
  "func.func"() <{function_type = (!async.token, !async.value<f32>, !async.group) -> (), sym_name = "add_to_group"}> ({
  ^bb0(%arg2: !async.token loc("<stdin>":96:8), %arg3: !async.value<f32> loc("<stdin>":96:29), %arg4: !async.group loc("<stdin>":96:55)):
    %0 = "async.runtime.add_to_group"(%arg2, %arg4) : (!async.token, !async.group) -> index loc("<stdin>":97:10)
    %1 = "async.runtime.add_to_group"(%arg3, %arg4) : (!async.value<f32>, !async.group) -> index loc("<stdin>":98:10)
    "func.return"() : () -> () loc("<stdin>":99:5)
  }) : () -> () loc("<stdin>":95:3)
  "func.func"() <{function_type = (!async.token) -> (), sym_name = "add_ref"}> ({
  ^bb0(%arg1: !async.token loc("<stdin>":102:8)):
    "async.runtime.add_ref"(%arg1) <{count = 1 : i64}> : (!async.token) -> () loc("<stdin>":103:5)
    "func.return"() : () -> () loc("<stdin>":104:5)
  }) : () -> () loc("<stdin>":101:3)
  "func.func"() <{function_type = (!async.token) -> (), sym_name = "drop_ref"}> ({
  ^bb0(%arg0: !async.token loc("<stdin>":107:8)):
    "async.runtime.drop_ref"(%arg0) <{count = 1 : i64}> : (!async.token) -> () loc("<stdin>":108:5)
    "func.return"() : () -> () loc("<stdin>":109:5)
  }) : () -> () loc("<stdin>":106:3)
}) : () -> () loc("<stdin>":1:1)
