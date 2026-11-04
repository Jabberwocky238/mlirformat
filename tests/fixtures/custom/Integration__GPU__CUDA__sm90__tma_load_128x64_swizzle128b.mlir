module @mymod {
  func.func private @printMemrefF32(memref<*xf32>)
  memref.global "private" @bufferLhsGlobal : memref<128x64xf16, 3>
  llvm.func @printf(!llvm.ptr, ...) -> i32
  func.func @main() {
    %c8192 = arith.constant 8192 : index
    %c-1_i32 = arith.constant -1 : i32
    %c10000000 = arith.constant 10000000 : index
    %c64 = arith.constant 64 : index
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %c128 = arith.constant 128 : index
    %c8 = arith.constant 8 : index
    %alloc = memref.alloc() : memref<128x64xf16>
    %alloc_0 = memref.alloc() : memref<128x64xf32>
    scf.for %arg0 = %c0 to %c128 step %c1 {
      scf.for %arg1 = %c0 to %c64 step %c1 {
        %3 = arith.muli %arg0, %c64 : index
        %4 = arith.addi %3, %arg1 : index
        %5 = arith.divui %4, %c8 : index
        %6 = arith.index_cast %5 : index to i32
        %7 = arith.sitofp %6 : i32 to f16
        memref.store %7, %alloc[%arg0, %arg1] : memref<128x64xf16>
        %8 = arith.extf %7 : f16 to f32
        memref.store %8, %alloc_0[%arg0, %arg1] : memref<128x64xf32>
      }
    }
    %cast = memref.cast %alloc_0 : memref<128x64xf32> to memref<*xf32>
    call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
    %0 = gpu.wait async
    %memref, %asyncToken = gpu.alloc async [%0] () : memref<128x64xf16>
    %1 = gpu.memcpy async [%0] %memref, %alloc : memref<128x64xf16>, memref<128x64xf16>
    %cast_1 = memref.cast %memref : memref<128x64xf16> to memref<*xf16>
    %2 = nvgpu.tma.create.descriptor %cast_1 box[%c128, %c64] : memref<*xf16> -> <tensor = memref<128x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none>
    gpu.launch blocks(%arg0, %arg1, %arg2) in (%arg6 = %c1, %arg7 = %c1, %arg8 = %c1) threads(%arg3, %arg4, %arg5) in (%arg9 = %c128, %arg10 = %c1, %arg11 = %c1) {
      %block_dim_x = gpu.block_dim  x
      %thread_id_x = gpu.thread_id  x
      %3 = memref.get_global @bufferLhsGlobal : memref<128x64xf16, 3>
      %4 = nvgpu.mbarrier.create -> <memorySpace = #gpu.address_space<workgroup>>
      nvgpu.mbarrier.init %4[%c0], %block_dim_x : <memorySpace = #gpu.address_space<workgroup>>
      %5 = arith.cmpi eq, %thread_id_x, %c0 : index
      scf.if %5 {
        gpu.printf "[GPU] TMA SIZE %d\0A", %c8192 : index
        nvgpu.tma.async.load %2[%c0, %c0], %4[%c0] to %3 : <tensor = memref<128x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none>, <memorySpace = #gpu.address_space<workgroup>> -> memref<128x64xf16, 3>
        nvgpu.mbarrier.arrive.expect_tx %4[%c0], %c8192 : <memorySpace = #gpu.address_space<workgroup>>
      } else {
        nvgpu.mbarrier.arrive.expect_tx %4[%c0], %c0 : <memorySpace = #gpu.address_space<workgroup>>
      }
      %false = arith.constant false
      nvgpu.mbarrier.try_wait.parity %4[%c0], %false, %c10000000 : <memorySpace = #gpu.address_space<workgroup>>
      scf.if %5 {
        gpu.printf "===--- Matrix A ---=== %d \0A", %c-1_i32 : i32
        scf.for %arg12 = %c0 to %c128 step %c1 {
          scf.for %arg13 = %c0 to %c64 step %c1 {
            %6 = memref.load %3[%arg12, %arg13] : memref<128x64xf16, 3>
            %7 = arith.extf %6 : f16 to f32
            gpu.printf "%.0f,   ", %7 : f32
          }
          gpu.printf "%d\0A", %c-1_i32 : i32
        }
        gpu.printf "===----------------=== %d \0A", %c-1_i32 : i32
      }
      gpu.terminator
    }
    return
  }
}

