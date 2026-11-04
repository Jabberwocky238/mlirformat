module {
  func.func private @printMemrefF32(memref<*xf32>) attributes {llvm.emit_c_interface}
  func.func private @printMemrefI32(memref<*xi32>) attributes {llvm.emit_c_interface}
  func.func private @printNewline()
  memref.global "private" @gv0 : memref<4xf32> = dense<[0.000000e+00, 1.000000e+00, 2.000000e+00, 3.000000e+00]>
  func.func @test1DMemref() {
    %0 = memref.get_global @gv0 : memref<4xf32>
    %cast = memref.cast %0 : memref<4xf32> to memref<*xf32>
    call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
    call @printNewline() : () -> ()
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %cst = arith.constant 4.000000e+00 : f32
    %cst_0 = arith.constant 5.000000e+00 : f32
    memref.store %cst, %0[%c0] : memref<4xf32>
    memref.store %cst_0, %0[%c2] : memref<4xf32>
    call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
    call @printNewline() : () -> ()
    return
  }
  memref.global constant @gv1 : memref<3x2xi32> = dense<[[0, 1], [2, 3], [4, 5]]>
  func.func @testConstantMemref() {
    %0 = memref.get_global @gv1 : memref<3x2xi32>
    %cast = memref.cast %0 : memref<3x2xi32> to memref<*xi32>
    call @printMemrefI32(%cast) : (memref<*xi32>) -> ()
    call @printNewline() : () -> ()
    return
  }
  memref.global "private" @gv2 : memref<4x2xf32> = dense<[[0.000000e+00, 1.000000e+00], [2.000000e+00, 3.000000e+00], [4.000000e+00, 5.000000e+00], [6.000000e+00, 7.000000e+00]]>
  func.func @test2DMemref() {
    %0 = memref.get_global @gv2 : memref<4x2xf32>
    %cast = memref.cast %0 : memref<4x2xf32> to memref<*xf32>
    call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
    call @printNewline() : () -> ()
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 1.000000e+01 : f32
    memref.store %cst, %0[%c0, %c1] : memref<4x2xf32>
    call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
    call @printNewline() : () -> ()
    return
  }
  memref.global @gv3 : memref<i32> = dense<11>
  func.func @testScalarMemref() {
    %0 = memref.get_global @gv3 : memref<i32>
    %cast = memref.cast %0 : memref<i32> to memref<*xi32>
    call @printMemrefI32(%cast) : (memref<*xi32>) -> ()
    call @printNewline() : () -> ()
    return
  }
  func.func @main() {
    call @test1DMemref() : () -> ()
    call @testConstantMemref() : () -> ()
    call @test2DMemref() : () -> ()
    call @testScalarMemref() : () -> ()
    return
  }
}

