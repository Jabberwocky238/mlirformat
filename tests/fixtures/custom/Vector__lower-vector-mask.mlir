module {
  func.func @vector_transfer_read(%arg0: tensor<?xf32>, %arg1: index, %arg2: vector<16xi1>) -> vector<16xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.mask %arg2 { vector.transfer_read %arg0[%arg1], %cst : tensor<?xf32>, vector<16xf32> } : vector<16xi1> -> vector<16xf32>
    return %0 : vector<16xf32>
  }
}

// -----
module {
  func.func @vector_transfer_write_on_memref(%arg0: vector<16xf32>, %arg1: memref<?xf32>, %arg2: index, %arg3: vector<16xi1>) {
    vector.mask %arg3 { vector.transfer_write %arg0, %arg1[%arg2] : vector<16xf32>, memref<?xf32> } : vector<16xi1>
    return
  }
}

// -----
module {
  func.func @vector_transfer_write_on_tensor(%arg0: vector<16xf32>, %arg1: tensor<?xf32>, %arg2: index, %arg3: vector<16xi1>) -> tensor<?xf32> {
    %0 = vector.mask %arg3 { vector.transfer_write %arg0, %arg1[%arg2] : vector<16xf32>, tensor<?xf32> } : vector<16xi1> -> tensor<?xf32>
    return %0 : tensor<?xf32>
  }
}

// -----
module {
  func.func @vector_gather(%arg0: tensor<64xf32>, %arg1: tensor<3xf32>) -> tensor<3xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %c3 = arith.constant 3 : index
    %0 = vector.create_mask %c3 : vector<4xi1>
    %1 = vector.mask %0 { vector.transfer_read %arg1[%c0], %cst {in_bounds = [true]} : tensor<3xf32>, vector<4xf32> } : vector<4xi1> -> vector<4xf32>
    %cst_0 = arith.constant dense<[0, 1, 2, 3]> : vector<4xindex>
    %cst_1 = arith.constant dense<true> : vector<4xi1>
    %cst_2 = arith.constant dense<0.000000e+00> : vector<4xf32>
    %c0_3 = arith.constant 0 : index
    %2 = vector.mask %0 { vector.gather %arg0[%c0_3] [%cst_0], %cst_1, %cst_2 : tensor<64xf32>, vector<4xindex>, vector<4xi1>, vector<4xf32> into vector<4xf32> } : vector<4xi1> -> vector<4xf32>
    %c0_4 = arith.constant 0 : index
    %3 = vector.mask %0 { vector.transfer_write %2, %arg1[%c0_4] {in_bounds = [true]} : vector<4xf32>, tensor<3xf32> } : vector<4xi1> -> tensor<3xf32>
    return %3 : tensor<3xf32>
  }
}

// -----
module {
  func.func @empty_vector_mask_with_return(%arg0: vector<8xf32>, %arg1: vector<8xi1>) -> vector<8xf32> {
    %0 = vector.mask %arg1 { vector.yield %arg0 : vector<8xf32> } : vector<8xi1> -> vector<8xf32>
    return %0 : vector<8xf32>
  }
}

