module @gemm attributes {gpu.container_module} {
  gpu.module @kernel {
    gpu.func @block_load_store(%arg0: !llvm.ptr<1>, %arg1: !llvm.ptr<1>) kernel {
      %c32_i32 = arith.constant 32 : i32
      %c16_i32 = arith.constant 16 : i32
      %c32_i32_0 = arith.constant 32 : i32
      %c0_i32 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %0 = xevm.blockload2d %arg0, %c32_i32, %c16_i32, %c32_i32_0, %c0_i32, %c0_i32_1 <{elem_size_in_bits = 16 : i32, pack_register = false, tile_height = 16 : i32, tile_width = 16 : i32, transpose = false, v_blocks = 1 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32) -> vector<16xi16>
      %1 = vector.bitcast %0 : vector<16xi16> to vector<16xf16>
      %2 = vector.shape_cast %1 : vector<16xf16> to vector<8x1x2xf16>
      %3 = xevm.blockload2d %arg0, %c32_i32, %c16_i32, %c32_i32_0, %c0_i32, %c0_i32_1 <{elem_size_in_bits = 16 : i32, pack_register = true, tile_height = 16 : i32, tile_width = 16 : i32, transpose = false, v_blocks = 1 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32) -> vector<8xi32>
      %4 = vector.bitcast %3 : vector<8xi32> to vector<16xf16>
      %5 = vector.shape_cast %4 : vector<16xf16> to vector<8x1x2xf16>
      %thread_id_x = gpu.thread_id  x
      %6 = arith.index_cast %thread_id_x : index to i64
      %7 = llvm.trunc %6 : i64 to i32
      %8 = arith.sitofp %7 : i32 to f16
      %9 = vector.insert %8, %5 [0, 0, 1] : f16 into vector<8x1x2xf16>
      %10 = vector.extract_strided_slice %9 {offsets = [0, 0, 0], sizes = [4, 1, 2], strides = [1, 1, 1]} : vector<8x1x2xf16> to vector<4x1x2xf16>
      %11 = vector.shape_cast %10 : vector<4x1x2xf16> to vector<8xf16>
      %c8_i32 = arith.constant 8 : i32
      %c32_i32_2 = arith.constant 32 : i32
      %c32_i32_3 = arith.constant 32 : i32
      xevm.blockstore2d %arg1, %c32_i32_2, %c8_i32, %c32_i32_3, %c0_i32, %c0_i32_1, %11 <{elem_size_in_bits = 16 : i32, tile_height = 8 : i32, tile_width = 16 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32, vector<8xf16>)
      %12 = vector.extract_strided_slice %9 {offsets = [4, 0, 0], sizes = [4, 1, 2], strides = [1, 1, 1]} : vector<8x1x2xf16> to vector<4x1x2xf16>
      %13 = vector.shape_cast %12 : vector<4x1x2xf16> to vector<8xf16>
      %14 = arith.muli %c32_i32_3, %c8_i32 : i32
      %15 = llvm.getelementptr %arg1[%14] : (!llvm.ptr<1>, i32) -> !llvm.ptr<1>, i8
      xevm.blockstore2d %15, %c32_i32_2, %c8_i32, %c32_i32_3, %c0_i32, %c0_i32_1, %13 <{elem_size_in_bits = 16 : i32, tile_height = 8 : i32, tile_width = 16 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32, vector<8xf16>)
      gpu.return
    }
  }
  func.func @test(%arg0: memref<16x16xf16>) -> memref<16x16xf16> attributes {llvm.emit_c_interface} {
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %memref = gpu.alloc  () : memref<16x16xf16>
    gpu.memcpy  %memref, %arg0 : memref<16x16xf16>, memref<16x16xf16>
    %intptr = memref.extract_aligned_pointer_as_index %memref : memref<16x16xf16> -> index
    %0 = arith.index_cast %intptr : index to i64
    %1 = llvm.inttoptr %0 : i64 to !llvm.ptr
    %2 = llvm.addrspacecast %1 : !llvm.ptr to !llvm.ptr<1>
    %memref_0 = gpu.alloc  () : memref<16x16xf16>
    %intptr_1 = memref.extract_aligned_pointer_as_index %memref_0 : memref<16x16xf16> -> index
    %3 = arith.index_cast %intptr_1 : index to i64
    %4 = llvm.inttoptr %3 : i64 to !llvm.ptr
    %5 = llvm.addrspacecast %4 : !llvm.ptr to !llvm.ptr<1>
    gpu.launch_func  @kernel::@block_load_store blocks in (%c1, %c1, %c1) threads in (%c16, %c1, %c1)  args(%2 : !llvm.ptr<1>, %5 : !llvm.ptr<1>)
    gpu.dealloc  %memref : memref<16x16xf16>
    %alloc = memref.alloc() : memref<16x16xf16>
    gpu.memcpy  %alloc, %memref_0 : memref<16x16xf16>, memref<16x16xf16>
    gpu.dealloc  %memref_0 : memref<16x16xf16>
    return %alloc : memref<16x16xf16>
  }
  func.func @main() attributes {llvm.emit_c_interface} {
    %alloc = memref.alloc() : memref<16x16xf16>
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c16_0 = arith.constant 16 : index
    %cst = arith.constant 1.110160e+01 : f16
    scf.for %arg0 = %c0 to %c16 step %c1 {
      scf.for %arg1 = %c0 to %c16_0 step %c1 {
        memref.store %cst, %alloc[%arg0, %arg1] : memref<16x16xf16>
      }
    }
    %0 = call @test(%alloc) : (memref<16x16xf16>) -> memref<16x16xf16>
    %cast = memref.cast %0 : memref<16x16xf16> to memref<*xf16>
    %cast_1 = memref.cast %alloc : memref<16x16xf16> to memref<*xf16>
    call @printMemrefF16(%cast_1) : (memref<*xf16>) -> ()
    call @printMemrefF16(%cast) : (memref<*xf16>) -> ()
    memref.dealloc %alloc : memref<16x16xf16>
    memref.dealloc %0 : memref<16x16xf16>
    return
  }
  func.func private @printMemrefF16(memref<*xf16>) attributes {llvm.emit_c_interface}
}

