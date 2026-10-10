module {
  func.func @expand_shape_identity_fold(%arg0: tensor<5xf32>) -> tensor<5xf32> {
    %expanded = tensor.expand_shape %arg0 [[0]] output_shape [5] : tensor<5xf32> into tensor<5xf32>
    return %expanded : tensor<5xf32>
  }
}

// -----
module {
  func.func @expand_shape_rank0_identity_fold(%arg0: tensor<f32>) -> tensor<f32> {
    %expanded = tensor.expand_shape %arg0 [] output_shape [] : tensor<f32> into tensor<f32>
    return %expanded : tensor<f32>
  }
}

// -----
module {
  func.func @collapse_shape_identity_fold(%arg0: tensor<5x4xf32>) -> tensor<5x4xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0], [1]] : tensor<5x4xf32> into tensor<5x4xf32>
    return %collapsed : tensor<5x4xf32>
  }
}

// -----
module {
  func.func @collapse_shape_rank0_identity_fold(%arg0: tensor<f32>) -> tensor<f32> {
    %collapsed = tensor.collapse_shape %arg0 [] : tensor<f32> into tensor<f32>
    return %collapsed : tensor<f32>
  }
}

// -----
module {
  func.func @tensor_bitcast_chain_ok(%arg0: tensor<2xi32>) -> tensor<2xf32> {
    %0 = tensor.bitcast %arg0 : tensor<2xi32> to tensor<2xui32>
    %1 = tensor.bitcast %0 : tensor<2xui32> to tensor<2xf32>
    return %1 : tensor<2xf32>
  }
}

// -----
module {
  func.func @tensor_bitcast_chain_nop(%arg0: tensor<4xi32>) -> tensor<4xi32> {
    %0 = tensor.bitcast %arg0 : tensor<4xi32> to tensor<4xui32>
    %1 = tensor.bitcast %0 : tensor<4xui32> to tensor<4xi32>
    return %1 : tensor<4xi32>
  }
}

// -----
module {
  func.func @cast_values(%arg0: tensor<*xi32>) -> tensor<2xi32> {
    %cast = tensor.cast %arg0 : tensor<*xi32> to tensor<*xi32>
    %cast_0 = tensor.cast %cast : tensor<*xi32> to tensor<2xi32>
    %cast_1 = tensor.cast %cast_0 : tensor<2xi32> to tensor<2xi32>
    return %cast_1 : tensor<2xi32>
  }
}

// -----
module {
  func.func @tensor.cast_chain_ok(%arg0: tensor<*xi32>) -> tensor<4x8xi32> {
    %cast = tensor.cast %arg0 : tensor<*xi32> to tensor<4x?xi32>
    %cast_0 = tensor.cast %cast : tensor<4x?xi32> to tensor<4x8xi32>
    return %cast_0 : tensor<4x8xi32>
  }
}

// -----
module {
  func.func @tensor.cast_chain_regain(%arg0: tensor<4xi32>) -> tensor<4xi32> {
    %cast = tensor.cast %arg0 : tensor<4xi32> to tensor<?xi32>
    %cast_0 = tensor.cast %cast : tensor<?xi32> to tensor<4xi32>
    return %cast_0 : tensor<4xi32>
  }
}

// -----
module {
  func.func @tensor.cast_chain_keep(%arg0: tensor<?x?xi32>) -> tensor<?x8xi32> {
    %cast = tensor.cast %arg0 : tensor<?x?xi32> to tensor<4x?xi32>
    %cast_0 = tensor.cast %cast : tensor<4x?xi32> to tensor<?x8xi32>
    return %cast_0 : tensor<?x8xi32>
  }
}

// -----
module {
  func.func @tensor.cast_chain_invalid(%arg0: tensor<4x8xi32>) -> tensor<8x4xi32> {
    %cast = tensor.cast %arg0 : tensor<4x8xi32> to tensor<?x?xi32>
    %cast_0 = tensor.cast %cast : tensor<?x?xi32> to tensor<8x4xi32>
    return %cast_0 : tensor<8x4xi32>
  }
}

// -----
module {
  func.func @fold_concat(%arg0: tensor<1x2x?xi32>) -> (tensor<1x2x3xi32>, tensor<1x2x?xi32>) {
    %concat = tensor.concat dim(2) %arg0 : (tensor<1x2x?xi32>) -> tensor<1x2x3xi32>
    %concat_0 = tensor.concat dim(2) %arg0 : (tensor<1x2x?xi32>) -> tensor<1x2x?xi32>
    return %concat, %concat_0 : tensor<1x2x3xi32>, tensor<1x2x?xi32>
  }
}

// -----
module {
  func.func @infer_concat_operand_types(%arg0: tensor<?x12xi32>, %arg1: tensor<?x?xi32>) -> tensor<?x12xi32> {
    %concat = tensor.concat dim(0) %arg0, %arg1 : (tensor<?x12xi32>, tensor<?x?xi32>) -> tensor<?x12xi32>
    return %concat : tensor<?x12xi32>
  }
}

// -----
module {
  func.func @infer_concat_return_type(%arg0: tensor<5x12xi32>, %arg1: tensor<?x12xi32>) -> tensor<?x?xi32> {
    %concat = tensor.concat dim(0) %arg0, %arg1 : (tensor<5x12xi32>, tensor<?x12xi32>) -> tensor<?x?xi32>
    return %concat : tensor<?x?xi32>
  }
}

// -----
module {
  func.func @fold_extract(%arg0: index) -> (f32, f16, f16, i32, complex<f32>, i32) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %cst = arith.constant dense<4.000000e+00> : tensor<4xf32>
    %extracted = tensor.extract %cst[%arg0] : tensor<4xf32>
    %cst_0 = arith.constant sparse<[[0, 0, 0], [1, 1, 1]], [-5.000000e+00, -2.000000e+00]> : tensor<4x4x4xf16>
    %extracted_1 = tensor.extract %cst_0[%c1, %c1, %c1] : tensor<4x4x4xf16>
    %cst_2 = arith.constant sparse<1, -2.000000e+00> : tensor<2x2x2xf16>
    %extracted_3 = tensor.extract %cst_2[%c0, %c0, %c0] : tensor<2x2x2xf16>
    %cst_4 = arith.constant dense<[[[1, -2, 1, 36]], [[0, 2, -1, 64]]]> : tensor<2x1x4xi32>
    %extracted_5 = tensor.extract %cst_4[%c1, %c0, %c3] : tensor<2x1x4xi32>
    %cst_6 = arith.constant dense<(1.200000e+00,2.300000e+00)> : tensor<complex<f32>>
    %extracted_7 = tensor.extract %cst_6[] : tensor<complex<f32>>
    %c4_i32 = arith.constant 4 : i32
    %cst_8 = arith.constant dense<[[1, 3], [0, 2]]> : tensor<2x2xi32>
    %inserted = tensor.insert %c4_i32 into %cst_8[%c1, %c0] : tensor<2x2xi32>
    %extracted_9 = tensor.extract %inserted[%c1, %c0] : tensor<2x2xi32>
    return %extracted, %extracted_1, %extracted_3, %extracted_5, %extracted_7, %extracted_9 : f32, f16, f16, i32, complex<f32>, i32
  }
}

// -----
module {
  func.func @extract_dense_resource_nofold() -> i64 {
    %c0 = arith.constant 0 : index
    %cst = arith.constant dense_resource<__elided__> : tensor<1xi64>
    %extracted = tensor.extract %cst[%c0] : tensor<1xi64>
    return %extracted : i64
  }
}

// -----
module {
  func.func @fold_insert(%arg0: index) -> tensor<4xf32> {
    %cst = arith.constant dense<4.000000e+00> : tensor<4xf32>
    %cst_0 = arith.constant 4.000000e+00 : f32
    %inserted = tensor.insert %cst_0 into %cst[%arg0] : tensor<4xf32>
    return %inserted : tensor<4xf32>
  }
}

// -----
module {
  func.func @extract_from_tensor.cast(%arg0: tensor<9xf32>) -> f32 {
    %c0 = arith.constant 0 : index
    %cast = tensor.cast %arg0 : tensor<9xf32> to tensor<?xf32>
    %extracted = tensor.extract %cast[%c0] : tensor<?xf32>
    return %extracted : f32
  }
}

// -----
module {
  func.func @extract_from_tensor.from_elements(%arg0: index) -> index {
    %c0 = arith.constant 0 : index
    %from_elements = tensor.from_elements %arg0 : tensor<1xindex>
    %extracted = tensor.extract %from_elements[%c0] : tensor<1xindex>
    return %extracted : index
  }
}

// -----
module {
  func.func @extract_from_tensor.from_elements_0d(%arg0: index) -> index {
    %c0 = arith.constant 0 : index
    %from_elements = tensor.from_elements %arg0 : tensor<index>
    %extracted = tensor.extract %from_elements[] : tensor<index>
    return %extracted : index
  }
}

// -----
module {
  func.func @extract_from_tensor.from_elements_3d() -> (f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32) {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    %cst_1 = arith.constant 2.000000e+00 : f32
    %cst_2 = arith.constant 3.000000e+00 : f32
    %cst_3 = arith.constant 4.000000e+00 : f32
    %cst_4 = arith.constant 5.000000e+00 : f32
    %cst_5 = arith.constant 6.000000e+00 : f32
    %cst_6 = arith.constant 7.000000e+00 : f32
    %cst_7 = arith.constant 8.000000e+00 : f32
    %cst_8 = arith.constant 9.000000e+00 : f32
    %cst_9 = arith.constant 1.000000e+01 : f32
    %cst_10 = arith.constant 1.100000e+01 : f32
    %from_elements = tensor.from_elements %cst, %cst_0, %cst_1, %cst_2, %cst_3, %cst_4, %cst_5, %cst_6, %cst_7, %cst_8, %cst_9, %cst_10 : tensor<3x2x2xf32>
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %extracted = tensor.extract %from_elements[%c0, %c0, %c0] : tensor<3x2x2xf32>
    %extracted_11 = tensor.extract %from_elements[%c0, %c0, %c1] : tensor<3x2x2xf32>
    %extracted_12 = tensor.extract %from_elements[%c0, %c1, %c0] : tensor<3x2x2xf32>
    %extracted_13 = tensor.extract %from_elements[%c0, %c1, %c1] : tensor<3x2x2xf32>
    %extracted_14 = tensor.extract %from_elements[%c1, %c0, %c0] : tensor<3x2x2xf32>
    %extracted_15 = tensor.extract %from_elements[%c1, %c0, %c1] : tensor<3x2x2xf32>
    %extracted_16 = tensor.extract %from_elements[%c1, %c1, %c0] : tensor<3x2x2xf32>
    %extracted_17 = tensor.extract %from_elements[%c1, %c1, %c1] : tensor<3x2x2xf32>
    %extracted_18 = tensor.extract %from_elements[%c2, %c0, %c0] : tensor<3x2x2xf32>
    %extracted_19 = tensor.extract %from_elements[%c2, %c0, %c1] : tensor<3x2x2xf32>
    %extracted_20 = tensor.extract %from_elements[%c2, %c1, %c0] : tensor<3x2x2xf32>
    %extracted_21 = tensor.extract %from_elements[%c2, %c1, %c1] : tensor<3x2x2xf32>
    return %extracted, %extracted_11, %extracted_12, %extracted_13, %extracted_14, %extracted_15, %extracted_16, %extracted_17, %extracted_18, %extracted_19, %extracted_20, %extracted_21 : f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32
  }
}

