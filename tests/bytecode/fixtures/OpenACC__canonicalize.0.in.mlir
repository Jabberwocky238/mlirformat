"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>) -> (), sym_name = "testenterdataop"}> ({
  ^bb0(%arg0: memref<f32> loc("<stdin>":3:8)):
    %0 = "arith.constant"() <{value = true}> : () -> i1 loc("<stdin>":4:10)
    %1 = "acc.create"(%arg0) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32> loc("<stdin>":5:10)
    "acc.enter_data"(%0, %1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 1>}> : (i1, memref<f32>) -> () loc("<stdin>":6:5)
    "func.return"() : () -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
