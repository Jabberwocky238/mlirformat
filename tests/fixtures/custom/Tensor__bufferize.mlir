module {
  func.func @dim(%arg0: tensor<*xf32>, %arg1: index) -> index {
    %dim = tensor.dim %arg0, %arg1 : tensor<*xf32>
    return %dim : index
  }
}

// -----
module {
  func.func @rank(%arg0: tensor<*xf32>) -> index {
    %rank = tensor.rank %arg0 : tensor<*xf32>
    return %rank : index
  }
}

// -----
module {
  func.func @tensor.cast(%arg0: tensor<?xindex>) -> tensor<2xindex> {
    %cast = tensor.cast %arg0 : tensor<?xindex> to tensor<2xindex>
    return %cast : tensor<2xindex>
  }
}

// -----
module {
  func.func @tensor.cast_from_unranked(%arg0: tensor<*xf32>) -> tensor<2xf32> {
    %cast = tensor.cast %arg0 : tensor<*xf32> to tensor<2xf32>
    return %cast : tensor<2xf32>
  }
}

// -----
module {
  func.func @tensor.cast_to_unranked(%arg0: tensor<2xf32>) -> tensor<*xf32> {
    %cast = tensor.cast %arg0 : tensor<2xf32> to tensor<*xf32>
    return %cast : tensor<*xf32>
  }
}

// -----
module {
  func.func @tensor.empty() -> tensor<5xf32> {
    %0 = tensor.empty() : tensor<5xf32>
    return %0 : tensor<5xf32>
  }
}

// -----
module {
  func.func @tensor.extract(%arg0: tensor<?xf32>, %arg1: index) -> f32 {
    %extracted = tensor.extract %arg0[%arg1] : tensor<?xf32>
    return %extracted : f32
  }
}

// -----
module {
  func.func @tensor.from_elements_0d(%arg0: index) -> tensor<index> {
    %from_elements = tensor.from_elements %arg0 : tensor<index>
    return %from_elements : tensor<index>
  }
}

// -----
module {
  func.func @tensor.from_elements_1d(%arg0: index, %arg1: index) -> tensor<2xindex> {
    %from_elements = tensor.from_elements %arg0, %arg1 : tensor<2xindex>
    return %from_elements : tensor<2xindex>
  }
}

// -----
module {
  func.func @tensor.from_elements_2d(%arg0: index, %arg1: index) -> tensor<3x2xindex> {
    %from_elements = tensor.from_elements %arg0, %arg1, %arg0, %arg1, %arg0, %arg1 : tensor<3x2xindex>
    return %from_elements : tensor<3x2xindex>
  }
}

// -----
module {
  func.func @tensor.from_elements_3d(%arg0: f32) -> tensor<3x2x2xf32> {
    %cst = arith.constant 1.000000e+00 : f32
    %cst_0 = arith.constant 2.000000e+00 : f32
    %cst_1 = arith.constant 3.000000e+00 : f32
    %cst_2 = arith.constant 4.000000e+00 : f32
    %cst_3 = arith.constant 5.000000e+00 : f32
    %cst_4 = arith.constant 6.000000e+00 : f32
    %cst_5 = arith.constant 7.000000e+00 : f32
    %cst_6 = arith.constant 8.000000e+00 : f32
    %cst_7 = arith.constant 9.000000e+00 : f32
    %cst_8 = arith.constant 1.000000e+01 : f32
    %cst_9 = arith.constant 1.100000e+01 : f32
    %from_elements = tensor.from_elements %arg0, %cst, %cst_0, %cst_1, %cst_2, %cst_3, %cst_4, %cst_5, %cst_6, %cst_7, %cst_8, %cst_9 : tensor<3x2x2xf32>
    return %from_elements : tensor<3x2x2xf32>
  }
}

// -----
module {
  func.func @tensor.generate(%arg0: tensor<*xf32>, %arg1: index) -> tensor<?xindex> {
    %generated = tensor.generate %arg1 {
    ^bb0(%arg2: index):
      %dim = tensor.dim %arg0, %arg2 : tensor<*xf32>
      tensor.yield %dim : index
    } : tensor<?xindex>
    return %generated : tensor<?xindex>
  }
}

