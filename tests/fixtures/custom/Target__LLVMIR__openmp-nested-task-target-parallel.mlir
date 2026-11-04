module {
  omp.private {type = private} @_QFEi_private_i32 : i32
  omp.private {type = firstprivate} @_QFEc_firstprivate_i32 : i32 copy {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.load %arg0 : !llvm.ptr -> i32
    llvm.store %0, %arg1 : i32, !llvm.ptr
    omp.yield(%arg1 : !llvm.ptr)
  }
  llvm.func @_QQmain() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {bindc_name = "i"} : (i64) -> !llvm.ptr
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.alloca %2 x i32 {bindc_name = "c"} : (i64) -> !llvm.ptr
    %4 = llvm.mlir.constant(10 : index) : i64
    %5 = llvm.mlir.constant(0 : index) : i64
    %6 = llvm.mlir.constant(10000 : index) : i64
    %7 = llvm.mlir.constant(1 : index) : i64
    %8 = llvm.mlir.constant(1 : i64) : i64
    %9 = llvm.mlir.addressof @_QFECchunksz : !llvm.ptr
    %10 = llvm.mlir.constant(1 : i64) : i64
    %11 = llvm.trunc %7 : i64 to i32
    llvm.br ^bb1(%11, %4 : i32, i64)
  ^bb1(%12: i32, %13: i64):  // pred: ^bb0
    %14 = llvm.icmp "sgt" %13, %5 : i64
    llvm.store %12, %3 : i32, !llvm.ptr
    omp.task private(@_QFEc_firstprivate_i32 %3 -> %arg0 : !llvm.ptr) {
      %15 = omp.map.info var_ptr(%1 : !llvm.ptr, i32) map_clauses(implicit) capture(ByCopy) -> !llvm.ptr {name = "i"}
      %16 = omp.map.info var_ptr(%arg0 : !llvm.ptr, i32) map_clauses(implicit) capture(ByCopy) -> !llvm.ptr {name = "c"}
      %17 = omp.map.info var_ptr(%9 : !llvm.ptr, i32) map_clauses(implicit) capture(ByCopy) -> !llvm.ptr {name = "chunksz"}
      omp.target map_entries(%15 -> %arg1, %16 -> %arg2, %17 -> %arg3 : !llvm.ptr, !llvm.ptr, !llvm.ptr) {
        %18 = llvm.mlir.constant(9999 : i32) : i32
        %19 = llvm.mlir.constant(1 : i32) : i32
        omp.parallel {
          %20 = llvm.load %arg2 : !llvm.ptr -> i32
          %21 = llvm.add %20, %18 : i32
          omp.wsloop private(@_QFEi_private_i32 %arg1 -> %arg4 : !llvm.ptr) {
            omp.loop_nest (%arg5) : i32 = (%20) to (%21) inclusive step (%19) {
              llvm.store %arg5, %arg4 : i32, !llvm.ptr
              omp.yield
            }
          }
          omp.terminator
        }
        omp.terminator
      }
      omp.terminator
    }
    llvm.return
  }
  llvm.mlir.global internal constant @_QFECchunksz() {addr_space = 0 : i32} : i32 {
    %0 = llvm.mlir.constant(10000 : i32) : i32
    llvm.return %0 : i32
  }
  llvm.mlir.global internal constant @_QFECn() {addr_space = 0 : i32} : i32 {
    %0 = llvm.mlir.constant(100000 : i32) : i32
    llvm.return %0 : i32
  }
}

