"builtin.module"() ({
  "func.func"() <{function_type = (memref<16xi32>) -> (), sym_name = "parallel_independent_loop"}> ({
  ^bb0(%arg0: memref<16xi32> loc("<stdin>":3:8)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":5:10)
    %2 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":6:10)
    %3 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<16xi32>) -> memref<16xi32> loc("<stdin>":7:10)
    "acc.parallel"(%3) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1>}> ({
      "acc.loop"(%0, %2, %1) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      ^bb0(%arg1: index loc("<stdin>":10:12)):
        %4 = "arith.index_cast"(%arg1) : (index) -> i32 loc("<stdin>":11:14)
        "memref.store"(%4, %3, %arg1) : (i32, memref<16xi32>, index) -> () loc("<stdin>":12:9)
        "acc.yield"() : () -> () loc("<stdin>":13:9)
      }) : (index, index, index) -> () loc("<stdin>":9:7)
      "acc.yield"() : () -> () loc("<stdin>":15:7)
    }) : (memref<16xi32>) -> () loc("<stdin>":8:5)
    "acc.copyout"(%3, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<16xi32>, memref<16xi32>) -> () loc("<stdin>":17:5)
    "func.return"() : () -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
