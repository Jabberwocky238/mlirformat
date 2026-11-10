"builtin.module"() ({
  "acc.routine"() <{func_name = @create, seq = [#acc.device_type<none>], sym_name = "acc_routine_create"}> : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "create"}> ({
  ^bb0(%arg17: memref<i32>):
    %20 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %21 = "acc.create"(%arg17) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    "memref.store"(%20, %21) : (i32, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_create]>} : () -> ()
  "acc.routine"() <{func_name = @copyin, seq = [#acc.device_type<none>], sym_name = "acc_routine_copyin"}> : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "copyin"}> ({
  ^bb0(%arg16: memref<i32>):
    %18 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %19 = "acc.copyin"(%arg16) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    "memref.store"(%18, %19) : (i32, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_copyin]>} : () -> ()
  "acc.routine"() <{func_name = @present, seq = [#acc.device_type<none>], sym_name = "acc_routine_present"}> : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "present"}> ({
  ^bb0(%arg15: memref<i32>):
    %16 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %17 = "acc.present"(%arg15) <{dataClause = #acc<data_clause acc_present>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    "memref.store"(%16, %17) : (i32, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_present]>} : () -> ()
  "acc.routine"() <{func_name = @copyout, seq = [#acc.device_type<none>], sym_name = "acc_routine_copyout"}> : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "copyout"}> ({
  ^bb0(%arg14: memref<i32>):
    %15 = "acc.copyin"(%arg14) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    "acc.copyout"(%15, %arg14) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<i32>, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_copyout]>} : () -> ()
  "acc.routine"() <{func_name = @delete, seq = [#acc.device_type<none>], sym_name = "acc_routine_delete"}> : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "delete"}> ({
  ^bb0(%arg13: memref<i32>):
    %14 = "acc.create"(%arg13) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    "acc.delete"(%14) <{dataClause = #acc<data_clause acc_delete>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0>, structured = true}> : (memref<i32>) -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_delete]>} : () -> ()
  "acc.routine"() <{func_name = @init_op, seq = [#acc.device_type<none>], sym_name = "acc_routine_init"}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "init_op"}> ({
    "acc.init"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_init]>} : () -> ()
  "acc.routine"() <{func_name = @shutdown_op, seq = [#acc.device_type<none>], sym_name = "acc_routine_shutdown"}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "shutdown_op"}> ({
    "acc.shutdown"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_shutdown]>} : () -> ()
  "acc.routine"() <{func_name = @wait_op, seq = [#acc.device_type<none>], sym_name = "acc_routine_wait"}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "wait_op"}> ({
    "acc.wait"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> : () -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_wait]>} : () -> ()
  "acc.routine"() <{func_name = @data_construct, seq = [#acc.device_type<none>], sym_name = "acc_routine_data"}> : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "data_construct"}> ({
  ^bb0(%arg12: memref<i32>):
    %12 = "acc.create"(%arg12) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    "acc.data"(%12) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>}> ({
      %13 = "arith.constant"() <{value = 42 : i32}> : () -> i32
      "memref.store"(%13, %arg12) : (i32, memref<i32>) -> ()
      "acc.terminator"() : () -> ()
    }) : (memref<i32>) -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_data]>} : () -> ()
  "acc.routine"() <{func_name = @parallel_construct, seq = [#acc.device_type<none>], sym_name = "acc_routine_parallel"}> : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "parallel_construct"}> ({
  ^bb0(%arg11: memref<i32>):
    "acc.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %11 = "arith.constant"() <{value = 44 : i32}> : () -> i32
      "memref.store"(%11, %arg11) : (i32, memref<i32>) -> ()
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_parallel]>} : () -> ()
  "acc.routine"() <{func_name = @serial_construct, seq = [#acc.device_type<none>], sym_name = "acc_routine_serial"}> : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "serial_construct"}> ({
  ^bb0(%arg10: memref<i32>):
    "acc.serial"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %10 = "arith.constant"() <{value = 45 : i32}> : () -> i32
      "memref.store"(%10, %arg10) : (i32, memref<i32>) -> ()
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_serial]>} : () -> ()
  "acc.routine"() <{func_name = @kernels_construct, seq = [#acc.device_type<none>], sym_name = "acc_routine_kernels"}> : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "kernels_construct"}> ({
  ^bb0(%arg9: memref<i32>):
    "acc.kernels"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %9 = "arith.constant"() <{value = 46 : i32}> : () -> i32
      "memref.store"(%9, %arg9) : (i32, memref<i32>) -> ()
      "acc.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_kernels]>} : () -> ()
  "acc.routine"() <{func_name = @declare_enter_exit, seq = [#acc.device_type<none>], sym_name = "acc_routine_declare"}> : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "declare_enter_exit"}> ({
  ^bb0(%arg8: memref<i32>):
    %7 = "acc.create"(%arg8) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    %8 = "acc.declare_enter"(%7) : (memref<i32>) -> !acc.declare_token
    "acc.declare_exit"(%8, %7) <{operandSegmentSizes = array<i32: 1, 1>}> : (!acc.declare_token, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_declare]>} : () -> ()
  "acc.routine"() <{func_name = @atomic_read, seq = [#acc.device_type<none>], sym_name = "acc_routine_atomic_read"}> : () -> ()
  "func.func"() <{function_type = (memref<f64>, memref<f64>) -> (), sym_name = "atomic_read"}> ({
  ^bb0(%arg6: memref<f64>, %arg7: memref<f64>):
    "acc.atomic.read"(%arg6, %arg7) <{element_type = f64}> : (memref<f64>, memref<f64>) -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_atomic_read]>} : () -> ()
  "acc.routine"() <{func_name = @atomic_write, seq = [#acc.device_type<none>], sym_name = "acc_routine_atomic_write"}> : () -> ()
  "func.func"() <{function_type = (memref<f64>) -> (), sym_name = "atomic_write"}> ({
  ^bb0(%arg5: memref<f64>):
    %6 = "arith.constant"() <{value = 5.000000e-01 : f64}> : () -> f64
    "acc.atomic.write"(%arg5, %6) : (memref<f64>, f64) -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_atomic_write]>} : () -> ()
  "acc.routine"() <{func_name = @atomic_update, seq = [#acc.device_type<none>], sym_name = "acc_routine_atomic_update"}> : () -> ()
  "func.func"() <{function_type = (memref<f64>) -> (), sym_name = "atomic_update"}> ({
  ^bb0(%arg3: memref<f64>):
    %3 = "arith.constant"() <{value = 5.000000e-01 : f64}> : () -> f64
    "acc.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "acc.atomic.update"(%arg3) ({
      ^bb0(%arg4: f64):
        %4 = "arith.cmpf"(%3, %arg4) <{fastmath = #arith.fastmath<contract>, predicate = 2 : i64}> : (f64, f64) -> i1
        %5 = "arith.select"(%4, %3, %arg4) : (i1, f64, f64) -> f64
        "acc.yield"(%5) : (f64) -> ()
      }) : (memref<f64>) -> ()
      "acc.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_atomic_update]>} : () -> ()
  "acc.routine"() <{func_name = @atomic_capture, seq = [#acc.device_type<none>], sym_name = "acc_routine_atomic_capture"}> : () -> ()
  "func.func"() <{function_type = (memref<f64>, memref<f64>) -> (), sym_name = "atomic_capture"}> ({
  ^bb0(%arg0: memref<f64>, %arg1: memref<f64>):
    %0 = "arith.constant"() <{value = 5.000000e-01 : f64}> : () -> f64
    "acc.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "acc.atomic.capture"() ({
        "acc.atomic.update"(%arg0) ({
        ^bb0(%arg2: f64):
          %1 = "arith.cmpf"(%0, %arg2) <{fastmath = #arith.fastmath<contract>, predicate = 2 : i64}> : (f64, f64) -> i1
          %2 = "arith.select"(%1, %0, %arg2) : (i1, f64, f64) -> f64
          "acc.yield"(%2) : (f64) -> ()
        }) : (memref<f64>) -> ()
        "acc.atomic.read"(%arg0, %arg1) <{element_type = f64}> : (memref<f64>, memref<f64>) -> ()
        "acc.terminator"() : () -> ()
      }) : () -> ()
      "acc.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_atomic_capture]>} : () -> ()
}) : () -> ()

