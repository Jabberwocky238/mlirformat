"builtin.module"() ({
  "llvm.mlir.ifunc"() <{address_space = 0 : i32, i_func_type = !llvm.func<f32 (i64)>, linkage = #llvm.linkage<external>, resolver = @resolver, resolver_type = !llvm.ptr, sym_name = "ifunc", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr ()>, linkage = #llvm.linkage<external>, sym_name = "resolver", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 333 : i64}> : () -> i64 loc("<stdin>":4:10)
    %1 = "llvm.inttoptr"(%0) : (i64) -> !llvm.ptr loc("<stdin>":5:10)
    "llvm.return"(%1) : (!llvm.ptr) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":1:1)
