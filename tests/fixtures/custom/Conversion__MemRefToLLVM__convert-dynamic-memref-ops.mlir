module {
  func.func @mixed_alloc(%arg0: index, %arg1: index) -> memref<?x42x?xf32> {
    %alloc = memref.alloc(%arg0, %arg1) : memref<?x42x?xf32>
    return %alloc : memref<?x42x?xf32>
  }
}

// -----
module {
  func.func @mixed_dealloc(%arg0: memref<?x42x?xf32>) {
    memref.dealloc %arg0 : memref<?x42x?xf32>
    return
  }
}

// -----
module {
  func.func @unranked_dealloc(%arg0: memref<*xf32>) {
    memref.dealloc %arg0 : memref<*xf32>
    return
  }
}

// -----
module {
  func.func @dynamic_alloc(%arg0: index, %arg1: index) -> memref<?x?xf32> {
    %alloc = memref.alloc(%arg0, %arg1) : memref<?x?xf32>
    return %alloc : memref<?x?xf32>
  }
}

// -----
module {
  func.func @dynamic_alloca(%arg0: index, %arg1: index) -> memref<?x?xf32> {
    %alloca = memref.alloca(%arg0, %arg1) : memref<?x?xf32>
    %alloca_0 = memref.alloca(%arg0, %arg1) {alignment = 32 : i64} : memref<?x?xf32>
    return %alloca : memref<?x?xf32>
  }
}

// -----
module {
  func.func @dynamic_dealloc(%arg0: memref<?x?xf32>) {
    memref.dealloc %arg0 : memref<?x?xf32>
    return
  }
}

// -----
module {
  func.func @stdlib_aligned_alloc(%arg0: index) -> memref<32x18xf32> {
    %alloc = memref.alloc() {alignment = 32 : i64} : memref<32x18xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<4096xf32>
    %alloc_1 = memref.alloc() : memref<4096xvector<8xf32>>
    %alloc_2 = memref.alloc() : memref<4096xvector<2xf32>>
    %alloc_3 = memref.alloc() {alignment = 8 : i64} : memref<1024xvector<4xf32>>
    %alloc_4 = memref.alloc() {alignment = 32 : i64} : memref<100xf32>
    %alloc_5 = memref.alloc(%arg0) : memref<?xvector<18xf32>>
    return %alloc : memref<32x18xf32>
  }
}

// -----
module {
  func.func @mixed_load(%arg0: memref<42x?xf32>, %arg1: index, %arg2: index) {
    %0 = memref.load %arg0[%arg1, %arg2] : memref<42x?xf32>
    return
  }
}

// -----
module {
  func.func @dynamic_load(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index) {
    %0 = memref.load %arg0[%arg1, %arg2] : memref<?x?xf32>
    return
  }
}

// -----
module {
  func.func @prefetch(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index) {
    memref.prefetch %arg0[%arg1, %arg2], write, locality<3>, data : memref<?x?xf32>
    memref.prefetch %arg0[%arg1, %arg2], read, locality<0>, data : memref<?x?xf32>
    memref.prefetch %arg0[%arg1, %arg2], read, locality<2>, instr : memref<?x?xf32>
    return
  }
}

// -----
module {
  func.func @dynamic_store(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index, %arg3: f32) {
    memref.store %arg3, %arg0[%arg1, %arg2] : memref<?x?xf32>
    return
  }
}

// -----
module {
  func.func @mixed_store(%arg0: memref<42x?xf32>, %arg1: index, %arg2: index, %arg3: f32) {
    memref.store %arg3, %arg0[%arg1, %arg2] : memref<42x?xf32>
    return
  }
}

// -----
module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr = dense<64> : vector<3xi64>, !llvm.ptr<1> = dense<32> : vector<3xi64>>} {
  func.func @memref_memory_space_cast(%arg0: memref<*xf32>) -> memref<*xf32, 1> {
    %memspacecast = memref.memory_space_cast %arg0 : memref<*xf32> to memref<*xf32, 1>
    return %memspacecast : memref<*xf32, 1>
  }
}

// -----
module {
  func.func @memref_cast_static_to_dynamic(%arg0: memref<10x42xf32>) {
    %cast = memref.cast %arg0 : memref<10x42xf32> to memref<?x?xf32>
    return
  }
}

// -----
module {
  func.func @memref_cast_static_to_mixed(%arg0: memref<10x42xf32>) {
    %cast = memref.cast %arg0 : memref<10x42xf32> to memref<?x42xf32>
    return
  }
}

// -----
module {
  func.func @memref_cast_dynamic_to_static(%arg0: memref<?x?xf32>) {
    %cast = memref.cast %arg0 : memref<?x?xf32> to memref<10x12xf32>
    return
  }
}

