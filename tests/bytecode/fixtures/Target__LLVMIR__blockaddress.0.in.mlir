"builtin.module"() ({
  "llvm.mlir.global"() <{addr_space = 0 : i32, dso_local, global_type = !llvm.ptr, linkage = #llvm.linkage<private>, sym_name = "g", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.blockaddress"() <{block_addr = #llvm.blockaddress<function = @fn, tag = <id = 0>>}> : () -> !llvm.ptr loc("<stdin>":3:10)
    "llvm.return"(%0) : (!llvm.ptr) -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "fn", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.br"()[^bb1] : () -> () loc("<stdin>":7:5)
  ^bb1:  // pred: ^bb0
    "llvm.blocktag"() <{tag = #llvm.blocktag<id = 0>}> : () -> () loc("<stdin>":9:5)
    "llvm.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":6:3)
}) : () -> () loc("<stdin>":1:1)
