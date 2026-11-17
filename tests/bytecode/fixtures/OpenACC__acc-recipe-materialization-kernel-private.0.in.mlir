"builtin.module"() ({
  "acc.private.recipe"() <{sym_name = "privatization_memref_i32", type = memref<i32>}> ({
  ^bb0(%arg3: memref<i32> loc("<stdin>":3:8)):
    %8 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32> loc("<stdin>":4:10)
    "acc.yield"(%8) : (memref<i32>) -> () loc("<stdin>":5:5)
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<i32>, memref<32xi32>) -> (), sym_name = "kpriv_"}> ({
  ^bb0(%arg0: memref<i32> loc("<stdin>":9:8), %arg1: memref<32xi32> loc("<stdin>":9:28)):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":10:10)
    %1 = "arith.constant"() <{value = 32 : index}> : () -> index loc("<stdin>":11:10)
    %2 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32> loc("<stdin>":12:10)
    %3 = "memref.load"(%arg0) : (memref<i32>) -> i32 loc("<stdin>":13:10)
    "memref.store"(%3, %2) : (i32, memref<i32>) -> () loc("<stdin>":14:5)
    %4 = "acc.copyin"(%arg1) <{dataClause = #acc<data_clause acc_copy>, implicit = true, modifiers = #acc<data_clause_modifier none>, name = "a", operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<32xi32>) -> memref<32xi32> loc("<stdin>":15:10)
    %5 = "acc.private"(%2) <{dataClause = #acc<data_clause acc_private>, implicit = true, modifiers = #acc<data_clause_modifier none>, name = "s", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_i32, structured = true, varType = i32}> : (memref<i32>) -> memref<i32> loc("<stdin>":16:10)
    "acc.kernels"(%5, %4) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1>}> ({
      "acc.loop"(%0, %1, %0) <{inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      ^bb0(%arg2: index loc("<stdin>":19:12)):
        %6 = "arith.index_cast"(%arg2) : (index) -> i32 loc("<stdin>":20:14)
        "memref.store"(%6, %2) : (i32, memref<i32>) -> () loc("<stdin>":21:9)
        %7 = "memref.load"(%5) : (memref<i32>) -> i32 loc("<stdin>":22:14)
        "memref.store"(%7, %4, %arg2) : (i32, memref<32xi32>, index) -> () loc("<stdin>":23:9)
        "acc.yield"() : () -> () loc("<stdin>":24:9)
      }) : (index, index, index) -> () loc("<stdin>":18:7)
      "acc.terminator"() : () -> () loc("<stdin>":26:7)
    }) : (memref<i32>, memref<32xi32>) -> () loc("<stdin>":17:5)
    "acc.copyout"(%4, %arg1) <{dataClause = #acc<data_clause acc_copy>, implicit = true, modifiers = #acc<data_clause_modifier none>, name = "a", operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<32xi32>, memref<32xi32>) -> () loc("<stdin>":28:5)
    "func.return"() : () -> () loc("<stdin>":29:5)
  }) : () -> () loc("<stdin>":8:3)
}) : () -> () loc("<stdin>":1:1)
