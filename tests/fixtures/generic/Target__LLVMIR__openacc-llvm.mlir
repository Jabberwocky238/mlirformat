"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "testenterdataop", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = "acc.create"(%arg0) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (!llvm.ptr) -> !llvm.ptr
    %1 = "acc.copyin"(%arg1) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (!llvm.ptr) -> !llvm.ptr
    "acc.enter_data"(%0, %1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 2>}> : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "testexitdataop", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = "acc.getdeviceptr"(%arg0) <{dataClause = #acc<data_clause acc_getdeviceptr>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (!llvm.ptr) -> !llvm.ptr
    %1 = "acc.getdeviceptr"(%arg1) <{dataClause = #acc<data_clause acc_getdeviceptr>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (!llvm.ptr) -> !llvm.ptr
    "acc.exit_data"(%0, %1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 2>}> : (!llvm.ptr, !llvm.ptr) -> ()
    "acc.delete"(%0) <{dataClause = #acc<data_clause acc_delete>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0>, structured = true}> : (!llvm.ptr) -> ()
    "acc.copyout"(%1, %arg1) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = f32}> : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "testupdateop", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "acc.update_device"(%arg0) <{dataClause = #acc<data_clause acc_update_device>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (!llvm.ptr) -> !llvm.ptr
    "acc.update"(%0) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>}> : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "testdataop", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr):
    %0 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (!llvm.ptr) -> !llvm.ptr
    %1 = "acc.create"(%arg1) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (!llvm.ptr) -> !llvm.ptr
    "acc.data"(%0, %1) <{operandSegmentSizes = array<i32: 0, 0, 0, 2>}> ({
      %2 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32
      "llvm.store"(%2, %arg2) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "acc.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr) -> ()
    "acc.copyout"(%0, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = f32}> : (!llvm.ptr, !llvm.ptr) -> ()
    "acc.copyout"(%1, %arg1) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = f32}> : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

