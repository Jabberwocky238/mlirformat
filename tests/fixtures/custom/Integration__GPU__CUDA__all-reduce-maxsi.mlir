module {
  func.func @main() {
    %alloc = memref.alloc() : memref<2x6xi32>
    %alloc_0 = memref.alloc() : memref<2xi32>
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    %c2_i32 = arith.constant 2 : i32
    %c4_i32 = arith.constant 4 : i32
    %c8_i32 = arith.constant 8 : i32
    %c16_i32 = arith.constant 16 : i32
    %c3_i32 = arith.constant 3 : i32
    %c6_i32 = arith.constant 6 : i32
    %c7_i32 = arith.constant 7 : i32
    %c10_i32 = arith.constant 10 : i32
    %c11_i32 = arith.constant 11 : i32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c4 = arith.constant 4 : index
    %c5 = arith.constant 5 : index
    %c6 = arith.constant 6 : index
    %cast = memref.cast %alloc : memref<2x6xi32> to memref<*xi32>
    gpu.host_register %cast : memref<*xi32>
    %cast_1 = memref.cast %alloc_0 : memref<2xi32> to memref<*xi32>
    gpu.host_register %cast_1 : memref<*xi32>
    memref.store %c0_i32, %alloc[%c0, %c0] : memref<2x6xi32>
    memref.store %c1_i32, %alloc[%c0, %c1] : memref<2x6xi32>
    memref.store %c2_i32, %alloc[%c0, %c2] : memref<2x6xi32>
    memref.store %c4_i32, %alloc[%c0, %c3] : memref<2x6xi32>
    memref.store %c8_i32, %alloc[%c0, %c4] : memref<2x6xi32>
    memref.store %c16_i32, %alloc[%c0, %c5] : memref<2x6xi32>
    memref.store %c2_i32, %alloc[%c1, %c0] : memref<2x6xi32>
    memref.store %c3_i32, %alloc[%c1, %c1] : memref<2x6xi32>
    memref.store %c6_i32, %alloc[%c1, %c2] : memref<2x6xi32>
    memref.store %c7_i32, %alloc[%c1, %c3] : memref<2x6xi32>
    memref.store %c10_i32, %alloc[%c1, %c4] : memref<2x6xi32>
    memref.store %c11_i32, %alloc[%c1, %c5] : memref<2x6xi32>
    gpu.launch blocks(%arg0, %arg1, %arg2) in (%arg6 = %c2, %arg7 = %c1, %arg8 = %c1) threads(%arg3, %arg4, %arg5) in (%arg9 = %c6, %arg10 = %c1, %arg11 = %c1) {
      %0 = memref.load %alloc[%arg0, %arg3] : memref<2x6xi32>
      %1 = gpu.all_reduce  maxsi %0 uniform {
      } : (i32) -> i32
      memref.store %1, %alloc_0[%arg0] : memref<2xi32>
      gpu.terminator
    }
    call @printMemrefI32(%cast_1) : (memref<*xi32>) -> ()
    return
  }
  func.func private @printMemrefI32(memref<*xi32>)
}

