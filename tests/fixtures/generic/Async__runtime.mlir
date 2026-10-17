"builtin.module"() ({
  "func.func"() <{function_type = () -> !async.token, sym_name = "create_token"}> ({
    %9 = "async.runtime.create"() : () -> !async.token
    "func.return"(%9) : (!async.token) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> !async.value<f32>, sym_name = "create_value"}> ({
    %8 = "async.runtime.create"() : () -> !async.value<f32>
    "func.return"(%8) : (!async.value<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> !async.group, sym_name = "create_group"}> ({
    %6 = "arith.constant"() <{value = 10 : index}> : () -> index
    %7 = "async.runtime.create_group"(%6) : (index) -> !async.group
    "func.return"(%7) : (!async.group) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!async.token) -> (), sym_name = "set_token_available"}> ({
  ^bb0(%arg24: !async.token):
    "async.runtime.set_available"(%arg24) : (!async.token) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!async.value<f32>) -> (), sym_name = "set_value_available"}> ({
  ^bb0(%arg23: !async.value<f32>):
    "async.runtime.set_available"(%arg23) : (!async.value<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!async.token) -> (), sym_name = "set_token_error"}> ({
  ^bb0(%arg22: !async.token):
    "async.runtime.set_error"(%arg22) : (!async.token) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!async.value<f32>) -> (), sym_name = "set_value_error"}> ({
  ^bb0(%arg21: !async.value<f32>):
    "async.runtime.set_error"(%arg21) : (!async.value<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!async.token) -> i1, sym_name = "is_token_error"}> ({
  ^bb0(%arg20: !async.token):
    %5 = "async.runtime.is_error"(%arg20) : (!async.token) -> i1
    "func.return"(%5) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!async.value<f32>) -> i1, sym_name = "is_value_error"}> ({
  ^bb0(%arg19: !async.value<f32>):
    %4 = "async.runtime.is_error"(%arg19) : (!async.value<f32>) -> i1
    "func.return"(%4) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!async.group) -> i1, sym_name = "is_group_error"}> ({
  ^bb0(%arg18: !async.group):
    %3 = "async.runtime.is_error"(%arg18) : (!async.group) -> i1
    "func.return"(%3) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!async.token) -> (), sym_name = "await_token"}> ({
  ^bb0(%arg17: !async.token):
    "async.runtime.await"(%arg17) : (!async.token) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!async.value<f32>) -> (), sym_name = "await_value"}> ({
  ^bb0(%arg16: !async.value<f32>):
    "async.runtime.await"(%arg16) : (!async.value<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!async.group) -> (), sym_name = "await_group"}> ({
  ^bb0(%arg15: !async.group):
    "async.runtime.await"(%arg15) : (!async.group) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!async.token, !async.coro.handle) -> (), sym_name = "await_and_resume_token"}> ({
  ^bb0(%arg13: !async.token, %arg14: !async.coro.handle):
    "async.runtime.await_and_resume"(%arg13, %arg14) : (!async.token, !async.coro.handle) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!async.value<f32>, !async.coro.handle) -> (), sym_name = "await_and_resume_value"}> ({
  ^bb0(%arg11: !async.value<f32>, %arg12: !async.coro.handle):
    "async.runtime.await_and_resume"(%arg11, %arg12) : (!async.value<f32>, !async.coro.handle) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!async.group, !async.coro.handle) -> (), sym_name = "await_and_resume_group"}> ({
  ^bb0(%arg9: !async.group, %arg10: !async.coro.handle):
    "async.runtime.await_and_resume"(%arg9, %arg10) : (!async.group, !async.coro.handle) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!async.coro.handle) -> (), sym_name = "resume"}> ({
  ^bb0(%arg8: !async.coro.handle):
    "async.runtime.resume"(%arg8) : (!async.coro.handle) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, !async.value<f32>) -> (), sym_name = "store"}> ({
  ^bb0(%arg6: f32, %arg7: !async.value<f32>):
    "async.runtime.store"(%arg6, %arg7) : (f32, !async.value<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!async.value<f32>) -> f32, sym_name = "load"}> ({
  ^bb0(%arg5: !async.value<f32>):
    %2 = "async.runtime.load"(%arg5) : (!async.value<f32>) -> f32
    "func.return"(%2) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!async.token, !async.value<f32>, !async.group) -> (), sym_name = "add_to_group"}> ({
  ^bb0(%arg2: !async.token, %arg3: !async.value<f32>, %arg4: !async.group):
    %0 = "async.runtime.add_to_group"(%arg2, %arg4) : (!async.token, !async.group) -> index
    %1 = "async.runtime.add_to_group"(%arg3, %arg4) : (!async.value<f32>, !async.group) -> index
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!async.token) -> (), sym_name = "add_ref"}> ({
  ^bb0(%arg1: !async.token):
    "async.runtime.add_ref"(%arg1) <{count = 1 : i64}> : (!async.token) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!async.token) -> (), sym_name = "drop_ref"}> ({
  ^bb0(%arg0: !async.token):
    "async.runtime.drop_ref"(%arg0) <{count = 1 : i64}> : (!async.token) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

