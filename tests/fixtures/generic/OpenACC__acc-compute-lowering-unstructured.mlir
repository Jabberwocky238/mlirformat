"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xi32>) -> (), sym_name = "parallel_unstructured_loop"}> ({
  ^bb0(%arg0: memref<10xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 10 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %4 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<10xi32>) -> memref<10xi32>
    "acc.parallel"(%4) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1>}> ({
      "acc.loop"() <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>, unstructured}> ({
        "cf.br"(%0)[^bb1] : (index) -> ()
      ^bb1(%5: index):  // 2 preds: ^bb0, ^bb2
        %6 = "arith.cmpi"(%5, %2) <{predicate = 6 : i64}> : (index, index) -> i1
        "cf.cond_br"(%6)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^bb2:  // pred: ^bb1
        "memref.store"(%3, %4, %5) : (i32, memref<10xi32>, index) -> ()
        %7 = "arith.addi"(%5, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        "cf.br"(%7)[^bb1] : (index) -> ()
      ^bb3:  // pred: ^bb1
        "acc.yield"() : () -> ()
      }) : () -> ()
      "acc.yield"() : () -> ()
    }) : (memref<10xi32>) -> ()
    "acc.copyout"(%4, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<10xi32>, memref<10xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

