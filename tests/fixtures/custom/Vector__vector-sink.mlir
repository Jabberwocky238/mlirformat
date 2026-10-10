module {
  func.func @broadcast_scalar_with_bcast(%arg0: index, %arg1: index) -> vector<1x4xindex> {
    %0 = vector.broadcast %arg0 : index to vector<1x4xindex>
    %1 = vector.broadcast %arg1 : index to vector<1x4xindex>
    %2 = arith.addi %0, %1 : vector<1x4xindex>
    return %2 : vector<1x4xindex>
  }
  func.func @broadcast_scalar_with_bcast_scalable(%arg0: index, %arg1: index) -> vector<1x[4]xindex> {
    %0 = vector.broadcast %arg0 : index to vector<1x[4]xindex>
    %1 = vector.broadcast %arg1 : index to vector<1x[4]xindex>
    %2 = arith.addi %0, %1 : vector<1x[4]xindex>
    return %2 : vector<1x[4]xindex>
  }
}

// -----
module {
  func.func @broadcast_scalar_with_bcast_and_splat(%arg0: index, %arg1: index) -> vector<1x4xindex> {
    %0 = vector.broadcast %arg0 : index to vector<1x4xindex>
    %1 = vector.broadcast %arg1 : index to vector<1x4xindex>
    %2 = arith.addi %0, %1 : vector<1x4xindex>
    return %2 : vector<1x4xindex>
  }
  func.func @broadcast_scalar_with_bcast_and_splat_scalable(%arg0: index, %arg1: index) -> vector<1x[4]xindex> {
    %0 = vector.broadcast %arg0 : index to vector<1x[4]xindex>
    %1 = vector.broadcast %arg1 : index to vector<1x[4]xindex>
    %2 = arith.addi %0, %1 : vector<1x[4]xindex>
    return %2 : vector<1x[4]xindex>
  }
}

// -----
module {
  func.func @broadcast_vector(%arg0: vector<4xf32>, %arg1: vector<4xf32>) -> vector<3x4xf32> {
    %0 = vector.broadcast %arg0 : vector<4xf32> to vector<3x4xf32>
    %1 = vector.broadcast %arg1 : vector<4xf32> to vector<3x4xf32>
    %2 = arith.addf %0, %1 : vector<3x4xf32>
    return %2 : vector<3x4xf32>
  }
  func.func @broadcast_vector_scalable(%arg0: vector<[4]xf32>, %arg1: vector<[4]xf32>) -> vector<3x[4]xf32> {
    %0 = vector.broadcast %arg0 : vector<[4]xf32> to vector<3x[4]xf32>
    %1 = vector.broadcast %arg1 : vector<[4]xf32> to vector<3x[4]xf32>
    %2 = arith.addf %0, %1 : vector<3x[4]xf32>
    return %2 : vector<3x[4]xf32>
  }
}

// -----
module {
  func.func @broadcast_scalar_and_vec(%arg0: index, %arg1: vector<4xindex>) -> vector<1x4xindex> {
    %0 = vector.broadcast %arg0 : index to vector<1x4xindex>
    %1 = vector.broadcast %arg1 : vector<4xindex> to vector<1x4xindex>
    %2 = arith.addi %0, %1 : vector<1x4xindex>
    return %2 : vector<1x4xindex>
  }
  func.func @broadcast_scalar_and_vec_scalable(%arg0: index, %arg1: vector<[4]xindex>) -> vector<1x[4]xindex> {
    %0 = vector.broadcast %arg0 : index to vector<1x[4]xindex>
    %1 = vector.broadcast %arg1 : vector<[4]xindex> to vector<1x[4]xindex>
    %2 = arith.addi %0, %1 : vector<1x[4]xindex>
    return %2 : vector<1x[4]xindex>
  }
}

