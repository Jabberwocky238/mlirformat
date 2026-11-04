module {
  func.func @transfer_read_inbounds(%arg0: memref<?x?x?xf32>) -> vector<2x3x4xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_read %arg0[%c0, %c0, %c0], %cst {in_bounds = [true, true, true]} : memref<?x?x?xf32>, vector<2x3x4xf32>
    return %0 : vector<2x3x4xf32>
  }
}

// -----
module {
  func.func @transfer_read_out_of_bounds(%arg0: memref<?x?x?xf32>) -> vector<2x3x4xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_read %arg0[%c0, %c0, %c0], %cst : memref<?x?x?xf32>, vector<2x3x4xf32>
    return %0 : vector<2x3x4xf32>
  }
}

// -----
module {
  func.func @transfer_read_mask(%arg0: memref<?x?x?xf32>, %arg1: vector<2x3x4xi1>) -> vector<2x3x4xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_read %arg0[%c0, %c0, %c0], %cst, %arg1 {in_bounds = [true, true, true]} : memref<?x?x?xf32>, vector<2x3x4xf32>
    return %0 : vector<2x3x4xf32>
  }
}

