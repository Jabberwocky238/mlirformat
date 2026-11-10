"builtin.module"() ({
  "acc.firstprivate.recipe"() <{sym_name = "firstprivatization_memref_i32", type = memref<i32>}> ({
  ^bb0(%arg5: memref<i32>):
    %8 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    "acc.yield"(%8) : (memref<i32>) -> ()
  }, {
  ^bb0(%arg3: memref<i32>, %arg4: memref<i32>):
    %7 = "memref.load"(%arg3) : (memref<i32>) -> i32
    "memref.store"(%7, %arg4) : (i32, memref<i32>) -> ()
    "acc.terminator"() : () -> ()
  }, {
  ^bb0(%arg1: memref<i32>, %arg2: memref<i32>):
    "memref.dealloc"(%arg2) : (memref<i32>) -> ()
    "acc.terminator"() : () -> ()
  }) : () -> ()
  "acc.private.recipe"() <{sym_name = "privatization_memref_i32", type = memref<i32>}> ({
  ^bb0(%arg0: memref<i32>):
    %6 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    "acc.yield"(%6) : (memref<i32>) -> ()
  }, {
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "firstpriv"}> ({
    %0 = "arith.constant"() <{value = 1336 : i32}> : () -> i32
    %1 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    "memref.store"(%0, %1) : (i32, memref<i32>) -> ()
    %2 = "acc.firstprivate"(%1) <{dataClause = #acc<data_clause acc_firstprivate>, implicit = true, modifiers = #acc<data_clause_modifier none>, name = "t", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @firstprivatization_memref_i32, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    "acc.parallel"(%2) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0>}> ({
      %3 = "arith.constant"() <{value = 1 : i32}> : () -> i32
      %4 = "memref.load"(%2) : (memref<i32>) -> i32
      %5 = "arith.addi"(%4, %3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "memref.store"(%5, %2) : (i32, memref<i32>) -> ()
      "acc.yield"() : () -> ()
    }) : (memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

