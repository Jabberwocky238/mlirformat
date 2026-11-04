"builtin.module"() ({
  "acc.routine"() <{func_name = @create, seq = [#acc.device_type<none>], sym_name = "acc_routine_create"}> : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "create"}> ({
  ^bb0(%arg9: memref<i32>):
    %13 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %14 = "acc.create"(%arg9) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    "memref.store"(%13, %14) : (i32, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_create]>} : () -> ()
  "acc.routine"() <{func_name = @copyin, seq = [#acc.device_type<none>], sym_name = "acc_routine_copyin"}> : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "copyin"}> ({
  ^bb0(%arg8: memref<i32>):
    %11 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %12 = "acc.copyin"(%arg8) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    "memref.store"(%11, %12) : (i32, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_copyin]>} : () -> ()
  "acc.routine"() <{func_name = @present, seq = [#acc.device_type<none>], sym_name = "acc_routine_present"}> : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "present"}> ({
  ^bb0(%arg7: memref<i32>):
    %9 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %10 = "acc.present"(%arg7) <{dataClause = #acc<data_clause acc_present>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    "memref.store"(%9, %10) : (i32, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_present]>} : () -> ()
  "acc.routine"() <{func_name = @copyout, seq = [#acc.device_type<none>], sym_name = "acc_routine_copyout"}> : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "copyout"}> ({
  ^bb0(%arg6: memref<i32>):
    %8 = "acc.copyin"(%arg6) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    "acc.copyout"(%8, %arg6) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<i32>, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_copyout]>} : () -> ()
  "acc.routine"() <{func_name = @delete, seq = [#acc.device_type<none>], sym_name = "acc_routine_delete"}> : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "delete"}> ({
  ^bb0(%arg5: memref<i32>):
    %7 = "acc.create"(%arg5) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    "acc.delete"(%7) <{dataClause = #acc<data_clause acc_delete>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0>, structured = true}> : (memref<i32>) -> ()
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
  ^bb0(%arg4: memref<i32>):
    %5 = "acc.create"(%arg4) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    "acc.data"(%5) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>}> ({
      %6 = "arith.constant"() <{value = 42 : i32}> : () -> i32
      "memref.store"(%6, %arg4) : (i32, memref<i32>) -> ()
      "acc.terminator"() : () -> ()
    }) : (memref<i32>) -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_data]>} : () -> ()
  "acc.routine"() <{func_name = @parallel_construct, seq = [#acc.device_type<none>], sym_name = "acc_routine_parallel"}> : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "parallel_construct"}> ({
  ^bb0(%arg3: memref<i32>):
    "acc.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %4 = "arith.constant"() <{value = 44 : i32}> : () -> i32
      "memref.store"(%4, %arg3) : (i32, memref<i32>) -> ()
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_parallel]>} : () -> ()
  "acc.routine"() <{func_name = @serial_construct, seq = [#acc.device_type<none>], sym_name = "acc_routine_serial"}> : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "serial_construct"}> ({
  ^bb0(%arg2: memref<i32>):
    "acc.serial"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %3 = "arith.constant"() <{value = 45 : i32}> : () -> i32
      "memref.store"(%3, %arg2) : (i32, memref<i32>) -> ()
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_serial]>} : () -> ()
  "acc.routine"() <{func_name = @kernels_construct, seq = [#acc.device_type<none>], sym_name = "acc_routine_kernels"}> : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "kernels_construct"}> ({
  ^bb0(%arg1: memref<i32>):
    "acc.kernels"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %2 = "arith.constant"() <{value = 46 : i32}> : () -> i32
      "memref.store"(%2, %arg1) : (i32, memref<i32>) -> ()
      "acc.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_kernels]>} : () -> ()
  "acc.routine"() <{func_name = @declare_enter_exit, seq = [#acc.device_type<none>], sym_name = "acc_routine_declare"}> : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "declare_enter_exit"}> ({
  ^bb0(%arg0: memref<i32>):
    %0 = "acc.create"(%arg0) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    %1 = "acc.declare_enter"(%0) : (memref<i32>) -> !acc.declare_token
    "acc.declare_exit"(%1, %0) <{operandSegmentSizes = array<i32: 1, 1>}> : (!acc.declare_token, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_declare]>} : () -> ()
}) : () -> ()

