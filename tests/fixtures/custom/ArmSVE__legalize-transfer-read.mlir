module {
}

// -----
module {
  func.func @base_case(%arg0: index, %arg1: index, %arg2: memref<?x?x?x8xi8>) -> vector<[4]x8xi8> {
    %c0 = arith.constant 0 : index
    %c123_i8 = arith.constant 123 : i8
    %0 = vector.transfer_read %arg2[%arg0, %arg1, %c0, %c0], %c123_i8 {in_bounds = [true, true]} : memref<?x?x?x8xi8>, vector<[4]x8xi8>
    return %0 : vector<[4]x8xi8>
  }
}

// -----
module {
  func.func @with_3d_vector(%arg0: index, %arg1: index, %arg2: memref<?x?x2x8xi8>) -> vector<[4]x2x8xi8> {
    %c0 = arith.constant 0 : index
    %c123_i8 = arith.constant 123 : i8
    %0 = vector.transfer_read %arg2[%arg0, %arg1, %c0, %c0], %c123_i8 {in_bounds = [true, true, true]} : memref<?x?x2x8xi8>, vector<[4]x2x8xi8>
    return %0 : vector<[4]x2x8xi8>
  }
}

// -----
module {
  func.func @negative_vector_legal_fixed(%arg0: index, %arg1: index, %arg2: memref<?x?x?x8xi8>) -> vector<8x8xi8> {
    %c0 = arith.constant 0 : index
    %c123_i8 = arith.constant 123 : i8
    %0 = vector.transfer_read %arg2[%arg0, %arg1, %c0, %c0], %c123_i8 {in_bounds = [true, true]} : memref<?x?x?x8xi8>, vector<8x8xi8>
    return %0 : vector<8x8xi8>
  }
}

// -----
module {
  func.func @negative_vector_legal_1d_scalable(%arg0: index, %arg1: index, %arg2: memref<?x?x?x8xi8>) -> vector<[8]xi8> {
    %c0 = arith.constant 0 : index
    %c123_i8 = arith.constant 123 : i8
    %0 = vector.transfer_read %arg2[%arg0, %arg1, %c0, %c0], %c123_i8 {in_bounds = [true]} : memref<?x?x?x8xi8>, vector<[8]xi8>
    return %0 : vector<[8]xi8>
  }
}

// -----
module {
  func.func @negative_vector_legal_trailing_scalable_dim(%arg0: index, %arg1: index, %arg2: memref<?x?x?x8xi8>) -> vector<8x[8]xi8> {
    %c0 = arith.constant 0 : index
    %c123_i8 = arith.constant 123 : i8
    %0 = vector.transfer_read %arg2[%arg0, %arg1, %c0, %c0], %c123_i8 {in_bounds = [true, true]} : memref<?x?x?x8xi8>, vector<8x[8]xi8>
    return %0 : vector<8x[8]xi8>
  }
}

// -----
module {
  func.func @negative_vector_type_two_scalable_dims(%arg0: index, %arg1: index, %arg2: memref<?x?x?x8xi8>) -> vector<[8]x[8]x8xi8> {
    %c0 = arith.constant 0 : index
    %c123_i8 = arith.constant 123 : i8
    %0 = vector.transfer_read %arg2[%arg0, %arg1, %c0, %c0], %c123_i8 {in_bounds = [true, true, true]} : memref<?x?x?x8xi8>, vector<[8]x[8]x8xi8>
    return %0 : vector<[8]x[8]x8xi8>
  }
}

// -----
module {
  func.func @negative_tensor_transfer(%arg0: index, %arg1: index, %arg2: tensor<?x?x?x8xi8>) -> vector<[4]x8xi8> {
    %c0 = arith.constant 0 : index
    %c123_i8 = arith.constant 123 : i8
    %0 = vector.transfer_read %arg2[%arg0, %arg1, %c0, %c0], %c123_i8 {in_bounds = [true, true]} : tensor<?x?x?x8xi8>, vector<[4]x8xi8>
    return %0 : vector<[4]x8xi8>
  }
}

// -----
module {
  func.func @negative_discontig_mem(%arg0: index, %arg1: index, %arg2: memref<?x?x?x8xi8, strided<[?, ?, 16, 1]>>) -> vector<[4]x8xi8> {
    %c0 = arith.constant 0 : index
    %c123_i8 = arith.constant 123 : i8
    %0 = vector.transfer_read %arg2[%arg0, %arg1, %c0, %c0], %c123_i8 {in_bounds = [true, true]} : memref<?x?x?x8xi8, strided<[?, ?, 16, 1]>>, vector<[4]x8xi8>
    return %0 : vector<[4]x8xi8>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d2, 0)>
module {
  func.func @negative_broadcast(%arg0: index, %arg1: index, %arg2: memref<?x?x?x8xi8>) -> vector<[4]x8xi8> {
    %c0 = arith.constant 0 : index
    %c123_i8 = arith.constant 123 : i8
    %0 = vector.transfer_read %arg2[%arg0, %arg1, %c0, %c0], %c123_i8 {in_bounds = [true, true], permutation_map = #map} : memref<?x?x?x8xi8>, vector<[4]x8xi8>
    return %0 : vector<[4]x8xi8>
  }
}

// -----
module {
  func.func @negative_masked(%arg0: index, %arg1: index, %arg2: memref<?x?x?x8xi8>, %arg3: vector<[4]x8xi1>) -> vector<[4]x8xi8> {
    %c0 = arith.constant 0 : index
    %c123_i8 = arith.constant 123 : i8
    %0 = vector.mask %arg3 { vector.transfer_read %arg2[%arg0, %arg1, %c0, %c0], %c123_i8 {in_bounds = [true, true]} : memref<?x?x?x8xi8>, vector<[4]x8xi8> } : vector<[4]x8xi1> -> vector<[4]x8xi8>
    return %0 : vector<[4]x8xi8>
  }
}

// -----
module {
  func.func @negative_with_mask(%arg0: index, %arg1: index, %arg2: memref<?x?x?x8xi8>, %arg3: vector<[4]x8xi1>) -> vector<[4]x8xi8> {
    %c0 = arith.constant 0 : index
    %c123_i8 = arith.constant 123 : i8
    %0 = vector.transfer_read %arg2[%arg0, %arg1, %c0, %c0], %c123_i8, %arg3 {in_bounds = [true, true]} : memref<?x?x?x8xi8>, vector<[4]x8xi8>
    return %0 : vector<[4]x8xi8>
  }
}

// -----
module {
  func.func @negative_non_matching_dim_static(%arg0: index, %arg1: index, %arg2: memref<?x?x?x8xi8>) -> vector<[4]x4xi8> {
    %c0 = arith.constant 0 : index
    %c123_i8 = arith.constant 123 : i8
    %0 = vector.transfer_read %arg2[%arg0, %arg1, %c0, %c0], %c123_i8 {in_bounds = [true, true]} : memref<?x?x?x8xi8>, vector<[4]x4xi8>
    return %0 : vector<[4]x4xi8>
  }
}

// -----
module {
  func.func @negative_non_matching_dim_dynamic(%arg0: index, %arg1: index, %arg2: memref<?x?x?x?xi8>) -> vector<[4]x4xi8> {
    %c0 = arith.constant 0 : index
    %c123_i8 = arith.constant 123 : i8
    %0 = vector.transfer_read %arg2[%arg0, %arg1, %c0, %c0], %c123_i8 {in_bounds = [true, true]} : memref<?x?x?x?xi8>, vector<[4]x4xi8>
    return %0 : vector<[4]x4xi8>
  }
}

