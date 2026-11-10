"builtin.module"() ({
  "acc.routine"() <{func_name = @attach, seq = [#acc.device_type<none>], sym_name = "acc_routine_0"}> : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "attach"}> ({
  ^bb0(%arg14: memref<i32>):
    %34 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %35 = "acc.attach"(%arg14) <{dataClause = #acc<data_clause acc_attach>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    "memref.store"(%34, %35) : (i32, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) {acc.specialized_routine = #acc.specialized_routine<@acc_routine_0, <seq>, "attach">} : () -> ()
  "acc.routine"() <{func_name = @copyin, seq = [#acc.device_type<none>], sym_name = "acc_routine_1"}> : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "copyin"}> ({
  ^bb0(%arg13: memref<i32>):
    %32 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %33 = "acc.copyin"(%arg13) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    "memref.store"(%32, %33) : (i32, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) {acc.specialized_routine = #acc.specialized_routine<@acc_routine_1, <seq>, "copyin">} : () -> ()
  "acc.routine"() <{func_name = @create, seq = [#acc.device_type<none>], sym_name = "acc_routine_2"}> : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "create"}> ({
  ^bb0(%arg12: memref<i32>):
    %30 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %31 = "acc.create"(%arg12) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    "memref.store"(%30, %31) : (i32, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) {acc.specialized_routine = #acc.specialized_routine<@acc_routine_2, <seq>, "create">} : () -> ()
  "acc.routine"() <{func_name = @present, seq = [#acc.device_type<none>], sym_name = "acc_routine_3"}> : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "present"}> ({
  ^bb0(%arg11: memref<i32>):
    %28 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %29 = "acc.present"(%arg11) <{dataClause = #acc<data_clause acc_present>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    "memref.store"(%28, %29) : (i32, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) {acc.specialized_routine = #acc.specialized_routine<@acc_routine_3, <seq>, "present">} : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "copyin_inside_parallel"}> ({
  ^bb0(%arg10: memref<i32>):
    %26 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    "acc.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %27 = "acc.copyin"(%arg10) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
      "memref.store"(%26, %27) : (i32, memref<i32>) -> ()
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "copyin_outside_parallel"}> ({
  ^bb0(%arg9: memref<i32>):
    %24 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %25 = "acc.copyin"(%arg9) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    "acc.parallel"(%25) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1>}> ({
      "memref.store"(%24, %25) : (i32, memref<i32>) -> ()
      "acc.yield"() : () -> ()
    }) : (memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<i32>, memref<i32>) -> (), sym_name = "nested_data_inside_parallel"}> ({
  ^bb0(%arg7: memref<i32>, %arg8: memref<i32>):
    %21 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %22 = "acc.copyin"(%arg7) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    "acc.parallel"(%22) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1>}> ({
      %23 = "acc.copyin"(%arg8) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
      "acc.data"(%23) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>}> ({
        "memref.store"(%21, %arg8) : (i32, memref<i32>) -> ()
        "acc.terminator"() : () -> ()
      }) : (memref<i32>) -> ()
      "acc.yield"() : () -> ()
    }) : (memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "acc.routine"() <{func_name = @copyout, sym_name = "acc_routine_copyout", worker = [#acc.device_type<none>]}> : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "copyout"}> ({
  ^bb0(%arg6: memref<i32>):
    %20 = "acc.copyin"(%arg6) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    "acc.copyout"(%20, %arg6) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<i32>, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) {acc.specialized_routine = #acc.specialized_routine<@acc_routine_copyout, <worker>, "copyout">} : () -> ()
  "acc.routine"() <{func_name = @delete, sym_name = "acc_routine_delete", worker = [#acc.device_type<none>]}> : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "delete"}> ({
  ^bb0(%arg5: memref<i32>):
    %19 = "acc.create"(%arg5) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    "acc.delete"(%19) <{dataClause = #acc<data_clause acc_delete>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0>, structured = true}> : (memref<i32>) -> ()
    "func.return"() : () -> ()
  }) {acc.specialized_routine = #acc.specialized_routine<@acc_routine_delete, <worker>, "delete">} : () -> ()
  "acc.routine"() <{func_name = @enter_data, sym_name = "acc_routine_enter_data", worker = [#acc.device_type<none>]}> : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "enter_data"}> ({
  ^bb0(%arg4: memref<i32>):
    %18 = "acc.create"(%arg4) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    "acc.enter_data"(%18) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1>}> : (memref<i32>) -> ()
    "func.return"() : () -> ()
  }) {acc.specialized_routine = #acc.specialized_routine<@acc_routine_enter_data, <worker>, "enter_data">} : () -> ()
  "acc.routine"() <{func_name = @init_op, sym_name = "acc_routine_init", worker = [#acc.device_type<none>]}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "init_op"}> ({
    "acc.init"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "func.return"() : () -> ()
  }) {acc.specialized_routine = #acc.specialized_routine<@acc_routine_init, <worker>, "init_op">} : () -> ()
  "acc.routine"() <{func_name = @wait_op, sym_name = "acc_routine_wait", worker = [#acc.device_type<none>]}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "wait_op"}> ({
    "acc.wait"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> : () -> ()
    "func.return"() : () -> ()
  }) {acc.specialized_routine = #acc.specialized_routine<@acc_routine_wait, <worker>, "wait_op">} : () -> ()
  "acc.routine"() <{func_name = @data_construct, sym_name = "acc_routine_data", worker = [#acc.device_type<none>]}> : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "data_construct"}> ({
  ^bb0(%arg3: memref<i32>):
    %16 = "acc.create"(%arg3) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    "acc.data"(%16) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>}> ({
      %17 = "arith.constant"() <{value = 42 : i32}> : () -> i32
      "memref.store"(%17, %arg3) : (i32, memref<i32>) -> ()
      "acc.terminator"() : () -> ()
    }) : (memref<i32>) -> ()
    "func.return"() : () -> ()
  }) {acc.specialized_routine = #acc.specialized_routine<@acc_routine_data, <worker>, "data_construct">} : () -> ()
  "acc.routine"() <{func_name = @parallel_construct, sym_name = "acc_routine_parallel", worker = [#acc.device_type<none>]}> : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "parallel_construct"}> ({
  ^bb0(%arg2: memref<i32>):
    "acc.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %15 = "arith.constant"() <{value = 44 : i32}> : () -> i32
      "memref.store"(%15, %arg2) : (i32, memref<i32>) -> ()
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) {acc.specialized_routine = #acc.specialized_routine<@acc_routine_parallel, <worker>, "parallel_construct">} : () -> ()
  "acc.routine"() <{func_name = @serial_construct, sym_name = "acc_routine_serial", worker = [#acc.device_type<none>]}> : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "serial_construct"}> ({
  ^bb0(%arg1: memref<i32>):
    "acc.serial"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %14 = "arith.constant"() <{value = 45 : i32}> : () -> i32
      "memref.store"(%14, %arg1) : (i32, memref<i32>) -> ()
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) {acc.specialized_routine = #acc.specialized_routine<@acc_routine_serial, <worker>, "serial_construct">} : () -> ()
  "acc.routine"() <{func_name = @kernels_construct, sym_name = "acc_routine_kernels", worker = [#acc.device_type<none>]}> : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "kernels_construct"}> ({
  ^bb0(%arg0: memref<i32>):
    "acc.kernels"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %13 = "arith.constant"() <{value = 46 : i32}> : () -> i32
      "memref.store"(%13, %arg0) : (i32, memref<i32>) -> ()
      "acc.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) {acc.specialized_routine = #acc.specialized_routine<@acc_routine_kernels, <worker>, "kernels_construct">} : () -> ()
  "acc.routine"() <{func_name = @dev_routine_declare, sym_name = "acc_routine_declare", worker = [#acc.device_type<none>]}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "dev_routine_declare"}> ({
    %10 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f32>
    %11 = "acc.create"(%10) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    %12 = "acc.declare_enter"(%11) : (memref<f32>) -> !acc.declare_token
    "acc.declare_exit"(%12, %11) <{operandSegmentSizes = array<i32: 1, 1>}> : (!acc.declare_token, memref<f32>) -> ()
    "func.return"() : () -> ()
  }) {acc.specialized_routine = #acc.specialized_routine<@acc_routine_declare, <worker>, "dev_routine_declare">} : () -> ()
  "acc.routine"() <{func_name = @fold_on_device_host, seq = [#acc.device_type<none>], sym_name = "acc_routine_on_device_host"}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "fold_on_device_host"}> ({
    %8 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %9 = "acc.on_device"(%8) : (i32) -> i1
    "test.test"(%9) : (i1) -> ()
    "func.return"() : () -> ()
  }) {acc.specialized_routine = #acc.specialized_routine<@acc_routine_on_device_host, <seq>, "fold_on_device_host">} : () -> ()
  "acc.routine"() <{func_name = @fold_on_device_not_host, seq = [#acc.device_type<none>], sym_name = "acc_routine_on_device_not_host"}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "fold_on_device_not_host"}> ({
    %6 = "arith.constant"() <{value = 3 : i32}> : () -> i32
    %7 = "acc.on_device"(%6) : (i32) -> i1
    "test.test"(%7) : (i1) -> ()
    "func.return"() : () -> ()
  }) {acc.specialized_routine = #acc.specialized_routine<@acc_routine_on_device_not_host, <seq>, "fold_on_device_not_host">} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "fold_on_device_inside_parallel"}> ({
    %4 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    "acc.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %5 = "acc.on_device"(%4) : (i32) -> i1
      "test.test"(%5) : (i1) -> ()
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "fold_on_device_inside_parallel_alt"}> ({
    %2 = "arith.constant"() <{value = 4 : i32}> : () -> i32
    "acc.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %3 = "acc.on_device"(%2) : (i32) -> i1
      "test.test"(%3) : (i1) -> ()
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "on_device_outside_parallel"}> ({
    %0 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %1 = "acc.on_device"(%0) : (i32) -> i1
    "test.test"(%1) : (i1) -> ()
    "acc.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

