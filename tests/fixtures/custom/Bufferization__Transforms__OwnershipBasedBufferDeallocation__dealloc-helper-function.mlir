module {
  func.func @test(%arg0: index, %arg1: index) -> (memref<5xf32>, memref<5xf32>) {
    %alloc = memref.alloc() : memref<5xf32>
    %alloc_0 = memref.alloc() : memref<5xf32>
    %c1 = arith.constant 1 : index
    %0:2 = scf.for %arg2 = %arg0 to %arg1 step %c1 iter_args(%arg3 = %alloc, %arg4 = %alloc_0) -> (memref<5xf32>, memref<5xf32>) {
      scf.yield %arg4, %arg3 : memref<5xf32>, memref<5xf32>
    }
    return %0#0, %0#1 : memref<5xf32>, memref<5xf32>
  }
}

