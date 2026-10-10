module {
  func.func @extract_strided_metadata_constants(%arg0: memref<5x4xf32, strided<[4, 1], offset: 2>>) -> (memref<f32>, index, index, index, index, index) {
    %base_buffer, %offset, %sizes:2, %strides:2 = memref.extract_strided_metadata %arg0 : memref<5x4xf32, strided<[4, 1], offset: 2>> -> memref<f32>, index, index, index, index, index
    return %base_buffer, %offset, %sizes#0, %sizes#1, %strides#0, %strides#1 : memref<f32>, index, index, index, index, index
  }
}

// -----
module {
  func.func @simplify_subview_all_dynamic(%arg0: memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index) -> memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>> {
    %subview = memref.subview %arg0[%arg1, %arg2, %arg3] [%arg4, %arg5, %arg6] [%arg7, %arg8, %arg9] : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>> to memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
    return %subview : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
  }
}

// -----
module {
  func.func @extract_strided_metadata_of_subview(%arg0: memref<5x4xf32>) -> (memref<f32>, index, index, index, index, index) {
    %subview = memref.subview %arg0[0, 2] [2, 2] [1, 1] : memref<5x4xf32> to memref<2x2xf32, strided<[4, 1], offset: 2>>
    %base_buffer, %offset, %sizes:2, %strides:2 = memref.extract_strided_metadata %subview : memref<2x2xf32, strided<[4, 1], offset: 2>> -> memref<f32>, index, index, index, index, index
    return %base_buffer, %offset, %sizes#0, %sizes#1, %strides#0, %strides#1 : memref<f32>, index, index, index, index, index
  }
}

// -----
module {
  func.func @extract_strided_metadata_of_subview_with_dynamic_size(%arg0: memref<8x16x24xf32>, %arg1: index) -> (memref<f32>, index, index, index, index, index, index, index) {
    %subview = memref.subview %arg0[3, 4, 2] [%arg1, 6, 3] [1, 1, 1] : memref<8x16x24xf32> to memref<?x6x3xf32, strided<[384, 24, 1], offset: 1250>>
    %base_buffer, %offset, %sizes:3, %strides:3 = memref.extract_strided_metadata %subview : memref<?x6x3xf32, strided<[384, 24, 1], offset: 1250>> -> memref<f32>, index, index, index, index, index, index, index
    return %base_buffer, %offset, %sizes#0, %sizes#1, %sizes#2, %strides#0, %strides#1, %strides#2 : memref<f32>, index, index, index, index, index, index, index
  }
}

// -----
module {
  func.func @extract_strided_metadata_of_rank_reduced_subview(%arg0: memref<8x16x24xf32>) -> (memref<f32>, index, index, index, index, index) {
    %subview = memref.subview %arg0[3, 4, 2] [1, 6, 3] [1, 1, 1] : memref<8x16x24xf32> to memref<6x3xf32, strided<[24, 1], offset: 1250>>
    %base_buffer, %offset, %sizes:2, %strides:2 = memref.extract_strided_metadata %subview : memref<6x3xf32, strided<[24, 1], offset: 1250>> -> memref<f32>, index, index, index, index, index
    return %base_buffer, %offset, %sizes#0, %sizes#1, %strides#0, %strides#1 : memref<f32>, index, index, index, index, index
  }
}

// -----
module {
  func.func @extract_strided_metadata_of_rank_reduced_subview_w_variable_strides(%arg0: memref<8x16x24xf32>, %arg1: index) -> (memref<f32>, index, index, index, index, index) {
    %subview = memref.subview %arg0[3, 4, 2] [1, 6, 3] [1, %arg1, 1] : memref<8x16x24xf32> to memref<6x3xf32, strided<[?, 1], offset: 1250>>
    %base_buffer, %offset, %sizes:2, %strides:2 = memref.extract_strided_metadata %subview : memref<6x3xf32, strided<[?, 1], offset: 1250>> -> memref<f32>, index, index, index, index, index
    return %base_buffer, %offset, %sizes#0, %sizes#1, %strides#0, %strides#1 : memref<f32>, index, index, index, index, index
  }
}

