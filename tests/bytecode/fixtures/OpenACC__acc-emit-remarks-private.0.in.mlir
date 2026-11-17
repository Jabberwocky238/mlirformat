"builtin.module"() ({
  "acc.firstprivate.recipe"() <{sym_name = "firstprivatization_memref_i32", type = memref<i32>}> ({
  ^bb0(%arg15: memref<i32> loc("<stdin>":3:8)):
    %28 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32> loc("<stdin>":4:11)
    "acc.yield"(%28) : (memref<i32>) -> () loc("<stdin>":5:5)
  }, {
  ^bb0(%arg13: memref<i32> loc("<stdin>":7:8), %arg14: memref<i32> loc("<stdin>":7:29)):
    %27 = "memref.load"(%arg13) : (memref<i32>) -> i32 loc("<stdin>":8:11)
    "memref.store"(%27, %arg14) : (i32, memref<i32>) -> () loc("<stdin>":9:5)
    "acc.terminator"() : () -> () loc("<stdin>":10:5)
  }, {
  ^bb0(%arg11: memref<i32> loc("<stdin>":12:8), %arg12: memref<i32> loc("<stdin>":12:29)):
    "memref.dealloc"(%arg12) : (memref<i32>) -> () loc("<stdin>":13:5)
    "acc.terminator"() : () -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":2:3)
  "acc.private.recipe"() <{sym_name = "privatization_memref_i64", type = memref<i64>}> ({
  ^bb0(%arg10: memref<i64> loc("<stdin>":17:8)):
    %26 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i64> loc("<stdin>":18:11)
    "acc.yield"(%26) : (memref<i64>) -> () loc("<stdin>":19:5)
  }, {
  ^bb0(%arg8: memref<i64> loc("<stdin>":21:8), %arg9: memref<i64> loc("<stdin>":21:28)):
    "memref.dealloc"(%arg9) : (memref<i64>) -> () loc("<stdin>":22:5)
    "acc.terminator"() : () -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":16:3)
  "func.func"() <{function_type = () -> (), sym_name = "firstpriv_implicit"}> ({
    %20 = "arith.constant"() <{value = 1336 : i32}> : () -> i32 loc("<stdin>":26:11)
    %21 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32> loc("<stdin>":27:11)
    "memref.store"(%20, %21) : (i32, memref<i32>) -> () loc("<stdin>":28:5)
    %22 = "acc.firstprivate"(%21) <{dataClause = #acc<data_clause acc_firstprivate>, implicit = true, modifiers = #acc<data_clause_modifier none>, name = "t", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @firstprivatization_memref_i32, structured = true, varType = i32}> : (memref<i32>) -> memref<i32> loc("<stdin>":29:11)
    "acc.parallel"(%22) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0>}> ({
      %23 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":31:13)
      %24 = "memref.load"(%22) : (memref<i32>) -> i32 loc("<stdin>":32:13)
      %25 = "arith.addi"(%24, %23) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":33:13)
      "memref.store"(%25, %22) : (i32, memref<i32>) -> () loc("<stdin>":34:7)
      "acc.yield"() : () -> () loc("<stdin>":35:7)
    }) : (memref<i32>) -> () loc("<stdin>":30:5)
    "func.return"() : () -> () loc("<stdin>":37:5)
  }) : () -> () loc("<stdin>":25:3)
  "func.func"() <{function_type = () -> (), sym_name = "firstpriv_explicit"}> ({
    %14 = "arith.constant"() <{value = 1336 : i32}> : () -> i32 loc("<stdin>":40:11)
    %15 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32> loc("<stdin>":41:11)
    "memref.store"(%14, %15) : (i32, memref<i32>) -> () loc("<stdin>":42:5)
    %16 = "acc.firstprivate"(%15) <{dataClause = #acc<data_clause acc_firstprivate>, implicit = false, modifiers = #acc<data_clause_modifier none>, name = "t", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @firstprivatization_memref_i32, structured = true, varType = i32}> : (memref<i32>) -> memref<i32> loc("<stdin>":43:11)
    "acc.parallel"(%16) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0>}> ({
      %17 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":45:13)
      %18 = "memref.load"(%16) : (memref<i32>) -> i32 loc("<stdin>":46:13)
      %19 = "arith.addi"(%18, %17) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":47:13)
      "memref.store"(%19, %16) : (i32, memref<i32>) -> () loc("<stdin>":48:7)
      "acc.yield"() : () -> () loc("<stdin>":49:7)
    }) : (memref<i32>) -> () loc("<stdin>":44:5)
    "func.return"() : () -> () loc("<stdin>":51:5)
  }) : () -> () loc("<stdin>":39:3)
  "func.func"() <{function_type = (memref<i64>) -> (), sym_name = "private_loop_implicit"}> ({
  ^bb0(%arg6: memref<i64> loc("<stdin>":54:8)):
    %10 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":55:11)
    %11 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":56:11)
    %12 = "acc.private"(%arg6) <{dataClause = #acc<data_clause acc_private>, implicit = true, modifiers = #acc<data_clause_modifier none>, name = "x", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_i64, structured = true, varType = i64}> : (memref<i64>) -> memref<i64> loc("<stdin>":57:11)
    "acc.loop"(%11, %10, %11, %12) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0>}> ({
    ^bb0(%arg7: index loc("<stdin>":59:10)):
      %13 = "arith.index_cast"(%arg7) : (index) -> i64 loc("<stdin>":60:13)
      "memref.store"(%13, %12) : (i64, memref<i64>) -> () loc("<stdin>":61:7)
      "acc.yield"() : () -> () loc("<stdin>":62:7)
    }) : (index, index, index, memref<i64>) -> () loc("<stdin>":58:5)
    "func.return"() : () -> () loc("<stdin>":64:5)
  }) : () -> () loc("<stdin>":53:3)
  "func.func"() <{function_type = (memref<i64>) -> (), sym_name = "private_loop_unknown"}> ({
  ^bb0(%arg4: memref<i64> loc("<stdin>":67:8)):
    %6 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":68:10)
    %7 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":69:10)
    %8 = "acc.private"(%arg4) <{dataClause = #acc<data_clause acc_private>, implicit = true, modifiers = #acc<data_clause_modifier none>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_i64, structured = true, varType = i64}> : (memref<i64>) -> memref<i64> loc("<stdin>":70:10)
    "acc.loop"(%7, %6, %7, %8) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0>}> ({
    ^bb0(%arg5: index loc("<stdin>":72:10)):
      %9 = "arith.index_cast"(%arg5) : (index) -> i64 loc("<stdin>":73:12)
      "memref.store"(%9, %8) : (i64, memref<i64>) -> () loc("<stdin>":74:7)
      "acc.yield"() : () -> () loc("<stdin>":75:7)
    }) : (index, index, index, memref<i64>) -> () loc("<stdin>":71:5)
    "func.return"() : () -> () loc("<stdin>":77:5)
  }) : () -> () loc("<stdin>":66:3)
  "func.func"() <{function_type = (memref<i64>) -> (), sym_name = "private_explicit"}> ({
  ^bb0(%arg2: memref<i64> loc("<stdin>":80:8)):
    %2 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":81:10)
    %3 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":82:10)
    %4 = "acc.private"(%arg2) <{dataClause = #acc<data_clause acc_private>, implicit = false, modifiers = #acc<data_clause_modifier none>, name = "x", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_i64, structured = true, varType = i64}> : (memref<i64>) -> memref<i64> loc("<stdin>":83:10)
    "acc.parallel"(%4) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0>}> ({
      "acc.loop"(%3, %2, %3) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      ^bb0(%arg3: index loc("<stdin>":86:12)):
        %5 = "arith.index_cast"(%arg3) : (index) -> i64 loc("<stdin>":87:14)
        "memref.store"(%5, %4) : (i64, memref<i64>) -> () loc("<stdin>":88:9)
        "acc.yield"() : () -> () loc("<stdin>":89:9)
      }) : (index, index, index) -> () loc("<stdin>":85:7)
      "acc.yield"() : () -> () loc("<stdin>":91:7)
    }) : (memref<i64>) -> () loc("<stdin>":84:5)
    "func.return"() : () -> () loc("<stdin>":93:5)
  }) : () -> () loc("<stdin>":79:3)
  "func.func"() <{function_type = (memref<i64>, memref<i64>) -> (), sym_name = "multi_private_implicit"}> ({
  ^bb0(%arg0: memref<i64> loc("<stdin>":96:8), %arg1: memref<i64> loc("<stdin>":96:28)):
    %0 = "acc.private"(%arg0) <{dataClause = #acc<data_clause acc_private>, implicit = true, modifiers = #acc<data_clause_modifier none>, name = "a", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_i64, structured = true, varType = i64}> : (memref<i64>) -> memref<i64> loc("<stdin>":97:10)
    %1 = "acc.private"(%arg1) <{dataClause = #acc<data_clause acc_private>, implicit = true, modifiers = #acc<data_clause_modifier none>, name = "b", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_i64, structured = true, varType = i64}> : (memref<i64>) -> memref<i64> loc("<stdin>":98:10)
    "acc.parallel"(%0, %1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0>}> ({
      "acc.yield"() : () -> () loc("<stdin>":100:7)
    }) : (memref<i64>, memref<i64>) -> () loc("<stdin>":99:5)
    "func.return"() : () -> () loc("<stdin>":102:5)
  }) : () -> () loc("<stdin>":95:3)
}) : () -> () loc("<stdin>":1:1)
