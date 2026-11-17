"builtin.module"() ({
  "acc.reduction.recipe"() <{reductionOperator = #acc.reduction_operator<add>, sym_name = "reduction_add_memref_i32", type = memref<i32>}> ({
  ^bb0(%arg3: memref<i32> loc("<stdin>":3:8)):
    %10 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":4:11)
    %11 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32> loc("<stdin>":5:11)
    "memref.store"(%10, %11) : (i32, memref<i32>) -> () loc("<stdin>":6:5)
    "acc.yield"(%11) : (memref<i32>) -> () loc("<stdin>":7:5)
  }, {
  ^bb0(%arg1: memref<i32> loc("<stdin>":9:8), %arg2: memref<i32> loc("<stdin>":9:28)):
    %7 = "memref.load"(%arg1) : (memref<i32>) -> i32 loc("<stdin>":10:10)
    %8 = "memref.load"(%arg2) : (memref<i32>) -> i32 loc("<stdin>":11:10)
    %9 = "arith.addi"(%7, %8) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":12:10)
    "memref.store"(%9, %arg1) : (i32, memref<i32>) -> () loc("<stdin>":13:5)
    "acc.yield"(%arg1) : (memref<i32>) -> () loc("<stdin>":14:5)
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "test_reduction_implicit_copy"}> ({
    %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":18:10)
    %1 = "arith.constant"() <{value = 100 : i32}> : () -> i32 loc("<stdin>":19:10)
    %2 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":20:10)
    %3 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32> loc("<stdin>":21:10)
    "memref.store"(%2, %3) : (i32, memref<i32>) -> () loc("<stdin>":22:5)
    "acc.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %4 = "acc.reduction"(%3) <{dataClause = #acc<data_clause acc_reduction>, implicit = false, modifiers = #acc<data_clause_modifier none>, name = "r", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @reduction_add_memref_i32, structured = true, varType = i32}> : (memref<i32>) -> memref<i32> loc("<stdin>":24:12)
      "acc.loop"(%0, %1, %0, %4) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1>}> ({
      ^bb0(%arg0: i32 loc("<stdin>":26:12)):
        %5 = "memref.load"(%4) : (memref<i32>) -> i32 loc("<stdin>":27:14)
        %6 = "arith.addi"(%5, %0) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":28:14)
        "memref.store"(%6, %4) : (i32, memref<i32>) -> () loc("<stdin>":29:9)
        "acc.yield"() : () -> () loc("<stdin>":30:9)
      }) : (i32, i32, i32, memref<i32>) -> () loc("<stdin>":25:7)
      "acc.yield"() : () -> () loc("<stdin>":32:7)
    }) : () -> () loc("<stdin>":23:5)
    "func.return"() : () -> () loc("<stdin>":34:5)
  }) : () -> () loc("<stdin>":17:3)
}) : () -> () loc("<stdin>":1:1)
