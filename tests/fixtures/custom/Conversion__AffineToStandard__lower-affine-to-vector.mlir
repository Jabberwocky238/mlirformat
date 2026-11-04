module {
  func.func @affine_vector_load(%arg0: index) {
    %alloc = memref.alloc() : memref<100xf32>
    affine.for %arg1 = 0 to 16 {
      %0 = affine.vector_load %alloc[%arg1 + symbol(%arg0) + 7] : memref<100xf32>, vector<8xf32>
    }
    return
  }
}

// -----
module {
  func.func @affine_vector_store(%arg0: index) {
    %alloc = memref.alloc() : memref<100xf32>
    %cst = arith.constant dense<1.100000e+01> : vector<4xf32>
    affine.for %arg1 = 0 to 16 {
      affine.vector_store %cst, %alloc[%arg1 - symbol(%arg0) + 7] : memref<100xf32>, vector<4xf32>
    }
    return
  }
}

// -----
module {
  func.func @vector_load_2d() {
    %alloc = memref.alloc() : memref<100x100xf32>
    affine.for %arg0 = 0 to 16 step 2 {
      affine.for %arg1 = 0 to 16 step 8 {
        %0 = affine.vector_load %alloc[%arg0, %arg1] : memref<100x100xf32>, vector<2x8xf32>
      }
    }
    return
  }
}

// -----
module {
  func.func @vector_store_2d() {
    %alloc = memref.alloc() : memref<100x100xf32>
    %cst = arith.constant dense<1.100000e+01> : vector<2x8xf32>
    affine.for %arg0 = 0 to 16 step 2 {
      affine.for %arg1 = 0 to 16 step 8 {
        affine.vector_store %cst, %alloc[%arg0, %arg1] : memref<100x100xf32>, vector<2x8xf32>
      }
    }
    return
  }
}

