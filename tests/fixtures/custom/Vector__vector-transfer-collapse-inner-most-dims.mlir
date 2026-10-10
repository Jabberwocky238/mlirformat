module {
  func.func @contiguous_inner_most(%arg0: memref<1x1x8x1xf32, strided<[3072, 8, 1, 1], offset: ?>>) -> vector<1x8x1xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c0, %c0, %c0, %c0], %cst {in_bounds = [true, true, true]} : memref<1x1x8x1xf32, strided<[3072, 8, 1, 1], offset: ?>>, vector<1x8x1xf32>
    return %0 : vector<1x8x1xf32>
  }
  func.func @contiguous_inner_most_scalable_inner_dim(%arg0: memref<1x1x8x1xf32, strided<[3072, 8, 1, 1], offset: ?>>) -> vector<1x[8]x1xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c0, %c0, %c0, %c0], %cst {in_bounds = [true, true, true]} : memref<1x1x8x1xf32, strided<[3072, 8, 1, 1], offset: ?>>, vector<1x[8]x1xf32>
    return %0 : vector<1x[8]x1xf32>
  }
  func.func @negative_dynamic_trailing_dim(%arg0: memref<1x1x8x?xf32, strided<[3072, 8, 1, 1], offset: ?>>) -> vector<1x8x1xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c0, %c0, %c0, %c0], %cst {in_bounds = [true, true, true]} : memref<1x1x8x?xf32, strided<[3072, 8, 1, 1], offset: ?>>, vector<1x8x1xf32>
    return %0 : vector<1x8x1xf32>
  }
  func.func @negative_scalable_one_trailing_dim(%arg0: memref<1x1x8x1xf32, strided<[3072, 8, 1, 1], offset: ?>>) -> vector<1x8x[1]xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c0, %c0, %c0, %c0], %cst {in_bounds = [true, true, true]} : memref<1x1x8x1xf32, strided<[3072, 8, 1, 1], offset: ?>>, vector<1x8x[1]xf32>
    return %0 : vector<1x8x[1]xf32>
  }
}

// -----
module {
  func.func @contiguous_inner_most_dynamic_outer(%arg0: index, %arg1: index, %arg2: memref<?x?x8x1xf32>) -> vector<8x1xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg2[%arg0, %arg1, %c0, %c0], %cst {in_bounds = [true, true]} : memref<?x?x8x1xf32>, vector<8x1xf32>
    return %0 : vector<8x1xf32>
  }
  func.func @contiguous_inner_most_outer_dim_dyn_scalable_inner_dim(%arg0: index, %arg1: index, %arg2: memref<?x?x8x1xf32>) -> vector<[8]x1xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg2[%arg0, %arg1, %c0, %c0], %cst {in_bounds = [true, true]} : memref<?x?x8x1xf32>, vector<[8]x1xf32>
    return %0 : vector<[8]x1xf32>
  }
}

// -----
module {
  func.func @contiguous_inner_most_zero_idx_in_bounds(%arg0: memref<16x1xf32>, %arg1: index) -> vector<8x1xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_read %arg0[%arg1, %c0], %cst {in_bounds = [true, true]} : memref<16x1xf32>, vector<8x1xf32>
    return %0 : vector<8x1xf32>
  }
  func.func @contiguous_inner_most_zero_idx_out_of_bounds(%arg0: memref<16x1xf32>, %arg1: index) -> vector<8x1xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_read %arg0[%arg1, %c0], %cst {in_bounds = [true, false]} : memref<16x1xf32>, vector<8x1xf32>
    return %0 : vector<8x1xf32>
  }
  func.func @contiguous_inner_most_non_zero_idx_in_bounds(%arg0: memref<16x1xf32>, %arg1: index) -> vector<8x1xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1, %arg1], %cst {in_bounds = [true, true]} : memref<16x1xf32>, vector<8x1xf32>
    return %0 : vector<8x1xf32>
  }
  func.func @contiguous_inner_most_non_zero_idx_in_bounds_scalable(%arg0: memref<16x1xf32>, %arg1: index) -> vector<[8]x1xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1, %arg1], %cst {in_bounds = [true, true]} : memref<16x1xf32>, vector<[8]x1xf32>
    return %0 : vector<[8]x1xf32>
  }
  func.func @negative_contiguous_inner_most_non_zero_idx_out_of_bounds(%arg0: memref<16x1xf32>, %arg1: index) -> vector<8x1xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1, %arg1], %cst {in_bounds = [true, false]} : memref<16x1xf32>, vector<8x1xf32>
    return %0 : vector<8x1xf32>
  }
}

