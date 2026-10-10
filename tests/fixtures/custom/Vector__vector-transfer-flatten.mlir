module {
  func.func @transfer_read_dims_match_contiguous(%arg0: memref<5x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>) -> vector<5x4x3x2xi8> {
    %c0 = arith.constant 0 : index
    %c0_i8 = arith.constant 0 : i8
    %0 = vector.transfer_read %arg0[%c0, %c0, %c0, %c0], %c0_i8 : memref<5x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>, vector<5x4x3x2xi8>
    return %0 : vector<5x4x3x2xi8>
  }
  func.func @transfer_read_dims_match_contiguous_scalable(%arg0: memref<5x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>) -> vector<5x4x3x[2]xi8> {
    %c0 = arith.constant 0 : index
    %c0_i8 = arith.constant 0 : i8
    %0 = vector.transfer_read %arg0[%c0, %c0, %c0, %c0], %c0_i8 : memref<5x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>, vector<5x4x3x[2]xi8>
    return %0 : vector<5x4x3x[2]xi8>
  }
}

// -----
module {
  func.func @transfer_read_dims_match_contiguous_empty_stride(%arg0: memref<5x4x3x2xi8>) -> vector<5x4x3x2xi8> {
    %c0 = arith.constant 0 : index
    %c0_i8 = arith.constant 0 : i8
    %0 = vector.transfer_read %arg0[%c0, %c0, %c0, %c0], %c0_i8 : memref<5x4x3x2xi8>, vector<5x4x3x2xi8>
    return %0 : vector<5x4x3x2xi8>
  }
}

// -----
module {
  func.func @transfer_read_dims_mismatch_contiguous(%arg0: memref<5x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>) -> vector<2x3x2xi8> {
    %c0 = arith.constant 0 : index
    %c0_i8 = arith.constant 0 : i8
    %0 = vector.transfer_read %arg0[%c0, %c0, %c0, %c0], %c0_i8 : memref<5x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>, vector<2x3x2xi8>
    return %0 : vector<2x3x2xi8>
  }
}

// -----
module {
  func.func @transfer_read_dims_mismatch_contiguous_unit_dims(%arg0: memref<6x5x4x3x2xi8, strided<[120, 24, 6, 2, 1], offset: ?>>) -> vector<1x1x4x3x2xi8> {
    %c0 = arith.constant 0 : index
    %c0_i8 = arith.constant 0 : i8
    %0 = vector.transfer_read %arg0[%c0, %c0, %c0, %c0, %c0], %c0_i8 : memref<6x5x4x3x2xi8, strided<[120, 24, 6, 2, 1], offset: ?>>, vector<1x1x4x3x2xi8>
    return %0 : vector<1x1x4x3x2xi8>
  }
}

// -----
module {
  func.func @transfer_read_non_contiguous_unit_dims(%arg0: memref<5x4x3x2xi8, strided<[48, 6, 2, 1], offset: ?>>) -> vector<1x1x3x2xi8> {
    %c0 = arith.constant 0 : index
    %c0_i8 = arith.constant 0 : i8
    %0 = vector.transfer_read %arg0[%c0, %c0, %c0, %c0], %c0_i8 : memref<5x4x3x2xi8, strided<[48, 6, 2, 1], offset: ?>>, vector<1x1x3x2xi8>
    return %0 : vector<1x1x3x2xi8>
  }
}

// -----
module {
  func.func @transfer_read_dims_mismatch_non_zero_indices(%arg0: index, %arg1: index, %arg2: memref<1x43x4x6xi32>) -> vector<1x2x6xi32> {
    %c0 = arith.constant 0 : index
    %c0_i32 = arith.constant 0 : i32
    %0 = vector.transfer_read %arg2[%c0, %arg0, %arg1, %c0], %c0_i32 {in_bounds = [true, true, true]} : memref<1x43x4x6xi32>, vector<1x2x6xi32>
    return %0 : vector<1x2x6xi32>
  }
}

// -----
module {
  func.func @transfer_read_dims_mismatch_non_contiguous_non_zero_indices(%arg0: memref<1x3x3x2xf32, strided<[40, 10, 2, 1], offset: ?>>, %arg1: index, %arg2: index) -> vector<2x2xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c0, %arg1, %arg2, %c0], %cst {in_bounds = [true, true]} : memref<1x3x3x2xf32, strided<[40, 10, 2, 1], offset: ?>>, vector<2x2xf32>
    return %0 : vector<2x2xf32>
  }
}