// -----
module {
  func.func @tensor.generate_static_and_dynamic(%arg0: index) -> tensor<16x?xindex> {
    %generated = tensor.generate %arg0 {
    ^bb0(%arg1: index, %arg2: index):
      %0 = arith.addi %arg1, %arg2 : index
      tensor.yield %0 : index
    } : tensor<16x?xindex>
    return %generated : tensor<16x?xindex>
  }
}

// -----
module {
  func.func @tensor.generate_unknown_ops_in_body(%arg0: index) -> tensor<?xindex> {
    %generated = tensor.generate %arg0 {
    ^bb0(%arg1: index):
      %0 = "test.source"() : () -> index
      tensor.yield %0 : index
    } : tensor<?xindex>
    return %generated : tensor<?xindex>
  }
}

// -----
module {
  func.func @tensor.extract_slice(%arg0: tensor<?x?xf32>, %arg1: index, %arg2: index) -> tensor<?x10xf32> {
    %extracted_slice = tensor.extract_slice %arg0[5, %arg2] [%arg1, 10] [1, 1] : tensor<?x?xf32> to tensor<?x10xf32>
    return %extracted_slice : tensor<?x10xf32>
  }
}

// -----
module {
  func.func @tensor.extract_slice_rank_reducing(%arg0: tensor<?x10x?xf32>, %arg1: index, %arg2: index) -> tensor<?x15xf32> {
    %extracted_slice = tensor.extract_slice %arg0[5, %arg1, 10] [%arg2, 1, 15] [1, 1, 1] : tensor<?x10x?xf32> to tensor<?x15xf32>
    return %extracted_slice : tensor<?x15xf32>
  }
}

// -----
module {
  func.func @tensor.insert_slice(%arg0: tensor<?x?xf32>, %arg1: tensor<?x10xf32>, %arg2: index, %arg3: index) -> tensor<?x?xf32> {
    %inserted_slice = tensor.insert_slice %arg1 into %arg0[%arg2, 5] [%arg3, 10] [1, 1] : tensor<?x10xf32> into tensor<?x?xf32>
    return %inserted_slice : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @tensor.insert_slice_rank_reducing_1(%arg0: tensor<?x?xf32>, %arg1: tensor<f32>, %arg2: index, %arg3: index) -> tensor<?x?xf32> {
    %inserted_slice = tensor.insert_slice %arg1 into %arg0[%arg2, %arg3] [1, 1] [1, 1] : tensor<f32> into tensor<?x?xf32>
    return %inserted_slice : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @tensor.insert_slice_rank_reducing_2(%arg0: tensor<?x?x?x?x?x?x?xf32>, %arg1: tensor<2x1x4x1x1xf32>, %arg2: index) -> tensor<?x?x?x?x?x?x?xf32> {
    %inserted_slice = tensor.insert_slice %arg1 into %arg0[%arg2, %arg2, %arg2, %arg2, %arg2, %arg2, %arg2] [1, 2, 1, 4, 1, 1, 1] [1, 1, 1, 1, 1, 1, 1] : tensor<2x1x4x1x1xf32> into tensor<?x?x?x?x?x?x?xf32>
    return %inserted_slice : tensor<?x?x?x?x?x?x?xf32>
  }
}

// -----
module {
  func.func @tensor.insert(%arg0: tensor<5xf32>, %arg1: index, %arg2: f32) -> tensor<5xf32> {
    %inserted = tensor.insert %arg2 into %arg0[%arg1] : tensor<5xf32>
    return %inserted : tensor<5xf32>
  }
}

// -----
module {
  func.func @tensor.expand_shape(%arg0: tensor<?x10xf32>, %arg1: index) -> tensor<2x?x10xf32> {
    %expanded = tensor.expand_shape %arg0 [[0, 1], [2]] output_shape [2, %arg1, 10] : tensor<?x10xf32> into tensor<2x?x10xf32>
    return %expanded : tensor<2x?x10xf32>
  }
}

// -----
module {
  func.func @tensor.expand_shape_of_slice(%arg0: tensor<?x20xf32>, %arg1: index, %arg2: index, %arg3: index) -> tensor<?x7x2x5xf32> {
    %extracted_slice = tensor.extract_slice %arg0[%arg1, 5] [%arg2, 10] [1, 1] : tensor<?x20xf32> to tensor<?x10xf32>
    %expanded = tensor.expand_shape %extracted_slice [[0, 1], [2, 3]] output_shape [%arg3, 7, 2, 5] : tensor<?x10xf32> into tensor<?x7x2x5xf32>
    return %expanded : tensor<?x7x2x5xf32>
  }
}

// -----
module {
  func.func @tensor.expand_shape_of_scalar_slice(%arg0: tensor<?xf32>, %arg1: index, %arg2: index) -> tensor<1xf32> {
    %extracted_slice = tensor.extract_slice %arg0[%arg1] [1] [1] : tensor<?xf32> to tensor<f32>
    %expanded = tensor.expand_shape %extracted_slice [] output_shape [1] : tensor<f32> into tensor<1xf32>
    return %expanded : tensor<1xf32>
  }
}

// -----
module {
  func.func @tensor.expand_shape_multiple_dynamic_indices(%arg0: tensor<?x256xf32>, %arg1: index, %arg2: index, %arg3: index) -> tensor<?x?x?x256xf32> {
    %expanded = tensor.expand_shape %arg0 [[0, 1, 2], [3]] output_shape [%arg1, %arg2, %arg3, 256] : tensor<?x256xf32> into tensor<?x?x?x256xf32>
    return %expanded : tensor<?x?x?x256xf32>
  }
}

// -----
module {
  func.func @tensor.collapse_shape(%arg0: tensor<2x?x?xf32>) -> tensor<?x?xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1], [2]] : tensor<2x?x?xf32> into tensor<?x?xf32>
    return %collapsed : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @tensor.collapse_shape_to_scalar(%arg0: tensor<1x1x1xf32>) -> tensor<f32> {
    %collapsed = tensor.collapse_shape %arg0 [] : tensor<1x1x1xf32> into tensor<f32>
    return %collapsed : tensor<f32>
  }
}

