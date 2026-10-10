module {
  llvm.func @memset() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x !llvm.array<10 x i32> {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(42 : i8) : i8
    %3 = llvm.mlir.constant(16 : i32) : i32
    "llvm.intr.memset"(%1, %2, %3) <{isVolatile = false}> : (!llvm.ptr, i8, i32) -> ()
    %4 = llvm.getelementptr %1[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<10 x i32>
    %5 = llvm.load %4 : !llvm.ptr -> i32
    llvm.return %5 : i32
  }
}

// -----
module {
  llvm.func @memset_inline() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x !llvm.array<10 x i32> {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(42 : i8) : i8
    "llvm.intr.memset.inline"(%1, %2) <{isVolatile = false, len = 16 : i64}> : (!llvm.ptr, i8) -> ()
    %3 = llvm.getelementptr %1[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<10 x i32>
    %4 = llvm.load %3 : !llvm.ptr -> i32
    llvm.return %4 : i32
  }
}

// -----
module {
  llvm.func @memset_partial() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x !llvm.array<10 x i32> {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(42 : i8) : i8
    %3 = llvm.mlir.constant(6 : i32) : i32
    "llvm.intr.memset"(%1, %2, %3) <{isVolatile = false}> : (!llvm.ptr, i8, i32) -> ()
    %4 = llvm.getelementptr %1[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<10 x i32>
    %5 = llvm.load %4 : !llvm.ptr -> i32
    llvm.return %5 : i32
  }
}

// -----
module {
  llvm.func @memset_inline_partial() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x !llvm.array<10 x i32> {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(42 : i8) : i8
    "llvm.intr.memset.inline"(%1, %2) <{isVolatile = false, len = 6 : i64}> : (!llvm.ptr, i8) -> ()
    %3 = llvm.getelementptr %1[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<10 x i32>
    %4 = llvm.load %3 : !llvm.ptr -> i32
    llvm.return %4 : i32
  }
}

// -----
module {
  llvm.func @memset_full() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x !llvm.array<10 x i32> {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(42 : i8) : i8
    %3 = llvm.mlir.constant(40 : i32) : i32
    "llvm.intr.memset"(%1, %2, %3) <{isVolatile = false}> : (!llvm.ptr, i8, i32) -> ()
    %4 = llvm.getelementptr %1[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<10 x i32>
    %5 = llvm.load %4 : !llvm.ptr -> i32
    llvm.return %5 : i32
  }
}

// -----
module {
  llvm.func @memset_inline_full() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x !llvm.array<10 x i32> {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(42 : i8) : i8
    "llvm.intr.memset.inline"(%1, %2) <{isVolatile = false, len = 40 : i64}> : (!llvm.ptr, i8) -> ()
    %3 = llvm.getelementptr %1[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<10 x i32>
    %4 = llvm.load %3 : !llvm.ptr -> i32
    llvm.return %4 : i32
  }
}

// -----
module {
  llvm.func @memset_too_much() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x !llvm.array<10 x i32> {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(42 : i8) : i8
    %3 = llvm.mlir.constant(41 : i32) : i32
    "llvm.intr.memset"(%1, %2, %3) <{isVolatile = false}> : (!llvm.ptr, i8, i32) -> ()
    %4 = llvm.getelementptr %1[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<10 x i32>
    %5 = llvm.load %4 : !llvm.ptr -> i32
    llvm.return %5 : i32
  }
}

// -----
module {
  llvm.func @memset_inline_too_much() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x !llvm.array<10 x i32> {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(42 : i8) : i8
    "llvm.intr.memset.inline"(%1, %2) <{isVolatile = false, len = 41 : i64}> : (!llvm.ptr, i8) -> ()
    %3 = llvm.getelementptr %1[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<10 x i32>
    %4 = llvm.load %3 : !llvm.ptr -> i32
    llvm.return %4 : i32
  }
}

// -----
module {
  llvm.func @memset_no_volatile() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x !llvm.array<10 x i32> {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(42 : i8) : i8
    %3 = llvm.mlir.constant(16 : i32) : i32
    "llvm.intr.memset"(%1, %2, %3) <{isVolatile = true}> : (!llvm.ptr, i8, i32) -> ()
    %4 = llvm.getelementptr %1[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<10 x i32>
    %5 = llvm.load %4 : !llvm.ptr -> i32
    llvm.return %5 : i32
  }
}

// -----
module {
  llvm.func @memset_inline_no_volatile() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x !llvm.array<10 x i32> {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(42 : i8) : i8
    "llvm.intr.memset.inline"(%1, %2) <{isVolatile = true, len = 16 : i64}> : (!llvm.ptr, i8) -> ()
    %3 = llvm.getelementptr %1[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<10 x i32>
    %4 = llvm.load %3 : !llvm.ptr -> i32
    llvm.return %4 : i32
  }
}

// -----
module {
  llvm.func @indirect_memset() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x !llvm.struct<"foo", (i32, i32)> : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(42 : i8) : i8
    %3 = llvm.mlir.constant(4 : i32) : i32
    %4 = llvm.getelementptr %1[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"foo", (i32, i32)>
    "llvm.intr.memset"(%4, %2, %3) <{isVolatile = false}> : (!llvm.ptr, i8, i32) -> ()
    %5 = llvm.load %4 : !llvm.ptr -> i32
    llvm.return %5 : i32
  }
}

// -----
module {
  llvm.func @indirect_memset_inline() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x !llvm.struct<"foo", (i32, i32)> : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(42 : i8) : i8
    %3 = llvm.getelementptr %1[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"foo", (i32, i32)>
    "llvm.intr.memset.inline"(%3, %2) <{isVolatile = false, len = 4 : i64}> : (!llvm.ptr, i8) -> ()
    %4 = llvm.load %3 : !llvm.ptr -> i32
    llvm.return %4 : i32
  }
}

// -----
module {
  llvm.func @invalid_indirect_memset() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x !llvm.struct<"foo", (i32, i32)> : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(42 : i8) : i8
    %3 = llvm.mlir.constant(6 : i32) : i32
    %4 = llvm.getelementptr %1[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"foo", (i32, i32)>
    "llvm.intr.memset"(%4, %2, %3) <{isVolatile = false}> : (!llvm.ptr, i8, i32) -> ()
    %5 = llvm.load %4 : !llvm.ptr -> i32
    llvm.return %5 : i32
  }
}

// -----
module {
  llvm.func @invalid_indirect_memset_inline() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x !llvm.struct<"foo", (i32, i32)> : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(42 : i8) : i8
    %3 = llvm.getelementptr %1[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"foo", (i32, i32)>
    "llvm.intr.memset.inline"(%3, %2) <{isVolatile = false, len = 6 : i64}> : (!llvm.ptr, i8) -> ()
    %4 = llvm.load %3 : !llvm.ptr -> i32
    llvm.return %4 : i32
  }
}

// -----
module {
  llvm.func @memset_double_use() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x !llvm.struct<"foo", (i32, f32)> {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(42 : i8) : i8
    %3 = llvm.mlir.constant(8 : i32) : i32
    "llvm.intr.memset"(%1, %2, %3) <{isVolatile = false}> : (!llvm.ptr, i8, i32) -> ()
    %4 = llvm.getelementptr %1[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"foo", (i32, f32)>
    %5 = llvm.load %4 : !llvm.ptr -> i32
    %6 = llvm.getelementptr %1[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"foo", (i32, f32)>
    %7 = llvm.load %6 : !llvm.ptr -> f32
    %8 = llvm.bitcast %7 : f32 to i32
    %9 = llvm.add %5, %8 : i32
    llvm.return %9 : i32
  }
}

// -----
module {
  llvm.func @memset_inline_double_use() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x !llvm.struct<"foo", (i32, f32)> {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(42 : i8) : i8
    "llvm.intr.memset.inline"(%1, %2) <{isVolatile = false, len = 8 : i64}> : (!llvm.ptr, i8) -> ()
    %3 = llvm.getelementptr %1[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"foo", (i32, f32)>
    %4 = llvm.load %3 : !llvm.ptr -> i32
    %5 = llvm.getelementptr %1[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"foo", (i32, f32)>
    %6 = llvm.load %5 : !llvm.ptr -> f32
    %7 = llvm.bitcast %6 : f32 to i32
    %8 = llvm.add %4, %7 : i32
    llvm.return %8 : i32
  }
}

// -----
module {
  llvm.func @memset_considers_alignment() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x !llvm.struct<"foo", (i8, i32, f32)> {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(42 : i8) : i8
    %3 = llvm.mlir.constant(8 : i32) : i32
    "llvm.intr.memset"(%1, %2, %3) <{isVolatile = false}> : (!llvm.ptr, i8, i32) -> ()
    %4 = llvm.getelementptr %1[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"foo", (i8, i32, f32)>
    %5 = llvm.load %4 : !llvm.ptr -> i32
    %6 = llvm.getelementptr %1[0, 2] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"foo", (i8, i32, f32)>
    %7 = llvm.load %6 : !llvm.ptr -> f32
    %8 = llvm.bitcast %7 : f32 to i32
    %9 = llvm.add %5, %8 : i32
    llvm.return %9 : i32
  }
}

// -----
module {
  llvm.func @memset_inline_considers_alignment() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x !llvm.struct<"foo", (i8, i32, f32)> {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(42 : i8) : i8
    "llvm.intr.memset.inline"(%1, %2) <{isVolatile = false, len = 8 : i64}> : (!llvm.ptr, i8) -> ()
    %3 = llvm.getelementptr %1[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"foo", (i8, i32, f32)>
    %4 = llvm.load %3 : !llvm.ptr -> i32
    %5 = llvm.getelementptr %1[0, 2] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"foo", (i8, i32, f32)>
    %6 = llvm.load %5 : !llvm.ptr -> f32
    %7 = llvm.bitcast %6 : f32 to i32
    %8 = llvm.add %4, %7 : i32
    llvm.return %8 : i32
  }
}

// -----
module {
  llvm.func @memset_considers_packing() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x !llvm.struct<"foo", packed (i8, i32, f32)> {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(42 : i8) : i8
    %3 = llvm.mlir.constant(8 : i32) : i32
    "llvm.intr.memset"(%1, %2, %3) <{isVolatile = false}> : (!llvm.ptr, i8, i32) -> ()
    %4 = llvm.getelementptr %1[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"foo", packed (i8, i32, f32)>
    %5 = llvm.load %4 : !llvm.ptr -> i32
    %6 = llvm.getelementptr %1[0, 2] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"foo", packed (i8, i32, f32)>
    %7 = llvm.load %6 : !llvm.ptr -> f32
    %8 = llvm.bitcast %7 : f32 to i32
    %9 = llvm.add %5, %8 : i32
    llvm.return %9 : i32
  }
}

// -----
module {
  llvm.func @memset_inline_considers_packing() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x !llvm.struct<"foo", packed (i8, i32, f32)> {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(42 : i8) : i8
    "llvm.intr.memset.inline"(%1, %2) <{isVolatile = false, len = 8 : i64}> : (!llvm.ptr, i8) -> ()
    %3 = llvm.getelementptr %1[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"foo", packed (i8, i32, f32)>
    %4 = llvm.load %3 : !llvm.ptr -> i32
    %5 = llvm.getelementptr %1[0, 2] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"foo", packed (i8, i32, f32)>
    %6 = llvm.load %5 : !llvm.ptr -> f32
    %7 = llvm.bitcast %6 : f32 to i32
    %8 = llvm.add %4, %7 : i32
    llvm.return %8 : i32
  }
}

// -----
module {
  llvm.func @memcpy_dest(%arg0: !llvm.ptr) -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x !llvm.array<10 x i32> : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(40 : i32) : i32
    "llvm.intr.memcpy"(%1, %arg0, %2) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    %3 = llvm.getelementptr %1[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<10 x i32>
    %4 = llvm.load %3 : !llvm.ptr -> i32
    llvm.return %4 : i32
  }
}

// -----
module {
  llvm.func @memcpy_src(%arg0: !llvm.ptr) -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x !llvm.array<4 x i32> : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(16 : i32) : i32
    "llvm.intr.memcpy"(%arg0, %1, %2) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    %3 = llvm.getelementptr %1[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<4 x i32>
    %4 = llvm.load %3 : !llvm.ptr -> i32
    llvm.return %4 : i32
  }
}

// -----
module {
  llvm.func @memcpy_double() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x !llvm.array<1 x i32> : (i32) -> !llvm.ptr
    %2 = llvm.alloca %0 x !llvm.array<1 x i32> : (i32) -> !llvm.ptr
    %3 = llvm.mlir.constant(4 : i32) : i32
    "llvm.intr.memcpy"(%1, %2, %3) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    %4 = llvm.getelementptr %1[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<1 x i32>
    %5 = llvm.load %4 : !llvm.ptr -> i32
    llvm.return %5 : i32
  }
}

// -----
module {
  llvm.func @memcpy_no_partial(%arg0: !llvm.ptr) -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x !llvm.array<10 x i32> : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(21 : i32) : i32
    "llvm.intr.memcpy"(%1, %arg0, %2) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    %3 = llvm.getelementptr %1[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<10 x i32>
    %4 = llvm.load %3 : !llvm.ptr -> i32
    llvm.return %4 : i32
  }
}

// -----
module {
  llvm.func @memcpy_no_volatile(%arg0: !llvm.ptr) -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x !llvm.array<10 x i32> : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(40 : i32) : i32
    "llvm.intr.memcpy"(%1, %arg0, %2) <{isVolatile = true}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    %3 = llvm.getelementptr %1[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<10 x i32>
    %4 = llvm.load %3 : !llvm.ptr -> i32
    llvm.return %4 : i32
  }
}

// -----
module {
  llvm.func @memmove_dest(%arg0: !llvm.ptr) -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x !llvm.array<10 x i32> : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(40 : i32) : i32
    "llvm.intr.memmove"(%1, %arg0, %2) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    %3 = llvm.getelementptr %1[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<10 x i32>
    %4 = llvm.load %3 : !llvm.ptr -> i32
    llvm.return %4 : i32
  }
}

// -----
module {
  llvm.func @memmove_src(%arg0: !llvm.ptr) -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x !llvm.array<4 x i32> : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(16 : i32) : i32
    "llvm.intr.memmove"(%arg0, %1, %2) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    %3 = llvm.getelementptr %1[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<4 x i32>
    %4 = llvm.load %3 : !llvm.ptr -> i32
    llvm.return %4 : i32
  }
}

// -----
module {
  llvm.func @memcpy_inline_dest(%arg0: !llvm.ptr) -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x !llvm.array<10 x i32> : (i32) -> !llvm.ptr
    "llvm.intr.memcpy.inline"(%1, %arg0) <{isVolatile = false, len = 40 : i32}> : (!llvm.ptr, !llvm.ptr) -> ()
    %2 = llvm.getelementptr %1[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<10 x i32>
    %3 = llvm.load %2 : !llvm.ptr -> i32
    llvm.return %3 : i32
  }
}

// -----
module {
  llvm.func @memcpy_inline_src(%arg0: !llvm.ptr) -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x !llvm.array<4 x i32> : (i32) -> !llvm.ptr
    "llvm.intr.memcpy.inline"(%arg0, %1) <{isVolatile = false, len = 16 : i32}> : (!llvm.ptr, !llvm.ptr) -> ()
    %2 = llvm.getelementptr %1[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<4 x i32>
    %3 = llvm.load %2 : !llvm.ptr -> i32
    llvm.return %3 : i32
  }
}

