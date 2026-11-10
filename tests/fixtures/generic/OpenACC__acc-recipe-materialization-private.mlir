"builtin.module"() ({
  "acc.private.recipe"() <{sym_name = "privatization_memref_i64", type = memref<i64>}> ({
  ^bb0(%arg6: memref<i64>):
    %8 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i64>
    "acc.yield"(%8) : (memref<i64>) -> ()
  }, {
  ^bb0(%arg4: memref<i64>, %arg5: memref<i64>):
    "memref.dealloc"(%arg5) : (memref<i64>) -> ()
    "acc.terminator"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<i64>) -> (), sym_name = "private_i64"}> ({
  ^bb0(%arg2: memref<i64>):
    %4 = "arith.constant"() <{value = 16 : index}> : () -> index
    %5 = "arith.constant"() <{value = 1 : index}> : () -> index
    %6 = "acc.private"(%arg2) <{dataClause = #acc<data_clause acc_private>, implicit = true, modifiers = #acc<data_clause_modifier none>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_i64, structured = true, varType = i64}> : (memref<i64>) -> memref<i64>
    "acc.loop"(%5, %4, %5, %6) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0>}> ({
    ^bb0(%arg3: index):
      %7 = "arith.index_cast"(%arg3) : (index) -> i64
      "memref.store"(%7, %6) : (i64, memref<i64>) -> ()
      "acc.yield"() : () -> ()
    }) : (index, index, index, memref<i64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<i64>) -> (), sym_name = "par_private_i64"}> ({
  ^bb0(%arg0: memref<i64>):
    %0 = "arith.constant"() <{value = 16 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "acc.private"(%arg0) <{dataClause = #acc<data_clause acc_private>, implicit = true, modifiers = #acc<data_clause_modifier none>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_i64, structured = true, varType = i64}> : (memref<i64>) -> memref<i64>
    "acc.parallel"(%2) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0>}> ({
      "acc.loop"(%1, %0, %1) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      ^bb0(%arg1: index):
        %3 = "arith.index_cast"(%arg1) : (index) -> i64
        "memref.store"(%3, %2) : (i64, memref<i64>) -> ()
        "acc.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "acc.yield"() : () -> ()
    }) : (memref<i64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

