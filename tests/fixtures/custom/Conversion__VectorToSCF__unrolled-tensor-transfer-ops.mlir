module {
  func.func @transfer_read_2d(%arg0: tensor<?x?xf32>, %arg1: index, %arg2: index) -> vector<4x9xf32> {
    %cst = arith.constant -4.200000e+01 : f32
    %0 = vector.transfer_read %arg0[%arg1, %arg2], %cst {in_bounds = [true, true]} : tensor<?x?xf32>, vector<4x9xf32>
    return %0 : vector<4x9xf32>
  }
}

// -----
module {
  func.func @transfer_write_2d(%arg0: tensor<?x?xf32>, %arg1: vector<2x3xf32>, %arg2: index, %arg3: index) -> tensor<?x?xf32> {
    %0 = vector.transfer_write %arg1, %arg0[%arg2, %arg3] {in_bounds = [true, true]} : vector<2x3xf32>, tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
}

