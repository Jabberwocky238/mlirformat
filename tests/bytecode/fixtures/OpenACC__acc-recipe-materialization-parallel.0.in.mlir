"builtin.module"() ({
  "acc.reduction.recipe"() <{reductionOperator = #acc.reduction_operator<add>, sym_name = "reduction_add_memref_f64", type = memref<f64>}> ({
  ^bb0(%arg3: memref<f64> loc("<stdin>":3:8)):
    %7 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64 loc("<stdin>":4:10)
    %8 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f64> loc("<stdin>":5:10)
    "memref.store"(%7, %8) : (f64, memref<f64>) -> () loc("<stdin>":6:5)
    "acc.yield"(%8) : (memref<f64>) -> () loc("<stdin>":7:5)
  }, {
  ^bb0(%arg1: memref<f64> loc("<stdin>":9:8), %arg2: memref<f64> loc("<stdin>":9:28)):
    %4 = "memref.load"(%arg1) : (memref<f64>) -> f64 loc("<stdin>":10:10)
    %5 = "memref.load"(%arg2) : (memref<f64>) -> f64 loc("<stdin>":11:10)
    %6 = "arith.addf"(%4, %5) <{fastmath = #arith.fastmath<contract>}> : (f64, f64) -> f64 loc("<stdin>":12:10)
    "memref.store"(%6, %arg1) : (f64, memref<f64>) -> () loc("<stdin>":13:5)
    "acc.yield"(%arg1) : (memref<f64>) -> () loc("<stdin>":14:5)
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<f64>) -> (), sym_name = "par_reduction_clause_"}> ({
  ^bb0(%arg0: memref<f64> loc("<stdin>":18:8)):
    %0 = "arith.constant"() <{value = 1.000000e+00 : f64}> : () -> f64 loc("<stdin>":19:10)
    %1 = "acc.reduction"(%arg0) <{dataClause = #acc<data_clause acc_reduction>, implicit = false, modifiers = #acc<data_clause_modifier none>, name = "tmp", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @reduction_add_memref_f64, structured = true, varType = f64}> : (memref<f64>) -> memref<f64> loc("<stdin>":20:10)
    "acc.parallel"(%1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
      %2 = "memref.load"(%1) : (memref<f64>) -> f64 loc("<stdin>":22:12)
      %3 = "arith.addf"(%2, %0) <{fastmath = #arith.fastmath<contract>}> : (f64, f64) -> f64 loc("<stdin>":23:12)
      "memref.store"(%3, %1) : (f64, memref<f64>) -> () loc("<stdin>":24:7)
      "acc.yield"() : () -> () loc("<stdin>":25:7)
    }) : (memref<f64>) -> () loc("<stdin>":21:5)
    "func.return"() : () -> () loc("<stdin>":27:5)
  }) : () -> () loc("<stdin>":17:3)
}) : () -> () loc("<stdin>":1:1)
