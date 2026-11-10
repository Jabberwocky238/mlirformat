"builtin.module"() ({
  "func.func"() <{function_type = (memref<1xi32>) -> (), sym_name = "parallel_gang_loop"}> ({
  ^bb0(%arg0: memref<1xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 10 : i32}> : () -> i32
    %3 = "arith.constant"() <{value = 100 : i32}> : () -> i32
    %4 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<1xi32>) -> memref<1xi32>
    "acc.parallel"(%2, %4) <{numGangsDeviceType = [#acc.device_type<none>], numGangsSegments = array<i32: 1>, operandSegmentSizes = array<i32: 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1>}> ({
      "acc.loop"(%1, %3, %1) <{gang = [#acc.device_type<none>], independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      ^bb0(%arg1: i32):
        "memref.store"(%arg1, %4, %0) : (i32, memref<1xi32>, index) -> ()
        "acc.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
      "acc.yield"() : () -> ()
    }) : (i32, memref<1xi32>) -> ()
    "acc.copyout"(%4, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<1xi32>, memref<1xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4xi32>) -> (), sym_name = "parallel_seq_loop"}> ({
  ^bb0(%arg0: memref<4xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "arith.constant"() <{value = 10 : i32}> : () -> i32
    %4 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<4xi32>) -> memref<4xi32>
    "acc.parallel"(%3, %4) <{numGangsDeviceType = [#acc.device_type<none>], numGangsSegments = array<i32: 1>, operandSegmentSizes = array<i32: 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1>}> ({
      "acc.loop"(%0, %2, %1) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, seq = [#acc.device_type<none>]}> ({
      ^bb0(%arg1: index):
        %5 = "arith.index_cast"(%arg1) : (index) -> i32
        "memref.store"(%5, %4, %arg1) : (i32, memref<4xi32>, index) -> ()
        "acc.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "acc.yield"() : () -> ()
    }) : (i32, memref<4xi32>) -> ()
    "acc.copyout"(%4, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<4xi32>, memref<4xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4xi32>) -> (), sym_name = "serial_loop"}> ({
  ^bb0(%arg0: memref<4xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<4xi32>) -> memref<4xi32>
    "acc.serial"(%3) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1>}> ({
      "acc.loop"(%0, %2, %1) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      ^bb0(%arg1: index):
        %4 = "arith.index_cast"(%arg1) : (index) -> i32
        "memref.store"(%4, %3, %arg1) : (i32, memref<4xi32>, index) -> ()
        "acc.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "acc.yield"() : () -> ()
    }) : (memref<4xi32>) -> ()
    "acc.copyout"(%3, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<4xi32>, memref<4xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8xi32>) -> (), sym_name = "kernels_loop"}> ({
  ^bb0(%arg0: memref<8xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 8 : index}> : () -> index
    %3 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<8xi32>) -> memref<8xi32>
    "acc.kernels"(%3) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1>}> ({
      "acc.loop"(%0, %2, %1) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      ^bb0(%arg1: index):
        %4 = "arith.index_cast"(%arg1) : (index) -> i32
        "memref.store"(%4, %3, %arg1) : (i32, memref<8xi32>, index) -> ()
        "acc.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "acc.terminator"() : () -> ()
    }) : (memref<8xi32>) -> ()
    "acc.copyout"(%3, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<8xi32>, memref<8xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1xi32>) -> (), sym_name = "constant_livein_materialized_into_compute_region"}> ({
  ^bb0(%arg0: memref<1xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 42 : i32}> : () -> i32
    %2 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<1xi32>) -> memref<1xi32>
    "acc.serial"(%2) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1>}> ({
      "memref.store"(%1, %2, %0) : (i32, memref<1xi32>, index) -> ()
      "acc.yield"() : () -> ()
    }) : (memref<1xi32>) -> ()
    "acc.copyout"(%2, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<1xi32>, memref<1xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4xi32>) -> (), sym_name = "parallel_unit_launch_serial_loops"}> ({
  ^bb0(%arg0: memref<4xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %4 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<4xi32>) -> memref<4xi32>
    "acc.parallel"(%3, %3, %3, %4) <{numGangsDeviceType = [#acc.device_type<none>], numGangsSegments = array<i32: 1>, numWorkersDeviceType = [#acc.device_type<none>], operandSegmentSizes = array<i32: 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1>, vectorLengthDeviceType = [#acc.device_type<none>]}> ({
      "acc.loop"(%0, %2, %1) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      ^bb0(%arg1: index):
        %5 = "arith.index_cast"(%arg1) : (index) -> i32
        "memref.store"(%5, %4, %arg1) : (i32, memref<4xi32>, index) -> ()
        "acc.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "acc.yield"() : () -> ()
    }) : (i32, i32, i32, memref<4xi32>) -> ()
    "acc.copyout"(%4, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<4xi32>, memref<4xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4xi32>) -> (), sym_name = "kernels_unit_launch_serial_loops"}> ({
  ^bb0(%arg0: memref<4xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %4 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<4xi32>) -> memref<4xi32>
    "acc.kernels"(%3, %3, %3, %4) <{numGangsDeviceType = [#acc.device_type<none>], numGangsSegments = array<i32: 1>, numWorkersDeviceType = [#acc.device_type<none>], operandSegmentSizes = array<i32: 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1>, vectorLengthDeviceType = [#acc.device_type<none>]}> ({
      "acc.loop"(%0, %2, %1) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      ^bb0(%arg1: index):
        %5 = "arith.index_cast"(%arg1) : (index) -> i32
        "memref.store"(%5, %4, %arg1) : (i32, memref<4xi32>, index) -> ()
        "acc.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "acc.terminator"() : () -> ()
    }) : (i32, i32, i32, memref<4xi32>) -> ()
    "acc.copyout"(%4, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<4xi32>, memref<4xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4xi32>) -> (), sym_name = "parallel_vector_length32_independent"}> ({
  ^bb0(%arg0: memref<4xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %4 = "arith.constant"() <{value = 32 : i32}> : () -> i32
    %5 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<4xi32>) -> memref<4xi32>
    "acc.parallel"(%3, %3, %4, %5) <{numGangsDeviceType = [#acc.device_type<none>], numGangsSegments = array<i32: 1>, numWorkersDeviceType = [#acc.device_type<none>], operandSegmentSizes = array<i32: 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1>, vectorLengthDeviceType = [#acc.device_type<none>]}> ({
      "acc.loop"(%0, %2, %1) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, vector = [#acc.device_type<none>]}> ({
      ^bb0(%arg1: index):
        %6 = "arith.index_cast"(%arg1) : (index) -> i32
        "memref.store"(%6, %5, %arg1) : (i32, memref<4xi32>, index) -> ()
        "acc.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "acc.yield"() : () -> ()
    }) : (i32, i32, i32, memref<4xi32>) -> ()
    "acc.copyout"(%5, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<4xi32>, memref<4xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4xi32>) -> (), sym_name = "kernels_num_gangs4_independent"}> ({
  ^bb0(%arg0: memref<4xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %4 = "arith.constant"() <{value = 4 : i32}> : () -> i32
    %5 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<4xi32>) -> memref<4xi32>
    "acc.kernels"(%4, %3, %3, %5) <{numGangsDeviceType = [#acc.device_type<none>], numGangsSegments = array<i32: 1>, numWorkersDeviceType = [#acc.device_type<none>], operandSegmentSizes = array<i32: 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1>, vectorLengthDeviceType = [#acc.device_type<none>]}> ({
      "acc.loop"(%0, %2, %1) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, vector = [#acc.device_type<none>]}> ({
      ^bb0(%arg1: index):
        %6 = "arith.index_cast"(%arg1) : (index) -> i32
        "memref.store"(%6, %5, %arg1) : (i32, memref<4xi32>, index) -> ()
        "acc.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "acc.terminator"() : () -> ()
    }) : (i32, i32, i32, memref<4xi32>) -> ()
    "acc.copyout"(%5, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<4xi32>, memref<4xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4xi32>) -> (), sym_name = "parallel_num_gangs_1_2_independent"}> ({
  ^bb0(%arg0: memref<4xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %4 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %5 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<4xi32>) -> memref<4xi32>
    "acc.parallel"(%3, %4, %3, %3, %5) <{numGangsDeviceType = [#acc.device_type<none>], numGangsSegments = array<i32: 2>, numWorkersDeviceType = [#acc.device_type<none>], operandSegmentSizes = array<i32: 0, 0, 2, 1, 1, 0, 0, 0, 0, 0, 1>, vectorLengthDeviceType = [#acc.device_type<none>]}> ({
      "acc.loop"(%0, %2, %1) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, vector = [#acc.device_type<none>]}> ({
      ^bb0(%arg1: index):
        %6 = "arith.index_cast"(%arg1) : (index) -> i32
        "memref.store"(%6, %5, %arg1) : (i32, memref<4xi32>, index) -> ()
        "acc.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "acc.yield"() : () -> ()
    }) : (i32, i32, i32, i32, memref<4xi32>) -> ()
    "acc.copyout"(%5, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<4xi32>, memref<4xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

