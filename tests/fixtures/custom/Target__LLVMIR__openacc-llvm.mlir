module {
  llvm.func @testenterdataop(%arg0: !llvm.ptr, %arg1: !llvm.ptr) {
    %0 = acc.create varPtr(%arg0 : !llvm.ptr) varType(f32) -> !llvm.ptr
    %1 = acc.copyin varPtr(%arg1 : !llvm.ptr) varType(f32) -> !llvm.ptr
    acc.enter_data dataOperands(%0, %1 : !llvm.ptr, !llvm.ptr)
    llvm.return
  }
}

// -----
module {
  llvm.func @testexitdataop(%arg0: !llvm.ptr, %arg1: !llvm.ptr) {
    %0 = acc.getdeviceptr varPtr(%arg0 : !llvm.ptr) varType(f32) -> !llvm.ptr
    %1 = acc.getdeviceptr varPtr(%arg1 : !llvm.ptr) varType(f32) -> !llvm.ptr
    acc.exit_data dataOperands(%0, %1 : !llvm.ptr, !llvm.ptr)
    acc.delete accPtr(%0 : !llvm.ptr)
    acc.copyout accPtr(%1 : !llvm.ptr) to varPtr(%arg1 : !llvm.ptr) varType(f32)
    llvm.return
  }
}

// -----
module {
  llvm.func @testupdateop(%arg0: !llvm.ptr) {
    %0 = acc.update_device varPtr(%arg0 : !llvm.ptr) varType(f32) -> !llvm.ptr
    acc.update dataOperands(%0 : !llvm.ptr)
    llvm.return
  }
}

// -----
module {
  llvm.func @testdataop(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr) {
    %0 = acc.copyin varPtr(%arg0 : !llvm.ptr) varType(f32) -> !llvm.ptr
    %1 = acc.create varPtr(%arg1 : !llvm.ptr) varType(f32) -> !llvm.ptr
    acc.data dataOperands(%0, %1 : !llvm.ptr, !llvm.ptr) {
      %2 = llvm.mlir.constant(2 : i32) : i32
      llvm.store %2, %arg2 : i32, !llvm.ptr
      acc.terminator
    }
    acc.copyout accPtr(%0 : !llvm.ptr) to varPtr(%arg0 : !llvm.ptr) varType(f32)
    acc.copyout accPtr(%1 : !llvm.ptr) to varPtr(%arg1 : !llvm.ptr) varType(f32)
    llvm.return
  }
}

