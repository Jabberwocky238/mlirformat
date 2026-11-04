module {
  func.func @streaming_kernel_copy(%arg0: memref<?xi64>, %arg1: memref<?xi64>, %arg2: index) attributes {arm_streaming} {
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %vscale = vector.vscale
    %c2_vscale = arith.muli %c2, %vscale : index
    scf.for %arg3 = %c0 to %arg2 step %c2_vscale {
      %0 = vector.load %arg0[%arg3] : memref<?xi64>, vector<[2]xi64>
      vector.store %0, %arg1[%arg3] : memref<?xi64>, vector<[2]xi64>
    }
    return
  }
  func.func @entry() -> i32 {
    %c0_i64 = arith.constant 0 : i64
    %c0_i32 = arith.constant 0 : i32
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %c32 = arith.constant 32 : index
    %alloc = memref.alloc() : memref<32xi64>
    %alloc_0 = memref.alloc() : memref<32xi64>
    %cst = arith.constant dense<[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32]> : vector<32xi64>
    vector.transfer_write %cst, %alloc[%c0] : vector<32xi64>, memref<32xi64>
    %cast = memref.cast %alloc : memref<32xi64> to memref<?xi64>
    %cast_1 = memref.cast %alloc_0 : memref<32xi64> to memref<?xi64>
    call @streaming_kernel_copy(%cast, %cast_1, %c32) : (memref<?xi64>, memref<?xi64>, index) -> ()
    scf.for %arg0 = %c0 to %c32 step %c4 {
      %0 = vector.transfer_read %alloc_0[%arg0], %c0_i64 : memref<32xi64>, vector<4xi64>
      vector.print %0 : vector<4xi64>
    }
    memref.dealloc %alloc : memref<32xi64>
    memref.dealloc %alloc_0 : memref<32xi64>
    return %c0_i32 : i32
  }
}

