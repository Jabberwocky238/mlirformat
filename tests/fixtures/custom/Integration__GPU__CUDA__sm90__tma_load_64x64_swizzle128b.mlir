module @mymod {
  func.func private @printMemrefF32(memref<*xf32>)
  llvm.func @printf(!llvm.ptr, ...) -> i32
  func.func @main() {
    %c32768 = arith.constant 32768 : index
    %c-1_i32 = arith.constant -1 : i32
    %c10000000 = arith.constant 10000000 : index
    %c64 = arith.constant 64 : index
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    %c128 = arith.constant 128 : index
    %c8 = arith.constant 8 : index
    %alloc = memref.alloc() : memref<128x64xf16>
    %alloc_0 = memref.alloc() : memref<64x128xf16>
    %alloc_1 = memref.alloc() : memref<128x64xf32>
    %alloc_2 = memref.alloc() : memref<64x128xf32>
    scf.for %arg0 = %c0 to %c64 step %c1 {
      scf.for %arg1 = %c0 to %c128 step %c1 {
        %5 = arith.muli %arg0, %c128 : index
        %6 = arith.addi %5, %arg1 : index
        %7 = arith.divui %6, %c8 : index
        %8 = arith.index_cast %7 : index to i32
        %9 = arith.sitofp %8 : i32 to f16
        memref.store %9, %alloc_0[%arg0, %arg1] : memref<64x128xf16>
        %10 = arith.extf %9 : f16 to f32
        memref.store %10, %alloc_2[%arg0, %arg1] : memref<64x128xf32>
        %11 = arith.muli %arg1, %c64 : index
        %12 = arith.addi %11, %arg0 : index
        %13 = arith.divui %12, %c8 : index
        %14 = arith.index_cast %13 : index to i32
        %15 = arith.sitofp %14 : i32 to f16
        memref.store %15, %alloc[%arg1, %arg0] : memref<128x64xf16>
        %16 = arith.extf %15 : f16 to f32
        memref.store %16, %alloc_1[%arg1, %arg0] : memref<128x64xf32>
      }
    }
    %0 = gpu.wait async
    %memref, %asyncToken = gpu.alloc async [%0] () : memref<128x64xf16>
    %memref_3, %asyncToken_4 = gpu.alloc async [%0] () : memref<64x128xf16>
    %1 = gpu.memcpy async [%0] %memref, %alloc : memref<128x64xf16>, memref<128x64xf16>
    %2 = gpu.memcpy async [%0] %memref_3, %alloc_0 : memref<64x128xf16>, memref<64x128xf16>
    %cast = memref.cast %memref : memref<128x64xf16> to memref<*xf16>
    %cast_5 = memref.cast %memref_3 : memref<64x128xf16> to memref<*xf16>
    %3 = nvgpu.tma.create.descriptor %cast box[%c128, %c64] : memref<*xf16> -> <tensor = memref<128x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none>
    %4 = nvgpu.tma.create.descriptor %cast_5 box[%c64, %c64] : memref<*xf16> -> <tensor = memref<64x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none>
    %c32768_i32 = arith.constant 32768 : i32
    gpu.launch blocks(%arg0, %arg1, %arg2) in (%arg6 = %c1, %arg7 = %c1, %arg8 = %c1) threads(%arg3, %arg4, %arg5) in (%arg9 = %c128, %arg10 = %c1, %arg11 = %c1) dynamic_shared_memory_size %c32768_i32 {
      %block_dim_x = gpu.block_dim x
      %thread_id_x = gpu.thread_id x
      %c0_6 = arith.constant 0 : index
      %c32768_7 = arith.constant 32768 : index
      %c24576 = arith.constant 24576 : index
      %c16384 = arith.constant 16384 : index
      %5 = gpu.dynamic_shared_memory : memref<?xi8, #gpu.address_space<workgroup>>
      %view = memref.view %5[%c0][] : memref<?xi8, #gpu.address_space<workgroup>> to memref<128x64xf16, #gpu.address_space<workgroup>>
      %view_8 = memref.view %5[%c16384][] : memref<?xi8, #gpu.address_space<workgroup>> to memref<64x128xf16, #gpu.address_space<workgroup>>
      %view_9 = memref.view %5[%c16384][] : memref<?xi8, #gpu.address_space<workgroup>> to memref<64x64xf16, #gpu.address_space<workgroup>>
      %view_10 = memref.view %5[%c24576][] : memref<?xi8, #gpu.address_space<workgroup>> to memref<64x64xf16, #gpu.address_space<workgroup>>
      %6 = nvgpu.mbarrier.create -> <memorySpace = #gpu.address_space<workgroup>>
      nvgpu.mbarrier.init %6[%c0_6], %block_dim_x : <memorySpace = #gpu.address_space<workgroup>>
      %7 = arith.cmpi eq, %thread_id_x, %c0_6 : index
      scf.if %7 {
        gpu.printf "[GPU] TMA SIZE %d\0A", %c32768 : index
        nvgpu.tma.async.load %3[%c0_6, %c0_6], %6[%c0_6] to %view : <tensor = memref<128x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none>, <memorySpace = #gpu.address_space<workgroup>> -> memref<128x64xf16, #gpu.address_space<workgroup>>
        nvgpu.tma.async.load %4[%c0_6, %c0_6], %6[%c0_6] to %view_9 : <tensor = memref<64x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none>, <memorySpace = #gpu.address_space<workgroup>> -> memref<64x64xf16, #gpu.address_space<workgroup>>
        nvgpu.tma.async.load %4[%c64, %c0_6], %6[%c0_6] to %view_10 : <tensor = memref<64x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none>, <memorySpace = #gpu.address_space<workgroup>> -> memref<64x64xf16, #gpu.address_space<workgroup>>
        nvgpu.mbarrier.arrive.expect_tx %6[%c0_6], %c32768 : <memorySpace = #gpu.address_space<workgroup>>
      } else {
        nvgpu.mbarrier.arrive.expect_tx %6[%c0_6], %c0_6 : <memorySpace = #gpu.address_space<workgroup>>
      }
      %false = arith.constant false
      nvgpu.mbarrier.try_wait.parity %6[%c0_6], %false, %c10000000 : <memorySpace = #gpu.address_space<workgroup>>
      scf.if %7 {
        gpu.printf "===--- Matrix B ---=== %d \0A", %c-1_i32 : i32
        scf.for %arg12 = %c0_6 to %c64 step %c1 {
          scf.for %arg13 = %c0_6 to %c128 step %c1 {
            %8 = memref.load %view_8[%arg12, %arg13] : memref<64x128xf16, #gpu.address_space<workgroup>>
            %9 = arith.extf %8 : f16 to f32
            gpu.printf "%.0f,   ", %9 : f32
          }
          gpu.printf "%d\0A", %c-1_i32 : i32
        }
        gpu.printf "===----------------=== %d \0A", %c-1_i32 : i32
      }
      gpu.barrier
      gpu.terminator
    }
    return
  }
}

