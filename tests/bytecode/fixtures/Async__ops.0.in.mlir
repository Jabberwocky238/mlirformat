"builtin.module"() ({
  "func.func"() <{function_type = (!async.token) -> !async.token, sym_name = "identity_token"}> ({
  ^bb0(%arg11: !async.token loc("<stdin>":3:8)):
    "func.return"(%arg11) : (!async.token) -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (!async.value<f32>) -> !async.value<f32>, sym_name = "identity_value"}> ({
  ^bb0(%arg10: !async.value<f32> loc("<stdin>":7:8)):
    "func.return"(%arg10) : (!async.value<f32>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = () -> !async.token, sym_name = "empty_async_execute"}> ({
    %26 = "async.execute"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
      "async.yield"() : () -> () loc("<stdin>":12:7)
    }) : () -> !async.token loc("<stdin>":11:11)
    "func.return"(%26) : (!async.token) -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":10:3)
  "func.func"() <{function_type = () -> !async.value<f32>, sym_name = "return_async_value"}> ({
    %24:2 = "async.execute"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
      %25 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":18:13)
      "async.yield"(%25) : (f32) -> () loc("<stdin>":19:7)
    }) : () -> (!async.token, !async.value<f32>) loc("<stdin>":17:13)
    "func.return"(%24#1) : (!async.value<f32>) -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":16:3)
  "func.func"() <{function_type = () -> !async.token, sym_name = "return_captured_value"}> ({
    %22 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":24:11)
    %23:2 = "async.execute"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
      "async.yield"(%22) : (f32) -> () loc("<stdin>":26:7)
    }) : () -> (!async.token, !async.value<f32>) loc("<stdin>":25:13)
    "func.return"(%23#0) : (!async.token) -> () loc("<stdin>":28:5)
  }) : () -> () loc("<stdin>":23:3)
  "func.func"() <{function_type = () -> (!async.value<f32>, !async.value<f32>), sym_name = "return_async_values"}> ({
    %19:3 = "async.execute"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
      %20 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":32:13)
      %21 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32 loc("<stdin>":33:13)
      "async.yield"(%20, %21) : (f32, f32) -> () loc("<stdin>":34:7)
    }) : () -> (!async.token, !async.value<f32>, !async.value<f32>) loc("<stdin>":31:13)
    "func.return"(%19#1, %19#2) : (!async.value<f32>, !async.value<f32>) -> () loc("<stdin>":36:5)
  }) : () -> () loc("<stdin>":30:3)
  "func.func"() <{function_type = (!async.token) -> !async.token, sym_name = "async_token_dependencies"}> ({
  ^bb0(%arg9: !async.token loc("<stdin>":39:8)):
    %18 = "async.execute"(%arg9) <{operandSegmentSizes = array<i32: 1, 0>}> ({
      "async.yield"() : () -> () loc("<stdin>":41:7)
    }) : (!async.token) -> !async.token loc("<stdin>":40:11)
    "func.return"(%18) : (!async.token) -> () loc("<stdin>":43:5)
  }) : () -> () loc("<stdin>":38:3)
  "func.func"() <{function_type = (!async.value<f32>) -> !async.token, sym_name = "async_value_operands"}> ({
  ^bb0(%arg7: !async.value<f32> loc("<stdin>":46:8)):
    %17:2 = "async.execute"(%arg7) <{operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg8: f32 loc("<stdin>":48:10)):
      "async.yield"(%arg8) : (f32) -> () loc("<stdin>":49:7)
    }) : (!async.value<f32>) -> (!async.token, !async.value<f32>) loc("<stdin>":47:13)
    "func.return"(%17#0) : (!async.token) -> () loc("<stdin>":51:5)
  }) : () -> () loc("<stdin>":45:3)
  "func.func"() <{function_type = (!async.token, !async.value<f32>) -> !async.token, sym_name = "async_token_and_value_operands"}> ({
  ^bb0(%arg4: !async.token loc("<stdin>":54:8), %arg5: !async.value<f32> loc("<stdin>":54:29)):
    %16:2 = "async.execute"(%arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: f32 loc("<stdin>":56:10)):
      "async.yield"(%arg6) : (f32) -> () loc("<stdin>":57:7)
    }) : (!async.token, !async.value<f32>) -> (!async.token, !async.value<f32>) loc("<stdin>":55:13)
    "func.return"(%16#0) : (!async.token) -> () loc("<stdin>":59:5)
  }) : () -> () loc("<stdin>":53:3)
  "func.func"() <{function_type = () -> (), sym_name = "empty_tokens_or_values_operands"}> ({
    %11 = "async.execute"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
      "async.yield"() : () -> () loc("<stdin>":63:7)
    }) : () -> !async.token loc("<stdin>":62:11)
    %12 = "async.execute"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
      "async.yield"() : () -> () loc("<stdin>":66:7)
    }) : () -> !async.token loc("<stdin>":65:11)
    %13 = "async.execute"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
      "async.yield"() : () -> () loc("<stdin>":69:7)
    }) : () -> !async.token loc("<stdin>":68:11)
    %14 = "async.execute"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
      "async.yield"() : () -> () loc("<stdin>":72:7)
    }) : () -> !async.token loc("<stdin>":71:11)
    %15 = "async.execute"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
      "async.yield"() : () -> () loc("<stdin>":75:7)
    }) : () -> !async.token loc("<stdin>":74:11)
    "func.return"() : () -> () loc("<stdin>":77:5)
  }) : () -> () loc("<stdin>":61:3)
  "func.func"() <{function_type = (!async.token) -> (), sym_name = "await_token"}> ({
  ^bb0(%arg3: !async.token loc("<stdin>":80:8)):
    "async.await"(%arg3) : (!async.token) -> () loc("<stdin>":81:5)
    "func.return"() : () -> () loc("<stdin>":82:5)
  }) : () -> () loc("<stdin>":79:3)
  "func.func"() <{function_type = (!async.value<f32>) -> f32, sym_name = "await_value"}> ({
  ^bb0(%arg2: !async.value<f32> loc("<stdin>":85:8)):
    %10 = "async.await"(%arg2) : (!async.value<f32>) -> f32 loc("<stdin>":86:11)
    "func.return"(%10) : (f32) -> () loc("<stdin>":87:5)
  }) : () -> () loc("<stdin>":84:3)
  "func.func"() <{function_type = (!async.token, !async.value<f32>) -> index, sym_name = "create_group_and_await_all"}> ({
  ^bb0(%arg0: !async.token loc("<stdin>":90:8), %arg1: !async.value<f32> loc("<stdin>":90:29)):
    %5 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":91:10)
    %6 = "async.create_group"(%5) : (index) -> !async.group loc("<stdin>":92:10)
    %7 = "async.add_to_group"(%arg0, %6) : (!async.token, !async.group) -> index loc("<stdin>":93:10)
    %8 = "async.add_to_group"(%arg1, %6) : (!async.value<f32>, !async.group) -> index loc("<stdin>":94:10)
    "async.await_all"(%6) : (!async.group) -> () loc("<stdin>":95:5)
    %9 = "arith.addi"(%7, %8) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":96:10)
    "func.return"(%9) : (index) -> () loc("<stdin>":97:5)
  }) : () -> () loc("<stdin>":89:3)
  "async.func"() <{function_type = () -> !async.token, sym_name = "async_func_return_token"}> ({
    "async.return"() : () -> () loc("<stdin>":100:5)
  }) : () -> () loc("<stdin>":99:3)
  "async.func"() <{function_type = () -> !async.value<i32>, sym_name = "async_func_return_value"}> ({
    %4 = "arith.constant"() <{value = 42 : i32}> : () -> i32 loc("<stdin>":103:10)
    "async.return"(%4) : (i32) -> () loc("<stdin>":104:5)
  }) : () -> () loc("<stdin>":102:3)
  "async.func"() <{function_type = () -> (!async.token, !async.value<i32>), sym_name = "async_func_return_optional_token"}> ({
    %3 = "arith.constant"() <{value = 42 : i32}> : () -> i32 loc("<stdin>":107:10)
    "async.return"(%3) : (i32) -> () loc("<stdin>":108:5)
  }) : () -> () loc("<stdin>":106:3)
  "func.func"() <{function_type = () -> (), sym_name = "async_call"}> ({
    %0 = "async.call"() <{callee = @async_func_return_token}> : () -> !async.token loc("<stdin>":111:10)
    %1 = "async.call"() <{callee = @async_func_return_value}> : () -> !async.value<i32> loc("<stdin>":112:10)
    %2:2 = "async.call"() <{callee = @async_func_return_optional_token}> : () -> (!async.token, !async.value<i32>) loc("<stdin>":113:12)
    "func.return"() : () -> () loc("<stdin>":114:5)
  }) : () -> () loc("<stdin>":110:3)
}) : () -> () loc("<stdin>":1:1)
