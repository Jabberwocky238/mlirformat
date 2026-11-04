module {
  llvm.func @free(!llvm.ptr)
  llvm.func @parallel_op_dealloc(%arg0: !llvm.ptr) {
    omp.parallel private(@x.privatizer %arg0 -> %arg1 : !llvm.ptr) {
      %0 = llvm.load %arg1 : !llvm.ptr -> f32
      omp.terminator
    }
    llvm.return
  }
  omp.private {type = firstprivate} @x.privatizer : f32 copy {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.load %arg0 : !llvm.ptr -> f32
    llvm.store %0, %arg1 : f32, !llvm.ptr
    omp.yield(%arg1 : !llvm.ptr)
  } dealloc {
  ^bb0(%arg0: !llvm.ptr):
    %0 = llvm.ptrtoint %arg0 : !llvm.ptr to i64
    %1 = llvm.mlir.constant(0 : i64) : i64
    %2 = llvm.icmp "ne" %0, %1 : i64
    llvm.cond_br %2, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    llvm.call @free(%arg0) : (!llvm.ptr) -> ()
    llvm.br ^bb2
  ^bb2:  // 2 preds: ^bb0, ^bb1
    omp.yield
  }
}

