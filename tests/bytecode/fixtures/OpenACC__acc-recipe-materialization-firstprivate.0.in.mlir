"builtin.module"() ({
  "acc.firstprivate.recipe"() <{sym_name = "firstprivatization_memref_i32", type = memref<i32>}> ({
  ^bb0(%arg5: memref<i32> loc("<stdin>":3:8)):
    %8 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32> loc("<stdin>":4:10)
    "acc.yield"(%8) : (memref<i32>) -> () loc("<stdin>":5:5)
  }, {
  ^bb0(%arg3: memref<i32> loc("<stdin>":7:8), %arg4: memref<i32> loc("<stdin>":7:28)):
    %7 = "memref.load"(%arg3) : (memref<i32>) -> i32 loc("<stdin>":8:10)
    "memref.store"(%7, %arg4) : (i32, memref<i32>) -> () loc("<stdin>":9:5)
    "acc.terminator"() : () -> () loc("<stdin>":10:5)
  }, {
  ^bb0(%arg1: memref<i32> loc("<stdin>":12:8), %arg2: memref<i32> loc("<stdin>":12:28)):
    "memref.dealloc"(%arg2) : (memref<i32>) -> () loc("<stdin>":13:5)
    "acc.terminator"() : () -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":2:3)
  "acc.private.recipe"() <{sym_name = "privatization_memref_i32", type = memref<i32>}> ({
  ^bb0(%arg0: memref<i32> loc("<stdin>":17:8)):
    %6 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32> loc("<stdin>":18:10)
    "acc.yield"(%6) : (memref<i32>) -> () loc("<stdin>":19:5)
  }, {
  }) : () -> () loc("<stdin>":16:3)
  "func.func"() <{function_type = () -> (), sym_name = "firstpriv"}> ({
    %0 = "arith.constant"() <{value = 1336 : i32}> : () -> i32 loc("<stdin>":23:10)
    %1 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32> loc("<stdin>":24:10)
    "memref.store"(%0, %1) : (i32, memref<i32>) -> () loc("<stdin>":25:5)
    %2 = "acc.firstprivate"(%1) <{dataClause = #acc<data_clause acc_firstprivate>, implicit = true, modifiers = #acc<data_clause_modifier none>, name = "t", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @firstprivatization_memref_i32, structured = true, varType = i32}> : (memref<i32>) -> memref<i32> loc("<stdin>":26:10)
    "acc.parallel"(%2) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0>}> ({
      %3 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":28:12)
      %4 = "memref.load"(%2) : (memref<i32>) -> i32 loc("<stdin>":29:12)
      %5 = "arith.addi"(%4, %3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":30:12)
      "memref.store"(%5, %2) : (i32, memref<i32>) -> () loc("<stdin>":31:7)
      "acc.yield"() : () -> () loc("<stdin>":32:7)
    }) : (memref<i32>) -> () loc("<stdin>":27:5)
    "func.return"() : () -> () loc("<stdin>":34:5)
  }) : () -> () loc("<stdin>":22:3)
}) : () -> () loc("<stdin>":1:1)