// -----
module {
  func.func @extract_from_tensor.from_elements_variable_3d(%arg0: f32, %arg1: f32, %arg2: f32, %arg3: f32, %arg4: f32, %arg5: f32, %arg6: f32, %arg7: f32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32) -> (f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32) {
    %from_elements = tensor.from_elements %arg0, %arg1, %arg2, %arg3, %arg4, %arg5, %arg6, %arg7, %arg8, %arg9, %arg10, %arg11 : tensor<3x2x2xf32>
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %extracted = tensor.extract %from_elements[%c0, %c0, %c0] : tensor<3x2x2xf32>
    %extracted_0 = tensor.extract %from_elements[%c0, %c0, %c1] : tensor<3x2x2xf32>
    %extracted_1 = tensor.extract %from_elements[%c0, %c1, %c0] : tensor<3x2x2xf32>
    %extracted_2 = tensor.extract %from_elements[%c0, %c1, %c1] : tensor<3x2x2xf32>
    %extracted_3 = tensor.extract %from_elements[%c1, %c0, %c0] : tensor<3x2x2xf32>
    %extracted_4 = tensor.extract %from_elements[%c1, %c0, %c1] : tensor<3x2x2xf32>
    %extracted_5 = tensor.extract %from_elements[%c1, %c1, %c0] : tensor<3x2x2xf32>
    %extracted_6 = tensor.extract %from_elements[%c1, %c1, %c1] : tensor<3x2x2xf32>
    %extracted_7 = tensor.extract %from_elements[%c2, %c0, %c0] : tensor<3x2x2xf32>
    %extracted_8 = tensor.extract %from_elements[%c2, %c0, %c1] : tensor<3x2x2xf32>
    %extracted_9 = tensor.extract %from_elements[%c2, %c1, %c0] : tensor<3x2x2xf32>
    %extracted_10 = tensor.extract %from_elements[%c2, %c1, %c1] : tensor<3x2x2xf32>
    return %extracted, %extracted_0, %extracted_1, %extracted_2, %extracted_3, %extracted_4, %extracted_5, %extracted_6, %extracted_7, %extracted_8, %extracted_9, %extracted_10 : f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32
  }
}

// -----
module {
  func.func @extract_from_elements_complex_i() -> tensor<3xcomplex<i32>> {
    %cst = arith.constant dense<(1,2)> : tensor<complex<i32>>
    %extracted = tensor.extract %cst[] : tensor<complex<i32>>
    %cst_0 = arith.constant dense<(3,2)> : tensor<complex<i32>>
    %extracted_1 = tensor.extract %cst_0[] : tensor<complex<i32>>
    %from_elements = tensor.from_elements %extracted, %extracted_1, %extracted : tensor<3xcomplex<i32>>
    return %from_elements : tensor<3xcomplex<i32>>
  }
}

// -----
module {
  func.func @extract_from_elements_complex_f() -> tensor<3xcomplex<f32>> {
    %cst = arith.constant dense<(1.200000e+00,2.300000e+00)> : tensor<complex<f32>>
    %extracted = tensor.extract %cst[] : tensor<complex<f32>>
    %cst_0 = arith.constant dense<(3.200000e+00,2.100000e+00)> : tensor<complex<f32>>
    %extracted_1 = tensor.extract %cst_0[] : tensor<complex<f32>>
    %from_elements = tensor.from_elements %extracted, %extracted_1, %extracted : tensor<3xcomplex<f32>>
    return %from_elements : tensor<3xcomplex<f32>>
  }
}

// -----
module {
  func.func @extract_negative_from_tensor.from_elements(%arg0: index) -> index {
    %c-1 = arith.constant -1 : index
    %from_elements = tensor.from_elements %arg0 : tensor<1xindex>
    %extracted = tensor.extract %from_elements[%c-1] : tensor<1xindex>
    return %extracted : index
  }
}

// -----
module {
  func.func @extract_oob_from_tensor.from_elements(%arg0: index) -> index {
    %c1 = arith.constant 1 : index
    %from_elements = tensor.from_elements %arg0 : tensor<1xindex>
    %extracted = tensor.extract %from_elements[%c1] : tensor<1xindex>
    return %extracted : index
  }
}

// -----
module {
  func.func @extract_oob_from_tensor.from_elements(%arg0: index) -> index {
    %c2 = arith.constant 2 : index
    %from_elements = tensor.from_elements %arg0 : tensor<1xindex>
    %extracted = tensor.extract %from_elements[%c2] : tensor<1xindex>
    return %extracted : index
  }
}

// -----
module {
  func.func @extract_from_tensor.generate(%arg0: index, %arg1: tensor<*xf32>) -> index {
    %rank = tensor.rank %arg1 : tensor<*xf32>
    %generated = tensor.generate %rank {
    ^bb0(%arg2: index):
      %dim = tensor.dim %arg1, %arg2 : tensor<*xf32>
      tensor.yield %dim : index
    } : tensor<?xindex>
    %extracted = tensor.extract %generated[%arg0] : tensor<?xindex>
    return %extracted : index
  }
}

// -----
module {
  func.func @extract_from_tensor.generate_2d(%arg0: index, %arg1: index, %arg2: tensor<*xf32>) -> index {
    %rank = tensor.rank %arg2 : tensor<*xf32>
    %generated = tensor.generate %rank, %rank {
    ^bb0(%arg3: index, %arg4: index):
      %dim = tensor.dim %arg2, %arg3 : tensor<*xf32>
      %dim_0 = tensor.dim %arg2, %arg4 : tensor<*xf32>
      %0 = arith.addi %dim, %dim_0 : index
      tensor.yield %0 : index
    } : tensor<?x?xindex>
    %extracted = tensor.extract %generated[%arg0, %arg1] : tensor<?x?xindex>
    return %extracted : index
  }
}

// -----
module {
  func.func @extract_from_tensor.generate_sideeffects(%arg0: index, %arg1: tensor<*xf32>, %arg2: memref<?xindex>) -> index {
    %rank = tensor.rank %arg1 : tensor<*xf32>
    %generated = tensor.generate %rank {
    ^bb0(%arg3: index):
      %dim = tensor.dim %arg1, %arg3 : tensor<*xf32>
      memref.store %dim, %arg2[%arg3] : memref<?xindex>
      tensor.yield %dim : index
    } : tensor<?xindex>
    %extracted = tensor.extract %generated[%arg0] : tensor<?xindex>
    return %extracted : index
  }
}

// -----
module {
  func.func @static_tensor.generate(%arg0: index, %arg1: index) -> tensor<3x?x?x7x?xindex> {
    %c5 = arith.constant 5 : index
    %generated = tensor.generate %arg0, %c5, %arg1 {
    ^bb0(%arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index):
      %c32 = arith.constant 32 : index
      tensor.yield %c32 : index
    } : tensor<3x?x?x7x?xindex>
    return %generated : tensor<3x?x?x7x?xindex>
  }
}

// -----
module {
  func.func @from_elements.constant() -> tensor<3xindex> {
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %from_elements = tensor.from_elements %c1, %c2, %c1 : tensor<3xindex>
    return %from_elements : tensor<3xindex>
  }
}

// -----
module {
  func.func @slice_canonicalize(%arg0: tensor<?x?x?xf32>, %arg1: index, %arg2: index) -> tensor<?x?x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %extracted_slice = tensor.extract_slice %arg0[%c0, %arg1, %c1] [%c4, %c1, %arg2] [%c1, %c1, %c1] : tensor<?x?x?xf32> to tensor<?x?x?xf32>
    return %extracted_slice : tensor<?x?x?xf32>
  }
}

// -----
module {
  func.func @rank_reducing_slice_canonicalize(%arg0: tensor<?x?x?xf32>, %arg1: index, %arg2: index) -> tensor<?x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %extracted_slice = tensor.extract_slice %arg0[%c0, %arg1, %c1] [%c4, 1, %arg2] [%c1, %c1, %c1] : tensor<?x?x?xf32> to tensor<?x?xf32>
    return %extracted_slice : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @trivial_slice(%arg0: tensor<4x6x16x32xi8>) -> tensor<4x6x16x32xi8> {
    %extracted_slice = tensor.extract_slice %arg0[0, 0, 0, 0] [4, 6, 16, 32] [1, 1, 1, 1] : tensor<4x6x16x32xi8> to tensor<4x6x16x32xi8>
    return %extracted_slice : tensor<4x6x16x32xi8>
  }
}

// -----
module {
  func.func @trivial_insert_slice(%arg0: tensor<4x6x16x32xi8>, %arg1: tensor<4x6x16x32xi8>) -> tensor<4x6x16x32xi8> {
    %inserted_slice = tensor.insert_slice %arg0 into %arg1[0, 0, 0, 0] [4, 6, 16, 32] [1, 1, 1, 1] : tensor<4x6x16x32xi8> into tensor<4x6x16x32xi8>
    return %inserted_slice : tensor<4x6x16x32xi8>
  }
}

// -----
module {
  func.func @empty_insert_slice(%arg0: tensor<0x2xi8>, %arg1: tensor<3x3xi8>) -> tensor<3x3xi8> {
    %inserted_slice = tensor.insert_slice %arg0 into %arg1[0, 0] [0, 2] [1, 1] : tensor<0x2xi8> into tensor<3x3xi8>
    return %inserted_slice : tensor<3x3xi8>
  }
}

// -----
module {
  func.func @rank_reducing_tensor_of_cast(%arg0: tensor<4x6x16x32xi8>) -> tensor<16x32xi8> {
    %cast = tensor.cast %arg0 : tensor<4x6x16x32xi8> to tensor<?x?x16x32xi8>
    %extracted_slice = tensor.extract_slice %cast[0, 1, 0, 0] [1, 1, 16, 32] [1, 1, 1, 1] : tensor<?x?x16x32xi8> to tensor<16x32xi8>
    return %extracted_slice : tensor<16x32xi8>
  }
}

// -----
module {
  func.func @out_of_bounds_extract_slice(%arg0: tensor<5xf32>) -> tensor<?xf32> {
    %c10 = arith.constant 10 : index
    %extracted_slice = tensor.extract_slice %arg0[0] [%c10] [1] : tensor<5xf32> to tensor<?xf32>
    return %extracted_slice : tensor<?xf32>
  }
}

// -----
module {
  func.func @out_of_bounds_extract_slice(%arg0: tensor<5xf32>) -> tensor<10xf32> {
    %cast = tensor.cast %arg0 : tensor<5xf32> to tensor<?xf32>
    %extracted_slice = tensor.extract_slice %cast[0] [10] [1] : tensor<?xf32> to tensor<10xf32>
    return %extracted_slice : tensor<10xf32>
  }
}

// -----
module {
  func.func @out_of_bounds_insert_slice(%arg0: tensor<5xf32>, %arg1: tensor<10xf32>) -> tensor<10xf32> {
    %c10 = arith.constant 10 : index
    %inserted_slice = tensor.insert_slice %arg0 into %arg1[%c10] [5] [1] : tensor<5xf32> into tensor<10xf32>
    return %inserted_slice : tensor<10xf32>
  }
}

