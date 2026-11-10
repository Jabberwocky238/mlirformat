"builtin.module"() ({
  "acc.firstprivate.recipe"() <{sym_name = "firstprivatization_two_allocs", type = memref<i32>}> ({
  ^bb0(%arg2: memref<i32>):
    %5 = "arith.constant"() <{value = 42 : i32}> : () -> i32
    %6 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> {acc.var_name = #acc.var_name<"<acc.varname.placeholder>">} : () -> memref<i32>
    "memref.store"(%5, %6) : (i32, memref<i32>) -> ()
    %7 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> {acc.var_name = #acc.var_name<"<acc.varname.placeholder>">} : () -> memref<i32>
    %8 = "memref.load"(%6) : (memref<i32>) -> i32
    "memref.store"(%8, %7) : (i32, memref<i32>) -> ()
    "acc.yield"(%7) : (memref<i32>) -> ()
  }, {
  ^bb0(%arg0: memref<i32>, %arg1: memref<i32>):
    %4 = "memref.load"(%arg0) : (memref<i32>) -> i32
    "memref.store"(%4, %arg1) : (i32, memref<i32>) -> ()
    "acc.terminator"() : () -> ()
  }, {
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "firstpriv_two_allocs"}> ({
    %2 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    %3 = "acc.firstprivate"(%2) <{dataClause = #acc<data_clause acc_firstprivate>, implicit = false, modifiers = #acc<data_clause_modifier none>, name = "t", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @firstprivatization_two_allocs, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    "acc.parallel"(%3) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0>}> ({
      "acc.yield"() : () -> ()
    }) : (memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "firstpriv_two_allocs_no_name"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    %1 = "acc.firstprivate"(%0) <{dataClause = #acc<data_clause acc_firstprivate>, implicit = false, modifiers = #acc<data_clause_modifier none>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @firstprivatization_two_allocs, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    "acc.parallel"(%1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0>}> ({
      "acc.yield"() : () -> ()
    }) : (memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

