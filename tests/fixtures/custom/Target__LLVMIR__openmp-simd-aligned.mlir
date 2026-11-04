module {
  llvm.func @_QPsimd_aligned_pointer() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)> {bindc_name = "x"} : (i64) -> !llvm.ptr
    %2 = llvm.alloca %0 x i32 {bindc_name = "i", pinned} : (i64) -> !llvm.ptr
    %3 = llvm.mlir.constant(1 : i32) : i32
    %4 = llvm.mlir.constant(10 : i32) : i32
    %5 = llvm.mlir.constant(1 : i32) : i32
    omp.simd aligned(%1 : !llvm.ptr -> 256 : i64) {
      omp.loop_nest (%arg0) : i32 = (%3) to (%4) inclusive step (%5) {
        llvm.store %arg0, %2 : i32, !llvm.ptr
        omp.yield
      }
    }
    llvm.return
  }
  llvm.func @_QPsimd_aligned_cptr() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x !llvm.struct<"_QM__fortran_builtinsT__builtin_c_ptr", (i64)> {bindc_name = "a"} : (i64) -> !llvm.ptr
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.alloca %2 x i32 {bindc_name = "i", pinned} : (i64) -> !llvm.ptr
    %4 = llvm.mlir.constant(1 : i32) : i32
    %5 = llvm.mlir.constant(10 : i32) : i32
    %6 = llvm.mlir.constant(1 : i32) : i32
    omp.simd aligned(%1 : !llvm.ptr -> 256 : i64) {
      omp.loop_nest (%arg0) : i32 = (%4) to (%5) inclusive step (%6) {
        llvm.store %arg0, %3 : i32, !llvm.ptr
        omp.yield
      }
    }
    llvm.return
  }
  llvm.func @_QPsimd_aligned_allocatable() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)> {bindc_name = "a"} : (i64) -> !llvm.ptr
    %2 = llvm.mlir.constant(1 : i32) : i32
    %3 = llvm.mlir.constant(10 : i32) : i32
    %4 = llvm.mlir.constant(1 : i32) : i32
    omp.simd aligned(%1 : !llvm.ptr -> 256 : i64) {
      omp.loop_nest (%arg0) : i32 = (%2) to (%3) inclusive step (%4) {
        omp.yield
      }
    }
    llvm.return
  }
  llvm.func @_QPsimd_aligned_non_power_of_two() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)> {bindc_name = "a"} : (i64) -> !llvm.ptr
    %2 = llvm.alloca %0 x !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)> {bindc_name = "b"} : (i64) -> !llvm.ptr
    %3 = llvm.mlir.constant(1 : i32) : i32
    %4 = llvm.mlir.constant(10 : i32) : i32
    %5 = llvm.mlir.constant(1 : i32) : i32
    omp.simd aligned(%1 : !llvm.ptr -> 257 : i64, %2 : !llvm.ptr -> 64 : i64) {
      omp.loop_nest (%arg0) : i32 = (%3) to (%4) inclusive step (%5) {
        omp.yield
      }
    }
    llvm.return
  }
}

