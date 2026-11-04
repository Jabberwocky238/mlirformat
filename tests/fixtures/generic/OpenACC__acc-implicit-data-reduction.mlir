"builtin.module"() ({
  "acc.reduction.recipe"() <{reductionOperator = #acc.reduction_operator<add>, sym_name = "reduction_add_memref_i32", type = memref<i32>}> ({
  ^bb0(%arg3: memref<i32>):
    %10 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %11 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    "memref.store"(%10, %11) : (i32, memref<i32>) -> ()
    "acc.yield"(%11) : (memref<i32>) -> ()
  }, {
  ^bb0(%arg1: memref<i32>, %arg2: memref<i32>):
    %7 = "memref.load"(%arg1) : (memref<i32>) -> i32
    %8 = "memref.load"(%arg2) : (memref<i32>) -> i32
    %9 = "arith.addi"(%7, %8) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    "memref.store"(%9, %arg1) : (i32, memref<i32>) -> ()
    "acc.yield"(%arg1) : (memref<i32>) -> ()
  }, {
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_reduction_implicit_copy"}> ({
    %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 100 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %3 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    "memref.store"(%2, %3) : (i32, memref<i32>) -> ()
    "acc.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %4 = "acc.reduction"(%3) <{dataClause = #acc<data_clause acc_reduction>, implicit = false, modifiers = #acc<data_clause_modifier none>, name = "r", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @reduction_add_memref_i32, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
      "acc.loop"(%0, %1, %0, %4) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1>}> ({
      ^bb0(%arg0: i32):
        %5 = "memref.load"(%4) : (memref<i32>) -> i32
        %6 = "arith.addi"(%5, %0) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
        "memref.store"(%6, %4) : (i32, memref<i32>) -> ()
        "acc.yield"() : () -> ()
      }) : (i32, i32, i32, memref<i32>) -> ()
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "acc.reduction.recipe"() <{reductionOperator = #acc.reduction_operator<add>, sym_name = "reduction_add_memref_i32_2", type = memref<i32>}> ({
  ^bb0(%arg3: memref<i32>):
    %13 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %14 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    "memref.store"(%13, %14) : (i32, memref<i32>) -> ()
    "acc.yield"(%14) : (memref<i32>) -> ()
  }, {
  ^bb0(%arg1: memref<i32>, %arg2: memref<i32>):
    %10 = "memref.load"(%arg1) : (memref<i32>) -> i32
    %11 = "memref.load"(%arg2) : (memref<i32>) -> i32
    %12 = "arith.addi"(%10, %11) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    "memref.store"(%12, %arg1) : (i32, memref<i32>) -> ()
    "acc.yield"(%arg1) : (memref<i32>) -> ()
  }, {
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_reduction_with_usage_outside_loop"}> ({
    %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 100 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %3 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    %4 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    "memref.store"(%2, %3) : (i32, memref<i32>) -> ()
    %5 = "acc.create"(%4) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, name = "out", operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    "acc.parallel"(%5) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1>}> ({
      %6 = "acc.reduction"(%3) <{dataClause = #acc<data_clause acc_reduction>, implicit = false, modifiers = #acc<data_clause_modifier none>, name = "r", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @reduction_add_memref_i32_2, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
      "acc.loop"(%0, %1, %0, %6) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1>}> ({
      ^bb0(%arg0: i32):
        %8 = "memref.load"(%6) : (memref<i32>) -> i32
        %9 = "arith.addi"(%8, %0) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
        "memref.store"(%9, %6) : (i32, memref<i32>) -> ()
        "acc.yield"() : () -> ()
      }) : (i32, i32, i32, memref<i32>) -> ()
      %7 = "memref.load"(%3) : (memref<i32>) -> i32
      "memref.store"(%7, %5) : (i32, memref<i32>) -> ()
      "acc.yield"() : () -> ()
    }) : (memref<i32>) -> ()
    "acc.copyout"(%5, %4) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, name = "out", operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<i32>, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

