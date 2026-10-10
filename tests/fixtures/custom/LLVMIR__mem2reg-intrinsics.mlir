module {
  llvm.func @basic_memset(%arg0: i8) -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(4 : i32) : i32
    "llvm.intr.memset"(%1, %arg0, %2) <{isVolatile = false}> : (!llvm.ptr, i8, i32) -> ()
    %3 = llvm.load %1 {alignment = 4 : i64} : !llvm.ptr -> i32
    llvm.return %3 : i32
  }
}

// -----
module {
  llvm.func @memset_float(%arg0: i8) -> f32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(4 : i32) : i32
    "llvm.intr.memset"(%1, %arg0, %2) <{isVolatile = false}> : (!llvm.ptr, i8, i32) -> ()
    %3 = llvm.load %1 {alignment = 4 : i64} : !llvm.ptr -> f32
    llvm.return %3 : f32
  }
}

// -----
module {
  llvm.func @basic_memset_inline(%arg0: i8) -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    "llvm.intr.memset.inline"(%1, %arg0) <{isVolatile = false, len = 4 : i32}> : (!llvm.ptr, i8) -> ()
    %2 = llvm.load %1 {alignment = 4 : i64} : !llvm.ptr -> i32
    llvm.return %2 : i32
  }
}

// -----
module {
  llvm.func @basic_memset_constant() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(42 : i8) : i8
    %3 = llvm.mlir.constant(4 : i32) : i32
    "llvm.intr.memset"(%1, %2, %3) <{isVolatile = false}> : (!llvm.ptr, i8, i32) -> ()
    %4 = llvm.load %1 {alignment = 4 : i64} : !llvm.ptr -> i32
    llvm.return %4 : i32
  }
}

// -----
module {
  llvm.func @memset_one_byte_constant() -> i8 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i8 : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(42 : i8) : i8
    "llvm.intr.memset"(%1, %2, %0) <{isVolatile = false}> : (!llvm.ptr, i8, i32) -> ()
    %3 = llvm.load %1 : !llvm.ptr -> i8
    llvm.return %3 : i8
  }
}

// -----
module {
  llvm.func @basic_memset_inline_constant() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(42 : i8) : i8
    "llvm.intr.memset.inline"(%1, %2) <{isVolatile = false, len = 4 : i64}> : (!llvm.ptr, i8) -> ()
    %3 = llvm.load %1 {alignment = 4 : i64} : !llvm.ptr -> i32
    llvm.return %3 : i32
  }
}

// -----
module {
  llvm.func @exotic_target_memset(%arg0: i8) -> i40 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i40 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(5 : i32) : i32
    "llvm.intr.memset"(%1, %arg0, %2) <{isVolatile = false}> : (!llvm.ptr, i8, i32) -> ()
    %3 = llvm.load %1 {alignment = 4 : i64} : !llvm.ptr -> i40
    llvm.return %3 : i40
  }
}

// -----
module {
  llvm.func @exotic_target_memset_inline(%arg0: i8) -> i40 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i40 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    "llvm.intr.memset.inline"(%1, %arg0) <{isVolatile = false, len = 5 : i64}> : (!llvm.ptr, i8) -> ()
    %2 = llvm.load %1 {alignment = 4 : i64} : !llvm.ptr -> i40
    llvm.return %2 : i40
  }
}

// -----
module {
  llvm.func @no_volatile_memset() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(42 : i8) : i8
    %3 = llvm.mlir.constant(4 : i32) : i32
    "llvm.intr.memset"(%1, %2, %3) <{isVolatile = true}> : (!llvm.ptr, i8, i32) -> ()
    %4 = llvm.load %1 {alignment = 4 : i64} : !llvm.ptr -> i32
    llvm.return %4 : i32
  }
}

// -----
module {
  llvm.func @no_volatile_memset_inline() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(42 : i8) : i8
    "llvm.intr.memset.inline"(%1, %2) <{isVolatile = true, len = 4 : i64}> : (!llvm.ptr, i8) -> ()
    %3 = llvm.load %1 {alignment = 4 : i64} : !llvm.ptr -> i32
    llvm.return %3 : i32
  }
}

// -----
module {
  llvm.func @no_partial_memset() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(42 : i8) : i8
    %3 = llvm.mlir.constant(2 : i32) : i32
    "llvm.intr.memset"(%1, %2, %3) <{isVolatile = false}> : (!llvm.ptr, i8, i32) -> ()
    %4 = llvm.load %1 {alignment = 4 : i64} : !llvm.ptr -> i32
    llvm.return %4 : i32
  }
}

// -----
module {
  llvm.func @no_partial_memset_inline() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(42 : i8) : i8
    "llvm.intr.memset.inline"(%1, %2) <{isVolatile = false, len = 2 : i64}> : (!llvm.ptr, i8) -> ()
    %3 = llvm.load %1 {alignment = 4 : i64} : !llvm.ptr -> i32
    llvm.return %3 : i32
  }
}

// -----
module {
  llvm.func @no_overflowing_memset() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(42 : i8) : i8
    %3 = llvm.mlir.constant(6 : i32) : i32
    "llvm.intr.memset"(%1, %2, %3) <{isVolatile = false}> : (!llvm.ptr, i8, i32) -> ()
    %4 = llvm.load %1 {alignment = 4 : i64} : !llvm.ptr -> i32
    llvm.return %4 : i32
  }
}

