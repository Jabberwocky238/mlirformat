module {
}

// -----
module {
  func.func @subview(%arg0: memref<64x4xf32, strided<[4, 1]>>, %arg1: index, %arg2: index, %arg3: index) -> memref<?x?xf32, strided<[?, ?], offset: ?>> {
    %subview = memref.subview %arg0[%arg1, %arg2] [%arg1, %arg2] [%arg1, %arg2] : memref<64x4xf32, strided<[4, 1]>> to memref<?x?xf32, strided<[?, ?], offset: ?>>
    return %subview : memref<?x?xf32, strided<[?, ?], offset: ?>>
  }
}

// -----
module {
  func.func @subview_non_zero_addrspace(%arg0: memref<64x4xf32, strided<[4, 1]>, 3>, %arg1: index, %arg2: index, %arg3: index) -> memref<?x?xf32, strided<[?, ?], offset: ?>, 3> {
    %subview = memref.subview %arg0[%arg1, %arg2] [%arg1, %arg2] [%arg1, %arg2] : memref<64x4xf32, strided<[4, 1]>, 3> to memref<?x?xf32, strided<[?, ?], offset: ?>, 3>
    return %subview : memref<?x?xf32, strided<[?, ?], offset: ?>, 3>
  }
}

// -----
module {
  func.func @subview_const_size(%arg0: memref<64x4xf32, strided<[4, 1]>>, %arg1: index, %arg2: index, %arg3: index) -> memref<4x2xf32, strided<[?, ?], offset: ?>> {
    %subview = memref.subview %arg0[%arg1, %arg2] [4, 2] [%arg1, %arg2] : memref<64x4xf32, strided<[4, 1]>> to memref<4x2xf32, strided<[?, ?], offset: ?>>
    return %subview : memref<4x2xf32, strided<[?, ?], offset: ?>>
  }
}

// -----
module {
  func.func @subview_const_stride(%arg0: memref<64x4xf32, strided<[4, 1]>>, %arg1: index, %arg2: index, %arg3: index) -> memref<?x?xf32, strided<[4, 2], offset: ?>> {
    %subview = memref.subview %arg0[%arg1, %arg2] [%arg1, %arg2] [1, 2] : memref<64x4xf32, strided<[4, 1]>> to memref<?x?xf32, strided<[4, 2], offset: ?>>
    return %subview : memref<?x?xf32, strided<[4, 2], offset: ?>>
  }
}

// -----
module {
  func.func @subview_const_stride_and_offset(%arg0: memref<64x8xf32, strided<[8, 1]>>) -> memref<62x3xf32, strided<[8, 1], offset: 2>> {
    %subview = memref.subview %arg0[0, 2] [62, 3] [1, 1] : memref<64x8xf32, strided<[8, 1]>> to memref<62x3xf32, strided<[8, 1], offset: 2>>
    return %subview : memref<62x3xf32, strided<[8, 1], offset: 2>>
  }
}

// -----
module {
  func.func @subview_mixed_static_dynamic(%arg0: memref<64x4xf32, strided<[4, 1]>>, %arg1: index, %arg2: index, %arg3: index) -> memref<62x?xf32, strided<[?, 1], offset: ?>> {
    %subview = memref.subview %arg0[%arg2, 2] [62, %arg3] [%arg1, 1] : memref<64x4xf32, strided<[4, 1]>> to memref<62x?xf32, strided<[?, 1], offset: ?>>
    return %subview : memref<62x?xf32, strided<[?, 1], offset: ?>>
  }
}

// -----
module {
  func.func @subview_leading_operands(%arg0: memref<5x3xf32>, %arg1: memref<5x?xf32>) -> memref<3x3xf32, strided<[3, 1], offset: 6>> {
    %subview = memref.subview %arg0[2, 0] [3, 3] [1, 1] : memref<5x3xf32> to memref<3x3xf32, strided<[3, 1], offset: 6>>
    return %subview : memref<3x3xf32, strided<[3, 1], offset: 6>>
  }
}

// -----
module {
  func.func @subview_leading_operands_dynamic(%arg0: memref<5x?xf32>) -> memref<3x?xf32, strided<[?, 1], offset: ?>> {
    %c1 = arith.constant 1 : index
    %dim = memref.dim %arg0, %c1 : memref<5x?xf32>
    %subview = memref.subview %arg0[2, 0] [3, %dim] [1, 1] : memref<5x?xf32> to memref<3x?xf32, strided<[?, 1], offset: ?>>
    return %subview : memref<3x?xf32, strided<[?, 1], offset: ?>>
  }
}

// -----
module {
  func.func @subview_rank_reducing_leading_operands(%arg0: memref<5x3xf32>) -> memref<3xf32, strided<[1], offset: 3>> {
    %subview = memref.subview %arg0[1, 0] [1, 3] [1, 1] : memref<5x3xf32> to memref<3xf32, strided<[1], offset: 3>>
    return %subview : memref<3xf32, strided<[1], offset: 3>>
  }
}

