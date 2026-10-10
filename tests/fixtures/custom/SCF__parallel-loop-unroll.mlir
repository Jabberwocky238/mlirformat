module {
  func.func @unroll_simple_parallel_loop(%arg0: memref<1x16x12xf32>, %arg1: memref<1x16x12xf32>) {
    %c12 = arith.constant 12 : index
    %c16 = arith.constant 16 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    scf.parallel (%arg2, %arg3, %arg4) = (%c0, %c0, %c0) to (%c1, %c16, %c12) step (%c1, %c1, %c1) {
      %0 = memref.load %arg0[%arg2, %arg3, %arg4] : memref<1x16x12xf32>
      memref.store %0, %arg1[%arg2, %arg3, %arg4] : memref<1x16x12xf32>
      scf.reduce 
    }
    return
  }
}

// -----
module {
  func.func @negative_unroll_factors_dont_divide_evenly(%arg0: memref<1x16x12xf32>, %arg1: memref<1x16x12xf32>) {
    %c12 = arith.constant 12 : index
    %c16 = arith.constant 16 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    scf.parallel (%arg2, %arg3, %arg4) = (%c0, %c0, %c0) to (%c1, %c16, %c12) step (%c1, %c1, %c1) {
      %0 = memref.load %arg0[%arg2, %arg3, %arg4] : memref<1x16x12xf32>
      memref.store %0, %arg1[%arg2, %arg3, %arg4] : memref<1x16x12xf32>
      scf.reduce 
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0 + (d1 floordiv 4) * 4)>
module {
  func.func @unroll_outer_nested_parallel_loop(%arg0: memref<5x16x12x4x4xf32>, %arg1: memref<5x16x12x4x4xf32>) {
    %c4 = arith.constant 4 : index
    %c12 = arith.constant 12 : index
    %c16 = arith.constant 16 : index
    %c5 = arith.constant 5 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    scf.parallel (%arg2, %arg3, %arg4) = (%c0, %c0, %c0) to (%c5, %c16, %c12) step (%c1, %c1, %c1) {
      scf.parallel (%arg5, %arg6) = (%c0, %c0) to (%c4, %c4) step (%c1, %c1) {
        %0 = affine.apply #map(%arg3, %arg5)
        %1 = affine.apply #map(%arg4, %arg6)
        %subview = memref.subview %arg0[%arg2, %0, %1, 0, 0] [1, 1, 1, 4, 4] [1, 1, 1, 1, 1] : memref<5x16x12x4x4xf32> to memref<4x4xf32, strided<[4, 1], offset: ?>>
        %subview_0 = memref.subview %arg1[%arg2, %0, %1, 0, 0] [1, 1, 1, 4, 4] [1, 1, 1, 1, 1] : memref<5x16x12x4x4xf32> to memref<4x4xf32, strided<[4, 1], offset: ?>>
        linalg.erf ins(%subview : memref<4x4xf32, strided<[4, 1], offset: ?>>) outs(%subview_0 : memref<4x4xf32, strided<[4, 1], offset: ?>>)
        scf.reduce 
      }
      scf.reduce 
    }
    return
  }
}

// -----
module {
  func.func @negative_unroll_dynamic_parallel_loop(%arg0: memref<1x16x12xf32>, %arg1: memref<1x16x12xf32>, %arg2: index) {
    %c12 = arith.constant 12 : index
    %c16 = arith.constant 16 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    scf.parallel (%arg3, %arg4, %arg5) = (%c0, %c0, %c0) to (%c1, %c16, %arg2) step (%c1, %c1, %c1) {
      %0 = memref.load %arg0[%arg3, %arg4, %arg5] : memref<1x16x12xf32>
      memref.store %0, %arg1[%arg3, %arg4, %arg5] : memref<1x16x12xf32>
      scf.reduce 
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0 + (d1 floordiv 4) * 4)>
module {
  func.func @unroll_inner_nested_parallel_loop(%arg0: memref<5x16x12x4x4xf32>, %arg1: memref<5x16x12x4x4xf32>) {
    %c4 = arith.constant 4 : index
    %c12 = arith.constant 12 : index
    %c16 = arith.constant 16 : index
    %c5 = arith.constant 5 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    scf.parallel (%arg2, %arg3, %arg4) = (%c0, %c0, %c0) to (%c5, %c16, %c12) step (%c1, %c1, %c1) {
      scf.parallel (%arg5, %arg6) = (%c0, %c0) to (%c4, %c4) step (%c1, %c1) {
        %0 = affine.apply #map(%arg3, %arg5)
        %1 = affine.apply #map(%arg4, %arg6)
        %subview = memref.subview %arg0[%arg2, %0, %1, 0, 0] [1, 1, 1, 4, 4] [1, 1, 1, 1, 1] : memref<5x16x12x4x4xf32> to memref<4x4xf32, strided<[4, 1], offset: ?>>
        %subview_0 = memref.subview %arg1[%arg2, %0, %1, 0, 0] [1, 1, 1, 4, 4] [1, 1, 1, 1, 1] : memref<5x16x12x4x4xf32> to memref<4x4xf32, strided<[4, 1], offset: ?>>
        linalg.erf ins(%subview : memref<4x4xf32, strided<[4, 1], offset: ?>>) outs(%subview_0 : memref<4x4xf32, strided<[4, 1], offset: ?>>)
        scf.reduce 
      }
      scf.reduce 
    }
    return
  }
}

