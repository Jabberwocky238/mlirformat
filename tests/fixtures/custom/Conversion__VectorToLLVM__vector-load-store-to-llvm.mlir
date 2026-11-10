module {
  func.func @load(%arg0: memref<200x100xf32>, %arg1: index, %arg2: index) -> vector<8xf32> {
    %0 = vector.load %arg0[%arg1, %arg2] : memref<200x100xf32>, vector<8xf32>
    return %0 : vector<8xf32>
  }
}

// -----
module {
  func.func @load_scalable(%arg0: memref<200x100xf32>, %arg1: index, %arg2: index) -> vector<[8]xf32> {
    %0 = vector.load %arg0[%arg1, %arg2] : memref<200x100xf32>, vector<[8]xf32>
    return %0 : vector<[8]xf32>
  }
}

// -----
module {
  func.func @load_nontemporal(%arg0: memref<200x100xf32>, %arg1: index, %arg2: index) -> vector<8xf32> {
    %0 = vector.load %arg0[%arg1, %arg2] {nontemporal = true} : memref<200x100xf32>, vector<8xf32>
    return %0 : vector<8xf32>
  }
}

// -----
module {
  func.func @load_nontemporal_scalable(%arg0: memref<200x100xf32>, %arg1: index, %arg2: index) -> vector<[8]xf32> {
    %0 = vector.load %arg0[%arg1, %arg2] {nontemporal = true} : memref<200x100xf32>, vector<[8]xf32>
    return %0 : vector<[8]xf32>
  }
}

// -----
module {
  func.func @load_index(%arg0: memref<200x100xindex>, %arg1: index, %arg2: index) -> vector<8xindex> {
    %0 = vector.load %arg0[%arg1, %arg2] : memref<200x100xindex>, vector<8xindex>
    return %0 : vector<8xindex>
  }
}

// -----
module {
  func.func @load_index_scalable(%arg0: memref<200x100xindex>, %arg1: index, %arg2: index) -> vector<[8]xindex> {
    %0 = vector.load %arg0[%arg1, %arg2] : memref<200x100xindex>, vector<[8]xindex>
    return %0 : vector<[8]xindex>
  }
}

// -----
module {
  func.func @load_0d(%arg0: memref<200x100xf32>, %arg1: index, %arg2: index) -> vector<f32> {
    %0 = vector.load %arg0[%arg1, %arg2] : memref<200x100xf32>, vector<f32>
    return %0 : vector<f32>
  }
}

// -----
module {
  func.func @load_with_alignment(%arg0: memref<200x100xf32>, %arg1: index, %arg2: index) -> vector<8xf32> {
    %0 = vector.load %arg0[%arg1, %arg2] {alignment = 8 : i64} : memref<200x100xf32>, vector<8xf32>
    return %0 : vector<8xf32>
  }
}

// -----
module {
  func.func @store(%arg0: memref<200x100xf32>, %arg1: index, %arg2: index) {
    %cst = arith.constant dense<1.100000e+01> : vector<4xf32>
    vector.store %cst, %arg0[%arg1, %arg2] : memref<200x100xf32>, vector<4xf32>
    return
  }
}

// -----
module {
  func.func @store_scalable(%arg0: memref<200x100xf32>, %arg1: index, %arg2: index) {
    %cst = arith.constant dense<1.100000e+01> : vector<[4]xf32>
    vector.store %cst, %arg0[%arg1, %arg2] : memref<200x100xf32>, vector<[4]xf32>
    return
  }
}

// -----
module {
  func.func @store_nontemporal(%arg0: memref<200x100xf32>, %arg1: index, %arg2: index) {
    %cst = arith.constant dense<1.100000e+01> : vector<4xf32>
    vector.store %cst, %arg0[%arg1, %arg2] {nontemporal = true} : memref<200x100xf32>, vector<4xf32>
    return
  }
}

// -----
module {
  func.func @store_nontemporal_scalable(%arg0: memref<200x100xf32>, %arg1: index, %arg2: index) {
    %cst = arith.constant dense<1.100000e+01> : vector<[4]xf32>
    vector.store %cst, %arg0[%arg1, %arg2] {nontemporal = true} : memref<200x100xf32>, vector<[4]xf32>
    return
  }
}

// -----
module {
  func.func @store_index(%arg0: memref<200x100xindex>, %arg1: index, %arg2: index) {
    %cst = arith.constant dense<11> : vector<4xindex>
    vector.store %cst, %arg0[%arg1, %arg2] : memref<200x100xindex>, vector<4xindex>
    return
  }
}

// -----
module {
  func.func @store_index_scalable(%arg0: memref<200x100xindex>, %arg1: index, %arg2: index) {
    %cst = arith.constant dense<11> : vector<[4]xindex>
    vector.store %cst, %arg0[%arg1, %arg2] : memref<200x100xindex>, vector<[4]xindex>
    return
  }
}

// -----
module {
  func.func @store_0d(%arg0: memref<200x100xf32>, %arg1: index, %arg2: index) {
    %cst = arith.constant dense<1.100000e+01> : vector<f32>
    vector.store %cst, %arg0[%arg1, %arg2] : memref<200x100xf32>, vector<f32>
    return
  }
}

// -----
module {
  func.func @store_with_alignment(%arg0: memref<200x100xf32>, %arg1: index, %arg2: index, %arg3: vector<4xf32>) {
    vector.store %arg3, %arg0[%arg1, %arg2] {alignment = 8 : i64} : memref<200x100xf32>, vector<4xf32>
    return
  }
}