// -----
module {
  func.func @out_of_bounds_insert_slice(%arg0: tensor<5xf32>, %arg1: tensor<10xf32>, %arg2: index) -> tensor<10xf32> {
    %cast = tensor.cast %arg0 : tensor<5xf32> to tensor<?xf32>
    %inserted_slice = tensor.insert_slice %cast into %arg1[7] [%arg2] [1] : tensor<?xf32> into tensor<10xf32>
    return %inserted_slice : tensor<10xf32>
  }
}

// -----
module {
  func.func @out_of_bounds_insert_slice(%arg0: tensor<5xf32>, %arg1: tensor<10xf32>, %arg2: index) -> tensor<?xf32> {
    %cast = tensor.cast %arg1 : tensor<10xf32> to tensor<?xf32>
    %inserted_slice = tensor.insert_slice %arg0 into %cast[7] [5] [1] : tensor<5xf32> into tensor<?xf32>
    return %inserted_slice : tensor<?xf32>
  }
}

// -----
module {
  func.func @rank_reducing_insert_slice_of_cast(%arg0: tensor<16x32xi8>, %arg1: tensor<4x6x16x32xi8>) -> tensor<4x6x16x32xi8> {
    %c0 = arith.constant 0 : index
    %cast = tensor.cast %arg0 : tensor<16x32xi8> to tensor<?x32xi8>
    %dim = tensor.dim %cast, %c0 : tensor<?x32xi8>
    %inserted_slice = tensor.insert_slice %cast into %arg1[0, 1, 0, 0] [1, 1, %dim, 32] [1, 1, 1, 1] : tensor<?x32xi8> into tensor<4x6x16x32xi8>
    return %inserted_slice : tensor<4x6x16x32xi8>
  }
}

// -----
module {
  func.func @insert_slice_canonicalize(%arg0: tensor<?x?x?xf32>, %arg1: index, %arg2: index, %arg3: tensor<?x?x?xf32>) -> tensor<?x?x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %inserted_slice = tensor.insert_slice %arg0 into %arg3[%c0, %arg1, %c1] [%c4, %c1, %arg2] [%c1, %c1, %c1] : tensor<?x?x?xf32> into tensor<?x?x?xf32>
    return %inserted_slice : tensor<?x?x?xf32>
  }
}

// -----
module {
  func.func @insert_slice_canonicalize_encoding(%arg0: tensor<2x2xf32, "foo">, %arg1: tensor<4x4xf32, "foo">) -> tensor<4x4xf32, "foo"> {
    %inserted_slice = tensor.insert_slice %arg0 into %arg1[0, 0] [2, 2] [1, 1] : tensor<2x2xf32, "foo"> into tensor<4x4xf32, "foo">
    return %inserted_slice : tensor<4x4xf32, "foo">
  }
}

// -----
module {
  func.func @slice_to_insert_slice_canonicalize(%arg0: tensor<?x?x?xf32>, %arg1: index, %arg2: index, %arg3: tensor<?x?x?xf32>) -> tensor<?x?x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %extracted_slice = tensor.extract_slice %arg0[%c0, %arg1, %c1] [%c4, %c1, %arg2] [%c1, %c1, %c1] : tensor<?x?x?xf32> to tensor<?x?x?xf32>
    %inserted_slice = tensor.insert_slice %extracted_slice into %arg3[%c0, %arg1, %c1] [%c4, %c1, %arg2] [%c1, %c1, %c1] : tensor<?x?x?xf32> into tensor<?x?x?xf32>
    return %inserted_slice : tensor<?x?x?xf32>
  }
}

// -----
module {
  func.func @rank_reducing_insert_slice_canonicalize(%arg0: tensor<?x?xf32>, %arg1: index, %arg2: index, %arg3: tensor<?x?x?xf32>) -> tensor<?x?x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %inserted_slice = tensor.insert_slice %arg0 into %arg3[%c0, %arg1, %c1] [%c4, 1, %arg2] [%c1, %c1, %c1] : tensor<?x?xf32> into tensor<?x?x?xf32>
    return %inserted_slice : tensor<?x?x?xf32>
  }
}

// -----
module {
  func.func @rank_reducing_slice_to_insert_slice_canonicalize(%arg0: tensor<?x?x?xf32>, %arg1: index, %arg2: index, %arg3: tensor<?x?x?xf32>) -> tensor<?x?x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %extracted_slice = tensor.extract_slice %arg0[%c0, %arg1, %c1] [%c4, 1, %arg2] [%c1, %c1, %c1] : tensor<?x?x?xf32> to tensor<?x?xf32>
    %inserted_slice = tensor.insert_slice %extracted_slice into %arg3[%c0, %arg1, %c1] [%c4, 1, %arg2] [%c1, %c1, %c1] : tensor<?x?xf32> into tensor<?x?x?xf32>
    return %inserted_slice : tensor<?x?x?xf32>
  }
}

// -----
module {
  func.func @insert_slice_propagate_dest_cast(%arg0: tensor<2x?xi32>, %arg1: tensor<i32>, %arg2: index, %arg3: index) -> tensor<?x?xi32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c8 = arith.constant 8 : index
    %dim = tensor.dim %arg0, %c1 : tensor<2x?xi32>
    %extracted = tensor.extract %arg1[] : tensor<i32>
    %generated = tensor.generate %arg2, %c8 {
    ^bb0(%arg4: index, %arg5: index):
      tensor.yield %extracted : i32
    } : tensor<?x?xi32>
    %inserted_slice = tensor.insert_slice %arg0 into %generated[0, %arg3] [2, %dim] [1, 1] : tensor<2x?xi32> into tensor<?x?xi32>
    return %inserted_slice : tensor<?x?xi32>
  }
}

// -----
module {
  func.func @insert_slice_output_dest_canonicalize(%arg0: tensor<2x3xi32>, %arg1: tensor<i32>) -> tensor<3x9xi32> {
    %c9 = arith.constant 9 : index
    %c3 = arith.constant 3 : index
    %extracted = tensor.extract %arg1[] : tensor<i32>
    %generated = tensor.generate %c3, %c9 {
    ^bb0(%arg2: index, %arg3: index):
      tensor.yield %extracted : i32
    } : tensor<?x?xi32>
    %inserted_slice = tensor.insert_slice %arg0 into %generated[0, 1] [2, 3] [1, 1] : tensor<2x3xi32> into tensor<?x?xi32>
    %cast = tensor.cast %inserted_slice : tensor<?x?xi32> to tensor<3x9xi32>
    return %cast : tensor<3x9xi32>
  }
}

// -----
module {
  func.func @dim_of_tensor.generate(%arg0: index, %arg1: index) -> index {
    %c3 = arith.constant 3 : index
    %generated = tensor.generate %arg0, %arg1 {
    ^bb0(%arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index):
      tensor.yield %c3 : index
    } : tensor<2x?x4x?x5xindex>
    %dim = tensor.dim %generated, %c3 : tensor<2x?x4x?x5xindex>
    return %dim : index
  }
}

// -----
module {
  func.func @fold_dim_of_tensor.cast(%arg0: tensor<4x?xf32>) -> (index, index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cast = tensor.cast %arg0 : tensor<4x?xf32> to tensor<?x?xf32>
    %dim = tensor.dim %cast, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %cast, %c1 : tensor<?x?xf32>
    return %dim, %dim_0 : index, index
  }
}

// -----
module {
  func.func @insert_slice_cast(%arg0: tensor<1x?xf32>, %arg1: tensor<?x?xf32>, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index) -> tensor<?x?xf32> {
    %cast = tensor.cast %arg0 : tensor<1x?xf32> to tensor<?x?xf32>
    %inserted_slice = tensor.insert_slice %cast into %arg1[%arg2, %arg3] [%arg4, %arg5] [%arg6, %arg7] : tensor<?x?xf32> into tensor<?x?xf32>
    return %inserted_slice : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @insert_slice_cast_no_fold(%arg0: tensor<1x?xf32>, %arg1: tensor<?x?xf32>, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index) -> tensor<?x?xf32> {
    %cast = tensor.cast %arg0 : tensor<1x?xf32> to tensor<?x5xf32>
    %inserted_slice = tensor.insert_slice %cast into %arg1[%arg2, %arg3] [%arg4, 5] [%arg6, %arg7] : tensor<?x5xf32> into tensor<?x?xf32>
    return %inserted_slice : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @insert_tensor_cast_on_insert_slice_src(%arg0: tensor<?x5x?xf32>, %arg1: tensor<?x?x?xf32>, %arg2: index, %arg3: index) -> tensor<?x?x?xf32> {
    %c64 = arith.constant 64 : index
    %inserted_slice = tensor.insert_slice %arg0 into %arg1[0, 1, 2] [%c64, 5, %c64] [1, 1, 1] : tensor<?x5x?xf32> into tensor<?x?x?xf32>
    return %inserted_slice : tensor<?x?x?xf32>
  }
}

// -----
module {
  func.func @fold_extract_insert(%arg0: tensor<?x?x?xf32>, %arg1: tensor<4x?x8xf32>, %arg2: index, %arg3: index) -> tensor<4x?x8xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %inserted_slice = tensor.insert_slice %arg1 into %arg0[%c0, %arg2, 0] [4, %arg3, 8] [1, 1, %c1] : tensor<4x?x8xf32> into tensor<?x?x?xf32>
    %extracted_slice = tensor.extract_slice %inserted_slice[%c0, %arg2, 0] [4, %arg3, 8] [1, 1, %c1] : tensor<?x?x?xf32> to tensor<4x?x8xf32>
    return %extracted_slice : tensor<4x?x8xf32>
  }
}

// -----
module {
  func.func @fold_gather_constant_splat(%arg0: tensor<1x2x3xindex>) -> tensor<1x2x1x1x1xf32> {
    %cst = arith.constant dense<1.000000e-01> : tensor<4x4x4xf32>
    %gather = tensor.gather %cst[%arg0] gather_dims([0, 1, 2]) : (tensor<4x4x4xf32>, tensor<1x2x3xindex>) -> tensor<1x2x1x1x1xf32>
    return %gather : tensor<1x2x1x1x1xf32>
  }
}

// -----
module {
  func.func @fold_reshape_constant_splat(%arg0: tensor<1xi32>) -> tensor<4xf32> {
    %cst = arith.constant dense<1.000000e-01> : tensor<4x1xf32>
    %reshape = tensor.reshape %cst(%arg0) : (tensor<4x1xf32>, tensor<1xi32>) -> tensor<4xf32>
    return %reshape : tensor<4xf32>
  }
}

// -----
module {
  func.func @fold_reshape_chain(%arg0: tensor<*xf32>, %arg1: tensor<?xindex>, %arg2: tensor<?xindex>, %arg3: tensor<?xindex>) -> tensor<*xf32> {
    %reshape = tensor.reshape %arg0(%arg1) : (tensor<*xf32>, tensor<?xindex>) -> tensor<*xf32>
    %reshape_0 = tensor.reshape %reshape(%arg2) : (tensor<*xf32>, tensor<?xindex>) -> tensor<*xf32>
    %reshape_1 = tensor.reshape %reshape_0(%arg3) : (tensor<*xf32>, tensor<?xindex>) -> tensor<*xf32>
    return %reshape_1 : tensor<*xf32>
  }
}

// -----
module {
  func.func @fold_reshape_1d(%arg0: tensor<?xf32>, %arg1: tensor<1xindex>) -> tensor<?xf32> {
    %reshape = tensor.reshape %arg0(%arg1) : (tensor<?xf32>, tensor<1xindex>) -> tensor<?xf32>
    return %reshape : tensor<?xf32>
  }
}

// -----
module {
  func.func @fold_reshape_0d(%arg0: tensor<f32>, %arg1: tensor<0xindex>) -> tensor<f32> {
    %reshape = tensor.reshape %arg0(%arg1) : (tensor<f32>, tensor<0xindex>) -> tensor<f32>
    return %reshape : tensor<f32>
  }
}

// -----
module {
  func.func @fold_extract_constant_splat() -> tensor<4x4xi32> {
    %cst = arith.constant dense<42> : tensor<1024x1024xi32>
    %extracted_slice = tensor.extract_slice %cst[0, 0] [4, 4] [1, 1] : tensor<1024x1024xi32> to tensor<4x4xi32>
    return %extracted_slice : tensor<4x4xi32>
  }
}

// -----
module {
  func.func @fold_overlapping_insert(%arg0: tensor<?x?x?xf32>, %arg1: tensor<4x?x8xf32>, %arg2: tensor<4x?x8xf32>, %arg3: index, %arg4: index) -> tensor<?x?x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %inserted_slice = tensor.insert_slice %arg1 into %arg0[%c0, %arg3, 0] [4, %arg4, 8] [1, 1, %c1] : tensor<4x?x8xf32> into tensor<?x?x?xf32>
    %inserted_slice_0 = tensor.insert_slice %arg2 into %inserted_slice[0, %arg3, 0] [4, %arg4, 8] [1, 1, %c1] : tensor<4x?x8xf32> into tensor<?x?x?xf32>
    return %inserted_slice_0 : tensor<?x?x?xf32>
  }
}

