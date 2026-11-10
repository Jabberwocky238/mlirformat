module @gemm attributes {gpu.container_module} {
  gpu.module @kernel {
    gpu.func @dpas_mx_bf8(%arg0: memref<8x32xf8E5M2>, %arg1: memref<32x16xf8E5M2>, %arg2: memref<8x16xf32>, %arg3: memref<8x1xf8E8M0FNU>, %arg4: memref<1x16xf8E8M0FNU>) kernel {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<8x32xf8E5M2> -> !xegpu.tensor_desc<8x32xf8E5M2>
      %1 = xegpu.load_nd %0[0, 0]  : !xegpu.tensor_desc<8x32xf8E5M2> -> vector<16xf8E5M2>
      %2 = xegpu.create_nd_tdesc %arg1 : memref<32x16xf8E5M2> -> !xegpu.tensor_desc<32x16xf8E5M2>
      %3 = xegpu.load_nd %2[0, 0] <{packed}> : !xegpu.tensor_desc<32x16xf8E5M2> -> vector<32xf8E5M2>
      %4 = xegpu.create_nd_tdesc %arg2 : memref<8x16xf32> -> !xegpu.tensor_desc<8x16xf32>
      %5 = xegpu.load_nd %4[0, 0]  : !xegpu.tensor_desc<8x16xf32> -> vector<8xf32>
      %thread_id_x = gpu.thread_id x
      %c8 = arith.constant 8 : index
      %6 = arith.remsi %thread_id_x, %c8 : index
      %c0 = arith.constant 0 : index
      %7 = memref.load %arg3[%6, %c0] : memref<8x1xf8E8M0FNU>
      %cst = arith.constant dense<1.000000e+00> : vector<1xf8E8M0FNU>
      %8 = vector.insert %7, %cst [%c0] : f8E8M0FNU into vector<1xf8E8M0FNU>
      %cst_0 = arith.constant dense<1.000000e+00> : vector<1xf8E8M0FNU>
      %9 = memref.load %arg4[%c0, %thread_id_x] : memref<1x16xf8E8M0FNU>
      %10 = vector.insert %9, %cst_0 [%c0] : f8E8M0FNU into vector<1xf8E8M0FNU>
      %11 = xegpu.dpas_mx %1, %3, %5 scale_a = %8 scale_b = %10 : (vector<16xf8E5M2>, vector<32xf8E5M2>, vector<8xf32>, vector<1xf8E8M0FNU>, vector<1xf8E8M0FNU>) -> vector<8xf32>
      xegpu.store_nd %11, %4[0, 0]  : vector<8xf32>, !xegpu.tensor_desc<8x16xf32>
      gpu.return
    }
  }
  func.func @test(%arg0: memref<8x32xf8E5M2>, %arg1: memref<32x16xf8E5M2>, %arg2: memref<8x16xf32>, %arg3: memref<8x1xf8E8M0FNU>, %arg4: memref<1x16xf8E8M0FNU>) -> memref<8x16xf32> attributes {llvm.emit_c_interface} {
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %memref = gpu.alloc  () : memref<8x32xf8E5M2>
    gpu.memcpy  %memref, %arg0 : memref<8x32xf8E5M2>, memref<8x32xf8E5M2>
    %memref_0 = gpu.alloc  () : memref<32x16xf8E5M2>
    gpu.memcpy  %memref_0, %arg1 : memref<32x16xf8E5M2>, memref<32x16xf8E5M2>
    %memref_1 = gpu.alloc  () : memref<8x16xf32>
    gpu.memcpy  %memref_1, %arg2 : memref<8x16xf32>, memref<8x16xf32>
    %memref_2 = gpu.alloc  () : memref<8x1xf8E8M0FNU>
    gpu.memcpy  %memref_2, %arg3 : memref<8x1xf8E8M0FNU>, memref<8x1xf8E8M0FNU>
    %memref_3 = gpu.alloc  () : memref<1x16xf8E8M0FNU>
    gpu.memcpy  %memref_3, %arg4 : memref<1x16xf8E8M0FNU>, memref<1x16xf8E8M0FNU>
    gpu.launch_func  @kernel::@dpas_mx_bf8 blocks in (%c1, %c1, %c1) threads in (%c16, %c1, %c1)  args(%memref : memref<8x32xf8E5M2>, %memref_0 : memref<32x16xf8E5M2>, %memref_1 : memref<8x16xf32>, %memref_2 : memref<8x1xf8E8M0FNU>, %memref_3 : memref<1x16xf8E8M0FNU>)
    gpu.dealloc  %memref : memref<8x32xf8E5M2>
    gpu.dealloc  %memref_0 : memref<32x16xf8E5M2>
    gpu.dealloc  %memref_2 : memref<8x1xf8E8M0FNU>
    gpu.dealloc  %memref_3 : memref<1x16xf8E8M0FNU>
    %alloc = memref.alloc() : memref<8x16xf32>
    gpu.memcpy  %alloc, %memref_1 : memref<8x16xf32>, memref<8x16xf32>
    gpu.dealloc  %memref_1 : memref<8x16xf32>
    return %alloc : memref<8x16xf32>
  }
  func.func @main() attributes {llvm.emit_c_interface} {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    %c16 = arith.constant 16 : index
    %c32 = arith.constant 32 : index
    %cst = arith.constant 1.000000e+00 : f8E5M2
    %cst_0 = arith.constant 0.000000e+00 : f32
    %cst_1 = arith.constant 1.000000e+00 : f8E8M0FNU
    %alloc = memref.alloc() : memref<8x32xf8E5M2>
    scf.for %arg0 = %c0 to %c8 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c1 {
        memref.store %cst, %alloc[%arg0, %arg1] : memref<8x32xf8E5M2>
      }
    }
    %alloc_2 = memref.alloc() : memref<32x16xf8E5M2>
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c16 step %c1 {
        memref.store %cst, %alloc_2[%arg0, %arg1] : memref<32x16xf8E5M2>
      }
    }
    %alloc_3 = memref.alloc() : memref<8x16xf32>
    scf.for %arg0 = %c0 to %c8 step %c1 {
      scf.for %arg1 = %c0 to %c16 step %c1 {
        memref.store %cst_0, %alloc_3[%arg0, %arg1] : memref<8x16xf32>
      }
    }
    %alloc_4 = memref.alloc() : memref<8x1xf8E8M0FNU>
    scf.for %arg0 = %c0 to %c8 step %c1 {
      memref.store %cst_1, %alloc_4[%arg0, %c0] : memref<8x1xf8E8M0FNU>
    }
    %alloc_5 = memref.alloc() : memref<1x16xf8E8M0FNU>
    scf.for %arg0 = %c0 to %c16 step %c1 {
      memref.store %cst_1, %alloc_5[%c0, %arg0] : memref<1x16xf8E8M0FNU>
    }
    %0 = call @test(%alloc, %alloc_2, %alloc_3, %alloc_4, %alloc_5) : (memref<8x32xf8E5M2>, memref<32x16xf8E5M2>, memref<8x16xf32>, memref<8x1xf8E8M0FNU>, memref<1x16xf8E8M0FNU>) -> memref<8x16xf32>
    %cast = memref.cast %0 : memref<8x16xf32> to memref<*xf32>
    call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
    memref.dealloc %alloc : memref<8x32xf8E5M2>
    memref.dealloc %alloc_2 : memref<32x16xf8E5M2>
    memref.dealloc %alloc_3 : memref<8x16xf32>
    memref.dealloc %alloc_4 : memref<8x1xf8E8M0FNU>
    memref.dealloc %alloc_5 : memref<1x16xf8E8M0FNU>
    memref.dealloc %0 : memref<8x16xf32>
    return
  }
  func.func private @printMemrefF32(memref<*xf32>) attributes {llvm.emit_c_interface}
}

