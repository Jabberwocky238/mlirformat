"builtin.module"() ({
  "acc.reduction.recipe"() <{reductionOperator = #acc.reduction_operator<add>, sym_name = "reduction_add_memref_f64", type = memref<f64>}> ({
  ^bb0(%arg3: memref<f64>):
    %7 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %8 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f64>
    "memref.store"(%7, %8) : (f64, memref<f64>) -> ()
    "acc.yield"(%8) : (memref<f64>) -> ()
  }, {
  ^bb0(%arg1: memref<f64>, %arg2: memref<f64>):
    %4 = "memref.load"(%arg1) : (memref<f64>) -> f64
    %5 = "memref.load"(%arg2) : (memref<f64>) -> f64
    %6 = "arith.addf"(%4, %5) <{fastmath = #arith.fastmath<contract>}> : (f64, f64) -> f64
    "memref.store"(%6, %arg1) : (f64, memref<f64>) -> ()
    "acc.yield"(%arg1) : (memref<f64>) -> ()
  }, {
  }) : () -> ()
  "func.func"() <{function_type = (memref<f64>) -> (), sym_name = "par_reduction_clause_"}> ({
  ^bb0(%arg0: memref<f64>):
    %0 = "arith.constant"() <{value = 1.000000e+00 : f64}> : () -> f64
    %1 = "acc.reduction"(%arg0) <{dataClause = #acc<data_clause acc_reduction>, implicit = false, modifiers = #acc<data_clause_modifier none>, name = "tmp", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @reduction_add_memref_f64, structured = true, varType = f64}> : (memref<f64>) -> memref<f64>
    "acc.parallel"(%1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
      %2 = "memref.load"(%1) : (memref<f64>) -> f64
      %3 = "arith.addf"(%2, %0) <{fastmath = #arith.fastmath<contract>}> : (f64, f64) -> f64
      "memref.store"(%3, %1) : (f64, memref<f64>) -> ()
      "acc.yield"() : () -> ()
    }) : (memref<f64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