// -----
module {
  func.func @compose_expand_of_expand(%arg0: tensor<?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) -> tensor<?x6x4x?x5xf32> {
    %expanded = tensor.expand_shape %arg0 [[0, 1], [2]] output_shape [%arg1, 4, %arg2] : tensor<?x?xf32> into tensor<?x4x?xf32>
    %expanded_0 = tensor.expand_shape %expanded [[0, 1], [2], [3, 4]] output_shape [%arg3, 6, 4, %arg4, 5] : tensor<?x4x?xf32> into tensor<?x6x4x?x5xf32>
    return %expanded_0 : tensor<?x6x4x?x5xf32>
  }
}

// -----
module {
  func.func @compose_expand_of_expand_of_zero_dim(%arg0: tensor<f32>) -> tensor<1x1x1xf32> {
    %expanded = tensor.expand_shape %arg0 [] output_shape [1] : tensor<f32> into tensor<1xf32>
    %expanded_0 = tensor.expand_shape %expanded [[0, 1, 2]] output_shape [1, 1, 1] : tensor<1xf32> into tensor<1x1x1xf32>
    return %expanded_0 : tensor<1x1x1xf32>
  }
}

// -----
module {
  func.func @collapse_of_cast(%arg0: tensor<8x12x32xf32>) -> tensor<?x32xf32> {
    %cast = tensor.cast %arg0 : tensor<8x12x32xf32> to tensor<?x?x?xf32>
    %collapsed = tensor.collapse_shape %cast [[0, 1], [2]] : tensor<?x?x?xf32> into tensor<?x?xf32>
    %cast_0 = tensor.cast %collapsed : tensor<?x?xf32> to tensor<?x32xf32>
    return %cast_0 : tensor<?x32xf32>
  }
}

// -----
module {
  func.func @fold_collapse_of_expand(%arg0: tensor<12x4xf32>) -> tensor<12x4xf32> {
    %expanded = tensor.expand_shape %arg0 [[0, 1], [2]] output_shape [3, 4, 4] : tensor<12x4xf32> into tensor<3x4x4xf32>
    %collapsed = tensor.collapse_shape %expanded [[0, 1], [2]] : tensor<3x4x4xf32> into tensor<12x4xf32>
    return %collapsed : tensor<12x4xf32>
  }
}

// -----
module {
  func.func @fold_collapse_of_expand_dynamic(%arg0: tensor<?x?xf32>, %arg1: index, %arg2: index) -> tensor<?x?xf32> {
    %expanded = tensor.expand_shape %arg0 [[0, 1], [2]] output_shape [%arg1, 4, %arg2] : tensor<?x?xf32> into tensor<?x4x?xf32>
    %collapsed = tensor.collapse_shape %expanded [[0, 1], [2]] : tensor<?x4x?xf32> into tensor<?x?xf32>
    return %collapsed : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @fold_collapse_of_expand_fully_dynamic(%arg0: tensor<?x?xf32>, %arg1: index, %arg2: index, %arg3: index) -> tensor<?x?xf32> {
    %expanded = tensor.expand_shape %arg0 [[0, 1], [2]] output_shape [%arg1, %arg2, %arg3] : tensor<?x?xf32> into tensor<?x?x?xf32>
    %collapsed = tensor.collapse_shape %expanded [[0, 1], [2]] : tensor<?x?x?xf32> into tensor<?x?xf32>
    return %collapsed : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @no_fold_parallel_collapse_of_expand_dynamic(%arg0: tensor<?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) -> tensor<?x?x?xf32> {
    %expanded = tensor.expand_shape %arg0 [[0, 1], [2], [3]] output_shape [%arg1, %arg2, %arg3, %arg4] : tensor<?x?x?xf32> into tensor<?x?x?x?xf32>
    %collapsed = tensor.collapse_shape %expanded [[0], [1], [2, 3]] : tensor<?x?x?x?xf32> into tensor<?x?x?xf32>
    return %collapsed : tensor<?x?x?xf32>
  }
}

// -----
module {
  func.func @fold_expand_of_collapse(%arg0: tensor<3x4x4xf32>) -> tensor<3x4x4xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1], [2]] : tensor<3x4x4xf32> into tensor<12x4xf32>
    %expanded = tensor.expand_shape %collapsed [[0, 1], [2]] output_shape [3, 4, 4] : tensor<12x4xf32> into tensor<3x4x4xf32>
    return %expanded : tensor<3x4x4xf32>
  }
}

// -----
module {
  func.func @fold_expand_of_collapse_mixed_subshape(%arg0: tensor<?x4x?xf32>, %arg1: index, %arg2: index) -> tensor<?x4x?xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1], [2]] : tensor<?x4x?xf32> into tensor<?x?xf32>
    %expanded = tensor.expand_shape %collapsed [[0, 1], [2]] output_shape [%arg1, 4, %arg2] : tensor<?x?xf32> into tensor<?x4x?xf32>
    return %expanded : tensor<?x4x?xf32>
  }
}

// -----
module {
  func.func @fold_expand_of_collapse_mixed_target_subshape(%arg0: tensor<?x4x?x2xf32>, %arg1: index, %arg2: index) -> tensor<?x4x?xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1], [2, 3]] : tensor<?x4x?x2xf32> into tensor<?x?xf32>
    %expanded = tensor.expand_shape %collapsed [[0, 1], [2]] output_shape [%arg1, 4, %arg2] : tensor<?x?xf32> into tensor<?x4x?xf32>
    return %expanded : tensor<?x4x?xf32>
  }
}

// -----
module {
  func.func @no_fold_expand_of_collapse_fully_dynamic(%arg0: tensor<?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index) -> tensor<?x?x?xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1], [2]] : tensor<?x?x?xf32> into tensor<?x?xf32>
    %expanded = tensor.expand_shape %collapsed [[0, 1], [2]] output_shape [%arg1, %arg2, %arg3] : tensor<?x?xf32> into tensor<?x?x?xf32>
    return %expanded : tensor<?x?x?xf32>
  }
}

// -----
module {
  func.func @no_fold_expand_of_collapse_adjacent_dynamic(%arg0: tensor<?x?x?xf32>, %arg1: index, %arg2: index) -> tensor<?x?xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1, 2]] : tensor<?x?x?xf32> into tensor<?xf32>
    %expanded = tensor.expand_shape %collapsed [[0, 1]] output_shape [%arg1, %arg2] : tensor<?xf32> into tensor<?x?xf32>
    return %expanded : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @compose_expand_of_collapse_last_two_dims(%arg0: tensor<?x64x1xf32>) -> tensor<?x384xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1, 2]] : tensor<?x64x1xf32> into tensor<?xf32>
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %collapsed, %c0 : tensor<?xf32>
    %c384 = arith.constant 384 : index
    %0 = arith.divui %dim, %c384 : index
    %expanded = tensor.expand_shape %collapsed [[0, 1]] output_shape [%0, 384] : tensor<?xf32> into tensor<?x384xf32>
    return %expanded : tensor<?x384xf32>
  }
}

// -----
module {
  func.func @compose_expand_of_collapse(%arg0: tensor<2x3x4x5x6x7x8xf32>) -> tensor<24x5x42x8xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1, 2, 3, 4, 5, 6]] : tensor<2x3x4x5x6x7x8xf32> into tensor<40320xf32>
    %expanded = tensor.expand_shape %collapsed [[0, 1, 2, 3]] output_shape [24, 5, 42, 8] : tensor<40320xf32> into tensor<24x5x42x8xf32>
    return %expanded : tensor<24x5x42x8xf32>
  }
}

// -----
module {
  func.func @compose_expand_of_collapse_7D(%arg0: tensor<24x5x42x8xf32>) -> tensor<2x3x4x5x6x7x8xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1, 2, 3]] : tensor<24x5x42x8xf32> into tensor<40320xf32>
    %expanded = tensor.expand_shape %collapsed [[0, 1, 2, 3, 4, 5, 6]] output_shape [2, 3, 4, 5, 6, 7, 8] : tensor<40320xf32> into tensor<2x3x4x5x6x7x8xf32>
    return %expanded : tensor<2x3x4x5x6x7x8xf32>
  }
}

// -----
module {
  func.func @compose_collapse_of_expand(%arg0: tensor<?x?x?xi64>, %arg1: index, %arg2: index, %arg3: index) -> tensor<?x?xi64> {
    %expanded = tensor.expand_shape %arg0 [[0], [1], [2, 3]] output_shape [%arg1, %arg2, %arg3, 1] : tensor<?x?x?xi64> into tensor<?x?x?x1xi64>
    %collapsed = tensor.collapse_shape %expanded [[0, 1], [2, 3]] : tensor<?x?x?x1xi64> into tensor<?x?xi64>
    return %collapsed : tensor<?x?xi64>
  }
}

// -----
module {
  func.func @compose_collapse_of_expand_1D(%arg0: tensor<2048xf32>) -> tensor<4x512xf32> {
    %expanded = tensor.expand_shape %arg0 [[0, 1, 2, 3]] output_shape [1, 4, 1, 512] : tensor<2048xf32> into tensor<1x4x1x512xf32>
    %collapsed = tensor.collapse_shape %expanded [[0, 1, 2], [3]] : tensor<1x4x1x512xf32> into tensor<4x512xf32>
    return %collapsed : tensor<4x512xf32>
  }
}

