module {
  llvm.func @nvvm_special_regs_clock() -> !llvm.struct<(i32, i32)> {
    %0 = llvm.mlir.zero : !llvm.struct<(i32, i32)>
    %1 = nvvm.read.ptx.sreg.clock : i32
    %2 = nvvm.read.ptx.sreg.clock : i32
    %3 = llvm.insertvalue %1, %0[0] : !llvm.struct<(i32, i32)> 
    %4 = llvm.insertvalue %2, %3[1] : !llvm.struct<(i32, i32)> 
    llvm.return %4 : !llvm.struct<(i32, i32)>
  }
  llvm.func @nvvm_special_regs_clock64() -> !llvm.struct<(i64, i64)> {
    %0 = llvm.mlir.zero : !llvm.struct<(i64, i64)>
    %1 = nvvm.read.ptx.sreg.clock64 : i64
    %2 = nvvm.read.ptx.sreg.clock64 : i64
    %3 = llvm.insertvalue %1, %0[0] : !llvm.struct<(i64, i64)> 
    %4 = llvm.insertvalue %2, %3[1] : !llvm.struct<(i64, i64)> 
    llvm.return %4 : !llvm.struct<(i64, i64)>
  }
  llvm.func @nvvm_special_regs_globaltimer() -> !llvm.struct<(i64, i64)> {
    %0 = llvm.mlir.zero : !llvm.struct<(i64, i64)>
    %1 = nvvm.read.ptx.sreg.globaltimer : i64
    %2 = nvvm.read.ptx.sreg.globaltimer : i64
    %3 = llvm.insertvalue %1, %0[0] : !llvm.struct<(i64, i64)> 
    %4 = llvm.insertvalue %2, %3[1] : !llvm.struct<(i64, i64)> 
    llvm.return %4 : !llvm.struct<(i64, i64)>
  }
}

