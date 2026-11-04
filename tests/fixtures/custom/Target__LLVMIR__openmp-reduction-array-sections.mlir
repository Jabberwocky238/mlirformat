module {
  omp.declare_reduction @add_reduction_byref_box_Uxf32 : !llvm.ptr alloc {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)> : (i64) -> !llvm.ptr
    omp.yield(%1 : !llvm.ptr)
  } init {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.mlir.constant(1 : i64) : i64
    llvm.store %0, %arg1 : i64, !llvm.ptr
    omp.yield(%arg1 : !llvm.ptr)
  } combiner {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.constant(0 : index) : i64
    %2 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb1(%0 : i64)
  ^bb1(%3: i64):  // 2 preds: ^bb0, ^bb2
    %4 = llvm.icmp "sgt" %3, %1 : i64
    llvm.cond_br %4, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %5 = llvm.sub %3, %2 : i64
    llvm.br ^bb1(%5 : i64)
  ^bb3:  // pred: ^bb1
    omp.yield(%arg0 : !llvm.ptr)
  } cleanup {
  ^bb0(%arg0: !llvm.ptr):
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.ptrtoint %arg0 : !llvm.ptr to i64
    %2 = llvm.icmp "ne" %1, %0 : i64
    llvm.cond_br %2, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2
  ^bb2:  // 2 preds: ^bb0, ^bb1
    omp.yield
  }
  llvm.func @sectionsreduction_(%arg0: !llvm.ptr {fir.bindc_name = "x"}) attributes {fir.internal_name = "_QPsectionsreduction"} {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.mlir.constant(0 : index) : i64
    %2 = llvm.mlir.constant(1 : index) : i64
    omp.parallel {
      %3 = llvm.alloca %0 x !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)> : (i64) -> !llvm.ptr
      omp.sections reduction(byref @add_reduction_byref_box_Uxf32 %3 -> %arg1 : !llvm.ptr) {
        omp.section {
        ^bb0(%arg2: !llvm.ptr):
          llvm.br ^bb1(%0 : i64)
        ^bb1(%4: i64):  // 2 preds: ^bb0, ^bb2
          %5 = llvm.icmp "sgt" %4, %1 : i64
          llvm.cond_br %5, ^bb2, ^bb3
        ^bb2:  // pred: ^bb1
          %6 = llvm.sub %4, %2 : i64
          llvm.br ^bb1(%6 : i64)
        ^bb3:  // pred: ^bb1
          omp.terminator
        }
        omp.section {
        ^bb0(%arg2: !llvm.ptr):
          llvm.br ^bb1(%0 : i64)
        ^bb1(%4: i64):  // 2 preds: ^bb0, ^bb2
          %5 = llvm.icmp "sgt" %4, %1 : i64
          llvm.cond_br %5, ^bb2, ^bb3
        ^bb2:  // pred: ^bb1
          %6 = llvm.sub %4, %2 : i64
          llvm.br ^bb1(%6 : i64)
        ^bb3:  // pred: ^bb1
          omp.terminator
        }
        omp.terminator
      }
      omp.terminator
    }
    llvm.return
  }
}