// -----
module {
  func.func @contiguous_inner_most_dim_with_subview(%arg0: memref<1000x1xf32>, %arg1: index, %arg2: index) -> vector<4x1xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %subview = memref.subview %arg0[%arg1, 0] [40, 1] [1, 1] : memref<1000x1xf32> to memref<40x1xf32, strided<[1, 1], offset: ?>>
    %0 = vector.transfer_read %subview[%arg2, %c0], %cst {in_bounds = [true, true]} : memref<40x1xf32, strided<[1, 1], offset: ?>>, vector<4x1xf32>
    return %0 : vector<4x1xf32>
  }
  func.func @contiguous_inner_most_dim_with_subview_scalable_inner_dim(%arg0: memref<1000x1xf32>, %arg1: index, %arg2: index) -> vector<[4]x1xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %subview = memref.subview %arg0[%arg1, 0] [40, 1] [1, 1] : memref<1000x1xf32> to memref<40x1xf32, strided<[1, 1], offset: ?>>
    %0 = vector.transfer_read %subview[%arg2, %c0], %cst {in_bounds = [true, true]} : memref<40x1xf32, strided<[1, 1], offset: ?>>, vector<[4]x1xf32>
    return %0 : vector<[4]x1xf32>
  }
}

// -----
module {
  func.func @contiguous_inner_most_dim_with_subview_2d(%arg0: memref<1000x1x1xf32>, %arg1: index, %arg2: index) -> vector<4x1x1xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %subview = memref.subview %arg0[%arg1, 0, 0] [40, 1, 1] [1, 1, 1] : memref<1000x1x1xf32> to memref<40x1x1xf32, strided<[1, 1, 1], offset: ?>>
    %0 = vector.transfer_read %subview[%arg2, %c0, %c0], %cst {in_bounds = [true, true, true]} : memref<40x1x1xf32, strided<[1, 1, 1], offset: ?>>, vector<4x1x1xf32>
    return %0 : vector<4x1x1xf32>
  }
  func.func @contiguous_inner_most_dim_with_subview_2d_scalable_inner_dim(%arg0: memref<1000x1x1xf32>, %arg1: index, %arg2: index) -> vector<[4]x1x1xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %subview = memref.subview %arg0[%arg1, 0, 0] [40, 1, 1] [1, 1, 1] : memref<1000x1x1xf32> to memref<40x1x1xf32, strided<[1, 1, 1], offset: ?>>
    %0 = vector.transfer_read %subview[%arg2, %c0, %c0], %cst {in_bounds = [true, true, true]} : memref<40x1x1xf32, strided<[1, 1, 1], offset: ?>>, vector<[4]x1x1xf32>
    return %0 : vector<[4]x1x1xf32>
  }
}

// -----
module {
  func.func @negative_non_unit_inner_vec_dim(%arg0: memref<4x1xf32>) -> vector<4x8xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst : memref<4x1xf32>, vector<4x8xf32>
    return %0 : vector<4x8xf32>
  }
}

// -----
module {
  func.func @negative_non_unit_inner_memref_dim(%arg0: memref<4x8xf32>) -> vector<4x1xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst : memref<4x8xf32>, vector<4x1xf32>
    return %0 : vector<4x1xf32>
  }
}