// -----
module {
  func.func @tensor.collapse_shape_of_slice(%arg0: tensor<2xi32>) -> tensor<i32> {
    %extracted_slice = tensor.extract_slice %arg0[1] [1] [1] : tensor<2xi32> to tensor<1xi32>
    %collapsed = tensor.collapse_shape %extracted_slice [] : tensor<1xi32> into tensor<i32>
    return %collapsed : tensor<i32>
  }
}

// -----
module {
  func.func @tensor.collapse_shape_of_slice2(%arg0: tensor<?x?x?x?xi64>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) -> tensor<87x63648xi64> {
    %extracted_slice = tensor.extract_slice %arg0[%arg1, %arg2, %arg3, %arg4] [87, 78, 68, 12] [1, 1, 1, 1] : tensor<?x?x?x?xi64> to tensor<87x78x68x12xi64>
    %collapsed = tensor.collapse_shape %extracted_slice [[0], [1, 2, 3]] : tensor<87x78x68x12xi64> into tensor<87x63648xi64>
    return %collapsed : tensor<87x63648xi64>
  }
}

// -----
module {
  func.func @tensor.collapse_shape_of_slice3(%arg0: tensor<1x2xf32>) -> tensor<1xf32> {
    %extracted_slice = tensor.extract_slice %arg0[0, 0] [1, 1] [1, 1] : tensor<1x2xf32> to tensor<1x1xf32>
    %collapsed = tensor.collapse_shape %extracted_slice [[0, 1]] : tensor<1x1xf32> into tensor<1xf32>
    return %collapsed : tensor<1xf32>
  }
}

// -----
module {
  func.func @tensor.collapse_shape_of_slice4(%arg0: tensor<?x2x4xf32>, %arg1: index, %arg2: index) -> tensor<8xf32> {
    %extracted_slice = tensor.extract_slice %arg0[0, 0, %arg1] [4, 2, 1] [1, 1, 1] : tensor<?x2x4xf32> to tensor<4x2x1xf32>
    %collapsed = tensor.collapse_shape %extracted_slice [[0, 1, 2]] : tensor<4x2x1xf32> into tensor<8xf32>
    return %collapsed : tensor<8xf32>
  }
}

// -----
module {
  func.func @tensor.collapse_shape_of_slice5(%arg0: tensor<2x2x2xi64>) -> tensor<4xi64> {
    %extracted_slice = tensor.extract_slice %arg0[0, 0, 0] [2, 1, 2] [1, 1, 1] : tensor<2x2x2xi64> to tensor<2x1x2xi64>
    %collapsed = tensor.collapse_shape %extracted_slice [[0, 1, 2]] : tensor<2x1x2xi64> into tensor<4xi64>
    return %collapsed : tensor<4xi64>
  }
}

