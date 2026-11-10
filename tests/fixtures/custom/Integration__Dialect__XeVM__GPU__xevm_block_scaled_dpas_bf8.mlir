module @gemm attributes {gpu.container_module} {
  gpu.module @kernel {
    gpu.func @block_scaled_dpas_bf8(%arg0: !llvm.ptr<1>, %arg1: !llvm.ptr<1>, %arg2: !llvm.ptr<1>) kernel {
      %c64_i32 = arith.constant 64 : i32
      %c8_i32 = arith.constant 8 : i32
      %c64_i32_0 = arith.constant 64 : i32
      %c0_i32 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %0 = xevm.blockload2d %arg0, %c64_i32, %c8_i32, %c64_i32_0, %c0_i32, %c0_i32_1 <{elem_size_in_bits = 32 : i32, pack_register = false, tile_height = 8 : i32, tile_width = 16 : i32, transpose = false, v_blocks = 1 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32) -> vector<8xi32>
      %1 = vector.bitcast %0 : vector<8xi32> to vector<16xf16>
      %2 = xevm.truncf %1 {src_etype = f16, dst_etype = bf8} : (vector<16xf16>) -> vector<16xi8>
      %3 = vector.bitcast %2 : vector<16xi8> to vector<8xi16>
      %c16_i32 = arith.constant 16 : i32
      %c32_i32 = arith.constant 32 : i32
      %c16_i32_2 = arith.constant 16 : i32
      %4 = xevm.blockload2d %arg1, %c16_i32, %c32_i32, %c16_i32_2, %c0_i32, %c0_i32_1 <{elem_size_in_bits = 8 : i32, pack_register = true, tile_height = 32 : i32, tile_width = 16 : i32, transpose = false, v_blocks = 1 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32) -> vector<8xi32>
      %cst = arith.constant 1.000000e+00 : f8E8M0FNU
      %cst_3 = arith.constant 1.000000e+00 : f8E8M0FNU
      %5 = arith.bitcast %cst : f8E8M0FNU to i8
      %6 = arith.bitcast %cst_3 : f8E8M0FNU to i8
      %cst_4 = arith.constant dense<0.000000e+00> : vector<8xf32>
      %7 = xevm.mma_mx %3, %4, %5, %6, %cst_4 {shape = <m = 8, n = 16, k = 32>, types = <d = f32, a = bf8, b = bf8, c = f32>} : (vector<8xi16>, vector<8xi32>, i8, i8, vector<8xf32>) -> vector<8xf32>
      %8 = vector.bitcast %7 : vector<8xf32> to vector<8xi32>
      %c64_i32_5 = arith.constant 64 : i32
      %c8_i32_6 = arith.constant 8 : i32
      %c64_i32_7 = arith.constant 64 : i32
      xevm.blockstore2d %arg2, %c64_i32_5, %c8_i32_6, %c64_i32_7, %c0_i32, %c0_i32_1, %8 <{elem_size_in_bits = 32 : i32, tile_height = 8 : i32, tile_width = 16 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32, vector<8xi32>)
      gpu.return
    }
  }
  func.func @test(%arg0: memref<8x32xf16>, %arg1: memref<32x16xf8E5M2>, %arg2: memref<8x16xf32>) -> memref<8x16xf32> attributes {llvm.emit_c_interface} {
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %memref = gpu.alloc  () : memref<8x32xf16>
    gpu.memcpy  %memref, %arg0 : memref<8x32xf16>, memref<8x32xf16>
    %intptr = memref.extract_aligned_pointer_as_index %memref : memref<8x32xf16> -> index
    %0 = arith.index_cast %intptr : index to i64
    %1 = llvm.inttoptr %0 : i64 to !llvm.ptr
    %2 = llvm.addrspacecast %1 : !llvm.ptr to !llvm.ptr<1>
    %memref_0 = gpu.alloc  () : memref<32x16xf8E5M2>
    gpu.memcpy  %memref_0, %arg1 : memref<32x16xf8E5M2>, memref<32x16xf8E5M2>
    %intptr_1 = memref.extract_aligned_pointer_as_index %memref_0 : memref<32x16xf8E5M2> -> index
    %3 = arith.index_cast %intptr_1 : index to i64
    %4 = llvm.inttoptr %3 : i64 to !llvm.ptr
    %5 = llvm.addrspacecast %4 : !llvm.ptr to !llvm.ptr<1>
    %memref_2 = gpu.alloc  () : memref<8x16xf32>
    gpu.memcpy  %memref_2, %arg2 : memref<8x16xf32>, memref<8x16xf32>
    %intptr_3 = memref.extract_aligned_pointer_as_index %memref_2 : memref<8x16xf32> -> index
    %6 = arith.index_cast %intptr_3 : index to i64
    %7 = llvm.inttoptr %6 : i64 to !llvm.ptr
    %8 = llvm.addrspacecast %7 : !llvm.ptr to !llvm.ptr<1>
    gpu.launch_func  @kernel::@block_scaled_dpas_bf8 blocks in (%c1, %c1, %c1) threads in (%c16, %c1, %c1)  args(%2 : !llvm.ptr<1>, %5 : !llvm.ptr<1>, %8 : !llvm.ptr<1>)
    gpu.dealloc  %memref : memref<8x32xf16>
    gpu.dealloc  %memref_0 : memref<32x16xf8E5M2>
    %alloc = memref.alloc() : memref<8x16xf32>
    gpu.memcpy  %alloc, %memref_2 : memref<8x16xf32>, memref<8x16xf32>
    gpu.dealloc  %memref_2 : memref<8x16xf32>
    return %alloc : memref<8x16xf32>
  }
  func.func @main() attributes {llvm.emit_c_interface} {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    %c16 = arith.constant 16 : index
    %c32 = arith.constant 32 : index
    %cst = arith.constant 1.000000e+00 : f16
    %cst_0 = arith.constant 1.000000e+00 : f8E5M2
    %cst_1 = arith.constant 0.000000e+00 : f32
    %alloc = memref.alloc() : memref<8x32xf16>
    scf.for %arg0 = %c0 to %c8 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c1 {
        memref.store %cst, %alloc[%arg0, %arg1] : memref<8x32xf16>
      }
    }
    %alloc_2 = memref.alloc() : memref<32x16xf8E5M2>
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c16 step %c1 {
        memref.store %cst_0, %alloc_2[%arg0, %arg1] : memref<32x16xf8E5M2>
      }
    }
    %alloc_3 = memref.alloc() : memref<8x16xf32>
    scf.for %arg0 = %c0 to %c8 step %c1 {
      scf.for %arg1 = %c0 to %c16 step %c1 {
        memref.store %cst_1, %alloc_3[%arg0, %arg1] : memref<8x16xf32>
      }
    }
    %0 = call @test(%alloc, %alloc_2, %alloc_3) : (memref<8x32xf16>, memref<32x16xf8E5M2>, memref<8x16xf32>) -> memref<8x16xf32>
    %cast = memref.cast %0 : memref<8x16xf32> to memref<*xf32>
    call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
    memref.dealloc %alloc : memref<8x32xf16>
    memref.dealloc %alloc_2 : memref<32x16xf8E5M2>
    memref.dealloc %alloc_3 : memref<8x16xf32>
    memref.dealloc %0 : memref<8x16xf32>
    return
  }
  func.func private @printMemrefF32(memref<*xf32>) attributes {llvm.emit_c_interface}
}

