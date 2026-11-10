"builtin.module"() ({
  "acc.private.recipe"() <{sym_name = "privatization_memref_i32", type = memref<i32>}> ({
  ^bb0(%arg3: memref<i32>):
    %8 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    "acc.yield"(%8) : (memref<i32>) -> ()
  }, {
  }) : () -> ()
  "func.func"() <{function_type = (memref<i32>, memref<32xi32>) -> (), sym_name = "kpriv_"}> ({
  ^bb0(%arg0: memref<i32>, %arg1: memref<32xi32>):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 32 : index}> : () -> index
    %2 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    %3 = "memref.load"(%arg0) : (memref<i32>) -> i32
    "memref.store"(%3, %2) : (i32, memref<i32>) -> ()
    %4 = "acc.copyin"(%arg1) <{dataClause = #acc<data_clause acc_copy>, implicit = true, modifiers = #acc<data_clause_modifier none>, name = "a", operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<32xi32>) -> memref<32xi32>
    %5 = "acc.private"(%2) <{dataClause = #acc<data_clause acc_private>, implicit = true, modifiers = #acc<data_clause_modifier none>, name = "s", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_i32, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    "acc.kernels"(%5, %4) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1>}> ({
      "acc.loop"(%0, %1, %0) <{inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      ^bb0(%arg2: index):
        %6 = "arith.index_cast"(%arg2) : (index) -> i32
        "memref.store"(%6, %2) : (i32, memref<i32>) -> ()
        %7 = "memref.load"(%5) : (memref<i32>) -> i32
        "memref.store"(%7, %4, %arg2) : (i32, memref<32xi32>, index) -> ()
        "acc.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "acc.terminator"() : () -> ()
    }) : (memref<i32>, memref<32xi32>) -> ()
    "acc.copyout"(%4, %arg1) <{dataClause = #acc<data_clause acc_copy>, implicit = true, modifiers = #acc<data_clause_modifier none>, name = "a", operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<32xi32>, memref<32xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

