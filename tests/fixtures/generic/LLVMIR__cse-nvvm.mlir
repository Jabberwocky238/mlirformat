"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(i32, i32)> ()>, linkage = #llvm.linkage<external>, sym_name = "nvvm_special_regs_clock", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %10 = "llvm.mlir.zero"() : () -> !llvm.struct<(i32, i32)>
    %11 = "nvvm.read.ptx.sreg.clock"() : () -> i32
    %12 = "nvvm.read.ptx.sreg.clock"() : () -> i32
    %13 = "llvm.insertvalue"(%10, %11) <{position = array<i64: 0>}> : (!llvm.struct<(i32, i32)>, i32) -> !llvm.struct<(i32, i32)>
    %14 = "llvm.insertvalue"(%13, %12) <{position = array<i64: 1>}> : (!llvm.struct<(i32, i32)>, i32) -> !llvm.struct<(i32, i32)>
    "llvm.return"(%14) : (!llvm.struct<(i32, i32)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(i64, i64)> ()>, linkage = #llvm.linkage<external>, sym_name = "nvvm_special_regs_clock64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %5 = "llvm.mlir.zero"() : () -> !llvm.struct<(i64, i64)>
    %6 = "nvvm.read.ptx.sreg.clock64"() : () -> i64
    %7 = "nvvm.read.ptx.sreg.clock64"() : () -> i64
    %8 = "llvm.insertvalue"(%5, %6) <{position = array<i64: 0>}> : (!llvm.struct<(i64, i64)>, i64) -> !llvm.struct<(i64, i64)>
    %9 = "llvm.insertvalue"(%8, %7) <{position = array<i64: 1>}> : (!llvm.struct<(i64, i64)>, i64) -> !llvm.struct<(i64, i64)>
    "llvm.return"(%9) : (!llvm.struct<(i64, i64)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(i64, i64)> ()>, linkage = #llvm.linkage<external>, sym_name = "nvvm_special_regs_globaltimer", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.zero"() : () -> !llvm.struct<(i64, i64)>
    %1 = "nvvm.read.ptx.sreg.globaltimer"() : () -> i64
    %2 = "nvvm.read.ptx.sreg.globaltimer"() : () -> i64
    %3 = "llvm.insertvalue"(%0, %1) <{position = array<i64: 0>}> : (!llvm.struct<(i64, i64)>, i64) -> !llvm.struct<(i64, i64)>
    %4 = "llvm.insertvalue"(%3, %2) <{position = array<i64: 1>}> : (!llvm.struct<(i64, i64)>, i64) -> !llvm.struct<(i64, i64)>
    "llvm.return"(%4) : (!llvm.struct<(i64, i64)>) -> ()
  }) : () -> ()
}) : () -> ()

