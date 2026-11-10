module @roundtrip attributes {gpu.container_module} {
  gpu.module @kernel {
    gpu.func @truncf_extf_roundtrip(%arg0: !llvm.ptr<1>) kernel {
      %0 = gpu.lane_id
      %1 = arith.index_cast %0 : index to i64
      %c16_i64 = arith.constant 16 : i64
      %2 = arith.muli %1, %c16_i64 : i64
      %3 = llvm.getelementptr %arg0[%2] : (!llvm.ptr<1>, i64) -> !llvm.ptr<1>, bf16
      %4 = llvm.load %3 : !llvm.ptr<1> -> vector<16xbf16>
      %5 = xevm.truncf %4 {src_etype = bf16, dst_etype = f8} : (vector<16xbf16>) -> vector<16xi8>
      %6 = xevm.extf %5 {src_etype = f8, dst_etype = bf16} : (vector<16xi8>) -> vector<16xbf16>
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
    gpu.launch_func  @kernel::@truncf_extf_roundtrip blocks in (%c1, %c1, %c1) threads in (%c16, %c1, %c1)  args(%2 : !llvm.ptr<1>)
    %alloc = memref.alloc() : memref<16x16xbf16>
    gpu.memcpy  %alloc, %memref : memref<16x16xbf16>, memref<16x16xbf16>
    gpu.dealloc  %memref : memref<16x16xbf16>
    return %alloc : memref<16x16xbf16>
  }
  func.func @main() attributes {llvm.emit_c_interface} {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c1_i32 = arith.constant 1 : i32
    %alloc = memref.alloc() : memref<16x16xbf16>
    scf.for %arg0 = %c0 to %c16 step %c1 {
      %1 = arith.index_cast %arg0 : index to i32
      %2 = arith.addi %1, %c1_i32 : i32
      %3 = arith.sitofp %2 : i32 to bf16
      scf.for %arg1 = %c0 to %c16 step %c1 {
        memref.store %3, %alloc[%arg0, %arg1] : memref<16x16xbf16>
      }
    }
    %0 = call @test(%alloc) : (memref<16x16xbf16>) -> memref<16x16xbf16>
    %alloc_0 = memref.alloc() : memref<16x16xf32>
    scf.for %arg0 = %c0 to %c16 step %c1 {
      scf.for %arg1 = %c0 to %c16 step %c1 {
        %1 = memref.load %0[%arg0, %arg1] : memref<16x16xbf16>
        %2 = arith.extf %1 : bf16 to f32
        memref.store %2, %alloc_0[%arg0, %arg1] : memref<16x16xf32>
      }
    }
    %cast = memref.cast %alloc_0 : memref<16x16xf32> to memref<*xf32>
    call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
    memref.dealloc %alloc : memref<16x16xbf16>
    memref.dealloc %0 : memref<16x16xbf16>
    memref.dealloc %alloc_0 : memref<16x16xf32>
    return
  }
  func.func private @printMemrefF32(memref<*xf32>) attributes {llvm.emit_c_interface}
}

