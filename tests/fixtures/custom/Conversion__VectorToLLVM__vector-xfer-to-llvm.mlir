module {
  func.func @transfer_read_write_1d(%arg0: memref<?xf32>, %arg1: index) -> vector<17xf32> {
    %cst = arith.constant 7.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1], %cst : memref<?xf32>, vector<17xf32>
    vector.transfer_write %0, %arg0[%arg1] : vector<17xf32>, memref<?xf32>
    return %0 : vector<17xf32>
  }
  func.func @transfer_read_write_1d_scalable(%arg0: memref<?xf32>, %arg1: index) -> vector<[17]xf32> {
    %cst = arith.constant 7.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1], %cst : memref<?xf32>, vector<[17]xf32>
    vector.transfer_write %0, %arg0[%arg1] : vector<[17]xf32>, memref<?xf32>
    return %0 : vector<[17]xf32>
  }
}

// -----
module {
  func.func @transfer_read_write_index_1d(%arg0: memref<?xindex>, %arg1: index) -> vector<17xindex> {
    %c7 = arith.constant 7 : index
    %0 = vector.transfer_read %arg0[%arg1], %c7 : memref<?xindex>, vector<17xindex>
    vector.transfer_write %0, %arg0[%arg1] : vector<17xindex>, memref<?xindex>
    return %0 : vector<17xindex>
  }
  func.func @transfer_read_write_index_1d_scalable(%arg0: memref<?xindex>, %arg1: index) -> vector<[17]xindex> {
    %c7 = arith.constant 7 : index
    %0 = vector.transfer_read %arg0[%arg1], %c7 : memref<?xindex>, vector<[17]xindex>
    vector.transfer_write %0, %arg0[%arg1] : vector<[17]xindex>, memref<?xindex>
    return %0 : vector<[17]xindex>
  }
}

// -----
module {
  func.func @transfer_read_2d_to_1d(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index) -> vector<17xf32> {
    %cst = arith.constant 7.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1, %arg2], %cst : memref<?x?xf32>, vector<17xf32>
    return %0 : vector<17xf32>
  }
  func.func @transfer_read_2d_to_1d_scalable(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index) -> vector<[17]xf32> {
    %cst = arith.constant 7.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1, %arg2], %cst : memref<?x?xf32>, vector<[17]xf32>
    return %0 : vector<[17]xf32>
  }
}

// -----
module {
  func.func @transfer_read_write_1d_non_zero_addrspace(%arg0: memref<?xf32, 3>, %arg1: index) -> vector<17xf32> {
    %cst = arith.constant 7.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1], %cst : memref<?xf32, 3>, vector<17xf32>
    vector.transfer_write %0, %arg0[%arg1] : vector<17xf32>, memref<?xf32, 3>
    return %0 : vector<17xf32>
  }
  func.func @transfer_read_write_1d_non_zero_addrspace_scalable(%arg0: memref<?xf32, 3>, %arg1: index) -> vector<[17]xf32> {
    %cst = arith.constant 7.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1], %cst : memref<?xf32, 3>, vector<[17]xf32>
    vector.transfer_write %0, %arg0[%arg1] : vector<[17]xf32>, memref<?xf32, 3>
    return %0 : vector<[17]xf32>
  }
}

// -----
module {
  func.func @transfer_read_1d_inbounds(%arg0: memref<?xf32>, %arg1: index) -> vector<17xf32> {
    %cst = arith.constant 7.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1], %cst {in_bounds = [true]} : memref<?xf32>, vector<17xf32>
    return %0 : vector<17xf32>
  }
  func.func @transfer_read_1d_inbounds_scalable(%arg0: memref<?xf32>, %arg1: index) -> vector<[17]xf32> {
    %cst = arith.constant 7.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1], %cst {in_bounds = [true]} : memref<?xf32>, vector<[17]xf32>
    return %0 : vector<[17]xf32>
  }
}

// -----
module {
  func.func @transfer_read_write_1d_mask(%arg0: memref<?xf32>, %arg1: index) -> vector<5xf32> {
    %cst = arith.constant dense<[false, false, true, false, true]> : vector<5xi1>
    %cst_0 = arith.constant 7.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1], %cst_0, %cst : memref<?xf32>, vector<5xf32>
    vector.transfer_write %0, %arg0[%arg1], %cst : vector<5xf32>, memref<?xf32>
    return %0 : vector<5xf32>
  }
  func.func @transfer_read_write_1d_mask_scalable(%arg0: memref<?xf32>, %arg1: index, %arg2: vector<[5]xi1>) -> vector<[5]xf32> {
    %cst = arith.constant 7.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1], %cst, %arg2 : memref<?xf32>, vector<[5]xf32>
    vector.transfer_write %0, %arg0[%arg1], %arg2 : vector<[5]xf32>, memref<?xf32>
    return %0 : vector<[5]xf32>
  }
}

// -----
module {
  func.func @transfer_read_write_tensor(%arg0: tensor<?xf32>, %arg1: index) -> vector<4xf32> {
    %cst = arith.constant 7.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_read %arg0[%arg1], %cst : tensor<?xf32>, vector<4xf32>
    %1 = vector.transfer_write %0, %arg0[%c0] : vector<4xf32>, tensor<?xf32>
    "test.some_use"(%1) : (tensor<?xf32>) -> ()
    return %0 : vector<4xf32>
  }
}

