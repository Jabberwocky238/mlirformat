module {
  func.func @main() {
    %alloca = memref.alloca() : memref<5xf64>
    %assume_align = memref.assume_alignment %alloca, 8 : memref<5xf64>
    %0 = llvm.mlir.constant(0 : index) : i64
    %1 = llvm.mlir.constant(1 : index) : i64
    %2 = llvm.mlir.constant(3 : index) : i64
    %3 = llvm.inttoptr %2 : i64 to !llvm.ptr
    %4 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %5 = llvm.insertvalue %3, %4[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %6 = llvm.insertvalue %3, %5[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %7 = llvm.insertvalue %0, %6[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %8 = llvm.insertvalue %1, %7[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %9 = llvm.insertvalue %1, %8[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %10 = builtin.unrealized_conversion_cast %9 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> to memref<1xf32>
    %assume_align_0 = memref.assume_alignment %10, 4 : memref<1xf32>
    return
  }
}

