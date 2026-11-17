"builtin.module"() ({
  "acc.reduction.recipe"() <{reductionOperator = #acc.reduction_operator<add>, sym_name = "reduction_add_memref_f64", type = memref<f64>}> ({
  ^bb0(%arg6: memref<f64> loc("<stdin>":3:8)):
    %12 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64 loc("<stdin>":4:11)
    %13 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f64> loc("<stdin>":5:11)
    "memref.store"(%12, %13) : (f64, memref<f64>) -> () loc("<stdin>":6:5)
    "acc.yield"(%13) : (memref<f64>) -> () loc("<stdin>":7:5)
  }, {
  ^bb0(%arg4: memref<f64> loc("<stdin>":9:8), %arg5: memref<f64> loc("<stdin>":9:28)):
    %9 = "memref.load"(%arg4) : (memref<f64>) -> f64 loc("<stdin>":10:10)
    %10 = "memref.load"(%arg5) : (memref<f64>) -> f64 loc("<stdin>":11:11)
    %11 = "arith.addf"(%9, %10) <{fastmath = #arith.fastmath<contract>}> : (f64, f64) -> f64 loc("<stdin>":12:11)
    "memref.store"(%11, %arg4) : (f64, memref<f64>) -> () loc("<stdin>":13:5)
    "acc.yield"(%arg4) : (memref<f64>) -> () loc("<stdin>":14:5)
  }, {
  ^bb0(%arg2: memref<f64> loc("<stdin>":16:8), %arg3: memref<f64> loc("<stdin>":16:28)):
    "memref.dealloc"(%arg3) : (memref<f64>) -> () loc("<stdin>":17:5)
    "acc.terminator"() : () -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<f64>) -> (), sym_name = "par_reduction_clause_"}> ({
  ^bb0(%arg1: memref<f64> loc("<stdin>":21:8)):
    %5 = "arith.constant"() <{value = 1.000000e+00 : f64}> : () -> f64 loc("<stdin>":22:10)
    %6 = "acc.reduction"(%arg1) <{dataClause = #acc<data_clause acc_reduction>, implicit = false, modifiers = #acc<data_clause_modifier none>, name = "tmp", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @reduction_add_memref_f64, structured = true, varType = f64}> : (memref<f64>) -> memref<f64> loc("<stdin>":23:10)
    "acc.parallel"(%6) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
      %7 = "memref.load"(%6) : (memref<f64>) -> f64 loc("<stdin>":25:12)
      %8 = "arith.addf"(%7, %5) <{fastmath = #arith.fastmath<contract>}> : (f64, f64) -> f64 loc("<stdin>":26:12)
      "memref.store"(%8, %6) : (f64, memref<f64>) -> () loc("<stdin>":27:7)
      "acc.yield"() : () -> () loc("<stdin>":28:7)
    }) : (memref<f64>) -> () loc("<stdin>":24:5)
    "func.return"() : () -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":20:3)
  "func.func"() <{function_type = (memref<f64>) -> (), sym_name = "par_reduction_clause_serial"}> ({
  ^bb0(%arg0: memref<f64> loc("<stdin>":33:8)):
    %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":34:10)
    %1 = "arith.constant"() <{value = 1.000000e+00 : f64}> : () -> f64 loc("<stdin>":35:10)
    %2 = "acc.reduction"(%arg0) <{dataClause = #acc<data_clause acc_reduction>, implicit = false, modifiers = #acc<data_clause_modifier none>, name = "tmp", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @reduction_add_memref_f64, structured = true, varType = f64}> : (memref<f64>) -> memref<f64> loc("<stdin>":36:10)
    "acc.parallel"(%0, %0, %0, %2) <{numGangsDeviceType = [#acc.device_type<none>], numGangsSegments = array<i32: 1>, numWorkersDeviceType = [#acc.device_type<none>], operandSegmentSizes = array<i32: 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0>, vectorLengthDeviceType = [#acc.device_type<none>]}> ({
      %3 = "memref.load"(%2) : (memref<f64>) -> f64 loc("<stdin>":38:12)
      %4 = "arith.addf"(%3, %1) <{fastmath = #arith.fastmath<contract>}> : (f64, f64) -> f64 loc("<stdin>":39:12)
      "memref.store"(%4, %2) : (f64, memref<f64>) -> () loc("<stdin>":40:7)
      "acc.yield"() : () -> () loc("<stdin>":41:7)
    }) : (i32, i32, i32, memref<f64>) -> () loc("<stdin>":37:5)
    "func.return"() : () -> () loc("<stdin>":43:5)
  }) : () -> () loc("<stdin>":32:3)
}) : () -> () loc("<stdin>":1:1)
