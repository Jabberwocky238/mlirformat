"builtin.module"() ({
  "acc.firstprivate.recipe"() <{sym_name = "firstprivatization_two_allocs", type = memref<i32>}> ({
  ^bb0(%arg2: memref<i32> loc("<stdin>":3:8)):
    %5 = "arith.constant"() <{value = 42 : i32}> : () -> i32 loc("<stdin>":4:10)
    %6 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> {acc.var_name = #acc.var_name<"<acc.varname.placeholder>">} : () -> memref<i32> loc("<stdin>":5:10)
    "memref.store"(%5, %6) : (i32, memref<i32>) -> () loc("<stdin>":6:5)
    %7 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> {acc.var_name = #acc.var_name<"<acc.varname.placeholder>">} : () -> memref<i32> loc("<stdin>":7:10)
    %8 = "memref.load"(%6) : (memref<i32>) -> i32 loc("<stdin>":8:10)
    "memref.store"(%8, %7) : (i32, memref<i32>) -> () loc("<stdin>":9:5)
    "acc.yield"(%7) : (memref<i32>) -> () loc("<stdin>":10:5)
  }, {
  ^bb0(%arg0: memref<i32> loc("<stdin>":12:8), %arg1: memref<i32> loc("<stdin>":12:28)):
    %4 = "memref.load"(%arg0) : (memref<i32>) -> i32 loc("<stdin>":13:10)
    "memref.store"(%4, %arg1) : (i32, memref<i32>) -> () loc("<stdin>":14:5)
    "acc.terminator"() : () -> () loc("<stdin>":15:5)
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "firstpriv_two_allocs"}> ({
    %2 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32> loc("<stdin>":19:10)
    %3 = "acc.firstprivate"(%2) <{dataClause = #acc<data_clause acc_firstprivate>, implicit = false, modifiers = #acc<data_clause_modifier none>, name = "t", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @firstprivatization_two_allocs, structured = true, varType = i32}> : (memref<i32>) -> memref<i32> loc("<stdin>":20:10)
    "acc.parallel"(%3) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0>}> ({
      "acc.yield"() : () -> () loc("<stdin>":22:7)
    }) : (memref<i32>) -> () loc("<stdin>":21:5)
    "func.return"() : () -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":18:3)
  "func.func"() <{function_type = () -> (), sym_name = "firstpriv_two_allocs_no_name"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32> loc("<stdin>":27:10)
    %1 = "acc.firstprivate"(%0) <{dataClause = #acc<data_clause acc_firstprivate>, implicit = false, modifiers = #acc<data_clause_modifier none>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @firstprivatization_two_allocs, structured = true, varType = i32}> : (memref<i32>) -> memref<i32> loc("<stdin>":28:10)
    "acc.parallel"(%1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0>}> ({
      "acc.yield"() : () -> () loc("<stdin>":30:7)
    }) : (memref<i32>) -> () loc("<stdin>":29:5)
    "func.return"() : () -> () loc("<stdin>":32:5)
  }) : () -> () loc("<stdin>":26:3)
}) : () -> () loc("<stdin>":1:1)
