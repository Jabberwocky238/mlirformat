module {
}

// -----
module {
  llvm.func @test_allocate_default(%arg0: !llvm.ptr) {
    omp.allocate_dir(%arg0 : !llvm.ptr)
    omp.allocate_free(%arg0 : !llvm.ptr)
    llvm.return
  }
}

// -----
module {
  llvm.func @test_allocate_align_only(%arg0: !llvm.ptr) {
    omp.allocate_dir(%arg0 : !llvm.ptr) align(16)
    omp.allocate_free(%arg0 : !llvm.ptr)
    llvm.return
  }
}

// -----
module {
  llvm.func @test_allocate_allocator_only(%arg0: !llvm.ptr) {
    %0 = llvm.mlir.constant(1 : i32) : i32
    omp.allocate_dir(%arg0 : !llvm.ptr) allocator(%0 : i32)
    omp.allocate_free(%arg0 : !llvm.ptr) allocator(%0 : i32)
    llvm.return
  }
}

// -----
module {
  llvm.func @test_allocate_align_and_allocator(%arg0: !llvm.ptr) {
    %0 = llvm.mlir.constant(6 : i32) : i32
    omp.allocate_dir(%arg0 : !llvm.ptr) align(64) allocator(%0 : i32)
    omp.allocate_free(%arg0 : !llvm.ptr) allocator(%0 : i32)
    llvm.return
  }
}

// -----
module {
  llvm.func @test_allocate_multiple_vars(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr) {
    %0 = llvm.mlir.constant(3 : i32) : i32
    omp.allocate_dir(%arg0, %arg1, %arg2 : !llvm.ptr, !llvm.ptr, !llvm.ptr) align(32) allocator(%0 : i32)
    omp.allocate_free(%arg0, %arg1, %arg2 : !llvm.ptr, !llvm.ptr, !llvm.ptr) allocator(%0 : i32)
    llvm.return
  }
}

// -----
module {
  llvm.mlir.global internal @arr_global() {addr_space = 0 : i32} : !llvm.array<10 x i32> {
    %0 = llvm.mlir.zero : !llvm.array<10 x i32>
    llvm.return %0 : !llvm.array<10 x i32>
  }
  llvm.func @test_allocate_array_global() {
    %0 = llvm.mlir.addressof @arr_global : !llvm.ptr
    %1 = llvm.mlir.constant(6 : i32) : i32
    omp.allocate_dir(%0 : !llvm.ptr) align(64) allocator(%1 : i32)
    omp.allocate_free(%0 : !llvm.ptr) allocator(%1 : i32)
    llvm.return
  }
}

