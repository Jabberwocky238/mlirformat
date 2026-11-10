module @roundtrip attributes {gpu.container_module} {
  gpu.module @kernel {
    gpu.func @truncf_extf_roundtrip_fp4(%arg0: !llvm.ptr<1>) kernel {
      %0 = gpu.lane_id
      %1 = arith.index_cast %0 : index to i64
      %c16_i64 = arith.constant 16 : i64
      %2 = arith.muli %1, %c16_i64 : i64
      %3 = llvm.getelementptr %arg0[%2] : (!llvm.ptr<1>, i64) -> !llvm.ptr<1>, bf16
      %4 = llvm.load %3 : !llvm.ptr<1> -> vector<16xbf16>
      %5 = xevm.truncf %4 {src_etype = bf16, dst_etype = e2m1} : (vector<16xbf16>) -> vector<8xi8>
      %6 = xevm.extf %5 {src_etype = e2m1, dst_etype = bf16} : (vector<8xi8>) -> vector<16xbf16>
      llvm.store %6, %3 : vector<16xbf16>, !llvm.ptr<1>
      gpu.return
    }
  }
  func.func @test(%arg0: memref<16x16xbf16>) -> memref<16x16xbf16> attributes {llvm.emit_c_interface} {
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %memref = gpu.alloc  () : memref<16x16xbf16>
    gpu.memcpy  %memref, %arg0 : memref<16x16xbf16>, memref<16x16xbf16>
    %intptr = memref.extract_aligned_pointer_as_index %memref : memref<16x16xbf16> -> index
    %0 = arith.index_cast %intptr : index to i64
    %1 = llvm.inttoptr %0 : i64 to !llvm.ptr
    %2 = llvm.addrspacecast %1 : !llvm.ptr to !llvm.ptr<1>
    gpu.launch_func  @kernel::@truncf_extf_roundtrip_fp4 blocks in (%c1, %c1, %c1) threads in (%c16, %c1, %c1)  args(%2 : !llvm.ptr<1>)
    %alloc = memref.alloc() : memref<16x16xbf16>
    gpu.memcpy  %alloc, %memref : memref<16x16xbf16>, memref<16x16xbf16>
    gpu.dealloc  %memref : memref<16x16xbf16>
    return %alloc : memref<16x16xbf16>
  }
  func.func @main() attributes {llvm.emit_c_interface} {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c4 = arith.constant 4 : index
    %c5 = arith.constant 5 : index
    %c6 = arith.constant 6 : index
    %c7 = arith.constant 7 : index
    %c8 = arith.constant 8 : index
    %c16 = arith.constant 16 : index
    %alloc = memref.alloc() : memref<8xbf16>
    %cst = arith.constant 0.000000e+00 : bf16
    %cst_0 = arith.constant 5.000000e-01 : bf16
    %cst_1 = arith.constant 1.000000e+00 : bf16
    %cst_2 = arith.constant 1.500000e+00 : bf16
    %cst_3 = arith.constant 2.000000e+00 : bf16
    %cst_4 = arith.constant 3.000000e+00 : bf16
    %cst_5 = arith.constant 4.000000e+00 : bf16
    %cst_6 = arith.constant 6.000000e+00 : bf16
    memref.store %cst, %alloc[%c0] : memref<8xbf16>
    memref.store %cst_0, %alloc[%c1] : memref<8xbf16>
    memref.store %cst_1, %alloc[%c2] : memref<8xbf16>
    memref.store %cst_2, %alloc[%c3] : memref<8xbf16>
    memref.store %cst_3, %alloc[%c4] : memref<8xbf16>
    memref.store %cst_4, %alloc[%c5] : memref<8xbf16>
    memref.store %cst_5, %alloc[%c6] : memref<8xbf16>
    memref.store %cst_6, %alloc[%c7] : memref<8xbf16>
    %alloc_7 = memref.alloc() : memref<16x16xbf16>
    scf.for %arg0 = %c0 to %c16 step %c1 {
      scf.for %arg1 = %c0 to %c16 step %c1 {
        %1 = arith.remui %arg1, %c8 : index
        %2 = memref.load %alloc[%1] : memref<8xbf16>
        memref.store %2, %alloc_7[%arg0, %arg1] : memref<16x16xbf16>
      }
    }
    %0 = call @test(%alloc_7) : (memref<16x16xbf16>) -> memref<16x16xbf16>
    %alloc_8 = memref.alloc() : memref<16x16xf32>
    scf.for %arg0 = %c0 to %c16 step %c1 {
      scf.for %arg1 = %c0 to %c16 step %c1 {
        %1 = memref.load %0[%arg0, %arg1] : memref<16x16xbf16>
        %2 = arith.extf %1 : bf16 to f32
        memref.store %2, %alloc_8[%arg0, %arg1] : memref<16x16xf32>
      }
    }
    %cast = memref.cast %alloc_8 : memref<16x16xf32> to memref<*xf32>
    call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
    memref.dealloc %alloc_7 : memref<16x16xbf16>
    memref.dealloc %0 : memref<16x16xbf16>
    memref.dealloc %alloc_8 : memref<16x16xf32>
    memref.dealloc %alloc : memref<8xbf16>
    return
  }
  func.func private @printMemrefF32(memref<*xf32>) attributes {llvm.emit_c_interface}
}

