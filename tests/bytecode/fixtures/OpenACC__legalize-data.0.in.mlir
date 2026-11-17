"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xf32>, index) -> (), sym_name = "test"}> ({
  ^bb0(%arg0: memref<10xf32> loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:31)):
    %0 = "acc.create"(%arg0) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = tensor<10xf32>}> : (memref<10xf32>) -> memref<10xf32> loc("<stdin>":4:10)
    "acc.parallel"(%0) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1>}> ({
      %1 = "memref.load"(%arg0, %arg1) : (memref<10xf32>, index) -> f32 loc("<stdin>":6:12)
      "acc.yield"() : () -> () loc("<stdin>":7:7)
    }) : (memref<10xf32>) -> () loc("<stdin>":5:5)
    "func.return"() : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
