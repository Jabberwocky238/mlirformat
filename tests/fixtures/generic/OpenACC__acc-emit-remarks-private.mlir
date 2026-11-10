"builtin.module"() ({
  "acc.firstprivate.recipe"() <{sym_name = "firstprivatization_memref_i32", type = memref<i32>}> ({
  ^bb0(%arg15: memref<i32>):
    %28 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    "acc.yield"(%28) : (memref<i32>) -> ()
  }, {
  ^bb0(%arg13: memref<i32>, %arg14: memref<i32>):
    %27 = "memref.load"(%arg13) : (memref<i32>) -> i32
    "memref.store"(%27, %arg14) : (i32, memref<i32>) -> ()
    "acc.terminator"() : () -> ()
  }, {
  ^bb0(%arg11: memref<i32>, %arg12: memref<i32>):
    "memref.dealloc"(%arg12) : (memref<i32>) -> ()
    "acc.terminator"() : () -> ()
  }) : () -> ()
  "acc.private.recipe"() <{sym_name = "privatization_memref_i64", type = memref<i64>}> ({
  ^bb0(%arg10: memref<i64>):
    %26 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i64>
    "acc.yield"(%26) : (memref<i64>) -> ()
  }, {
  ^bb0(%arg8: memref<i64>, %arg9: memref<i64>):
    "memref.dealloc"(%arg9) : (memref<i64>) -> ()
    "acc.terminator"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "firstpriv_implicit"}> ({
    %20 = "arith.constant"() <{value = 1336 : i32}> : () -> i32
    %21 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    "memref.store"(%20, %21) : (i32, memref<i32>) -> ()
    %22 = "acc.firstprivate"(%21) <{dataClause = #acc<data_clause acc_firstprivate>, implicit = true, modifiers = #acc<data_clause_modifier none>, name = "t", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @firstprivatization_memref_i32, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    "acc.parallel"(%22) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0>}> ({
      %23 = "arith.constant"() <{value = 1 : i32}> : () -> i32
      %24 = "memref.load"(%22) : (memref<i32>) -> i32
      %25 = "arith.addi"(%24, %23) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "memref.store"(%25, %22) : (i32, memref<i32>) -> ()
      "acc.yield"() : () -> ()
    }) : (memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "firstpriv_explicit"}> ({
    %14 = "arith.constant"() <{value = 1336 : i32}> : () -> i32
    %15 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    "memref.store"(%14, %15) : (i32, memref<i32>) -> ()
    %16 = "acc.firstprivate"(%15) <{dataClause = #acc<data_clause acc_firstprivate>, implicit = false, modifiers = #acc<data_clause_modifier none>, name = "t", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @firstprivatization_memref_i32, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    "acc.parallel"(%16) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0>}> ({
      %17 = "arith.constant"() <{value = 1 : i32}> : () -> i32
      %18 = "memref.load"(%16) : (memref<i32>) -> i32
      %19 = "arith.addi"(%18, %17) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "memref.store"(%19, %16) : (i32, memref<i32>) -> ()
      "acc.yield"() : () -> ()
    }) : (memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<i64>) -> (), sym_name = "private_loop_implicit"}> ({
  ^bb0(%arg6: memref<i64>):
    %10 = "arith.constant"() <{value = 16 : index}> : () -> index
    %11 = "arith.constant"() <{value = 1 : index}> : () -> index
    %12 = "acc.private"(%arg6) <{dataClause = #acc<data_clause acc_private>, implicit = true, modifiers = #acc<data_clause_modifier none>, name = "x", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_i64, structured = true, varType = i64}> : (memref<i64>) -> memref<i64>
    "acc.loop"(%11, %10, %11, %12) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0>}> ({
    ^bb0(%arg7: index):
      %13 = "arith.index_cast"(%arg7) : (index) -> i64
      "memref.store"(%13, %12) : (i64, memref<i64>) -> ()
      "acc.yield"() : () -> ()
    }) : (index, index, index, memref<i64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<i64>) -> (), sym_name = "private_loop_unknown"}> ({
  ^bb0(%arg4: memref<i64>):
    %6 = "arith.constant"() <{value = 16 : index}> : () -> index
    %7 = "arith.constant"() <{value = 1 : index}> : () -> index
    %8 = "acc.private"(%arg4) <{dataClause = #acc<data_clause acc_private>, implicit = true, modifiers = #acc<data_clause_modifier none>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_i64, structured = true, varType = i64}> : (memref<i64>) -> memref<i64>
    "acc.loop"(%7, %6, %7, %8) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0>}> ({
    ^bb0(%arg5: index):
      %9 = "arith.index_cast"(%arg5) : (index) -> i64
      "memref.store"(%9, %8) : (i64, memref<i64>) -> ()
      "acc.yield"() : () -> ()
    }) : (index, index, index, memref<i64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<i64>) -> (), sym_name = "private_explicit"}> ({
  ^bb0(%arg2: memref<i64>):
    %2 = "arith.constant"() <{value = 16 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1 : index}> : () -> index
    %4 = "acc.private"(%arg2) <{dataClause = #acc<data_clause acc_private>, implicit = false, modifiers = #acc<data_clause_modifier none>, name = "x", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_i64, structured = true, varType = i64}> : (memref<i64>) -> memref<i64>
    "acc.parallel"(%4) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0>}> ({
      "acc.loop"(%3, %2, %3) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      ^bb0(%arg3: index):
        %5 = "arith.index_cast"(%arg3) : (index) -> i64
        "memref.store"(%5, %4) : (i64, memref<i64>) -> ()
        "acc.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "acc.yield"() : () -> ()
    }) : (memref<i64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<i64>, memref<i64>) -> (), sym_name = "multi_private_implicit"}> ({
  ^bb0(%arg0: memref<i64>, %arg1: memref<i64>):
    %0 = "acc.private"(%arg0) <{dataClause = #acc<data_clause acc_private>, implicit = true, modifiers = #acc<data_clause_modifier none>, name = "a", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_i64, structured = true, varType = i64}> : (memref<i64>) -> memref<i64>
    %1 = "acc.private"(%arg1) <{dataClause = #acc<data_clause acc_private>, implicit = true, modifiers = #acc<data_clause_modifier none>, name = "b", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_i64, structured = true, varType = i64}> : (memref<i64>) -> memref<i64>
    "acc.parallel"(%0, %1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0>}> ({
      "acc.yield"() : () -> ()
    }) : (memref<i64>, memref<i64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

