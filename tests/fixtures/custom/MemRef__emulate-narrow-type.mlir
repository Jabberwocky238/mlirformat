module {
  func.func @memref_i8() -> i8 {
    %c3 = arith.constant 3 : index
    %alloc = memref.alloc() : memref<4xi8, 1>
    %0 = memref.load %alloc[%c3] : memref<4xi8, 1>
    memref.dealloc %alloc : memref<4xi8, 1>
    return %0 : i8
  }
}

// -----
module {
  func.func @memref_load_i4(%arg0: index) -> i4 {
    %alloc = memref.alloc() : memref<5xi4>
    %0 = memref.load %alloc[%arg0] : memref<5xi4>
    return %0 : i4
  }
}

// -----
module {
  func.func @memref_load_f4(%arg0: index) -> f4E2M1FN {
    %alloc = memref.alloc() : memref<5xf4E2M1FN>
    %0 = memref.load %alloc[%arg0] : memref<5xf4E2M1FN>
    return %0 : f4E2M1FN
  }
}

// -----
module {
  func.func @memref_load_i4_rank2(%arg0: index, %arg1: index) -> i4 {
    %alloc = memref.alloc() : memref<3x125xi4>
    %assume_align = memref.assume_alignment %alloc, 64 : memref<3x125xi4>
    %0 = memref.load %assume_align[%arg0, %arg1] : memref<3x125xi4>
    return %0 : i4
  }
}

// -----
module {
  func.func @memref_load_i4_dynamic(%arg0: index, %arg1: index, %arg2: index, %arg3: index) -> i4 {
    %alloc = memref.alloc(%arg0, %arg1) : memref<?x?xi4>
    %0 = memref.load %alloc[%arg2, %arg3] : memref<?x?xi4>
    return %0 : i4
  }
}

// -----
module {
  func.func @rank_zero_memref() -> i4 {
    %alloc = memref.alloc() : memref<i4>
    %0 = memref.load %alloc[] : memref<i4>
    return %0 : i4
  }
}

// -----
module {
  func.func @memref_strided_i4(%arg0: index) -> i4 {
    %alloc = memref.alloc() : memref<128xi4>
    %subview = memref.subview %alloc[32] [32] [1] : memref<128xi4> to memref<32xi4, strided<[1], offset: 32>>
    %0 = memref.load %subview[%arg0] : memref<32xi4, strided<[1], offset: 32>>
    return %0 : i4
  }
}

// -----
module {
  func.func @memref_subview_dynamic_offset_i4(%arg0: index) -> i4 {
    %c0 = arith.constant 0 : index
    %alloc = memref.alloc() : memref<512x64x8x16xi4>
    %subview = memref.subview %alloc[%arg0, 0, 0, 0] [16, 64, 8, 16] [1, 1, 1, 1] : memref<512x64x8x16xi4> to memref<16x64x8x16xi4, strided<[8192, 128, 16, 1], offset: ?>>
    %0 = memref.load %subview[%c0, %c0, %c0, %c0] : memref<16x64x8x16xi4, strided<[8192, 128, 16, 1], offset: ?>>
    return %0 : i4
  }
}

// -----
module {
  func.func @negative_memref_subview_non_contiguous(%arg0: index) -> i4 {
    %c0 = arith.constant 0 : index
    %alloc = memref.alloc() : memref<40x40xi4>
    %subview = memref.subview %alloc[%arg0, 0] [4, 8] [1, 1] : memref<40x40xi4> to memref<4x8xi4, strided<[40, 1], offset: ?>>
    %0 = memref.load %subview[%c0, %c0] : memref<4x8xi4, strided<[40, 1], offset: ?>>
    return %0 : i4
  }
}

// -----
module {
  func.func @reinterpret_cast_memref_load_0D() -> i4 {
    %alloc = memref.alloc() : memref<5xi4>
    %reinterpret_cast = memref.reinterpret_cast %alloc to offset: [0], sizes: [], strides: [] : memref<5xi4> to memref<i4>
    %0 = memref.load %reinterpret_cast[] : memref<i4>
    return %0 : i4
  }
}

