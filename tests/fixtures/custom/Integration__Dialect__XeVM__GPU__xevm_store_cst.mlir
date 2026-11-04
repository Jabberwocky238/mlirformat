module @gemm attributes {gpu.container_module} {
  gpu.module @kernel {
    gpu.func @store_constant(%arg0: !llvm.ptr<1>) kernel {
      %cst = arith.constant 4.200000e+01 : f32
      %0 = gpu.lane_id
      %1 = arith.index_cast %0 : index to i64
      %2 = llvm.getelementptr %arg0[%1] : (!llvm.ptr<1>, i64) -> !llvm.ptr<1>, i32
      llvm.store %cst, %2 : f32, !llvm.ptr<1>
      gpu.return
    }
  }
  func.func @test(%arg0: memref<8x16xf32>) -> memref<8x16xf32> attributes {llvm.emit_c_interface} {
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %memref = gpu.alloc  () : memref<8x16xf32>
    gpu.memcpy  %memref, %arg0 : memref<8x16xf32>, memref<8x16xf32>
    %intptr = memref.extract_aligned_pointer_as_index %memref : memref<8x16xf32> -> index
    %0 = arith.index_cast %intptr : index to i64
    %1 = llvm.inttoptr %0 : i64 to !llvm.ptr
    %2 = llvm.addrspacecast %1 : !llvm.ptr to !llvm.ptr<1>
    gpu.launch_func  @kernel::@store_constant blocks in (%c1, %c1, %c1) threads in (%c16, %c1, %c1)  args(%2 : !llvm.ptr<1>)
    %alloc = memref.alloc() : memref<8x16xf32>
    gpu.memcpy  %alloc, %memref : memref<8x16xf32>, memref<8x16xf32>
    gpu.dealloc  %memref : memref<8x16xf32>
    return %alloc : memref<8x16xf32>
  }
  func.func @main() attributes {llvm.emit_c_interface} {
    %alloc = memref.alloc() : memref<8x16xf32>
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    %c16 = arith.constant 16 : index
    %cst = arith.constant 1.111000e+01 : f32
    scf.for %arg0 = %c0 to %c8 step %c1 {
      scf.for %arg1 = %c0 to %c16 step %c1 {
        memref.store %cst, %alloc[%arg0, %arg1] : memref<8x16xf32>
      }
    }
    %0 = call @test(%alloc) : (memref<8x16xf32>) -> memref<8x16xf32>
    %cast = memref.cast %0 : memref<8x16xf32> to memref<*xf32>
    %cast_0 = memref.cast %alloc : memref<8x16xf32> to memref<*xf32>
    call @printMemrefF32(%cast_0) : (memref<*xf32>) -> ()
    call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
    memref.dealloc %alloc : memref<8x16xf32>
    memref.dealloc %0 : memref<8x16xf32>
    return
  }
  func.func private @printMemrefF32(memref<*xf32>)
}

