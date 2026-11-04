module {
  func.func @outerproduct_f32_scalable_8x8_no_acc(%arg0: vector<[8]xf32>, %arg1: vector<[8]xf32>) -> vector<[8]x[8]xf32> {
    %0 = vector.outerproduct %arg0, %arg1 : vector<[8]xf32>, vector<[8]xf32>
    return %0 : vector<[8]x[8]xf32>
  }
}

// -----
module {
  func.func @outerproduct_f32_scalable_4x16_acc(%arg0: vector<[4]xf32>, %arg1: vector<[16]xf32>, %arg2: vector<[4]x[16]xf32>) -> vector<[4]x[16]xf32> {
    %0 = vector.outerproduct %arg0, %arg1, %arg2 {kind = #vector.kind<add>} : vector<[4]xf32>, vector<[16]xf32>
    return %0 : vector<[4]x[16]xf32>
  }
}

// -----
module {
  func.func @outerproduct_f32_masked_scalable_16x4(%arg0: vector<[16]xf32>, %arg1: vector<[4]xf32>, %arg2: index, %arg3: index) -> vector<[16]x[4]xf32> {
    %0 = vector.create_mask %arg2, %arg3 : vector<[16]x[4]xi1>
    %1 = vector.mask %0 { vector.outerproduct %arg0, %arg1 : vector<[16]xf32>, vector<[4]xf32> } : vector<[16]x[4]xi1> -> vector<[16]x[4]xf32>
    return %1 : vector<[16]x[4]xf32>
  }
}

// -----
module {
  func.func @outerproduct_f64_scalable_8x4_no_acc(%arg0: vector<[8]xf64>, %arg1: vector<[4]xf64>) -> vector<[8]x[4]xf64> {
    %0 = vector.outerproduct %arg0, %arg1 : vector<[8]xf64>, vector<[4]xf64>
    return %0 : vector<[8]x[4]xf64>
  }
}

// -----
module {
  func.func @transfer_read_f32_scalable_8x8(%arg0: memref<?x?xi32>) -> vector<[8]x[8]xi32> {
    %c0 = arith.constant 0 : index
    %c0_i32 = arith.constant 0 : i32
    %0 = vector.transfer_read %arg0[%c0, %c0], %c0_i32 {in_bounds = [true, true]} : memref<?x?xi32>, vector<[8]x[8]xi32>
    return %0 : vector<[8]x[8]xi32>
  }
}

// -----
module {
  func.func @transfer_read_i16_scalable_8x16_masked(%arg0: memref<?x?xi16>, %arg1: index, %arg2: index) -> vector<[8]x[16]xi16> {
    %c0 = arith.constant 0 : index
    %c0_i16 = arith.constant 0 : i16
    %0 = vector.create_mask %arg1, %arg2 : vector<[8]x[16]xi1>
    %1 = vector.transfer_read %arg0[%c0, %c0], %c0_i16, %0 {in_bounds = [true, true]} : memref<?x?xi16>, vector<[8]x[16]xi16>
    return %1 : vector<[8]x[16]xi16>
  }
}

// -----
module {
  func.func @transfer_write_f16_scalable_16x8(%arg0: memref<?x?xf16>, %arg1: vector<[16]x[8]xf16>) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg1, %arg0[%c0, %c0] {in_bounds = [true, true]} : vector<[16]x[8]xf16>, memref<?x?xf16>
    return
  }
}

// -----
module {
  func.func @transfer_write_i8_scalable_16x16_masked(%arg0: memref<?x?xi8>, %arg1: vector<[16]x[16]xi8>, %arg2: index, %arg3: index) {
    %c0 = arith.constant 0 : index
    %0 = vector.create_mask %arg2, %arg2 : vector<[16]x[16]xi1>
    vector.transfer_write %arg1, %arg0[%c0, %c0], %0 {in_bounds = [true, true]} : vector<[16]x[16]xi8>, memref<?x?xi8>
    return
  }
}

// -----
module {
  func.func @transfer_write_f32_scalable_8x8_masked(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index, %arg3: vector<[8]x[8]xf32>) {
    %c0 = arith.constant 0 : index
    %0 = vector.create_mask %arg1, %arg2 : vector<[8]x[8]xi1>
    vector.transfer_write %arg3, %arg0[%c0, %c0], %0 {in_bounds = [true, true]} : vector<[8]x[8]xf32>, memref<?x?xf32>
    return
  }
}

