module @gemm attributes {gpu.container_module} {
  gpu.module @kernel {
    gpu.func @block_load_store(%arg0: !llvm.ptr<1>, %arg1: !llvm.ptr<1>) kernel {
      %c32_i32 = arith.constant 32 : i32
      %c16_i32 = arith.constant 16 : i32
      %c32_i32_0 = arith.constant 32 : i32
      %c0_i32 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %0 = xevm.blockload2d %arg0, %c32_i32, %c16_i32, %c32_i32_0, %c0_i32, %c0_i32_1 <{elem_size_in_bits = 32 : i32, pack_register = false, tile_height = 16 : i32, tile_width = 8 : i32, transpose = true, v_blocks = 1 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32) -> vector<8xi32>
      %1 = vector.bitcast %0 : vector<8xi32> to vector<8xf32>
      %c0_i32_2 = arith.constant 0 : i32
      %thread_id_x = gpu.thread_id  x
      %2 = arith.index_cast %thread_id_x : index to i64
      %3 = llvm.trunc %2 : i64 to i32
      %4 = arith.sitofp %3 : i32 to f32
      %5 = vector.insert %4, %1 [7] : f32 into vector<8xf32>
      %6 = vector.bitcast %5 : vector<8xf32> to vector<8xi32>
      %c8_i32 = arith.constant 8 : i32
      %c64_i32 = arith.constant 64 : i32
      %c64_i32_3 = arith.constant 64 : i32
      xevm.blockstore2d %arg1, %c64_i32, %c8_i32, %c64_i32_3, %c0_i32, %c0_i32_1, %0 <{elem_size_in_bits = 32 : i32, tile_height = 8 : i32, tile_width = 16 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32, vector<8xi32>)
      gpu.return
    }
  }
  func.func @test(%arg0: memref<16x8xf32>) -> memref<8x16xf32> attributes {llvm.emit_c_interface} {
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %memref = gpu.alloc  () : memref<16x8xf32>
    gpu.memcpy  %memref, %arg0 : memref<16x8xf32>, memref<16x8xf32>
    %intptr = memref.extract_aligned_pointer_as_index %memref : memref<16x8xf32> -> index
    %0 = arith.index_cast %intptr : index to i64
    %1 = llvm.inttoptr %0 : i64 to !llvm.ptr
    %2 = llvm.addrspacecast %1 : !llvm.ptr to !llvm.ptr<1>
    %memref_0 = gpu.alloc  () : memref<8x16xf32>
    %intptr_1 = memref.extract_aligned_pointer_as_index %memref_0 : memref<8x16xf32> -> index
    %3 = arith.index_cast %intptr_1 : index to i64
    %4 = llvm.inttoptr %3 : i64 to !llvm.ptr
    %5 = llvm.addrspacecast %4 : !llvm.ptr to !llvm.ptr<1>
    gpu.launch_func  @kernel::@block_load_store blocks in (%c1, %c1, %c1) threads in (%c16, %c1, %c1)  args(%2 : !llvm.ptr<1>, %5 : !llvm.ptr<1>)
    gpu.dealloc  %memref : memref<16x8xf32>
    %alloc = memref.alloc() : memref<8x16xf32>
    gpu.memcpy  %alloc, %memref_0 : memref<8x16xf32>, memref<8x16xf32>
    gpu.dealloc  %memref_0 : memref<8x16xf32>
    return %alloc : memref<8x16xf32>
  }
  func.func @main() attributes {llvm.emit_c_interface} {
    %alloc = memref.alloc() : memref<16x8xf32>
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    %c16 = arith.constant 16 : index
    %cst = arith.constant 1.110940e+01 : f16
    scf.for %arg0 = %c0 to %c16 step %c1 {
      scf.for %arg1 = %c0 to %c8 step %c1 {
        %cst_1 = arith.constant 1.000000e+01 : f32
        %1 = arith.index_cast %arg1 : index to i64
        %2 = llvm.trunc %1 : i64 to i32
        %3 = arith.sitofp %2 : i32 to f32
        %4 = arith.divf %3, %cst_1 : f32
        %5 = arith.index_cast %arg0 : index to i64
        %6 = llvm.trunc %5 : i64 to i32
        %7 = arith.sitofp %6 : i32 to f32
        %8 = arith.addf %7, %4 : f32
        memref.store %8, %alloc[%arg0, %arg1] : memref<16x8xf32>
      }
    }
    %0 = call @test(%alloc) : (memref<16x8xf32>) -> memref<8x16xf32>
    %cast = memref.cast %alloc : memref<16x8xf32> to memref<*xf32>
    %cast_0 = memref.cast %0 : memref<8x16xf32> to memref<*xf32>
    call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
    call @printMemrefF32(%cast_0) : (memref<*xf32>) -> ()
    memref.dealloc %alloc : memref<16x8xf32>
    memref.dealloc %0 : memref<8x16xf32>
    return
  }
  func.func private @printMemrefF32(memref<*xf32>) attributes {llvm.emit_c_interface}
}