// -----
module {
  func.func @compose_collapse_of_expand_partially_dynamic(%arg0: tensor<?xf16>, %arg1: index, %arg2: index) -> tensor<8x?x?xf16> {
    %expanded = tensor.expand_shape %arg0 [[0, 1, 2, 3, 4]] output_shape [4, 2, %arg1, %arg2, 32] : tensor<?xf16> into tensor<4x2x?x?x32xf16>
    %collapsed = tensor.collapse_shape %expanded [[0, 1], [2], [3, 4]] : tensor<4x2x?x?x32xf16> into tensor<8x?x?xf16>
    return %collapsed : tensor<8x?x?xf16>
  }
}

// -----
module {
  func.func @compose_expand_of_collapse_0_rank_to_expand(%arg0: tensor<1x1x1xf32>) -> tensor<1x1x1x1xf32> {
    %collapsed = tensor.collapse_shape %arg0 [] : tensor<1x1x1xf32> into tensor<f32>
    %expanded = tensor.expand_shape %collapsed [] output_shape [1, 1, 1, 1] : tensor<f32> into tensor<1x1x1x1xf32>
    return %expanded : tensor<1x1x1x1xf32>
  }
}

// -----
module {
  func.func @compose_expand_of_collapse_0_rank_to_collapse(%arg0: tensor<1x1x1x1xf32>) -> tensor<1x1x1xf32> {
    %collapsed = tensor.collapse_shape %arg0 [] : tensor<1x1x1x1xf32> into tensor<f32>
    %expanded = tensor.expand_shape %collapsed [] output_shape [1, 1, 1] : tensor<f32> into tensor<1x1x1xf32>
    return %expanded : tensor<1x1x1xf32>
  }
}

// -----
module {
  func.func @compose_expand_of_collapse_static(%arg0: tensor<4x32x10x64x2xf16>) -> tensor<4x32x10x128xf16> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1], [2], [3, 4]] : tensor<4x32x10x64x2xf16> into tensor<128x10x128xf16>
    %expanded = tensor.expand_shape %collapsed [[0, 1], [2], [3]] output_shape [4, 32, 10, 128] : tensor<128x10x128xf16> into tensor<4x32x10x128xf16>
    return %expanded : tensor<4x32x10x128xf16>
  }
}

// -----
module {
  func.func @compose_expand_of_collapse_dynamic(%arg0: tensor<4x?x10x64x2xf16>, %arg1: index) -> tensor<4x?x10x128xf16> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1], [2], [3, 4]] : tensor<4x?x10x64x2xf16> into tensor<?x10x128xf16>
    %expanded = tensor.expand_shape %collapsed [[0, 1], [2], [3]] output_shape [4, %arg1, 10, 128] : tensor<?x10x128xf16> into tensor<4x?x10x128xf16>
    return %expanded : tensor<4x?x10x128xf16>
  }
}

// -----
module {
  func.func @no_compose_collapse_of_expand_dynamic(%arg0: tensor<?x8x128x?xf16>, %arg1: index) -> tensor<?x128x?xf16> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1, 2, 3]] : tensor<?x8x128x?xf16> into tensor<?xf16>
    %expanded = tensor.expand_shape %collapsed [[0, 1, 2]] output_shape [%arg1, 8, %arg1] : tensor<?xf16> into tensor<?x128x?xf16>
    return %expanded : tensor<?x128x?xf16>
  }
}

// -----
module {
  func.func @zero_rank_reshape_multi(%arg0: tensor<f32>) -> tensor<f32> {
    %expanded = tensor.expand_shape %arg0 [] output_shape [1] : tensor<f32> into tensor<1xf32>
    %expanded_0 = tensor.expand_shape %expanded [[0, 1]] output_shape [1, 1] : tensor<1xf32> into tensor<1x1xf32>
    %collapsed = tensor.collapse_shape %expanded_0 [] : tensor<1x1xf32> into tensor<f32>
    return %collapsed : tensor<f32>
  }
}

// -----
module {
  func.func @compose_collapse_of_collapse(%arg0: tensor<?x?x?x?x?xf32>) -> tensor<?x?xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1], [2], [3, 4]] : tensor<?x?x?x?x?xf32> into tensor<?x?x?xf32>
    %collapsed_0 = tensor.collapse_shape %collapsed [[0, 1], [2]] : tensor<?x?x?xf32> into tensor<?x?xf32>
    return %collapsed_0 : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @compose_collapse_of_collapse_zero_dim(%arg0: tensor<1x1x1xf32>) -> tensor<f32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1, 2]] : tensor<1x1x1xf32> into tensor<1xf32>
    %collapsed_0 = tensor.collapse_shape %collapsed [] : tensor<1xf32> into tensor<f32>
    return %collapsed_0 : tensor<f32>
  }
}

// -----
module {
  func.func @fold_collapse_of_expand_1D(%arg0: tensor<4x512xf32>) -> tensor<2048xf32> {
    %expanded = tensor.expand_shape %arg0 [[0, 1, 2], [3]] output_shape [1, 4, 1, 512] : tensor<4x512xf32> into tensor<1x4x1x512xf32>
    %collapsed = tensor.collapse_shape %expanded [[0, 1, 2, 3]] : tensor<1x4x1x512xf32> into tensor<2048xf32>
    return %collapsed : tensor<2048xf32>
  }
}

// -----
module {
  func.func @fold_collapse_of_expand_unit_dims(%arg0: tensor<2048x1x1xf32>) -> tensor<4x512x1x1xf32> {
    %expanded = tensor.expand_shape %arg0 [[0, 1, 2, 3], [4], [5]] output_shape [1, 4, 1, 512, 1, 1] : tensor<2048x1x1xf32> into tensor<1x4x1x512x1x1xf32>
    %collapsed = tensor.collapse_shape %expanded [[0, 1, 2], [3], [4], [5]] : tensor<1x4x1x512x1x1xf32> into tensor<4x512x1x1xf32>
    return %collapsed : tensor<4x512x1x1xf32>
  }
}

// -----
module {
  func.func @compose_collapse_of_expand_unit_dims(%arg0: tensor<2048x1x2048xf32>) -> tensor<4x512x1x512x4xf32> {
    %expanded = tensor.expand_shape %arg0 [[0, 1, 2, 3, 4], [5], [6, 7, 8]] output_shape [1, 4, 1, 512, 1, 1, 512, 1, 4] : tensor<2048x1x2048xf32> into tensor<1x4x1x512x1x1x512x1x4xf32>
    %collapsed = tensor.collapse_shape %expanded [[0, 1, 2], [3, 4], [5], [6, 7], [8]] : tensor<1x4x1x512x1x1x512x1x4xf32> into tensor<4x512x1x512x4xf32>
    return %collapsed : tensor<4x512x1x512x4xf32>
  }
}

// -----
module {
  func.func @compose_collapse_of_expand_trailing_unit_dims(%arg0: tensor<2xf32>) -> tensor<2x1xf32> {
    %expanded = tensor.expand_shape %arg0 [[0, 1, 2]] output_shape [2, 1, 1] : tensor<2xf32> into tensor<2x1x1xf32>
    %collapsed = tensor.collapse_shape %expanded [[0], [1, 2]] : tensor<2x1x1xf32> into tensor<2x1xf32>
    return %collapsed : tensor<2x1xf32>
  }
}

// -----
module {
  func.func @compose_collapse_of_collapse_unit_dims_dynamic(%arg0: tensor<?x1x?x1x1x?x?x1x1xf32>) -> tensor<?x?x?x?xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0], [1, 2], [3], [4], [5], [6, 7, 8]] : tensor<?x1x?x1x1x?x?x1x1xf32> into tensor<?x?x1x1x?x?xf32>
    %collapsed_0 = tensor.collapse_shape %collapsed [[0], [1], [2, 3, 4], [5]] : tensor<?x?x1x1x?x?xf32> into tensor<?x?x?x?xf32>
    return %collapsed_0 : tensor<?x?x?x?xf32>
  }
}

// -----
module {
  func.func @fold_collapse_of_expand_trailing_unit_dims(%arg0: tensor<2xf32>) -> tensor<2x1xf32> {
    %expanded = tensor.expand_shape %arg0 [[0, 1, 2]] output_shape [2, 1, 1] : tensor<2xf32> into tensor<2x1x1xf32>
    %collapsed = tensor.collapse_shape %expanded [[0], [1, 2]] : tensor<2x1x1xf32> into tensor<2x1xf32>
    return %collapsed : tensor<2x1xf32>
  }
}

// -----
module {
  func.func @fold_collapse_of_collapse_trailing_unit_dims_dynamic(%arg0: tensor<1x1x?x1x1x1xf32>) -> tensor<?xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1, 2], [3], [4], [5]] : tensor<1x1x?x1x1x1xf32> into tensor<?x1x1x1xf32>
    %collapsed_0 = tensor.collapse_shape %collapsed [[0, 1, 2, 3]] : tensor<?x1x1x1xf32> into tensor<?xf32>
    return %collapsed_0 : tensor<?xf32>
  }
}

// -----
module {
  func.func @fold_collapse_of_expand_trailing_unit_dims(%arg0: tensor<12x42x1x1xf32>) -> tensor<12x42xf32> {
    %expanded = tensor.expand_shape %arg0 [[0], [1], [2], [3, 4]] output_shape [12, 42, 1, 1, 1] : tensor<12x42x1x1xf32> into tensor<12x42x1x1x1xf32>
    %collapsed = tensor.collapse_shape %expanded [[0], [1, 2, 3, 4]] : tensor<12x42x1x1x1xf32> into tensor<12x42xf32>
    return %collapsed : tensor<12x42xf32>
  }
}

