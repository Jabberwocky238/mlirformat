"builtin.module"() ({
  "acc.private.recipe"() <{sym_name = "privatization_memref_index", type = memref<index>}> ({
  ^bb0(%arg14: memref<index> loc("<stdin>":3:8)):
    %18 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<index> loc("<stdin>":4:11)
    "acc.yield"(%18) : (memref<index>) -> () loc("<stdin>":5:5)
  }, {
  ^bb0(%arg12: memref<index> loc("<stdin>":7:8), %arg13: memref<index> loc("<stdin>":7:31)):
    "memref.dealloc"(%arg13) : (memref<index>) -> () loc("<stdin>":8:5)
    "acc.terminator"() : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
  "acc.firstprivate.recipe"() <{sym_name = "firstprivatization_memref_index", type = memref<index>}> ({
  ^bb0(%arg11: memref<index> loc("<stdin>":12:8)):
    %17 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<index> loc("<stdin>":13:11)
    "acc.yield"(%17) : (memref<index>) -> () loc("<stdin>":14:5)
  }, {
  ^bb0(%arg9: memref<index> loc("<stdin>":16:8), %arg10: memref<index> loc("<stdin>":16:30)):
    %16 = "memref.load"(%arg9) : (memref<index>) -> index loc("<stdin>":17:11)
    "memref.store"(%16, %arg10) : (index, memref<index>) -> () loc("<stdin>":18:5)
    "acc.terminator"() : () -> () loc("<stdin>":19:5)
  }, {
  ^bb0(%arg7: memref<index> loc("<stdin>":21:8), %arg8: memref<index> loc("<stdin>":21:30)):
    "memref.dealloc"(%arg8) : (memref<index>) -> () loc("<stdin>":22:5)
    "acc.terminator"() : () -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":11:3)
  "acc.reduction.recipe"() <{reductionOperator = #acc.reduction_operator<add>, sym_name = "reduction_add_memref_index", type = memref<index>}> ({
  ^bb0(%arg6: memref<index> loc("<stdin>":26:8)):
    %14 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":27:11)
    %15 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<index> loc("<stdin>":28:11)
    "memref.store"(%14, %15) : (index, memref<index>) -> () loc("<stdin>":29:5)
    "acc.yield"(%15) : (memref<index>) -> () loc("<stdin>":30:5)
  }, {
  ^bb0(%arg4: memref<index> loc("<stdin>":32:8), %arg5: memref<index> loc("<stdin>":32:30)):
    %11 = "memref.load"(%arg4) : (memref<index>) -> index loc("<stdin>":33:11)
    %12 = "memref.load"(%arg5) : (memref<index>) -> index loc("<stdin>":34:11)
    %13 = "arith.addi"(%11, %12) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":35:11)
    "memref.store"(%13, %arg4) : (index, memref<index>) -> () loc("<stdin>":36:5)
    "acc.yield"(%arg4) : (memref<index>) -> () loc("<stdin>":37:5)
  }, {
  ^bb0(%arg2: memref<index> loc("<stdin>":39:8), %arg3: memref<index> loc("<stdin>":39:30)):
    "memref.dealloc"(%arg3) : (memref<index>) -> () loc("<stdin>":40:5)
    "acc.terminator"() : () -> () loc("<stdin>":41:5)
  }) : () -> () loc("<stdin>":25:3)
  "func.func"() <{function_type = (memref<index>) -> (), sym_name = "private_loc"}> ({
  ^bb0(%arg1: memref<index> loc("<stdin>":44:8)):
    %8 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":45:10)
    %9 = "acc.private"(%arg1) <{dataClause = #acc<data_clause acc_private>, implicit = true, modifiers = #acc<data_clause_modifier none>, name = "priv0", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_index, structured = true, varType = index}> : (memref<index>) -> memref<index> loc("<stdin>":46:10)
    "acc.parallel"(%9) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0>}> ({
      "memref.store"(%8, %9) : (index, memref<index>) -> () loc("<stdin>":48:7)
      "acc.yield"() : () -> () loc("<stdin>":49:7)
    }) {independent = [#acc.device_type<none>]} : (memref<index>) -> () loc("<stdin>":47:5)
    %10 = "acc.private"(%arg1) <{dataClause = #acc<data_clause acc_private>, implicit = true, modifiers = #acc<data_clause_modifier none>, name = "priv1", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_index, structured = true, varType = index}> : (memref<index>) -> memref<index> loc("<stdin>":51:11)
    "acc.parallel"(%10) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0>}> ({
      "memref.store"(%8, %10) : (index, memref<index>) -> () loc("<stdin>":53:7)
      "acc.yield"() : () -> () loc("<stdin>":54:7)
    }) {independent = [#acc.device_type<none>]} : (memref<index>) -> () loc("<stdin>":52:5)
    "func.return"() : () -> () loc("<stdin>":56:5)
  }) : () -> () loc("<stdin>":43:3)
  "func.func"() <{function_type = () -> (), sym_name = "firstprivate_loc"}> ({
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":59:10)
    %4 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":60:10)
    %5 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<index> loc("<stdin>":61:10)
    "memref.store"(%3, %5) : (index, memref<index>) -> () loc("<stdin>":62:5)
    %6 = "acc.firstprivate"(%5) <{dataClause = #acc<data_clause acc_firstprivate>, implicit = true, modifiers = #acc<data_clause_modifier none>, name = "firstpriv0", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @firstprivatization_memref_index, structured = true, varType = index}> : (memref<index>) -> memref<index> loc("<stdin>":63:10)
    "acc.parallel"(%6) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0>}> ({
      "memref.store"(%4, %6) : (index, memref<index>) -> () loc("<stdin>":65:7)
      "acc.yield"() : () -> () loc("<stdin>":66:7)
    }) : (memref<index>) -> () loc("<stdin>":64:5)
    %7 = "acc.firstprivate"(%5) <{dataClause = #acc<data_clause acc_firstprivate>, implicit = true, modifiers = #acc<data_clause_modifier none>, name = "firstpriv1", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @firstprivatization_memref_index, structured = true, varType = index}> : (memref<index>) -> memref<index> loc("<stdin>":68:10)
    "acc.parallel"(%7) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0>}> ({
      "memref.store"(%4, %7) : (index, memref<index>) -> () loc("<stdin>":70:7)
      "acc.yield"() : () -> () loc("<stdin>":71:7)
    }) : (memref<index>) -> () loc("<stdin>":69:5)
    "func.return"() : () -> () loc("<stdin>":73:5)
  }) : () -> () loc("<stdin>":58:3)
  "func.func"() <{function_type = (memref<index>) -> (), sym_name = "reduction_loc"}> ({
  ^bb0(%arg0: memref<index> loc("<stdin>":76:8)):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":77:10)
    %1 = "acc.reduction"(%arg0) <{dataClause = #acc<data_clause acc_reduction>, implicit = false, modifiers = #acc<data_clause_modifier none>, name = "r0", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @reduction_add_memref_index, structured = true, varType = index}> : (memref<index>) -> memref<index> loc("<stdin>":78:10)
    "acc.parallel"(%1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
      "memref.store"(%0, %1) : (index, memref<index>) -> () loc("<stdin>":80:7)
      "acc.yield"() : () -> () loc("<stdin>":81:7)
    }) : (memref<index>) -> () loc("<stdin>":79:5)
    %2 = "acc.reduction"(%arg0) <{dataClause = #acc<data_clause acc_reduction>, implicit = false, modifiers = #acc<data_clause_modifier none>, name = "r1", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @reduction_add_memref_index, structured = true, varType = index}> : (memref<index>) -> memref<index> loc("<stdin>":83:10)
    "acc.parallel"(%2) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
      "memref.store"(%0, %2) : (index, memref<index>) -> () loc("<stdin>":85:7)
      "acc.yield"() : () -> () loc("<stdin>":86:7)
    }) : (memref<index>) -> () loc("<stdin>":84:5)
    "func.return"() : () -> () loc("<stdin>":88:5)
  }) : () -> () loc("<stdin>":75:3)
}) : () -> () loc("<stdin>":1:1)
