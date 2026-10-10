module {
  func.func @transfer_read_0d(%arg0: memref<?x?x?xf32>, %arg1: index) -> f32 {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1, %arg1, %arg1], %cst : memref<?x?x?xf32>, vector<f32>
    %1 = vector.extract %0[] : f32 from vector<f32>
    return %1 : f32
  }
}

// -----
module {
  func.func @transfer_read_1d(%arg0: memref<?x?x?xf32>, %arg1: index, %arg2: index) -> f32 {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_read %arg0[%arg1, %arg1, %arg1], %cst {in_bounds = [true]} : memref<?x?x?xf32>, vector<5xf32>
    %1 = vector.extract %0[%arg2] : f32 from vector<5xf32>
    return %1 : f32
  }
}

// -----
module {
  func.func @tensor_transfer_read_0d(%arg0: tensor<?x?x?xf32>, %arg1: index) -> f32 {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1, %arg1, %arg1], %cst : tensor<?x?x?xf32>, vector<f32>
    %1 = vector.extract %0[] : f32 from vector<f32>
    return %1 : f32
  }
}

// -----
module {
  func.func @transfer_write_0d(%arg0: memref<?x?x?xf32>, %arg1: index, %arg2: f32) {
    %0 = vector.broadcast %arg2 : f32 to vector<f32>
    vector.transfer_write %0, %arg0[%arg1, %arg1, %arg1] : vector<f32>, memref<?x?x?xf32>
    return
  }
}

// -----
module {
  func.func @transfer_write_1d(%arg0: memref<?x?x?xf32>, %arg1: index, %arg2: f32) {
    %0 = vector.broadcast %arg2 : f32 to vector<1xf32>
    vector.transfer_write %0, %arg0[%arg1, %arg1, %arg1] : vector<1xf32>, memref<?x?x?xf32>
    return
  }
}

// -----
module {
  func.func @tensor_transfer_write_0d(%arg0: tensor<?x?x?xf32>, %arg1: index, %arg2: f32) -> tensor<?x?x?xf32> {
    %0 = vector.broadcast %arg2 : f32 to vector<f32>
    %1 = vector.transfer_write %0, %arg0[%arg1, %arg1, %arg1] : vector<f32>, tensor<?x?x?xf32>
    return %1 : tensor<?x?x?xf32>
  }
}

// -----
module {
  func.func @transfer_read_2d_extract(%arg0: memref<?x?x?x?xf32>, %arg1: index, %arg2: index) -> f32 {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_read %arg0[%arg1, %arg1, %arg1, %arg1], %cst {in_bounds = [true, true]} : memref<?x?x?x?xf32>, vector<10x5xf32>
    %1 = vector.extract %0[8, 1] : f32 from vector<10x5xf32>
    return %1 : f32
  }
}

// -----
module {
  func.func @transfer_write_arith_constant(%arg0: memref<?x?x?xf32>, %arg1: index) {
    %cst = arith.constant dense<5.000000e+00> : vector<1x1xf32>
    vector.transfer_write %cst, %arg0[%arg1, %arg1, %arg1] : vector<1x1xf32>, memref<?x?x?xf32>
    return
  }
}

// -----
module {
  func.func @transfer_read_multi_use(%arg0: memref<?xf32>, %arg1: index) -> (f32, f32) {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1], %cst {in_bounds = [true]} : memref<?xf32>, vector<16xf32>
    %1 = vector.extract %0[0] : f32 from vector<16xf32>
    %2 = vector.extract %0[1] : f32 from vector<16xf32>
    return %1, %2 : f32, f32
  }
}

// -----
module {
  func.func @subvector_extract(%arg0: memref<?x?xf32>, %arg1: index) -> vector<16xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1, %arg1], %cst {in_bounds = [true, true]} : memref<?x?xf32>, vector<8x16xf32>
    %1 = vector.extract %0[0] : vector<16xf32> from vector<8x16xf32>
    return %1 : vector<16xf32>
  }
}

// -----
module {
  func.func @transfer_read_1d_extract_dynamic(%arg0: memref<?xf32>, %arg1: index, %arg2: index) -> f32 {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1], %cst {in_bounds = [true]} : memref<?xf32>, vector<5xf32>
    %1 = vector.extract %0[%arg2] : f32 from vector<5xf32>
    return %1 : f32
  }
}

// -----
module {
  func.func @transfer_read_2d_extract_dynamic(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) -> f32 {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1, %arg2], %cst {in_bounds = [true, true]} : memref<?x?xf32>, vector<10x5xf32>
    %1 = vector.extract %0[%arg3, %arg4] : f32 from vector<10x5xf32>
    return %1 : f32
  }
}

