module {
  llvm.func @free(!llvm.ptr)
  llvm.func @malloc(i64) -> !llvm.ptr
  omp.private {type = private} @_QFEc2_private_box_heap_c8xU : !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)> init {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.mlir.constant(24 : i32) : i32
    %1 = llvm.mlir.constant(0 : i64) : i64
    %2 = llvm.mlir.constant(1 : i32) : i32
    %3 = llvm.alloca %2 x !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)> {alignment = 8 : i64} : (i32) -> !llvm.ptr
    "llvm.intr.memcpy"(%3, %arg0, %0) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    %4 = llvm.ptrtoint %arg0 : !llvm.ptr to i64
    %5 = llvm.icmp "eq" %4, %1 : i64
    llvm.cond_br %5, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    llvm.br ^bb3
  ^bb2:  // pred: ^bb0
    llvm.br ^bb3
  ^bb3:  // 2 preds: ^bb1, ^bb2
    omp.yield(%arg1 : !llvm.ptr)
  } dealloc {
  ^bb0(%arg0: !llvm.ptr):
    omp.yield
  }
  omp.private {type = private} @_QFEc1_private_box_ptr_c8xU : !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)> init {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.mlir.constant(24 : i32) : i32
    %1 = llvm.mlir.constant(1 : i32) : i32
    %2 = llvm.alloca %1 x !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)> {alignment = 8 : i64} : (i32) -> !llvm.ptr
    "llvm.intr.memcpy"(%2, %arg0, %0) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    omp.yield(%arg1 : !llvm.ptr)
  }
  llvm.func @_QQmain() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)> {bindc_name = "c2"} : (i64) -> !llvm.ptr
    %2 = llvm.alloca %0 x !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)> {bindc_name = "c1"} : (i64) -> !llvm.ptr
    omp.task private(@_QFEc1_private_box_ptr_c8xU %2 -> %arg0, @_QFEc2_private_box_heap_c8xU %1 -> %arg1 : !llvm.ptr, !llvm.ptr) {
      omp.terminator
    }
    llvm.return
  }
}

