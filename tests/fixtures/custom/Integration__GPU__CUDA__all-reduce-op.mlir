module {
  func.func @main() {
    %alloc = memref.alloc() : memref<2x4x13xf32>
    %cast = memref.cast %alloc : memref<2x4x13xf32> to memref<?x?x?xf32>
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = memref.dim %cast, %c2 : memref<?x?x?xf32>
    %dim_0 = memref.dim %cast, %c1 : memref<?x?x?xf32>
    %dim_1 = memref.dim %cast, %c0 : memref<?x?x?xf32>
    %cast_2 = memref.cast %cast : memref<?x?x?xf32> to memref<*xf32>
    gpu.host_register %cast_2 : memref<*xf32>
    gpu.launch blocks(%arg0, %arg1, %arg2) in (%arg6 = %c1, %arg7 = %c1, %arg8 = %c1) threads(%arg3, %arg4, %arg5) in (%arg9 = %dim, %arg10 = %dim_0, %arg11 = %dim_1) {
      %0 = arith.muli %arg5, %arg10 : index
      %1 = arith.addi %arg4, %0 : index
      %2 = arith.muli %1, %arg9 : index
      %3 = arith.addi %arg3, %2 : index
      %4 = arith.index_cast %3 : index to i32
      %5 = arith.sitofp %4 : i32 to f32
      %6 = gpu.all_reduce add %5 uniform {
      } : (f32) -> f32
      memref.store %6, %cast[%arg5, %arg4, %arg3] : memref<?x?x?xf32>
      gpu.terminator
    }
    call @printMemrefF32(%cast_2) : (memref<*xf32>) -> ()
    return
  }
  func.func private @printMemrefF32(memref<*xf32>)
}

