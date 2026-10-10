module {
  func.func @slice_depth1_loop_nest() {
    %alloc = memref.alloc() : memref<100xf32>
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg0 = 0 to 16 {
      affine.store %cst, %alloc[%arg0] : memref<100xf32>
    }
    affine.for %arg0 = 0 to 5 {
      %0 = affine.load %alloc[%arg0] : memref<100xf32>
      "prevent.dce"(%0) : (f32) -> ()
    }
    return
  }
}

// -----
module {
  func.func @should_fuse_reduction_to_pointwise() {
    %alloc = memref.alloc() : memref<10x10xf32>
    %alloc_0 = memref.alloc() : memref<10xf32>
    %alloc_1 = memref.alloc() : memref<10xf32>
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg0 = 0 to 10 {
      affine.for %arg1 = 0 to 10 {
        %0 = affine.load %alloc_0[%arg0] : memref<10xf32>
        %1 = affine.load %alloc[%arg0, %arg1] : memref<10x10xf32>
        %2 = arith.addf %0, %1 : f32
        affine.store %2, %alloc_0[%arg0] : memref<10xf32>
      }
    }
    affine.for %arg0 = 0 to 10 {
      %0 = affine.load %alloc_0[%arg0] : memref<10xf32>
      affine.store %0, %alloc_1[%arg0] : memref<10xf32>
    }
    return
  }
}

// -----
module {
  func.func @should_fuse_avoiding_dependence_cycle() {
    %alloc = memref.alloc() : memref<10xf32>
    %alloc_0 = memref.alloc() : memref<10xf32>
    %alloc_1 = memref.alloc() : memref<10xf32>
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg0 = 0 to 10 {
      %0 = affine.load %alloc[%arg0] : memref<10xf32>
      affine.store %0, %alloc_0[%arg0] : memref<10xf32>
    }
    affine.for %arg0 = 0 to 10 {
      affine.store %cst, %alloc[%arg0] : memref<10xf32>
      %0 = affine.load %alloc_1[%arg0] : memref<10xf32>
      "prevent.dce"(%0) : (f32) -> ()
    }
    affine.for %arg0 = 0 to 10 {
      %0 = affine.load %alloc_0[%arg0] : memref<10xf32>
      affine.store %0, %alloc_1[%arg0] : memref<10xf32>
    }
    return
  }
}

