module {
  func.func @bitcast_2d(%arg0: vector<2x4xi32>) -> vector<2x2xi64> {
    %0 = vector.bitcast %arg0 : vector<2x4xi32> to vector<2x2xi64>
    return %0 : vector<2x2xi64>
  }
}

// -----
module {
  func.func @bitcast_2d_scalable(%arg0: vector<2x[4]xi32>) -> vector<2x[2]xi64> {
    %0 = vector.bitcast %arg0 : vector<2x[4]xi32> to vector<2x[2]xi64>
    return %0 : vector<2x[2]xi64>
  }
}

// -----
module {
  func.func @broadcast_vec0d_from_f32(%arg0: f32) -> vector<f32> {
    %0 = vector.broadcast %arg0 : f32 to vector<f32>
    return %0 : vector<f32>
  }
}

// -----
module {
  func.func @broadcast_vec1d_from_f32(%arg0: f32) -> vector<2xf32> {
    %0 = vector.broadcast %arg0 : f32 to vector<2xf32>
    return %0 : vector<2xf32>
  }
}

// -----
module {
  func.func @broadcast_single_elem_vec1d_from_f32(%arg0: f32) -> vector<1xf32> {
    %0 = vector.broadcast %arg0 : f32 to vector<1xf32>
    return %0 : vector<1xf32>
  }
}

// -----
module {
  func.func @broadcast_vec1d_from_f32_scalable(%arg0: f32) -> vector<[2]xf32> {
    %0 = vector.broadcast %arg0 : f32 to vector<[2]xf32>
    return %0 : vector<[2]xf32>
  }
}

// -----
module {
  func.func @broadcast_vec1d_from_index(%arg0: index) -> vector<2xindex> {
    %0 = vector.broadcast %arg0 : index to vector<2xindex>
    return %0 : vector<2xindex>
  }
}

// -----
module {
  func.func @broadcast_vec1d_from_index_scalable(%arg0: index) -> vector<[2]xindex> {
    %0 = vector.broadcast %arg0 : index to vector<[2]xindex>
    return %0 : vector<[2]xindex>
  }
}

// -----
module {
  func.func @broadcast_vec2d_from_scalar(%arg0: f32) -> vector<2x3xf32> {
    %0 = vector.broadcast %arg0 : f32 to vector<2x3xf32>
    return %0 : vector<2x3xf32>
  }
}

// -----
module {
  func.func @broadcast_vec2d_from_scalar_scalable(%arg0: f32) -> vector<2x[3]xf32> {
    %0 = vector.broadcast %arg0 : f32 to vector<2x[3]xf32>
    return %0 : vector<2x[3]xf32>
  }
}

// -----
module {
  func.func @broadcast_vec3d_from_scalar(%arg0: f32) -> vector<2x3x4xf32> {
    %0 = vector.broadcast %arg0 : f32 to vector<2x3x4xf32>
    return %0 : vector<2x3x4xf32>
  }
}

// -----
module {
  func.func @broadcast_vec3d_from_scalar_scalable(%arg0: f32) -> vector<2x3x[4]xf32> {
    %0 = vector.broadcast %arg0 : f32 to vector<2x3x[4]xf32>
    return %0 : vector<2x3x[4]xf32>
  }
}

// -----
module {
  func.func @broadcast_vec2d_from_vec0d(%arg0: vector<f32>) -> vector<3x2xf32> {
    %0 = vector.broadcast %arg0 : vector<f32> to vector<3x2xf32>
    return %0 : vector<3x2xf32>
  }
}

// -----
module {
  func.func @broadcast_vec2d_from_vec1d(%arg0: vector<2xf32>) -> vector<3x2xf32> {
    %0 = vector.broadcast %arg0 : vector<2xf32> to vector<3x2xf32>
    return %0 : vector<3x2xf32>
  }
}

// -----
module {
  func.func @broadcast_vec2d_from_vec1d_scalable(%arg0: vector<[2]xf32>) -> vector<3x[2]xf32> {
    %0 = vector.broadcast %arg0 : vector<[2]xf32> to vector<3x[2]xf32>
    return %0 : vector<3x[2]xf32>
  }
}

// -----
module {
  func.func @broadcast_vec2d_from_index_vec1d(%arg0: vector<2xindex>) -> vector<3x2xindex> {
    %0 = vector.broadcast %arg0 : vector<2xindex> to vector<3x2xindex>
    return %0 : vector<3x2xindex>
  }
}

// -----
module {
  func.func @broadcast_vec2d_from_index_vec1d_scalable(%arg0: vector<[2]xindex>) -> vector<3x[2]xindex> {
    %0 = vector.broadcast %arg0 : vector<[2]xindex> to vector<3x[2]xindex>
    return %0 : vector<3x[2]xindex>
  }
}

