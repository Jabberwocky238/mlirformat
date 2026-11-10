module @gemm attributes {gpu.container_module} {
  gpu.module @kernel {
    gpu.func @gemm_mxfp(%arg0: memref<256x4096xf4E2M1FN>, %arg1: memref<2048x256xi8>, %arg2: memref<256x128xf8E8M0FNU>, %arg3: memref<128x256xf8E8M0FNU>, %arg4: memref<256x256xf32>) kernel {
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c32_0 = arith.constant 32 : index
      %c1024 = arith.constant 1024 : index
      %c256 = arith.constant 256 : index
      %c256_1 = arith.constant 256 : index
      %c4096 = arith.constant 4096 : index
      %c512 = arith.constant 512 : index
      %c32_2 = arith.constant 32 : index
      %block_id_x = gpu.block_id x
      %block_id_y = gpu.block_id y
      %0 = arith.muli %block_id_x, %c32 : index
      %1 = arith.muli %block_id_y, %c32_0 : index
      %2 = xegpu.create_nd_tdesc %arg0 : memref<256x4096xf4E2M1FN> -> !xegpu.tensor_desc<32x1024xf4E2M1FN>
      %3 = xegpu.create_nd_tdesc %arg1 : memref<2048x256xi8> -> !xegpu.tensor_desc<512x32xi8>
      %4 = xegpu.create_nd_tdesc %arg2 : memref<256x128xf8E8M0FNU> -> !xegpu.tensor_desc<32x32xf8E8M0FNU>
      %5 = xegpu.create_nd_tdesc %arg3 : memref<128x256xf8E8M0FNU> -> !xegpu.tensor_desc<32x32xf8E8M0FNU>
      %6 = xegpu.create_nd_tdesc %arg4 : memref<256x256xf32> -> !xegpu.tensor_desc<32x32xf32, #xegpu.layout<sg_layout = [2, 2], sg_data = [16, 16], inst_data = [8, 16], lane_layout = [1, 16], lane_data = [1, 1]>>
      %7 = xegpu.load_nd %6[%0, %1] <{layout = #xegpu.layout<sg_layout = [2, 2], sg_data = [16, 16], inst_data = [8, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<32x32xf32, #xegpu.layout<sg_layout = [2, 2], sg_data = [16, 16], inst_data = [8, 16], lane_layout = [1, 16], lane_data = [1, 1]>> -> vector<32x32xf32>
      %8:3 = scf.for %arg5 = %c0 to %c4096 step %c1024 iter_args(%arg6 = %7, %arg7 = %c0, %arg8 = %c0) -> (vector<32x32xf32>, index, index) {
        %9 = xegpu.load_nd %2[%0, %arg5] <{layout = #xegpu.layout<sg_layout = [2, 2], sg_data = [16, 1024], inst_data = [8, 64], lane_layout = [1, 16], lane_data = [1, 4]>}> : !xegpu.tensor_desc<32x1024xf4E2M1FN> -> vector<32x1024xf4E2M1FN>
        %10 = xegpu.load_nd %3[%arg7, %1] <{layout = #xegpu.layout<sg_layout = [2, 2], sg_data = [512, 16], inst_data = [32, 16], lane_layout = [1, 16], lane_data = [4, 1]>}> : !xegpu.tensor_desc<512x32xi8> -> vector<512x32xi8>
        %11 = vector.bitcast %10 : vector<512x32xi8> to vector<512x64xf4E2M1FN>
        %res1, %res2 = vector.deinterleave %11 : vector<512x64xf4E2M1FN> -> vector<512x32xf4E2M1FN>
        %12 = vector.transpose %res1, [1, 0] : vector<512x32xf4E2M1FN> to vector<32x512xf4E2M1FN>
        %13 = vector.transpose %res2, [1, 0] : vector<512x32xf4E2M1FN> to vector<32x512xf4E2M1FN>
        %14 = vector.interleave %12, %13 : vector<32x512xf4E2M1FN> -> vector<32x1024xf4E2M1FN>
        %15 = vector.transpose %14, [1, 0] : vector<32x1024xf4E2M1FN> to vector<1024x32xf4E2M1FN>
        %16 = xegpu.load_nd %4[%0, %arg8] <{layout = #xegpu.layout<sg_layout = [2, 2], sg_data = [16, 32], inst_data = [16, 32], lane_layout = [16, 1], lane_data = [1, 1]>}> : !xegpu.tensor_desc<32x32xf8E8M0FNU> -> vector<32x32xf8E8M0FNU>
        %17 = xegpu.load_nd %5[%arg8, %1] <{layout = #xegpu.layout<sg_layout = [2, 2], sg_data = [32, 16], inst_data = [32, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<32x32xf8E8M0FNU> -> vector<32x32xf8E8M0FNU>
        %18 = xegpu.dpas_mx %9, %15, %arg6 scale_a = %16 scale_b = %17 {layout_a = #xegpu.layout<sg_layout = [2, 2], sg_data = [16, 1024], inst_data = [8, 64], lane_layout = [1, 16], lane_data = [1, 4]>, layout_a_scale = #xegpu.layout<sg_layout = [2, 2], sg_data = [16, 32], inst_data = [8, 2], lane_layout = [8, 1], lane_data = [1, 1]>, layout_b = #xegpu.layout<sg_layout = [2, 2], sg_data = [1024, 16], inst_data = [64, 16], lane_layout = [1, 16], lane_data = [8, 1]>, layout_b_scale = #xegpu.layout<sg_layout = [2, 2], sg_data = [32, 16], inst_data = [2, 16], lane_layout = [1, 16], lane_data = [1, 1]>, layout_cd = #xegpu.layout<sg_layout = [2, 2], sg_data = [16, 16], inst_data = [8, 16], lane_layout = [1, 16], lane_data = [1, 1]>} : (vector<32x1024xf4E2M1FN>, vector<1024x32xf4E2M1FN>, vector<32x32xf32>, vector<32x32xf8E8M0FNU>, vector<32x32xf8E8M0FNU>) -> vector<32x32xf32>
        %19 = arith.addi %arg7, %c512 : index
        %20 = arith.addi %arg8, %c32_2 : index
        scf.yield %18, %19, %20 : vector<32x32xf32>, index, index
      }
      xegpu.store_nd %8#0, %6[%0, %1] <{layout = #xegpu.layout<sg_layout = [2, 2], sg_data = [16, 16], inst_data = [8, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<32x32xf32>, !xegpu.tensor_desc<32x32xf32, #xegpu.layout<sg_layout = [2, 2], sg_data = [16, 16], inst_data = [8, 16], lane_layout = [1, 16], lane_data = [1, 1]>>
      gpu.return
    }
  }
  func.func @test(%arg0: memref<256x4096xf4E2M1FN>, %arg1: memref<2048x256xi8>, %arg2: memref<256x128xf8E8M0FNU>, %arg3: memref<128x256xf8E8M0FNU>, %arg4: memref<256x256xf32>) -> memref<256x256xf32> attributes {llvm.emit_c_interface} {
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    %c64 = arith.constant 64 : index
    %memref = gpu.alloc  () : memref<256x4096xf4E2M1FN>
    gpu.memcpy  %memref, %arg0 : memref<256x4096xf4E2M1FN>, memref<256x4096xf4E2M1FN>
    %memref_0 = gpu.alloc  () : memref<2048x256xi8>
    gpu.memcpy  %memref_0, %arg1 : memref<2048x256xi8>, memref<2048x256xi8>
    %memref_1 = gpu.alloc  () : memref<256x256xf32>
    gpu.memcpy  %memref_1, %arg4 : memref<256x256xf32>, memref<256x256xf32>
    %memref_2 = gpu.alloc  () : memref<256x128xf8E8M0FNU>
    gpu.memcpy  %memref_2, %arg2 : memref<256x128xf8E8M0FNU>, memref<256x128xf8E8M0FNU>
    %memref_3 = gpu.alloc  () : memref<128x256xf8E8M0FNU>
    gpu.memcpy  %memref_3, %arg3 : memref<128x256xf8E8M0FNU>, memref<128x256xf8E8M0FNU>
    gpu.launch_func  @kernel::@gemm_mxfp blocks in (%c8, %c8, %c1) threads in (%c64, %c1, %c1)  args(%memref : memref<256x4096xf4E2M1FN>, %memref_0 : memref<2048x256xi8>, %memref_2 : memref<256x128xf8E8M0FNU>, %memref_3 : memref<128x256xf8E8M0FNU>, %memref_1 : memref<256x256xf32>)
    gpu.dealloc  %memref : memref<256x4096xf4E2M1FN>
    gpu.dealloc  %memref_0 : memref<2048x256xi8>
    gpu.dealloc  %memref_2 : memref<256x128xf8E8M0FNU>
    gpu.dealloc  %memref_3 : memref<128x256xf8E8M0FNU>
    %alloc = memref.alloc() : memref<256x256xf32>
    gpu.memcpy  %alloc, %memref_1 : memref<256x256xf32>, memref<256x256xf32>
    gpu.dealloc  %memref_1 : memref<256x256xf32>
    return %alloc : memref<256x256xf32>
  }
  func.func @main() attributes {llvm.emit_c_interface} {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c128 = arith.constant 128 : index
    %c256 = arith.constant 256 : index
    %c2048 = arith.constant 2048 : index
    %c4096 = arith.constant 4096 : index
    %c524288 = arith.constant 524288 : index
    %c34_i8 = arith.constant 34 : i8
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f8E8M0FNU
    %alloc = memref.alloc() : memref<524288xi8>
    %view = memref.view %alloc[%c0][] : memref<524288xi8> to memref<256x4096xf4E2M1FN>
    scf.for %arg0 = %c0 to %c524288 step %c1 {
      memref.store %c34_i8, %alloc[%arg0] : memref<524288xi8>
    }
    %alloc_1 = memref.alloc() : memref<2048x256xi8>
    scf.for %arg0 = %c0 to %c2048 step %c1 {
      scf.for %arg1 = %c0 to %c256 step %c1 {
        memref.store %c34_i8, %alloc_1[%arg0, %arg1] : memref<2048x256xi8>
      }
    }
    %alloc_2 = memref.alloc() : memref<256x256xf32>
    scf.for %arg0 = %c0 to %c256 step %c1 {
      scf.for %arg1 = %c0 to %c256 step %c1 {
        memref.store %cst, %alloc_2[%arg0, %arg1] : memref<256x256xf32>
      }
    }
    %alloc_3 = memref.alloc() : memref<256x128xf8E8M0FNU>
    scf.for %arg0 = %c0 to %c256 step %c1 {
      scf.for %arg1 = %c0 to %c128 step %c1 {
        memref.store %cst_0, %alloc_3[%arg0, %arg1] : memref<256x128xf8E8M0FNU>
      }
    }
    %alloc_4 = memref.alloc() : memref<128x256xf8E8M0FNU>
    scf.for %arg0 = %c0 to %c128 step %c1 {
      scf.for %arg1 = %c0 to %c256 step %c1 {
        memref.store %cst_0, %alloc_4[%arg0, %arg1] : memref<128x256xf8E8M0FNU>
      }
    }
    %cst_5 = arith.constant 4.096000e+03 : f32
    %alloc_6 = memref.alloc() : memref<256x256xf32>
    scf.for %arg0 = %c0 to %c256 step %c1 {
      scf.for %arg1 = %c0 to %c256 step %c1 {
        memref.store %cst_5, %alloc_6[%arg0, %arg1] : memref<256x256xf32>
      }
    }
    %0 = call @test(%view, %alloc_1, %alloc_3, %alloc_4, %alloc_2) : (memref<256x4096xf4E2M1FN>, memref<2048x256xi8>, memref<256x128xf8E8M0FNU>, memref<128x256xf8E8M0FNU>, memref<256x256xf32>) -> memref<256x256xf32>
    %cast = memref.cast %0 : memref<256x256xf32> to memref<*xf32>
    %cast_7 = memref.cast %alloc_6 : memref<256x256xf32> to memref<*xf32>
    %1 = call @verifyMemRefF32(%cast, %cast_7) : (memref<*xf32>, memref<*xf32>) -> i64
    call @printI64(%1) : (i64) -> ()
    memref.dealloc %alloc : memref<524288xi8>
    memref.dealloc %alloc_1 : memref<2048x256xi8>
    memref.dealloc %alloc_3 : memref<256x128xf8E8M0FNU>
    memref.dealloc %alloc_4 : memref<128x256xf8E8M0FNU>
    memref.dealloc %alloc_2 : memref<256x256xf32>
    memref.dealloc %0 : memref<256x256xf32>
    return
  }
  func.func private @verifyMemRefF32(memref<*xf32>, memref<*xf32>) -> i64 attributes {llvm.emit_c_interface}
  func.func private @printI64(i64)
}

