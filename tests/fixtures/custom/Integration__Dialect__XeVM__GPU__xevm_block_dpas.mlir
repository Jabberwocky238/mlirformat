module @gemm attributes {gpu.container_module} {
  gpu.module @kernel {
    gpu.func @block_dpas(%arg0: !llvm.ptr<1>, %arg1: !llvm.ptr<1>, %arg2: !llvm.ptr<1>) kernel {
      %c32_i32 = arith.constant 32 : i32
      %c8_i32 = arith.constant 8 : i32
      %c32_i32_0 = arith.constant 32 : i32
      %c0_i32 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %0 = xevm.blockload2d %arg0, %c32_i32, %c8_i32, %c32_i32_0, %c0_i32, %c0_i32_1 <{elem_size_in_bits = 16 : i32, pack_register = false, tile_height = 8 : i32, tile_width = 16 : i32, transpose = false, v_blocks = 1 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32) -> vector<8xi16>
      %c32_i32_2 = arith.constant 32 : i32
      %c16_i32 = arith.constant 16 : i32
      %c32_i32_3 = arith.constant 32 : i32
      %1 = xevm.blockload2d %arg1, %c32_i32_2, %c16_i32, %c32_i32_3, %c0_i32, %c0_i32_1 <{elem_size_in_bits = 16 : i32, pack_register = false, tile_height = 16 : i32, tile_width = 16 : i32, transpose = false, v_blocks = 1 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32) -> vector<16xi16>
      %2 = vector.bitcast %1 : vector<16xi16> to vector<8xi32>
      %c64_i32 = arith.constant 64 : i32
      %c8_i32_4 = arith.constant 8 : i32
      %c64_i32_5 = arith.constant 64 : i32
      %3 = xevm.blockload2d %arg2, %c64_i32, %c8_i32_4, %c64_i32_5, %c0_i32, %c0_i32_1 <{elem_size_in_bits = 32 : i32, pack_register = false, tile_height = 8 : i32, tile_width = 16 : i32, transpose = false, v_blocks = 1 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32) -> vector<8xi32>
      %4 = vector.bitcast %3 : vector<8xi32> to vector<8xf32>
      %5 = xevm.mma %0, %2, %4 {shape = <m = 8, n = 16, k = 16>, types = <d = f32, a = f16, b = f16, c = f32>} : (vector<8xi16>, vector<8xi32>, vector<8xf32>) -> vector<8xf32>
      %6 = vector.bitcast %5 : vector<8xf32> to vector<8xi32>
      xevm.blockstore2d %arg2, %c64_i32, %c8_i32_4, %c64_i32_5, %c0_i32, %c0_i32_1, %6 <{elem_size_in_bits = 32 : i32, tile_height = 8 : i32, tile_width = 16 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32, vector<8xi32>)
      gpu.return
    }
  }
  func.func @test(%arg0: memref<8x16xf16>, %arg1: memref<16x16xf16>, %arg2: memref<8x16xf32>) -> memref<8x16xf32> attributes {llvm.emit_c_interface} {
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %memref = gpu.alloc  () : memref<8x16xf16>
    gpu.memcpy  %memref, %arg0 : memref<8x16xf16>, memref<8x16xf16>
    %intptr = memref.extract_aligned_pointer_as_index %memref : memref<8x16xf16> -> index
    %0 = arith.index_cast %intptr : index to i64
    %1 = llvm.inttoptr %0 : i64 to !llvm.ptr
    %2 = llvm.addrspacecast %1 : !llvm.ptr to !llvm.ptr<1>
    %memref_0 = gpu.alloc  () : memref<16x16xf16>
    gpu.memcpy  %memref_0, %arg1 : memref<16x16xf16>, memref<16x16xf16>
    %intptr_1 = memref.extract_aligned_pointer_as_index %memref_0 : memref<16x16xf16> -> index
    %3 = arith.index_cast %intptr_1 : index to i64
    %4 = llvm.inttoptr %3 : i64 to !llvm.ptr
    %5 = llvm.addrspacecast %4 : !llvm.ptr to !llvm.ptr<1>
    %memref_2 = gpu.alloc  () : memref<8x16xf32>
    gpu.memcpy  %memref_2, %arg2 : memref<8x16xf32>, memref<8x16xf32>
    %intptr_3 = memref.extract_aligned_pointer_as_index %memref_2 : memref<8x16xf32> -> index
    %6 = arith.index_cast %intptr_3 : index to i64
    %7 = llvm.inttoptr %6 : i64 to !llvm.ptr
    %8 = llvm.addrspacecast %7 : !llvm.ptr to !llvm.ptr<1>
    gpu.launch_func  @kernel::@block_dpas blocks in (%c1, %c1, %c1) threads in (%c16, %c1, %c1)  args(%2 : !llvm.ptr<1>, %5 : !llvm.ptr<1>, %8 : !llvm.ptr<1>)
    gpu.dealloc  %memref : memref<8x16xf16>
    gpu.dealloc  %memref_0 : memref<16x16xf16>
    %alloc = memref.alloc() : memref<8x16xf32>
    gpu.memcpy  %alloc, %memref_2 : memref<8x16xf32>, memref<8x16xf32>
    gpu.dealloc  %memref_2 : memref<8x16xf32>
    return %alloc : memref<8x16xf32>
  }
  func.func @main() attributes {llvm.emit_c_interface} {
    %alloc = memref.alloc() : memref<8x16xf16>
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    %c16 = arith.constant 16 : index
    scf.for %arg0 = %c0 to %c8 step %c1 {
      scf.for %arg1 = %c0 to %c16 step %c1 {
        %1 = arith.index_cast %arg0 : index to i32
        %2 = arith.sitofp %1 : i32 to f16
        memref.store %2, %alloc[%arg0, %arg1] : memref<8x16xf16>
      }
    }
    %alloc_0 = memref.alloc() : memref<16x16xf16>
    scf.for %arg0 = %c0 to %c16 step %c1 {
      scf.for %arg1 = %c0 to %c16 step %c1 {
        %1 = arith.index_cast %arg1 : index to i32
        %2 = arith.sitofp %1 : i32 to f16
        memref.store %2, %alloc_0[%arg0, %arg1] : memref<16x16xf16>
      }
    }
    %alloc_1 = memref.alloc() : memref<8x16xf32>
    %cst = arith.constant 0.000000e+00 : f32
    scf.for %arg0 = %c0 to %c8 step %c1 {
      scf.for %arg1 = %c0 to %c16 step %c1 {
        memref.store %cst, %alloc_1[%arg0, %arg1] : memref<8x16xf32>
      }
    }
    %0 = call @test(%alloc, %alloc_0, %alloc_1) : (memref<8x16xf16>, memref<16x16xf16>, memref<8x16xf32>) -> memref<8x16xf32>
    %cast = memref.cast %0 : memref<8x16xf32> to memref<*xf32>
    %cast_2 = memref.cast %alloc : memref<8x16xf16> to memref<*xf16>
    call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
    memref.dealloc %alloc : memref<8x16xf16>
    memref.dealloc %alloc_0 : memref<16x16xf16>
    memref.dealloc %alloc_1 : memref<8x16xf32>
    memref.dealloc %0 : memref<8x16xf32>
    return
  }
  func.func private @printMemrefF16(memref<*xf16>) attributes {llvm.emit_c_interface}
  func.func private @printMemrefF32(memref<*xf32>) attributes {llvm.emit_c_interface}
}

