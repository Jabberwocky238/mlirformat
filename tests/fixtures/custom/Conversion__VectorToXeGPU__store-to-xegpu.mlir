module {
  func.func @store_1D_vector(%arg0: vector<8xf32>, %arg1: memref<8x16x32xf32>, %arg2: index) {
    vector.store %arg0, %arg1[%arg2, %arg2, %arg2] : memref<8x16x32xf32>, vector<8xf32>
    return
  }
}

// -----
module {
  func.func @store_2D_vector(%arg0: vector<8x16xf32>, %arg1: memref<8x16x32xf32>, %arg2: index) {
    vector.store %arg0, %arg1[%arg2, %arg2, %arg2] : memref<8x16x32xf32>, vector<8x16xf32>
    return
  }
}

// -----
module {
  func.func @store_dynamic_source(%arg0: vector<8x16xf32>, %arg1: memref<?x?x?xf32>, %arg2: index, %arg3: index, %arg4: index) {
    vector.store %arg0, %arg1[%arg2, %arg3, %arg4] : memref<?x?x?xf32>, vector<8x16xf32>
    return
  }
}

// -----
module {
  func.func @store_out_of_bounds(%arg0: vector<8x16xf32>, %arg1: memref<7x64xf32>, %arg2: index) {
    vector.store %arg0, %arg1[%arg2, %arg2] : memref<7x64xf32>, vector<8x16xf32>
    return
  }
}

// -----
module {
  func.func @no_store_high_dim_vector(%arg0: vector<8x16x32xf32>, %arg1: memref<16x32x64xf32>, %arg2: index) {
    vector.store %arg0, %arg1[%arg2, %arg2, %arg2] : memref<16x32x64xf32>, vector<8x16x32xf32>
    return
  }
}

// -----
module {
  func.func @no_store_zero_dim_vector(%arg0: vector<f32>, %arg1: memref<64xf32>, %arg2: index) {
    vector.store %arg0, %arg1[%arg2] : memref<64xf32>, vector<f32>
    return
  }
}

// -----
module {
  func.func @no_store_vec_element_memref(%arg0: vector<4xf32>, %arg1: memref<?xvector<4xf32>>, %arg2: index) {
    vector.store %arg0, %arg1[%arg2] : memref<?xvector<4xf32>>, vector<4xf32>
    return
  }
}

