module {
  func.func @fold_static_stride_subview_with_affine_load_store(%arg0: memref<12x32xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) -> f32 {
    %subview = memref.subview %arg0[%arg1, %arg2] [4, 4] [2, 3] : memref<12x32xf32> to memref<4x4xf32, strided<[64, 3], offset: ?>>
    %0 = affine.load %subview[%arg3, %arg4] : memref<4x4xf32, strided<[64, 3], offset: ?>>
    affine.store %0, %subview[%arg3, %arg4] : memref<4x4xf32, strided<[64, 3], offset: ?>>
    return %0 : f32
  }
}

// -----
module {
  func.func @fold_static_stride_subview_with_affine_load_store_expand_shape(%arg0: memref<12x32xf32>, %arg1: index, %arg2: index, %arg3: index) -> f32 {
    %expand_shape = memref.expand_shape %arg0 [[0, 1], [2]] output_shape [2, 6, 32] : memref<12x32xf32> into memref<2x6x32xf32>
    %0 = affine.load %expand_shape[%arg1, %arg2, %arg3] : memref<2x6x32xf32>
    return %0 : f32
  }
}

// -----
module {
  func.func @fold_static_stride_subview_with_affine_load_store_collapse_shape(%arg0: memref<2x6x32xf32>, %arg1: index, %arg2: index) -> f32 {
    %collapse_shape = memref.collapse_shape %arg0 [[0, 1], [2]] : memref<2x6x32xf32> into memref<12x32xf32>
    %0 = affine.load %collapse_shape[%arg1, %arg2] : memref<12x32xf32>
    return %0 : f32
  }
}

// -----
module {
  func.func @fold_dynamic_size_collapse_shape_with_affine_load(%arg0: memref<?x6x32xf32>, %arg1: index, %arg2: index) -> f32 {
    %collapse_shape = memref.collapse_shape %arg0 [[0, 1], [2]] : memref<?x6x32xf32> into memref<?x32xf32>
    %0 = affine.load %collapse_shape[%arg1, %arg2] : memref<?x32xf32>
    return %0 : f32
  }
}

// -----
module {
  func.func @fold_fully_dynamic_size_collapse_shape_with_affine_load(%arg0: memref<?x?x?xf32>, %arg1: index, %arg2: index) -> f32 {
    %collapse_shape = memref.collapse_shape %arg0 [[0, 1], [2]] : memref<?x?x?xf32> into memref<?x?xf32>
    %0 = affine.load %collapse_shape[%arg1, %arg2] : memref<?x?xf32>
    return %0 : f32
  }
}

// -----
module {
  func.func @fold_static_stride_subview_with_affine_load_store_expand_shape_3d(%arg0: memref<12x32xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) -> f32 {
    %expand_shape = memref.expand_shape %arg0 [[0, 1, 2], [3]] output_shape [2, 2, 3, 32] : memref<12x32xf32> into memref<2x2x3x32xf32>
    %0 = affine.load %expand_shape[%arg1, %arg2, %arg3, %arg4] : memref<2x2x3x32xf32>
    return %0 : f32
  }
}

// -----
module {
  func.func @fold_memref_alias_expand_shape_subview_load_store_dynamic_dim(%arg0: memref<2048x16xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) {
    %subview = memref.subview %arg0[%arg2, 0] [%arg1, 16] [1, 1] : memref<2048x16xf32> to memref<?x16xf32, strided<[16, 1], offset: ?>>
    %expand_shape = memref.expand_shape %subview [[0], [1, 2, 3]] output_shape [%arg4, 1, 8, 2] : memref<?x16xf32, strided<[16, 1], offset: ?>> into memref<?x1x8x2xf32, strided<[16, 16, 2, 1], offset: ?>>
    %dim = memref.dim %expand_shape, %arg3 : memref<?x1x8x2xf32, strided<[16, 16, 2, 1], offset: ?>>
    affine.for %arg5 = 0 to %dim step 64 {
      affine.for %arg6 = 0 to 16 step 16 {
        %0 = affine.load %expand_shape[%arg5, 0, %arg6, %arg6] : memref<?x1x8x2xf32, strided<[16, 16, 2, 1], offset: ?>>
        affine.store %0, %subview[%arg5, %arg6] : memref<?x16xf32, strided<[16, 1], offset: ?>>
      }
    }
    return
  }
}

// -----
module {
  func.func @fold_static_stride_subview_with_affine_load_store_expand_shape_loops(%arg0: memref<1024x1024xf32>, %arg1: memref<1xf32>, %arg2: index) -> f32 {
    %expand_shape = memref.expand_shape %arg0 [[0, 1], [2, 3]] output_shape [1, 1024, 1024, 1] : memref<1024x1024xf32> into memref<1x1024x1024x1xf32>
    affine.for %arg3 = 0 to 1 {
      affine.for %arg4 = 0 to 1024 {
        affine.for %arg5 = 0 to 1020 {
          affine.for %arg6 = 0 to 1 {
            %1 = affine.load %expand_shape[%arg3, %arg4, %arg5, %arg6] : memref<1x1024x1024x1xf32>
            affine.store %1, %arg1[%arg2] : memref<1xf32>
          }
        }
      }
    }
    %0 = affine.load %arg1[%arg2] : memref<1xf32>
    return %0 : f32
  }
}

// -----
module {
  func.func @fold_static_stride_subview_with_affine_load_store_expand_shape_when_access_index_is_an_expression(%arg0: memref<1024x1024xf32>, %arg1: memref<1xf32>, %arg2: index) -> f32 {
    %expand_shape = memref.expand_shape %arg0 [[0, 1], [2, 3]] output_shape [1, 1024, 1024, 1] : memref<1024x1024xf32> into memref<1x1024x1024x1xf32>
    affine.for %arg3 = 0 to 1 {
      affine.for %arg4 = 0 to 1024 {
        affine.for %arg5 = 0 to 1020 {
          affine.for %arg6 = 0 to 1 {
            %1 = affine.load %expand_shape[%arg3, %arg3 + %arg4, %arg5, %arg6] : memref<1x1024x1024x1xf32>
            affine.store %1, %arg1[%arg2] : memref<1xf32>
          }
        }
      }
    }
    %0 = affine.load %arg1[%arg2] : memref<1xf32>
    return %0 : f32
  }
}

// -----
module {
  func.func @fold_static_stride_subview_with_affine_load_store_collapse_shape_with_0d_result(%arg0: memref<1xf32>, %arg1: memref<1xf32>) -> memref<1xf32> {
    %collapse_shape = memref.collapse_shape %arg0 [] : memref<1xf32> into memref<f32>
    affine.for %arg2 = 0 to 3 {
      %0 = affine.load %collapse_shape[] : memref<f32>
      affine.store %0, %arg1[0] : memref<1xf32>
    }
    return %arg1 : memref<1xf32>
  }
}

