"builtin.module"() ({
  "acc.routine"() <{bindIdName = [@bar], bindIdNameDeviceType = [#acc.device_type<none>], bindStrName = [], bindStrNameDeviceType = [], func_name = @foo, seq = [#acc.device_type<none>], sym_name = "r_bind"}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "foo"}> ({
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@r_bind]>} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "bar"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    "acc.serial"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "func.call"() <{callee = @foo}> : () -> ()
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "acc.routine"() <{bindIdName = [], bindIdNameDeviceType = [], bindStrName = ["actual_impl"], bindStrNameDeviceType = [#acc.device_type<none>], func_name = @wrapped, seq = [#acc.device_type<none>], sym_name = "r_bind_str"}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "wrapped"}> ({
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@r_bind_str]>} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "actual_impl"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    "acc.serial"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "func.call"() <{callee = @wrapped}> : () -> ()
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "acc.routine"() <{bindIdName = [@bar], bindIdNameDeviceType = [#acc.device_type<none>], bindStrName = [], bindStrNameDeviceType = [], func_name = @foo, seq = [#acc.device_type<none>], sym_name = "r_bind"}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "foo"}> ({
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@r_bind]>} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "bar"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    "func.call"() <{callee = @foo}> : () -> ()
    "acc.serial"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "func.call"() <{callee = @foo}> : () -> ()
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "acc.routine"() <{bindIdName = [@bound], bindIdNameDeviceType = [#acc.device_type<none>], bindStrName = [], bindStrNameDeviceType = [], func_name = @target, seq = [#acc.device_type<none>], sym_name = "r_bind"}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "target"}> ({
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@r_bind]>} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "bound"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (() -> ()) -> (), sym_name = "caller"}> ({
  ^bb0(%arg0: () -> ()):
    "acc.serial"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "func.call_indirect"(%arg0) : (() -> ()) -> ()
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "acc.routine"() <{bindIdName = [], bindIdNameDeviceType = [], bindStrName = ["__wrapper_my_device_func"], bindStrNameDeviceType = [#acc.device_type<none>], func_name = @my_device_func, seq = [#acc.device_type<none>], sym_name = "acc_routine_0"}> : () -> ()
  "acc.routine"() <{bindIdName = [], bindIdNameDeviceType = [], bindStrName = ["__wrapper_my_device_sub"], bindStrNameDeviceType = [#acc.device_type<none>], func_name = @my_device_sub, seq = [#acc.device_type<none>], sym_name = "acc_routine_1"}> : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "my_device_func", sym_visibility = "private"}> ({
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_0]>} : () -> ()
  "func.func"() <{function_type = (i32, memref<i32>) -> (), sym_name = "my_device_sub", sym_visibility = "private"}> ({
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_1]>} : () -> ()
  "gpu.module"() <{sym_name = "cuda_device_mod"}> ({
    "gpu.func"() <{function_type = (i32, memref<i32>) -> ()}> ({
    ^bb0(%arg0: i32, %arg1: memref<i32>):
      %0 = "func.call"(%arg0) <{callee = @my_device_func}> : (i32) -> i32
      "func.call"(%arg0, %arg1) <{callee = @my_device_sub}> : (i32, memref<i32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "test"} : () -> ()
    "func.func"() <{function_type = (i32) -> i32, sym_name = "my_device_func", sym_visibility = "private"}> ({
    }) {acc.routine_info = #acc.routine_info<[@acc_routine_0]>} : () -> ()
    "func.func"() <{function_type = (i32, memref<i32>) -> (), sym_name = "my_device_sub", sym_visibility = "private"}> ({
    }) {acc.routine_info = #acc.routine_info<[@acc_routine_1]>} : () -> ()
  }) : () -> ()
}) : () -> ()