// -----
module {
  func.func @broadcast_vector_and_scalar(%arg0: i32, %arg1: vector<4xi32>) -> vector<4xi32> {
    %0 = vector.broadcast %arg0 : i32 to vector<4xi32>
    %1 = arith.addi %0, %arg1 : vector<4xi32>
    return %1 : vector<4xi32>
  }
  func.func @broadcast_vector_and_scalar_scalable(%arg0: i32, %arg1: vector<[4]xi32>) -> vector<[4]xi32> {
    %0 = vector.broadcast %arg0 : i32 to vector<[4]xi32>
    %1 = arith.addi %0, %arg1 : vector<[4]xi32>
    return %1 : vector<[4]xi32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @negative_not_elementwise() -> vector<2x2xf32> {
    %cst = arith.constant 1.000000e+00 : f32
    %cst_0 = arith.constant 2.000000e+00 : f32
    %cst_1 = arith.constant 3.000000e+00 : f32
    %0 = vector.broadcast %cst : f32 to vector<2x2xf32>
    %1 = vector.broadcast %cst_0 : f32 to vector<2x2xf32>
    %2 = vector.broadcast %cst_1 : f32 to vector<2x2xf32>
    %3 = vector.contract {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %1, %2 : vector<2x2xf32>, vector<2x2xf32> into vector<2x2xf32>
    return %3 : vector<2x2xf32>
  }
}

// -----
module {
  func.func @source_and_result_mismatch(%arg0: f32) -> vector<1xi1> {
    %0 = vector.broadcast %arg0 : f32 to vector<1xf32>
    %1 = arith.cmpf uno, %0, %0 : vector<1xf32>
    return %1 : vector<1xi1>
  }
}

// -----
module {
  func.func @negative_op_only_supports_vectors(%arg0: f32) -> vector<1xf32> {
    %0 = vector.broadcast %arg0 : f32 to vector<1xf32>
    %1 = vector.fma %0, %0, %0 : vector<1xf32>
    return %1 : vector<1xf32>
  }
}

// -----
module {
  func.func @broadcast_scalar_and_splat_const(%arg0: index) -> vector<1x4xindex> {
    %0 = vector.broadcast %arg0 : index to vector<1x4xindex>
    %cst = arith.constant dense<2> : vector<1x4xindex>
    %1 = arith.addi %0, %cst : vector<1x4xindex>
    return %1 : vector<1x4xindex>
  }
}

// -----
module {
  func.func @broadcast_scalar_and_splat_const_const_first(%arg0: index) -> vector<1x4xindex> {
    %0 = vector.broadcast %arg0 : index to vector<1x4xindex>
    %cst = arith.constant dense<2> : vector<1x4xindex>
    %1 = arith.subi %cst, %0 : vector<1x4xindex>
    return %1 : vector<1x4xindex>
  }
}

// -----
module {
  func.func @broadcast_vector_and_splat_const(%arg0: vector<4xf32>) -> vector<3x4xf32> {
    %0 = vector.broadcast %arg0 : vector<4xf32> to vector<3x4xf32>
    %cst = arith.constant dense<2.000000e+00> : vector<3x4xf32>
    %1 = arith.mulf %0, %cst : vector<3x4xf32>
    return %1 : vector<3x4xf32>
  }
}

// -----
module {
  func.func @negative_broadcast_with_non_splat_const(%arg0: index) -> vector<1x4xindex> {
    %0 = vector.broadcast %arg0 : index to vector<1x4xindex>
    %cst = arith.constant dense<[[0, 1, 2, 3]]> : vector<1x4xindex>
    %1 = arith.addi %0, %cst : vector<1x4xindex>
    return %1 : vector<1x4xindex>
  }
}

// -----
module {
  func.func @broadcast_scalar_mixed_type(%arg0: f16) -> vector<1x4xf32> {
    %0 = vector.broadcast %arg0 : f16 to vector<1x4xf16>
    %1 = arith.extf %0 : vector<1x4xf16> to vector<1x4xf32>
    return %1 : vector<1x4xf32>
  }
}

// -----
module {
  func.func @broadcast_vector_mixed_type(%arg0: vector<4xf16>) -> vector<3x4xf32> {
    %0 = vector.broadcast %arg0 : vector<4xf16> to vector<3x4xf16>
    %1 = arith.extf %0 : vector<3x4xf16> to vector<3x4xf32>
    return %1 : vector<3x4xf32>
  }
}

// -----
module {
  func.func @broadcast_scalar_and_splat_const_mixed_type(%arg0: f32) -> vector<1x4xf32> {
    %0 = vector.broadcast %arg0 : f32 to vector<1x4xf32>
    %cst = arith.constant dense<3> : vector<1x4xi32>
    %1 = math.fpowi %0, %cst : vector<1x4xf32>, vector<1x4xi32>
    return %1 : vector<1x4xf32>
  }
}

// -----
module {
  func.func @broadcast_vector_and_splat_const_mixed_type(%arg0: vector<4xf32>) -> vector<3x4xf32> {
    %0 = vector.broadcast %arg0 : vector<4xf32> to vector<3x4xf32>
    %cst = arith.constant dense<3> : vector<3x4xi32>
    %1 = math.fpowi %0, %cst : vector<3x4xf32>, vector<3x4xi32>
    return %1 : vector<3x4xf32>
  }
}

// -----
module {
  func.func @broadcast_vector_extsi(%arg0: vector<4xi8>) -> vector<2x4xi32> {
    %0 = vector.broadcast %arg0 : vector<4xi8> to vector<2x4xi8>
    %1 = arith.extsi %0 : vector<2x4xi8> to vector<2x4xi32>
    return %1 : vector<2x4xi32>
  }
}

// -----
module {
  func.func @broadcast_vector_extsi_scalable(%arg0: vector<[4]xi8>) -> vector<2x[4]xi32> {
    %0 = vector.broadcast %arg0 : vector<[4]xi8> to vector<2x[4]xi8>
    %1 = arith.extsi %0 : vector<2x[4]xi8> to vector<2x[4]xi32>
    return %1 : vector<2x[4]xi32>
  }
}

// -----
module {
  func.func @broadcast_scalar_extsi(%arg0: i8) -> vector<2x4xi32> {
    %0 = vector.broadcast %arg0 : i8 to vector<2x4xi8>
    %1 = arith.extsi %0 : vector<2x4xi8> to vector<2x4xi32>
    return %1 : vector<2x4xi32>
  }
}

// -----
module {
  func.func @broadcast_scalar_extsi_scalable(%arg0: i8) -> vector<2x[4]xi32> {
    %0 = vector.broadcast %arg0 : i8 to vector<2x[4]xi8>
    %1 = arith.extsi %0 : vector<2x[4]xi8> to vector<2x[4]xi32>
    return %1 : vector<2x[4]xi32>
  }
}

// -----
module {
  func.func @negative_broadcast_cast_non_vector_result(%arg0: i64) -> !llvm.array<26 x vector<7xi64>> {
    %0 = vector.broadcast %arg0 : i64 to vector<26x7xi64>
    %1 = builtin.unrealized_conversion_cast %0 : vector<26x7xi64> to !llvm.array<26 x vector<7xi64>>
    return %1 : !llvm.array<26 x vector<7xi64>>
  }
  func.func @transpose_extsi(%arg0: vector<4x2xi8>) -> vector<2x4xi32> {
    %0 = vector.transpose %arg0, [1, 0] : vector<4x2xi8> to vector<2x4xi8>
    %1 = arith.extsi %0 : vector<2x4xi8> to vector<2x4xi32>
    return %1 : vector<2x4xi32>
  }
}

// -----
module {
  func.func @transpose_extsi_scalable(%arg0: vector<[4]x2xi8>) -> vector<2x[4]xi32> {
    %0 = vector.transpose %arg0, [1, 0] : vector<[4]x2xi8> to vector<2x[4]xi8>
    %1 = arith.extsi %0 : vector<2x[4]xi8> to vector<2x[4]xi32>
    return %1 : vector<2x[4]xi32>
  }
}

// -----
module {
  func.func @transpose_elementwise_same_type(%arg0: vector<4x2xf32>, %arg1: vector<4x2xf32>) -> vector<2x4xf32> {
    %0 = vector.transpose %arg0, [1, 0] : vector<4x2xf32> to vector<2x4xf32>
    %1 = vector.transpose %arg1, [1, 0] : vector<4x2xf32> to vector<2x4xf32>
    %2 = arith.addf %0, %1 : vector<2x4xf32>
    return %2 : vector<2x4xf32>
  }
}

// -----
module {
  func.func @transpose_elementwise_same_type_scalable(%arg0: vector<[4]x2xf32>, %arg1: vector<[4]x2xf32>) -> vector<2x[4]xf32> {
    %0 = vector.transpose %arg0, [1, 0] : vector<[4]x2xf32> to vector<2x[4]xf32>
    %1 = vector.transpose %arg1, [1, 0] : vector<[4]x2xf32> to vector<2x[4]xf32>
    %2 = arith.addf %0, %1 : vector<2x[4]xf32>
    return %2 : vector<2x[4]xf32>
  }
}

// -----
module {
  func.func @transpose_elementwise_diff_operand_types(%arg0: vector<4x2xi1>, %arg1: vector<4x2xf32>, %arg2: vector<4x2xf32>) -> vector<2x4xf32> {
    %0 = vector.transpose %arg0, [1, 0] : vector<4x2xi1> to vector<2x4xi1>
    %1 = vector.transpose %arg1, [1, 0] : vector<4x2xf32> to vector<2x4xf32>
    %2 = vector.transpose %arg2, [1, 0] : vector<4x2xf32> to vector<2x4xf32>
    %3 = arith.select %0, %1, %2 : vector<2x4xi1>, vector<2x4xf32>
    return %3 : vector<2x4xf32>
  }
}

// -----
module {
  func.func @transpose_elementwise_diff_operand_types_scalable(%arg0: vector<[4]x2xi1>, %arg1: vector<[4]x2xf32>, %arg2: vector<[4]x2xf32>) -> vector<2x[4]xf32> {
    %0 = vector.transpose %arg0, [1, 0] : vector<[4]x2xi1> to vector<2x[4]xi1>
    %1 = vector.transpose %arg1, [1, 0] : vector<[4]x2xf32> to vector<2x[4]xf32>
    %2 = vector.transpose %arg2, [1, 0] : vector<[4]x2xf32> to vector<2x[4]xf32>
    %3 = arith.select %0, %1, %2 : vector<2x[4]xi1>, vector<2x[4]xf32>
    return %3 : vector<2x[4]xf32>
  }
}

// -----
module {
  func.func @transpose_elementwise_diff_operand_result_type(%arg0: vector<4x2xf32>, %arg1: vector<4x2xf32>) -> vector<2x4xi1> {
    %0 = vector.transpose %arg0, [1, 0] : vector<4x2xf32> to vector<2x4xf32>
    %1 = vector.transpose %arg1, [1, 0] : vector<4x2xf32> to vector<2x4xf32>
    %2 = arith.cmpf olt, %0, %1 : vector<2x4xf32>
    return %2 : vector<2x4xi1>
  }
}

// -----
module {
  func.func @transpose_elementwise_diff_operand_result_type_scalable(%arg0: vector<[4]x2xf32>, %arg1: vector<[4]x2xf32>) -> vector<2x[4]xi1> {
    %0 = vector.transpose %arg0, [1, 0] : vector<[4]x2xf32> to vector<2x[4]xf32>
    %1 = vector.transpose %arg1, [1, 0] : vector<[4]x2xf32> to vector<2x[4]xf32>
    %2 = arith.cmpf olt, %0, %1 : vector<2x[4]xf32>
    return %2 : vector<2x[4]xi1>
  }
}

// -----
module {
  func.func @transpose_elementwise_splat_constant(%arg0: vector<4x6x3x2xf32>) -> vector<6x4x2x3xf32> {
    %cst = arith.constant dense<5.000000e+00> : vector<6x4x2x3xf32>
    %0 = vector.transpose %arg0, [1, 0, 3, 2] : vector<4x6x3x2xf32> to vector<6x4x2x3xf32>
    %1 = arith.addf %0, %cst : vector<6x4x2x3xf32>
    return %1 : vector<6x4x2x3xf32>
  }
}

// -----
module {
  func.func @transpose_elementwise_splat_constant_scalable(%arg0: vector<[4]x6x3x2xf32>) -> vector<6x[4]x2x3xf32> {
    %cst = arith.constant dense<5.000000e+00> : vector<6x[4]x2x3xf32>
    %0 = vector.transpose %arg0, [1, 0, 3, 2] : vector<[4]x6x3x2xf32> to vector<6x[4]x2x3xf32>
    %1 = arith.addf %0, %cst : vector<6x[4]x2x3xf32>
    return %1 : vector<6x[4]x2x3xf32>
  }
}

// -----
module {
  func.func @transpose_elementwise_diff_map(%arg0: vector<4x6x3x2xf32>, %arg1: vector<6x2x4x3xf32>) -> vector<6x4x2x3xf32> {
    %0 = vector.transpose %arg0, [1, 0, 3, 2] : vector<4x6x3x2xf32> to vector<6x4x2x3xf32>
    %1 = vector.transpose %arg1, [0, 2, 1, 3] : vector<6x2x4x3xf32> to vector<6x4x2x3xf32>
    %2 = arith.addf %0, %1 : vector<6x4x2x3xf32>
    return %2 : vector<6x4x2x3xf32>
  }
}

// -----
module {
  func.func @transpose_elementwise_diff_map_scalable(%arg0: vector<[4]x6x3x2xf32>, %arg1: vector<6x2x[4]x3xf32>) -> vector<6x[4]x2x3xf32> {
    %0 = vector.transpose %arg0, [1, 0, 3, 2] : vector<[4]x6x3x2xf32> to vector<6x[4]x2x3xf32>
    %1 = vector.transpose %arg1, [0, 2, 1, 3] : vector<6x2x[4]x3xf32> to vector<6x[4]x2x3xf32>
    %2 = arith.addf %0, %1 : vector<6x[4]x2x3xf32>
    return %2 : vector<6x[4]x2x3xf32>
  }
}

// -----
module {
  func.func @extract_elementwise_scalar(%arg0: vector<4xf32>, %arg1: vector<4xf32>) -> f32 {
    %0 = arith.addf %arg0, %arg1 : vector<4xf32>
    %1 = vector.extract %0[1] : f32 from vector<4xf32>
    return %1 : f32
  }
  func.func @extract_elementwise_arg_res_different_types(%arg0: vector<4xindex>) -> i64 {
    %0 = arith.index_cast %arg0 : vector<4xindex> to vector<4xi64>
    %1 = vector.extract %0[1] : i64 from vector<4xi64>
    return %1 : i64
  }
  func.func @extract_elementwise_vec(%arg0: vector<2x4xf32>, %arg1: vector<2x4xf32>) -> vector<4xf32> {
    %0 = arith.addf %arg0, %arg1 : vector<2x4xf32>
    %1 = vector.extract %0[1] : vector<4xf32> from vector<2x4xf32>
    return %1 : vector<4xf32>
  }
  func.func @negative_extract_elementwise_no_single_use(%arg0: vector<4xf32>, %arg1: vector<4xf32>) -> (f32, vector<4xf32>) {
    %0 = arith.addf %arg0, %arg1 : vector<4xf32>
    %1 = vector.extract %0[1] : f32 from vector<4xf32>
    return %1, %0 : f32, vector<4xf32>
  }
  func.func @negative_extract_elementwise_not_one_res(%arg0: vector<4xi32>, %arg1: vector<4xi32>) -> i32 {
    %low, %high = arith.mulsi_extended %arg0, %arg1 : vector<4xi32>
    %0 = vector.extract %low[1] : i32 from vector<4xi32>
    return %0 : i32
  }
  func.func @negative_extract_not_elementwise(%arg0: vector<4xi64>) -> i64 {
    %0 = test.increment %arg0 : vector<4xi64>
    %1 = vector.extract %0[1] : i64 from vector<4xi64>
    return %1 : i64
  }
  func.func @negative_extract_vec_fma(%arg0: vector<4xf32>, %arg1: vector<4xf32>, %arg2: vector<4xf32>) -> f32 {
    %0 = vector.fma %arg0, %arg1, %arg2 : vector<4xf32>
    %1 = vector.extract %0[1] : f32 from vector<4xf32>
    return %1 : f32
  }
  func.func @negative_extract_dynamic_pos(%arg0: vector<4xf32>, %arg1: vector<4xf32>, %arg2: vector<4xindex>) -> f32 {
    %0 = arith.addf %arg0, %arg1 : vector<4xf32>
    %1 = vector.extract %arg2[0] : index from vector<4xindex>
    %2 = vector.extract %0[%1] : f32 from vector<4xf32>
    return %2 : f32
  }
  func.func @extract_load_scalar(%arg0: memref<?xf32>, %arg1: index) -> f32 {
    %0 = vector.load %arg0[%arg1] : memref<?xf32>, vector<4xf32>
    %1 = vector.extract %0[0] : f32 from vector<4xf32>
    return %1 : f32
  }
  func.func @extract_load_index(%arg0: memref<?xindex>, %arg1: index) -> index {
    %0 = vector.load %arg0[%arg1] : memref<?xindex>, vector<4xindex>
    %1 = vector.extract %0[0] : index from vector<4xindex>
    return %1 : index
  }
  func.func @extract_load_scalar_non_zero_off(%arg0: memref<?xf32>, %arg1: index) -> f32 {
    %0 = vector.load %arg0[%arg1] : memref<?xf32>, vector<4xf32>
    %1 = vector.extract %0[1] : f32 from vector<4xf32>
    return %1 : f32
  }
  func.func @extract_load_scalar_dyn_off(%arg0: memref<?xf32>, %arg1: index, %arg2: index) -> f32 {
    %0 = vector.load %arg0[%arg1] : memref<?xf32>, vector<4xf32>
    %1 = vector.extract %0[%arg2] : f32 from vector<4xf32>
    return %1 : f32
  }
  func.func @extract_load_vec_non_zero_off(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index) -> vector<4xf32> {
    %0 = vector.load %arg0[%arg1, %arg2] : memref<?x?xf32>, vector<2x4xf32>
    %1 = vector.extract %0[1] : vector<4xf32> from vector<2x4xf32>
    return %1 : vector<4xf32>
  }
  func.func @extract_load_scalar_non_zero_off_2d_src_memref(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index) -> f32 {
    %0 = vector.load %arg0[%arg1, %arg2] : memref<?x?xf32>, vector<4xf32>
    %1 = vector.extract %0[1] : f32 from vector<4xf32>
    return %1 : f32
  }
  func.func @extract_load_vec_high_rank(%arg0: memref<?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index) -> vector<4xf32> {
    %0 = vector.load %arg0[%arg1, %arg2, %arg3] : memref<?x?x?xf32>, vector<2x4xf32>
    %1 = vector.extract %0[1] : vector<4xf32> from vector<2x4xf32>
    return %1 : vector<4xf32>
  }
  func.func @negative_extract_load_scalar_from_memref_of_vec(%arg0: memref<?xvector<4xf32>>, %arg1: index) -> f32 {
    %0 = vector.load %arg0[%arg1] : memref<?xvector<4xf32>>, vector<4xf32>
    %1 = vector.extract %0[0] : f32 from vector<4xf32>
    return %1 : f32
  }
  func.func @negative_extract_load_scalar_from_memref_of_i1(%arg0: memref<?xi1>, %arg1: index) -> i1 {
    %0 = vector.load %arg0[%arg1] : memref<?xi1>, vector<8xi1>
    %1 = vector.extract %0[0] : i1 from vector<8xi1>
    return %1 : i1
  }
  func.func @negative_extract_load_no_single_use(%arg0: memref<?xf32>, %arg1: index) -> (f32, vector<4xf32>) {
    %0 = vector.load %arg0[%arg1] : memref<?xf32>, vector<4xf32>
    %1 = vector.extract %0[0] : f32 from vector<4xf32>
    return %1, %0 : f32, vector<4xf32>
  }
  func.func @negative_extract_load_scalable(%arg0: memref<?xf32>, %arg1: index) -> f32 {
    %0 = vector.load %arg0[%arg1] : memref<?xf32>, vector<[1]xf32>
    %1 = vector.extract %0[0] : f32 from vector<[1]xf32>
    return %1 : f32
  }
  func.func @store_splat(%arg0: memref<?xf32>, %arg1: index, %arg2: f32) {
    %0 = vector.broadcast %arg2 : f32 to vector<1xf32>
    vector.store %0, %arg0[%arg1] : memref<?xf32>, vector<1xf32>
    return
  }
  func.func @store_broadcast(%arg0: memref<?xf32>, %arg1: index, %arg2: f32) {
    %0 = vector.broadcast %arg2 : f32 to vector<1xf32>
    vector.store %0, %arg0[%arg1] : memref<?xf32>, vector<1xf32>
    return
  }
  func.func @store_broadcast_1d_to_2d(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index, %arg3: vector<1xf32>) {
    %0 = vector.broadcast %arg3 : vector<1xf32> to vector<1x1xf32>
    vector.store %0, %arg0[%arg1, %arg2] : memref<?x?xf32>, vector<1x1xf32>
    return
  }
  func.func @negative_store_scalable(%arg0: memref<?xf32>, %arg1: index, %arg2: f32) {
    %0 = vector.broadcast %arg2 : f32 to vector<[1]xf32>
    vector.store %0, %arg0[%arg1] : memref<?xf32>, vector<[1]xf32>
    return
  }
  func.func @negative_store_memref_of_vec(%arg0: memref<?xvector<1xf32>>, %arg1: index, %arg2: f32) {
    %0 = vector.broadcast %arg2 : f32 to vector<1xf32>
    vector.store %0, %arg0[%arg1] : memref<?xvector<1xf32>>, vector<1xf32>
    return
  }
  func.func @negative_store_more_than_one_element(%arg0: memref<?xf32>, %arg1: index, %arg2: f32) {
    %0 = vector.broadcast %arg2 : f32 to vector<4xf32>
    vector.store %0, %arg0[%arg1] : memref<?xf32>, vector<4xf32>
    return
  }
  func.func @negative_store_no_single_use(%arg0: memref<?xf32>, %arg1: index, %arg2: f32) -> vector<1xf32> {
    %0 = vector.broadcast %arg2 : f32 to vector<1xf32>
    vector.store %0, %arg0[%arg1] : memref<?xf32>, vector<1xf32>
    return %0 : vector<1xf32>
  }
}

