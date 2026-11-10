"builtin.module"() ({
  "acc.private.recipe"() <{sym_name = "privatization_memref_index", type = memref<index>}> ({
  ^bb0(%arg14: memref<index>):
    %18 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<index>
    "acc.yield"(%18) : (memref<index>) -> ()
  }, {
  ^bb0(%arg12: memref<index>, %arg13: memref<index>):
    "memref.dealloc"(%arg13) : (memref<index>) -> ()
    "acc.terminator"() : () -> ()
  }) : () -> ()
  "acc.firstprivate.recipe"() <{sym_name = "firstprivatization_memref_index", type = memref<index>}> ({
  ^bb0(%arg11: memref<index>):
    %17 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<index>
    "acc.yield"(%17) : (memref<index>) -> ()
  }, {
  ^bb0(%arg9: memref<index>, %arg10: memref<index>):
    %16 = "memref.load"(%arg9) : (memref<index>) -> index
    "memref.store"(%16, %arg10) : (index, memref<index>) -> ()
    "acc.terminator"() : () -> ()
  }, {
  ^bb0(%arg7: memref<index>, %arg8: memref<index>):
    "memref.dealloc"(%arg8) : (memref<index>) -> ()
    "acc.terminator"() : () -> ()
  }) : () -> ()
  "acc.reduction.recipe"() <{reductionOperator = #acc.reduction_operator<add>, sym_name = "reduction_add_memref_index", type = memref<index>}> ({
  ^bb0(%arg6: memref<index>):
    %14 = "arith.constant"() <{value = 0 : index}> : () -> index
    %15 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<index>
    "memref.store"(%14, %15) : (index, memref<index>) -> ()
    "acc.yield"(%15) : (memref<index>) -> ()
  }, {
  ^bb0(%arg4: memref<index>, %arg5: memref<index>):
    %11 = "memref.load"(%arg4) : (memref<index>) -> index
    %12 = "memref.load"(%arg5) : (memref<index>) -> index
    %13 = "arith.addi"(%11, %12) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    "memref.store"(%13, %arg4) : (index, memref<index>) -> ()
    "acc.yield"(%arg4) : (memref<index>) -> ()
  }, {
  ^bb0(%arg2: memref<index>, %arg3: memref<index>):
    "memref.dealloc"(%arg3) : (memref<index>) -> ()
    "acc.terminator"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<index>) -> (), sym_name = "private_loc"}> ({
  ^bb0(%arg1: memref<index>):
    %8 = "arith.constant"() <{value = 1 : index}> : () -> index
    %9 = "acc.private"(%arg1) <{dataClause = #acc<data_clause acc_private>, implicit = true, modifiers = #acc<data_clause_modifier none>, name = "priv0", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_index, structured = true, varType = index}> : (memref<index>) -> memref<index>
    "acc.parallel"(%9) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0>}> ({
      "memref.store"(%8, %9) : (index, memref<index>) -> ()
      "acc.yield"() : () -> ()
    }) {independent = [#acc.device_type<none>]} : (memref<index>) -> ()
    %10 = "acc.private"(%arg1) <{dataClause = #acc<data_clause acc_private>, implicit = true, modifiers = #acc<data_clause_modifier none>, name = "priv1", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_index, structured = true, varType = index}> : (memref<index>) -> memref<index>
    "acc.parallel"(%10) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0>}> ({
      "memref.store"(%8, %10) : (index, memref<index>) -> ()
      "acc.yield"() : () -> ()
    }) {independent = [#acc.device_type<none>]} : (memref<index>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "firstprivate_loc"}> ({
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 1 : index}> : () -> index
    %5 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<index>
    "memref.store"(%3, %5) : (index, memref<index>) -> ()
    %6 = "acc.firstprivate"(%5) <{dataClause = #acc<data_clause acc_firstprivate>, implicit = true, modifiers = #acc<data_clause_modifier none>, name = "firstpriv0", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @firstprivatization_memref_index, structured = true, varType = index}> : (memref<index>) -> memref<index>
    "acc.parallel"(%6) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0>}> ({
      "memref.store"(%4, %6) : (index, memref<index>) -> ()
      "acc.yield"() : () -> ()
    }) : (memref<index>) -> ()
    %7 = "acc.firstprivate"(%5) <{dataClause = #acc<data_clause acc_firstprivate>, implicit = true, modifiers = #acc<data_clause_modifier none>, name = "firstpriv1", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @firstprivatization_memref_index, structured = true, varType = index}> : (memref<index>) -> memref<index>
    "acc.parallel"(%7) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0>}> ({
      "memref.store"(%4, %7) : (index, memref<index>) -> ()
      "acc.yield"() : () -> ()
    }) : (memref<index>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<index>) -> (), sym_name = "reduction_loc"}> ({
  ^bb0(%arg0: memref<index>):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "acc.reduction"(%arg0) <{dataClause = #acc<data_clause acc_reduction>, implicit = false, modifiers = #acc<data_clause_modifier none>, name = "r0", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @reduction_add_memref_index, structured = true, varType = index}> : (memref<index>) -> memref<index>
    "acc.parallel"(%1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
      "memref.store"(%0, %1) : (index, memref<index>) -> ()
      "acc.yield"() : () -> ()
    }) : (memref<index>) -> ()
    %2 = "acc.reduction"(%arg0) <{dataClause = #acc<data_clause acc_reduction>, implicit = false, modifiers = #acc<data_clause_modifier none>, name = "r1", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @reduction_add_memref_index, structured = true, varType = index}> : (memref<index>) -> memref<index>
    "acc.parallel"(%2) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
      "memref.store"(%0, %2) : (index, memref<index>) -> ()
      "acc.yield"() : () -> ()
    }) : (memref<index>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

