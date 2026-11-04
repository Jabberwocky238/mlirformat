"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_direct_var_name"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> {acc.var_name = #acc.var_name<"my_variable">} : () -> memref<10xi32>
    %1 = "memref.cast"(%0) {test.var_name} : (memref<10xi32>) -> memref<10xi32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_through_cast"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> {acc.var_name = #acc.var_name<"casted_variable">} : () -> memref<5x2xi32>
    %1 = "memref.cast"(%0) : (memref<5x2xi32>) -> memref<?x?xi32>
    %2 = "memref.cast"(%1) {test.var_name} : (memref<?x?xi32>) -> memref<5x2xi32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_no_var_name"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xi32>
    %1 = "memref.cast"(%0) {test.var_name} : (memref<10xi32>) -> memref<10xi32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_multiple_casts"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> {acc.var_name = #acc.var_name<"multi_cast">} : () -> memref<10xi32>
    %1 = "memref.cast"(%0) : (memref<10xi32>) -> memref<?xi32>
    %2 = "memref.cast"(%1) : (memref<?xi32>) -> memref<10xi32>
    %3 = "memref.cast"(%2) {test.var_name} : (memref<10xi32>) -> memref<10xi32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_copyin_name"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %1 = "acc.copyin"(%0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, name = "input_data", operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<10xf32>) -> memref<10xf32>
    %2 = "memref.cast"(%1) {test.var_name} : (memref<10xf32>) -> memref<?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