// -----
module {
  func.func @extract_strided_metadata_of_subview_w_variable_offset(%arg0: memref<384x128xf32>, %arg1: index, %arg2: index) -> (memref<f32>, index, index, index, index, index) {
    %subview = memref.subview %arg0[%arg1, %arg2] [64, 64] [1, 1] : memref<384x128xf32> to memref<64x64xf32, strided<[128, 1], offset: ?>>
    %base_buffer, %offset, %sizes:2, %strides:2 = memref.extract_strided_metadata %subview : memref<64x64xf32, strided<[128, 1], offset: ?>> -> memref<f32>, index, index, index, index, index
    return %base_buffer, %offset, %sizes#0, %sizes#1, %strides#0, %strides#1 : memref<f32>, index, index, index, index, index
  }
}

// -----
module {
  func.func @extract_strided_metadata_of_subview_all_dynamic(%arg0: memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index) -> (memref<f32>, index, index, index, index, index, index, index) {
    %subview = memref.subview %arg0[%arg1, %arg2, %arg3] [%arg4, %arg5, %arg6] [%arg7, %arg8, %arg9] : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>> to memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
    %base_buffer, %offset, %sizes:3, %strides:3 = memref.extract_strided_metadata %subview : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>> -> memref<f32>, index, index, index, index, index, index, index
    return %base_buffer, %offset, %sizes#0, %sizes#1, %sizes#2, %strides#0, %strides#1, %strides#2 : memref<f32>, index, index, index, index, index, index, index
  }
}

// -----
module {
  func.func @simplify_expand_shape(%arg0: memref<?x?xf32, strided<[?, ?], offset: ?>>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index) -> memref<?x7x8x9x10x2x?x3xf32, strided<[?, ?, ?, ?, ?, ?, ?, ?], offset: ?>> {
    %expand_shape = memref.expand_shape %arg0 [[0, 1, 2, 3], [4, 5, 6, 7]] output_shape [%arg10, 7, 8, 9, 10, 2, %arg11, 3] : memref<?x?xf32, strided<[?, ?], offset: ?>> into memref<?x7x8x9x10x2x?x3xf32, strided<[?, ?, ?, ?, ?, ?, ?, ?], offset: ?>>
    return %expand_shape : memref<?x7x8x9x10x2x?x3xf32, strided<[?, ?, ?, ?, ?, ?, ?, ?], offset: ?>>
  }
}

// -----
module {
  func.func @extract_strided_metadata_of_expand_shape_all_static(%arg0: memref<30x4xi16>) -> (memref<i16>, index, index, index, index, index, index, index, index, index, index, index) {
    %expand_shape = memref.expand_shape %arg0 [[0, 1, 2], [3, 4]] output_shape [3, 5, 2, 2, 2] : memref<30x4xi16> into memref<3x5x2x2x2xi16>
    %base_buffer, %offset, %sizes:5, %strides:5 = memref.extract_strided_metadata %expand_shape : memref<3x5x2x2x2xi16> -> memref<i16>, index, index, index, index, index, index, index, index, index, index, index
    return %base_buffer, %offset, %sizes#0, %sizes#1, %sizes#2, %sizes#3, %sizes#4, %strides#0, %strides#1, %strides#2, %strides#3, %strides#4 : memref<i16>, index, index, index, index, index, index, index, index, index, index, index
  }
}

// -----
module {
  func.func @extract_strided_metadata_of_expand_shape_all_dynamic(%arg0: memref<?x?xf32, strided<[?, ?], offset: ?>>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index) -> (memref<f32>, index, index, index, index, index, index, index, index, index, index, index, index, index, index, index, index, index) {
    %expand_shape = memref.expand_shape %arg0 [[0, 1, 2, 3], [4, 5, 6, 7]] output_shape [%arg10, 7, 8, 9, 10, 2, %arg11, 3] : memref<?x?xf32, strided<[?, ?], offset: ?>> into memref<?x7x8x9x10x2x?x3xf32, strided<[?, ?, ?, ?, ?, ?, ?, ?], offset: ?>>
    %base_buffer, %offset, %sizes:8, %strides:8 = memref.extract_strided_metadata %expand_shape : memref<?x7x8x9x10x2x?x3xf32, strided<[?, ?, ?, ?, ?, ?, ?, ?], offset: ?>> -> memref<f32>, index, index, index, index, index, index, index, index, index, index, index, index, index, index, index, index, index
    return %base_buffer, %offset, %sizes#0, %sizes#1, %sizes#2, %sizes#3, %sizes#4, %sizes#5, %sizes#6, %sizes#7, %strides#0, %strides#1, %strides#2, %strides#3, %strides#4, %strides#5, %strides#6, %strides#7 : memref<f32>, index, index, index, index, index, index, index, index, index, index, index, index, index, index, index, index, index
  }
}

