"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1xi32>) -> (), sym_name = "parallel_fallback_none_async_wait"}> ({
  ^bb0(%arg0: memref<1xi32>):
    %0 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %2 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<1xi32>) -> memref<1xi32>
    "acc.parallel"(%0, %1, %2) <{asyncOperandsDeviceType = [#acc.device_type<none>], hasWaitDevnum = [false], operandSegmentSizes = array<i32: 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1>, waitOnly = [], waitOperandsDeviceType = [#acc.device_type<none>], waitOperandsSegments = array<i32: 1>}> ({
      "acc.yield"() : () -> ()
    }) : (i32, i32, memref<1xi32>) -> ()
    "acc.copyout"(%2, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<1xi32>, memref<1xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1xi32>) -> (), sym_name = "parallel_prefer_nvidia_over_none"}> ({
  ^bb0(%arg0: memref<1xi32>):
    %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 10 : i32}> : () -> i32
    %3 = "arith.constant"() <{value = 20 : i32}> : () -> i32
    %4 = "arith.constant"() <{value = 21 : i32}> : () -> i32
    %5 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<1xi32>) -> memref<1xi32>
    "acc.parallel"(%0, %1, %2, %3, %4, %5) <{asyncOperandsDeviceType = [#acc.device_type<none>, #acc.device_type<nvidia>], hasWaitDevnum = [false, false], operandSegmentSizes = array<i32: 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 1>, waitOnly = [], waitOperandsDeviceType = [#acc.device_type<none>, #acc.device_type<nvidia>], waitOperandsSegments = array<i32: 1, 2>}> ({
      "acc.yield"() : () -> ()
    }) : (i32, i32, i32, i32, i32, memref<1xi32>) -> ()
    "acc.copyout"(%5, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<1xi32>, memref<1xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1xi32>) -> (), sym_name = "parallel_nvidia_only_async_wait"}> ({
  ^bb0(%arg0: memref<1xi32>):
    %0 = "arith.constant"() <{value = 3 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 30 : i32}> : () -> i32
    %2 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<1xi32>) -> memref<1xi32>
    "acc.parallel"(%0, %1, %2) <{asyncOperandsDeviceType = [#acc.device_type<nvidia>], hasWaitDevnum = [false], operandSegmentSizes = array<i32: 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1>, waitOnly = [], waitOperandsDeviceType = [#acc.device_type<nvidia>], waitOperandsSegments = array<i32: 1>}> ({
      "acc.yield"() : () -> ()
    }) : (i32, i32, memref<1xi32>) -> ()
    "acc.copyout"(%2, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<1xi32>, memref<1xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1xi32>) -> (), sym_name = "parallel_plain_wait_no_devnum"}> ({
  ^bb0(%arg0: memref<1xi32>):
    %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<1xi32>) -> memref<1xi32>
    "acc.parallel"(%0, %1) <{hasWaitDevnum = [false], operandSegmentSizes = array<i32: 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1>, waitOnly = [], waitOperandsDeviceType = [#acc.device_type<none>], waitOperandsSegments = array<i32: 1>}> ({
      "acc.yield"() : () -> ()
    }) : (i32, memref<1xi32>) -> ()
    "acc.copyout"(%1, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<1xi32>, memref<1xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1xi32>) -> (), sym_name = "parallel_none_devnum_skipped_for_nvidia_pass"}> ({
  ^bb0(%arg0: memref<1xi32>):
    %0 = "arith.constant"() <{value = 100 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 4 : i32}> : () -> i32
    %3 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<1xi32>) -> memref<1xi32>
    "acc.parallel"(%0, %1, %2, %3) <{hasWaitDevnum = [true, false], operandSegmentSizes = array<i32: 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 1>, waitOnly = [], waitOperandsDeviceType = [#acc.device_type<none>, #acc.device_type<nvidia>], waitOperandsSegments = array<i32: 2, 1>}> ({
      "acc.yield"() : () -> ()
    }) : (i32, i32, i32, memref<1xi32>) -> ()
    "acc.copyout"(%3, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<1xi32>, memref<1xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1xi32>) -> (), sym_name = "parallel_nvidia_wait_devnum"}> ({
  ^bb0(%arg0: memref<1xi32>):
    %0 = "arith.constant"() <{value = 100 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 5 : i32}> : () -> i32
    %2 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<1xi32>) -> memref<1xi32>
    "acc.parallel"(%0, %1, %2) <{hasWaitDevnum = [true], operandSegmentSizes = array<i32: 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1>, waitOnly = [], waitOperandsDeviceType = [#acc.device_type<nvidia>], waitOperandsSegments = array<i32: 2>}> ({
      "acc.yield"() : () -> ()
    }) : (i32, i32, memref<1xi32>) -> ()
    "acc.copyout"(%2, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<1xi32>, memref<1xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1xi32>) -> (), sym_name = "kernels_prefer_nvidia_async_wait"}> ({
  ^bb0(%arg0: memref<1xi32>):
    %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 10 : i32}> : () -> i32
    %3 = "arith.constant"() <{value = 20 : i32}> : () -> i32
    %4 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<1xi32>) -> memref<1xi32>
    "acc.kernels"(%0, %1, %2, %3, %4) <{asyncOperandsDeviceType = [#acc.device_type<none>, #acc.device_type<nvidia>], hasWaitDevnum = [false, false], operandSegmentSizes = array<i32: 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1>, waitOnly = [], waitOperandsDeviceType = [#acc.device_type<none>, #acc.device_type<nvidia>], waitOperandsSegments = array<i32: 1, 1>}> ({
      "acc.terminator"() : () -> ()
    }) : (i32, i32, i32, i32, memref<1xi32>) -> ()
    "acc.copyout"(%4, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<1xi32>, memref<1xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1xi32>) -> (), sym_name = "serial_fallback_none_wait"}> ({
  ^bb0(%arg0: memref<1xi32>):
    %0 = "arith.constant"() <{value = 7 : i32}> : () -> i32
    %1 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<1xi32>) -> memref<1xi32>
    "acc.serial"(%0, %1) <{hasWaitDevnum = [false], operandSegmentSizes = array<i32: 0, 1, 0, 0, 0, 0, 0, 1>, waitOnly = [], waitOperandsDeviceType = [#acc.device_type<none>], waitOperandsSegments = array<i32: 1>}> ({
      "acc.yield"() : () -> ()
    }) : (i32, memref<1xi32>) -> ()
    "acc.copyout"(%1, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<1xi32>, memref<1xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

