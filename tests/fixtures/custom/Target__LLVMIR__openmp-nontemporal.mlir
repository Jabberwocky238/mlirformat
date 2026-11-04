module {
}

// -----
module {
  llvm.func @simd_nontemporal() {
    %0 = llvm.mlir.constant(10 : i64) : i64
    %1 = llvm.mlir.constant(1 : i64) : i64
    %2 = llvm.alloca %1 x i64 : (i64) -> !llvm.ptr
    %3 = llvm.alloca %1 x i64 : (i64) -> !llvm.ptr
    omp.simd nontemporal(%2, %3 : !llvm.ptr, !llvm.ptr) {
      omp.loop_nest (%arg0) : i64 = (%1) to (%0) inclusive step (%1) {
        %4 = llvm.load %3 {nontemporal} : !llvm.ptr -> i64
        llvm.store %4, %2 {nontemporal} : i64, !llvm.ptr
        omp.yield
      }
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @_QPtest(%arg0: !llvm.ptr {fir.bindc_name = "n"}, %arg1: !llvm.ptr {fir.bindc_name = "a"}) {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)> {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.alloca %0 x !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)> {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %3 = llvm.mlir.constant(1 : i64) : i64
    %4 = llvm.alloca %3 x i32 {bindc_name = "i", pinned} : (i64) -> !llvm.ptr
    %5 = llvm.load %arg0 : !llvm.ptr -> i32
    omp.simd nontemporal(%arg1 : !llvm.ptr) {
      omp.loop_nest (%arg2) : i32 = (%0) to (%5) inclusive step (%0) {
        llvm.store %arg2, %4 : i32, !llvm.ptr
        %6 = llvm.mlir.constant(48 : i32) : i32
        "llvm.intr.memcpy"(%2, %arg1, %6) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
        %7 = llvm.load %4 : !llvm.ptr -> i32
        %8 = llvm.sext %7 : i32 to i64
        %9 = llvm.getelementptr %2[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
        %10 = llvm.load %9 : !llvm.ptr -> !llvm.ptr
        %11 = llvm.mlir.constant(0 : index) : i64
        %12 = llvm.getelementptr %2[0, 7, %11, 0] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
        %13 = llvm.load %12 : !llvm.ptr -> i64
        %14 = llvm.getelementptr %2[0, 7, %11, 1] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
        %15 = llvm.load %14 : !llvm.ptr -> i64
        %16 = llvm.getelementptr %2[0, 7, %11, 2] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
        %17 = llvm.load %16 : !llvm.ptr -> i64
        %18 = llvm.mlir.constant(0 : i64) : i64
        %19 = llvm.sub %8, %13 overflow<nsw> : i64
        %20 = llvm.mul %19, %3 overflow<nsw> : i64
        %21 = llvm.mul %20, %3 overflow<nsw> : i64
        %22 = llvm.add %21, %18 overflow<nsw> : i64
        %23 = llvm.mul %3, %15 overflow<nsw> : i64
        %24 = llvm.getelementptr %10[%22] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        %25 = llvm.load %24 {nontemporal} : !llvm.ptr -> f32
        %26 = llvm.mlir.constant(2.000000e+01 : f32) : f32
        %27 = llvm.fadd %25, %26 {fastmathFlags = #llvm.fastmath<contract>} : f32
        %28 = llvm.mlir.constant(48 : i32) : i32
        "llvm.intr.memcpy"(%1, %arg1, %28) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
        %29 = llvm.load %4 : !llvm.ptr -> i32
        %30 = llvm.sext %29 : i32 to i64
        %31 = llvm.getelementptr %1[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
        %32 = llvm.load %31 : !llvm.ptr -> !llvm.ptr
        %33 = llvm.mlir.constant(0 : index) : i64
        %34 = llvm.getelementptr %1[0, 7, %33, 0] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
        %35 = llvm.load %34 : !llvm.ptr -> i64
        %36 = llvm.getelementptr %1[0, 7, %33, 1] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
        %37 = llvm.load %36 : !llvm.ptr -> i64
        %38 = llvm.getelementptr %1[0, 7, %33, 2] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
        %39 = llvm.load %38 : !llvm.ptr -> i64
        %40 = llvm.sub %30, %35 overflow<nsw> : i64
        %41 = llvm.mul %40, %3 overflow<nsw> : i64
        %42 = llvm.mul %41, %3 overflow<nsw> : i64
        %43 = llvm.add %42, %18 overflow<nsw> : i64
        %44 = llvm.mul %3, %37 overflow<nsw> : i64
        %45 = llvm.getelementptr %32[%43] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        llvm.store %27, %45 {nontemporal} : f32, !llvm.ptr
        omp.yield
      }
    }
    llvm.return
  }
}

// -----
module {
}

