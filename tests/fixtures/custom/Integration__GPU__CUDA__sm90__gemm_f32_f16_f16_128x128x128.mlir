module {
  func.func private @printMemrefF32(memref<*xf32>)
  memref.global "private" @accShmem : memref<0xf32, 3> {alignment = 16 : i64}
  func.func @main() {
    %c65536_i32 = arith.constant 65536 : i32
    %c1 = arith.constant 1 : index
    %c4096 = arith.constant 4096 : index
    %c0 = arith.constant 0 : index
    %c64 = arith.constant 64 : index
    %c16 = arith.constant 16 : index
    %c8 = arith.constant 8 : index
    %c128 = arith.constant 128 : index
    %c32 = arith.constant 32 : index
    %c256 = arith.constant 256 : index
    %cst = arith.constant 0.000000e+00 : f32
    %alloc = memref.alloc() : memref<128x128xf16>
    %alloc_0 = memref.alloc() : memref<128x128xf16>
    %alloc_1 = memref.alloc() : memref<128x128xf32>
    %alloc_2 = memref.alloc() : memref<128x128xf32>
    scf.for %arg0 = %c0 to %c128 step %c1 {
      scf.for %arg1 = %c0 to %c128 step %c1 {
        %7 = arith.muli %arg0, %c128 : index
        %8 = arith.addi %7, %arg1 : index
        %9 = arith.divui %8, %c8 : index
        %10 = arith.remui %9, %c16 : index
        %11 = arith.index_cast %10 : index to i32
        %12 = arith.sitofp %11 : i32 to f16
        memref.store %12, %alloc_0[%arg0, %arg1] : memref<128x128xf16>
        %13 = arith.muli %arg1, %c64 : index
        %14 = arith.addi %13, %arg0 : index
        %15 = arith.divui %14, %c8 : index
        %16 = arith.remui %15, %c16 : index
        %17 = arith.index_cast %16 : index to i32
        %18 = arith.sitofp %17 : i32 to f16
        memref.store %18, %alloc[%arg1, %arg0] : memref<128x128xf16>
        memref.store %cst, %alloc_1[%arg0, %arg1] : memref<128x128xf32>
        memref.store %cst, %alloc_2[%arg0, %arg1] : memref<128x128xf32>
      }
    }
    %0 = gpu.wait async
    %memref, %asyncToken = gpu.alloc async [%0] () : memref<128x128xf16>
    %memref_3, %asyncToken_4 = gpu.alloc async [%0] () : memref<128x128xf16>
    %memref_5, %asyncToken_6 = gpu.alloc async [%0] () : memref<128x128xf32>
    %1 = gpu.memcpy async [%0] %memref, %alloc : memref<128x128xf16>, memref<128x128xf16>
    %2 = gpu.memcpy async [%0] %memref_3, %alloc_0 : memref<128x128xf16>, memref<128x128xf16>
    %cast = memref.cast %memref : memref<128x128xf16> to memref<*xf16>
    %cast_7 = memref.cast %memref_3 : memref<128x128xf16> to memref<*xf16>
    %3 = nvgpu.tma.create.descriptor %cast box[%c128, %c64] : memref<*xf16> -> <tensor = memref<128x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none>
    %4 = nvgpu.tma.create.descriptor %cast_7 box[%c64, %c64] : memref<*xf16> -> <tensor = memref<64x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none>
    gpu.launch blocks(%arg0, %arg1, %arg2) in (%arg6 = %c1, %arg7 = %c1, %arg8 = %c1) threads(%arg3, %arg4, %arg5) in (%arg9 = %c128, %arg10 = %c1, %arg11 = %c1) dynamic_shared_memory_size %c65536_i32 {
      %assume_align = memref.assume_alignment %memref_5, 16 : memref<128x128xf32>
      %c256_9 = arith.constant 256 : index
      %c10000000 = arith.constant 10000000 : index
      %c32768 = arith.constant 32768 : index
      %c320 = arith.constant 320 : index
      %c192 = arith.constant 192 : index
      %c6 = arith.constant 6 : index
      %c5 = arith.constant 5 : index
      %c4 = arith.constant 4 : index
      %c3 = arith.constant 3 : index
      %c7 = arith.constant 7 : index
      %c64_10 = arith.constant 64 : index
      %c1_11 = arith.constant 1 : index
      %c2 = arith.constant 2 : index
      %c0_12 = arith.constant 0 : index
      %c128_13 = arith.constant 128 : index
      %c32_14 = arith.constant 32 : index
      %c16_15 = arith.constant 16 : index
      %c4096_16 = arith.constant 4096 : index
      %c8_17 = arith.constant 8 : index
      %c32768_18 = arith.constant 32768 : index
      %c24576 = arith.constant 24576 : index
      %c16384 = arith.constant 16384 : index
      %c49152 = arith.constant 49152 : index
      %c57344 = arith.constant 57344 : index
      %c40960 = arith.constant 40960 : index
      %thread_id_x = gpu.thread_id x
      %7 = gpu.dynamic_shared_memory : memref<?xi8, #gpu.address_space<workgroup>>
      %view = memref.view %7[%c0_12][] : memref<?xi8, #gpu.address_space<workgroup>> to memref<2x128x64xf16, #gpu.address_space<workgroup>>
      %view_19 = memref.view %7[%c32768][] : memref<?xi8, #gpu.address_space<workgroup>> to memref<2x64x128xf16, #gpu.address_space<workgroup>>
      %8 = nvgpu.mbarrier.create -> <memorySpace = #gpu.address_space<workgroup>, num_barriers = 2>
      %9 = arith.cmpi eq, %thread_id_x, %c0_12 : index
      nvgpu.mbarrier.init %8[%c0_12], %c1_11 : <memorySpace = #gpu.address_space<workgroup>, num_barriers = 2>
      nvgpu.mbarrier.init %8[%c1_11], %c1_11 : <memorySpace = #gpu.address_space<workgroup>, num_barriers = 2>
      nvgpu.tma.prefetch.descriptor %3 : <tensor = memref<128x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none>
      nvgpu.tma.prefetch.descriptor %4 : <tensor = memref<64x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none>
      scf.if %9 {
        %c0_20 = arith.constant 0 : index
        %view_21 = memref.view %7[%c0_12][] : memref<?xi8, #gpu.address_space<workgroup>> to memref<128x64xf16, #gpu.address_space<workgroup>>
        %view_22 = memref.view %7[%c32768][] : memref<?xi8, #gpu.address_space<workgroup>> to memref<64x64xf16, #gpu.address_space<workgroup>>
        %view_23 = memref.view %7[%c40960][] : memref<?xi8, #gpu.address_space<workgroup>> to memref<64x64xf16, #gpu.address_space<workgroup>>
        nvgpu.mbarrier.arrive.expect_tx %8[%c0_20], %c32768_18 : <memorySpace = #gpu.address_space<workgroup>, num_barriers = 2>
        %15 = arith.muli %c0_20, %c64_10 : index
        nvgpu.tma.async.load %3[%15, %c0_12], %8[%c0_20] to %view_21 : <tensor = memref<128x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none>, <memorySpace = #gpu.address_space<workgroup>, num_barriers = 2> -> memref<128x64xf16, #gpu.address_space<workgroup>>
        nvgpu.tma.async.load %4[%c0_12, %15], %8[%c0_20] to %view_22 : <tensor = memref<64x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none>, <memorySpace = #gpu.address_space<workgroup>, num_barriers = 2> -> memref<64x64xf16, #gpu.address_space<workgroup>>
        nvgpu.tma.async.load %4[%c64_10, %15], %8[%c0_20] to %view_23 : <tensor = memref<64x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none>, <memorySpace = #gpu.address_space<workgroup>, num_barriers = 2> -> memref<64x64xf16, #gpu.address_space<workgroup>>
      }
      scf.if %9 {
        %c1_20 = arith.constant 1 : index
        %view_21 = memref.view %7[%c16384][] : memref<?xi8, #gpu.address_space<workgroup>> to memref<128x64xf16, #gpu.address_space<workgroup>>
        %view_22 = memref.view %7[%c49152][] : memref<?xi8, #gpu.address_space<workgroup>> to memref<64x64xf16, #gpu.address_space<workgroup>>
        %view_23 = memref.view %7[%c57344][] : memref<?xi8, #gpu.address_space<workgroup>> to memref<64x64xf16, #gpu.address_space<workgroup>>
        nvgpu.mbarrier.arrive.expect_tx %8[%c1_20], %c32768_18 : <memorySpace = #gpu.address_space<workgroup>, num_barriers = 2>
        %15 = arith.muli %c1_20, %c64_10 : index
        nvgpu.tma.async.load %3[%15, %c0_12], %8[%c1_20] to %view_21 : <tensor = memref<128x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none>, <memorySpace = #gpu.address_space<workgroup>, num_barriers = 2> -> memref<128x64xf16, #gpu.address_space<workgroup>>
        nvgpu.tma.async.load %4[%c0_12, %15], %8[%c1_20] to %view_22 : <tensor = memref<64x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none>, <memorySpace = #gpu.address_space<workgroup>, num_barriers = 2> -> memref<64x64xf16, #gpu.address_space<workgroup>>
        nvgpu.tma.async.load %4[%c64_10, %15], %8[%c1_20] to %view_23 : <tensor = memref<64x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none>, <memorySpace = #gpu.address_space<workgroup>, num_barriers = 2> -> memref<64x64xf16, #gpu.address_space<workgroup>>
      }
      %10 = nvgpu.warpgroup.mma.init.accumulator -> <fragmented = vector<128x128xf32>>
      %11 = scf.for %arg12 = %c0_12 to %c2 step %c1_11 iter_args(%arg13 = %10) -> (!nvgpu.warpgroup.accumulator<fragmented = vector<128x128xf32>>) {
        %c10000000_20 = arith.constant 10000000 : index
        %false = arith.constant false
        nvgpu.mbarrier.try_wait.parity %8[%arg12], %false, %c10000000_20 : <memorySpace = #gpu.address_space<workgroup>, num_barriers = 2>
        %subview = memref.subview %view[%arg12, 0, 0] [1, 128, 64] [1, 1, 1] : memref<2x128x64xf16, #gpu.address_space<workgroup>> to memref<128x64xf16, strided<[64, 1], offset: ?>, #gpu.address_space<workgroup>>
        %subview_21 = memref.subview %view_19[%arg12, 0, 0] [1, 64, 128] [1, 1, 1] : memref<2x64x128xf16, #gpu.address_space<workgroup>> to memref<64x128xf16, strided<[128, 1], offset: ?>, #gpu.address_space<workgroup>>
        %15 = nvgpu.warpgroup.generate.descriptor %subview, %3 : memref<128x64xf16, strided<[64, 1], offset: ?>, #gpu.address_space<workgroup>>, <tensor = memref<128x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none> -> <tensor = memref<128x64xf16, 3>>
        %16 = nvgpu.warpgroup.generate.descriptor %subview_21, %4 : memref<64x128xf16, strided<[128, 1], offset: ?>, #gpu.address_space<workgroup>>, <tensor = memref<64x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none> -> <tensor = memref<64x128xf16, 3>>
        %17 = nvgpu.warpgroup.mma %15, %16, %arg13 {transposeB} : <tensor = memref<128x64xf16, 3>>, <tensor = memref<64x128xf16, 3>>, <fragmented = vector<128x128xf32>> -> <fragmented = vector<128x128xf32>>
        scf.yield %17 : !nvgpu.warpgroup.accumulator<fragmented = vector<128x128xf32>>
      }
      nvvm.wgmma.wait.group.sync.aligned 0
      %12 = memref.get_global @accShmem : memref<0xf32, 3>
      %reinterpret_cast = memref.reinterpret_cast %12 to offset: [0], sizes: [128, 128], strides: [128, 1] : memref<0xf32, 3> to memref<128x128xf32, 3>
      nvgpu.warpgroup.mma.store %11, %reinterpret_cast : <fragmented = vector<128x128xf32>> to memref<128x128xf32, 3>
      %13 = arith.divui %thread_id_x, %c32_14 : index
      %14 = arith.remui %thread_id_x, %c32_14 : index
      scf.for %arg12 = %13 to %c128_13 step %c4 {
        %15 = arith.muli %14, %c4 : index
        %16 = vector.load %reinterpret_cast[%arg12, %15] : memref<128x128xf32, 3>, vector<4xf32>
        vector.store %16, %assume_align[%arg12, %15] : memref<128x128xf32>, vector<4xf32>
      }
      gpu.terminator
    }
    %5 = gpu.memcpy async [%0] %alloc_1, %memref_5 : memref<128x128xf32>, memref<128x128xf32>
    gpu.wait [%0]
    linalg.matmul ins(%alloc, %alloc_0 : memref<128x128xf16>, memref<128x128xf16>) outs(%alloc_2 : memref<128x128xf32>)
    %c1_i32 = arith.constant 1 : i32
    %c0_i32 = arith.constant 0 : i32
    %cst_8 = arith.constant 9.99999993E-9 : f32
    %6:2 = scf.for %arg0 = %c0 to %c128 step %c1 iter_args(%arg1 = %c0_i32, %arg2 = %c0_i32) -> (i32, i32) {
      %7:2 = scf.for %arg3 = %c0 to %c128 step %c1 iter_args(%arg4 = %arg1, %arg5 = %arg2) -> (i32, i32) {
        %8 = memref.load %alloc_2[%arg0, %arg3] : memref<128x128xf32>
        %9 = memref.load %alloc_1[%arg0, %arg3] : memref<128x128xf32>
        %10 = arith.subf %8, %9 : f32
        %11 = math.absf %10 : f32
        %12 = arith.cmpf ult, %cst_8, %11 : f32
        %13:2 = scf.if %12 -> (i32, i32) {
          %cst_9 = arith.constant dense<-1> : vector<2xi32>
          %14 = arith.index_cast %arg0 : index to i32
          %15 = arith.index_cast %arg3 : index to i32
          %16 = vector.insert %14, %cst_9 [0] : i32 into vector<2xi32>
          %17 = vector.insert %15, %16 [1] : i32 into vector<2xi32>
          %18 = arith.addi %arg4, %c1_i32 : i32
          scf.yield %18, %arg5 : i32, i32
        } else {
          %14 = arith.addi %arg5, %c1_i32 : i32
          scf.yield %arg4, %14 : i32, i32
        }
        scf.yield %13#0, %13#1 : i32, i32
      }
      scf.yield %7#0, %7#1 : i32, i32
    }
    vector.print str "Correct Results :"
    vector.print %6#1 : i32
    vector.print str "Incorrect Results :"
    vector.print %6#0 : i32
    return
  }
}

