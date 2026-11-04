module {
  func.func @main() {
    %c10000000 = arith.constant 10000000 : index
    %false = arith.constant false
    %c32768 = arith.constant 32768 : index
    %c31_i32 = arith.constant 31 : i32
    %c-1_i32 = arith.constant -1 : i32
    %c5_i32 = arith.constant 5 : i32
    %c0_i32 = arith.constant 0 : i32
    %c0 = arith.constant 0 : index
    %c8 = arith.constant 8 : index
    %c64 = arith.constant 64 : index
    %c2 = arith.constant 2 : index
    %c32768_i32 = arith.constant 32768 : i32
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.mlir.constant(128 : i64) : i64
    %2 = llvm.mlir.constant(0 : i64) : i64
    %cst = arith.constant 0.000000e+00 : f16
    %cst_0 = arith.constant 1.123050e+00 : f16
    %alloc = memref.alloc() : memref<128x128xf16>
    %alloc_1 = memref.alloc() : memref<128x128xf16>
    scf.for %arg0 = %c0 to %c128 step %c1 {
      scf.for %arg1 = %c0 to %c64 step %c1 {
        %9 = arith.index_cast %arg0 : index to i32
        %10 = arith.index_cast %arg1 : index to i32
        %11 = arith.sitofp %9 : i32 to f16
        %12 = arith.sitofp %10 : i32 to f16
        %13 = arith.addf %11, %cst_0 : f16
        %cst_4 = arith.constant 3.119140e+00 : f16
        %14 = arith.mulf %13, %cst_4 : f16
        %15 = arith.addf %14, %13 : f16
        %cst_5 = arith.constant 1.779790e-01 : f16
        %16 = arith.divf %cst_5, %15 : f16
        memref.store %16, %alloc[%arg0, %arg1] : memref<128x128xf16>
        memref.store %cst, %alloc_1[%arg0, %arg1] : memref<128x128xf16>
      }
    }
    %3 = gpu.wait async
    %memref, %asyncToken = gpu.alloc async [%3] () : memref<128x128xf16>
    %memref_2, %asyncToken_3 = gpu.alloc async [%asyncToken] () : memref<128x128xf16>
    %4 = gpu.memcpy async [%asyncToken_3] %memref, %alloc : memref<128x128xf16>, memref<128x128xf16>
    %5 = gpu.memcpy async [%4] %memref_2, %alloc_1 : memref<128x128xf16>, memref<128x128xf16>
    %expand_shape = memref.expand_shape %memref [[0, 1], [2, 3]] output_shape [2, 64, 2, 64] : memref<128x128xf16> into memref<2x64x2x64xf16>
    %transpose = memref.transpose %expand_shape (d0, d1, d2, d3) -> (d0, d2, d1, d3) : memref<2x64x2x64xf16> to memref<2x2x64x64xf16, strided<[8192, 64, 128, 1]>>
    %cast = memref.cast %transpose : memref<2x2x64x64xf16, strided<[8192, 64, 128, 1]>> to memref<*xf16>
    %6 = nvgpu.tma.create.descriptor %cast box[%c2, %c2, %c64, %c64] : memref<*xf16> -> <tensor = memref<2x2x64x64xf16, 3>, swizzle = none, l2promo = none, oob = zero, interleave = none>
    gpu.launch blocks(%arg0, %arg1, %arg2) in (%arg6 = %c1, %arg7 = %c1, %arg8 = %c1) threads(%arg3, %arg4, %arg5) in (%arg9 = %c128, %arg10 = %c1, %arg11 = %c1) dynamic_shared_memory_size %c32768_i32 {
      %9 = gpu.dynamic_shared_memory : memref<?xi8, #gpu.address_space<workgroup>>
      %view = memref.view %9[%c0][] : memref<?xi8, #gpu.address_space<workgroup>> to memref<2x2x64x64xf16, #gpu.address_space<workgroup>>
      %10 = nvgpu.mbarrier.create -> <memorySpace = #gpu.address_space<workgroup>>
      %thread_id_x = gpu.thread_id  x
      %11 = arith.index_cast %thread_id_x : index to i32
      %12 = arith.shrui %11, %c5_i32 : i32
      %13 = nvvm.shfl.sync  idx %c-1_i32, %12, %c0_i32, %c31_i32 : i32 -> i32
      %14 = arith.cmpi eq, %13, %c0_i32 : i32
      %15 = nvvm.elect.sync -> i1
      %16 = arith.andi %14, %15 : i1
      scf.if %16 {
        nvgpu.mbarrier.init %10[%c0], %c1 : <memorySpace = #gpu.address_space<workgroup>>
      }
      %17 = nvvm.shfl.sync  idx %c-1_i32, %12, %c0_i32, %c31_i32 : i32 -> i32
      %18 = arith.cmpi eq, %17, %c0_i32 : i32
      %19 = nvvm.elect.sync -> i1
      %20 = arith.andi %18, %19 : i1
      scf.if %20 {
        nvgpu.mbarrier.arrive.expect_tx %10[%c0], %c32768 : <memorySpace = #gpu.address_space<workgroup>>
        nvgpu.tma.async.load %6[%c0, %c0, %c0, %c0], %10[%c0] to %view : <tensor = memref<2x2x64x64xf16, 3>, swizzle = none, l2promo = none, oob = zero, interleave = none>, <memorySpace = #gpu.address_space<workgroup>> -> memref<2x2x64x64xf16, #gpu.address_space<workgroup>>
      }
      nvgpu.mbarrier.try_wait.parity %10[%c0], %false, %c10000000 : <memorySpace = #gpu.address_space<workgroup>>
      scf.for %arg12 = %c0 to %c2 step %c1 {
        scf.for %arg13 = %c0 to %c2 step %c1 {
          %21 = arith.muli %arg12, %c64 : index
          %22 = arith.muli %arg13, %c64 : index
          %subview = memref.subview %view[%arg12, %arg13, 0, 0] [1, 1, 64, 64] [1, 1, 1, 1] : memref<2x2x64x64xf16, #gpu.address_space<workgroup>> to memref<64x64xf16, strided<[64, 1], offset: ?>, #gpu.address_space<workgroup>>
          %subview_4 = memref.subview %memref_2[%21, %22] [64, 64] [1, 1] : memref<128x128xf16> to memref<64x64xf16, strided<[128, 1], offset: ?>>
          %block_dim_x = gpu.block_dim  x
          %thread_id_y = gpu.thread_id  y
          %23 = arith.muli %thread_id_y, %block_dim_x : index
          %24 = arith.addi %thread_id_x, %23 : index
          %block_dim_y = gpu.block_dim  y
          %25 = arith.muli %block_dim_x, %block_dim_y : index
          %thread_id_z = gpu.thread_id  z
          %26 = arith.muli %thread_id_z, %25 : index
          %27 = arith.addi %24, %26 : index
          %28 = arith.cmpi eq, %27, %c0 : index
          scf.if %28 {
            scf.for %arg14 = %c0 to %c64 step %c1 {
              scf.for %arg15 = %c0 to %c64 step %c1 {
                %29 = memref.load %subview[%arg14, %arg15] : memref<64x64xf16, strided<[64, 1], offset: ?>, #gpu.address_space<workgroup>>
                memref.store %29, %subview_4[%arg14, %arg15] : memref<64x64xf16, strided<[128, 1], offset: ?>>
              }
            }
          }
          gpu.barrier
        }
      }
      gpu.terminator
    }
    %7 = gpu.memcpy async [%5] %alloc_1, %memref_2 : memref<128x128xf16>, memref<128x128xf16>
    gpu.wait [%7]
    %8:2 = scf.for %arg0 = %c0 to %c128 step %c1 iter_args(%arg1 = %c0, %arg2 = %c0) -> (index, index) {
      %9:2 = scf.for %arg3 = %c0 to %c64 step %c1 iter_args(%arg4 = %arg1, %arg5 = %arg2) -> (index, index) {
        %10 = memref.load %alloc_1[%arg0, %arg3] : memref<128x128xf16>
        %11 = memref.load %alloc[%arg0, %arg3] : memref<128x128xf16>
        %12 = arith.cmpf one, %10, %11 : f16
        %13:2 = scf.if %12 -> (index, index) {
          %14 = arith.addi %arg4, %c1 : index
          scf.yield %14, %arg5 : index, index
        } else {
          %14 = arith.addi %arg5, %c1 : index
          scf.yield %arg4, %14 : index, index
        }
        scf.yield %13#0, %13#1 : index, index
      }
      scf.yield %9#0, %9#1 : index, index
    }
    vector.print str "Correct Results :"
    vector.print %8#1 : index
    vector.print str "Incorrect Results :"
    vector.print %8#0 : index
    return
  }
}

