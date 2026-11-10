module @gemm attributes {gpu.container_module} {
  gpu.module @kernel {
    gpu.func @simple_gemm(%arg0: memref<256x256xf16>, %arg1: memref<256x256xf16>, %arg2: memref<256x256xf32>) kernel {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %c16 = arith.constant 16 : index
      %c32 = arith.constant 32 : index
      %c256 = arith.constant 256 : index
      %block_id_x = gpu.block_id x
      %block_id_y = gpu.block_id y
      %0 = arith.muli %block_id_x, %c8 : index
      %1 = arith.muli %block_id_y, %c16 : index
      %2 = xegpu.create_nd_tdesc %arg2 : memref<256x256xf32> -> !xegpu.tensor_desc<8x16xf32>
      %3 = xegpu.load_nd %2[%0, %1]  : !xegpu.tensor_desc<8x16xf32> -> vector<8xf32>
      %4 = xegpu.create_nd_tdesc %arg0 : memref<256x256xf16> -> !xegpu.tensor_desc<8x16xf16>
      %5 = xegpu.create_nd_tdesc %arg1 : memref<256x256xf16> -> !xegpu.tensor_desc<16x16xf16>
      %6 = scf.for %arg3 = %c0 to %c256 step %c16 iter_args(%arg4 = %3) -> (vector<8xf32>) {
        %7 = xegpu.load_nd %4[%0, %arg3]  : !xegpu.tensor_desc<8x16xf16> -> vector<8xf16>
        %8 = xegpu.load_nd %5[%arg3, %1]  : !xegpu.tensor_desc<16x16xf16> -> vector<16xf16>
        %9 = xegpu.dpas %7, %8, %arg4 : vector<8xf16>, vector<16xf16>, vector<8xf32> -> vector<8xf32>
        scf.yield %9 : vector<8xf32>
      }
      xegpu.store_nd %6, %2[%0, %1] <{l1_hint = #xegpu.cache_hint<write_back>, l2_hint = #xegpu.cache_hint<uncached>}> : vector<8xf32>, !xegpu.tensor_desc<8x16xf32>
      gpu.return
    }
  }
  func.func @test(%arg0: memref<256x256xf16>, %arg1: memref<256x256xf16>, %arg2: memref<256x256xf32>) -> memref<256x256xf32> attributes {llvm.emit_c_interface} {
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c32 = arith.constant 32 : index
    %memref = gpu.alloc  () : memref<256x256xf16>
    gpu.memcpy  %memref, %arg0 : memref<256x256xf16>, memref<256x256xf16>
    %memref_0 = gpu.alloc  () : memref<256x256xf16>
    gpu.memcpy  %memref_0, %arg1 : memref<256x256xf16>, memref<256x256xf16>
    %memref_1 = gpu.alloc  () : memref<256x256xf32>
    gpu.memcpy  %memref_1, %arg2 : memref<256x256xf32>, memref<256x256xf32>
    gpu.launch_func  @kernel::@simple_gemm blocks in (%c32, %c16, %c1) threads in (%c16, %c1, %c1)  args(%memref : memref<256x256xf16>, %memref_0 : memref<256x256xf16>, %memref_1 : memref<256x256xf32>)
    gpu.wait 
    gpu.memcpy  %arg2, %memref_1 : memref<256x256xf32>, memref<256x256xf32>
    gpu.dealloc  %memref : memref<256x256xf16>
    gpu.dealloc  %memref_0 : memref<256x256xf16>
    gpu.dealloc  %memref_1 : memref<256x256xf32>
    return %arg2 : memref<256x256xf32>
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

