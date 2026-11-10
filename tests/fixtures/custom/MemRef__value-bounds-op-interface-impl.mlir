module {
  func.func @memref_alloc(%arg0: index) -> (index, index) {
    %alloc = memref.alloc(%arg0) : memref<6x?xf32>
    %0 = "test.reify_bound"(%alloc) <{dim = 0 : i64, type = "EQ"}> : (memref<6x?xf32>) -> index
    %1 = "test.reify_bound"(%alloc) <{dim = 1 : i64, type = "EQ"}> : (memref<6x?xf32>) -> index
    return %0, %1 : index, index
  }
}

// -----
module {
  func.func @memref_alloca(%arg0: index) -> (index, index) {
    %alloca = memref.alloca(%arg0) : memref<6x?xf32>
    %0 = "test.reify_bound"(%alloca) <{dim = 0 : i64, type = "EQ"}> : (memref<6x?xf32>) -> index
    %1 = "test.reify_bound"(%alloca) <{dim = 1 : i64, type = "EQ"}> : (memref<6x?xf32>) -> index
    return %0, %1 : index, index
  }
}

// -----
module {
  func.func @memref_assume_alignment(%arg0: index) -> (index, index) {
    %alloc = memref.alloc(%arg0) : memref<6x?xf32>
    %assume_align = memref.assume_alignment %alloc, 16 : memref<6x?xf32>
    %0 = "test.reify_bound"(%assume_align) <{dim = 0 : i64, type = "EQ"}> : (memref<6x?xf32>) -> index
    %1 = "test.reify_bound"(%assume_align) <{dim = 1 : i64, type = "EQ"}> : (memref<6x?xf32>) -> index
    return %0, %1 : index, index
  }
}

// -----
module {
  func.func @memref_cast(%arg0: memref<10xf32>) -> index {
    %cast = memref.cast %arg0 : memref<10xf32> to memref<?xf32>
    %0 = "test.reify_bound"(%cast) <{dim = 0 : i64, type = "EQ"}> : (memref<?xf32>) -> index
    return %0 : index
  }
}

// -----
module {
  func.func @memref_dim(%arg0: memref<?xf32>) -> index {
    %c0 = arith.constant 0 : index
    %dim = memref.dim %arg0, %c0 : memref<?xf32>
    %0 = "test.reify_bound"(%dim) <{type = "EQ"}> : (index) -> index
    return %0 : index
  }
}

// -----
module {
  func.func @memref_expand(%arg0: memref<?xf32>, %arg1: index) -> (index, index) {
    %expand_shape = memref.expand_shape %arg0 [[0, 1]] output_shape [4, %arg1] : memref<?xf32> into memref<4x?xf32>
    %0 = "test.reify_bound"(%expand_shape) <{dim = 0 : i64, type = "EQ"}> : (memref<4x?xf32>) -> index
    %1 = "test.reify_bound"(%expand_shape) <{dim = 1 : i64, type = "EQ"}> : (memref<4x?xf32>) -> index
    return %0, %1 : index, index
  }
}

// -----
module {
  func.func @memref_extract_strided_metadata_static_metadata(%arg0: memref<4x?xf32, strided<[11, 7], offset: 5>>) -> (index, index, index, index, index) {
    %base_buffer, %offset, %sizes:2, %strides:2 = memref.extract_strided_metadata %arg0 : memref<4x?xf32, strided<[11, 7], offset: 5>> -> memref<f32>, index, index, index, index, index
    %0 = "test.reify_bound"(%offset) <{type = "EQ"}> : (index) -> index
    %1 = "test.reify_bound"(%sizes#0) <{type = "EQ"}> : (index) -> index
    %2 = "test.reify_bound"(%sizes#1) <{type = "EQ"}> : (index) -> index
    %3 = "test.reify_bound"(%strides#0) <{type = "EQ"}> : (index) -> index
    %4 = "test.reify_bound"(%strides#1) <{type = "EQ"}> : (index) -> index
    return %0, %1, %2, %3, %4 : index, index, index, index, index
  }
}

// -----
module {
  func.func @memref_collapse(%arg0: index) -> (index, index) {
    %alloc = memref.alloc(%arg0) : memref<3x4x?x2xf32>
    %collapse_shape = memref.collapse_shape %alloc [[0, 1], [2, 3]] : memref<3x4x?x2xf32> into memref<12x?xf32>
    %0 = "test.reify_bound"(%collapse_shape) <{dim = 0 : i64, type = "EQ"}> : (memref<12x?xf32>) -> index
    %1 = "test.reify_bound"(%collapse_shape) <{dim = 1 : i64, type = "EQ"}> : (memref<12x?xf32>) -> index
    return %0, %1 : index, index
  }
}

// -----
module {
  memref.global "private" @gv0 : memref<4xf32> = dense<[0.000000e+00, 1.000000e+00, 2.000000e+00, 3.000000e+00]>
  func.func @memref_get_global() -> index {
    %0 = memref.get_global @gv0 : memref<4xf32>
    %1 = "test.reify_bound"(%0) <{dim = 0 : i64, type = "EQ"}> : (memref<4xf32>) -> index
    return %1 : index
  }
}

// -----
module {
  func.func @memref_rank(%arg0: memref<5xf32>) -> index {
    %0 = memref.rank %arg0 : memref<5xf32>
    %1 = "test.reify_bound"(%0) <{type = "EQ"}> : (index) -> index
    return %1 : index
  }
}

// -----
module {
  func.func @memref_subview(%arg0: memref<?xf32>, %arg1: index) -> index {
    %subview = memref.subview %arg0[2] [%arg1] [1] : memref<?xf32> to memref<?xf32, strided<[1], offset: 2>>
    %0 = "test.reify_bound"(%subview) <{dim = 0 : i64, type = "EQ"}> : (memref<?xf32, strided<[1], offset: 2>>) -> index
    return %0 : index
  }
}

