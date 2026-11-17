"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, dso_local, function_type = !llvm.func<ptr ()>, linkage = #llvm.linkage<internal>, sym_name = "callee", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %2 = "llvm.mlir.zero"() : () -> !llvm.ptr loc("<stdin>":3:10)
    "llvm.return"(%2) : (!llvm.ptr) -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.mlir.alias"() <{alias_type = !llvm.ptr, linkage = #llvm.linkage<external>, sym_name = "foo_alias", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %1 = "llvm.mlir.addressof"() <{global_name = @callee}> : () -> !llvm.ptr loc("<stdin>":7:10)
    "llvm.return"(%1) : (!llvm.ptr) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":6:3)
  "llvm.mlir.alias"() <{alias_type = !llvm.struct<(array<3 x ptr>)>, linkage = #llvm.linkage<external>, sym_name = "_ZTV1D", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.addressof"() <{global_name = @callee}> : () -> !llvm.ptr loc("<stdin>":11:10)
    "llvm.return"(%0) : (!llvm.ptr) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":10:3)
}) : () -> () loc("<stdin>":1:1)