// -----
module {
  func.func @broadcast_vec3d_from_vec1d(%arg0: vector<2xf32>) -> vector<4x3x2xf32> {
    %0 = vector.broadcast %arg0 : vector<2xf32> to vector<4x3x2xf32>
    return %0 : vector<4x3x2xf32>
  }
}

// -----
module {
  func.func @broadcast_vec3d_from_vec1d_scalable(%arg0: vector<[2]xf32>) -> vector<4x3x[2]xf32> {
    %0 = vector.broadcast %arg0 : vector<[2]xf32> to vector<4x3x[2]xf32>
    return %0 : vector<4x3x[2]xf32>
  }
}

// -----
module {
  func.func @broadcast_vec3d_from_vec2d(%arg0: vector<3x2xf32>) -> vector<4x3x2xf32> {
    %0 = vector.broadcast %arg0 : vector<3x2xf32> to vector<4x3x2xf32>
    return %0 : vector<4x3x2xf32>
  }
}

// -----
module {
  func.func @broadcast_vec3d_from_vec2d_scalable(%arg0: vector<3x[2]xf32>) -> vector<4x3x[2]xf32> {
    %0 = vector.broadcast %arg0 : vector<3x[2]xf32> to vector<4x3x[2]xf32>
    return %0 : vector<4x3x[2]xf32>
  }
}

