module {
  func.func private @copy_scalar_into_0D_strided_zero_offset(%arg0: memref<f32>, %arg1: memref<f32>) {
    %reinterpret_cast = memref.reinterpret_cast %arg1 to offset: [0], sizes: [], strides: [] : memref<f32> to memref<f32>
    memref.copy %arg0, %reinterpret_cast : memref<f32> to memref<f32>
    return
  }
  func.func private @copy_scalar_into_1D_strided_zero_offset(%arg0: memref<1x1xf32>, %arg1: memref<1x108xf32>) {
    %reinterpret_cast = memref.reinterpret_cast %arg1 to offset: [0], sizes: [1, 1], strides: [1, 1] : memref<1x108xf32> to memref<1x1xf32>
    memref.copy %arg0, %reinterpret_cast : memref<1x1xf32> to memref<1x1xf32>
    return
  }
  func.func private @negative_copy_scalar_into_1D_strided_zero_offset_base_non_identity_layout(%arg0: memref<1x1xf32>, %arg1: memref<1x108xf32, strided<[54, 2]>>) {
    %reinterpret_cast = memref.reinterpret_cast %arg1 to offset: [0], sizes: [1, 1], strides: [54, 2] : memref<1x108xf32, strided<[54, 2]>> to memref<1x1xf32, strided<[54, 2]>>
    memref.copy %arg0, %reinterpret_cast : memref<1x1xf32> to memref<1x1xf32, strided<[54, 2]>>
    return
  }
  func.func private @copy_scalar_into_1D_strided_nonzero_offset(%arg0: memref<1x1xf32>, %arg1: memref<1x108xf32>) {
    %reinterpret_cast = memref.reinterpret_cast %arg1 to offset: [1], sizes: [1, 1], strides: [1, 1] : memref<1x108xf32> to memref<1x1xf32, strided<[1, 1], offset: 1>>
    memref.copy %arg0, %reinterpret_cast : memref<1x1xf32> to memref<1x1xf32, strided<[1, 1], offset: 1>>
    return
  }
  func.func private @copy_scalar_into_1D_strided_dynamic_offset(%arg0: index, %arg1: memref<1x1xf32>, %arg2: memref<1x108xf32>) {
    %reinterpret_cast = memref.reinterpret_cast %arg2 to offset: [%arg0], sizes: [1, 1], strides: [1, 1] : memref<1x108xf32> to memref<1x1xf32, strided<[1, 1], offset: ?>>
    memref.copy %arg1, %reinterpret_cast : memref<1x1xf32> to memref<1x1xf32, strided<[1, 1], offset: ?>>
    return
  }
  func.func private @copy_scalar_into_1D_strided_zero_offset_non_identity_stride(%arg0: memref<1x1xf32>, %arg1: memref<1x108xf32>) {
    %reinterpret_cast = memref.reinterpret_cast %arg1 to offset: [0], sizes: [1, 1], strides: [54, 2] : memref<1x108xf32> to memref<1x1xf32, strided<[54, 2]>>
    memref.copy %arg0, %reinterpret_cast : memref<1x1xf32> to memref<1x1xf32, strided<[54, 2]>>
    return
  }
  func.func private @copy_scalar_into_1D_strided_zero_offset_dynamic_stride(%arg0: index, %arg1: index, %arg2: memref<1x1xf32>, %arg3: memref<1x108xf32>) {
    %reinterpret_cast = memref.reinterpret_cast %arg3 to offset: [0], sizes: [1, 1], strides: [%arg0, %arg1] : memref<1x108xf32> to memref<1x1xf32, strided<[?, ?]>>
    memref.copy %arg2, %reinterpret_cast : memref<1x1xf32> to memref<1x1xf32, strided<[?, ?]>>
    return
  }
  func.func private @copy_scalar_into_2D_strided_zero_offset_non_identity_stride(%arg0: memref<1x1x1xf32>, %arg1: memref<1x3x11xf32>) {
    %reinterpret_cast = memref.reinterpret_cast %arg1 to offset: [0], sizes: [1, 1, 1], strides: [1, 1, 1] : memref<1x3x11xf32> to memref<1x1x1xf32>
    memref.copy %arg0, %reinterpret_cast : memref<1x1x1xf32> to memref<1x1x1xf32>
    return
  }
  func.func private @copy_scalar_into_2D_scalar_strided_nonzero_offset_delinearized_v1(%arg0: memref<1x1x1xf32>, %arg1: memref<1x3x11xf32>) {
    %reinterpret_cast = memref.reinterpret_cast %arg1 to offset: [10], sizes: [1, 1, 1], strides: [1, 1, 1] : memref<1x3x11xf32> to memref<1x1x1xf32, strided<[1, 1, 1], offset: 10>>
    memref.copy %arg0, %reinterpret_cast : memref<1x1x1xf32> to memref<1x1x1xf32, strided<[1, 1, 1], offset: 10>>
    return
  }
  func.func private @copy_scalar_into_2D_scalar_strided_nonzero_offset_delinearized_v2(%arg0: memref<1x1x1xf32>, %arg1: memref<1x3x11xf32>) {
    %reinterpret_cast = memref.reinterpret_cast %arg1 to offset: [23], sizes: [1, 1, 1], strides: [1, 1, 1] : memref<1x3x11xf32> to memref<1x1x1xf32, strided<[1, 1, 1], offset: 23>>
    memref.copy %arg0, %reinterpret_cast : memref<1x1x1xf32> to memref<1x1x1xf32, strided<[1, 1, 1], offset: 23>>
    return
  }
  func.func private @negative_copy_scalar_into_2D_strided_dynamic_offset(%arg0: index, %arg1: memref<1x1x1xf32>, %arg2: memref<1x3x11xf32>) {
    %reinterpret_cast = memref.reinterpret_cast %arg2 to offset: [%arg0], sizes: [1, 1, 1], strides: [33, 11, 1] : memref<1x3x11xf32> to memref<1x1x1xf32, strided<[33, 11, 1], offset: ?>>
    memref.copy %arg1, %reinterpret_cast : memref<1x1x1xf32> to memref<1x1x1xf32, strided<[33, 11, 1], offset: ?>>
    return
  }
  func.func private @negative_copy_1D_into_1D_strided(%arg0: memref<4xf32>, %arg1: memref<108xf32>) {
    %reinterpret_cast = memref.reinterpret_cast %arg1 to offset: [0], sizes: [4], strides: [1] : memref<108xf32> to memref<4xf32, strided<[1]>>
    memref.copy %arg0, %reinterpret_cast : memref<4xf32> to memref<4xf32, strided<[1]>>
    return
  }
  func.func private @copy_1D_into_2D_strided_zero_offset(%arg0: memref<1x3x1xf32>, %arg1: memref<1x3x11xf32>) {
    %reinterpret_cast = memref.reinterpret_cast %arg1 to offset: [0], sizes: [1, 3, 1], strides: [33, 11, 1] : memref<1x3x11xf32> to memref<1x3x1xf32, strided<[33, 11, 1]>>
    memref.copy %arg0, %reinterpret_cast : memref<1x3x1xf32> to memref<1x3x1xf32, strided<[33, 11, 1]>>
    return
  }
  func.func private @copy_1D_into_2D_strided_zero_offset_loop_trailing_dim(%arg0: memref<1x1x11xf32>, %arg1: memref<1x3x11xf32>) {
    %reinterpret_cast = memref.reinterpret_cast %arg1 to offset: [0], sizes: [1, 1, 11], strides: [33, 11, 1] : memref<1x3x11xf32> to memref<1x1x11xf32, strided<[33, 11, 1]>>
    memref.copy %arg0, %reinterpret_cast : memref<1x1x11xf32> to memref<1x1x11xf32, strided<[33, 11, 1]>>
    return
  }
  func.func private @copy_1D_into_2D_strided_nonzero_offset(%arg0: memref<1x3x1xf32>, %arg1: memref<1x3x11xf32>) {
    %reinterpret_cast = memref.reinterpret_cast %arg1 to offset: [10], sizes: [1, 3, 1], strides: [33, 11, 1] : memref<1x3x11xf32> to memref<1x3x1xf32, strided<[33, 11, 1], offset: 10>>
    memref.copy %arg0, %reinterpret_cast : memref<1x3x1xf32> to memref<1x3x1xf32, strided<[33, 11, 1], offset: 10>>
    return
  }
  func.func private @negative_copy_1D_into_2D_strided_dynamic_offset(%arg0: index, %arg1: memref<1x3x1xf32>, %arg2: memref<1x3x11xf32>) {
    %reinterpret_cast = memref.reinterpret_cast %arg2 to offset: [%arg0], sizes: [1, 3, 1], strides: [33, 11, 1] : memref<1x3x11xf32> to memref<1x3x1xf32, strided<[33, 11, 1], offset: ?>>
    memref.copy %arg1, %reinterpret_cast : memref<1x3x1xf32> to memref<1x3x1xf32, strided<[33, 11, 1], offset: ?>>
    return
  }
  func.func private @negative_copy_1D_into_2D_strided_zero_offset_non_identity_strides(%arg0: memref<1x3x1xf32>, %arg1: memref<1x3x4xf32>) {
    %reinterpret_cast = memref.reinterpret_cast %arg1 to offset: [0], sizes: [1, 3, 1], strides: [12, 4, 4] : memref<1x3x4xf32> to memref<1x3x1xf32, strided<[12, 4, 4]>>
    memref.copy %arg0, %reinterpret_cast : memref<1x3x1xf32> to memref<1x3x1xf32, strided<[12, 4, 4]>>
    return
  }
  func.func private @negative_copy_1D_into_2D_strided_zero_offset_dynamic_stride(%arg0: index, %arg1: memref<1x3x1xf32>, %arg2: memref<1x3x4xf32>) {
    %reinterpret_cast = memref.reinterpret_cast %arg2 to offset: [0], sizes: [1, 3, 1], strides: [12, %arg0, 1] : memref<1x3x4xf32> to memref<1x3x1xf32, strided<[12, ?, 1]>>
    memref.copy %arg1, %reinterpret_cast : memref<1x3x1xf32> to memref<1x3x1xf32, strided<[12, ?, 1]>>
    return
  }
  func.func private @negative_copy_1D_into_2D_strided_diff_dim_sizes(%arg0: memref<1x3x1xf32>, %arg1: memref<1x4x11xf32>) {
    %reinterpret_cast = memref.reinterpret_cast %arg1 to offset: [0], sizes: [1, 3, 1], strides: [44, 11, 1] : memref<1x4x11xf32> to memref<1x3x1xf32, strided<[44, 11, 1]>>
    memref.copy %arg0, %reinterpret_cast : memref<1x3x1xf32> to memref<1x3x1xf32, strided<[44, 11, 1]>>
    return
  }
  func.func private @copy_2D_into_3D_strided_zero_offset(%arg0: memref<3x1x4x1xf32>, %arg1: memref<3x1x4x11xf32>) {
    %reinterpret_cast = memref.reinterpret_cast %arg1 to offset: [0], sizes: [3, 1, 4, 1], strides: [44, 44, 11, 1] : memref<3x1x4x11xf32> to memref<3x1x4x1xf32, strided<[44, 44, 11, 1]>>
    memref.copy %arg0, %reinterpret_cast : memref<3x1x4x1xf32> to memref<3x1x4x1xf32, strided<[44, 44, 11, 1]>>
    return
  }
  func.func private @copy_2D_into_3D_strided_nonzero_offset(%arg0: memref<3x1x4x1xf32>, %arg1: memref<3x1x4x11xf32>) {
    %reinterpret_cast = memref.reinterpret_cast %arg1 to offset: [10], sizes: [3, 1, 4, 1], strides: [44, 44, 11, 1] : memref<3x1x4x11xf32> to memref<3x1x4x1xf32, strided<[44, 44, 11, 1], offset: 10>>
    memref.copy %arg0, %reinterpret_cast : memref<3x1x4x1xf32> to memref<3x1x4x1xf32, strided<[44, 44, 11, 1], offset: 10>>
    return
  }
  func.func private @negative_no_rc(%arg0: memref<1x1xf32>, %arg1: memref<1x1xf32>) {
    memref.copy %arg0, %arg1 : memref<1x1xf32> to memref<1x1xf32>
    return
  }
  func.func private @negative_copy_into_strided_unranked_rc_base(%arg0: memref<4xf32>, %arg1: memref<*xf32>) {
    %reinterpret_cast = memref.reinterpret_cast %arg1 to offset: [0], sizes: [4], strides: [1] : memref<*xf32> to memref<4xf32>
    memref.copy %arg0, %reinterpret_cast : memref<4xf32> to memref<4xf32>
    return
  }
  func.func private @negative_copy_into_strided_rank_change(%arg0: memref<3x4xf32>, %arg1: memref<12xf32>) {
    %reinterpret_cast = memref.reinterpret_cast %arg1 to offset: [0], sizes: [3, 4], strides: [1, 1] : memref<12xf32> to memref<3x4xf32, strided<[1, 1]>>
    memref.copy %arg0, %reinterpret_cast : memref<3x4xf32> to memref<3x4xf32, strided<[1, 1]>>
    return
  }
  func.func private @negative_copy_into_strided_dynamic_copy_source_shape(%arg0: memref<?xf32>, %arg1: memref<4xf32>) {
    %reinterpret_cast = memref.reinterpret_cast %arg1 to offset: [0], sizes: [4], strides: [1] : memref<4xf32> to memref<4xf32>
    memref.copy %arg0, %reinterpret_cast : memref<?xf32> to memref<4xf32>
    return
  }
  func.func private @negative_copy_into_strided_dynamic_rc_source_shape(%arg0: memref<4xf32>, %arg1: memref<?xf32>) {
    %reinterpret_cast = memref.reinterpret_cast %arg1 to offset: [0], sizes: [4], strides: [1] : memref<?xf32> to memref<4xf32, strided<[1]>>
    memref.copy %arg0, %reinterpret_cast : memref<4xf32> to memref<4xf32, strided<[1]>>
    return
  }
  func.func private @negative_copy_into_strided_dynamic_rc_result_shape(%arg0: index, %arg1: memref<4xf32>, %arg2: memref<12xf32>) {
    %reinterpret_cast = memref.reinterpret_cast %arg2 to offset: [0], sizes: [%arg0], strides: [1] : memref<12xf32> to memref<?xf32, strided<[1]>>
    memref.copy %arg1, %reinterpret_cast : memref<4xf32> to memref<?xf32, strided<[1]>>
    return
  }
}

