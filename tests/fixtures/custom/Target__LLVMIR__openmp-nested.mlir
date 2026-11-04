module {
  llvm.func @printf(!llvm.ptr, ...) -> i32
  llvm.mlir.global internal constant @str0("WG size of kernel = %d X %d\0A\00") {addr_space = 0 : i32}
  llvm.func @main(%arg0: i32, %arg1: !llvm.ptr) -> i32 {
    omp.parallel {
      %1 = llvm.mlir.constant(1 : index) : i64
      %2 = llvm.mlir.constant(10 : index) : i64
      %3 = llvm.mlir.constant(0 : index) : i64
      %4 = llvm.mlir.constant(0 : i32) : i32
      %5 = llvm.alloca %1 x i64 : (i64) -> !llvm.ptr
      omp.wsloop {
        omp.loop_nest (%arg2) : i64 = (%3) to (%2) step (%1) {
          omp.parallel {
            omp.wsloop {
              omp.loop_nest (%arg3) : i64 = (%3) to (%1) step (%1) {
                llvm.store %3, %5 : i64, !llvm.ptr
                omp.yield
              }
            }
            omp.terminator
          }
          %6 = llvm.load %5 : !llvm.ptr -> i64
          %7 = llvm.trunc %6 : i64 to i32
          %8 = llvm.mlir.addressof @str0 : !llvm.ptr
          %9 = llvm.getelementptr %8[%4, %4] : (!llvm.ptr, i32, i32) -> !llvm.ptr, !llvm.array<29 x i8>
          %10 = llvm.call @printf(%9, %7, %7) vararg(!llvm.func<i32 (ptr, ...)>) : (!llvm.ptr, i32, i32) -> i32
          omp.yield
        }
      }
      omp.terminator
    }
    %0 = llvm.mlir.constant(0 : i32) : i32
    llvm.return %0 : i32
  }
}

