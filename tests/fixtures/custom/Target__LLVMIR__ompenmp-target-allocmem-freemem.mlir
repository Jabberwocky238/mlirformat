module {
  llvm.func @test_alloc_free_i64() {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = omp.target_allocmem %0 : i32, i64
    omp.target_freemem %0, %1 : i32, i64
    llvm.return
  }
  llvm.func @test_alloc_free_vector_1d_f32() {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = omp.target_allocmem %0 : i32, vector<16xf32>
    omp.target_freemem %0, %1 : i32, i64
    llvm.return
  }
  llvm.func @test_alloc_free_vector_2d_f32() {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = omp.target_allocmem %0 : i32, vector<16x16xf32>
    omp.target_freemem %0, %1 : i32, i64
    llvm.return
  }
}