// -----
module {
  func.func @transfer_read_leading_dynamic_dims(%arg0: memref<?x?x8x4xi8, strided<[?, 32, 4, 1], offset: ?>>, %arg1: index, %arg2: index) -> vector<8x4xi8> {
    %c0_i8 = arith.constant 0 : i8
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_read %arg0[%arg1, %arg2, %c0, %c0], %c0_i8 {in_bounds = [true, true]} : memref<?x?x8x4xi8, strided<[?, 32, 4, 1], offset: ?>>, vector<8x4xi8>
    return %0 : vector<8x4xi8>
  }
}

// -----
module {
  func.func @negative_transfer_read_dynamic_dim_to_flatten(%arg0: memref<4x?x?x2xi8>) -> vector<2x2x2xi8> {
    %c0 = arith.constant 0 : index
    %c0_i8 = arith.constant 0 : i8
    %0 = vector.transfer_read %arg0[%c0, %c0, %c0, %c0], %c0_i8 : memref<4x?x?x2xi8>, vector<2x2x2xi8>
    return %0 : vector<2x2x2xi8>
  }
}

// -----
module {
  func.func @transfer_read_dynamic_dim_to_flatten(%arg0: index, %arg1: index, %arg2: memref<1x?x4x6xi32>) -> vector<1x2x6xi32> {
    %c0 = arith.constant 0 : index
    %c0_i32 = arith.constant 0 : i32
    %0 = vector.transfer_read %arg2[%c0, %arg0, %arg1, %c0], %c0_i32 {in_bounds = [true, true, true]} : memref<1x?x4x6xi32>, vector<1x2x6xi32>
    return %0 : vector<1x2x6xi32>
  }
}

// -----
module {
  func.func @transfer_read_dims_mismatch_non_contiguous_slice(%arg0: memref<5x4x3x2xi8>) -> vector<2x1x2x2xi8> {
    %c0 = arith.constant 0 : index
    %c0_i8 = arith.constant 0 : i8
    %0 = vector.transfer_read %arg0[%c0, %c0, %c0, %c0], %c0_i8 : memref<5x4x3x2xi8>, vector<2x1x2x2xi8>
    return %0 : vector<2x1x2x2xi8>
  }
}

// -----
module {
  func.func @transfer_read_0d(%arg0: memref<i8>) -> vector<i8> {
    %c0_i8 = arith.constant 0 : i8
    %0 = vector.transfer_read %arg0[], %c0_i8 : memref<i8>, vector<i8>
    return %0 : vector<i8>
  }
}

// -----
module {
  func.func @transfer_read_non_contiguous_src(%arg0: memref<5x4x3x2xi8, strided<[24, 8, 2, 1], offset: ?>>) -> vector<5x4x3x2xi8> {
    %c0 = arith.constant 0 : index
    %c0_i8 = arith.constant 0 : i8
    %0 = vector.transfer_read %arg0[%c0, %c0, %c0, %c0], %c0_i8 : memref<5x4x3x2xi8, strided<[24, 8, 2, 1], offset: ?>>, vector<5x4x3x2xi8>
    return %0 : vector<5x4x3x2xi8>
  }
}

// -----
module {
  func.func @transfer_write_dims_match_contiguous(%arg0: memref<5x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>, %arg1: vector<5x4x3x2xi8>) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg1, %arg0[%c0, %c0, %c0, %c0] : vector<5x4x3x2xi8>, memref<5x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>
    return
  }
  func.func @transfer_write_dims_match_contiguous_scalable(%arg0: memref<5x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>, %arg1: vector<5x4x3x[2]xi8>) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg1, %arg0[%c0, %c0, %c0, %c0] : vector<5x4x3x[2]xi8>, memref<5x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>
    return
  }
}

// -----
module {
  func.func @transfer_write_dims_match_contiguous_empty_stride(%arg0: memref<5x4x3x2xi8>, %arg1: vector<5x4x3x2xi8>) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg1, %arg0[%c0, %c0, %c0, %c0] : vector<5x4x3x2xi8>, memref<5x4x3x2xi8>
    return
  }
}

// -----
module {
  func.func @transfer_write_dims_mismatch_contiguous(%arg0: memref<5x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>, %arg1: vector<2x2xi8>) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg1, %arg0[%c0, %c0, %c0, %c0] : vector<2x2xi8>, memref<5x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>
    return
  }
}

// -----
module {
  func.func @transfer_write_dims_mismatch_contiguous_unit_dims(%arg0: memref<6x5x4x3x2xi8, strided<[120, 24, 6, 2, 1], offset: ?>>, %arg1: vector<1x1x4x3x2xi8>) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg1, %arg0[%c0, %c0, %c0, %c0, %c0] : vector<1x1x4x3x2xi8>, memref<6x5x4x3x2xi8, strided<[120, 24, 6, 2, 1], offset: ?>>
    return
  }
}