// -----
module {
  func.func @subview_negative_stride(%arg0: memref<7xf32>) -> memref<7xf32, strided<[-1], offset: 6>> {
    %subview = memref.subview %arg0[6] [7] [-1] : memref<7xf32> to memref<7xf32, strided<[-1], offset: 6>>
    return %subview : memref<7xf32, strided<[-1], offset: 6>>
  }
}

// -----
module {
  func.func @collapse_shape_static(%arg0: memref<1x3x4x1x5xf32>) -> memref<3x4x5xf32> {
    %collapse_shape = memref.collapse_shape %arg0 [[0, 1], [2], [3, 4]] : memref<1x3x4x1x5xf32> into memref<3x4x5xf32>
    return %collapse_shape : memref<3x4x5xf32>
  }
}

// -----
module {
  func.func @collapse_shape_dynamic_with_non_identity_layout(%arg0: memref<4x?x?xf32, strided<[?, 4, 1], offset: ?>>) -> memref<4x?xf32, strided<[?, ?], offset: ?>> {
    %collapse_shape = memref.collapse_shape %arg0 [[0], [1, 2]] : memref<4x?x?xf32, strided<[?, 4, 1], offset: ?>> into memref<4x?xf32, strided<[?, ?], offset: ?>>
    return %collapse_shape : memref<4x?xf32, strided<[?, ?], offset: ?>>
  }
}

// -----
module {
  func.func @expand_shape_static(%arg0: memref<3x4x5xf32>) -> memref<1x3x4x1x5xf32> {
    %expand_shape = memref.expand_shape %arg0 [[0, 1], [2], [3, 4]] output_shape [1, 3, 4, 1, 5] : memref<3x4x5xf32> into memref<1x3x4x1x5xf32>
    return %expand_shape : memref<1x3x4x1x5xf32>
  }
}

// -----
module {
  func.func @collapse_shape_fold_zero_dim(%arg0: memref<1x1xf32>) -> memref<f32> {
    %collapse_shape = memref.collapse_shape %arg0 [] : memref<1x1xf32> into memref<f32>
    return %collapse_shape : memref<f32>
  }
}

// -----
module {
  func.func @expand_shape_zero_dim(%arg0: memref<f32>) -> memref<1x1xf32> {
    %expand_shape = memref.expand_shape %arg0 [] output_shape [1, 1] : memref<f32> into memref<1x1xf32>
    return %expand_shape : memref<1x1xf32>
  }
}

// -----
module {
  func.func @collapse_shape_dynamic(%arg0: memref<1x2x?xf32>) -> memref<1x?xf32> {
    %collapse_shape = memref.collapse_shape %arg0 [[0], [1, 2]] : memref<1x2x?xf32> into memref<1x?xf32>
    return %collapse_shape : memref<1x?xf32>
  }
}

// -----
module {
  func.func @expand_shape_dynamic(%arg0: memref<1x?xf32>, %arg1: index) -> memref<1x2x?xf32> {
    %expand_shape = memref.expand_shape %arg0 [[0], [1, 2]] output_shape [1, 2, %arg1] : memref<1x?xf32> into memref<1x2x?xf32>
    return %expand_shape : memref<1x2x?xf32>
  }
}

// -----
module {
  func.func @expand_shape_dynamic_with_non_identity_layout(%arg0: memref<1x?xf32, strided<[?, ?], offset: ?>>, %arg1: index) -> memref<1x2x?xf32, strided<[?, ?, ?], offset: ?>> {
    %expand_shape = memref.expand_shape %arg0 [[0], [1, 2]] output_shape [1, 2, %arg1] : memref<1x?xf32, strided<[?, ?], offset: ?>> into memref<1x2x?xf32, strided<[?, ?, ?], offset: ?>>
    return %expand_shape : memref<1x2x?xf32, strided<[?, ?, ?], offset: ?>>
  }
}

// -----
module {
  func.func @collapse_static_shape_with_non_identity_layout(%arg0: memref<1x1x8x8xf32, strided<[64, 64, 8, 1], offset: ?>>) -> memref<64xf32, strided<[1], offset: ?>> {
    %collapse_shape = memref.collapse_shape %arg0 [[0, 1, 2, 3]] : memref<1x1x8x8xf32, strided<[64, 64, 8, 1], offset: ?>> into memref<64xf32, strided<[1], offset: ?>>
    return %collapse_shape : memref<64xf32, strided<[1], offset: ?>>
  }
}

// -----
module {
  func.func @load_and_assume(%arg0: memref<?x?xf32, strided<[?, ?], offset: ?>>, %arg1: index, %arg2: index) -> f32 {
    %assume_align = memref.assume_alignment %arg0, 16 : memref<?x?xf32, strided<[?, ?], offset: ?>>
    %0 = memref.load %assume_align[%arg1, %arg2] : memref<?x?xf32, strided<[?, ?], offset: ?>>
    return %0 : f32
  }
}