// -----
module {
  func.func @negative_non_unit_strides(%arg0: memref<512x16x1xf32, strided<[8192, 16, 4], offset: ?>>, %arg1: index) -> vector<16x16x1xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1, %c0, %c0], %cst {in_bounds = [true, true, true]} : memref<512x16x1xf32, strided<[8192, 16, 4], offset: ?>>, vector<16x16x1xf32>
    return %0 : vector<16x16x1xf32>
  }
}

// -----
module {
  func.func @contiguous_inner_most(%arg0: memref<1x512x16x1x1xf32>, %arg1: vector<1x16x16x1x1xf32>, %arg2: index) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg1, %arg0[%c0, %arg2, %c0, %c0, %c0] {in_bounds = [true, true, true, true, true]} : vector<1x16x16x1x1xf32>, memref<1x512x16x1x1xf32>
    return
  }
  func.func @contiguous_inner_most_scalable_inner_dim(%arg0: memref<1x512x16x1x1xf32>, %arg1: vector<1x16x[16]x1x1xf32>, %arg2: index) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg1, %arg0[%c0, %arg2, %c0, %c0, %c0] {in_bounds = [true, true, true, true, true]} : vector<1x16x[16]x1x1xf32>, memref<1x512x16x1x1xf32>
    return
  }
  func.func @negative_dynamic_trailing_dim(%arg0: memref<1x512x16x1x?xf32>, %arg1: vector<1x16x16x1x1xf32>, %arg2: index) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg1, %arg0[%c0, %arg2, %c0, %c0, %c0] {in_bounds = [true, true, true, true, true]} : vector<1x16x16x1x1xf32>, memref<1x512x16x1x?xf32>
    return
  }
  func.func @negative_scalable_one_trailing_dim(%arg0: memref<1x512x16x1x1xf32>, %arg1: vector<1x16x16x1x[1]xf32>, %arg2: index) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg1, %arg0[%c0, %arg2, %c0, %c0, %c0] {in_bounds = [true, true, true, true, true]} : vector<1x16x16x1x[1]xf32>, memref<1x512x16x1x1xf32>
    return
  }
}

// -----
module {
  func.func @contiguous_inner_most_dynamic_outer(%arg0: index, %arg1: index, %arg2: memref<?x?x16x1xf32>, %arg3: vector<8x1xf32>) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg3, %arg2[%arg0, %arg1, %c0, %c0] {in_bounds = [true, true]} : vector<8x1xf32>, memref<?x?x16x1xf32>
    return
  }
  func.func @contiguous_inner_most_dynamic_outer_scalable_inner_dim(%arg0: index, %arg1: index, %arg2: memref<?x?x16x1xf32>, %arg3: vector<[8]x1xf32>) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg3, %arg2[%arg0, %arg1, %c0, %c0] {in_bounds = [true, true]} : vector<[8]x1xf32>, memref<?x?x16x1xf32>
    return
  }
}

// -----
module {
  func.func @contiguous_inner_most_zero_idx_in_bounds(%arg0: memref<16x1xf32>, %arg1: vector<8x1xf32>, %arg2: index) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg1, %arg0[%arg2, %c0] {in_bounds = [true, true]} : vector<8x1xf32>, memref<16x1xf32>
    return
  }
  func.func @contiguous_inner_most_zero_idx_out_of_bounds(%arg0: memref<16x1xf32>, %arg1: vector<8x1xf32>, %arg2: index) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg1, %arg0[%arg2, %c0] {in_bounds = [true, false]} : vector<8x1xf32>, memref<16x1xf32>
    return
  }
  func.func @contiguous_inner_most_dim_non_zero_idx_in_bounds(%arg0: memref<16x1xf32>, %arg1: vector<8x1xf32>, %arg2: index) {
    vector.transfer_write %arg1, %arg0[%arg2, %arg2] {in_bounds = [true, true]} : vector<8x1xf32>, memref<16x1xf32>
    return
  }
  func.func @contiguous_inner_most_non_zero_idx_in_bounds_scalable(%arg0: memref<16x1xf32>, %arg1: vector<[8]x1xf32>, %arg2: index) {
    vector.transfer_write %arg1, %arg0[%arg2, %arg2] {in_bounds = [true, true]} : vector<[8]x1xf32>, memref<16x1xf32>
    return
  }
  func.func @negative_contiguous_inner_most_dim_non_zero_idx_out_of_bounds(%arg0: memref<16x1xf32>, %arg1: vector<8x1xf32>, %arg2: index) {
    vector.transfer_write %arg1, %arg0[%arg2, %arg2] {in_bounds = [true, false]} : vector<8x1xf32>, memref<16x1xf32>
    return
  }
}