// -----
module {
  func.func @fold_collapse_of_expand_unit_dims_in_middle(%arg0: tensor<?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index) -> tensor<?x?xf32> {
    %expanded = tensor.expand_shape %arg0 [[0], [1], [2, 3]] output_shape [%arg1, %arg2, 1, %arg3] : tensor<?x?x?xf32> into tensor<?x?x1x?xf32>
    %collapsed = tensor.collapse_shape %expanded [[0], [1, 2, 3]] : tensor<?x?x1x?xf32> into tensor<?x?xf32>
    return %collapsed : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @no_fold_collapse_of_expand_incompatible(%arg0: tensor<4x6x8xf32>) -> tensor<2x6x16xf32> {
    %expanded = tensor.expand_shape %arg0 [[0, 1], [2, 3], [4]] output_shape [2, 2, 3, 2, 8] : tensor<4x6x8xf32> into tensor<2x2x3x2x8xf32>
    %collapsed = tensor.collapse_shape %expanded [[0], [1, 2], [3, 4]] : tensor<2x2x3x2x8xf32> into tensor<2x6x16xf32>
    return %collapsed : tensor<2x6x16xf32>
  }
}

// -----
module {
  func.func @no_fold_collapse_of_expand_empty_expr(%arg0: tensor<3x2x2xf32>) -> tensor<12x1xf32> {
    %expanded = tensor.expand_shape %arg0 [[0], [1], [2, 3]] output_shape [3, 2, 2, 1] : tensor<3x2x2xf32> into tensor<3x2x2x1xf32>
    %collapsed = tensor.collapse_shape %expanded [[0, 1, 2], [3]] : tensor<3x2x2x1xf32> into tensor<12x1xf32>
    return %collapsed : tensor<12x1xf32>
  }
}

// -----
module {
  func.func @reshape_splat_constant_int32() -> tensor<2x4x2xi32> {
    %cst = arith.constant dense<42> : tensor<2x8xi32>
    %expanded = tensor.expand_shape %cst [[0], [1, 2]] output_shape [2, 4, 2] : tensor<2x8xi32> into tensor<2x4x2xi32>
    return %expanded : tensor<2x4x2xi32>
  }
}

// -----
module {
  func.func @expand_shape_splat(%arg0: f32) -> tensor<2x2x2xf32> {
    %splat = tensor.splat %arg0 : tensor<2x4xf32>
    %expanded = tensor.expand_shape %splat [[0], [1, 2]] output_shape [2, 2, 2] : tensor<2x4xf32> into tensor<2x2x2xf32>
    return %expanded : tensor<2x2x2xf32>
  }
}

// -----
module {
  func.func @expand_shape_splat_dynamic_no_fold(%arg0: f32, %arg1: index, %arg2: index) -> tensor<2x2x?xf32> {
    %splat = tensor.splat %arg0[%arg1] : tensor<2x?xf32>
    %expanded = tensor.expand_shape %splat [[0], [1, 2]] output_shape [2, 2, %arg2] : tensor<2x?xf32> into tensor<2x2x?xf32>
    return %expanded : tensor<2x2x?xf32>
  }
}

// -----
module {
  func.func @collapse_shape_splat(%arg0: f32) -> tensor<2x4xf32> {
    %splat = tensor.splat %arg0 : tensor<2x2x2xf32>
    %collapsed = tensor.collapse_shape %splat [[0], [1, 2]] : tensor<2x2x2xf32> into tensor<2x4xf32>
    return %collapsed : tensor<2x4xf32>
  }
}

// -----
module {
  func.func @collapse_shape_splat_dynamic_no_fold(%arg0: f32, %arg1: index) -> tensor<2x?xf32> {
    %splat = tensor.splat %arg0[%arg1] : tensor<2x2x?xf32>
    %collapsed = tensor.collapse_shape %splat [[0], [1, 2]] : tensor<2x2x?xf32> into tensor<2x?xf32>
    return %collapsed : tensor<2x?xf32>
  }
}

// -----
module {
  func.func @reshape_splat_constant_int16() -> tensor<2x4x2xi16> {
    %cst = arith.constant dense<42> : tensor<2x8xi16>
    %expanded = tensor.expand_shape %cst [[0], [1, 2]] output_shape [2, 4, 2] : tensor<2x8xi16> into tensor<2x4x2xi16>
    return %expanded : tensor<2x4x2xi16>
  }
}

// -----
module {
  func.func @reshape_splat_constant_float32() -> tensor<2x4x2xf32> {
    %cst = arith.constant dense<4.200000e+01> : tensor<2x8xf32>
    %expanded = tensor.expand_shape %cst [[0], [1, 2]] output_shape [2, 4, 2] : tensor<2x8xf32> into tensor<2x4x2xf32>
    return %expanded : tensor<2x4x2xf32>
  }
}

// -----
module {
  func.func @reshape_splat_constant_float64() -> tensor<2x4x2xf64> {
    %cst = arith.constant dense<4.200000e+01> : tensor<2x8xf64>
    %expanded = tensor.expand_shape %cst [[0], [1, 2]] output_shape [2, 4, 2] : tensor<2x8xf64> into tensor<2x4x2xf64>
    return %expanded : tensor<2x4x2xf64>
  }
}

// -----
module {
  func.func @fold_rank() -> index {
    %cst = arith.constant dense<[[[1, -2, 1, 36]], [[0, 2, -1, 64]]]> : tensor<2x1x4xi32>
    %rank = tensor.rank %cst : tensor<2x1x4xi32>
    return %rank : index
  }
}

// -----
module {
  func.func @pad_same_static_shape(%arg0: tensor<5x6xf32>, %arg1: index) -> tensor<5x6xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %padded = tensor.pad %arg0 low[%arg1, 0] high[0, %arg1] {
    ^bb0(%arg2: index, %arg3: index):
      tensor.yield %cst : f32
    } : tensor<5x6xf32> to tensor<5x6xf32>
    return %padded : tensor<5x6xf32>
  }
}

// -----
module {
  func.func @pad_fold_static(%arg0: tensor<?x64x?x?xf32>) -> tensor<?x?x?x?xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %c4 = arith.constant 4 : index
    %padded = tensor.pad %arg0 low[0, %c4, 1, 1] high[0, %c4, 1, 1] {
    ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: index):
      tensor.yield %cst : f32
    } : tensor<?x64x?x?xf32> to tensor<?x?x?x?xf32>
    return %padded : tensor<?x?x?x?xf32>
  }
}

// -----
module {
  func.func @pad_nofold_same_static_shape(%arg0: tensor<5x6xf32>, %arg1: index) -> tensor<5x6xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %padded = tensor.pad %arg0 nofold low[%arg1, 0] high[0, %arg1] {
    ^bb0(%arg2: index, %arg3: index):
      tensor.yield %cst : f32
    } : tensor<5x6xf32> to tensor<5x6xf32>
    return %padded : tensor<5x6xf32>
  }
}

// -----
module {
  func.func @pad_after_cast_different_shape(%arg0: tensor<?x64x?x?xf32>) -> tensor<?x?x?x?xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %cast = tensor.cast %arg0 : tensor<?x64x?x?xf32> to tensor<?x?x?x?xf32>
    %padded = tensor.pad %cast low[0, 0, 1, 1] high[0, 0, 1, 1] {
    ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: index):
      tensor.yield %cst : f32
    } : tensor<?x?x?x?xf32> to tensor<?x?x?x?xf32>
    return %padded : tensor<?x?x?x?xf32>
  }
}

// -----
module {
  func.func @pad_after_cast_same_shape(%arg0: tensor<?x64x?x?xf32>, %arg1: index) -> tensor<?x?x?x?xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %cast = tensor.cast %arg0 : tensor<?x64x?x?xf32> to tensor<?x?x?x?xf32>
    %padded = tensor.pad %cast low[0, %arg1, 1, 1] high[0, %arg1, 1, 1] {
    ^bb0(%arg2: index, %arg3: index, %arg4: index, %arg5: index):
      tensor.yield %cst : f32
    } : tensor<?x?x?x?xf32> to tensor<?x?x?x?xf32>
    return %padded : tensor<?x?x?x?xf32>
  }
}

// -----
module {
  func.func @pad_of_cast(%arg0: tensor<8x?xf32>, %arg1: index) -> tensor<8x32xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %cast = tensor.cast %arg0 : tensor<8x?xf32> to tensor<?x?xf32>
    %padded = tensor.pad %cast low[%c0, %c0] high[%c0, %arg1] {
    ^bb0(%arg2: index, %arg3: index):
      tensor.yield %cst : f32
    } : tensor<?x?xf32> to tensor<8x32xf32>
    return %padded : tensor<8x32xf32>
  }
}

// -----
module {
  func.func @cast_of_pad_more_static(%arg0: tensor<?x?xf32>, %arg1: index) -> tensor<32x32xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %padded = tensor.pad %arg0 low[%arg1, %arg1] high[0, 0] {
    ^bb0(%arg2: index, %arg3: index):
      tensor.yield %cst : f32
    } : tensor<?x?xf32> to tensor<?x?xf32>
    %cast = tensor.cast %padded : tensor<?x?xf32> to tensor<32x32xf32>
    return %cast : tensor<32x32xf32>
  }
}

// -----
module {
  func.func @cast_of_pad_less_static(%arg0: tensor<32x?x?xf32>, %arg1: index) -> tensor<?x32x32xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %padded = tensor.pad %arg0 low[%arg1, %arg1, %arg1] high[0, 0, 0] {
    ^bb0(%arg2: index, %arg3: index, %arg4: index):
      tensor.yield %cst : f32
    } : tensor<32x?x?xf32> to tensor<32x?x?xf32>
    %cast = tensor.cast %padded : tensor<32x?x?xf32> to tensor<?x32x32xf32>
    return %cast : tensor<?x32x32xf32>
  }
}

// -----
module {
  func.func @pad_cast_fold(%arg0: tensor<4x4xf32>) -> tensor<4x4xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %cast = tensor.cast %arg0 : tensor<4x4xf32> to tensor<?x?xf32>
    %padded = tensor.pad %cast low[%c0, %c0] high[%c0, %c0] {
    ^bb0(%arg1: index, %arg2: index):
      tensor.yield %cst : f32
    } : tensor<?x?xf32> to tensor<4x4xf32>
    return %padded : tensor<4x4xf32>
  }
}

// -----
module {
  func.func @fold_pad_source_cast(%arg0: tensor<4x?xf32>) -> tensor<4x4xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %cast = tensor.cast %arg0 : tensor<4x?xf32> to tensor<?x?xf32>
    %padded = tensor.pad %cast low[0, 0] high[0, 1] {
    ^bb0(%arg1: index, %arg2: index):
      tensor.yield %cst : f32
    } : tensor<?x?xf32> to tensor<4x4xf32>
    return %padded : tensor<4x4xf32>
  }
}

// -----
module {
  func.func @pad_static_zero_cast(%arg0: tensor<?x?x?xf32>, %arg1: f32) -> tensor<2x3x4xf32> {
    %c0 = arith.constant 0 : index
    %padded = tensor.pad %arg0 low[0, %c0, 0] high[0, 0, %c0] {
    ^bb0(%arg2: index, %arg3: index, %arg4: index):
      tensor.yield %arg1 : f32
    } : tensor<?x?x?xf32> to tensor<2x3x4xf32>
    return %padded : tensor<2x3x4xf32>
  }
}

// -----
module {
  func.func @pad_nofold_static_zero(%arg0: tensor<?x?x?xf32>, %arg1: f32) -> tensor<2x3x4xf32> {
    %c0 = arith.constant 0 : index
    %padded = tensor.pad %arg0 nofold low[0, %c0, 0] high[0, 0, %c0] {
    ^bb0(%arg2: index, %arg3: index, %arg4: index):
      tensor.yield %arg1 : f32
    } : tensor<?x?x?xf32> to tensor<2x3x4xf32>
    return %padded : tensor<2x3x4xf32>
  }
}

// -----
module {
  func.func @fold_orthogonal_pad_chains(%arg0: tensor<64x64xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) -> tensor<8x4xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %extracted_slice = tensor.extract_slice %arg0[16, 0] [%arg1, 64] [1, 1] : tensor<64x64xf32> to tensor<?x64xf32>
    %padded = tensor.pad %extracted_slice low[0, 0] high[%arg3, 0] {
    ^bb0(%arg5: index, %arg6: index):
      tensor.yield %cst : f32
    } : tensor<?x64xf32> to tensor<8x64xf32>
    %extracted_slice_0 = tensor.extract_slice %padded[0, 4] [8, %arg2] [1, 1] : tensor<8x64xf32> to tensor<8x?xf32>
    %padded_1 = tensor.pad %extracted_slice_0 nofold low[0, 0] high[0, %arg4] {
    ^bb0(%arg5: index, %arg6: index):
      tensor.yield %cst : f32
    } : tensor<8x?xf32> to tensor<8x4xf32>
    return %padded_1 : tensor<8x4xf32>
  }
}

