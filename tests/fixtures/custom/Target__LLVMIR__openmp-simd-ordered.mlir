module {
  omp.private {type = private} @i_private_i32 : i32
  llvm.func @simd_ordered_linear() {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.constant(1 : i64) : i64
    %2 = llvm.mlir.constant(1 : i32) : i32
    %3 = llvm.mlir.constant(10 : i32) : i32
    %4 = llvm.mlir.constant(10 : i32) : i32
    %5 = llvm.mlir.constant(2 : i32) : i32
    %6 = llvm.mlir.constant(100 : i64) : i64
    %7 = llvm.alloca %6 x i32 : (i64) -> !llvm.ptr
    %8 = llvm.alloca %6 x i32 : (i64) -> !llvm.ptr
    %9 = llvm.alloca %6 x i32 : (i64) -> !llvm.ptr
    %10 = llvm.alloca %1 x i32 {bindc_name = "i"} : (i64) -> !llvm.ptr
    omp.simd linear(%10 : !llvm.ptr = %2 : i32) private(@i_private_i32 %10 -> %arg0 : !llvm.ptr) {
      omp.loop_nest (%arg1) : i32 = (%2) to (%3) inclusive step (%2) {
        llvm.store %arg1, %arg0 : i32, !llvm.ptr
        %11 = llvm.load %arg0 : !llvm.ptr -> i32
        %12 = llvm.sext %11 : i32 to i64
        %13 = llvm.sub %12, %1 : i64
        %14 = llvm.getelementptr %8[%13] : (!llvm.ptr, i64) -> !llvm.ptr, i32
        %15 = llvm.load %14 : !llvm.ptr -> i32
        %16 = llvm.mul %15, %4 : i32
        %17 = llvm.getelementptr %7[%13] : (!llvm.ptr, i64) -> !llvm.ptr, i32
        llvm.store %16, %17 : i32, !llvm.ptr
        omp.ordered.region par_level_simd {
          %25 = llvm.load %arg0 : !llvm.ptr -> i32
          %26 = llvm.sext %25 : i32 to i64
          %27 = llvm.sub %26, %1 : i64
          %28 = llvm.getelementptr %7[%27] : (!llvm.ptr, i64) -> !llvm.ptr, i32
          %29 = llvm.load %28 : !llvm.ptr -> i32
          omp.terminator
        }
        %18 = llvm.load %arg0 : !llvm.ptr -> i32
        %19 = llvm.sext %18 : i32 to i64
        %20 = llvm.sub %19, %1 : i64
        %21 = llvm.getelementptr %7[%20] : (!llvm.ptr, i64) -> !llvm.ptr, i32
        %22 = llvm.load %21 : !llvm.ptr -> i32
        %23 = llvm.mul %22, %5 : i32
        %24 = llvm.getelementptr %9[%20] : (!llvm.ptr, i64) -> !llvm.ptr, i32
        llvm.store %23, %24 : i32, !llvm.ptr
        omp.yield
      }
    } {linear_var_types = [i32]}
    llvm.return
  }
}

