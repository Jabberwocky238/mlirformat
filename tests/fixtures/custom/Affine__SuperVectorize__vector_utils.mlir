module {
  func.func @vector_add_2d(%arg0: index, %arg1: index) -> f32 {
    %alloc = memref.alloc(%arg0, %arg1) : memref<?x?xf32>
    %alloc_0 = memref.alloc(%arg0, %arg1) : memref<?x?xf32>
    %alloc_1 = memref.alloc(%arg0, %arg1) : memref<?x?xf32>
    %c0 = arith.constant 0 : index
    %cst = arith.constant 1.000000e+00 : f32
    %cst_2 = arith.constant dense<1.000000e+00> : vector<8x256xf32>
    %cst_3 = arith.constant dense<1.000000e+00> : vector<1x3x7x8x8xf32>
    %cst_4 = arith.constant dense<1.000000e+00> : vector<1x3x7x4x4xf32>
    %cst_5 = arith.constant dense<1.000000e+00> : vector<3x4x5x8xf32>
    %cst_6 = arith.constant dense<1.000000e+00> : vector<3x4x4x8xf32>
    %cst_7 = arith.constant dense<1.000000e+00> : vector<1x2x10x32xf32>
    %c7 = arith.constant 7 : index
    %c42 = arith.constant 42 : index
    %0 = memref.load %alloc_1[%c7, %c42] : memref<?x?xf32>
    return %0 : f32
  }
  func.func @double_loop_nest(%arg0: memref<20x30xf32>, %arg1: memref<20xf32>) {
    affine.for %arg2 = 0 to 20 {
      %0 = affine.load %arg1[%arg2] : memref<20xf32>
      affine.for %arg3 = 0 to 30 {
        %1 = affine.load %arg0[%arg2, %arg3] : memref<20x30xf32>
        affine.store %1, %arg0[%arg2, %arg3] : memref<20x30xf32>
      }
      affine.store %0, %arg1[%arg2] : memref<20xf32>
    }
    return
  }
}

