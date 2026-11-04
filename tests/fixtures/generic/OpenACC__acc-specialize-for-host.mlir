"builtin.module"() ({
  "acc.private.recipe"() <{sym_name = "privatization_memref_i32", type = memref<i32>}> ({
  ^bb0(%arg46: memref<i32>):
    %83 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    "acc.yield"(%83) : (memref<i32>) -> ()
  }, {
  }) : () -> ()
  "acc.firstprivate.recipe"() <{sym_name = "firstprivatization_memref_i32", type = memref<i32>}> ({
  ^bb0(%arg45: memref<i32>):
    %82 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    "acc.yield"(%82) : (memref<i32>) -> ()
  }, {
  ^bb0(%arg43: memref<i32>, %arg44: memref<i32>):
    %81 = "memref.load"(%arg43) : (memref<i32>) -> i32
    "memref.store"(%81, %arg44) : (i32, memref<i32>) -> ()
    "acc.terminator"() : () -> ()
  }, {
  }) : () -> ()
  "acc.reduction.recipe"() <{reductionOperator = #acc.reduction_operator<add>, sym_name = "reduction_add_memref_i32", type = memref<i32>}> ({
  ^bb0(%arg42: memref<i32>):
    %79 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %80 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    "memref.store"(%79, %80) : (i32, memref<i32>) -> ()
    "acc.yield"(%80) : (memref<i32>) -> ()
  }, {
  ^bb0(%arg40: memref<i32>, %arg41: memref<i32>):
    %76 = "memref.load"(%arg40) : (memref<i32>) -> i32
    %77 = "memref.load"(%arg41) : (memref<i32>) -> i32
    %78 = "arith.addi"(%76, %77) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    "memref.store"(%78, %arg40) : (i32, memref<i32>) -> ()
    "acc.yield"(%arg40) : (memref<i32>) -> ()
  }, {
  }) : () -> ()
  "acc.routine"() <{func_name = @private, seq = [#acc.device_type<none>], sym_name = "acc_routine_private"}> : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "private"}> ({
  ^bb0(%arg39: memref<i32>):
    %74 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %75 = "acc.private"(%arg39) <{dataClause = #acc<data_clause acc_private>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_i32, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    "memref.store"(%74, %75) : (i32, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_private]>} : () -> ()
  "acc.routine"() <{func_name = @cache, seq = [#acc.device_type<none>], sym_name = "acc_routine_cache"}> : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "cache"}> ({
  ^bb0(%arg38: memref<i32>):
    %72 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %73 = "acc.cache"(%arg38) <{dataClause = #acc<data_clause acc_cache>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    "memref.store"(%72, %73) : (i32, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_cache]>} : () -> ()
  "acc.routine"() <{func_name = @orphan_atomic_update, seq = [#acc.device_type<none>], sym_name = "acc_routine_atomic"}> : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "orphan_atomic_update"}> ({
  ^bb0(%arg36: memref<i32>):
    "acc.atomic.update"(%arg36) ({
    ^bb0(%arg37: i32):
      %70 = "arith.constant"() <{value = 1 : i32}> : () -> i32
      %71 = "arith.addi"(%arg37, %70) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "acc.yield"(%71) : (i32) -> ()
    }) : (memref<i32>) -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_atomic]>} : () -> ()
  "acc.routine"() <{func_name = @orphan_atomic_read, seq = [#acc.device_type<none>], sym_name = "acc_routine_atomic_read"}> : () -> ()
  "func.func"() <{function_type = (memref<i32>, memref<i32>) -> (), sym_name = "orphan_atomic_read"}> ({
  ^bb0(%arg34: memref<i32>, %arg35: memref<i32>):
    "acc.atomic.read"(%arg34, %arg35) <{element_type = i32}> : (memref<i32>, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_atomic_read]>} : () -> ()
  "acc.routine"() <{func_name = @orphan_atomic_write, seq = [#acc.device_type<none>], sym_name = "acc_routine_atomic_write"}> : () -> ()
  "func.func"() <{function_type = (memref<i32>, i32) -> (), sym_name = "orphan_atomic_write"}> ({
  ^bb0(%arg32: memref<i32>, %arg33: i32):
    "acc.atomic.write"(%arg32, %arg33) : (memref<i32>, i32) -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_atomic_write]>} : () -> ()
  "acc.routine"() <{func_name = @orphan_atomic_capture, seq = [#acc.device_type<none>], sym_name = "acc_routine_atomic_capture"}> : () -> ()
  "func.func"() <{function_type = (memref<i32>, memref<i32>) -> (), sym_name = "orphan_atomic_capture"}> ({
  ^bb0(%arg29: memref<i32>, %arg30: memref<i32>):
    %68 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    "acc.atomic.capture"() ({
      "acc.atomic.read"(%arg29, %arg30) <{element_type = i32}> : (memref<i32>, memref<i32>) -> ()
      "acc.atomic.update"(%arg29) ({
      ^bb0(%arg31: i32):
        %69 = "arith.addi"(%arg31, %68) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
        "acc.yield"(%69) : (i32) -> ()
      }) : (memref<i32>) -> ()
      "acc.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_atomic_capture]>} : () -> ()
  "acc.routine"() <{func_name = @private_attached_to_parallel, seq = [#acc.device_type<none>], sym_name = "acc_routine_private_parallel"}> : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "private_attached_to_parallel"}> ({
  ^bb0(%arg28: memref<i32>):
    %66 = "acc.private"(%arg28) <{dataClause = #acc<data_clause acc_private>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_i32, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    "acc.parallel"(%66) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0>}> ({
      %67 = "arith.constant"() <{value = 1 : i32}> : () -> i32
      "memref.store"(%67, %66) : (i32, memref<i32>) -> ()
      "acc.yield"() : () -> ()
    }) : (memref<i32>) -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_private_parallel]>} : () -> ()
  "acc.routine"() <{func_name = @atomic_inside_parallel, seq = [#acc.device_type<none>], sym_name = "acc_routine_atomic_parallel"}> : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "atomic_inside_parallel"}> ({
  ^bb0(%arg26: memref<i32>):
    "acc.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "acc.atomic.update"(%arg26) ({
      ^bb0(%arg27: i32):
        %64 = "arith.constant"() <{value = 1 : i32}> : () -> i32
        %65 = "arith.addi"(%arg27, %64) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
        "acc.yield"(%65) : (i32) -> ()
      }) : (memref<i32>) -> ()
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_atomic_parallel]>} : () -> ()
  "acc.routine"() <{func_name = @loop_inside_parallel, seq = [#acc.device_type<none>], sym_name = "acc_routine_loop_parallel"}> : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "loop_inside_parallel"}> ({
  ^bb0(%arg24: memref<i32>):
    %60 = "arith.constant"() <{value = 0 : index}> : () -> index
    %61 = "arith.constant"() <{value = 10 : index}> : () -> index
    %62 = "arith.constant"() <{value = 1 : index}> : () -> index
    "acc.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "acc.loop"(%60, %61, %62) <{inclusiveUpperbound = array<i1: true>, operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, seq = [#acc.device_type<none>]}> ({
      ^bb0(%arg25: index):
        %63 = "arith.constant"() <{value = 5 : i32}> : () -> i32
        "memref.store"(%63, %arg24) : (i32, memref<i32>) -> ()
        "acc.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_loop_parallel]>} : () -> ()
  "acc.routine"() <{func_name = @private_attached_to_loop, seq = [#acc.device_type<none>], sym_name = "acc_routine_private_loop"}> : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "private_attached_to_loop"}> ({
  ^bb0(%arg22: memref<i32>):
    %55 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %56 = "arith.constant"() <{value = 10 : i32}> : () -> i32
    %57 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %58 = "acc.private"(%arg22) <{dataClause = #acc<data_clause acc_private>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_i32, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    "acc.loop"(%55, %56, %57, %58) <{inclusiveUpperbound = array<i1: true>, operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0>, seq = [#acc.device_type<none>]}> ({
    ^bb0(%arg23: i32):
      %59 = "arith.constant"() <{value = 1 : i32}> : () -> i32
      "memref.store"(%59, %58) : (i32, memref<i32>) -> ()
      "acc.yield"() : () -> ()
    }) : (i32, i32, i32, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_private_loop]>} : () -> ()
  "acc.routine"() <{func_name = @orphan_loop, seq = [#acc.device_type<none>], sym_name = "acc_routine_loop"}> : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "orphan_loop"}> ({
  ^bb0(%arg20: memref<i32>):
    %52 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %53 = "arith.constant"() <{value = 10 : i32}> : () -> i32
    %54 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    "acc.loop"(%52, %53, %54) <{inclusiveUpperbound = array<i1: true>, operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, seq = [#acc.device_type<none>]}> ({
    ^bb0(%arg21: i32):
      "memref.store"(%arg21, %arg20) : (i32, memref<i32>) -> ()
      "acc.yield"() : () -> ()
    }) : (i32, i32, i32) -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_loop]>} : () -> ()
  "acc.routine"() <{func_name = @nested_orphan_loop, seq = [#acc.device_type<none>], sym_name = "acc_routine_nested_loop"}> : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "nested_orphan_loop"}> ({
  ^bb0(%arg17: memref<i32>):
    %48 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %49 = "arith.constant"() <{value = 10 : i32}> : () -> i32
    %50 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    "acc.loop"(%48, %48, %49, %49, %50, %50) <{inclusiveUpperbound = array<i1: true, true>, operandSegmentSizes = array<i32: 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0>, seq = [#acc.device_type<none>]}> ({
    ^bb0(%arg18: i32, %arg19: i32):
      %51 = "arith.addi"(%arg18, %arg19) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "memref.store"(%51, %arg17) : (i32, memref<i32>) -> ()
      "acc.yield"() : () -> ()
    }) : (i32, i32, i32, i32, i32, i32) -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_nested_loop]>} : () -> ()
  "acc.routine"() <{func_name = @orphan_unstructured_loop, seq = [#acc.device_type<none>], sym_name = "acc_routine_unstructured"}> : () -> ()
  "func.func"() <{function_type = (memref<32xi32>) -> (), sym_name = "orphan_unstructured_loop"}> ({
  ^bb0(%arg16: memref<32xi32>):
    %33 = "arith.constant"() <{value = 32 : i32}> : () -> i32
    %34 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %35 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %36 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %37 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    %38 = "acc.private"(%37) <{dataClause = #acc<data_clause acc_private>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_i32, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    "acc.loop"(%38) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0>, unstructured}> ({
      %39 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
      "memref.store"(%33, %39) : (i32, memref<i32>) -> ()
      "memref.store"(%36, %38) : (i32, memref<i32>) -> ()
      "cf.br"()[^bb1] : () -> ()
    ^bb1:  // 2 preds: ^bb0, ^bb2
      %40 = "memref.load"(%39) : (memref<i32>) -> i32
      %41 = "arith.cmpi"(%40, %35) <{predicate = 4 : i64}> : (i32, i32) -> i1
      "cf.cond_br"(%41)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
    ^bb2:  // pred: ^bb1
      %42 = "memref.load"(%38) : (memref<i32>) -> i32
      %43 = "arith.index_cast"(%42) : (i32) -> index
      %44 = "memref.load"(%arg16, %43) : (memref<32xi32>, index) -> i32
      %45 = "arith.divsi"(%44, %34) : (i32, i32) -> i32
      "memref.store"(%45, %arg16, %43) : (i32, memref<32xi32>, index) -> ()
      %46 = "arith.subi"(%40, %36) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "memref.store"(%46, %39) : (i32, memref<i32>) -> ()
      %47 = "arith.addi"(%42, %36) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "memref.store"(%47, %38) : (i32, memref<i32>) -> ()
      "cf.br"()[^bb1] : () -> ()
    ^bb3:  // pred: ^bb1
      "acc.yield"() : () -> ()
    }) : (memref<i32>) -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_unstructured]>} : () -> ()
  "acc.routine"() <{func_name = @orphan_loop_with_reduction, seq = [#acc.device_type<none>], sym_name = "acc_routine_loop_reduction"}> : () -> ()
  "func.func"() <{function_type = (memref<i32>, memref<100xi32>) -> (), sym_name = "orphan_loop_with_reduction"}> ({
  ^bb0(%arg13: memref<i32>, %arg14: memref<100xi32>):
    %23 = "arith.constant"() <{value = 100 : i32}> : () -> i32
    %24 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %25 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    %26 = "acc.reduction"(%arg13) <{dataClause = #acc<data_clause acc_reduction>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @reduction_add_memref_i32, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    %27 = "acc.private"(%25) <{dataClause = #acc<data_clause acc_private>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_i32, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    "acc.loop"(%24, %23, %24, %27, %26) <{inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 1>, vector = [#acc.device_type<none>]}> ({
    ^bb0(%arg15: i32):
      "memref.store"(%arg15, %27) : (i32, memref<i32>) -> ()
      %28 = "memref.load"(%27) : (memref<i32>) -> i32
      %29 = "arith.index_cast"(%28) : (i32) -> index
      %30 = "memref.load"(%arg14, %29) : (memref<100xi32>, index) -> i32
      %31 = "memref.load"(%arg13) : (memref<i32>) -> i32
      %32 = "arith.addi"(%31, %30) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "memref.store"(%32, %arg13) : (i32, memref<i32>) -> ()
      "acc.yield"() : () -> ()
    }) : (i32, i32, i32, memref<i32>, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_loop_reduction]>} : () -> ()
  "acc.routine"() <{func_name = @orphan_loop_variable_bounds, seq = [#acc.device_type<none>], sym_name = "acc_routine_var_bounds"}> : () -> ()
  "func.func"() <{function_type = (memref<i32>, memref<i32>, memref<i32>) -> (), sym_name = "orphan_loop_variable_bounds"}> ({
  ^bb0(%arg9: memref<i32>, %arg10: memref<i32>, %arg11: memref<i32>):
    %20 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %21 = "memref.load"(%arg9) : (memref<i32>) -> i32
    %22 = "memref.load"(%arg10) : (memref<i32>) -> i32
    "acc.loop"(%21, %22, %20) <{inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, vector = [#acc.device_type<none>]}> ({
    ^bb0(%arg12: i32):
      "memref.store"(%arg12, %arg11) : (i32, memref<i32>) -> ()
      "acc.yield"() : () -> ()
    }) : (i32, i32, i32) -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_var_bounds]>} : () -> ()
  "acc.reduction.recipe"() <{reductionOperator = #acc.reduction_operator<mul>, sym_name = "reduction_mul_memref_i32", type = memref<i32>}> ({
  ^bb0(%arg8: memref<i32>):
    %18 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %19 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    "memref.store"(%18, %19) : (i32, memref<i32>) -> ()
    "acc.yield"(%19) : (memref<i32>) -> ()
  }, {
  ^bb0(%arg6: memref<i32>, %arg7: memref<i32>):
    %15 = "memref.load"(%arg6) : (memref<i32>) -> i32
    %16 = "memref.load"(%arg7) : (memref<i32>) -> i32
    %17 = "arith.muli"(%15, %16) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    "memref.store"(%17, %arg6) : (i32, memref<i32>) -> ()
    "acc.yield"(%arg6) : (memref<i32>) -> ()
  }, {
  }) : () -> ()
  "func.func"() <{function_type = (memref<i32>, memref<8xi32>, memref<i32>) -> (), sym_name = "orphan_between_compute_regions"}> ({
  ^bb0(%arg0: memref<i32>, %arg1: memref<8xi32>, %arg2: memref<i32>):
    %0 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 8 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %3 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    "acc.parallel"() <{combined, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %13 = "acc.private"(%3) <{dataClause = #acc<data_clause acc_private>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_i32, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
      "acc.loop"(%2, %1, %2, %13) <{combined = #acc.combined_constructs<parallel_loop>, inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0>}> ({
      ^bb0(%arg5: i32):
        "memref.store"(%arg5, %13) : (i32, memref<i32>) -> ()
        %14 = "arith.index_cast"(%arg5) : (i32) -> index
        "memref.store"(%2, %arg1, %14) : (i32, memref<8xi32>, index) -> ()
        "acc.yield"() : () -> ()
      }) : (i32, i32, i32, memref<i32>) -> ()
      "acc.yield"() : () -> ()
    }) : () -> ()
    %4 = "acc.private"(%arg2) <{dataClause = #acc<data_clause acc_private>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_i32, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    %5 = "acc.reduction"(%arg0) <{dataClause = #acc<data_clause acc_reduction>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @reduction_mul_memref_i32, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    %6 = "acc.private"(%3) <{dataClause = #acc<data_clause acc_private>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_i32, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    "acc.loop"(%2, %1, %2, %4, %6, %5) <{inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 2, 0, 1>}> ({
    ^bb0(%arg4: i32):
      "memref.store"(%arg4, %6) : (i32, memref<i32>) -> ()
      %9 = "arith.index_cast"(%arg4) : (i32) -> index
      %10 = "memref.load"(%arg1, %9) : (memref<8xi32>, index) -> i32
      "memref.store"(%10, %4) : (i32, memref<i32>) -> ()
      %11 = "memref.load"(%4) : (memref<i32>) -> i32
      %12 = "arith.muli"(%11, %0) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "memref.store"(%12, %arg0) : (i32, memref<i32>) -> ()
      "acc.yield"() : () -> ()
    }) : (i32, i32, i32, memref<i32>, memref<i32>, memref<i32>) -> ()
    "acc.parallel"() <{combined, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %7 = "acc.private"(%3) <{dataClause = #acc<data_clause acc_private>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_i32, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
      "acc.loop"(%2, %1, %2, %7) <{combined = #acc.combined_constructs<parallel_loop>, inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0>}> ({
      ^bb0(%arg3: i32):
        "memref.store"(%arg3, %7) : (i32, memref<i32>) -> ()
        %8 = "arith.index_cast"(%arg3) : (i32) -> index
        "memref.store"(%arg3, %arg1, %8) : (i32, memref<8xi32>, index) -> ()
        "acc.yield"() : () -> ()
      }) : (i32, i32, i32, memref<i32>) -> ()
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

