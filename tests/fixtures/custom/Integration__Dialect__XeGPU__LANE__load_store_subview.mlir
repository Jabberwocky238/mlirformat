module @subview attributes {gpu.container_module} {
  gpu.module @kernel {
    gpu.func @subview(%arg0: memref<256xf32>, %arg1: memref<256xf32>) kernel {
      %subview = memref.subview %arg0[5] [251] [1] : memref<256xf32> to memref<251xf32, strided<[1], offset: 5>>
      %subview_0 = memref.subview %arg1[10] [246] [1] : memref<256xf32> to memref<246xf32, strided<[1], offset: 10>>
      %0 = gpu.lane_id
      %true = arith.constant true
      %1 = xegpu.load %subview[%0], %true  : memref<251xf32, strided<[1], offset: 5>>, index, i1 -> f32
      xegpu.store %1, %subview_0[%0], %true  : f32, memref<246xf32, strided<[1], offset: 10>>, index, i1
      gpu.return
    }
  }
  func.func @test(%arg0: memref<256xf32>, %arg1: memref<256xf32>) -> memref<256xf32> {
    %memref = gpu.alloc  () : memref<256xf32>
    gpu.memcpy  %memref, %arg0 : memref<256xf32>, memref<256xf32>
    %memref_0 = gpu.alloc  () : memref<256xf32>
    gpu.memcpy  %memref_0, %arg1 : memref<256xf32>, memref<256xf32>
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    gpu.launch_func  @kernel::@subview blocks in (%c1, %c1, %c1) threads in (%c16, %c1, %c1)  args(%memref : memref<256xf32>, %memref_0 : memref<256xf32>)
    gpu.wait 
    gpu.memcpy  %arg1, %memref_0 : memref<256xf32>, memref<256xf32>
    gpu.dealloc  %memref : memref<256xf32>
    gpu.dealloc  %memref_0 : memref<256xf32>
    return %arg1 : memref<256xf32>
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c256 = arith.constant 256 : index
    %alloc = memref.alloc() : memref<256xf32>
    %alloc_0 = memref.alloc() : memref<256xf32>
    scf.for %arg0 = %c0 to %c256 step %c1 {
      %1 = arith.index_cast %arg0 : index to i32
      %2 = arith.sitofp %1 : i32 to f32
      memref.store %2, %alloc[%arg0] : memref<256xf32>
    }
    scf.for %arg0 = %c0 to %c256 step %c1 {
      %cst = arith.constant 0.000000e+00 : f32
      memref.store %cst, %alloc_0[%arg0] : memref<256xf32>
    }
    %0 = call @test(%alloc, %alloc_0) : (memref<256xf32>, memref<256xf32>) -> memref<256xf32>
    %cast = memref.cast %0 : memref<256xf32> to memref<*xf32>
    call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
    memref.dealloc %alloc : memref<256xf32>
    memref.dealloc %alloc_0 : memref<256xf32>
    return
  }
  func.func private @printMemrefF32(memref<*xf32>) attributes {llvm.emit_c_interface}
}