// -----
module {
  func.func private @expand_scalar(%arg0: memref<1xi64>) {
    %c0 = arith.constant 0 : index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [0], sizes: [1, 1, 1], strides: [1, 1, 1] : memref<1xi64> to memref<1x1x1xi64>
    %0 = memref.load %reinterpret_cast[%c0, %c0, %c0] : memref<1x1x1xi64>
    return
  }
  func.func private @collapse_scalar(%arg0: memref<1x1x1xi64>) {
    %c0 = arith.constant 0 : index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [0], sizes: [1, 1], strides: [1, 1] : memref<1x1x1xi64> to memref<1x1xi64>
    %0 = memref.load %reinterpret_cast[%c0, %c0] : memref<1x1xi64>
    return
  }
  func.func private @expand_left_vector(%arg0: memref<999xi64>) {
    %c0 = arith.constant 0 : index
    %c13 = arith.constant 13 : index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [0], sizes: [1, 1, 999], strides: [999, 999, 1] : memref<999xi64> to memref<1x1x999xi64>
    %0 = memref.load %reinterpret_cast[%c0, %c0, %c13] : memref<1x1x999xi64>
    return
  }
  func.func private @expand_left_vector_dynamic_index(%arg0: index, %arg1: memref<999xi64>) {
    %c0 = arith.constant 0 : index
    %reinterpret_cast = memref.reinterpret_cast %arg1 to offset: [0], sizes: [1, 1, 999], strides: [999, 999, 1] : memref<999xi64> to memref<1x1x999xi64>
    %0 = memref.load %reinterpret_cast[%c0, %c0, %arg0] : memref<1x1x999xi64>
    return
  }
  func.func private @collapse_left_vector(%arg0: memref<1x1x999xi64>) {
    %c13 = arith.constant 13 : index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [0], sizes: [999], strides: [1] : memref<1x1x999xi64> to memref<999xi64>
    %0 = memref.load %reinterpret_cast[%c13] : memref<999xi64>
    return
  }
  func.func private @partial_expand_left_vector(%arg0: memref<1x999xf32>) {
    %c0 = arith.constant 0 : index
    %c13 = arith.constant 13 : index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [0], sizes: [1, 1, 999], strides: [999, 999, 1] : memref<1x999xf32> to memref<1x1x999xf32>
    %0 = memref.load %reinterpret_cast[%c0, %c0, %c13] : memref<1x1x999xf32>
    return
  }
  func.func private @partial_collapse_left_vector(%arg0: memref<1x1x999xf32>) {
    %c0 = arith.constant 0 : index
    %c13 = arith.constant 13 : index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [0], sizes: [1, 999], strides: [999, 1] : memref<1x1x999xf32> to memref<1x999xf32>
    %0 = memref.load %reinterpret_cast[%c0, %c13] : memref<1x999xf32>
    return
  }
  func.func private @expand_right_vector(%arg0: memref<999xi64>) {
    %c0 = arith.constant 0 : index
    %c13 = arith.constant 13 : index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [0], sizes: [999, 1, 1], strides: [1, 999, 999] : memref<999xi64> to memref<999x1x1xi64, strided<[1, 999, 999]>>
    %0 = memref.load %reinterpret_cast[%c13, %c0, %c0] : memref<999x1x1xi64, strided<[1, 999, 999]>>
    return
  }
  func.func private @collapse_right_vector(%arg0: memref<999x1x1xi64>) {
    %c13 = arith.constant 13 : index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [0], sizes: [999], strides: [1] : memref<999x1x1xi64> to memref<999xi64>
    %0 = memref.load %reinterpret_cast[%c13] : memref<999xi64>
    return
  }
  func.func private @collapse_right_vector_dynamic_index(%arg0: index, %arg1: memref<999x1x1xi64>) {
    %reinterpret_cast = memref.reinterpret_cast %arg1 to offset: [0], sizes: [999], strides: [1] : memref<999x1x1xi64> to memref<999xi64>
    %0 = memref.load %reinterpret_cast[%arg0] : memref<999xi64>
    return
  }
  func.func private @partial_expand_right_vector(%arg0: memref<999x1xf32>) {
    %c0 = arith.constant 0 : index
    %c13 = arith.constant 13 : index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [0], sizes: [999, 1, 1], strides: [1, 999, 999] : memref<999x1xf32> to memref<999x1x1xf32, strided<[1, 999, 999]>>
    %0 = memref.load %reinterpret_cast[%c13, %c0, %c0] : memref<999x1x1xf32, strided<[1, 999, 999]>>
    return
  }
  func.func private @partial_collapse_right_vector(%arg0: memref<999x1x1xf32>) {
    %c0 = arith.constant 0 : index
    %c13 = arith.constant 13 : index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [0], sizes: [999, 1], strides: [1, 999] : memref<999x1x1xf32> to memref<999x1xf32, strided<[1, 999]>>
    %0 = memref.load %reinterpret_cast[%c13, %c0] : memref<999x1xf32, strided<[1, 999]>>
    return
  }
  func.func private @expand_multiple_non_unit_dims(%arg0: memref<17x100xf32>) {
    %c0 = arith.constant 0 : index
    %c13 = arith.constant 13 : index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [0], sizes: [17, 1, 1, 100], strides: [100, 100, 100, 1] : memref<17x100xf32> to memref<17x1x1x100xf32, strided<[100, 100, 100, 1]>>
    %0 = memref.load %reinterpret_cast[%c13, %c0, %c0, %c13] : memref<17x1x1x100xf32, strided<[100, 100, 100, 1]>>
    return
  }
  func.func private @collapse_multiple_non_unit_dims(%arg0: memref<17x1x1x100xf32>) {
    %c13 = arith.constant 13 : index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [0], sizes: [17, 100], strides: [100, 1] : memref<17x1x1x100xf32> to memref<17x100xf32>
    %0 = memref.load %reinterpret_cast[%c13, %c13] : memref<17x100xf32>
    return
  }
  func.func private @expand_inner_non_unit_dims(%arg0: index, %arg1: memref<1x33xf32>) {
    %c0 = arith.constant 0 : index
    %reinterpret_cast = memref.reinterpret_cast %arg1 to offset: [0], sizes: [1, 33, 1, 1], strides: [33, 1, 1, 1] : memref<1x33xf32> to memref<1x33x1x1xf32>
    %0 = memref.load %reinterpret_cast[%c0, %arg0, %c0, %c0] : memref<1x33x1x1xf32>
    return
  }
  func.func private @collapse_inner_non_unit_dims(%arg0: memref<1x1x1x100xf32>) {
    %c0 = arith.constant 0 : index
    %c13 = arith.constant 13 : index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [0], sizes: [1, 100, 1], strides: [100, 1, 100] : memref<1x1x1x100xf32> to memref<1x100x1xf32, strided<[100, 1, 100]>>
    %0 = memref.load %reinterpret_cast[%c0, %c13, %c0] : memref<1x100x1xf32, strided<[100, 1, 100]>>
    return
  }
  func.func private @expand_diff_non_unit_boundary(%arg0: index, %arg1: memref<1x33xf32>) {
    %c0 = arith.constant 0 : index
    %c13 = arith.constant 13 : index
    %reinterpret_cast = memref.reinterpret_cast %arg1 to offset: [0], sizes: [33, 1, 1], strides: [1, 33, 33] : memref<1x33xf32> to memref<33x1x1xf32, strided<[1, 33, 33]>>
    %0 = memref.load %reinterpret_cast[%c13, %c0, %c0] : memref<33x1x1xf32, strided<[1, 33, 33]>>
    return
  }
  func.func private @collapse_diff_non_unit_boundary(%arg0: memref<1x1x1x100xf32>) {
    %c0 = arith.constant 0 : index
    %c13 = arith.constant 13 : index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [0], sizes: [100, 1, 1], strides: [1, 100, 100] : memref<1x1x1x100xf32> to memref<100x1x1xf32, strided<[1, 100, 100]>>
    %0 = memref.load %reinterpret_cast[%c13, %c0, %c0] : memref<100x1x1xf32, strided<[1, 100, 100]>>
    return
  }
  func.func private @expand_3d_moved_unit_dims(%arg0: index, %arg1: index, %arg2: index, %arg3: memref<1x3x22x3xf32>) {
    %c0 = arith.constant 0 : index
    %reinterpret_cast = memref.reinterpret_cast %arg3 to offset: [0], sizes: [3, 1, 1, 22, 1, 3], strides: [66, 66, 66, 3, 3, 1] : memref<1x3x22x3xf32> to memref<3x1x1x22x1x3xf32, strided<[66, 66, 66, 3, 3, 1]>>
    %0 = memref.load %reinterpret_cast[%arg0, %c0, %c0, %arg1, %c0, %arg2] : memref<3x1x1x22x1x3xf32, strided<[66, 66, 66, 3, 3, 1]>>
    return
  }
  func.func private @collapse_3d_moved_unit_dims(%arg0: index, %arg1: index, %arg2: index, %arg3: memref<1x3x1x1x22x1x3xf32>) {
    %c0 = arith.constant 0 : index
    %reinterpret_cast = memref.reinterpret_cast %arg3 to offset: [0], sizes: [3, 1, 22, 3, 1, 1], strides: [66, 66, 3, 1, 1, 1] : memref<1x3x1x1x22x1x3xf32> to memref<3x1x22x3x1x1xf32, strided<[66, 66, 3, 1, 1, 1]>>
    %0 = memref.load %reinterpret_cast[%arg0, %c0, %arg1, %arg2, %c0, %c0] : memref<3x1x22x3x1x1xf32, strided<[66, 66, 3, 1, 1, 1]>>
    return
  }
  func.func private @negative_nonzero_offset(%arg0: memref<1x100xf32>) {
    %c0 = arith.constant 0 : index
    %c13 = arith.constant 13 : index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [1], sizes: [1, 1, 100], strides: [1, 1, 1] : memref<1x100xf32> to memref<1x1x100xf32, strided<[1, 1, 1], offset: 1>>
    %0 = memref.load %reinterpret_cast[%c0, %c0, %c13] : memref<1x1x100xf32, strided<[1, 1, 1], offset: 1>>
    return
  }
  func.func private @negative_dynamic_shape(%arg0: index, %arg1: memref<?xf32>) {
    %c0 = arith.constant 0 : index
    %c13 = arith.constant 13 : index
    %reinterpret_cast = memref.reinterpret_cast %arg1 to offset: [0], sizes: [1, %arg0], strides: [1, 1] : memref<?xf32> to memref<1x?xf32>
    %0 = memref.load %reinterpret_cast[%c0, %c13] : memref<1x?xf32>
    return
  }
  func.func private @negative_dynamic_stride(%arg0: index, %arg1: memref<1x108xf32>) {
    %c0 = arith.constant 0 : index
    %c13 = arith.constant 13 : index
    %reinterpret_cast = memref.reinterpret_cast %arg1 to offset: [0], sizes: [108], strides: [%arg0] : memref<1x108xf32> to memref<108xf32, strided<[?]>>
    %0 = memref.load %reinterpret_cast[%c13] : memref<108xf32, strided<[?]>>
    return
  }
  func.func private @negative_diff_non_unit_dims_order(%arg0: memref<17x1x1x100xf32>) {
    %c13 = arith.constant 13 : index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [0], sizes: [100, 17], strides: [1, 100] : memref<17x1x1x100xf32> to memref<100x17xf32, strided<[1, 100]>>
    %0 = memref.load %reinterpret_cast[%c13, %c13] : memref<100x17xf32, strided<[1, 100]>>
    return
  }
  func.func private @negative_diff_non_unit_size(%arg0: memref<1x1x1x100xf32>) {
    %c0 = arith.constant 0 : index
    %c13 = arith.constant 13 : index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [0], sizes: [1, 99], strides: [99, 1] : memref<1x1x1x100xf32> to memref<1x99xf32>
    %0 = memref.load %reinterpret_cast[%c0, %c13] : memref<1x99xf32>
    return
  }
}