// -----
module {
  func.func @negative_transfer_write_f32_scalable_8x8_tensor(%arg0: tensor<?x?xf32>, %arg1: vector<[8]x[8]xf32>) {
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_write %arg1, %arg0[%c0, %c0] {in_bounds = [true, true]} : vector<[8]x[8]xf32>, tensor<?x?xf32>
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func @negative_transfer_write_f32_scalable_8x8_tensor(%arg0: tensor<?x?xf32>, %arg1: index, %arg2: index, %arg3: vector<[8]x[8]xf32>) {
    %c0 = arith.constant 0 : index
    %0 = vector.create_mask %arg1, %arg2 : vector<[8]x[8]xi1>
    %1 = vector.transfer_write %arg3, %arg0[%c0, %c0], %0 {in_bounds = [true, true], permutation_map = #map} : vector<[8]x[8]xf32>, tensor<?x?xf32>
    return
  }
}

// -----
module {
  func.func @negative_transfer_write_f32_scalable_32x32(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index, %arg3: vector<[32]x[32]xf32>) {
    %c0 = arith.constant 0 : index
    %0 = vector.create_mask %arg1, %arg2 : vector<[32]x[32]xi1>
    vector.transfer_write %arg3, %arg0[%c0, %c0], %0 {in_bounds = [true, true]} : vector<[32]x[32]xf32>, memref<?x?xf32>
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func @transpose_f32_scalable_4x16_via_read(%arg0: memref<?x?xf32>, %arg1: memref<?x?xf32>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst {in_bounds = [true, true], permutation_map = #map} : memref<?x?xf32>, vector<[16]x[4]xf32>
    vector.transfer_write %0, %arg1[%c0, %c0] {in_bounds = [true, true]} : vector<[16]x[4]xf32>, memref<?x?xf32>
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func @transpose_f32_scalable_4x16_via_write(%arg0: memref<?x?xf32>, %arg1: memref<?x?xf32>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<?x?xf32>, vector<[4]x[16]xf32>
    vector.transfer_write %0, %arg1[%c0, %c0] {in_bounds = [true, true], permutation_map = #map} : vector<[4]x[16]xf32>, memref<?x?xf32>
    return
  }
}

// -----
module {
  func.func @extract_from_vector_create_mask_non_constant_dim(%arg0: index, %arg1: index, %arg2: index) -> vector<[4]x[4]xi1> {
    %0 = vector.create_mask %arg0, %arg1, %arg2 : vector<4x[4]x[4]xi1>
    %1 = vector.extract %0[2] : vector<[4]x[4]xi1> from vector<4x[4]x[4]xi1>
    return %1 : vector<[4]x[4]xi1>
  }
}

// -----
module {
  func.func @non_constant_extract_from_vector_create_mask_non_constant(%arg0: index, %arg1: index, %arg2: index, %arg3: index) -> vector<[4]x[4]xi1> {
    %0 = vector.create_mask %arg1, %arg2, %arg3 : vector<4x[4]x[4]xi1>
    %1 = vector.extract %0[%arg0] : vector<[4]x[4]xi1> from vector<4x[4]x[4]xi1>
    return %1 : vector<[4]x[4]xi1>
  }
}

// -----
module {
  func.func @lift_illegal_transpose_to_memory(%arg0: index, %arg1: index, %arg2: memref<?x?xf32>) -> vector<4x[8]xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg2[%arg0, %arg1], %cst : memref<?x?xf32>, vector<[8]x4xf32>
    %1 = vector.transpose %0, [1, 0] : vector<[8]x4xf32> to vector<4x[8]xf32>
    return %1 : vector<4x[8]xf32>
  }
}

// -----
module {
  func.func @lift_illegal_transpose_to_memory_with_mask(%arg0: index, %arg1: index, %arg2: memref<?x?xf32>, %arg3: index, %arg4: index) -> vector<4x[8]xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.create_mask %arg0, %arg1 : vector<[8]x4xi1>
    %1 = vector.transfer_read %arg2[%arg3, %arg4], %cst, %0 : memref<?x?xf32>, vector<[8]x4xf32>
    %2 = vector.transpose %1, [1, 0] : vector<[8]x4xf32> to vector<4x[8]xf32>
    return %2 : vector<4x[8]xf32>
  }
}

// -----
module {
  func.func @lift_illegal_transpose_to_memory_with_arith_extop(%arg0: index, %arg1: index, %arg2: memref<?x?xi8>) -> vector<4x[8]xi32> {
    %c0_i8 = arith.constant 0 : i8
    %0 = vector.transfer_read %arg2[%arg0, %arg1], %c0_i8 : memref<?x?xi8>, vector<[8]x4xi8>
    %1 = arith.extsi %0 : vector<[8]x4xi8> to vector<[8]x4xi32>
    %2 = vector.transpose %1, [1, 0] : vector<[8]x4xi32> to vector<4x[8]xi32>
    return %2 : vector<4x[8]xi32>
  }
}

// -----
module {
  func.func @lift_illegal_transpose_to_memory_with_in_bounds_attr(%arg0: index, %arg1: index, %arg2: memref<?x?xf32>) -> vector<4x[8]xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg2[%arg0, %arg1], %cst {in_bounds = [false, true]} : memref<?x?xf32>, vector<[8]x4xf32>
    %1 = vector.transpose %0, [1, 0] : vector<[8]x4xf32> to vector<4x[8]xf32>
    return %1 : vector<4x[8]xf32>
  }
}

// -----
module {
  func.func @illegal_transpose_no_defining_source_op(%arg0: vector<[4]x1xf32>) -> vector<1x[4]xf32> {
    %0 = vector.transpose %arg0, [1, 0] : vector<[4]x1xf32> to vector<1x[4]xf32>
    return %0 : vector<1x[4]xf32>
  }
}

// -----
module {
  func.func @multi_tile_splat() -> vector<[8]x[8]xi32> {
    %cst = arith.constant dense<42> : vector<[8]x[8]xi32>
    return %cst : vector<[8]x[8]xi32>
  }
}

// -----
module {
  func.func @transpose_store_scalable_via_za(%arg0: vector<2x[4]xf32>, %arg1: memref<?x?xf32>, %arg2: index, %arg3: index) {
    %0 = vector.transpose %arg0, [1, 0] : vector<2x[4]xf32> to vector<[4]x2xf32>
    vector.transfer_write %0, %arg1[%arg2, %arg3] {in_bounds = [true, true]} : vector<[4]x2xf32>, memref<?x?xf32>
    return
  }
}

// -----
module {
  func.func @transpose_store_scalable_via_za_masked(%arg0: vector<2x[4]xf32>, %arg1: memref<?x?xf32>, %arg2: index, %arg3: index) {
    %c0 = arith.constant 0 : index
    %0 = vector.create_mask %arg2, %arg3 : vector<[4]x2xi1>
    %1 = vector.transpose %arg0, [1, 0] : vector<2x[4]xf32> to vector<[4]x2xf32>
    vector.transfer_write %1, %arg1[%c0, %c0], %0 {in_bounds = [true, true]} : vector<[4]x2xf32>, memref<?x?xf32>
    return
  }
}

// -----
module {
  func.func @transpose_store_scalable_via_za_multi_tile(%arg0: vector<8x[4]xf32>, %arg1: memref<?x?xf32>, %arg2: index, %arg3: index) {
    %0 = vector.transpose %arg0, [1, 0] : vector<8x[4]xf32> to vector<[4]x8xf32>
    vector.transfer_write %0, %arg1[%arg2, %arg3] {in_bounds = [true, true]} : vector<[4]x8xf32>, memref<?x?xf32>
    return
  }
}

// -----
module {
  func.func @transpose_store_scalable_via_za_multi_tile_wide(%arg0: vector<2x[8]xf32>, %arg1: memref<?x?xf32>, %arg2: index, %arg3: index) {
    %0 = vector.transpose %arg0, [1, 0] : vector<2x[8]xf32> to vector<[8]x2xf32>
    vector.transfer_write %0, %arg1[%arg2, %arg3] {in_bounds = [true, true]} : vector<[8]x2xf32>, memref<?x?xf32>
    return
  }
}

// -----
module {
  func.func @negative_transpose_store_scalable_via_za__bad_source_shape(%arg0: vector<2x[7]xf32>, %arg1: memref<?x?xf32>, %arg2: index, %arg3: index) {
    %0 = vector.transpose %arg0, [1, 0] : vector<2x[7]xf32> to vector<[7]x2xf32>
    vector.transfer_write %0, %arg1[%arg2, %arg3] {in_bounds = [true, true]} : vector<[7]x2xf32>, memref<?x?xf32>
    return
  }
}

// -----
module {
  func.func @vector_mask_without_maskable_op(%arg0: vector<16x2xi1>, %arg1: vector<16x16xf32>) -> vector<16x16xf32> {
    %0 = vector.mask %arg0 { vector.yield %arg1 : vector<16x16xf32> } : vector<16x2xi1> -> vector<16x16xf32>
    return %0 : vector<16x16xf32>
  }
}

// -----
module {
  func.func @xfer_read_scalable_column(%arg0: index, %arg1: index, %arg2: f32, %arg3: memref<?x?xf32>) -> vector<[4]x1xf32> {
    %0 = vector.transfer_read %arg3[%arg0, %arg1], %arg2 : memref<?x?xf32>, vector<[4]x1xf32>
    return %0 : vector<[4]x1xf32>
  }
}

// -----
module {
  func.func @negative_xfer_read_scalable_column_x2(%arg0: index, %arg1: index, %arg2: f32, %arg3: memref<?x?xf32>) -> vector<[4]x2xf32> {
    %0 = vector.transfer_read %arg3[%arg0, %arg1], %arg2 : memref<?x?xf32>, vector<[4]x2xf32>
    return %0 : vector<[4]x2xf32>
  }
}

// -----
module {
  func.func @negative_xfer_read_scalable_column_scalable_trailing_dim(%arg0: index, %arg1: index, %arg2: f32, %arg3: memref<?x?xf32>) -> vector<4x[1]xf32> {
    %0 = vector.transfer_read %arg3[%arg0, %arg1], %arg2 : memref<?x?xf32>, vector<4x[1]xf32>
    return %0 : vector<4x[1]xf32>
  }
}

