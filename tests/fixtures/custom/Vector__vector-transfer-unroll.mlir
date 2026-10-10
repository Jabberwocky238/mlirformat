module {
  func.func @transfer_read_unroll(%arg0: memref<4x4xf32>) -> vector<4x4xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst : memref<4x4xf32>, vector<4x4xf32>
    return %0 : vector<4x4xf32>
  }
}

// -----
module {
  func.func @transfer_write_unroll(%arg0: memref<4x4xf32>, %arg1: vector<4x4xf32>) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg1, %arg0[%c0, %c0] : vector<4x4xf32>, memref<4x4xf32>
    return
  }
}

// -----
module {
  func.func @negative_transfer_write(%arg0: vector<6x34x62xi8>) {
    %c0 = arith.constant 0 : index
    %alloc = memref.alloc() : memref<6x34x62xi8>
    vector.transfer_write %arg0, %alloc[%c0, %c0, %c0] : vector<6x34x62xi8>, memref<6x34x62xi8>
    return
  }
}

// -----
module {
  func.func @transfer_readwrite_unroll(%arg0: memref<4x4xf32>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst : memref<4x4xf32>, vector<4x4xf32>
    vector.transfer_write %0, %arg0[%c0, %c0] : vector<4x4xf32>, memref<4x4xf32>
    return
  }
}

// -----
module {
  func.func @transfer_read_unroll_tensor(%arg0: tensor<4x4xf32>) -> vector<4x4xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst : tensor<4x4xf32>, vector<4x4xf32>
    return %0 : vector<4x4xf32>
  }
}

// -----
module {
  func.func @transfer_write_unroll_tensor(%arg0: tensor<4x4xf32>, %arg1: vector<4x4xf32>) -> tensor<4x4xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_write %arg1, %arg0[%c0, %c0] : vector<4x4xf32>, tensor<4x4xf32>
    return %0 : tensor<4x4xf32>
  }
}

// -----
module {
  func.func @transfer_readwrite_unroll_tensor(%arg0: tensor<4x4xf32>, %arg1: tensor<4x4xf32>) -> tensor<4x4xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst : tensor<4x4xf32>, vector<4x4xf32>
    %1 = vector.transfer_write %0, %arg1[%c0, %c0] : vector<4x4xf32>, tensor<4x4xf32>
    return %1 : tensor<4x4xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func @transfer_read_unroll_permutation(%arg0: memref<6x4xf32>) -> vector<4x6xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst {permutation_map = #map} : memref<6x4xf32>, vector<4x6xf32>
    return %0 : vector<4x6xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (0, d1)>
module {
  func.func @transfer_read_unroll_broadcast(%arg0: memref<6x4xf32>) -> vector<6x4xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst {permutation_map = #map} : memref<6x4xf32>, vector<6x4xf32>
    return %0 : vector<6x4xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (0, d0)>
module {
  func.func @transfer_read_unroll_broadcast_permuation(%arg0: memref<6x4xf32>) -> vector<4x6xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst {permutation_map = #map} : memref<6x4xf32>, vector<4x6xf32>
    return %0 : vector<4x6xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d2, d0)>
module {
  func.func @transfer_read_unroll_different_rank(%arg0: memref<?x?x?xf32>) -> vector<6x4xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c0, %c0, %c0], %cst {permutation_map = #map} : memref<?x?x?xf32>, vector<6x4xf32>
    return %0 : vector<6x4xf32>
  }
}

// -----
module {
  func.func @vector_gather_unroll(%arg0: memref<?x?x?xf32>, %arg1: vector<6x4xindex>, %arg2: vector<6x4xi1>, %arg3: vector<6x4xf32>) -> vector<6x4xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.gather %arg0[%c0, %c0, %c0] [%arg1], %arg2, %arg3 : memref<?x?x?xf32>, vector<6x4xindex>, vector<6x4xi1>, vector<6x4xf32> into vector<6x4xf32>
    return %0 : vector<6x4xf32>
  }
}

