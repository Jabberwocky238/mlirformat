"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, struct<(!ptr.ptr<#llvm.address_space<3>>)>)>, linkage = #llvm.linkage<external>, sym_name = "llvm_ops_with_ptr_values", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":3:8), %arg1: !llvm.struct<(!ptr.ptr<#llvm.address_space<3>>)> loc("<stdin>":3:26)):
    %0 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> !ptr.ptr<#llvm.address_space<1>> loc("<stdin>":4:10)
    "llvm.store"(%0, %arg0) <{ordering = 0 : i64}> : (!ptr.ptr<#llvm.address_space<1>>, !llvm.ptr) -> () loc("<stdin>":5:5)
    "llvm.store"(%arg1, %arg0) <{ordering = 0 : i64}> : (!llvm.struct<(!ptr.ptr<#llvm.address_space<3>>)>, !llvm.ptr) -> () loc("<stdin>":6:5)
    "llvm.return"() : () -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