// -----
module {
  func.func @extract_strided_metadata_of_expand_shape_all_static_0_rank(%arg0: memref<i16, strided<[], offset: ?>>) -> (memref<i16>, index, index, index, index, index, index, index, index, index, index, index) {
    %expand_shape = memref.expand_shape %arg0 [] output_shape [1, 1, 1, 1, 1] : memref<i16, strided<[], offset: ?>> into memref<1x1x1x1x1xi16, strided<[1, 1, 1, 1, 1], offset: ?>>
    %base_buffer, %offset, %sizes:5, %strides:5 = memref.extract_strided_metadata %expand_shape : memref<1x1x1x1x1xi16, strided<[1, 1, 1, 1, 1], offset: ?>> -> memref<i16>, index, index, index, index, index, index, index, index, index, index, index
    return %base_buffer, %offset, %sizes#0, %sizes#1, %sizes#2, %sizes#3, %sizes#4, %strides#0, %strides#1, %strides#2, %strides#3, %strides#4 : memref<i16>, index, index, index, index, index, index, index, index, index, index, index
  }
}

// -----
module {
  func.func @extract_strided_metadata_of_alloc_all_static_0_rank() -> (memref<i16>, index) {
    %alloc = memref.alloc() : memref<i16>
    %base_buffer, %offset = memref.extract_strided_metadata %alloc : memref<i16> -> memref<i16>, index
    return %base_buffer, %offset : memref<i16>, index
  }
}

// -----
module {
  func.func @extract_strided_metadata_of_alloc_dyn_size(%arg0: index, %arg1: index, %arg2: index) -> (memref<i16>, index, index, index, index, index, index, index, index, index) {
    %alloc = memref.alloc(%arg0, %arg1, %arg2) : memref<?x4x?x?xi16>
    %base_buffer, %offset, %sizes:4, %strides:4 = memref.extract_strided_metadata %alloc : memref<?x4x?x?xi16> -> memref<i16>, index, index, index, index, index, index, index, index, index
    return %base_buffer, %offset, %sizes#0, %sizes#1, %sizes#2, %sizes#3, %strides#0, %strides#1, %strides#2, %strides#3 : memref<i16>, index, index, index, index, index, index, index, index, index
  }
}

// -----
module {
  func.func @extract_strided_metadata_of_alloca_dyn_size(%arg0: index, %arg1: index, %arg2: index) -> (memref<i16>, index, index, index, index, index, index, index, index, index) {
    %alloca = memref.alloca(%arg0, %arg1, %arg2) : memref<?x?x4x?xi16>
    %base_buffer, %offset, %sizes:4, %strides:4 = memref.extract_strided_metadata %alloca : memref<?x?x4x?xi16> -> memref<i16>, index, index, index, index, index, index, index, index, index
    return %base_buffer, %offset, %sizes#0, %sizes#1, %sizes#2, %sizes#3, %strides#0, %strides#1, %strides#2, %strides#3 : memref<i16>, index, index, index, index, index, index, index, index, index
  }
}

// -----
#map = affine_map<(d0)[s0] -> (d0 + s0)>
module {
  func.func @extract_strided_metadata_of_alloc_with_variable_offset(%arg0: index) -> (memref<i16>, index, index, index) {
    %alloc = memref.alloc()[%arg0] : memref<4xi16, #map>
    %base_buffer, %offset, %sizes, %strides = memref.extract_strided_metadata %alloc : memref<4xi16, #map> -> memref<i16>, index, index, index
    return %base_buffer, %offset, %sizes, %strides : memref<i16>, index, index, index
  }
}

// -----
#map = affine_map<(d0) -> (d0 + 12)>
module {
  func.func @extract_strided_metadata_of_alloc_with_cst_offset(%arg0: index) -> (memref<i16>, index, index, index) {
    %alloc = memref.alloc() : memref<4xi16, #map>
    %base_buffer, %offset, %sizes, %strides = memref.extract_strided_metadata %alloc : memref<4xi16, #map> -> memref<i16>, index, index, index
    return %base_buffer, %offset, %sizes, %strides : memref<i16>, index, index, index
  }
}

