"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "callee"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_serial_call"}> ({
    "acc.serial"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "func.call"() <{callee = @callee}> : () -> ()
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "leaf"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "middle"}> ({
    "func.call"() <{callee = @leaf}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_nested_calls"}> ({
    "acc.serial"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "func.call"() <{callee = @middle}> : () -> ()
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "loop_callee"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_loop_call"}> ({
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 10 : index}> : () -> index
    "acc.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "acc.loop"(%0, %1, %0) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      ^bb0(%arg0: index):
        "func.call"() <{callee = @loop_callee}> : () -> ()
        "acc.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "kernels_callee"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_kernels_call"}> ({
    "acc.kernels"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "func.call"() <{callee = @kernels_callee}> : () -> ()
      "acc.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "cycle_a"}> ({
    "func.call"() <{callee = @cycle_b}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "cycle_b"}> ({
    "func.call"() <{callee = @cycle_a}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_cyclic_calls"}> ({
    "acc.serial"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "func.call"() <{callee = @cycle_a}> : () -> ()
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "acc.routine"() <{func_name = @host_fn, seq = [#acc.device_type<none>], sym_name = "r_explicit"}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "host_fn"}> ({
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@r_explicit]>} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_explicit_routine_callee"}> ({
    "acc.serial"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "func.call"() <{callee = @host_fn}> : () -> ()
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "acc.routine"() <{bindIdName = [@bar], bindIdNameDeviceType = [#acc.device_type<none>], bindStrName = [], bindStrNameDeviceType = [], func_name = @foo, seq = [#acc.device_type<none>], sym_name = "r_bind"}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "foo"}> ({
    "func.call"() <{callee = @only_in_bound_routine}> : () -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@r_bind]>} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "bar"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "only_in_bound_routine"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_bind_skips_recursive"}> ({
    "acc.serial"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "func.call"() <{callee = @foo}> : () -> ()
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "llvm.sqrt.f32", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> (), sym_name = "test_llvm_intrinsic"}> ({
  ^bb0(%arg0: f32):
    "acc.serial"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %0 = "func.call"(%arg0) <{callee = @llvm.sqrt.f32}> : (f32) -> f32
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "outside_callee"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_call_outside_region"}> ({
    "func.call"() <{callee = @outside_callee}> : () -> ()
    "acc.serial"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (() -> ()) -> (), sym_name = "test_indirect_in_serial"}> ({
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
  "acc.routine"() <{func_name = @routine_caller, seq = [#acc.device_type<none>], sym_name = "explicit_routine"}> : () -> ()
  "func.func"() <{function_type = (() -> ()) -> (), sym_name = "routine_caller"}> ({
  ^bb0(%arg0: () -> ()):
    "func.call_indirect"(%arg0) : (() -> ()) -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@explicit_routine]>} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_undefined_callee"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f32>
    "acc.serial"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "test.call_and_store"(%0, %0) <{callee = @undefined_callee, store_before_call = false}> : (memref<f32>, memref<f32>) -> ()
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

