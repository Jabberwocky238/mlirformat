module {
  omp.declare_reduction @add_reduction_byref_box_heap_i32 : !llvm.ptr init {
  ^bb0(%arg0: !llvm.ptr):
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.ptrtoint %arg0 : !llvm.ptr to i64
    %2 = llvm.icmp "eq" %1, %0 : i64
    llvm.cond_br %2, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    llvm.br ^bb3
  ^bb2:  // pred: ^bb0
    llvm.br ^bb3
  ^bb3:  // 2 preds: ^bb1, ^bb2
    omp.yield(%arg0 : !llvm.ptr)
  } combiner {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    omp.yield(%arg0 : !llvm.ptr)
  } cleanup {
  ^bb0(%arg0: !llvm.ptr):
    omp.yield
  }
  llvm.func @missordered_blocks_(%arg0: !llvm.ptr {fir.bindc_name = "x"}, %arg1: !llvm.ptr {fir.bindc_name = "y"}) attributes {fir.internal_name = "_QPmissordered_blocks", frame_pointer = #llvm.framePointerKind<"non-leaf">, target_cpu = "generic", target_features = #llvm.target_features<["+outline-atomics", "+v8a", "+fp-armv8", "+neon"]>} {
    omp.parallel reduction(byref @add_reduction_byref_box_heap_i32 %arg0 -> %arg2, byref @add_reduction_byref_box_heap_i32 %arg1 -> %arg3 : !llvm.ptr, !llvm.ptr) {
      omp.terminator
    }
    llvm.return
  }
}