// -----
module {
  func.func @contiguous_inner_most_dim_with_subview(%arg0: memref<1000x1xf32>, %arg1: index, %arg2: index, %arg3: vector<4x1xf32>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %subview = memref.subview %arg0[%arg1, 0] [40, 1] [1, 1] : memref<1000x1xf32> to memref<40x1xf32, strided<[1, 1], offset: ?>>
    vector.transfer_write %arg3, %subview[%arg2, %c0] {in_bounds = [true, true]} : vector<4x1xf32>, memref<40x1xf32, strided<[1, 1], offset: ?>>
    return
  }
  func.func @contiguous_inner_most_dim_with_subview_scalable_inner_dim(%arg0: memref<1000x1xf32>, %arg1: index, %arg2: index, %arg3: vector<[4]x1xf32>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %subview = memref.subview %arg0[%arg1, 0] [40, 1] [1, 1] : memref<1000x1xf32> to memref<40x1xf32, strided<[1, 1], offset: ?>>
    vector.transfer_write %arg3, %subview[%arg2, %c0] {in_bounds = [true, true]} : vector<[4]x1xf32>, memref<40x1xf32, strided<[1, 1], offset: ?>>
    return
  }
}

// -----
module {
  func.func @contiguous_inner_most_dim_with_subview_2d(%arg0: memref<1000x1x1xf32>, %arg1: index, %arg2: index, %arg3: vector<4x1x1xf32>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %subview = memref.subview %arg0[%arg1, 0, 0] [40, 1, 1] [1, 1, 1] : memref<1000x1x1xf32> to memref<40x1x1xf32, strided<[1, 1, 1], offset: ?>>
    vector.transfer_write %arg3, %subview[%arg2, %c0, %c0] {in_bounds = [true, true, true]} : vector<4x1x1xf32>, memref<40x1x1xf32, strided<[1, 1, 1], offset: ?>>
    return
  }
  func.func @contiguous_inner_most_dim_with_subview_2d_scalable(%arg0: memref<1000x1x1xf32>, %arg1: index, %arg2: index, %arg3: vector<[4]x1x1xf32>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %subview = memref.subview %arg0[%arg1, 0, 0] [40, 1, 1] [1, 1, 1] : memref<1000x1x1xf32> to memref<40x1x1xf32, strided<[1, 1, 1], offset: ?>>
    vector.transfer_write %arg3, %subview[%arg2, %c0, %c0] {in_bounds = [true, true, true]} : vector<[4]x1x1xf32>, memref<40x1x1xf32, strided<[1, 1, 1], offset: ?>>
    return
  }
}

// -----
module {
  func.func @negative_non_unit_inner_vec_dim(%arg0: memref<4x1xf32>, %arg1: vector<4x8xf32>) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg1, %arg0[%c0, %c0] : vector<4x8xf32>, memref<4x1xf32>
    return
  }
}

// -----
module {
  func.func @negative_non_unit_inner_memref_dim(%arg0: memref<4x8xf32>, %arg1: vector<4x1xf32>) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg1, %arg0[%c0, %c0] : vector<4x1xf32>, memref<4x8xf32>
    return
  }
}

// -----
module {
  func.func @negative_non_unit_strides(%arg0: memref<512x16x1xf32, strided<[8192, 16, 4], offset: ?>>, %arg1: vector<16x16x1xf32>, %arg2: index) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg1, %arg0[%arg2, %c0, %c0] {in_bounds = [true, true, true]} : vector<16x16x1xf32>, memref<512x16x1xf32, strided<[8192, 16, 4], offset: ?>>
    return
  }
}