// -----
module {
  func.func @tensor.reshape(%arg0: tensor<?x10xf32>) -> tensor<2x2x5xf32> {
    %c2_i64 = arith.constant 2 : i64
    %c5_i64 = arith.constant 5 : i64
    %from_elements = tensor.from_elements %c2_i64, %c2_i64, %c5_i64 : tensor<3xi64>
    %reshape = tensor.reshape %arg0(%from_elements) : (tensor<?x10xf32>, tensor<3xi64>) -> tensor<2x2x5xf32>
    return %reshape : tensor<2x2x5xf32>
  }
}

// -----
module {
  func.func @tensor.pad(%arg0: tensor<?x10xindex>, %arg1: index, %arg2: index, %arg3: index) -> tensor<?x?xindex> {
    %padded = tensor.pad %arg0 low[5, %arg1] high[%arg2, %arg3] {
    ^bb0(%arg4: index, %arg5: index):
      %0 = arith.muli %arg4, %arg5 : index
      tensor.yield %0 : index
    } : tensor<?x10xindex> to tensor<?x?xindex>
    return %padded : tensor<?x?xindex>
  }
}

// -----
module {
  func.func @tensor.splat(%arg0: f32) -> tensor<10x2x4xf32> {
    %splat = tensor.splat %arg0 : tensor<10x2x4xf32>
    return %splat : tensor<10x2x4xf32>
  }
}

// -----
module {
  func.func @tensor.splat_other(%arg0: !test.memref_element) -> tensor<10x2x4x!test.memref_element> {
    %splat = tensor.splat %arg0 : tensor<10x2x4x!test.memref_element>
    return %splat : tensor<10x2x4x!test.memref_element>
  }
}

// -----
module {
  func.func @tensor.concat(%arg0: tensor<8xf32>) -> tensor<16xf32> {
    %concat = tensor.concat dim(0) %arg0, %arg0 : (tensor<8xf32>, tensor<8xf32>) -> tensor<16xf32>
    return %concat : tensor<16xf32>
  }
}

// -----
module {
  func.func @tensor.concat_different_shapes(%arg0: tensor<8x4xf32>, %arg1: tensor<8x5xf32>) -> tensor<8x9xf32> {
    %concat = tensor.concat dim(1) %arg0, %arg1 : (tensor<8x4xf32>, tensor<8x5xf32>) -> tensor<8x9xf32>
    return %concat : tensor<8x9xf32>
  }
}

// -----
module {
  func.func @tensor.concat_dynamic(%arg0: tensor<8x?xf32>, %arg1: tensor<8x?xf32>) -> tensor<8x?xf32> {
    %concat = tensor.concat dim(1) %arg0, %arg1 : (tensor<8x?xf32>, tensor<8x?xf32>) -> tensor<8x?xf32>
    return %concat : tensor<8x?xf32>
  }
}

// -----
module {
  func.func @tensor.concat_dynamic_nonconcat_dim(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %concat = tensor.concat dim(1) %arg0, %arg1 : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    return %concat : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @tensor.concat_mixed_dynamic_static(%arg0: tensor<8x?xf32>, %arg1: tensor<8x?xf32>, %arg2: tensor<8x2xf32>) -> tensor<8x10xf32> {
    %concat = tensor.concat dim(1) %arg0, %arg1, %arg2 : (tensor<8x?xf32>, tensor<8x?xf32>, tensor<8x2xf32>) -> tensor<8x10xf32>
    return %concat : tensor<8x10xf32>
  }
}

// -----
module {
  func.func @tensor.splat_dynamic(%arg0: f32, %arg1: index, %arg2: index) -> tensor<?x3x?xf32> {
    %splat = tensor.splat %arg0[%arg1, %arg2] : tensor<?x3x?xf32>
    return %splat : tensor<?x3x?xf32>
  }
}

// -----
module {
  func.func @parallel_insert_slice_copy_before_write(%arg0: tensor<4xf32>, %arg1: tensor<4xf32>) {
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %0 = scf.forall (%arg2) in (%c4) shared_outs(%arg3 = %arg1) -> (tensor<4xf32>) {
      %extracted_slice = tensor.extract_slice %arg0[%arg2] [1] [1] : tensor<4xf32> to tensor<1xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %extracted_slice into %arg3[%arg2] [1] [1] : tensor<1xf32> into tensor<4xf32>
      }
    }
    return
  }
}

// -----
module {
}

