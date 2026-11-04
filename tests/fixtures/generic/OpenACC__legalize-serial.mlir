"builtin.module"() ({
  "acc.private.recipe"() <{sym_name = "privatization_memref_10_f32", type = memref<10xf32>}> ({
  ^bb0(%arg17: memref<10xf32>):
    %17 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    "acc.yield"(%17) : (memref<10xf32>) -> ()
  }, {
  ^bb0(%arg16: memref<10xf32>):
    "memref.dealloc"(%arg16) : (memref<10xf32>) -> ()
    "acc.terminator"() : () -> ()
  }) : () -> ()
  "acc.private.recipe"() <{sym_name = "privatization_memref_10_10_f32", type = memref<10x10xf32>}> ({
  ^bb0(%arg15: memref<10x10xf32>):
    %16 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10x10xf32>
    "acc.yield"(%16) : (memref<10x10xf32>) -> ()
  }, {
  ^bb0(%arg14: memref<10x10xf32>):
    "memref.dealloc"(%arg14) : (memref<10x10xf32>) -> ()
    "acc.terminator"() : () -> ()
  }) : () -> ()
  "acc.firstprivate.recipe"() <{sym_name = "firstprivatization_memref_10xf32", type = memref<10xf32>}> ({
  ^bb0(%arg13: memref<10xf32>):
    %15 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    "acc.yield"(%15) : (memref<10xf32>) -> ()
  }, {
  ^bb0(%arg11: memref<10xf32>, %arg12: memref<10xf32>):
    "acc.terminator"() : () -> ()
  }, {
  ^bb0(%arg10: memref<10xf32>):
    "memref.dealloc"(%arg10) : (memref<10xf32>) -> ()
    "acc.terminator"() : () -> ()
  }) : () -> ()
  "acc.reduction.recipe"() <{reductionOperator = #acc.reduction_operator<add>, sym_name = "reduction_add_i64", type = i64}> ({
  ^bb0(%arg9: i64):
    %14 = "arith.constant"() <{value = 0 : i64}> : () -> i64
    "acc.yield"(%14) : (i64) -> ()
  }, {
  ^bb0(%arg7: i64, %arg8: i64):
    %13 = "arith.addi"(%arg7, %arg8) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
    "acc.yield"(%13) : (i64) -> ()
  }, {
  }) : () -> ()
  "acc.reduction.recipe"() <{reductionOperator = #acc.reduction_operator<add>, sym_name = "reduction_add_memref_i64", type = memref<i64>}> ({
  ^bb0(%arg6: memref<i64>):
    %11 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i64>
    %12 = "arith.constant"() <{value = 0 : i64}> : () -> i64
    "memref.store"(%12, %11) : (i64, memref<i64>) -> ()
    "acc.yield"(%11) : (memref<i64>) -> ()
  }, {
  ^bb0(%arg4: memref<i64>, %arg5: memref<i64>):
    %8 = "memref.load"(%arg4) : (memref<i64>) -> i64
    %9 = "memref.load"(%arg5) : (memref<i64>) -> i64
    %10 = "arith.addi"(%8, %9) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
    "memref.store"(%10, %arg4) : (i64, memref<i64>) -> ()
    "acc.terminator"() : () -> ()
  }, {
  }) : () -> ()
  "func.func"() <{function_type = (memref<10xf32>, memref<10xf32>, memref<10x10xf32>) -> (), sym_name = "testserialop"}> ({
  ^bb0(%arg0: memref<10xf32>, %arg1: memref<10xf32>, %arg2: memref<10x10xf32>):
    %0 = "arith.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    "acc.serial"(%0) <{asyncOperandsDeviceType = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0, 0>}> ({
    }) : (i64) -> ()
    "acc.serial"(%1) <{asyncOperandsDeviceType = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0, 0>}> ({
    }) : (i32) -> ()
    "acc.serial"(%2) <{asyncOperandsDeviceType = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0, 0>}> ({
    }) : (index) -> ()
    "acc.serial"(%0) <{hasWaitDevnum = [false], operandSegmentSizes = array<i32: 0, 1, 0, 0, 0, 0, 0, 0>, waitOnly = [], waitOperandsDeviceType = [#acc.device_type<none>], waitOperandsSegments = array<i32: 1>}> ({
    }) : (i64) -> ()
    "acc.serial"(%1) <{hasWaitDevnum = [false], operandSegmentSizes = array<i32: 0, 1, 0, 0, 0, 0, 0, 0>, waitOnly = [], waitOperandsDeviceType = [#acc.device_type<none>], waitOperandsSegments = array<i32: 1>}> ({
    }) : (i32) -> ()
    "acc.serial"(%2) <{hasWaitDevnum = [false], operandSegmentSizes = array<i32: 0, 1, 0, 0, 0, 0, 0, 0>, waitOnly = [], waitOperandsDeviceType = [#acc.device_type<none>], waitOperandsSegments = array<i32: 1>}> ({
    }) : (index) -> ()
    "acc.serial"(%0, %1, %2) <{hasWaitDevnum = [false], operandSegmentSizes = array<i32: 0, 3, 0, 0, 0, 0, 0, 0>, waitOnly = [], waitOperandsDeviceType = [#acc.device_type<none>], waitOperandsSegments = array<i32: 3>}> ({
    }) : (i64, i32, index) -> ()
    %3 = "acc.firstprivate"(%arg1) <{dataClause = #acc<data_clause acc_firstprivate>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @firstprivatization_memref_10xf32, structured = true, varType = f32}> : (memref<10xf32>) -> memref<10xf32>
    %4 = "acc.private"(%arg2) <{dataClause = #acc<data_clause acc_private>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_10_10_f32, structured = true, varType = f32}> : (memref<10x10xf32>) -> memref<10x10xf32>
    "acc.serial"(%4, %3) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 1, 0>}> ({
    }) : (memref<10x10xf32>, memref<10xf32>) -> ()
    %5 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copy>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<10xf32>) -> memref<10xf32>
    "acc.serial"(%5) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1>}> ({
    }) : (memref<10xf32>) -> ()
    %6 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i64>
    "memref.store"(%0, %6) : (i64, memref<i64>) -> ()
    %7 = "acc.reduction"(%6) <{dataClause = #acc<data_clause acc_reduction>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @reduction_add_memref_i64, structured = true, varType = i64}> : (memref<i64>) -> memref<i64>
    "acc.serial"(%7) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0, 0, 0>}> ({
    }) : (memref<i64>) -> ()
    "acc.serial"() <{combined, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "acc.loop"(%2, %2, %2) <{combined = #acc.combined_constructs<serial_loop>, operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, seq = [#acc.device_type<none>]}> ({
      ^bb0(%arg3: index):
        "acc.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "acc.terminator"() : () -> ()
    }) : () -> ()
    "acc.serial"() <{defaultAttr = #acc<defaultvalue none>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
    }) : () -> ()
    "acc.serial"() <{defaultAttr = #acc<defaultvalue present>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
    }) : () -> ()
    "acc.serial"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
    }) {asyncAttr} : () -> ()
    "acc.serial"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
    }) {waitAttr} : () -> ()
    "acc.serial"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>, selfAttr}> ({
    }) : () -> ()
    "acc.serial"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>, selfAttr}> ({
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

