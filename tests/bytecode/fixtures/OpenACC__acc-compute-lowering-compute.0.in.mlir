"builtin.module"() ({
  "func.func"() <{function_type = (memref<1xi32>) -> (), sym_name = "parallel_gang_loop"}> ({
  ^bb0(%arg0: memref<1xi32> loc("<stdin>":3:8)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":5:10)
    %2 = "arith.constant"() <{value = 10 : i32}> : () -> i32 loc("<stdin>":6:10)
    %3 = "arith.constant"() <{value = 100 : i32}> : () -> i32 loc("<stdin>":7:10)
    %4 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<1xi32>) -> memref<1xi32> loc("<stdin>":8:10)
    "acc.parallel"(%2, %4) <{numGangsDeviceType = [#acc.device_type<none>], numGangsSegments = array<i32: 1>, operandSegmentSizes = array<i32: 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1>}> ({
      "acc.loop"(%1, %3, %1) <{gang = [#acc.device_type<none>], independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      ^bb0(%arg1: i32 loc("<stdin>":11:12)):
        "memref.store"(%arg1, %4, %0) : (i32, memref<1xi32>, index) -> () loc("<stdin>":12:9)
        "acc.yield"() : () -> () loc("<stdin>":13:9)
      }) : (i32, i32, i32) -> () loc("<stdin>":10:7)
      "acc.yield"() : () -> () loc("<stdin>":15:7)
    }) : (i32, memref<1xi32>) -> () loc("<stdin>":9:5)
    "acc.copyout"(%4, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<1xi32>, memref<1xi32>) -> () loc("<stdin>":17:5)
    "func.return"() : () -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