// -----
module {
  func.func @dont_fold_pad_chains(%arg0: tensor<64x64xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) -> (tensor<8x4xf32>, tensor<4x64xf32>, tensor<8x4xf32>, tensor<6x4xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %extracted_slice = tensor.extract_slice %arg0[16, 0] [%arg1, 64] [1, 1] : tensor<64x64xf32> to tensor<?x64xf32>
    %padded = tensor.pad %extracted_slice low[0, 0] high[%arg3, 0] {
    ^bb0(%arg5: index, %arg6: index):
      tensor.yield %cst : f32
    } : tensor<?x64xf32> to tensor<8x64xf32>
    %cst_0 = arith.constant 1.000000e+00 : f32
    %extracted_slice_1 = tensor.extract_slice %padded[0, 4] [8, %arg2] [1, 1] : tensor<8x64xf32> to tensor<8x?xf32>
    %padded_2 = tensor.pad %extracted_slice_1 nofold low[0, 0] high[0, %arg4] {
    ^bb0(%arg5: index, %arg6: index):
      tensor.yield %cst_0 : f32
    } : tensor<8x?xf32> to tensor<8x4xf32>
    %extracted_slice_3 = tensor.extract_slice %padded[4, 0] [%arg2, 64] [1, 1] : tensor<8x64xf32> to tensor<?x64xf32>
    %padded_4 = tensor.pad %extracted_slice_3 nofold low[0, 0] high[%arg4, 0] {
    ^bb0(%arg5: index, %arg6: index):
      tensor.yield %cst : f32
    } : tensor<?x64xf32> to tensor<4x64xf32>
    %extracted_slice_5 = tensor.extract_slice %padded[%arg1, 4] [8, %arg2] [1, 1] : tensor<8x64xf32> to tensor<8x?xf32>
    %padded_6 = tensor.pad %extracted_slice_5 nofold low[0, 0] high[0, %arg4] {
    ^bb0(%arg5: index, %arg6: index):
      tensor.yield %cst : f32
    } : tensor<8x?xf32> to tensor<8x4xf32>
    %extracted_slice_7 = tensor.extract_slice %padded[0, 4] [6, %arg2] [1, 1] : tensor<8x64xf32> to tensor<6x?xf32>
    %padded_8 = tensor.pad %extracted_slice_7 nofold low[0, 0] high[0, %arg4] {
    ^bb0(%arg5: index, %arg6: index):
      tensor.yield %cst : f32
    } : tensor<6x?xf32> to tensor<6x4xf32>
    return %padded_2, %padded_4, %padded_6, %padded_8 : tensor<8x4xf32>, tensor<4x64xf32>, tensor<8x4xf32>, tensor<6x4xf32>
  }
}

// -----
module {
  func.func @merge_constant_padding(%arg0: tensor<2x3xf32>, %arg1: f32) -> tensor<7x8xf32> {
    %padded = tensor.pad %arg0 low[1, 1] high[1, 0] {
    ^bb0(%arg2: index, %arg3: index):
      tensor.yield %arg1 : f32
    } : tensor<2x3xf32> to tensor<4x4xf32>
    %padded_0 = tensor.pad %padded low[0, 2] high[3, 2] {
    ^bb0(%arg2: index, %arg3: index):
      tensor.yield %arg1 : f32
    } : tensor<4x4xf32> to tensor<7x8xf32>
    return %padded_0 : tensor<7x8xf32>
  }
}

// -----
module {
  func.func @merge_constant_padding_dynamic(%arg0: tensor<?x?xf32>, %arg1: index, %arg2: f32) -> tensor<?x?xf32> {
    %padded = tensor.pad %arg0 low[%arg1, 1] high[1, 0] {
    ^bb0(%arg3: index, %arg4: index):
      tensor.yield %arg2 : f32
    } : tensor<?x?xf32> to tensor<?x?xf32>
    %padded_0 = tensor.pad %padded low[0, 2] high[%arg1, 2] {
    ^bb0(%arg3: index, %arg4: index):
      tensor.yield %arg2 : f32
    } : tensor<?x?xf32> to tensor<?x?xf32>
    return %padded_0 : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @dont_merge_constant_padding_nofold(%arg0: tensor<2x3xf32>, %arg1: f32) -> tensor<7x8xf32> {
    %padded = tensor.pad %arg0 nofold low[1, 1] high[1, 0] {
    ^bb0(%arg2: index, %arg3: index):
      tensor.yield %arg1 : f32
    } : tensor<2x3xf32> to tensor<4x4xf32>
    %padded_0 = tensor.pad %padded low[0, 2] high[3, 2] {
    ^bb0(%arg2: index, %arg3: index):
      tensor.yield %arg1 : f32
    } : tensor<4x4xf32> to tensor<7x8xf32>
    return %padded_0 : tensor<7x8xf32>
  }
}

// -----
module {
  func.func @dont_merge_constant_padding_different_vals(%arg0: tensor<2x3xf32>, %arg1: f32, %arg2: f32) -> tensor<7x8xf32> {
    %padded = tensor.pad %arg0 low[1, 1] high[1, 0] {
    ^bb0(%arg3: index, %arg4: index):
      tensor.yield %arg1 : f32
    } : tensor<2x3xf32> to tensor<4x4xf32>
    %padded_0 = tensor.pad %padded low[0, 2] high[3, 2] {
    ^bb0(%arg3: index, %arg4: index):
      tensor.yield %arg2 : f32
    } : tensor<4x4xf32> to tensor<7x8xf32>
    return %padded_0 : tensor<7x8xf32>
  }
}

// -----
module {
  func.func @fold_collapse_shape_from_elements(%arg0: i32) -> tensor<i32> {
    %from_elements = tensor.from_elements %arg0 : tensor<1xi32>
    %collapsed = tensor.collapse_shape %from_elements [] : tensor<1xi32> into tensor<i32>
    return %collapsed : tensor<i32>
  }
}

// -----
module {
  func.func @fold_expand_shape_from_elements(%arg0: i32) -> tensor<1xi32> {
    %from_elements = tensor.from_elements %arg0 : tensor<i32>
    %expanded = tensor.expand_shape %from_elements [] output_shape [1] : tensor<i32> into tensor<1xi32>
    return %expanded : tensor<1xi32>
  }
}

// -----
module {
  func.func @propagate_index_cast(%arg0: tensor<1xi32>) -> index {
    %c0 = arith.constant 0 : index
    %0 = arith.index_cast %arg0 : tensor<1xi32> to tensor<1xindex>
    %extracted = tensor.extract %0[%c0] : tensor<1xindex>
    return %extracted : index
  }
}

// -----
module {
  func.func @splat_fold() -> tensor<4xf32> {
    %cst = arith.constant 1.000000e+00 : f32
    %splat = tensor.splat %cst : tensor<4xf32>
    return %splat : tensor<4xf32>
  }
}

// -----
module {
  func.func @splat_dynamic_no_fold(%arg0: index) -> tensor<4x?xf32> {
    %cst = arith.constant 1.000000e+00 : f32
    %splat = tensor.splat %cst[%arg0] : tensor<4x?xf32>
    return %splat : tensor<4x?xf32>
  }
}

// -----
module {
  func.func @cast_extract_slice(%arg0: tensor<128x512xf32>, %arg1: index, %arg2: index) -> tensor<16x512xf32> {
    %extracted_slice = tensor.extract_slice %arg0[%arg2, 0] [%arg1, 512] [1, 1] : tensor<128x512xf32> to tensor<?x512xf32>
    %cast = tensor.cast %extracted_slice : tensor<?x512xf32> to tensor<16x512xf32>
    return %cast : tensor<16x512xf32>
  }
}

// -----
module {
  func.func @cast_extract_slice_rank_reduce(%arg0: tensor<128x512xf32>, %arg1: index, %arg2: index) -> tensor<16xf32> {
    %extracted_slice = tensor.extract_slice %arg0[%arg2, 0] [%arg1, 1] [1, 1] : tensor<128x512xf32> to tensor<?xf32>
    %cast = tensor.cast %extracted_slice : tensor<?xf32> to tensor<16xf32>
    return %cast : tensor<16xf32>
  }
}

// -----
module {
  func.func @canonicalize_parallel_insert_slice_indices(%arg0: tensor<1x5xf32>, %arg1: tensor<?x?xf32>, %arg2: index) -> tensor<?x?xf32> {
    %cst = arith.constant 4.200000e+01 : f32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = scf.forall (%arg3) in (%arg2) shared_outs(%arg4 = %arg1) -> (tensor<?x?xf32>) {
      %cast = tensor.cast %arg0 : tensor<1x5xf32> to tensor<?x5xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %cast into %arg4[%arg3, %c0] [%c1, 5] [%c1, %c1] : tensor<?x5xf32> into tensor<?x?xf32>
      }
    }
    return %0 : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @fold_insert_slice_after_extract_slice(%arg0: tensor<1x2x2x4xf32>) -> tensor<1x2x2x4xf32> {
    %c0 = arith.constant 0 : index
    %extracted_slice = tensor.extract_slice %arg0[0, 0, 0, 0] [1, 1, 2, 4] [1, 1, 1, 1] : tensor<1x2x2x4xf32> to tensor<1x2x4xf32>
    %inserted_slice = tensor.insert_slice %extracted_slice into %arg0[%c0, 0, %c0, 0] [1, 1, 2, 4] [1, 1, 1, 1] : tensor<1x2x4xf32> into tensor<1x2x2x4xf32>
    return %inserted_slice : tensor<1x2x2x4xf32>
  }
}

// -----
module {
  func.func @dont_fold_mismatched_source_dst(%arg0: tensor<1x2x2x4xf32>, %arg1: tensor<1x2x2x4xf32>) -> tensor<1x2x2x4xf32> {
    %c0 = arith.constant 0 : index
    %extracted_slice = tensor.extract_slice %arg0[0, 0, 0, 0] [1, 1, 2, 4] [1, 1, 1, 1] : tensor<1x2x2x4xf32> to tensor<1x2x4xf32>
    %inserted_slice = tensor.insert_slice %extracted_slice into %arg1[%c0, 0, %c0, 0] [1, 1, 2, 4] [1, 1, 1, 1] : tensor<1x2x4xf32> into tensor<1x2x2x4xf32>
    return %inserted_slice : tensor<1x2x2x4xf32>
  }
}

// -----
module {
  func.func @dont_fold_mismatched_parameters(%arg0: tensor<1x2x2x4xf32>) -> tensor<1x2x2x4xf32> {
    %c0 = arith.constant 0 : index
    %extracted_slice = tensor.extract_slice %arg0[0, 0, 0, 0] [1, 1, 2, 4] [1, 1, 1, 1] : tensor<1x2x2x4xf32> to tensor<1x2x4xf32>
    %inserted_slice = tensor.insert_slice %extracted_slice into %arg0[%c0, 1, %c0, 0] [1, 1, 2, 4] [1, 1, 1, 1] : tensor<1x2x4xf32> into tensor<1x2x2x4xf32>
    return %inserted_slice : tensor<1x2x2x4xf32>
  }
}

// -----
module {
  func.func @empty_canonicalize() -> tensor<4x5x?xf32> {
    %c6 = arith.constant 6 : index
    %0 = tensor.empty(%c6) : tensor<4x5x?xf32>
    return %0 : tensor<4x5x?xf32>
  }
}

// -----
module {
  func.func @fold_empty_tensor_with_cast(%arg0: index) -> tensor<1x12xf32> {
    %0 = tensor.empty(%arg0) : tensor<?x12xf32>
    %cast = tensor.cast %0 : tensor<?x12xf32> to tensor<1x12xf32>
    return %cast : tensor<1x12xf32>
  }
}

// -----
module {
  func.func private @some_use(index, index)
  func.func @empty_tensor_canonicalize(%arg0: index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = tensor.empty(%arg0) : tensor<?x42xf32>
    %dim = tensor.dim %0, %c0 : tensor<?x42xf32>
    %dim_0 = tensor.dim %0, %c1 : tensor<?x42xf32>
    call @some_use(%dim, %dim_0) : (index, index) -> ()
    return
  }
}

// -----
module {
  func.func @dim_of_expand_shape(%arg0: tensor<?x?xf32>, %arg1: index, %arg2: index) -> index {
    %c2 = arith.constant 2 : index
    %expanded = tensor.expand_shape %arg0 [[0], [1, 2, 3, 4, 5]] output_shape [%arg1, 1, %arg2, 5, 1, 8] : tensor<?x?xf32> into tensor<?x1x?x5x1x8xf32>
    %dim = tensor.dim %expanded, %c2 : tensor<?x1x?x5x1x8xf32>
    return %dim : index
  }
}

// -----
module {
  func.func @dim_of_collapse_shape(%arg0: tensor<?x?x?x7x?xf32>) -> index {
    %c1 = arith.constant 1 : index
    %collapsed = tensor.collapse_shape %arg0 [[0], [1, 2, 3, 4]] : tensor<?x?x?x7x?xf32> into tensor<?x?xf32>
    %dim = tensor.dim %collapsed, %c1 : tensor<?x?xf32>
    return %dim : index
  }
}

// -----
module {
  func.func @out_of_bound_dim_of_collapse_shape(%arg0: tensor<?x?x?x7x?xf32>) -> index {
    %c5 = arith.constant 5 : index
    %collapsed = tensor.collapse_shape %arg0 [[0], [1, 2, 3, 4]] : tensor<?x?x?x7x?xf32> into tensor<?x?xf32>
    %dim = tensor.dim %collapsed, %c5 : tensor<?x?xf32>
    return %dim : index
  }
}

// -----
module {
  func.func @collapse_expand_fold_to_cast(%arg0: tensor<?xf32>, %arg1: index) -> tensor<?xf32> {
    %expanded = tensor.expand_shape %arg0 [[0, 1]] output_shape [1, %arg1] : tensor<?xf32> into tensor<1x?xf32>
    %collapsed = tensor.collapse_shape %expanded [[0, 1]] : tensor<1x?xf32> into tensor<?xf32>
    return %collapsed : tensor<?xf32>
  }
}

// -----
module {
  func.func @invalid_empty_negative_size() -> tensor<4x5x?xf32> {
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %0 = index.sub %c1, %c2
    %1 = tensor.empty(%0) : tensor<4x5x?xf32>
    return %1 : tensor<4x5x?xf32>
  }
}

// -----
module {
  func.func @invalid_slice_ops(%arg0: tensor<?xf32>, %arg1: tensor<?xf32>) -> tensor<?xf32> {
    %c-5 = arith.constant -5 : index
    %extracted_slice = tensor.extract_slice %arg0[0] [%c-5] [1] : tensor<?xf32> to tensor<?xf32>
    %inserted_slice = tensor.insert_slice %extracted_slice into %arg1[2] [%c-5] [1] : tensor<?xf32> into tensor<?xf32>
    return %inserted_slice : tensor<?xf32>
  }
}

// -----
#map = affine_map<(d0) -> (d0 mod 64 - 8)>
module {
  func.func @generate_negative_size_verifies() -> tensor<?x8xi32> {
    %c0_i32 = arith.constant 0 : i32
    %c0 = arith.constant 0 : index
    %0 = affine.max #map(%c0)
    %generated = tensor.generate %0 {
    ^bb0(%arg0: index, %arg1: index):
      tensor.yield %c0_i32 : i32
    } : tensor<?x8xi32>
    return %generated : tensor<?x8xi32>
  }
}

// -----
module {
  func.func @dim_of_reshape(%arg0: tensor<*xf32>, %arg1: tensor<?xindex>) -> index {
    %c3 = arith.constant 3 : index
    %reshape = tensor.reshape %arg0(%arg1) : (tensor<*xf32>, tensor<?xindex>) -> tensor<*xf32>
    %inserted = tensor.insert %c3 into %arg1[%c3] : tensor<?xindex>
    %dim = tensor.dim %reshape, %c3 : tensor<*xf32>
    return %dim : index
  }
}

// -----
module {
  func.func @dim_of_reshape_i32(%arg0: tensor<*xf32>, %arg1: tensor<?xi32>) -> index {
    %c3 = arith.constant 3 : index
    %reshape = tensor.reshape %arg0(%arg1) : (tensor<*xf32>, tensor<?xi32>) -> tensor<*xf32>
    %dim = tensor.dim %reshape, %c3 : tensor<*xf32>
    return %dim : index
  }
}

// -----
module {
  func.func @dim_of_reshape_for(%arg0: tensor<*xf32>, %arg1: tensor<?xindex>) -> index {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %reshape = tensor.reshape %arg0(%arg1) : (tensor<*xf32>, tensor<?xindex>) -> tensor<*xf32>
    %0 = scf.for %arg2 = %c0 to %c4 step %c1 iter_args(%arg3 = %c1) -> (index) {
      %dim = tensor.dim %reshape, %arg2 : tensor<*xf32>
      %1 = arith.muli %arg3, %dim : index
      scf.yield %1 : index
    }
    return %0 : index
  }
}

// -----
module {
  func.func @dim_of_reshape_undominated(%arg0: tensor<*xf32>, %arg1: tensor<?xindex>, %arg2: index) -> index {
    %c4 = arith.constant 4 : index
    %reshape = tensor.reshape %arg0(%arg1) : (tensor<*xf32>, tensor<?xindex>) -> tensor<*xf32>
    %0 = arith.muli %arg2, %c4 : index
    %dim = tensor.dim %reshape, %0 : tensor<*xf32>
    return %dim : index
  }
}

// -----
module {
  func.func @reshape_fold_2d(%arg0: tensor<?x?xi32>) -> tensor<?x?xi32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xi32>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?xi32>
    %from_elements = tensor.from_elements %dim, %dim_0 : tensor<2xindex>
    %reshape = tensor.reshape %arg0(%from_elements) : (tensor<?x?xi32>, tensor<2xindex>) -> tensor<?x?xi32>
    return %reshape : tensor<?x?xi32>
  }
}