// -----
module {
  func.func @reinterpret_cast_memref_load_1D(%arg0: index) -> i4 {
    %alloc = memref.alloc() : memref<5x5xi4>
    %reinterpret_cast = memref.reinterpret_cast %alloc to offset: [8], sizes: [25], strides: [1] : memref<5x5xi4> to memref<25xi4, strided<[1], offset: 8>>
    %0 = memref.load %reinterpret_cast[%arg0] : memref<25xi4, strided<[1], offset: 8>>
    return %0 : i4
  }
}

// -----
module {
  func.func @memref_alloca_load_i4(%arg0: index) -> i4 {
    %alloca = memref.alloca() : memref<5xi4>
    %0 = memref.load %alloca[%arg0] : memref<5xi4>
    return %0 : i4
  }
}

// -----
module {
  func.func @memref_store_i4(%arg0: index, %arg1: i4) {
    %alloc = memref.alloc() : memref<5xi4>
    memref.store %arg1, %alloc[%arg0] : memref<5xi4>
    return
  }
}

// -----
module {
  func.func @memref_store_i4_rank2(%arg0: index, %arg1: index, %arg2: i4) {
    %alloc = memref.alloc() : memref<3x125xi4>
    %assume_align = memref.assume_alignment %alloc, 64 : memref<3x125xi4>
    memref.store %arg2, %assume_align[%arg0, %arg1] : memref<3x125xi4>
    return
  }
}

// -----
module {
  func.func @memref_store_i4_dynamic(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: i4) {
    %alloc = memref.alloc(%arg0, %arg1) : memref<?x?xi4>
    memref.store %arg4, %alloc[%arg2, %arg3] : memref<?x?xi4>
    return
  }
}

// -----
module {
  func.func @rank_zero_memref_store(%arg0: i4) {
    %alloc = memref.alloc() : memref<i4>
    memref.store %arg0, %alloc[] : memref<i4>
    return
  }
}

// -----
module {
  func.func @rank_zero_memref_store_f4(%arg0: f4E2M1FN) {
    %alloc = memref.alloc() : memref<f4E2M1FN>
    memref.store %arg0, %alloc[] : memref<f4E2M1FN>
    return
  }
}

// -----
module {
  func.func @memref_collapse_shape_i4(%arg0: index, %arg1: index) -> i4 {
    %alloc = memref.alloc() : memref<32x8x128xi4>
    %collapse_shape = memref.collapse_shape %alloc [[0, 1], [2]] : memref<32x8x128xi4> into memref<256x128xi4>
    %0 = memref.load %collapse_shape[%arg0, %arg1] : memref<256x128xi4>
    return %0 : i4
  }
}

// -----
module {
  func.func @memref_expand_shape_i4(%arg0: index, %arg1: index, %arg2: index) -> i4 {
    %alloc = memref.alloc() : memref<256x128xi4>
    %expand_shape = memref.expand_shape %alloc [[0, 1], [2]] output_shape [32, 8, 128] : memref<256x128xi4> into memref<32x8x128xi4>
    %0 = memref.load %expand_shape[%arg0, %arg1, %arg2] : memref<32x8x128xi4>
    return %0 : i4
  }
}

// -----
module {
  func.func @memref_memory_space_cast_i4(%arg0: memref<32x128xi4, 1>) -> memref<32x128xi4> {
    %memspacecast = memref.memory_space_cast %arg0 : memref<32x128xi4, 1> to memref<32x128xi4>
    return %memspacecast : memref<32x128xi4>
  }
}

// -----
module {
  func.func @memref_copy_i4(%arg0: memref<32x128xi4, 1>, %arg1: memref<32x128xi4>) {
    memref.copy %arg0, %arg1 : memref<32x128xi4, 1> to memref<32x128xi4>
    return
  }
}

// -----
module {
  func.func @alloc_non_contiguous() {
    %alloc = memref.alloc() : memref<8x8xi4, strided<[1, 8]>>
    return
  }
}

// -----
module {
  func.func @argument_non_contiguous(%arg0: memref<8x8xi4, strided<[1, 8]>>) {
    return
  }
}

