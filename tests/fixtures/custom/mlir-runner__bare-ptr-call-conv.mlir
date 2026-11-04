module {
  func.func @simple_add1_add2_test(%arg0: memref<2xf32>, %arg1: memref<2xf32>) {
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 1.000000e+00 : f32
    %cst_0 = arith.constant 2.000000e+00 : f32
    scf.for %arg2 = %c0 to %c2 step %c1 {
      %0 = memref.load %arg0[%arg2] : memref<2xf32>
      %1 = arith.addf %0, %cst : f32
      memref.store %1, %arg0[%arg2] : memref<2xf32>
      %2 = memref.load %arg1[%arg2] : memref<2xf32>
      %3 = arith.addf %1, %cst_0 : f32
      memref.store %3, %arg1[%arg2] : memref<2xf32>
    }
    return
  }
  func.func private @printF32(f32)
  func.func private @printComma()
  func.func private @printNewline()
  func.func @main() {
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 1.000000e+00 : f32
    %cst_0 = arith.constant 2.000000e+00 : f32
    %alloc = memref.alloc() : memref<2xf32>
    %alloc_1 = memref.alloc() : memref<2xf32>
    scf.for %arg0 = %c0 to %c2 step %c1 {
      memref.store %cst, %alloc[%arg0] : memref<2xf32>
      memref.store %cst, %alloc_1[%arg0] : memref<2xf32>
    }
    call @simple_add1_add2_test(%alloc, %alloc_1) : (memref<2xf32>, memref<2xf32>) -> ()
    %0 = memref.load %alloc[%c0] : memref<2xf32>
    call @printF32(%0) : (f32) -> ()
    call @printComma() : () -> ()
    %1 = memref.load %alloc[%c1] : memref<2xf32>
    call @printF32(%1) : (f32) -> ()
    call @printNewline() : () -> ()
    %2 = memref.load %alloc_1[%c0] : memref<2xf32>
    call @printF32(%2) : (f32) -> ()
    call @printComma() : () -> ()
    %3 = memref.load %alloc_1[%c1] : memref<2xf32>
    call @printF32(%3) : (f32) -> ()
    call @printNewline() : () -> ()
    memref.dealloc %alloc : memref<2xf32>
    memref.dealloc %alloc_1 : memref<2xf32>
    return
  }
}

