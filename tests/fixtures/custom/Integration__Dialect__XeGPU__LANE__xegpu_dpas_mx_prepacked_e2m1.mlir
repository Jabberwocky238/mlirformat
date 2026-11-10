module @gemm attributes {gpu.container_module} {
  gpu.module @kernel {
    gpu.func @dpas_mx_e2m1(%arg0: memref<8x64xf4E2M1FN>, %arg1: memref<32x16xi8>, %arg2: memref<8x16xf32>, %arg3: memref<8x2xf8E8M0FNU>, %arg4: memref<2x16xf8E8M0FNU>) kernel {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<8x64xf4E2M1FN> -> !xegpu.tensor_desc<8x64xf4E2M1FN>
      %1 = xegpu.load_nd %0[0, 0]  : !xegpu.tensor_desc<8x64xf4E2M1FN> -> vector<32xf4E2M1FN>
      %2 = xegpu.create_nd_tdesc %arg1 : memref<32x16xi8> -> !xegpu.tensor_desc<32x16xi8>
      %3 = xegpu.load_nd %2[0, 0] <{packed}> : !xegpu.tensor_desc<32x16xi8> -> vector<32xi8>
      %4 = vector.bitcast %3 : vector<32xi8> to vector<64xf4E2M1FN>
      %5 = xegpu.create_nd_tdesc %arg2 : memref<8x16xf32> -> !xegpu.tensor_desc<8x16xf32>
      %6 = xegpu.load_nd %5[0, 0]  : !xegpu.tensor_desc<8x16xf32> -> vector<8xf32>
      %thread_id_x = gpu.thread_id x
      %c8 = arith.constant 8 : index
      %7 = arith.remsi %thread_id_x, %c8 : index
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %8 = memref.load %arg3[%7, %c0] : memref<8x2xf8E8M0FNU>
      %9 = memref.load %arg3[%7, %c1] : memref<8x2xf8E8M0FNU>
      %cst = arith.constant dense<1.000000e+00> : vector<2xf8E8M0FNU>
      %10 = vector.insert %8, %cst [%c0] : f8E8M0FNU into vector<2xf8E8M0FNU>
      %11 = vector.insert %9, %10 [%c1] : f8E8M0FNU into vector<2xf8E8M0FNU>
      %cst_0 = arith.constant dense<1.000000e+00> : vector<2xf8E8M0FNU>
      %12 = memref.load %arg4[%c0, %thread_id_x] : memref<2x16xf8E8M0FNU>
      %13 = memref.load %arg4[%c1, %thread_id_x] : memref<2x16xf8E8M0FNU>
      %14 = vector.insert %12, %cst_0 [%c0] : f8E8M0FNU into vector<2xf8E8M0FNU>
      %15 = vector.insert %13, %14 [%c1] : f8E8M0FNU into vector<2xf8E8M0FNU>
      %16 = xegpu.dpas_mx %1, %4, %6 scale_a = %11 scale_b = %15 : (vector<32xf4E2M1FN>, vector<64xf4E2M1FN>, vector<8xf32>, vector<2xf8E8M0FNU>, vector<2xf8E8M0FNU>) -> vector<8xf32>
      xegpu.store_nd %16, %5[0, 0]  : vector<8xf32>, !xegpu.tensor_desc<8x16xf32>
      gpu.return
    }
  }
  func.func @test(%arg0: memref<8x64xf4E2M1FN>, %arg1: memref<32x16xi8>, %arg2: memref<8x16xf32>, %arg3: memref<8x2xf8E8M0FNU>, %arg4: memref<2x16xf8E8M0FNU>) -> memref<8x16xf32> attributes {llvm.emit_c_interface} {
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %memref = gpu.alloc  () : memref<8x64xf4E2M1FN>
    gpu.memcpy  %memref, %arg0 : memref<8x64xf4E2M1FN>, memref<8x64xf4E2M1FN>
    %memref_0 = gpu.alloc  () : memref<32x16xi8>
    gpu.memcpy  %memref_0, %arg1 : memref<32x16xi8>, memref<32x16xi8>
    %memref_1 = gpu.alloc  () : memref<8x16xf32>
    gpu.memcpy  %memref_1, %arg2 : memref<8x16xf32>, memref<8x16xf32>
    %memref_2 = gpu.alloc  () : memref<8x2xf8E8M0FNU>
    gpu.memcpy  %memref_2, %arg3 : memref<8x2xf8E8M0FNU>, memref<8x2xf8E8M0FNU>
    %memref_3 = gpu.alloc  () : memref<2x16xf8E8M0FNU>
    gpu.memcpy  %memref_3, %arg4 : memref<2x16xf8E8M0FNU>, memref<2x16xf8E8M0FNU>
    gpu.launch_func  @kernel::@dpas_mx_e2m1 blocks in (%c1, %c1, %c1) threads in (%c16, %c1, %c1)  args(%memref : memref<8x64xf4E2M1FN>, %memref_0 : memref<32x16xi8>, %memref_1 : memref<8x16xf32>, %memref_2 : memref<8x2xf8E8M0FNU>, %memref_3 : memref<2x16xf8E8M0FNU>)
    gpu.dealloc  %memref : memref<8x64xf4E2M1FN>
    gpu.dealloc  %memref_0 : memref<32x16xi8>
    gpu.dealloc  %memref_2 : memref<8x2xf8E8M0FNU>
    gpu.dealloc  %memref_3 : memref<2x16xf8E8M0FNU>
    %alloc = memref.alloc() : memref<8x16xf32>
    gpu.memcpy  %alloc, %memref_1 : memref<8x16xf32>, memref<8x16xf32>
    gpu.dealloc  %memref_1 : memref<8x16xf32>
    return %alloc : memref<8x16xf32>
  }
  func.func @main() attributes {llvm.emit_c_interface} {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c8 = arith.constant 8 : index
    %c16 = arith.constant 16 : index
    %c32 = arith.constant 32 : index
    %c256 = arith.constant 256 : index
    %cst = arith.constant 1.000000e+00 : f4E2M1FN
    %c34_i8 = arith.constant 34 : i8
    %cst_0 = arith.constant 0.000000e+00 : f32
    %cst_1 = arith.constant 1.000000e+00 : f8E8M0FNU
    %alloc = memref.alloc() : memref<256xi8>
    %view = memref.view %alloc[%c0][] : memref<256xi8> to memref<8x64xf4E2M1FN>
    scf.for %arg0 = %c0 to %c256 step %c1 {
      memref.store %c34_i8, %alloc[%arg0] : memref<256xi8>
    }
    %alloc_2 = memref.alloc() : memref<32x16xi8>
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c16 step %c1 {
        memref.store %c34_i8, %alloc_2[%arg0, %arg1] : memref<32x16xi8>
      }
    }
    %alloc_3 = memref.alloc() : memref<8x16xf32>
    scf.for %arg0 = %c0 to %c8 step %c1 {
      scf.for %arg1 = %c0 to %c16 step %c1 {
        memref.store %cst_0, %alloc_3[%arg0, %arg1] : memref<8x16xf32>
      }
    }
    %alloc_4 = memref.alloc() : memref<8x2xf8E8M0FNU>
    scf.for %arg0 = %c0 to %c8 step %c1 {
      scf.for %arg1 = %c0 to %c2 step %c1 {
        memref.store %cst_1, %alloc_4[%arg0, %arg1] : memref<8x2xf8E8M0FNU>
      }
    }
    %alloc_5 = memref.alloc() : memref<2x16xf8E8M0FNU>
    scf.for %arg0 = %c0 to %c2 step %c1 {
      scf.for %arg1 = %c0 to %c16 step %c1 {
        memref.store %cst_1, %alloc_5[%arg0, %arg1] : memref<2x16xf8E8M0FNU>
      }
    }
    %0 = call @test(%view, %alloc_2, %alloc_3, %alloc_4, %alloc_5) : (memref<8x64xf4E2M1FN>, memref<32x16xi8>, memref<8x16xf32>, memref<8x2xf8E8M0FNU>, memref<2x16xf8E8M0FNU>) -> memref<8x16xf32>
    %cast = memref.cast %0 : memref<8x16xf32> to memref<*xf32>
    call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
    memref.dealloc %alloc : memref<256xi8>
    memref.dealloc %alloc_2 : memref<32x16xi8>
    memref.dealloc %alloc_3 : memref<8x16xf32>
    memref.dealloc %alloc_4 : memref<8x2xf8E8M0FNU>
    memref.dealloc %alloc_5 : memref<2x16xf8E8M0FNU>
    memref.dealloc %0 : memref<8x16xf32>
    return
  }
  func.func private @printMemrefF32(memref<*xf32>) attributes {llvm.emit_c_interface}
}

