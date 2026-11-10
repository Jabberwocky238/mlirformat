"builtin.module"() ({
  "acc.reduction.recipe"() <{reductionOperator = #acc.reduction_operator<add>, sym_name = "reduction_add_memref_f64", type = memref<f64>}> ({
  ^bb0(%arg6: memref<f64>):
    %12 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %13 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f64>
    "memref.store"(%12, %13) : (f64, memref<f64>) -> ()
    "acc.yield"(%13) : (memref<f64>) -> ()
  }, {
  ^bb0(%arg4: memref<f64>, %arg5: memref<f64>):
    %9 = "memref.load"(%arg4) : (memref<f64>) -> f64
    %10 = "memref.load"(%arg5) : (memref<f64>) -> f64
    %11 = "arith.addf"(%9, %10) <{fastmath = #arith.fastmath<contract>}> : (f64, f64) -> f64
    "memref.store"(%11, %arg4) : (f64, memref<f64>) -> ()
    "acc.yield"(%arg4) : (memref<f64>) -> ()
  }, {
  ^bb0(%arg2: memref<f64>, %arg3: memref<f64>):
    "memref.dealloc"(%arg3) : (memref<f64>) -> ()
    "acc.terminator"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f64>) -> (), sym_name = "par_reduction_clause_"}> ({
  ^bb0(%arg1: memref<f64>):
    %5 = "arith.constant"() <{value = 1.000000e+00 : f64}> : () -> f64
    %6 = "acc.reduction"(%arg1) <{dataClause = #acc<data_clause acc_reduction>, implicit = false, modifiers = #acc<data_clause_modifier none>, name = "tmp", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @reduction_add_memref_f64, structured = true, varType = f64}> : (memref<f64>) -> memref<f64>
    "acc.parallel"(%6) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
      %7 = "memref.load"(%6) : (memref<f64>) -> f64
      %8 = "arith.addf"(%7, %5) <{fastmath = #arith.fastmath<contract>}> : (f64, f64) -> f64
      "memref.store"(%8, %6) : (f64, memref<f64>) -> ()
      "acc.yield"() : () -> ()
    }) : (memref<f64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f64>) -> (), sym_name = "par_reduction_clause_serial"}> ({
  ^bb0(%arg0: memref<f64>):
    %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 1.000000e+00 : f64}> : () -> f64
    %2 = "acc.reduction"(%arg0) <{dataClause = #acc<data_clause acc_reduction>, implicit = false, modifiers = #acc<data_clause_modifier none>, name = "tmp", operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @reduction_add_memref_f64, structured = true, varType = f64}> : (memref<f64>) -> memref<f64>
    "acc.parallel"(%0, %0, %0, %2) <{numGangsDeviceType = [#acc.device_type<none>], numGangsSegments = array<i32: 1>, numWorkersDeviceType = [#acc.device_type<none>], operandSegmentSizes = array<i32: 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0>, vectorLengthDeviceType = [#acc.device_type<none>]}> ({
      %3 = "memref.load"(%2) : (memref<f64>) -> f64
      %4 = "arith.addf"(%3, %1) <{fastmath = #arith.fastmath<contract>}> : (f64, f64) -> f64
      "memref.store"(%4, %2) : (f64, memref<f64>) -> ()
      "acc.yield"() : () -> ()
    }) : (i32, i32, i32, memref<f64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

