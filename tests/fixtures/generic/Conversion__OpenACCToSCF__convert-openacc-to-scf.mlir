"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>, i1) -> (), sym_name = "testenterdataop"}> ({
  ^bb0(%arg0: memref<f32>, %arg1: i1):
    %0 = "acc.create"(%arg0) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    "acc.enter_data"(%arg1, %0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 1>}> : (i1, memref<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>, i1) -> (), sym_name = "testexitdataop"}> ({
  ^bb0(%arg0: memref<f32>, %arg1: i1):
    %0 = "acc.getdeviceptr"(%arg0) <{dataClause = #acc<data_clause acc_getdeviceptr>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    "acc.exit_data"(%arg1, %0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 1>}> : (i1, memref<f32>) -> ()
    "acc.delete"(%0) <{dataClause = #acc<data_clause acc_delete>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0>, structured = true}> : (memref<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>, i1) -> (), sym_name = "testupdateop"}> ({
  ^bb0(%arg0: memref<f32>, %arg1: i1):
    %0 = "acc.update_device"(%arg0) <{dataClause = #acc<data_clause acc_update_device>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    "acc.update"(%arg1, %0) <{operandSegmentSizes = array<i32: 1, 0, 0, 1>}> : (i1, memref<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>) -> (), sym_name = "update_true"}> ({
  ^bb0(%arg0: memref<f32>):
    %0 = "arith.constant"() <{value = true}> : () -> i1
    %1 = "acc.update_device"(%arg0) <{dataClause = #acc<data_clause acc_update_device>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    "acc.update"(%0, %1) <{operandSegmentSizes = array<i32: 1, 0, 0, 1>}> : (i1, memref<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>) -> (), sym_name = "update_false"}> ({
  ^bb0(%arg0: memref<f32>):
    %0 = "arith.constant"() <{value = false}> : () -> i1
    %1 = "acc.update_device"(%arg0) <{dataClause = #acc<data_clause acc_update_device>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    "acc.update"(%0, %1) <{operandSegmentSizes = array<i32: 1, 0, 0, 1>}> : (i1, memref<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>) -> (), sym_name = "enter_data_true"}> ({
  ^bb0(%arg0: memref<f32>):
    %0 = "arith.constant"() <{value = true}> : () -> i1
    %1 = "acc.create"(%arg0) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    "acc.enter_data"(%0, %1) <{async, operandSegmentSizes = array<i32: 1, 0, 0, 0, 1>}> : (i1, memref<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>) -> (), sym_name = "enter_data_false"}> ({
  ^bb0(%arg0: memref<f32>):
    %0 = "arith.constant"() <{value = false}> : () -> i1
    %1 = "acc.create"(%arg0) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    "acc.enter_data"(%0, %1) <{async, operandSegmentSizes = array<i32: 1, 0, 0, 0, 1>}> : (i1, memref<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>) -> (), sym_name = "exit_data_true"}> ({
  ^bb0(%arg0: memref<f32>):
    %0 = "arith.constant"() <{value = true}> : () -> i1
    %1 = "acc.getdeviceptr"(%arg0) <{dataClause = #acc<data_clause acc_getdeviceptr>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    "acc.exit_data"(%0, %1) <{async, operandSegmentSizes = array<i32: 1, 0, 0, 0, 1>}> : (i1, memref<f32>) -> ()
    "acc.delete"(%1) <{dataClause = #acc<data_clause acc_delete>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0>, structured = true}> : (memref<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>) -> (), sym_name = "exit_data_false"}> ({
  ^bb0(%arg0: memref<f32>):
    %0 = "arith.constant"() <{value = false}> : () -> i1
    %1 = "acc.getdeviceptr"(%arg0) <{dataClause = #acc<data_clause acc_getdeviceptr>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    "acc.exit_data"(%0, %1) <{async, operandSegmentSizes = array<i32: 1, 0, 0, 0, 1>}> : (i1, memref<f32>) -> ()
    "acc.delete"(%1) <{dataClause = #acc<data_clause acc_delete>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0>, structured = true}> : (memref<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

