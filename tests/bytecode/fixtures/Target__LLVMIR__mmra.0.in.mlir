"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "native", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":5:8), %arg1: !llvm.ptr loc("<stdin>":5:26)):
    %0 = "llvm.load"(%arg0) <{ordering = 0 : i64}> {llvm.mmra = #llvm.mmra_tag<"foo":"bar">} : (!llvm.ptr) -> i32 loc("<stdin>":6:10)
    "llvm.fence"() <{ordering = 5 : i64, syncscope = "workgroup-one-as"}> {llvm.mmra = [#llvm.mmra_tag<"amdgpu-synchronize-as":"local">, #llvm.mmra_tag<"foo":"bar">]} : () -> () loc("<stdin>":7:5)
    "llvm.store"(%0, %arg1) <{ordering = 0 : i64}> {llvm.mmra = []} : (i32, !llvm.ptr) -> () loc("<stdin>":8:5)
    "llvm.return"() : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":4:3)
}) : () -> () loc("<stdin>":3:1)
