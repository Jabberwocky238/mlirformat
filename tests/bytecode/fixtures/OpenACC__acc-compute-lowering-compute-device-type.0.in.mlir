"builtin.module"() ({
  "func.func"() <{function_type = (memref<4xi32>) -> (), sym_name = "parallel_default_gangs_nvidia_vector_length"}> ({
  ^bb0(%arg0: memref<4xi32> loc("<stdin>":3:8)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":5:10)
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":6:10)
    %3 = "arith.constant"() <{value = 4 : i32}> : () -> i32 loc("<stdin>":7:10)
    %4 = "arith.constant"() <{value = 32 : i32}> : () -> i32 loc("<stdin>":8:10)
    %5 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<4xi32>) -> memref<4xi32> loc("<stdin>":9:10)
    "acc.parallel"(%3, %4, %5) <{numGangsDeviceType = [#acc.device_type<none>], numGangsSegments = array<i32: 1>, operandSegmentSizes = array<i32: 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1>, vectorLengthDeviceType = [#acc.device_type<nvidia>]}> ({
      "acc.loop"(%0, %2, %1) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      ^bb0(%arg1: index loc("<stdin>":12:12)):
        %6 = "arith.index_cast"(%arg1) : (index) -> i32 loc("<stdin>":13:14)
        "memref.store"(%6, %5, %arg1) : (i32, memref<4xi32>, index) -> () loc("<stdin>":14:9)
        "acc.yield"() : () -> () loc("<stdin>":15:9)
      }) : (index, index, index) -> () loc("<stdin>":11:7)
      "acc.yield"() : () -> () loc("<stdin>":17:7)
    }) : (i32, i32, memref<4xi32>) -> () loc("<stdin>":10:5)
    "acc.copyout"(%5, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<4xi32>, memref<4xi32>) -> () loc("<stdin>":19:5)
    "func.return"() : () -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
