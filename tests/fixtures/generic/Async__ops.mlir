"builtin.module"() ({
  "func.func"() <{function_type = (!async.token) -> !async.token, sym_name = "identity_token"}> ({
  ^bb0(%arg11: !async.token):
    "func.return"(%arg11) : (!async.token) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!async.value<f32>) -> !async.value<f32>, sym_name = "identity_value"}> ({
  ^bb0(%arg10: !async.value<f32>):
    "func.return"(%arg10) : (!async.value<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> !async.token, sym_name = "empty_async_execute"}> ({
    %26 = "async.execute"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
      "async.yield"() : () -> ()
    }) : () -> !async.token
    "func.return"(%26) : (!async.token) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> !async.value<f32>, sym_name = "return_async_value"}> ({
    %24:2 = "async.execute"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
      %25 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
      "async.yield"(%25) : (f32) -> ()
    }) : () -> (!async.token, !async.value<f32>)
    "func.return"(%24#1) : (!async.value<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> !async.token, sym_name = "return_captured_value"}> ({
    %22 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %23:2 = "async.execute"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
      "async.yield"(%22) : (f32) -> ()
    }) : () -> (!async.token, !async.value<f32>)
    "func.return"(%23#0) : (!async.token) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (!async.value<f32>, !async.value<f32>), sym_name = "return_async_values"}> ({
    %19:3 = "async.execute"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
      %20 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
      %21 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
      "async.yield"(%20, %21) : (f32, f32) -> ()
    }) : () -> (!async.token, !async.value<f32>, !async.value<f32>)
    "func.return"(%19#1, %19#2) : (!async.value<f32>, !async.value<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!async.token) -> !async.token, sym_name = "async_token_dependencies"}> ({
  ^bb0(%arg9: !async.token):
    %18 = "async.execute"(%arg9) <{operandSegmentSizes = array<i32: 1, 0>}> ({
      "async.yield"() : () -> ()
    }) : (!async.token) -> !async.token
    "func.return"(%18) : (!async.token) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!async.value<f32>) -> !async.token, sym_name = "async_value_operands"}> ({
  ^bb0(%arg7: !async.value<f32>):
    %17:2 = "async.execute"(%arg7) <{operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg8: f32):
      "async.yield"(%arg8) : (f32) -> ()
    }) : (!async.value<f32>) -> (!async.token, !async.value<f32>)
    "func.return"(%17#0) : (!async.token) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!async.token, !async.value<f32>) -> !async.token, sym_name = "async_token_and_value_operands"}> ({
  ^bb0(%arg4: !async.token, %arg5: !async.value<f32>):
    %16:2 = "async.execute"(%arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: f32):
      "async.yield"(%arg6) : (f32) -> ()
    }) : (!async.token, !async.value<f32>) -> (!async.token, !async.value<f32>)
    "func.return"(%16#0) : (!async.token) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "empty_tokens_or_values_operands"}> ({
    %11 = "async.execute"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
      "async.yield"() : () -> ()
    }) : () -> !async.token
    %12 = "async.execute"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
      "async.yield"() : () -> ()
    }) : () -> !async.token
    %13 = "async.execute"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
      "async.yield"() : () -> ()
    }) : () -> !async.token
    %14 = "async.execute"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
      "async.yield"() : () -> ()
    }) : () -> !async.token
    %15 = "async.execute"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
      "async.yield"() : () -> ()
    }) : () -> !async.token
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!async.token) -> (), sym_name = "await_token"}> ({
  ^bb0(%arg3: !async.token):
    "async.await"(%arg3) : (!async.token) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!async.value<f32>) -> f32, sym_name = "await_value"}> ({
  ^bb0(%arg2: !async.value<f32>):
    %10 = "async.await"(%arg2) : (!async.value<f32>) -> f32
    "func.return"(%10) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!async.token, !async.value<f32>) -> index, sym_name = "create_group_and_await_all"}> ({
  ^bb0(%arg0: !async.token, %arg1: !async.value<f32>):
    %5 = "arith.constant"() <{value = 2 : index}> : () -> index
    %6 = "async.create_group"(%5) : (index) -> !async.group
    %7 = "async.add_to_group"(%arg0, %6) : (!async.token, !async.group) -> index
    %8 = "async.add_to_group"(%arg1, %6) : (!async.value<f32>, !async.group) -> index
    "async.await_all"(%6) : (!async.group) -> ()
    %9 = "arith.addi"(%7, %8) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    "func.return"(%9) : (index) -> ()
  }) : () -> ()
  "async.func"() <{function_type = () -> !async.token, sym_name = "async_func_return_token"}> ({
    "async.return"() : () -> ()
  }) : () -> ()
  "async.func"() <{function_type = () -> !async.value<i32>, sym_name = "async_func_return_value"}> ({
    %4 = "arith.constant"() <{value = 42 : i32}> : () -> i32
    "async.return"(%4) : (i32) -> ()
  }) : () -> ()
  "async.func"() <{function_type = () -> (!async.token, !async.value<i32>), sym_name = "async_func_return_optional_token"}> ({
    %3 = "arith.constant"() <{value = 42 : i32}> : () -> i32
    "async.return"(%3) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "async_call"}> ({
    %0 = "async.call"() <{callee = @async_func_return_token}> : () -> !async.token
    %1 = "async.call"() <{callee = @async_func_return_value}> : () -> !async.value<i32>
    %2:2 = "async.call"() <{callee = @async_func_return_optional_token}> : () -> (!async.token, !async.value<i32>)
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

