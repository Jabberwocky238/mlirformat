"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, index) -> (), sym_name = "store_dynamic"}> ({
  ^bb0(%arg0: memref<?xf32>, %arg1: index):
    %16 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "memref.store"(%16, %arg0, %arg1) : (f32, memref<?xf32>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %1 = "memref.extract_aligned_pointer_as_index"(%0) : (memref<10xf32>) -> index
    %2 = "arith.index_cast"(%1) : (index) -> i64
    %3 = "llvm.inttoptr"(%2) : (i64) -> !llvm.ptr
    %4 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
    %5 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %6 = "llvm.mlir.constant"() <{value = 5 : index}> : () -> i64
    %7 = "llvm.mlir.poison"() : () -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %8 = "llvm.insertvalue"(%7, %3) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %9 = "llvm.insertvalue"(%8, %3) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %10 = "llvm.insertvalue"(%9, %4) <{position = array<i64: 2>}> : (!llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %11 = "llvm.insertvalue"(%10, %6) <{position = array<i64: 3, 0>}> : (!llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %12 = "llvm.insertvalue"(%11, %5) <{position = array<i64: 4, 0>}> : (!llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %13 = "builtin.unrealized_conversion_cast"(%12) : (!llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>) -> memref<5xf32>
    %14 = "memref.cast"(%13) : (memref<5xf32>) -> memref<?xf32>
    %15 = "arith.constant"() <{value = 9 : index}> : () -> index
    "func.call"(%14, %15) <{callee = @store_dynamic}> : (memref<?xf32>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