// -----
module {
  func.func @broadcast_stretch(%arg0: vector<1xf32>) -> vector<4xf32> {
    %0 = vector.broadcast %arg0 : vector<1xf32> to vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @broadcast_stretch_scalable(%arg0: vector<1xf32>) -> vector<[4]xf32> {
    %0 = vector.broadcast %arg0 : vector<1xf32> to vector<[4]xf32>
    return %0 : vector<[4]xf32>
  }
}

// -----
module {
  func.func @broadcast_stretch_at_start(%arg0: vector<1x4xf32>) -> vector<3x4xf32> {
    %0 = vector.broadcast %arg0 : vector<1x4xf32> to vector<3x4xf32>
    return %0 : vector<3x4xf32>
  }
}

// -----
module {
  func.func @broadcast_stretch_at_start_scalable(%arg0: vector<1x[4]xf32>) -> vector<3x[4]xf32> {
    %0 = vector.broadcast %arg0 : vector<1x[4]xf32> to vector<3x[4]xf32>
    return %0 : vector<3x[4]xf32>
  }
}

// -----
module {
  func.func @broadcast_stretch_at_end(%arg0: vector<4x1xf32>) -> vector<4x3xf32> {
    %0 = vector.broadcast %arg0 : vector<4x1xf32> to vector<4x3xf32>
    return %0 : vector<4x3xf32>
  }
  func.func @broadcast_stretch_at_end_scalable(%arg0: vector<[4]x1xf32>) -> vector<[4]x3xf32> {
    %0 = vector.broadcast %arg0 : vector<[4]x1xf32> to vector<[4]x3xf32>
    return %0 : vector<[4]x3xf32>
  }
}

// -----
module {
  func.func @broadcast_stretch_in_middle(%arg0: vector<4x1x2xf32>) -> vector<4x3x2xf32> {
    %0 = vector.broadcast %arg0 : vector<4x1x2xf32> to vector<4x3x2xf32>
    return %0 : vector<4x3x2xf32>
  }
}

// -----
module {
  func.func @broadcast_stretch_in_middle_scalable_v1(%arg0: vector<4x1x[2]xf32>) -> vector<4x3x[2]xf32> {
    %0 = vector.broadcast %arg0 : vector<4x1x[2]xf32> to vector<4x3x[2]xf32>
    return %0 : vector<4x3x[2]xf32>
  }
}

// -----
module {
  func.func @broadcast_stretch_in_middle_scalable_v2(%arg0: vector<[4]x1x2xf32>) -> vector<[4]x3x2xf32> {
    %0 = vector.broadcast %arg0 : vector<[4]x1x2xf32> to vector<[4]x3x2xf32>
    return %0 : vector<[4]x3x2xf32>
  }
}

// -----
module {
  func.func @outerproduct(%arg0: vector<2xf32>, %arg1: vector<3xf32>) -> vector<2x3xf32> {
    %0 = vector.outerproduct %arg0, %arg1 : vector<2xf32>, vector<3xf32>
    return %0 : vector<2x3xf32>
  }
}

// -----
module {
  func.func @outerproduct_scalable(%arg0: vector<2xf32>, %arg1: vector<[3]xf32>) -> vector<2x[3]xf32> {
    %0 = vector.outerproduct %arg0, %arg1 : vector<2xf32>, vector<[3]xf32>
    return %0 : vector<2x[3]xf32>
  }
}

// -----
module {
  func.func @outerproduct_index(%arg0: vector<2xindex>, %arg1: vector<3xindex>) -> vector<2x3xindex> {
    %0 = vector.outerproduct %arg0, %arg1 : vector<2xindex>, vector<3xindex>
    return %0 : vector<2x3xindex>
  }
}

// -----
module {
  func.func @outerproduct_index_scalable(%arg0: vector<2xindex>, %arg1: vector<[3]xindex>) -> vector<2x[3]xindex> {
    %0 = vector.outerproduct %arg0, %arg1 : vector<2xindex>, vector<[3]xindex>
    return %0 : vector<2x[3]xindex>
  }
}

// -----
module {
  func.func @outerproduct_add(%arg0: vector<2xf32>, %arg1: vector<3xf32>, %arg2: vector<2x3xf32>) -> vector<2x3xf32> {
    %0 = vector.outerproduct %arg0, %arg1, %arg2 {kind = #vector.kind<add>} : vector<2xf32>, vector<3xf32>
    return %0 : vector<2x3xf32>
  }
}

// -----
module {
  func.func @outerproduct_add_scalable(%arg0: vector<2xf32>, %arg1: vector<[3]xf32>, %arg2: vector<2x[3]xf32>) -> vector<2x[3]xf32> {
    %0 = vector.outerproduct %arg0, %arg1, %arg2 {kind = #vector.kind<add>} : vector<2xf32>, vector<[3]xf32>
    return %0 : vector<2x[3]xf32>
  }
}

// -----
module {
  func.func @masked_float_add_outerprod(%arg0: vector<2xf32>, %arg1: f32, %arg2: vector<2xf32>, %arg3: vector<2xi1>) -> vector<2xf32> {
    %0 = vector.mask %arg3 { vector.outerproduct %arg0, %arg1, %arg2 {kind = #vector.kind<add>} : vector<2xf32>, f32 } : vector<2xi1> -> vector<2xf32>
    return %0 : vector<2xf32>
  }
}

// -----
module {
  func.func @masked_float_add_outerprod_scalable(%arg0: vector<[2]xf32>, %arg1: f32, %arg2: vector<[2]xf32>, %arg3: vector<[2]xi1>) -> vector<[2]xf32> {
    %0 = vector.mask %arg3 { vector.outerproduct %arg0, %arg1, %arg2 {kind = #vector.kind<add>} : vector<[2]xf32>, f32 } : vector<[2]xi1> -> vector<[2]xf32>
    return %0 : vector<[2]xf32>
  }
}

// -----
module {
  func.func @masked_float_mul_outerprod(%arg0: vector<2xf32>, %arg1: f32, %arg2: vector<2xf32>, %arg3: vector<2xi1>) -> vector<2xf32> {
    %0 = vector.mask %arg3 { vector.outerproduct %arg0, %arg1, %arg2 {kind = #vector.kind<mul>} : vector<2xf32>, f32 } : vector<2xi1> -> vector<2xf32>
    return %0 : vector<2xf32>
  }
}

// -----
module {
  func.func @masked_float_mul_outerprod_scalable(%arg0: vector<[2]xf32>, %arg1: f32, %arg2: vector<[2]xf32>, %arg3: vector<[2]xi1>) -> vector<[2]xf32> {
    %0 = vector.mask %arg3 { vector.outerproduct %arg0, %arg1, %arg2 {kind = #vector.kind<mul>} : vector<[2]xf32>, f32 } : vector<[2]xi1> -> vector<[2]xf32>
    return %0 : vector<[2]xf32>
  }
}

// -----
module {
  func.func @masked_float_max_outerprod(%arg0: vector<2xf32>, %arg1: f32, %arg2: vector<2xf32>, %arg3: vector<2xi1>) -> vector<2xf32> {
    %0 = vector.mask %arg3 { vector.outerproduct %arg0, %arg1, %arg2 {kind = #vector.kind<maxnumf>} : vector<2xf32>, f32 } : vector<2xi1> -> vector<2xf32>
    return %0 : vector<2xf32>
  }
}

// -----
module {
  func.func @masked_float_max_outerprod_scalable(%arg0: vector<[2]xf32>, %arg1: f32, %arg2: vector<[2]xf32>, %arg3: vector<[2]xi1>) -> vector<[2]xf32> {
    %0 = vector.mask %arg3 { vector.outerproduct %arg0, %arg1, %arg2 {kind = #vector.kind<maxnumf>} : vector<[2]xf32>, f32 } : vector<[2]xi1> -> vector<[2]xf32>
    return %0 : vector<[2]xf32>
  }
}

// -----
module {
  func.func @masked_float_min_outerprod(%arg0: vector<2xf32>, %arg1: f32, %arg2: vector<2xf32>, %arg3: vector<2xi1>) -> vector<2xf32> {
    %0 = vector.mask %arg3 { vector.outerproduct %arg0, %arg1, %arg2 {kind = #vector.kind<minnumf>} : vector<2xf32>, f32 } : vector<2xi1> -> vector<2xf32>
    return %0 : vector<2xf32>
  }
}

// -----
module {
  func.func @masked_float_min_outerprod_scalable(%arg0: vector<[2]xf32>, %arg1: f32, %arg2: vector<[2]xf32>, %arg3: vector<[2]xi1>) -> vector<[2]xf32> {
    %0 = vector.mask %arg3 { vector.outerproduct %arg0, %arg1, %arg2 {kind = #vector.kind<minnumf>} : vector<[2]xf32>, f32 } : vector<[2]xi1> -> vector<[2]xf32>
    return %0 : vector<[2]xf32>
  }
}

// -----
module {
  func.func @masked_int_add_outerprod(%arg0: vector<2xi32>, %arg1: i32, %arg2: vector<2xi32>, %arg3: vector<2xi1>) -> vector<2xi32> {
    %0 = vector.mask %arg3 { vector.outerproduct %arg0, %arg1, %arg2 {kind = #vector.kind<add>} : vector<2xi32>, i32 } : vector<2xi1> -> vector<2xi32>
    return %0 : vector<2xi32>
  }
}

// -----
module {
  func.func @masked_int_add_outerprod_scalable(%arg0: vector<[2]xi32>, %arg1: i32, %arg2: vector<[2]xi32>, %arg3: vector<[2]xi1>) -> vector<[2]xi32> {
    %0 = vector.mask %arg3 { vector.outerproduct %arg0, %arg1, %arg2 {kind = #vector.kind<add>} : vector<[2]xi32>, i32 } : vector<[2]xi1> -> vector<[2]xi32>
    return %0 : vector<[2]xi32>
  }
}

// -----
module {
  func.func @masked_int_mul_outerprod(%arg0: vector<2xi32>, %arg1: i32, %arg2: vector<2xi32>, %arg3: vector<2xi1>) -> vector<2xi32> {
    %0 = vector.mask %arg3 { vector.outerproduct %arg0, %arg1, %arg2 {kind = #vector.kind<mul>} : vector<2xi32>, i32 } : vector<2xi1> -> vector<2xi32>
    return %0 : vector<2xi32>
  }
}

// -----
module {
  func.func @masked_int_mul_outerprod_scalable(%arg0: vector<[2]xi32>, %arg1: i32, %arg2: vector<[2]xi32>, %arg3: vector<[2]xi1>) -> vector<[2]xi32> {
    %0 = vector.mask %arg3 { vector.outerproduct %arg0, %arg1, %arg2 {kind = #vector.kind<mul>} : vector<[2]xi32>, i32 } : vector<[2]xi1> -> vector<[2]xi32>
    return %0 : vector<[2]xi32>
  }
}

// -----
module {
  func.func @masked_int_max_outerprod(%arg0: vector<2xi32>, %arg1: i32, %arg2: vector<2xi32>, %arg3: vector<2xi1>) -> vector<2xi32> {
    %0 = vector.mask %arg3 { vector.outerproduct %arg0, %arg1, %arg2 {kind = #vector.kind<maxsi>} : vector<2xi32>, i32 } : vector<2xi1> -> vector<2xi32>
    return %0 : vector<2xi32>
  }
}

// -----
module {
  func.func @masked_int_max_outerprod_scalable(%arg0: vector<[2]xi32>, %arg1: i32, %arg2: vector<[2]xi32>, %arg3: vector<[2]xi1>) -> vector<[2]xi32> {
    %0 = vector.mask %arg3 { vector.outerproduct %arg0, %arg1, %arg2 {kind = #vector.kind<maxsi>} : vector<[2]xi32>, i32 } : vector<[2]xi1> -> vector<[2]xi32>
    return %0 : vector<[2]xi32>
  }
}

// -----
module {
  func.func @masked_int_min_outerprod(%arg0: vector<2xi32>, %arg1: i32, %arg2: vector<2xi32>, %arg3: vector<2xi1>) -> vector<2xi32> {
    %0 = vector.mask %arg3 { vector.outerproduct %arg0, %arg1, %arg2 {kind = #vector.kind<minui>} : vector<2xi32>, i32 } : vector<2xi1> -> vector<2xi32>
    return %0 : vector<2xi32>
  }
}

// -----
module {
  func.func @masked_int_min_outerprod_scalable(%arg0: vector<[2]xi32>, %arg1: i32, %arg2: vector<[2]xi32>, %arg3: vector<[2]xi1>) -> vector<[2]xi32> {
    %0 = vector.mask %arg3 { vector.outerproduct %arg0, %arg1, %arg2 {kind = #vector.kind<minui>} : vector<[2]xi32>, i32 } : vector<[2]xi1> -> vector<[2]xi32>
    return %0 : vector<[2]xi32>
  }
}

// -----
module {
  func.func @masked_int_and_outerprod(%arg0: vector<2xi32>, %arg1: i32, %arg2: vector<2xi32>, %arg3: vector<2xi1>) -> vector<2xi32> {
    %0 = vector.mask %arg3 { vector.outerproduct %arg0, %arg1, %arg2 {kind = #vector.kind<and>} : vector<2xi32>, i32 } : vector<2xi1> -> vector<2xi32>
    return %0 : vector<2xi32>
  }
}

// -----
module {
  func.func @masked_int_and_outerprod_scalable(%arg0: vector<[2]xi32>, %arg1: i32, %arg2: vector<[2]xi32>, %arg3: vector<[2]xi1>) -> vector<[2]xi32> {
    %0 = vector.mask %arg3 { vector.outerproduct %arg0, %arg1, %arg2 {kind = #vector.kind<and>} : vector<[2]xi32>, i32 } : vector<[2]xi1> -> vector<[2]xi32>
    return %0 : vector<[2]xi32>
  }
}

// -----
module {
  func.func @masked_int_or_outerprod(%arg0: vector<2xi32>, %arg1: i32, %arg2: vector<2xi32>, %arg3: vector<2xi1>) -> vector<2xi32> {
    %0 = vector.mask %arg3 { vector.outerproduct %arg0, %arg1, %arg2 {kind = #vector.kind<or>} : vector<2xi32>, i32 } : vector<2xi1> -> vector<2xi32>
    return %0 : vector<2xi32>
  }
}

// -----
module {
  func.func @masked_int_or_outerprod_scalable(%arg0: vector<[2]xi32>, %arg1: i32, %arg2: vector<[2]xi32>, %arg3: vector<[2]xi1>) -> vector<[2]xi32> {
    %0 = vector.mask %arg3 { vector.outerproduct %arg0, %arg1, %arg2 {kind = #vector.kind<or>} : vector<[2]xi32>, i32 } : vector<[2]xi1> -> vector<[2]xi32>
    return %0 : vector<[2]xi32>
  }
}

// -----
module {
  func.func @extract_scalar_from_vec_1d_f32_poison_idx(%arg0: vector<16xf32>) -> f32 {
    %0 = vector.extract %arg0[-1] : f32 from vector<16xf32>
    return %0 : f32
  }
}

// -----
module {
  func.func @extract_vec_2d_from_vec_3d_f32_poison_idx(%arg0: vector<4x3x16xf32>) -> vector<3x16xf32> {
    %0 = vector.extract %arg0[-1] : vector<3x16xf32> from vector<4x3x16xf32>
    return %0 : vector<3x16xf32>
  }
}

// -----
module {
  func.func @print_scalar_i1(%arg0: i1) {
    vector.print %arg0 : i1
    return
  }
}

// -----
module {
  func.func @print_scalar_i4(%arg0: i4) {
    vector.print %arg0 : i4
    return
  }
}

// -----
module {
  func.func @print_scalar_si4(%arg0: si4) {
    vector.print %arg0 : si4
    return
  }
}

// -----
module {
  func.func @print_scalar_ui4(%arg0: ui4) {
    vector.print %arg0 : ui4
    return
  }
}

// -----
module {
  func.func @print_scalar_i32(%arg0: i32) {
    vector.print %arg0 : i32
    return
  }
}

// -----
module {
  func.func @print_scalar_ui32(%arg0: ui32) {
    vector.print %arg0 : ui32
    return
  }
}

// -----
module {
  func.func @print_scalar_i40(%arg0: i40) {
    vector.print %arg0 : i40
    return
  }
}

// -----
module {
  func.func @print_scalar_si40(%arg0: si40) {
    vector.print %arg0 : si40
    return
  }
}

// -----
module {
  func.func @print_scalar_ui40(%arg0: ui40) {
    vector.print %arg0 : ui40
    return
  }
}

// -----
module {
  func.func @extract_strided_slice_f32_1d_from_1d(%arg0: vector<4xf32>) -> vector<2xf32> {
    %0 = vector.extract_strided_slice %arg0 {offsets = [2], sizes = [2], strides = [1]} : vector<4xf32> to vector<2xf32>
    return %0 : vector<2xf32>
  }
}

// -----
module {
  func.func @extract_strided_slice_index_1d_from_1d(%arg0: vector<4xindex>) -> vector<2xindex> {
    %0 = vector.extract_strided_slice %arg0 {offsets = [2], sizes = [2], strides = [1]} : vector<4xindex> to vector<2xindex>
    return %0 : vector<2xindex>
  }
}

// -----
module {
  func.func @extract_strided_slice_f32_1d_from_2d(%arg0: vector<4x8xf32>) -> vector<2x8xf32> {
    %0 = vector.extract_strided_slice %arg0 {offsets = [2], sizes = [2], strides = [1]} : vector<4x8xf32> to vector<2x8xf32>
    return %0 : vector<2x8xf32>
  }
}

// -----
module {
  func.func @extract_strided_slice_f32_1d_from_2d_scalable(%arg0: vector<4x[8]xf32>) -> vector<2x[8]xf32> {
    %0 = vector.extract_strided_slice %arg0 {offsets = [2], sizes = [2], strides = [1]} : vector<4x[8]xf32> to vector<2x[8]xf32>
    return %0 : vector<2x[8]xf32>
  }
}

// -----
module {
  func.func @extract_strided_slice_f32_2d_from_2d(%arg0: vector<4x8xf32>) -> vector<2x2xf32> {
    %0 = vector.extract_strided_slice %arg0 {offsets = [2, 2], sizes = [2, 2], strides = [1, 1]} : vector<4x8xf32> to vector<2x2xf32>
    return %0 : vector<2x2xf32>
  }
}

// -----
module {
  func.func @extract_strided_slice_f32_2d_from_2d_scalable(%arg0: vector<4x[8]xf32>) -> vector<2x[8]xf32> {
    %0 = vector.extract_strided_slice %arg0 {offsets = [2, 0], sizes = [2, 8], strides = [1, 1]} : vector<4x[8]xf32> to vector<2x[8]xf32>
    return %0 : vector<2x[8]xf32>
  }
}

// -----
module {
  func.func @insert_strided_slice_f32_2d_into_3d(%arg0: vector<4x4xf32>, %arg1: vector<4x4x4xf32>) -> vector<4x4x4xf32> {
    %0 = vector.insert_strided_slice %arg0, %arg1 {offsets = [2, 0, 0], strides = [1, 1]} : vector<4x4xf32> into vector<4x4x4xf32>
    return %0 : vector<4x4x4xf32>
  }
}

// -----
module {
  func.func @insert_strided_slice_f32_2d_into_3d_scalable(%arg0: vector<4x[4]xf32>, %arg1: vector<4x4x[4]xf32>) -> vector<4x4x[4]xf32> {
    %0 = vector.insert_strided_slice %arg0, %arg1 {offsets = [2, 0, 0], strides = [1, 1]} : vector<4x[4]xf32> into vector<4x4x[4]xf32>
    return %0 : vector<4x4x[4]xf32>
  }
}

// -----
module {
  func.func @insert_strided_index_slice_index_2d_into_3d(%arg0: vector<4x4xindex>, %arg1: vector<4x4x4xindex>) -> vector<4x4x4xindex> {
    %0 = vector.insert_strided_slice %arg0, %arg1 {offsets = [2, 0, 0], strides = [1, 1]} : vector<4x4xindex> into vector<4x4x4xindex>
    return %0 : vector<4x4x4xindex>
  }
}

// -----
module {
  func.func @insert_strided_index_slice_index_2d_into_3d_scalable(%arg0: vector<4x[4]xindex>, %arg1: vector<4x4x[4]xindex>) -> vector<4x4x[4]xindex> {
    %0 = vector.insert_strided_slice %arg0, %arg1 {offsets = [2, 0, 0], strides = [1, 1]} : vector<4x[4]xindex> into vector<4x4x[4]xindex>
    return %0 : vector<4x4x[4]xindex>
  }
}

// -----
module {
  func.func @insert_strided_slice_f32_2d_into_2d(%arg0: vector<2x2xf32>, %arg1: vector<4x4xf32>) -> vector<4x4xf32> {
    %0 = vector.insert_strided_slice %arg0, %arg1 {offsets = [2, 2], strides = [1, 1]} : vector<2x2xf32> into vector<4x4xf32>
    return %0 : vector<4x4xf32>
  }
}

// -----
module {
  func.func @insert_strided_slice_f32_2d_into_2d_scalable(%arg0: vector<2x[2]xf32>, %arg1: vector<4x[2]xf32>) -> vector<4x[2]xf32> {
    %0 = vector.insert_strided_slice %arg0, %arg1 {offsets = [2, 0], strides = [1, 1]} : vector<2x[2]xf32> into vector<4x[2]xf32>
    return %0 : vector<4x[2]xf32>
  }
}

// -----
module {
  func.func @insert_strided_slice_f32_2d_into_3d(%arg0: vector<2x4xf32>, %arg1: vector<16x4x8xf32>) -> vector<16x4x8xf32> {
    %0 = vector.insert_strided_slice %arg0, %arg1 {offsets = [0, 0, 2], strides = [1, 1]} : vector<2x4xf32> into vector<16x4x8xf32>
    return %0 : vector<16x4x8xf32>
  }
}

// -----
module {
  func.func @insert_strided_slice_f32_2d_into_3d_scalable(%arg0: vector<2x[4]xf32>, %arg1: vector<16x4x[4]xf32>) -> vector<16x4x[4]xf32> {
    %0 = vector.insert_strided_slice %arg0, %arg1 {offsets = [3, 2, 0], strides = [1, 1]} : vector<2x[4]xf32> into vector<16x4x[4]xf32>
    return %0 : vector<16x4x[4]xf32>
  }
}

// -----
module {
  func.func @fma(%arg0: vector<8xf32>, %arg1: vector<2x4xf32>, %arg2: vector<1x1x1xf32>, %arg3: vector<f32>) -> (vector<8xf32>, vector<2x4xf32>, vector<1x1x1xf32>, vector<f32>) {
    %0 = vector.fma %arg0, %arg0, %arg0 : vector<8xf32>
    %1 = vector.fma %arg1, %arg1, %arg1 : vector<2x4xf32>
    %2 = vector.fma %arg2, %arg2, %arg2 : vector<1x1x1xf32>
    %3 = vector.fma %arg3, %arg3, %arg3 : vector<f32>
    return %0, %1, %2, %3 : vector<8xf32>, vector<2x4xf32>, vector<1x1x1xf32>, vector<f32>
  }
}

// -----
module {
  func.func @fma_scalable(%arg0: vector<[8]xf32>, %arg1: vector<2x[4]xf32>, %arg2: vector<1x1x[1]xf32>, %arg3: vector<f32>) -> (vector<[8]xf32>, vector<2x[4]xf32>, vector<1x1x[1]xf32>) {
    %0 = vector.fma %arg0, %arg0, %arg0 : vector<[8]xf32>
    %1 = vector.fma %arg1, %arg1, %arg1 : vector<2x[4]xf32>
    %2 = vector.fma %arg2, %arg2, %arg2 : vector<1x1x[1]xf32>
    return %0, %1, %2 : vector<[8]xf32>, vector<2x[4]xf32>, vector<1x1x[1]xf32>
  }
}

// -----
module {
  func.func @constant_mask_0d_f() -> vector<i1> {
    %0 = vector.constant_mask [0] : vector<i1>
    return %0 : vector<i1>
  }
}

// -----
module {
  func.func @constant_mask_0d_t() -> vector<i1> {
    %0 = vector.constant_mask [1] : vector<i1>
    return %0 : vector<i1>
  }
}

// -----
module {
  func.func @constant_mask_1d() -> vector<8xi1> {
    %0 = vector.constant_mask [4] : vector<8xi1>
    return %0 : vector<8xi1>
  }
}

// -----
module {
  func.func @constant_mask_1d_scalable_all_false() -> vector<[8]xi1> {
    %0 = vector.constant_mask [0] : vector<[8]xi1>
    return %0 : vector<[8]xi1>
  }
}

// -----
module {
  func.func @constant_mask_1d_scalable_all_true() -> vector<[8]xi1> {
    %0 = vector.constant_mask [8] : vector<[8]xi1>
    return %0 : vector<[8]xi1>
  }
}

// -----
module {
  func.func @constant_mask_2d() -> vector<4x4xi1> {
    %0 = vector.constant_mask [2, 2] : vector<4x4xi1>
    return %0 : vector<4x4xi1>
  }
}

// -----
module {
  func.func @constant_mask_2d_trailing_scalable() -> vector<4x[4]xi1> {
    %0 = vector.constant_mask [2, 4] : vector<4x[4]xi1>
    return %0 : vector<4x[4]xi1>
  }
}

// -----
module {
  func.func @negative_constant_mask_2d_leading_scalable() -> vector<[4]x4xi1> {
    %0 = vector.constant_mask [4, 2] : vector<[4]x4xi1>
    return %0 : vector<[4]x4xi1>
  }
}

// -----
module {
  func.func @create_mask_0d(%arg0: index) -> vector<i1> {
    %0 = vector.create_mask %arg0 : vector<i1>
    return %0 : vector<i1>
  }
}

// -----
module {
  func.func @create_mask_1d(%arg0: index) -> vector<4xi1> {
    %0 = vector.create_mask %arg0 : vector<4xi1>
    return %0 : vector<4xi1>
  }
}

// -----
module {
  func.func @create_mask_1d_scalable(%arg0: index) -> vector<[4]xi1> {
    %0 = vector.create_mask %arg0 : vector<[4]xi1>
    return %0 : vector<[4]xi1>
  }
}

// -----
module {
  func.func @gather_with_mask(%arg0: memref<?xf32>, %arg1: vector<2x3xi32>, %arg2: vector<2x3xf32>) -> vector<2x3xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [2, 2] : vector<2x3xi1>
    %1 = vector.gather %arg0[%c0] [%arg1], %0, %arg2 : memref<?xf32>, vector<2x3xi32>, vector<2x3xi1>, vector<2x3xf32> into vector<2x3xf32>
    return %1 : vector<2x3xf32>
  }
}

// -----
module {
  func.func @gather_with_mask_scalable(%arg0: memref<?xf32>, %arg1: vector<2x[3]xi32>, %arg2: vector<2x[3]xf32>) -> vector<2x[3]xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [2, 3] : vector<2x[3]xi1>
    %1 = vector.gather %arg0[%c0] [%arg1], %0, %arg2 : memref<?xf32>, vector<2x[3]xi32>, vector<2x[3]xi1>, vector<2x[3]xf32> into vector<2x[3]xf32>
    return %1 : vector<2x[3]xf32>
  }
}

// -----
module {
  func.func @gather_with_zero_mask(%arg0: memref<?xf32>, %arg1: vector<2x3xi32>, %arg2: vector<2x3xf32>) -> vector<2x3xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [0, 0] : vector<2x3xi1>
    %1 = vector.gather %arg0[%c0] [%arg1], %0, %arg2 : memref<?xf32>, vector<2x3xi32>, vector<2x3xi1>, vector<2x3xf32> into vector<2x3xf32>
    return %1 : vector<2x3xf32>
  }
}

// -----
module {
  func.func @gather_with_zero_mask_scalable(%arg0: memref<?xf32>, %arg1: vector<2x[3]xi32>, %arg2: vector<2x[3]xf32>) -> vector<2x[3]xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [0, 0] : vector<2x[3]xi1>
    %1 = vector.gather %arg0[%c0] [%arg1], %0, %arg2 : memref<?xf32>, vector<2x[3]xi32>, vector<2x[3]xi1>, vector<2x[3]xf32> into vector<2x[3]xf32>
    return %1 : vector<2x[3]xf32>
  }
}

// -----
module {
  func.func @scatter_with_mask(%arg0: memref<?xf32>, %arg1: vector<2x3xi32>, %arg2: vector<2x3xf32>) {
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [2, 2] : vector<2x3xi1>
    vector.scatter %arg0[%c0] [%arg1], %0, %arg2 : memref<?xf32>, vector<2x3xi32>, vector<2x3xi1>, vector<2x3xf32>
    return
  }
}

// -----
module {
  func.func @scatter_with_mask_scalable(%arg0: memref<?xf32>, %arg1: vector<2x[3]xi32>, %arg2: vector<2x[3]xf32>) {
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [2, 3] : vector<2x[3]xi1>
    vector.scatter %arg0[%c0] [%arg1], %0, %arg2 : memref<?xf32>, vector<2x[3]xi32>, vector<2x[3]xi1>, vector<2x[3]xf32>
    return
  }
}

// -----
module {
  func.func @interleave_2d(%arg0: vector<2x3xi8>, %arg1: vector<2x3xi8>) -> vector<2x6xi8> {
    %0 = vector.interleave %arg0, %arg1 : vector<2x3xi8> -> vector<2x6xi8>
    return %0 : vector<2x6xi8>
  }
}

// -----
module {
  func.func @interleave_2d_scalable(%arg0: vector<2x[8]xi16>, %arg1: vector<2x[8]xi16>) -> vector<2x[16]xi16> {
    %0 = vector.interleave %arg0, %arg1 : vector<2x[8]xi16> -> vector<2x[16]xi16>
    return %0 : vector<2x[16]xi16>
  }
}

// -----
module {
  func.func @deinterleave_2d(%arg0: vector<2x8xf32>) -> (vector<2x4xf32>, vector<2x4xf32>) {
    %res1, %res2 = vector.deinterleave %arg0 : vector<2x8xf32> -> vector<2x4xf32>
    return %res1, %res2 : vector<2x4xf32>, vector<2x4xf32>
  }
}

// -----
module {
  func.func @deinterleave_2d_scalable(%arg0: vector<2x[8]xf32>) -> (vector<2x[4]xf32>, vector<2x[4]xf32>) {
    %res1, %res2 = vector.deinterleave %arg0 : vector<2x[8]xf32> -> vector<2x[4]xf32>
    return %res1, %res2 : vector<2x[4]xf32>, vector<2x[4]xf32>
  }
}

// -----
module {
  func.func @step() -> vector<4xindex> {
    %0 = vector.step : vector<4xindex>
    return %0 : vector<4xindex>
  }
}

// -----
module {
  func.func @from_elements_3d(%arg0: f32, %arg1: f32, %arg2: f32, %arg3: f32) -> vector<2x1x2xf32> {
    %0 = vector.from_elements %arg0, %arg1, %arg2, %arg3 : vector<2x1x2xf32>
    return %0 : vector<2x1x2xf32>
  }
}

// -----
module {
  func.func @to_elements_1d(%arg0: vector<2xf32>) -> (f32, f32) {
    %0:2 = vector.to_elements %arg0 : vector<2xf32>
    return %0#0, %0#1 : f32, f32
  }
}

// -----
module {
  func.func @to_elements_2d(%arg0: vector<2x2xf32>) -> (f32, f32, f32, f32) {
    %0:4 = vector.to_elements %arg0 : vector<2x2xf32>
    return %0#0, %0#1, %0#2, %0#3 : f32, f32, f32, f32
  }
}

