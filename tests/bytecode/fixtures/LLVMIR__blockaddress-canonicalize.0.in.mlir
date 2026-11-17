"builtin.module"() ({
  "llvm.mlir.global"() <{addr_space = 0 : i32, dso_local, global_type = !llvm.ptr, linkage = #llvm.linkage<private>, sym_name = "x", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %1 = "llvm.blockaddress"() <{block_addr = #llvm.blockaddress<function = @ba, tag = <id = 2>>}> : () -> !llvm.ptr loc("<stdin>":3:10)
    "llvm.return"(%1) : (!llvm.ptr) -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr ()>, linkage = #llvm.linkage<external>, sym_name = "ba", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.blockaddress"() <{block_addr = #llvm.blockaddress<function = @ba, tag = <id = 1>>}> : () -> !llvm.ptr loc("<stdin>":7:10)
    "llvm.br"()[^bb1] : () -> () loc("<stdin>":8:5)
  ^bb1:  // pred: ^bb0
    "llvm.blocktag"() <{tag = #llvm.blocktag<id = 1>}> : () -> () loc("<stdin>":10:5)
    "llvm.br"()[^bb2] : () -> () loc("<stdin>":11:5)
  ^bb2:  // pred: ^bb1
    "llvm.blocktag"() <{tag = #llvm.blocktag<id = 2>}> : () -> () loc("<stdin>":13:5)
    "llvm.return"(%0) : (!llvm.ptr) -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":6:3)
}) : () -> () loc("<stdin>":1:1)
