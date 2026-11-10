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

