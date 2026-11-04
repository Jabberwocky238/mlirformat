module {
  func.func @print_0d() {
    %cst = arith.constant 2.000000e+00 : f32
    %alloc = memref.alloc() : memref<f32>
    memref.store %cst, %alloc[] : memref<f32>
    %cast = memref.cast %alloc : memref<f32> to memref<*xf32>
    call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
    memref.dealloc %alloc : memref<f32>
    return
  }
  func.func @print_1d() {
    %cst = arith.constant 2.000000e+00 : f32
    %alloc = memref.alloc() : memref<16xf32>
    %cast = memref.cast %alloc : memref<16xf32> to memref<?xf32>
    linalg.fill ins(%cst : f32) outs(%cast : memref<?xf32>)
    %cast_0 = memref.cast %cast : memref<?xf32> to memref<*xf32>
    call @printMemrefF32(%cast_0) : (memref<*xf32>) -> ()
    memref.dealloc %alloc : memref<16xf32>
    return
  }
  func.func @print_3d() {
    %cst = arith.constant 2.000000e+00 : f32
    %cst_0 = arith.constant 4.000000e+00 : f32
    %alloc = memref.alloc() : memref<3x4x5xf32>
    %cast = memref.cast %alloc : memref<3x4x5xf32> to memref<?x?x?xf32>
    linalg.fill ins(%cst : f32) outs(%cast : memref<?x?x?xf32>)
    %c2 = arith.constant 2 : index
    memref.store %cst_0, %cast[%c2, %c2, %c2] : memref<?x?x?xf32>
    %cast_1 = memref.cast %cast : memref<?x?x?xf32> to memref<*xf32>
    call @printMemrefF32(%cast_1) : (memref<*xf32>) -> ()
    memref.dealloc %alloc : memref<3x4x5xf32>
    return
  }
  func.func private @printMemrefF32(memref<*xf32>) attributes {llvm.emit_c_interface}
  func.func @vector_splat_2d() {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 1.000000e+01 : f32
    %0 = vector.broadcast %cst : f32 to vector<4x4xf32>
    %alloc = memref.alloc() : memref<1x1xvector<4x4xf32>>
    memref.store %0, %alloc[%c0, %c0] : memref<1x1xvector<4x4xf32>>
    %cast = memref.cast %alloc : memref<1x1xvector<4x4xf32>> to memref<?x?xvector<4x4xf32>>
    call @printMemrefVector4x4xf32(%cast) : (memref<?x?xvector<4x4xf32>>) -> ()
    memref.dealloc %alloc : memref<1x1xvector<4x4xf32>>
    return
  }
  func.func private @printMemrefVector4x4xf32(memref<?x?xvector<4x4xf32>>) attributes {llvm.emit_c_interface}
}

