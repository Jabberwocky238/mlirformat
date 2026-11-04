module {
  func.func @load_1D_vector(%arg0: memref<8x16x32xf32>, %arg1: index) -> vector<8xf32> {
    %0 = vector.load %arg0[%arg1, %arg1, %arg1] : memref<8x16x32xf32>, vector<8xf32>
    return %0 : vector<8xf32>
  }
}

// -----
module {
  func.func @load_2D_vector(%arg0: memref<8x16x32xf32>, %arg1: index) -> vector<8x16xf32> {
    %0 = vector.load %arg0[%arg1, %arg1, %arg1] : memref<8x16x32xf32>, vector<8x16xf32>
    return %0 : vector<8x16xf32>
  }
}

// -----
module {
  func.func @load_dynamic_source(%arg0: memref<?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index) -> vector<8x16xf32> {
    %0 = vector.load %arg0[%arg1, %arg2, %arg3] : memref<?x?x?xf32>, vector<8x16xf32>
    return %0 : vector<8x16xf32>
  }
}

// -----
module {
  func.func @load_out_of_bounds(%arg0: memref<7x15xf32>, %arg1: index) -> vector<8x16xf32> {
    %0 = vector.load %arg0[%arg1, %arg1] : memref<7x15xf32>, vector<8x16xf32>
    return %0 : vector<8x16xf32>
  }
}

// -----
module {
  func.func @no_load_high_dim_vector(%arg0: memref<16x32x64xf32>, %arg1: index) -> vector<8x16x32xf32> {
    %0 = vector.load %arg0[%arg1, %arg1, %arg1] : memref<16x32x64xf32>, vector<8x16x32xf32>
    return %0 : vector<8x16x32xf32>
  }
}

// -----
module {
  func.func @no_load_zero_dim_vector(%arg0: memref<64xf32>, %arg1: index) -> vector<f32> {
    %0 = vector.load %arg0[%arg1] : memref<64xf32>, vector<f32>
    return %0 : vector<f32>
  }
}

