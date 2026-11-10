module @raw_convert attributes {gpu.container_module} {
  gpu.module @kernel {
    gpu.func @truncf_extf(%arg0: !llvm.ptr<1>, %arg1: !llvm.ptr<1>) kernel {
      %0 = gpu.lane_id
      %1 = arith.index_cast %0 : index to i64
      %c16_i64 = arith.constant 16 : i64
      %2 = arith.muli %1, %c16_i64 : i64
      %3 = llvm.getelementptr %arg0[%2] : (!llvm.ptr<1>, i64) -> !llvm.ptr<1>, f16
      %4 = llvm.getelementptr %arg1[%2] : (!llvm.ptr<1>, i64) -> !llvm.ptr<1>, i8
      %5 = llvm.load %3 : !llvm.ptr<1> -> vector<16xf16>
      %6 = xevm.truncf %5 {src_etype = f16, dst_etype = f8} : (vector<16xf16>) -> vector<16xi8>
      llvm.store %6, %4 : vector<16xi8>, !llvm.ptr<1>
      %7 = xevm.extf %6 {src_etype = f8, dst_etype = f16} : (vector<16xi8>) -> vector<16xf16>
      llvm.store %7, %3 : vector<16xf16>, !llvm.ptr<1>
      gpu.return
    }
  }
  func.func @test(%arg0: memref<16x16xf16>) -> (memref<16x16xf16>, memref<16x16xi8>) {
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %memref = gpu.alloc  () : memref<16x16xf16>
    gpu.memcpy  %memref, %arg0 : memref<16x16xf16>, memref<16x16xf16>
    %memref_0 = gpu.alloc  () : memref<16x16xi8>
    %intptr = memref.extract_aligned_pointer_as_index %memref : memref<16x16xf16> -> index
    %0 = arith.index_cast %intptr : index to i64
    %1 = llvm.inttoptr %0 : i64 to !llvm.ptr
    %2 = llvm.addrspacecast %1 : !llvm.ptr to !llvm.ptr<1>
    %intptr_1 = memref.extract_aligned_pointer_as_index %memref_0 : memref<16x16xi8> -> index
    %3 = arith.index_cast %intptr_1 : index to i64
    %4 = llvm.inttoptr %3 : i64 to !llvm.ptr
    %5 = llvm.addrspacecast %4 : !llvm.ptr to !llvm.ptr<1>
    gpu.launch_func  @kernel::@truncf_extf blocks in (%c1, %c1, %c1) threads in (%c16, %c1, %c1)  args(%2 : !llvm.ptr<1>, %5 : !llvm.ptr<1>)
    %alloc = memref.alloc() : memref<16x16xf16>
    gpu.memcpy  %alloc, %memref : memref<16x16xf16>, memref<16x16xf16>
    %alloc_2 = memref.alloc() : memref<16x16xi8>
    gpu.memcpy  %alloc_2, %memref_0 : memref<16x16xi8>, memref<16x16xi8>
    gpu.dealloc  %memref : memref<16x16xf16>
    gpu.dealloc  %memref_0 : memref<16x16xi8>
    return %alloc, %alloc_2 : memref<16x16xf16>, memref<16x16xi8>
  }
  func.func @main() attributes {llvm.emit_c_interface} {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c1_i32 = arith.constant 1 : i32
    %alloc = memref.alloc() : memref<16x16xf16>
    scf.for %arg0 = %c0 to %c16 step %c1 {
      %1 = arith.index_cast %arg0 : index to i32
      %2 = arith.addi %1, %c1_i32 : i32
      %3 = arith.sitofp %2 : i32 to f16
      scf.for %arg1 = %c0 to %c16 step %c1 {
        memref.store %3, %alloc[%arg0, %arg1] : memref<16x16xf16>
      }
    }
    %0:2 = call @test(%alloc) : (memref<16x16xf16>) -> (memref<16x16xf16>, memref<16x16xi8>)
    %alloc_0 = memref.alloc() : memref<16x16xi32>
    scf.for %arg0 = %c0 to %c16 step %c1 {
      scf.for %arg1 = %c0 to %c16 step %c1 {
        %1 = memref.load %0#1[%arg0, %arg1] : memref<16x16xi8>
        %2 = arith.extsi %1 : i8 to i32
        memref.store %2, %alloc_0[%arg0, %arg1] : memref<16x16xi32>
      }
    }
    %cast = memref.cast %alloc_0 : memref<16x16xi32> to memref<*xi32>
    call @printMemrefI32(%cast) : (memref<*xi32>) -> ()
    %alloc_1 = memref.alloc() : memref<16x16xf32>
    scf.for %arg0 = %c0 to %c16 step %c1 {
      scf.for %arg1 = %c0 to %c16 step %c1 {
        %1 = memref.load %0#0[%arg0, %arg1] : memref<16x16xf16>
        %2 = arith.extf %1 : f16 to f32
        memref.store %2, %alloc_1[%arg0, %arg1] : memref<16x16xf32>
      }
    }
    %cast_2 = memref.cast %alloc_1 : memref<16x16xf32> to memref<*xf32>
    call @printMemrefF32(%cast_2) : (memref<*xf32>) -> ()
    memref.dealloc %alloc : memref<16x16xf16>
    memref.dealloc %0#0 : memref<16x16xf16>
    memref.dealloc %0#1 : memref<16x16xi8>
    memref.dealloc %alloc_0 : memref<16x16xi32>
    memref.dealloc %alloc_1 : memref<16x16xf32>
    return
  }
  func.func private @printMemrefI32(memref<*xi32>) attributes {llvm.emit_c_interface}
  func.func private @printMemrefF32(memref<*xf32>) attributes {llvm.emit_c_interface}
}