// -----
module {
  func.func @transfer_write_non_contiguous_unit_dims(%arg0: memref<5x4x3x2xi8, strided<[48, 6, 2, 1], offset: ?>>, %arg1: vector<1x1x3x2xi8>) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg1, %arg0[%c0, %c0, %c0, %c0] : vector<1x1x3x2xi8>, memref<5x4x3x2xi8, strided<[48, 6, 2, 1], offset: ?>>
    return
  }
}

// -----
module {
  func.func @transfer_write_dims_mismatch_non_zero_indices(%arg0: index, %arg1: index, %arg2: memref<1x43x4x6xi32>, %arg3: vector<1x2x6xi32>) {
    %c0 = arith.constant 0 : index
    %c0_i32 = arith.constant 0 : i32
    vector.transfer_write %arg3, %arg2[%c0, %arg0, %arg1, %c0] {in_bounds = [true, true, true]} : vector<1x2x6xi32>, memref<1x43x4x6xi32>
    return
  }
}

// -----
module {
  func.func @transfer_write_dims_mismatch_non_contiguous_non_zero_indices(%arg0: vector<2x2xf32>, %arg1: memref<1x3x3x2xf32, strided<[40, 10, 2, 1], offset: ?>>, %arg2: index, %arg3: index) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg0, %arg1[%c0, %arg2, %arg3, %c0] {in_bounds = [true, true]} : vector<2x2xf32>, memref<1x3x3x2xf32, strided<[40, 10, 2, 1], offset: ?>>
    return
  }
}

// -----
module {
  func.func @transfer_write_leading_dynamic_dims(%arg0: vector<8x4xi8>, %arg1: memref<?x?x8x4xi8, strided<[?, 32, 4, 1], offset: ?>>, %arg2: index, %arg3: index) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg0, %arg1[%arg2, %arg3, %c0, %c0] {in_bounds = [true, true]} : vector<8x4xi8>, memref<?x?x8x4xi8, strided<[?, 32, 4, 1], offset: ?>>
    return
  }
}

// -----
module {
  func.func @negative_transfer_write_dynamic_to_flatten(%arg0: memref<4x?x?x2xi8>, %arg1: vector<2x2x2xi8>) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg1, %arg0[%c0, %c0, %c0, %c0] : vector<2x2x2xi8>, memref<4x?x?x2xi8>
    return
  }
}

// -----
module {
  func.func @transfer_write_dynamic_dim_to_flatten(%arg0: index, %arg1: index, %arg2: vector<1x2x6xi32>, %arg3: memref<1x?x4x6xi32>) {
    %c0 = arith.constant 0 : index
    %c0_i32 = arith.constant 0 : i32
    vector.transfer_write %arg2, %arg3[%c0, %arg0, %arg1, %c0] {in_bounds = [true, true, true]} : vector<1x2x6xi32>, memref<1x?x4x6xi32>
    return
  }
}

// -----
module {
  func.func @transfer_write_dims_mismatch_non_contiguous_slice(%arg0: memref<5x4x3x2xi8>, %arg1: vector<2x1x2x2xi8>) {
    %c0 = arith.constant 0 : index
    %c0_i8 = arith.constant 0 : i8
    vector.transfer_write %arg1, %arg0[%c0, %c0, %c0, %c0] : vector<2x1x2x2xi8>, memref<5x4x3x2xi8>
    return
  }
}

// -----
module {
  func.func @transfer_write_0d(%arg0: memref<i8>, %arg1: vector<i8>) {
    vector.transfer_write %arg1, %arg0[] : vector<i8>, memref<i8>
    return
  }
}

// -----
module {
  func.func @transfer_write_non_contiguous_src(%arg0: memref<5x4x3x2xi8, strided<[24, 8, 2, 1], offset: ?>>, %arg1: vector<5x4x3x2xi8>) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg1, %arg0[%c0, %c0, %c0, %c0] : vector<5x4x3x2xi8>, memref<5x4x3x2xi8, strided<[24, 8, 2, 1], offset: ?>>
    return
  }
}

// -----
module {
  func.func @negative_out_of_bound_transfer_read(%arg0: memref<?x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>) -> vector<5x4x3x2xi8> {
    %c0 = arith.constant 0 : index
    %c0_i8 = arith.constant 0 : i8
    %0 = vector.transfer_read %arg0[%c0, %c0, %c0, %c0], %c0_i8 {in_bounds = [false, true, true, true]} : memref<?x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>, vector<5x4x3x2xi8>
    return %0 : vector<5x4x3x2xi8>
  }
}

// -----
module {
  func.func @negative_out_of_bound_transfer_write(%arg0: memref<?x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>, %arg1: vector<1x1x3x2xi8>) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg1, %arg0[%c0, %c0, %c0, %c0] {in_bounds = [false, true, true, true]} : vector<1x1x3x2xi8>, memref<?x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>
    return
  }
}

