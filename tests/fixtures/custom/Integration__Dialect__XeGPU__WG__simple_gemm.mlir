module @gemm attributes {gpu.container_module} {
  func.func @test(%arg0: memref<256x256xf16>, %arg1: memref<256x256xf16>, %arg2: memref<256x256xf32>) -> memref<256x256xf32> attributes {llvm.emit_c_interface} {
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c8 = arith.constant 8 : index
    %c16 = arith.constant 16 : index
    %c32 = arith.constant 32 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c512 = arith.constant 512 : index
    %memref = gpu.alloc  () : memref<256x256xf16>
    gpu.memcpy  %memref, %arg0 : memref<256x256xf16>, memref<256x256xf16>
    %memref_0 = gpu.alloc  () : memref<256x256xf16>
    gpu.memcpy  %memref_0, %arg1 : memref<256x256xf16>, memref<256x256xf16>
    %memref_1 = gpu.alloc  () : memref<256x256xf32>
    gpu.memcpy  %memref_1, %arg2 : memref<256x256xf32>, memref<256x256xf32>
    gpu.launch_func  @test_kernel::@test_kernel blocks in (%c1, %c1, %c1) threads in (%c512, %c1, %c1)  args(%memref : memref<256x256xf16>, %memref_0 : memref<256x256xf16>, %memref_1 : memref<256x256xf32>)
    gpu.wait 
    gpu.memcpy  %arg2, %memref_1 : memref<256x256xf32>, memref<256x256xf32>
    gpu.dealloc  %memref : memref<256x256xf16>
    gpu.dealloc  %memref_0 : memref<256x256xf16>
    gpu.dealloc  %memref_1 : memref<256x256xf32>
    return %arg2 : memref<256x256xf32>
  }
  gpu.module @test_kernel {
    gpu.func @test_kernel(%arg0: memref<256x256xf16>, %arg1: memref<256x256xf16>, %arg2: memref<256x256xf32>) kernel {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c32 = arith.constant 32 : index
      %c64 = arith.constant 64 : index
      %c96 = arith.constant 96 : index
      %c256 = arith.constant 256 : index
      %c4096 = arith.constant 4096 : index
      %block_id_x = gpu.block_id x
      %block_id_y = gpu.block_id y
      %0 = arith.muli %block_id_x, %c256 : index
      %1 = arith.muli %block_id_y, %c256 : index
      %2 = xegpu.create_nd_tdesc %arg2 : memref<256x256xf32> -> !xegpu.tensor_desc<256x256xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 64], inst_data = [8, 16]>>
      %3 = xegpu.load_nd %2[%0, %1] <{layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 64], inst_data = [8, 16]>}> : !xegpu.tensor_desc<256x256xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 64], inst_data = [8, 16]>> -> vector<256x256xf32>
      %4 = xegpu.create_nd_tdesc %arg0 : memref<256x256xf16> -> !xegpu.tensor_desc<256x32xf16, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], inst_data = [8, 16]>>
      %5 = xegpu.create_nd_tdesc %arg1 : memref<256x256xf16> -> !xegpu.tensor_desc<32x256xf16, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 64], inst_data = [16, 16]>>
      %6 = xegpu.create_nd_tdesc %arg0 : memref<256x256xf16> -> !xegpu.tensor_desc<256x32xf16, #xegpu.layout<sg_layout = [32, 1], sg_data = [8, 32], inst_data = [8, 16]>>
      xegpu.prefetch_nd %6[%0, %c0] <{layout = #xegpu.layout<sg_layout = [32, 1], sg_data = [8, 32], inst_data = [8, 16]>}> : !xegpu.tensor_desc<256x32xf16, #xegpu.layout<sg_layout = [32, 1], sg_data = [8, 32], inst_data = [8, 16]>>
      xegpu.prefetch_nd %6[%0, %c32] <{layout = #xegpu.layout<sg_layout = [32, 1], sg_data = [8, 32], inst_data = [8, 16]>}> : !xegpu.tensor_desc<256x32xf16, #xegpu.layout<sg_layout = [32, 1], sg_data = [8, 32], inst_data = [8, 16]>>
      xegpu.prefetch_nd %6[%0, %c64] <{layout = #xegpu.layout<sg_layout = [32, 1], sg_data = [8, 32], inst_data = [8, 16]>}> : !xegpu.tensor_desc<256x32xf16, #xegpu.layout<sg_layout = [32, 1], sg_data = [8, 32], inst_data = [8, 16]>>
      %7 = xegpu.create_nd_tdesc %arg1 : memref<256x256xf16> -> !xegpu.tensor_desc<32x256xf16, #xegpu.layout<sg_layout = [4, 8], sg_data = [8, 32], inst_data = [8, 16]>>
      xegpu.prefetch_nd %7[%c0, %1] <{layout = #xegpu.layout<sg_layout = [4, 8], sg_data = [8, 32], inst_data = [8, 16]>}> : !xegpu.tensor_desc<32x256xf16, #xegpu.layout<sg_layout = [4, 8], sg_data = [8, 32], inst_data = [8, 16]>>
      xegpu.prefetch_nd %7[%c32, %1] <{layout = #xegpu.layout<sg_layout = [4, 8], sg_data = [8, 32], inst_data = [8, 16]>}> : !xegpu.tensor_desc<32x256xf16, #xegpu.layout<sg_layout = [4, 8], sg_data = [8, 32], inst_data = [8, 16]>>
      xegpu.prefetch_nd %7[%c64, %1] <{layout = #xegpu.layout<sg_layout = [4, 8], sg_data = [8, 32], inst_data = [8, 16]>}> : !xegpu.tensor_desc<32x256xf16, #xegpu.layout<sg_layout = [4, 8], sg_data = [8, 32], inst_data = [8, 16]>>
      %8 = scf.for %arg3 = %c0 to %c256 step %c32 iter_args(%arg4 = %3) -> (vector<256x256xf32>) {
        %9 = xegpu.load_nd %4[%0, %arg3] <{layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], inst_data = [8, 16]>}> : !xegpu.tensor_desc<256x32xf16, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], inst_data = [8, 16]>> -> vector<256x32xf16>
        %10 = xegpu.load_nd %5[%arg3, %1] <{layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 64], inst_data = [16, 16]>}> : !xegpu.tensor_desc<32x256xf16, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 64], inst_data = [16, 16]>> -> vector<32x256xf16>
        %11 = arith.addi %arg3, %c96 : index
        xegpu.prefetch_nd %6[%0, %11] <{layout = #xegpu.layout<sg_layout = [32, 1], sg_data = [8, 32], inst_data = [8, 16]>}> : !xegpu.tensor_desc<256x32xf16, #xegpu.layout<sg_layout = [32, 1], sg_data = [8, 32], inst_data = [8, 16]>>
        xegpu.prefetch_nd %7[%11, %1] <{layout = #xegpu.layout<sg_layout = [4, 8], sg_data = [8, 32], inst_data = [8, 16]>}> : !xegpu.tensor_desc<32x256xf16, #xegpu.layout<sg_layout = [4, 8], sg_data = [8, 32], inst_data = [8, 16]>>
        %12 = xegpu.dpas %9, %10, %arg4 {layout_a = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], inst_data = [8, 16]>, layout_b = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 64], inst_data = [16, 16]>, layout_cd = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 64], inst_data = [8, 16]>} : vector<256x32xf16>, vector<32x256xf16>, vector<256x256xf32> -> vector<256x256xf32>
        scf.yield %12 : vector<256x256xf32>
      }
      xegpu.store_nd %8, %2[%0, %1] <{layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 64], inst_data = [8, 16]>}> : vector<256x256xf32>, !xegpu.tensor_desc<256x256xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 64], inst_data = [8, 16]>>
      gpu.return
    }
  }
  func.func @main() attributes {llvm.emit_c_interface} {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 1.000000e+00 : f16
    %cst_0 = arith.constant 2.000000e+00 : f16
    %c256 = arith.constant 256 : index
    %cst_1 = arith.constant 0.000000e+00 : f16
    %cst_2 = arith.constant 1.000000e+00 : f16
    %alloc = memref.alloc() : memref<256x256xf16>
    %alloc_3 = memref.alloc() : memref<256x256xf16>
    %alloc_4 = memref.alloc() : memref<256x256xf32>
    %alloc_5 = memref.alloc() : memref<256x256xf32>
    %false = arith.constant false
    %cst_6 = arith.constant -5.000000e-01 : f32
    %cst_7 = arith.constant 5.000000e-01 : f32
    scf.for %arg0 = %c0 to %c256 step %c1 {
      scf.for %arg1 = %c0 to %c256 step %c1 {
        %1 = index.castu %arg1 : index to i16
        %2 = arith.uitofp %1 : i16 to f16
        memref.store %2, %alloc[%arg0, %arg1] : memref<256x256xf16>
      }
    }
    scf.for %arg0 = %c0 to %c256 step %c1 {
      scf.for %arg1 = %c0 to %c256 step %c1 {
        %1 = index.castu %arg0 : index to i32
        %2 = index.castu %arg1 : index to i32
        %3 = arith.cmpi eq, %1, %2 : i32
        scf.if %3 {
          memref.store %cst_2, %alloc_3[%arg0, %arg1] : memref<256x256xf16>
        } else {
          memref.store %cst_1, %alloc_3[%arg0, %arg1] : memref<256x256xf16>
        }
      }
    }
    %cst_8 = arith.constant 0.000000e+00 : f32
    scf.for %arg0 = %c0 to %c256 step %c1 {
      scf.for %arg1 = %c0 to %c256 step %c1 {
        memref.store %cst_8, %alloc_4[%arg0, %arg1] : memref<256x256xf32>
        memref.store %cst_8, %alloc_5[%arg0, %arg1] : memref<256x256xf32>
      }
    }
    %0 = call @test(%alloc, %alloc_3, %alloc_4) : (memref<256x256xf16>, memref<256x256xf16>, memref<256x256xf32>) -> memref<256x256xf32>
    %cast = memref.cast %0 : memref<256x256xf32> to memref<*xf32>
    call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
    memref.dealloc %alloc : memref<256x256xf16>
    memref.dealloc %alloc_3 : memref<256x256xf16>
    memref.dealloc %alloc_4 : memref<256x256xf32>
    memref.dealloc %alloc_5 : memref<256x256xf32>
    return
  }
  func.func private @printMemrefF32(memref<*xf32>) attributes {llvm.emit_c_interface}
}

