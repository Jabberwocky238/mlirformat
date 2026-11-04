module {
  func.func @store_dynamic(%arg0: memref<?xf32>, %arg1: index) {
    %cst = arith.constant 1.000000e+00 : f32
    %0 = memref.atomic_rmw addf %cst, %arg0[%arg1] : (f32, memref<?xf32>) -> f32
    return
  }
  func.func @main() {
    %alloca = memref.alloca() : memref<10xf32>
    %intptr = memref.extract_aligned_pointer_as_index %alloca : memref<10xf32> -> index
    %0 = arith.index_cast %intptr : index to i64
    %1 = llvm.inttoptr %0 : i64 to !llvm.ptr
    %2 = llvm.mlir.constant(0 : index) : i64
    %3 = llvm.mlir.constant(1 : index) : i64
    %4 = llvm.mlir.constant(5 : index) : i64
    %5 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %6 = llvm.insertvalue %1, %5[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %7 = llvm.insertvalue %1, %6[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %8 = llvm.insertvalue %2, %7[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %9 = llvm.insertvalue %4, %8[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %10 = llvm.insertvalue %3, %9[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %11 = builtin.unrealized_conversion_cast %10 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> to memref<5xf32>
    %cast = memref.cast %11 : memref<5xf32> to memref<?xf32>
    %c9 = arith.constant 9 : index
    call @store_dynamic(%cast, %c9) : (memref<?xf32>, index) -> ()
    return
  }
}

