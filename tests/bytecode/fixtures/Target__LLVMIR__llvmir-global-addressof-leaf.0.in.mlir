"builtin.module"() ({
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = !llvm.array<2 x i8>, linkage = #llvm.linkage<private>, sym_name = "s0", unnamed_addr = 0 : i64, value = "a\00", visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":2:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = !llvm.array<2 x i8>, linkage = #llvm.linkage<private>, sym_name = "s1", unnamed_addr = 0 : i64, value = "b\00", visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":4:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = !llvm.array<2 x i8>, linkage = #llvm.linkage<private>, sym_name = "s2", unnamed_addr = 0 : i64, value = "c\00", visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":6:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = !llvm.array<3 x ptr>, linkage = #llvm.linkage<external>, sym_name = "ptrs", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = [@s0, @s1, @s2]}> : () -> !llvm.array<3 x ptr> loc("<stdin>":9:10)
    "llvm.return"(%0) : (!llvm.array<3 x ptr>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":8:3)
}) : () -> () loc("<stdin>":1:1)