// -----
module {
  func.func @extract_strided_metadata_of_alloc_with_cst_offset_in_type(%arg0: index) -> (memref<i16>, index, index, index) {
    %alloc = memref.alloc() : memref<4xi16, strided<[1], offset: 10>>
    %base_buffer, %offset, %sizes, %strides = memref.extract_strided_metadata %alloc : memref<4xi16, strided<[1], offset: 10>> -> memref<i16>, index, index, index
    return %base_buffer, %offset, %sizes, %strides : memref<i16>, index, index, index
  }
}

// -----
module {
  func.func @extract_strided_metadata_of_alloc_with_strided(%arg0: index) -> (memref<i16>, index, index, index) {
    %alloc = memref.alloc() : memref<4xi16, strided<[12]>>
    %base_buffer, %offset, %sizes, %strides = memref.extract_strided_metadata %alloc : memref<4xi16, strided<[12]>> -> memref<i16>, index, index, index
    return %base_buffer, %offset, %sizes, %strides : memref<i16>, index, index, index
  }
}

// -----
module {
  func.func @extract_aligned_pointer_as_index(%arg0: memref<f32>) -> index {
    %subview = memref.subview %arg0[] [] [] : memref<f32> to memref<f32>
    %intptr = memref.extract_aligned_pointer_as_index %arg0 : memref<f32> -> index
    return %intptr : index
  }
}

// -----
module {
  func.func @extract_aligned_pointer_as_index_of_unranked_source(%arg0: memref<*xf32>) -> index {
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [0], sizes: [], strides: [] : memref<*xf32> to memref<f32>
    %intptr = memref.extract_aligned_pointer_as_index %reinterpret_cast : memref<f32> -> index
    return %intptr : index
  }
}

// -----
module {
  func.func @simplify_collapse(%arg0: memref<?x?x4x?x6x7xi32>) -> memref<?x?x42xi32> {
    %collapse_shape = memref.collapse_shape %arg0 [[0], [1, 2, 3], [4, 5]] : memref<?x?x4x?x6x7xi32> into memref<?x?x42xi32>
    return %collapse_shape : memref<?x?x42xi32>
  }
}

// -----
module {
  func.func @simplify_collapse_with_dim_of_size1(%arg0: memref<3x1xf32, strided<[2, 1]>>, %arg1: memref<3xf32>) {
    %collapse_shape = memref.collapse_shape %arg0 [[0, 1]] : memref<3x1xf32, strided<[2, 1]>> into memref<3xf32, strided<[2]>>
    memref.copy %collapse_shape, %arg1 : memref<3xf32, strided<[2]>> to memref<3xf32>
    return
  }
}

// -----
module {
  func.func @simplify_collapse_with_dim_of_size1_and_non_1_stride(%arg0: memref<1x1xi32, strided<[2, 1], offset: ?>>) -> memref<1xi32, strided<[2], offset: ?>> {
    %collapse_shape = memref.collapse_shape %arg0 [[0, 1]] : memref<1x1xi32, strided<[2, 1], offset: ?>> into memref<1xi32, strided<[2], offset: ?>>
    return %collapse_shape : memref<1xi32, strided<[2], offset: ?>>
  }
}

// -----
module {
  func.func @simplify_collapse_with_dim_of_size1_and_resulting_dyn_stride(%arg0: memref<2x3x1x1x1xi32, strided<[?, ?, ?, ?, 2], offset: ?>>) -> memref<6x1xi32, strided<[?, ?], offset: ?>> {
    %collapse_shape = memref.collapse_shape %arg0 [[0, 1], [2, 3, 4]] : memref<2x3x1x1x1xi32, strided<[?, ?, ?, ?, 2], offset: ?>> into memref<6x1xi32, strided<[?, ?], offset: ?>>
    return %collapse_shape : memref<6x1xi32, strided<[?, ?], offset: ?>>
  }
}

