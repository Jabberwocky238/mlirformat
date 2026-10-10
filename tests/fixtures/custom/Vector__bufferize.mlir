module {
  func.func @transfer_read(%arg0: tensor<?x?xf32>, %arg1: index, %arg2: index, %arg3: f32) -> vector<5x6xf32> {
    %0 = vector.transfer_read %arg0[%arg1, %arg2], %arg3 {in_bounds = [true, false]} : tensor<?x?xf32>, vector<5x6xf32>
    return %0 : vector<5x6xf32>
  }
}

// -----
module {
  func.func @transfer_write(%arg0: tensor<?x?xf32>, %arg1: index, %arg2: index, %arg3: vector<5x6xf32>, %arg4: vector<5x6xi1>) -> tensor<?x?xf32> {
    %0 = vector.transfer_write %arg3, %arg0[%arg1, %arg2], %arg4 {in_bounds = [true, false]} : vector<5x6xf32>, tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @scatter(%arg0: tensor<16x16xf32>, %arg1: vector<16xi32>, %arg2: vector<16xi1>, %arg3: vector<16xf32>) -> tensor<16x16xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.scatter %arg0[%c0, %c0] [%arg1], %arg2, %arg3 : tensor<16x16xf32>, vector<16xi32>, vector<16xi1>, vector<16xf32> -> tensor<16x16xf32>
    return %0 : tensor<16x16xf32>
  }
}

// -----
module {
  func.func @gather(%arg0: tensor<?x?xf32>, %arg1: vector<16xi32>, %arg2: vector<16xi1>, %arg3: vector<16xf32>) -> vector<16xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.gather %arg0[%c0, %c0] [%arg1], %arg2, %arg3 : tensor<?x?xf32>, vector<16xi32>, vector<16xi1>, vector<16xf32> into vector<16xf32>
    return %0 : vector<16xf32>
  }
}

