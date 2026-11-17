"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xi32>, i1) -> (), sym_name = "test_parallel_if"}> ({
  ^bb0(%arg0: memref<10xi32> loc("<stdin>":3:8), %arg1: i1 loc("<stdin>":3:31)):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":5:10)
    %2 = "arith.constant"() <{value = 10 : index}> : () -> index loc("<stdin>":6:10)
    %3 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<10xi32>) -> memref<10xi32> loc("<stdin>":7:10)
    %4 = "acc.create"(%arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<10xi32>) -> memref<10xi32> loc("<stdin>":8:10)
    "acc.parallel"(%arg1, %3, %4) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 2>}> ({
      "scf.for"(%1, %2, %1) ({
      ^bb0(%arg2: index loc("<stdin>":11:12)):
        "memref.store"(%0, %arg0, %arg2) : (i32, memref<10xi32>, index) -> () loc("<stdin>":12:9)
        "scf.yield"() : () -> () loc("<stdin>":13:9)
      }) : (index, index, index) -> () loc("<stdin>":10:7)
      "acc.yield"() : () -> () loc("<stdin>":15:7)
    }) : (i1, memref<10xi32>, memref<10xi32>) -> () loc("<stdin>":9:5)
    "acc.delete"(%4) <{dataClause = #acc<data_clause acc_delete>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0>, structured = true}> : (memref<10xi32>) -> () loc("<stdin>":17:5)
    "acc.copyout"(%3, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<10xi32>, memref<10xi32>) -> () loc("<stdin>":18:5)
    "func.return"() : () -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