// -----
module {
  func.func @extract_strided_metadata_of_collapse(%arg0: memref<?x?x4x?x6x7xi32>) -> (memref<i32>, index, index, index, index, index, index, index) {
    %collapse_shape = memref.collapse_shape %arg0 [[0], [1, 2, 3], [4, 5]] : memref<?x?x4x?x6x7xi32> into memref<?x?x42xi32>
    %base_buffer, %offset, %sizes:3, %strides:3 = memref.extract_strided_metadata %collapse_shape : memref<?x?x42xi32> -> memref<i32>, index, index, index, index, index, index, index
    return %base_buffer, %offset, %sizes#0, %sizes#1, %sizes#2, %strides#0, %strides#1, %strides#2 : memref<i32>, index, index, index, index, index, index, index
  }
}

// -----
module {
  func.func @extract_strided_metadata_of_collapse_to_rank0(%arg0: memref<1x1x1x1x1x1xi32>) -> (memref<i32>, index) {
    %collapse_shape = memref.collapse_shape %arg0 [] : memref<1x1x1x1x1x1xi32> into memref<i32>
    %base_buffer, %offset = memref.extract_strided_metadata %collapse_shape : memref<i32> -> memref<i32>, index
    return %base_buffer, %offset : memref<i32>, index
  }
}

// -----
module {
  func.func @extract_strided_metadata_of_extract_strided_metadata(%arg0: memref<i32>) -> (memref<i32>, index) {
    %base_buffer, %offset = memref.extract_strided_metadata %arg0 : memref<i32> -> memref<i32>, index
    %base_buffer_0, %offset_1 = memref.extract_strided_metadata %base_buffer : memref<i32> -> memref<i32>, index
    return %base_buffer_0, %offset_1 : memref<i32>, index
  }
}

// -----
module {
  func.func @extract_strided_metadata_of_reinterpret_cast(%arg0: memref<?x?xi32, strided<[?, ?], offset: ?>>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index) -> (memref<i32>, index, index, index, index, index) {
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%arg1], sizes: [%arg2, %arg3], strides: [%arg4, %arg5] : memref<?x?xi32, strided<[?, ?], offset: ?>> to memref<?x?xi32, strided<[?, ?], offset: ?>>
    %base_buffer, %offset, %sizes:2, %strides:2 = memref.extract_strided_metadata %reinterpret_cast : memref<?x?xi32, strided<[?, ?], offset: ?>> -> memref<i32>, index, index, index, index, index
    return %base_buffer, %offset, %sizes#0, %sizes#1, %strides#0, %strides#1 : memref<i32>, index, index, index, index, index
  }
}

// -----
module {
  func.func @extract_strided_metadata_of_reinterpret_cast_unranked(%arg0: memref<*xi32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index) -> (memref<i32>, index, index, index, index, index) {
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%arg1], sizes: [%arg2, %arg3], strides: [%arg4, %arg5] : memref<*xi32> to memref<?x?xi32, strided<[?, ?], offset: ?>>
    %base_buffer, %offset, %sizes:2, %strides:2 = memref.extract_strided_metadata %reinterpret_cast : memref<?x?xi32, strided<[?, ?], offset: ?>> -> memref<i32>, index, index, index, index, index
    return %base_buffer, %offset, %sizes#0, %sizes#1, %strides#0, %strides#1 : memref<i32>, index, index, index, index, index
  }
}

// -----
module {
  func.func @extract_strided_metadata_of_reinterpret_cast_rank0(%arg0: memref<i32, strided<[], offset: ?>>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index) -> (memref<i32>, index, index, index, index, index) {
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%arg1], sizes: [%arg2, %arg3], strides: [%arg4, %arg5] : memref<i32, strided<[], offset: ?>> to memref<?x?xi32, strided<[?, ?], offset: ?>>
    %base_buffer, %offset, %sizes:2, %strides:2 = memref.extract_strided_metadata %reinterpret_cast : memref<?x?xi32, strided<[?, ?], offset: ?>> -> memref<i32>, index, index, index, index, index
    return %base_buffer, %offset, %sizes#0, %sizes#1, %strides#0, %strides#1 : memref<i32>, index, index, index, index, index
  }
}

// -----
module {
  memref.global "private" constant @const_i32 : memref<512x384xi32> = dense<42>
  func.func @extract_strided_metadata_of_get_global() -> (memref<i32>, index, index, index, index, index) {
    %0 = memref.get_global @const_i32 : memref<512x384xi32>
    %base_buffer, %offset, %sizes:2, %strides:2 = memref.extract_strided_metadata %0 : memref<512x384xi32> -> memref<i32>, index, index, index, index, index
    return %base_buffer, %offset, %sizes#0, %sizes#1, %strides#0, %strides#1 : memref<i32>, index, index, index, index, index
  }
}

