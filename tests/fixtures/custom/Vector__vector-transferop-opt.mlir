#map = affine_map<(d0) -> (d0 + 3)>
#map1 = affine_map<(d0) -> (d0 + 1)>
#map2 = affine_map<(d0) -> (d0 + 4)>
module {
  func.func @forward_dead_store(%arg0: i1, %arg1: memref<4x4xf32>, %arg2: vector<1x4xf32>, %arg3: vector<1x4xf32>, %arg4: index) {
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    vector.transfer_write %arg2, %arg1[%c1, %c0] {in_bounds = [true, true]} : vector<1x4xf32>, memref<4x4xf32>
    %0 = vector.transfer_read %arg1[%c1, %c0], %cst {in_bounds = [true, true]} : memref<4x4xf32>, vector<1x4xf32>
    %1 = scf.for %arg5 = %c0 to %c4 step %c1 iter_args(%arg6 = %0) -> (vector<1x4xf32>) {
      %2 = arith.addf %arg6, %arg6 : vector<1x4xf32>
      scf.yield %2 : vector<1x4xf32>
    }
    vector.transfer_write %1, %arg1[%c1, %c0] {in_bounds = [true, true]} : vector<1x4xf32>, memref<4x4xf32>
    return
  }
  func.func @forward_nested(%arg0: i1, %arg1: memref<4x4xf32>, %arg2: vector<1x4xf32>, %arg3: vector<1x4xf32>, %arg4: index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0.000000e+00 : f32
    vector.transfer_write %arg3, %arg1[%arg4, %c0] {in_bounds = [true, true]} : vector<1x4xf32>, memref<4x4xf32>
    vector.transfer_write %arg2, %arg1[%c1, %c0] {in_bounds = [true, true]} : vector<1x4xf32>, memref<4x4xf32>
    %0 = scf.if %arg0 -> (vector<1x4xf32>) {
      %1 = vector.transfer_read %arg1[%c1, %c0], %cst {in_bounds = [true, true]} : memref<4x4xf32>, vector<1x4xf32>
      scf.yield %1 : vector<1x4xf32>
    } else {
      scf.yield %arg3 : vector<1x4xf32>
    }
    vector.transfer_write %0, %arg1[%c0, %c0] {in_bounds = [true, true]} : vector<1x4xf32>, memref<4x4xf32>
    return
  }
  func.func @forward_nested_negative(%arg0: i1, %arg1: memref<4x4xf32>, %arg2: vector<1x4xf32>, %arg3: vector<1x4xf32>, %arg4: index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0.000000e+00 : f32
    vector.transfer_write %arg2, %arg1[%c1, %c0] {in_bounds = [true, true]} : vector<1x4xf32>, memref<4x4xf32>
    %0 = scf.if %arg0 -> (vector<1x4xf32>) {
      %1 = vector.transfer_read %arg1[%c1, %c0], %cst {in_bounds = [true, true]} : memref<4x4xf32>, vector<1x4xf32>
      scf.yield %1 : vector<1x4xf32>
    } else {
      vector.transfer_write %arg3, %arg1[%arg4, %c0] {in_bounds = [true, true]} : vector<1x4xf32>, memref<4x4xf32>
      scf.yield %arg3 : vector<1x4xf32>
    }
    vector.transfer_write %0, %arg1[%c0, %arg4] {in_bounds = [true, true]} : vector<1x4xf32>, memref<4x4xf32>
    return
  }
  func.func @dead_store_region(%arg0: i1, %arg1: memref<4x4xf32>, %arg2: vector<1x4xf32>, %arg3: vector<1x4xf32>, %arg4: index) -> vector<1x4xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0.000000e+00 : f32
    vector.transfer_write %arg2, %arg1[%c1, %c0] {in_bounds = [true, true]} : vector<1x4xf32>, memref<4x4xf32>
    %0 = scf.if %arg0 -> (vector<1x4xf32>) {
      scf.yield %arg3 : vector<1x4xf32>
    } else {
      %2 = vector.transfer_read %arg1[%arg4, %c0], %cst {in_bounds = [true, true]} : memref<4x4xf32>, vector<1x4xf32>
      scf.yield %2 : vector<1x4xf32>
    }
    scf.if %arg0 {
      vector.transfer_write %arg2, %arg1[%c1, %c0] {in_bounds = [true, true]} : vector<1x4xf32>, memref<4x4xf32>
    }
    vector.transfer_write %0, %arg1[%c1, %c0] {in_bounds = [true, true]} : vector<1x4xf32>, memref<4x4xf32>
    vector.transfer_write %0, %arg1[%c1, %c0] {in_bounds = [true, true]} : vector<1x4xf32>, memref<4x4xf32>
    %1 = vector.transfer_read %arg1[%arg4, %c0], %cst {in_bounds = [true, true]} : memref<4x4xf32>, vector<1x4xf32>
    return %1 : vector<1x4xf32>
  }
  func.func @dead_store_negative(%arg0: i1, %arg1: memref<4x4xf32>, %arg2: vector<1x4xf32>, %arg3: vector<1x4xf32>, %arg4: index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = scf.if %arg0 -> (vector<1x4xf32>) {
      vector.transfer_write %arg2, %arg1[%c1, %c0] {in_bounds = [true, true]} : vector<1x4xf32>, memref<4x4xf32>
      %1 = vector.transfer_read %arg1[%arg4, %c0], %cst {in_bounds = [true, true]} : memref<4x4xf32>, vector<1x4xf32>
      scf.yield %1 : vector<1x4xf32>
    } else {
      scf.yield %arg3 : vector<1x4xf32>
    }
    vector.transfer_write %0, %arg1[%c1, %c0] {in_bounds = [true, true]} : vector<1x4xf32>, memref<4x4xf32>
    return
  }
  func.func @dead_store_nested_region(%arg0: i1, %arg1: i1, %arg2: memref<4x4xf32>, %arg3: vector<1x4xf32>, %arg4: vector<1x4xf32>, %arg5: index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0.000000e+00 : f32
    scf.if %arg0 {
      %0 = vector.transfer_read %arg2[%arg5, %c0], %cst {in_bounds = [true, true]} : memref<4x4xf32>, vector<1x4xf32>
      scf.if %arg1 {
        vector.transfer_write %arg4, %arg2[%c1, %c0] {in_bounds = [true, true]} : vector<1x4xf32>, memref<4x4xf32>
      }
      vector.transfer_write %arg3, %arg2[%c1, %c0] {in_bounds = [true, true]} : vector<1x4xf32>, memref<4x4xf32>
    }
    return
  }
  func.func @forward_dead_store_negative(%arg0: i1, %arg1: memref<4x4xf32>, %arg2: vector<1x4xf32>, %arg3: vector<1x1xf32>, %arg4: vector<1x4xf32>, %arg5: index) -> vector<1x4xf32> {
    %subview = memref.subview %arg1[0, 0] [2, 2] [1, 1] : memref<4x4xf32> to memref<2x2xf32, strided<[4, 1]>>
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    vector.transfer_write %arg2, %arg1[%c1, %c0] {in_bounds = [true, true]} : vector<1x4xf32>, memref<4x4xf32>
    vector.transfer_write %arg3, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x1xf32>, memref<2x2xf32, strided<[4, 1]>>
    vector.transfer_write %arg4, %arg1[%c1, %c0] {in_bounds = [true, true]} : vector<1x4xf32>, memref<4x4xf32>
    vector.transfer_write %arg3, %subview[%c1, %c0] {in_bounds = [true, true]} : vector<1x1xf32>, memref<2x2xf32, strided<[4, 1]>>
    %0 = vector.transfer_read %arg1[%c1, %c0], %cst {in_bounds = [true, true]} : memref<4x4xf32>, vector<1x4xf32>
    vector.transfer_write %arg4, %arg1[%c1, %c0] {in_bounds = [true, true]} : vector<1x4xf32>, memref<4x4xf32>
    return %0 : vector<1x4xf32>
  }
  func.func @collapse_shape_and_read_from_source(%arg0: memref<1x20x1xi32>, %arg1: vector<4xi32>) {
    %c0_i32 = arith.constant 0 : i32
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %c20 = arith.constant 20 : index
    %alloca = memref.alloca() {alignment = 64 : i64} : memref<1x4x1xi32>
    %collapse_shape = memref.collapse_shape %alloca [[0, 1, 2]] : memref<1x4x1xi32> into memref<4xi32>
    scf.for %arg2 = %c0 to %c20 step %c4 {
      %subview = memref.subview %arg0[0, %arg2, 0] [1, 4, 1] [1, 1, 1] : memref<1x20x1xi32> to memref<1x4x1xi32, strided<[20, 1, 1], offset: ?>>
      %0 = vector.transfer_read %subview[%c0, %c0, %c0], %c0_i32 {in_bounds = [true, true, true]} : memref<1x4x1xi32, strided<[20, 1, 1], offset: ?>>, vector<1x4x1xi32>
      vector.transfer_write %0, %alloca[%c0, %c0, %c0] {in_bounds = [true, true, true]} : vector<1x4x1xi32>, memref<1x4x1xi32>
      vector.transfer_write %arg1, %collapse_shape[%c0] {in_bounds = [true]} : vector<4xi32>, memref<4xi32>
      %1 = vector.transfer_read %alloca[%c0, %c0, %c0], %c0_i32 {in_bounds = [true, true, true]} : memref<1x4x1xi32>, vector<1x4x1xi32>
      vector.transfer_write %1, %subview[%c0, %c0, %c0] {in_bounds = [true, true, true]} : vector<1x4x1xi32>, memref<1x4x1xi32, strided<[20, 1, 1], offset: ?>>
    }
    return
  }
  func.func @expand_shape_and_read_from_source(%arg0: memref<20xi32>, %arg1: vector<1x4x1xi32>) {
    %c0_i32 = arith.constant 0 : i32
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %c20 = arith.constant 20 : index
    %alloca = memref.alloca() {alignment = 64 : i64} : memref<4xi32>
    %expand_shape = memref.expand_shape %alloca [[0, 1, 2]] output_shape [1, 4, 1] : memref<4xi32> into memref<1x4x1xi32>
    scf.for %arg2 = %c0 to %c20 step %c4 {
      %subview = memref.subview %arg0[%arg2] [4] [1] : memref<20xi32> to memref<4xi32, strided<[1], offset: ?>>
      %0 = vector.transfer_read %subview[%c0], %c0_i32 {in_bounds = [true]} : memref<4xi32, strided<[1], offset: ?>>, vector<4xi32>
      vector.transfer_write %0, %alloca[%c0] {in_bounds = [true]} : vector<4xi32>, memref<4xi32>
      vector.transfer_write %arg1, %expand_shape[%c0, %c0, %c0] {in_bounds = [true, true, true]} : vector<1x4x1xi32>, memref<1x4x1xi32>
      %1 = vector.transfer_read %alloca[%c0], %c0_i32 {in_bounds = [true]} : memref<4xi32>, vector<4xi32>
      vector.transfer_write %1, %subview[%c0] {in_bounds = [true]} : vector<4xi32>, memref<4xi32, strided<[1], offset: ?>>
    }
    return
  }
  func.func @collapse_shape_and_read_from_collapse(%arg0: memref<20xi32>, %arg1: vector<1x4x1xi32>) {
    %c0_i32 = arith.constant 0 : i32
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %c20 = arith.constant 20 : index
    %alloca = memref.alloca() {alignment = 64 : i64} : memref<1x4x1xi32>
    %collapse_shape = memref.collapse_shape %alloca [[0, 1, 2]] : memref<1x4x1xi32> into memref<4xi32>
    scf.for %arg2 = %c0 to %c20 step %c4 {
      %subview = memref.subview %arg0[%arg2] [4] [1] : memref<20xi32> to memref<4xi32, strided<[1], offset: ?>>
      %0 = vector.transfer_read %subview[%c0], %c0_i32 {in_bounds = [true]} : memref<4xi32, strided<[1], offset: ?>>, vector<4xi32>
      vector.transfer_write %0, %collapse_shape[%c0] {in_bounds = [true]} : vector<4xi32>, memref<4xi32>
      vector.transfer_write %arg1, %alloca[%c0, %c0, %c0] {in_bounds = [true, true, true]} : vector<1x4x1xi32>, memref<1x4x1xi32>
      %1 = vector.transfer_read %collapse_shape[%c0], %c0_i32 {in_bounds = [true]} : memref<4xi32>, vector<4xi32>
      vector.transfer_write %1, %subview[%c0] {in_bounds = [true]} : vector<4xi32>, memref<4xi32, strided<[1], offset: ?>>
    }
    return
  }
  func.func @expand_shape_and_read_from_expand(%arg0: memref<1x20x1xi32>, %arg1: vector<4xi32>) {
    %c0_i32 = arith.constant 0 : i32
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %c20 = arith.constant 20 : index
    %alloca = memref.alloca() {alignment = 64 : i64} : memref<4xi32>
    %expand_shape = memref.expand_shape %alloca [[0, 1, 2]] output_shape [1, 4, 1] : memref<4xi32> into memref<1x4x1xi32>
    scf.for %arg2 = %c0 to %c20 step %c4 {
      %subview = memref.subview %arg0[0, %arg2, 0] [1, 4, 1] [1, 1, 1] : memref<1x20x1xi32> to memref<1x4x1xi32, strided<[20, 1, 1], offset: ?>>
      %0 = vector.transfer_read %subview[%c0, %c0, %c0], %c0_i32 {in_bounds = [true, true, true]} : memref<1x4x1xi32, strided<[20, 1, 1], offset: ?>>, vector<1x4x1xi32>
      vector.transfer_write %0, %expand_shape[%c0, %c0, %c0] {in_bounds = [true, true, true]} : vector<1x4x1xi32>, memref<1x4x1xi32>
      vector.transfer_write %arg1, %alloca[%c0] {in_bounds = [true]} : vector<4xi32>, memref<4xi32>
      %1 = vector.transfer_read %expand_shape[%c0, %c0, %c0], %c0_i32 {in_bounds = [true, true, true]} : memref<1x4x1xi32>, vector<1x4x1xi32>
      vector.transfer_write %1, %subview[%c0, %c0, %c0] {in_bounds = [true, true, true]} : vector<1x4x1xi32>, memref<1x4x1xi32, strided<[20, 1, 1], offset: ?>>
    }
    return
  }
  func.func @forward_dead_store_dynamic_same_index(%arg0: memref<?x?xf32>, %arg1: vector<4xf32>, %arg2: vector<4xf32>, %arg3: index) {
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    vector.transfer_write %arg1, %arg0[%arg3, %arg3] {in_bounds = [true]} : vector<4xf32>, memref<?x?xf32>
    %0 = vector.transfer_read %arg0[%arg3, %arg3], %cst {in_bounds = [true]} : memref<?x?xf32>, vector<4xf32>
    %1 = scf.for %arg4 = %c0 to %c4 step %c1 iter_args(%arg5 = %0) -> (vector<4xf32>) {
      %2 = arith.addf %arg5, %arg5 : vector<4xf32>
      scf.yield %2 : vector<4xf32>
    }
    vector.transfer_write %1, %arg0[%arg3, %arg3] {in_bounds = [true]} : vector<4xf32>, memref<?x?xf32>
    return
  }
  func.func @dont_forward_dead_store_dynamic_overlap(%arg0: memref<?x?xf32>, %arg1: vector<4xf32>, %arg2: vector<4xf32>, %arg3: index) {
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = affine.apply #map(%arg3)
    vector.transfer_write %arg1, %arg0[%arg3, %arg3] {in_bounds = [true]} : vector<4xf32>, memref<?x?xf32>
    vector.transfer_write %arg1, %arg0[%arg3, %0] {in_bounds = [true]} : vector<4xf32>, memref<?x?xf32>
    %1 = vector.transfer_read %arg0[%arg3, %arg3], %cst {in_bounds = [true]} : memref<?x?xf32>, vector<4xf32>
    %2 = scf.for %arg4 = %c0 to %c4 step %c1 iter_args(%arg5 = %1) -> (vector<4xf32>) {
      %3 = arith.addf %arg5, %arg5 : vector<4xf32>
      scf.yield %3 : vector<4xf32>
    }
    vector.transfer_write %2, %arg0[%arg3, %arg3] {in_bounds = [true]} : vector<4xf32>, memref<?x?xf32>
    return
  }
  func.func @forward_dead_store_dynamic_non_overlap_leading_dim(%arg0: memref<?x?xf32>, %arg1: vector<4xf32>, %arg2: vector<4xf32>, %arg3: index) {
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = affine.apply #map1(%arg3)
    vector.transfer_write %arg1, %arg0[%arg3, %arg3] {in_bounds = [true]} : vector<4xf32>, memref<?x?xf32>
    vector.transfer_write %arg1, %arg0[%0, %arg3] {in_bounds = [true]} : vector<4xf32>, memref<?x?xf32>
    %1 = vector.transfer_read %arg0[%arg3, %arg3], %cst {in_bounds = [true]} : memref<?x?xf32>, vector<4xf32>
    %2 = scf.for %arg4 = %c0 to %c4 step %c1 iter_args(%arg5 = %1) -> (vector<4xf32>) {
      %3 = arith.addf %arg5, %arg5 : vector<4xf32>
      scf.yield %3 : vector<4xf32>
    }
    vector.transfer_write %2, %arg0[%arg3, %arg3] {in_bounds = [true]} : vector<4xf32>, memref<?x?xf32>
    return
  }
  func.func @forward_dead_store_dynamic_non_overlap_trailing_dim(%arg0: memref<?x?xf32>, %arg1: vector<4xf32>, %arg2: vector<4xf32>, %arg3: index) {
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = affine.apply #map2(%arg3)
    vector.transfer_write %arg1, %arg0[%arg3, %arg3] {in_bounds = [true]} : vector<4xf32>, memref<?x?xf32>
    vector.transfer_write %arg1, %arg0[%arg3, %0] {in_bounds = [true]} : vector<4xf32>, memref<?x?xf32>
    %1 = vector.transfer_read %arg0[%arg3, %arg3], %cst {in_bounds = [true]} : memref<?x?xf32>, vector<4xf32>
    %2 = scf.for %arg4 = %c0 to %c4 step %c1 iter_args(%arg5 = %1) -> (vector<4xf32>) {
      %3 = arith.addf %arg5, %arg5 : vector<4xf32>
      scf.yield %3 : vector<4xf32>
    }
    vector.transfer_write %2, %arg0[%arg3, %arg3] {in_bounds = [true]} : vector<4xf32>, memref<?x?xf32>
    return
  }
  func.func @forward_dead_constant_splat_store_with_masking(%arg0: memref<?x?xf32>, %arg1: vector<[8]x[8]xi1>) {
    %cst = arith.constant dense<0.000000e+00> : vector<[8]x[8]xf32>
    %cst_0 = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %c512 = arith.constant 512 : index
    vector.transfer_write %cst, %arg0[%c0, %c0], %arg1 {in_bounds = [true, true]} : vector<[8]x[8]xf32>, memref<?x?xf32>
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst_0, %arg1 {in_bounds = [true, true]} : memref<?x?xf32>, vector<[8]x[8]xf32>
    %1 = scf.for %arg2 = %c0 to %c512 step %c1 iter_args(%arg3 = %0) -> (vector<[8]x[8]xf32>) {
      %2 = arith.addf %arg3, %arg3 : vector<[8]x[8]xf32>
      scf.yield %2 : vector<[8]x[8]xf32>
    }
    vector.transfer_write %1, %arg0[%c0, %c0], %arg1 {in_bounds = [true, true]} : vector<[8]x[8]xf32>, memref<?x?xf32>
    return
  }
  func.func @forward_dead_constant_splat_store_with_masking_unmasked_write(%arg0: memref<?x?xf32>, %arg1: vector<[8]x[8]xi1>) {
    %cst = arith.constant dense<0.000000e+00> : vector<[8]x[8]xf32>
    %cst_0 = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %c512 = arith.constant 512 : index
    vector.transfer_write %cst, %arg0[%c0, %c0] {in_bounds = [true, true]} : vector<[8]x[8]xf32>, memref<?x?xf32>
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst_0, %arg1 {in_bounds = [true, true]} : memref<?x?xf32>, vector<[8]x[8]xf32>
    %1 = scf.for %arg2 = %c0 to %c512 step %c1 iter_args(%arg3 = %0) -> (vector<[8]x[8]xf32>) {
      %2 = arith.addf %arg3, %arg3 : vector<[8]x[8]xf32>
      scf.yield %2 : vector<[8]x[8]xf32>
    }
    vector.transfer_write %1, %arg0[%c0, %c0], %arg1 {in_bounds = [true, true]} : vector<[8]x[8]xf32>, memref<?x?xf32>
    return
  }
  func.func @forward_dead_constant_splat_store_with_masking_negative_0(%arg0: memref<?x?xf32>, %arg1: vector<[8]x[8]xi1>) {
    %cst = arith.constant dense<0.000000e+00> : vector<[8]x[8]xf32>
    %cst_0 = arith.constant 1.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %c512 = arith.constant 512 : index
    vector.transfer_write %cst, %arg0[%c0, %c0], %arg1 {in_bounds = [true, true]} : vector<[8]x[8]xf32>, memref<?x?xf32>
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst_0, %arg1 {in_bounds = [true, true]} : memref<?x?xf32>, vector<[8]x[8]xf32>
    %1 = scf.for %arg2 = %c0 to %c512 step %c1 iter_args(%arg3 = %0) -> (vector<[8]x[8]xf32>) {
      %2 = arith.addf %arg3, %arg3 : vector<[8]x[8]xf32>
      scf.yield %2 : vector<[8]x[8]xf32>
    }
    vector.transfer_write %1, %arg0[%c0, %c0], %arg1 {in_bounds = [true, true]} : vector<[8]x[8]xf32>, memref<?x?xf32>
    return
  }
  func.func @forward_dead_constant_splat_store_with_masking_negative_1(%arg0: memref<?x?xf32>, %arg1: vector<[8]x[8]xi1>, %arg2: vector<[8]x[8]xi1>) {
    %cst = arith.constant dense<0.000000e+00> : vector<[8]x[8]xf32>
    %cst_0 = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %c512 = arith.constant 512 : index
    vector.transfer_write %cst, %arg0[%c0, %c0], %arg1 {in_bounds = [true, true]} : vector<[8]x[8]xf32>, memref<?x?xf32>
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst_0, %arg2 {in_bounds = [true, true]} : memref<?x?xf32>, vector<[8]x[8]xf32>
    %1 = scf.for %arg3 = %c0 to %c512 step %c1 iter_args(%arg4 = %0) -> (vector<[8]x[8]xf32>) {
      %2 = arith.addf %arg4, %arg4 : vector<[8]x[8]xf32>
      scf.yield %2 : vector<[8]x[8]xf32>
    }
    vector.transfer_write %1, %arg0[%c0, %c0], %arg1 {in_bounds = [true, true]} : vector<[8]x[8]xf32>, memref<?x?xf32>
    return
  }
  func.func @forward_dead_constant_splat_store_with_masking_negative_3(%arg0: memref<?x?xf32>, %arg1: vector<[8]x[8]xi1>) {
    %cst = arith.constant dense<0.000000e+00> : vector<[8]x[8]xf32>
    %cst_0 = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %c512 = arith.constant 512 : index
    vector.transfer_write %cst, %arg0[%c0, %c0], %arg1 {in_bounds = [true, true]} : vector<[8]x[8]xf32>, memref<?x?xf32>
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<?x?xf32>, vector<[8]x[8]xf32>
    %1 = scf.for %arg2 = %c0 to %c512 step %c1 iter_args(%arg3 = %0) -> (vector<[8]x[8]xf32>) {
      %2 = arith.addf %arg3, %arg3 : vector<[8]x[8]xf32>
      scf.yield %2 : vector<[8]x[8]xf32>
    }
    vector.transfer_write %1, %arg0[%c0, %c0], %arg1 {in_bounds = [true, true]} : vector<[8]x[8]xf32>, memref<?x?xf32>
    return
  }
  func.func @forward_and_eliminate_stores_through_trivial_aliases(%arg0: memref<?x?xf32>, %arg1: vector<[8]x[8]xf32>, %arg2: index, %arg3: index, %arg4: index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %cst = arith.constant 0.000000e+00 : f32
    vector.transfer_write %arg1, %arg0[%c0, %c0] {in_bounds = [true, true]} : vector<[8]x[8]xf32>, memref<?x?xf32>
    %subview = memref.subview %arg0[0, 0] [%arg3, %arg3] [1, 1] : memref<?x?xf32> to memref<?x?xf32, strided<[?, 1]>>
    %cast = memref.cast %subview : memref<?x?xf32, strided<[?, 1]>> to memref<?x?xf32>
    %subview_0 = memref.subview %cast[0, 0] [%arg4, %arg4] [1, 1] : memref<?x?xf32> to memref<?x?xf32, strided<[?, 1]>>
    %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<?x?xf32, strided<[?, 1]>>, vector<[8]x[8]xf32>
    %1 = scf.for %arg5 = %c0 to %c32 step %c1 iter_args(%arg6 = %0) -> (vector<[8]x[8]xf32>) {
      %2 = arith.addf %arg6, %arg6 : vector<[8]x[8]xf32>
      scf.yield %2 : vector<[8]x[8]xf32>
    }
    vector.transfer_write %1, %subview_0[%c0, %c0] {in_bounds = [true, true]} : vector<[8]x[8]xf32>, memref<?x?xf32, strided<[?, 1]>>
    return
  }
}

