module {
  func.func @permute(%arg0: index, %arg1: index, %arg2: index) {
    "abc"() : () -> ()
    affine.for %arg3 = 0 to %arg0 {
      affine.for %arg4 = 0 to %arg1 {
        affine.for %arg5 = 0 to %arg2 {
          "foo"(%arg3, %arg4) : (index, index) -> ()
          "bar"(%arg5) : (index) -> ()
        }
      }
    }
    "xyz"() : () -> ()
    return
  }
}

// -----
module {
  func.func @check_validity_with_iter_args(%arg0: index, %arg1: index, %arg2: index) {
    %alloc = memref.alloc() : memref<100x100xf32>
    %cst = arith.constant 1.000000e+00 : f32
    %c10 = arith.constant 10 : index
    %c20 = arith.constant 20 : index
    affine.for %arg3 = 0 to %arg0 {
      affine.for %arg4 = 0 to %arg1 {
        %0 = affine.for %arg5 = 0 to %arg2 iter_args(%arg6 = %cst) -> (f32) {
          %1 = affine.load %alloc[%arg3 + 10, %arg4 + 20] : memref<100x100xf32>
          %2 = arith.addf %1, %cst : f32
          affine.store %2, %alloc[%arg3 + 10, %arg4 + 20] : memref<100x100xf32>
          %3 = arith.addf %2, %arg6 : f32
          affine.yield %arg6 : f32
        }
      }
    }
    return
  }
}