// -----
module {
  llvm.func @no_overflowing_memset_inline() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(42 : i8) : i8
    "llvm.intr.memset.inline"(%1, %2) <{isVolatile = false, len = 6 : i64}> : (!llvm.ptr, i8) -> ()
    %3 = llvm.load %1 {alignment = 4 : i64} : !llvm.ptr -> i32
    llvm.return %3 : i32
  }
}

// -----
module {
  llvm.func @only_byte_aligned_integers_memset() -> i10 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i10 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(42 : i8) : i8
    %3 = llvm.mlir.constant(2 : i32) : i32
    "llvm.intr.memset"(%1, %2, %3) <{isVolatile = false}> : (!llvm.ptr, i8, i32) -> ()
    %4 = llvm.load %1 {alignment = 4 : i64} : !llvm.ptr -> i10
    llvm.return %4 : i10
  }
}

// -----
module {
  llvm.func @only_byte_aligned_integers_memset_inline() -> i10 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i10 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(42 : i8) : i8
    "llvm.intr.memset.inline"(%1, %2) <{isVolatile = false, len = 2 : i64}> : (!llvm.ptr, i8) -> ()
    %3 = llvm.load %1 {alignment = 4 : i64} : !llvm.ptr -> i10
    llvm.return %3 : i10
  }
}

// -----
module {
  llvm.func @basic_memcpy(%arg0: !llvm.ptr) -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i32 : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(false) : i1
    %3 = llvm.mlir.constant(4 : i32) : i32
    "llvm.intr.memcpy"(%1, %arg0, %3) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    %4 = llvm.load %1 : !llvm.ptr -> i32
    llvm.return %4 : i32
  }
}

// -----
module {
  llvm.func @basic_memcpy_dest(%arg0: !llvm.ptr) -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(42 : i32) : i32
    %2 = llvm.mlir.constant(false) : i1
    %3 = llvm.mlir.constant(4 : i32) : i32
    %4 = llvm.alloca %0 x i32 : (i32) -> !llvm.ptr
    llvm.store %1, %4 : i32, !llvm.ptr
    "llvm.intr.memcpy"(%arg0, %4, %3) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    %5 = llvm.load %4 : !llvm.ptr -> i32
    llvm.return %5 : i32
  }
}

// -----
module {
  llvm.func @double_memcpy() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(42 : i32) : i32
    %2 = llvm.mlir.constant(false) : i1
    %3 = llvm.mlir.constant(4 : i32) : i32
    %4 = llvm.alloca %0 x i32 : (i32) -> !llvm.ptr
    %5 = llvm.alloca %0 x i32 : (i32) -> !llvm.ptr
    llvm.store %1, %4 : i32, !llvm.ptr
    "llvm.intr.memcpy"(%5, %4, %3) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    %6 = llvm.load %5 : !llvm.ptr -> i32
    llvm.return %6 : i32
  }
}

// -----
module {
  llvm.func @ignore_self_memcpy() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(false) : i1
    %2 = llvm.mlir.constant(4 : i32) : i32
    %3 = llvm.alloca %0 x i32 : (i32) -> !llvm.ptr
    "llvm.intr.memcpy"(%3, %3, %2) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    %4 = llvm.load %3 : !llvm.ptr -> i32
    llvm.return %4 : i32
  }
}

// -----
module {
  llvm.func @ignore_partial_memcpy(%arg0: !llvm.ptr) -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(false) : i1
    %2 = llvm.mlir.constant(2 : i32) : i32
    %3 = llvm.alloca %0 x i32 : (i32) -> !llvm.ptr
    "llvm.intr.memcpy"(%3, %arg0, %2) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    %4 = llvm.load %3 : !llvm.ptr -> i32
    llvm.return %4 : i32
  }
}

// -----
module {
  llvm.func @ignore_volatile_memcpy(%arg0: !llvm.ptr) -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(false) : i1
    %2 = llvm.mlir.constant(4 : i32) : i32
    %3 = llvm.alloca %0 x i32 : (i32) -> !llvm.ptr
    "llvm.intr.memcpy"(%3, %arg0, %2) <{isVolatile = true}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    %4 = llvm.load %3 : !llvm.ptr -> i32
    llvm.return %4 : i32
  }
}

// -----
module {
  llvm.func @basic_memmove(%arg0: !llvm.ptr) -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i32 : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(false) : i1
    %3 = llvm.mlir.constant(4 : i32) : i32
    "llvm.intr.memmove"(%1, %arg0, %3) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    %4 = llvm.load %1 : !llvm.ptr -> i32
    llvm.return %4 : i32
  }
}

// -----
module {
  llvm.func @basic_memcpy_inline(%arg0: !llvm.ptr) -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i32 : (i32) -> !llvm.ptr
    %2 = llvm.mlir.constant(false) : i1
    "llvm.intr.memcpy.inline"(%1, %arg0) <{isVolatile = false, len = 4 : i32}> : (!llvm.ptr, !llvm.ptr) -> ()
    %3 = llvm.load %1 : !llvm.ptr -> i32
    llvm.return %3 : i32
  }
}