// -----
module {
  func.func @reshape_nofold_2d(%arg0: tensor<?x?xi32>) -> tensor<?x?xi32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xi32>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?xi32>
    %from_elements = tensor.from_elements %dim_0, %dim : tensor<2xindex>
    %reshape = tensor.reshape %arg0(%from_elements) : (tensor<?x?xi32>, tensor<2xindex>) -> tensor<?x?xi32>
    return %reshape : tensor<?x?xi32>
  }
}

// -----
module {
  func.func @reshape_nofold_2d_ins(%arg0: tensor<?x?xi32>, %arg1: index, %arg2: index) -> tensor<?x?xi32> {
    %from_elements = tensor.from_elements %arg1, %arg2 : tensor<2xindex>
    %reshape = tensor.reshape %arg0(%from_elements) : (tensor<?x?xi32>, tensor<2xindex>) -> tensor<?x?xi32>
    return %reshape : tensor<?x?xi32>
  }
}

// -----
module {
  func.func @reshape_fold_3d_cst(%arg0: tensor<5x?x?xi32>) -> tensor<5x?x?xi32> {
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c5 = arith.constant 5 : index
    %dim = tensor.dim %arg0, %c1 : tensor<5x?x?xi32>
    %dim_0 = tensor.dim %arg0, %c2 : tensor<5x?x?xi32>
    %from_elements = tensor.from_elements %c5, %dim, %dim_0 : tensor<3xindex>
    %reshape = tensor.reshape %arg0(%from_elements) : (tensor<5x?x?xi32>, tensor<3xindex>) -> tensor<5x?x?xi32>
    return %reshape : tensor<5x?x?xi32>
  }
}

// -----
module {
  func.func @dim_out_of_bounds() -> vector<7xi32> {
    %c1 = arith.constant 1 : index
    %idx28 = index.constant 28
    %c29 = arith.constant 29 : index
    %0 = bufferization.alloc_tensor(%c29) : tensor<?xi16>
    %dim = tensor.dim %0, %idx28 : tensor<?xi16>
    %alloc = memref.alloc(%c29) : memref<?x26x2xi32>
    %1 = affine.vector_load %alloc[%c1, %c1, %dim] : memref<?x26x2xi32>, vector<7xi32>
    return %1 : vector<7xi32>
  }
}

// -----
module {
  func.func @fold_cast_multiple_results(%arg0: tensor<2x2xf32>, %arg1: tensor<2x2xf32>) -> index {
    %cast = tensor.cast %arg0 : tensor<2x2xf32> to tensor<?x2xf32>
    %cast_0 = tensor.cast %arg1 : tensor<2x2xf32> to tensor<?x2xf32>
    %0:2 = test.destination_style_op ins(%cast : tensor<?x2xf32>) outs(%cast_0 : tensor<?x2xf32>) -> tensor<?x2xf32>, index
    return %0#1 : index
  }
}

// -----
module {
  func.func @fold_expand_of_cast(%arg0: tensor<10x10xf32>) -> tensor<10x1x10xf32> {
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    %cast = tensor.cast %arg0 : tensor<10x10xf32> to tensor<?x?xf32>
    %expanded = tensor.expand_shape %cast [[0, 1], [2]] output_shape [%c10, %c1, %c10] : tensor<?x?xf32> into tensor<?x?x?xf32>
    %cast_0 = tensor.cast %expanded : tensor<?x?x?xf32> to tensor<10x1x10xf32>
    return %cast_0 : tensor<10x1x10xf32>
  }
}

// -----
module {
  func.func @sink_expand_of_cast(%arg0: tensor<?x10xf32>) -> tensor<?x?x?xf32> {
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    %cast = tensor.cast %arg0 : tensor<?x10xf32> to tensor<?x?xf32>
    %expanded = tensor.expand_shape %cast [[0, 1], [2]] output_shape [%c10, %c1, %c10] : tensor<?x?xf32> into tensor<?x?x?xf32>
    return %expanded : tensor<?x?x?xf32>
  }
}

// -----
module {
  func.func @partial_sink_expand_of_cast(%arg0: tensor<10x10xf32>, %arg1: index, %arg2: index) -> tensor<?x?x?xf32> {
    %c10 = arith.constant 10 : index
    %cast = tensor.cast %arg0 : tensor<10x10xf32> to tensor<?x?xf32>
    %expanded = tensor.expand_shape %cast [[0, 1], [2]] output_shape [%arg1, %arg2, %c10] : tensor<?x?xf32> into tensor<?x?x?xf32>
    return %expanded : tensor<?x?x?xf32>
  }
}

