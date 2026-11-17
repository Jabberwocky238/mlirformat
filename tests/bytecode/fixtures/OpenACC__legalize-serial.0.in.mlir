"builtin.module"() ({
  "acc.private.recipe"() <{sym_name = "privatization_memref_10_f32", type = memref<10xf32>}> ({
  ^bb0(%arg17: memref<10xf32> loc("<stdin>":3:8)):
    %17 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32> loc("<stdin>":4:11)
    "acc.yield"(%17) : (memref<10xf32>) -> () loc("<stdin>":5:5)
  }, {
  ^bb0(%arg16: memref<10xf32> loc("<stdin>":7:8)):
    "memref.dealloc"(%arg16) : (memref<10xf32>) -> () loc("<stdin>":8:5)
    "acc.terminator"() : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
  "acc.private.recipe"() <{sym_name = "privatization_memref_10_10_f32", type = memref<10x10xf32>}> ({
  ^bb0(%arg15: memref<10x10xf32> loc("<stdin>":12:8)):
    %16 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10x10xf32> loc("<stdin>":13:11)
    "acc.yield"(%16) : (memref<10x10xf32>) -> () loc("<stdin>":14:5)
  }, {
  ^bb0(%arg14: memref<10x10xf32> loc("<stdin>":16:8)):
    "memref.dealloc"(%arg14) : (memref<10x10xf32>) -> () loc("<stdin>":17:5)
    "acc.terminator"() : () -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":11:3)
  "acc.firstprivate.recipe"() <{sym_name = "firstprivatization_memref_10xf32", type = memref<10xf32>}> ({
  ^bb0(%arg13: memref<10xf32> loc("<stdin>":21:8)):
    %15 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32> loc("<stdin>":22:11)
    "acc.yield"(%15) : (memref<10xf32>) -> () loc("<stdin>":23:5)
  }, {
  ^bb0(%arg11: memref<10xf32> loc("<stdin>":25:8), %arg12: memref<10xf32> loc("<stdin>":25:32)):
    "acc.terminator"() : () -> () loc("<stdin>":26:5)
  }, {
  ^bb0(%arg10: memref<10xf32> loc("<stdin>":28:8)):
    "memref.dealloc"(%arg10) : (memref<10xf32>) -> () loc("<stdin>":29:5)
    "acc.terminator"() : () -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":20:3)
  "acc.reduction.recipe"() <{reductionOperator = #acc.reduction_operator<add>, sym_name = "reduction_add_i64", type = i64}> ({
  ^bb0(%arg9: i64 loc("<stdin>":33:8)):
    %14 = "arith.constant"() <{value = 0 : i64}> : () -> i64 loc("<stdin>":34:11)
    "acc.yield"(%14) : (i64) -> () loc("<stdin>":35:5)
  }, {
  ^bb0(%arg7: i64 loc("<stdin>":37:8), %arg8: i64 loc("<stdin>":37:20)):
    %13 = "arith.addi"(%arg7, %arg8) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64 loc("<stdin>":38:11)
    "acc.yield"(%13) : (i64) -> () loc("<stdin>":39:5)
  }, {
  }) : () -> () loc("<stdin>":32:3)
  "acc.reduction.recipe"() <{reductionOperator = #acc.reduction_operator<add>, sym_name = "reduction_add_memref_i64", type = memref<i64>}> ({
  ^bb0(%arg6: memref<i64> loc("<stdin>":43:8)):
    %11 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i64> loc("<stdin>":44:11)
    %12 = "arith.constant"() <{value = 0 : i64}> : () -> i64 loc("<stdin>":45:11)
    "memref.store"(%12, %11) : (i64, memref<i64>) -> () loc("<stdin>":46:5)
    "acc.yield"(%11) : (memref<i64>) -> () loc("<stdin>":47:5)
  }, {
  ^bb0(%arg4: memref<i64> loc("<stdin>":49:8), %arg5: memref<i64> loc("<stdin>":49:28)):
    %8 = "memref.load"(%arg4) : (memref<i64>) -> i64 loc("<stdin>":50:10)
    %9 = "memref.load"(%arg5) : (memref<i64>) -> i64 loc("<stdin>":51:10)
    %10 = "arith.addi"(%8, %9) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64 loc("<stdin>":52:11)
    "memref.store"(%10, %arg4) : (i64, memref<i64>) -> () loc("<stdin>":53:5)
    "acc.terminator"() : () -> () loc("<stdin>":54:5)
  }, {
  }) : () -> () loc("<stdin>":42:3)
  "func.func"() <{function_type = (memref<10xf32>, memref<10xf32>, memref<10x10xf32>) -> (), sym_name = "testserialop"}> ({
  ^bb0(%arg0: memref<10xf32> loc("<stdin>":58:8), %arg1: memref<10xf32> loc("<stdin>":58:31), %arg2: memref<10x10xf32> loc("<stdin>":58:54)):
    %0 = "arith.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":59:10)
    %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":60:10)
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":61:10)
    "acc.serial"(%0) <{asyncOperandsDeviceType = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0, 0>}> ({
    }) : (i64) -> () loc("<stdin>":62:5)
    "acc.serial"(%1) <{asyncOperandsDeviceType = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0, 0>}> ({
    }) : (i32) -> () loc("<stdin>":64:5)
    "acc.serial"(%2) <{asyncOperandsDeviceType = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0, 0>}> ({
    }) : (index) -> () loc("<stdin>":66:5)
    "acc.serial"(%0) <{hasWaitDevnum = [false], operandSegmentSizes = array<i32: 0, 1, 0, 0, 0, 0, 0, 0>, waitOnly = [], waitOperandsDeviceType = [#acc.device_type<none>], waitOperandsSegments = array<i32: 1>}> ({
    }) : (i64) -> () loc("<stdin>":68:5)
    "acc.serial"(%1) <{hasWaitDevnum = [false], operandSegmentSizes = array<i32: 0, 1, 0, 0, 0, 0, 0, 0>, waitOnly = [], waitOperandsDeviceType = [#acc.device_type<none>], waitOperandsSegments = array<i32: 1>}> ({
    }) : (i32) -> () loc("<stdin>":70:5)
    "acc.serial"(%2) <{hasWaitDevnum = [false], operandSegmentSizes = array<i32: 0, 1, 0, 0, 0, 0, 0, 0>, waitOnly = [], waitOperandsDeviceType = [#acc.device_type<none>], waitOperandsSegments = array<i32: 1>}> ({
    }) : (index) -> () loc("<stdin>":72:5)
    "acc.serial"(%0, %1, %2) <{hasWaitDevnum = [false], operandSegmentSizes = array<i32: 0, 3, 0, 0, 0, 0, 0, 0>, waitOnly = [], waitOperandsDeviceType = [#acc.device_type<none>], waitOperandsSegments = array<i32: 3>}> ({
    }) : (i64, i32, index) -> () loc("<stdin>":74:5)
    %3 = "acc.firstprivate"(%arg1) <{dataClause = #acc<data_clause acc_firstprivate>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @firstprivatization_memref_10xf32, structured = true, varType = f32}> : (memref<10xf32>) -> memref<10xf32> loc("<stdin>":76:10)
    %4 = "acc.private"(%arg2) <{dataClause = #acc<data_clause acc_private>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_10_10_f32, structured = true, varType = f32}> : (memref<10x10xf32>) -> memref<10x10xf32> loc("<stdin>":77:10)
    "acc.serial"(%4, %3) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 1, 0>}> ({
    }) : (memref<10x10xf32>, memref<10xf32>) -> () loc("<stdin>":78:5)
    %5 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copy>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<10xf32>) -> memref<10xf32> loc("<stdin>":80:10)
    "acc.serial"(%5) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1>}> ({
    }) : (memref<10xf32>) -> () loc("<stdin>":81:5)
    %6 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i64> loc("<stdin>":83:10)
    "memref.store"(%0, %6) : (i64, memref<i64>) -> () loc("<stdin>":84:5)
    %7 = "acc.reduction"(%6) <{dataClause = #acc<data_clause acc_reduction>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @reduction_add_memref_i64, structured = true, varType = i64}> : (memref<i64>) -> memref<i64> loc("<stdin>":85:10)
    "acc.serial"(%7) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0, 0, 0>}> ({
    }) : (memref<i64>) -> () loc("<stdin>":86:5)
    "acc.serial"() <{combined, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "acc.loop"(%2, %2, %2) <{combined = #acc.combined_constructs<serial_loop>, operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, seq = [#acc.device_type<none>]}> ({
      ^bb0(%arg3: index loc("<stdin>":90:12)):
        "acc.yield"() : () -> () loc("<stdin>":91:9)
      }) : (index, index, index) -> () loc("<stdin>":89:7)
      "acc.terminator"() : () -> () loc("<stdin>":93:7)
    }) : () -> () loc("<stdin>":88:5)
    "acc.serial"() <{defaultAttr = #acc<defaultvalue none>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
    }) : () -> () loc("<stdin>":95:5)
    "acc.serial"() <{defaultAttr = #acc<defaultvalue present>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
    }) : () -> () loc("<stdin>":97:5)
    "acc.serial"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
    }) {asyncAttr} : () -> () loc("<stdin>":99:5)
    "acc.serial"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
    }) {waitAttr} : () -> () loc("<stdin>":101:5)
    "acc.serial"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>, selfAttr}> ({
    }) : () -> () loc("<stdin>":103:5)
    "acc.serial"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>, selfAttr}> ({
      "acc.yield"() : () -> () loc("<stdin>":106:7)
    }) : () -> () loc("<stdin>":105:5)
    "func.return"() : () -> () loc("<stdin>":108:5)
  }) : () -> () loc("<stdin>":57:3)
}) : () -> () loc("<stdin>":1:1)
