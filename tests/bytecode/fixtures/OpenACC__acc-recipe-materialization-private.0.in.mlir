"builtin.module"() ({
  "acc.private.recipe"() <{sym_name = "privatization_memref_i64", type = memref<i64>}> ({
  ^bb0(%arg6: memref<i64> loc("<stdin>":3:8)):
    %8 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i64> loc("<stdin>":4:10)
    "acc.yield"(%8) : (memref<i64>) -> () loc("<stdin>":5:5)
  }, {
  ^bb0(%arg4: memref<i64> loc("<stdin>":7:8), %arg5: memref<i64> loc("<stdin>":7:28)):
    "memref.dealloc"(%arg5) : (memref<i64>) -> () loc("<stdin>":8:5)
    "acc.terminator"() : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<i64>) -> (), sym_name = "private_i64"}> ({
  ^bb0(%arg2: memref<i64> loc("<stdin>":12:8)):
    %4 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":13:10)
    %5 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":14:10)
    %6 = "acc.private"(%arg2) <{dataClause = #acc<data_clause acc_private>, implicit = true, modifiers = #acc<data_clause_modifier none>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_i64, structured = true, varType = i64}> : (memref<i64>) -> memref<i64> loc("<stdin>":15:10)
    "acc.loop"(%5, %4, %5, %6) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0>}> ({
    ^bb0(%arg3: index loc("<stdin>":17:10)):
      %7 = "arith.index_cast"(%arg3) : (index) -> i64 loc("<stdin>":18:12)
      "memref.store"(%7, %6) : (i64, memref<i64>) -> () loc("<stdin>":19:7)
      "acc.yield"() : () -> () loc("<stdin>":20:7)
    }) : (index, index, index, memref<i64>) -> () loc("<stdin>":16:5)
    "func.return"() : () -> () loc("<stdin>":22:5)
  }) : () -> () loc("<stdin>":11:3)
  "func.func"() <{function_type = (memref<i64>) -> (), sym_name = "par_private_i64"}> ({
  ^bb0(%arg0: memref<i64> loc("<stdin>":25:8)):
    %0 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":26:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":27:10)
    %2 = "acc.private"(%arg0) <{dataClause = #acc<data_clause acc_private>, implicit = true, modifiers = #acc<data_clause_modifier none>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_i64, structured = true, varType = i64}> : (memref<i64>) -> memref<i64> loc("<stdin>":28:10)
    "acc.parallel"(%2) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0>}> ({
      "acc.loop"(%1, %0, %1) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      ^bb0(%arg1: index loc("<stdin>":31:12)):
        %3 = "arith.index_cast"(%arg1) : (index) -> i64 loc("<stdin>":32:14)
        "memref.store"(%3, %2) : (i64, memref<i64>) -> () loc("<stdin>":33:9)
        "acc.yield"() : () -> () loc("<stdin>":34:9)
      }) : (index, index, index) -> () loc("<stdin>":30:7)
      "acc.yield"() : () -> () loc("<stdin>":36:7)
    }) : (memref<i64>) -> () loc("<stdin>":29:5)
    "func.return"() : () -> () loc("<stdin>":38:5)
  }) : () -> () loc("<stdin>":24:3)
}) : () -> () loc("<stdin>":1:1)
