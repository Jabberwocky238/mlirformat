"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "testenterdataop", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":3:8), %arg1: !llvm.ptr loc("<stdin>":3:26)):
    %0 = "acc.create"(%arg0) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":4:10)
    %1 = "acc.copyin"(%arg1) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":5:10)
    "acc.enter_data"(%0, %1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 2>}> : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":6:5)
    "llvm.return"() : () -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
