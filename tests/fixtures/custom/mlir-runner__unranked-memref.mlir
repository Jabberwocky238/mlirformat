module {
  func.func @main() {
    %alloc = memref.alloc() : memref<10x3xf32>
    %cst = arith.constant 2.000000e+00 : f32
    %cst_0 = arith.constant 5.000000e+00 : f32
    %cst_1 = arith.constant 1.000000e+01 : f32
    %cast = memref.cast %alloc : memref<10x3xf32> to memref<?x?xf32>
    linalg.fill ins(%cst_1 : f32) outs(%cast : memref<?x?xf32>)
    %cast_2 = memref.cast %alloc : memref<10x3xf32> to memref<*xf32>
    call @printMemrefF32(%cast_2) : (memref<*xf32>) -> ()
    %cast_3 = memref.cast %cast_2 : memref<*xf32> to memref<?x?xf32>
    linalg.fill ins(%cst_0 : f32) outs(%cast_3 : memref<?x?xf32>)
    %cast_4 = memref.cast %cast_3 : memref<?x?xf32> to memref<*xf32>
    call @printMemrefF32(%cast_4) : (memref<*xf32>) -> ()
    %cast_5 = memref.cast %cast_3 : memref<?x?xf32> to memref<*xf32>
    %cast_6 = memref.cast %cast_5 : memref<*xf32> to memref<?x?xf32>
    linalg.fill ins(%cst : f32) outs(%cast_6 : memref<?x?xf32>)
    %cast_7 = memref.cast %cast_3 : memref<?x?xf32> to memref<*xf32>
    call @printMemrefF32(%cast_7) : (memref<*xf32>) -> ()
    %c122_i8 = arith.constant 122 : i8
    %alloc_8 = memref.alloc() : memref<i8>
    memref.store %c122_i8, %alloc_8[] : memref<i8>
    %cast_9 = memref.cast %alloc_8 : memref<i8> to memref<*xi8>
    call @printMemrefI8(%cast_9) : (memref<*xi8>) -> ()
    memref.dealloc %cast_9 : memref<*xi8>
    memref.dealloc %alloc : memref<10x3xf32>
    call @return_var_memref_caller() : () -> ()
    call @return_two_var_memref_caller() : () -> ()
    call @dim_op_of_unranked() : () -> ()
    return
  }
  func.func private @printMemrefI8(memref<*xi8>) attributes {llvm.emit_c_interface}
  func.func private @printMemrefF32(memref<*xf32>) attributes {llvm.emit_c_interface}
  func.func @return_two_var_memref_caller() {
    %alloca = memref.alloca() : memref<4x3xf32>
    %cst = arith.constant 1.000000e+00 : f32
    linalg.fill ins(%cst : f32) outs(%alloca : memref<4x3xf32>)
    %0:2 = call @return_two_var_memref(%alloca) : (memref<4x3xf32>) -> (memref<*xf32>, memref<*xf32>)
    call @printMemrefF32(%0#0) : (memref<*xf32>) -> ()
    call @printMemrefF32(%0#1) : (memref<*xf32>) -> ()
    return
  }
  func.func @return_two_var_memref(%arg0: memref<4x3xf32>) -> (memref<*xf32>, memref<*xf32>) {
    %cast = memref.cast %arg0 : memref<4x3xf32> to memref<*xf32>
    return %cast, %cast : memref<*xf32>, memref<*xf32>
  }
  func.func @return_var_memref_caller() {
    %alloca = memref.alloca() : memref<4x3xf32>
    %cst = arith.constant 1.000000e+00 : f32
    linalg.fill ins(%cst : f32) outs(%alloca : memref<4x3xf32>)
    %0 = call @return_var_memref(%alloca) : (memref<4x3xf32>) -> memref<*xf32>
    call @printMemrefF32(%0) : (memref<*xf32>) -> ()
    return
  }
  func.func @return_var_memref(%arg0: memref<4x3xf32>) -> memref<*xf32> {
    %cast = memref.cast %arg0 : memref<4x3xf32> to memref<*xf32>
    return %cast : memref<*xf32>
  }
  func.func private @printU64(index)
  func.func private @printNewline()
  func.func @dim_op_of_unranked() {
    %alloca = memref.alloca() : memref<4x3xf32>
    %cast = memref.cast %alloca : memref<4x3xf32> to memref<*xf32>
    %c0 = arith.constant 0 : index
    %dim = memref.dim %cast, %c0 : memref<*xf32>
    call @printU64(%dim) : (index) -> ()
    call @printNewline() : () -> ()
    %c1 = arith.constant 1 : index
    %dim_0 = memref.dim %cast, %c1 : memref<*xf32>
    call @printU64(%dim_0) : (index) -> ()
    call @printNewline() : () -> ()
    return
  }
}

