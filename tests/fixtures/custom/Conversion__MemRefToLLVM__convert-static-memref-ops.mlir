module {
  func.func @zero_d_alloc() -> memref<f32> {
    %alloc = memref.alloc() : memref<f32>
    return %alloc : memref<f32>
  }
}

// -----
module {
  func.func @zero_d_dealloc(%arg0: memref<f32>) {
    memref.dealloc %arg0 : memref<f32>
    return
  }
}

// -----
module {
  func.func @aligned_1d_alloc() -> memref<42xf32> {
    %alloc = memref.alloc() {alignment = 8 : i64} : memref<42xf32>
    return %alloc : memref<42xf32>
  }
}

// -----
module {
  func.func @static_alloc() -> memref<32x18xf32> {
    %alloc = memref.alloc() : memref<32x18xf32>
    return %alloc : memref<32x18xf32>
  }
}

// -----
module {
  func.func @static_alloca() -> memref<32x18xf32> {
    %alloca = memref.alloca() : memref<32x18xf32>
    %alloca_0 = memref.alloca() {alignment = 32 : i64} : memref<32x18xf32>
    return %alloca : memref<32x18xf32>
  }
}

// -----
module {
  func.func @static_alloca_zero() -> memref<32x0x18xf32> {
    %alloca = memref.alloca() : memref<32x0x18xf32>
    return %alloca : memref<32x0x18xf32>
  }
}

// -----
module {
  func.func @static_dealloc(%arg0: memref<10x8xf32>) {
    memref.dealloc %arg0 : memref<10x8xf32>
    return
  }
}

// -----
module {
  func.func @zero_d_load(%arg0: memref<f32>) -> f32 {
    %0 = memref.load %arg0[] : memref<f32>
    return %0 : f32
  }
}

// -----
module {
  func.func @static_load(%arg0: memref<10x42xf32>, %arg1: index, %arg2: index) {
    %0 = memref.load %arg0[%arg1, %arg2] : memref<10x42xf32>
    return
  }
}

// -----
module {
  func.func @zero_d_store(%arg0: memref<f32>, %arg1: f32) {
    memref.store %arg1, %arg0[] : memref<f32>
    return
  }
}

// -----
module {
  func.func @static_store(%arg0: memref<10x42xf32>, %arg1: index, %arg2: index, %arg3: f32) {
    memref.store %arg3, %arg0[%arg1, %arg2] : memref<10x42xf32>
    return
  }
}

// -----
module {
  func.func @static_memref_dim(%arg0: memref<42x32x15x13x27xf32>) {
    %c0 = arith.constant 0 : index
    %dim = memref.dim %arg0, %c0 : memref<42x32x15x13x27xf32>
    %c1 = arith.constant 1 : index
    %dim_0 = memref.dim %arg0, %c1 : memref<42x32x15x13x27xf32>
    %c2 = arith.constant 2 : index
    %dim_1 = memref.dim %arg0, %c2 : memref<42x32x15x13x27xf32>
    %c3 = arith.constant 3 : index
    %dim_2 = memref.dim %arg0, %c3 : memref<42x32x15x13x27xf32>
    %c4 = arith.constant 4 : index
    %dim_3 = memref.dim %arg0, %c4 : memref<42x32x15x13x27xf32>
    return
  }
}

// -----
module {
  func.func @static_out_of_bound_memref_dim(%arg0: memref<42x32x15x13x27xf32>) -> index {
    %c-7 = arith.constant -7 : index
    %dim = memref.dim %arg0, %c-7 : memref<42x32x15x13x27xf32>
    return %dim : index
  }
}

// -----
module attributes {dlti.dl_spec = #dlti.dl_spec<index = 32 : i64>} {
  func.func @address() {
    %c1 = arith.constant 1 : index
    %alloc = memref.alloc(%c1) : memref<?xvector<2xf32>>
    return
  }
}

// -----
module {
  memref.global "private" constant @__constant_3xi64 : memref<3xi64> = dense<[2, 6, 20]>
  func.func @memref.reshape(%arg0: memref<4x5x6xf32>) -> memref<2x6x20xf32> {
    %0 = memref.get_global @__constant_3xi64 : memref<3xi64>
    %reshape = memref.reshape %arg0(%0) : (memref<4x5x6xf32>, memref<3xi64>) -> memref<2x6x20xf32>
    return %reshape : memref<2x6x20xf32>
  }
}

// -----
module {
  func.func @memref.reshape.dynamic.dim(%arg0: memref<?x?x?xf32>, %arg1: memref<4xi64>) -> memref<?x?x12x32xf32> {
    %reshape = memref.reshape %arg0(%arg1) : (memref<?x?x?xf32>, memref<4xi64>) -> memref<?x?x12x32xf32>
    return %reshape : memref<?x?x12x32xf32>
  }
}

// -----
module {
  func.func @memref.reshape_index(%arg0: memref<?x?xi32>, %arg1: memref<1xindex>) -> memref<?xi32> {
    %reshape = memref.reshape %arg0(%arg1) : (memref<?x?xi32>, memref<1xindex>) -> memref<?xi32>
    return %reshape : memref<?xi32>
  }
  func.func @memref_memory_space_cast(%arg0: memref<?xf32>) -> memref<?xf32, 1> {
    %memspacecast = memref.memory_space_cast %arg0 : memref<?xf32> to memref<?xf32, 1>
    return %memspacecast : memref<?xf32, 1>
  }
}

