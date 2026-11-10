"builtin.module"() ({
  "func.func"() <{function_type = (memref<16xi32>) -> (), sym_name = "parallel_independent_loop"}> ({
  ^bb0(%arg0: memref<16xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 16 : index}> : () -> index
    %3 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<16xi32>) -> memref<16xi32>
    "acc.parallel"(%3) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1>}> ({
      "acc.loop"(%0, %2, %1) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      ^bb0(%arg1: index):
        %4 = "arith.index_cast"(%arg1) : (index) -> i32
        "memref.store"(%4, %3, %arg1) : (i32, memref<16xi32>, index) -> ()
        "acc.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "acc.yield"() : () -> ()
    }) : (memref<16xi32>) -> ()
    "acc.copyout"(%3, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<16xi32>, memref<16xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4xi32>) -> (), sym_name = "parallel_loop_multi_block_body"}> ({
  ^bb0(%arg0: memref<4xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<4xi32>) -> memref<4xi32>
    "acc.parallel"(%3) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1>}> ({
      "acc.loop"(%0, %2, %1) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      ^bb0(%arg1: index):
        %4 = "arith.index_cast"(%arg1) : (index) -> i32
        "memref.store"(%4, %3, %arg1) : (i32, memref<4xi32>, index) -> ()
        "cf.br"()[^bb1] : () -> ()
      ^bb1:  // pred: ^bb0
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
  "func.func"() <{function_type = (memref<1xi32>, index, index, index, index) -> (), sym_name = "parallel_loop_auto_collapse"}> ({
  ^bb0(%arg0: memref<1xi32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<1xi32>) -> memref<1xi32>
    "acc.parallel"(%2) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1>}> ({
      "acc.loop"(%arg1, %arg3, %arg2, %arg4, %1, %1) <{auto_ = [#acc.device_type<none>], operandSegmentSizes = array<i32: 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      ^bb0(%arg5: index, %arg6: index):
        %3 = "arith.index_cast"(%arg5) : (index) -> i32
        "memref.store"(%3, %2, %0) : (i32, memref<1xi32>, index) -> ()
        "acc.yield"() : () -> ()
      }) : (index, index, index, index, index, index) -> ()
      "acc.yield"() : () -> ()
    }) : (memref<1xi32>) -> ()
    "acc.copyout"(%2, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<1xi32>, memref<1xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1xi32>) -> (), sym_name = "serial_loop_normalized"}> ({
  ^bb0(%arg0: memref<1xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index
    %2 = "arith.constant"() <{value = 5 : index}> : () -> index
    %3 = "arith.constant"() <{value = 9 : index}> : () -> index
    %4 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<1xi32>) -> memref<1xi32>
    "acc.serial"(%4) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1>}> ({
      "acc.loop"(%2, %3, %1) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      ^bb0(%arg1: index):
        %5 = "arith.index_cast"(%arg1) : (index) -> i32
        "memref.store"(%5, %4, %0) : (i32, memref<1xi32>, index) -> ()
        "acc.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "acc.yield"() : () -> ()
    }) : (memref<1xi32>) -> ()
    "acc.copyout"(%4, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<1xi32>, memref<1xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8xi32>) -> (), sym_name = "orphan_loop"}> ({
  ^bb0(%arg0: memref<8xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 8 : index}> : () -> index
    %3 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    "acc.loop"(%0, %2, %1) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
    ^bb0(%arg1: index):
      "memref.store"(%3, %arg0, %arg1) : (i32, memref<8xi32>, index) -> ()
      "acc.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "acc.routine"() <{func_name = @device_routine_with_loop, seq = [#acc.device_type<none>], sym_name = "routine_with_loop"}> : () -> ()
  "func.func"() <{function_type = (memref<8xi32>) -> (), sym_name = "device_routine_with_loop"}> ({
  ^bb0(%arg0: memref<8xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 8 : index}> : () -> index
    %3 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    "acc.loop"(%0, %2, %1) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
    ^bb0(%arg1: index):
      "memref.store"(%3, %arg0, %arg1) : (i32, memref<8xi32>, index) -> ()
      "acc.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) {acc.specialized_routine = #acc.specialized_routine<@routine_with_loop, <seq>, "host_routine_with_loop">} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "acc.routine"() <{func_name = @device_routine_vector_with_loop, sym_name = "routine_vector_with_loop", vector = [#acc.device_type<none>]}> : () -> ()
  "func.func"() <{function_type = (memref<8xi32>) -> (), sym_name = "device_routine_vector_with_loop"}> ({
  ^bb0(%arg0: memref<8xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 8 : index}> : () -> index
    %3 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    "acc.loop"(%0, %2, %1) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, vector = [#acc.device_type<none>]}> ({
    ^bb0(%arg1: index):
      "memref.store"(%3, %arg0, %arg1) : (i32, memref<8xi32>, index) -> ()
      "acc.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) {acc.specialized_routine = #acc.specialized_routine<@routine_vector_with_loop, <vector>, "host_routine_vector_with_loop">} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1xi32>) -> (), sym_name = "parallel_loop_auto_gang"}> ({
  ^bb0(%arg0: memref<1xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 10 : i32}> : () -> i32
    %3 = "arith.constant"() <{value = 100 : i32}> : () -> i32
    %4 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<1xi32>) -> memref<1xi32>
    "acc.parallel"(%2, %4) <{numGangsDeviceType = [#acc.device_type<none>], numGangsSegments = array<i32: 1>, operandSegmentSizes = array<i32: 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1>}> ({
      "acc.loop"(%1, %3, %1) <{auto_ = [#acc.device_type<none>], gang = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
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

