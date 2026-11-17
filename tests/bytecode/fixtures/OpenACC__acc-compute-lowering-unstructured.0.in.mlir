"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xi32>) -> (), sym_name = "parallel_unstructured_loop"}> ({
  ^bb0(%arg0: memref<10xi32> loc("<stdin>":3:8)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":5:10)
    %2 = "arith.constant"() <{value = 10 : index}> : () -> index loc("<stdin>":6:10)
    %3 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":7:10)
    %4 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<10xi32>) -> memref<10xi32> loc("<stdin>":8:10)
    "acc.parallel"(%4) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1>}> ({
      "acc.loop"() <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>, unstructured}> ({
        "cf.br"(%0)[^bb1] : (index) -> () loc("<stdin>":11:9)
      ^bb1(%5: index loc("<stdin>":12:12)):  // 2 preds: ^bb0, ^bb2
        %6 = "arith.cmpi"(%5, %2) <{predicate = 6 : i64}> : (index, index) -> i1 loc("<stdin>":13:14)
        "cf.cond_br"(%6)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":14:9)
      ^bb2:  // pred: ^bb1
        "memref.store"(%3, %4, %5) : (i32, memref<10xi32>, index) -> () loc("<stdin>":16:9)
        %7 = "arith.addi"(%5, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":17:14)
        "cf.br"(%7)[^bb1] : (index) -> () loc("<stdin>":18:9)
      ^bb3:  // pred: ^bb1
        "acc.yield"() : () -> () loc("<stdin>":20:9)
      }) : () -> () loc("<stdin>":10:7)
      "acc.yield"() : () -> () loc("<stdin>":22:7)
    }) : (memref<10xi32>) -> () loc("<stdin>":9:5)
    "acc.copyout"(%4, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<10xi32>, memref<10xi32>) -> () loc("<stdin>":24:5)
    "func.return"() : () -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