// -----
module {
  func.func @memref_cast_dynamic_to_mixed(%arg0: memref<?x?xf32>) {
    %cast = memref.cast %arg0 : memref<?x?xf32> to memref<?x12xf32>
    return
  }
}

// -----
module {
  func.func @memref_cast_mixed_to_dynamic(%arg0: memref<42x?xf32>) {
    %cast = memref.cast %arg0 : memref<42x?xf32> to memref<?x?xf32>
    return
  }
}

// -----
module {
  func.func @memref_cast_mixed_to_static(%arg0: memref<42x?xf32>) {
    %cast = memref.cast %arg0 : memref<42x?xf32> to memref<42x1xf32>
    return
  }
}

// -----
module {
  func.func @memref_cast_mixed_to_mixed(%arg0: memref<42x?xf32>) {
    %cast = memref.cast %arg0 : memref<42x?xf32> to memref<?x1xf32>
    return
  }
}

// -----
module {
  func.func @memref_cast_ranked_to_unranked(%arg0: memref<42x2x?xf32>) {
    %cast = memref.cast %arg0 : memref<42x2x?xf32> to memref<*xf32>
    return
  }
}

// -----
module {
  func.func @memref_cast_unranked_to_ranked(%arg0: memref<*xf32>) {
    %cast = memref.cast %arg0 : memref<*xf32> to memref<?x?x10x2xf32>
    return
  }
}

// -----
module {
  func.func @mixed_memref_dim(%arg0: memref<42x?x?x13x?xf32>) {
    %c0 = arith.constant 0 : index
    %dim = memref.dim %arg0, %c0 : memref<42x?x?x13x?xf32>
    %c1 = arith.constant 1 : index
    %dim_0 = memref.dim %arg0, %c1 : memref<42x?x?x13x?xf32>
    %c2 = arith.constant 2 : index
    %dim_1 = memref.dim %arg0, %c2 : memref<42x?x?x13x?xf32>
    %c3 = arith.constant 3 : index
    %dim_2 = memref.dim %arg0, %c3 : memref<42x?x?x13x?xf32>
    %c4 = arith.constant 4 : index
    %dim_3 = memref.dim %arg0, %c4 : memref<42x?x?x13x?xf32>
    return
  }
}

// -----
module {
  func.func @memref_dim_with_dyn_index(%arg0: memref<3x?xf32>, %arg1: index) -> index {
    %dim = memref.dim %arg0, %arg1 : memref<3x?xf32>
    return %dim : index
  }
}

// -----
module {
  func.func @memref_reinterpret_cast_ranked_to_static_shape(%arg0: memref<2x3xf32>) {
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [0], sizes: [6, 1], strides: [1, 1] : memref<2x3xf32> to memref<6x1xf32>
    return
  }
}

// -----
module {
  func.func @memref_reinterpret_cast_unranked_to_dynamic_shape(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: memref<*xf32>) {
    %reinterpret_cast = memref.reinterpret_cast %arg5 to offset: [%arg0], sizes: [%arg1, %arg2], strides: [%arg3, %arg4] : memref<*xf32> to memref<?x?xf32, strided<[?, ?], offset: ?>>
    return
  }
}

// -----
module {
  func.func @memref_reshape(%arg0: memref<2x3xf32>, %arg1: memref<?xindex>) {
    %reshape = memref.reshape %arg0(%arg1) : (memref<2x3xf32>, memref<?xindex>) -> memref<*xf32>
    return
  }
}

// -----
module {
  func.func @memref_of_memref() {
    %alloc = memref.alloc() : memref<1xmemref<1xf32>>
    return
  }
}

// -----
module attributes {dlti.dl_spec = #dlti.dl_spec<index = 32 : i64>} {
  func.func @memref_of_memref_32() {
    %alloc = memref.alloc() : memref<1xmemref<1xf32>>
    return
  }
}

// -----
module {
  func.func @memref_of_memref_of_memref() {
    %alloc = memref.alloc() : memref<1xmemref<2xmemref<3xf32>>>
    return
  }
}

// -----
module {
  func.func @ranked_unranked() {
    %alloc = memref.alloc() : memref<1xmemref<*xf32>>
    %cast = memref.cast %alloc : memref<1xmemref<*xf32>> to memref<*xmemref<*xf32>>
    return
  }
}

// -----
module {
  func.func @memref_load_neg_stride(%arg0: memref<2000xf32>) -> f32 {
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [1000], sizes: [100], strides: [-1] : memref<2000xf32> to memref<100xf32, strided<[-1], offset: 1000>>
    %c5 = arith.constant 5 : index
    %0 = memref.load %reinterpret_cast[%c5] : memref<100xf32, strided<[-1], offset: 1000>>
    return %0 : f32
  }
}