// -----
module {
  memref.global "private" constant @const_i32 : memref<512x384xi32, strided<[420, 1]>> = dense<42>
  func.func @extract_strided_metadata_of_get_global_with_strides() -> (memref<i32>, index, index, index, index, index) {
    %0 = memref.get_global @const_i32 : memref<512x384xi32, strided<[420, 1]>>
    %base_buffer, %offset, %sizes:2, %strides:2 = memref.extract_strided_metadata %0 : memref<512x384xi32, strided<[420, 1]>> -> memref<i32>, index, index, index, index, index
    return %base_buffer, %offset, %sizes#0, %sizes#1, %strides#0, %strides#1 : memref<i32>, index, index, index, index, index
  }
}

// -----
module {
  memref.global "private" constant @const_i32 : memref<512x384xi32, strided<[384, 1], offset: 20>> = dense<42>
  func.func @extract_strided_metadata_of_get_global_with_offset() -> (memref<i32>, index, index, index, index, index) {
    %0 = memref.get_global @const_i32 : memref<512x384xi32, strided<[384, 1], offset: 20>>
    %base_buffer, %offset, %sizes:2, %strides:2 = memref.extract_strided_metadata %0 : memref<512x384xi32, strided<[384, 1], offset: 20>> -> memref<i32>, index, index, index, index, index
    return %base_buffer, %offset, %sizes#0, %sizes#1, %strides#0, %strides#1 : memref<i32>, index, index, index, index, index
  }
}

// -----
module {
  memref.global "private" @dynamicShmem : memref<0xf16, 3>
  func.func @zero_sized_memred(%arg0: f32) -> (memref<f16, 3>, index, index, index) {
    %c0 = arith.constant 0 : index
    %0 = memref.get_global @dynamicShmem : memref<0xf16, 3>
    %base_buffer, %offset, %sizes, %strides = memref.extract_strided_metadata %0 : memref<0xf16, 3> -> memref<f16, 3>, index, index, index
    return %base_buffer, %offset, %sizes, %strides : memref<f16, 3>, index, index, index
  }
}

// -----
module {
  func.func @extract_strided_metadata_of_collapse_shape(%arg0: memref<5x4xf32>) -> (memref<f32>, index, index, index) {
    %collapse_shape = memref.collapse_shape %arg0 [[0, 1]] : memref<5x4xf32> into memref<20xf32>
    %base_buffer, %offset, %sizes, %strides = memref.extract_strided_metadata %collapse_shape : memref<20xf32> -> memref<f32>, index, index, index
    return %base_buffer, %offset, %sizes, %strides : memref<f32>, index, index, index
  }
}

// -----
module {
  func.func @extract_strided_metadata_of_memory_space_cast(%arg0: memref<20xf32>) -> (memref<f32, 1>, index, index, index) {
    %memspacecast = memref.memory_space_cast %arg0 : memref<20xf32> to memref<20xf32, 1>
    %base_buffer, %offset, %sizes, %strides = memref.extract_strided_metadata %memspacecast : memref<20xf32, 1> -> memref<f32, 1>, index, index, index
    return %base_buffer, %offset, %sizes, %strides : memref<f32, 1>, index, index, index
  }
}

// -----
module {
  func.func @extract_strided_metadata_of_memory_space_cast_no_base(%arg0: memref<20xf32>) -> (index, index, index) {
    %memspacecast = memref.memory_space_cast %arg0 : memref<20xf32> to memref<20xf32, 1>
    %base_buffer, %offset, %sizes, %strides = memref.extract_strided_metadata %memspacecast : memref<20xf32, 1> -> memref<f32, 1>, index, index, index
    return %offset, %sizes, %strides : index, index, index
  }
}

// -----
module {
  func.func @negative_memref_view_extract_aligned_pointer(%arg0: memref<?xi8>) -> index {
    %c10 = arith.constant 10 : index
    %view = memref.view %arg0[%c10][] : memref<?xi8> to memref<f32>
    %intptr = memref.extract_aligned_pointer_as_index %view : memref<f32> -> index
    return %intptr : index
  }
}

