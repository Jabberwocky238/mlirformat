module {
  func.func @two_dynamic_one_direct_shape(%arg0: tensor<?x4x?xf32>, %arg1: tensor<2x4x?xf32>) -> tensor<?x4x?xf32> {
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %0 = shape.shape_of %arg0 : tensor<?x4x?xf32> -> tensor<3xindex>
    %1 = shape.get_extent %0, %c2 : tensor<3xindex>, index -> index
    %2 = "test.abs"(%arg0) : (tensor<?x4x?xf32>) -> tensor<?x4x?xf32>
    %3 = shape.with_shape %2, %0 : tensor<?x4x?xf32>, tensor<3xindex>
    %4 = shape.value_of %3 : tensor<?x4x?xf32>
    %5 = "test.concat"(%4, %arg1) {axis = 0 : i64} : (tensor<?x4x?xf32>, tensor<2x4x?xf32>) -> tensor<?x4x?xf32>
    %6 = shape.get_extent %0, %c0 : tensor<3xindex>, index -> index
    %7 = arith.addi %6, %c2 : index
    %8 = shape.from_extents %7, %c4, %1 : index, index, index
    %9 = shape.with_shape %5, %8 : tensor<?x4x?xf32>, !shape.shape
    %10 = shape.value_of %9 : tensor<?x4x?xf32>
    return %10 : tensor<?x4x?xf32>
  }
}

// -----
module {
  func.func @two_dynamic_share_same_shape(%arg0: tensor<?x4x?xf32>, %arg1: tensor<2x4x?xf32>) -> tensor<?x4x?xf32> {
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %0 = shape.shape_of %arg0 : tensor<?x4x?xf32> -> tensor<3xindex>
    %1 = shape.get_extent %0, %c2 : tensor<3xindex>, index -> index
    %2 = "test.concat"(%arg0, %arg1) {axis = 0 : i64} : (tensor<?x4x?xf32>, tensor<2x4x?xf32>) -> tensor<?x4x?xf32>
    %3 = shape.get_extent %0, %c0 : tensor<3xindex>, index -> index
    %4 = arith.addi %3, %c2 : index
    %5 = shape.from_extents %4, %c4, %1 : index, index, index
    %6 = shape.with_shape %2, %5 : tensor<?x4x?xf32>, !shape.shape
    %7 = shape.value_of %6 : tensor<?x4x?xf32>
    %8 = "test.abs"(%7) : (tensor<?x4x?xf32>) -> tensor<?x4x?xf32>
    %9 = shape.with_shape %8, %5 : tensor<?x4x?xf32>, !shape.shape
    %10 = shape.value_of %9 : tensor<?x4x?xf32>
    return %10 : tensor<?x4x?xf32>
  }
}

// -----
module {
  func.func @internal_dynamic_shape_source_shared(%arg0: tensor<?x4xf32>) -> tensor<?xi32> {
    %0 = "test.nonzero"(%arg0) : (tensor<?x4xf32>) -> tensor<?xi32>
    %1 = shape.shape_of %0 : tensor<?xi32> -> tensor<1xindex>
    %2 = shape.with_shape %0, %1 : tensor<?xi32>, tensor<1xindex>
    %3 = shape.value_of %2 : tensor<?xi32>
    %4 = "test.abs"(%3) : (tensor<?xi32>) -> tensor<?xi32>
    %5 = shape.with_shape %4, %1 : tensor<?xi32>, tensor<1xindex>
    %6 = shape.value_of %5 : tensor<?xi32>
    %7 = "test.negate"(%6) : (tensor<?xi32>) -> tensor<?xi32>
    %8 = shape.with_shape %7, %1 : tensor<?xi32>, tensor<1xindex>
    %9 = shape.value_of %8 : tensor<?xi32>
    return %9 : tensor<?xi32>
  }
}

// -----
module {
  func.func @only_return_of_constructed_shape(%arg0: tensor<?x4xf32>, %arg1: tensor<1xindex>) -> tensor<?xi32> {
    %0 = "test.nonzero"(%arg0) : (tensor<?x4xf32>) -> tensor<?xi32>
    %1 = shape.with_shape %0, %arg1 : tensor<?xi32>, tensor<1xindex>
    %2 = shape.value_of %1 : tensor<?xi32>
    return %2 : tensor<?xi32>
  }
}

// -----
module {
  func.func @interleaved_shape_computation(%arg0: tensor<?x4x5xf32>, %arg1: tensor<?x4x5xf32>, %arg2: tensor<?x4x5xf32>) -> (tensor<?x4x5xf32>, index) {
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %c5 = arith.constant 5 : index
    %0 = shape.shape_of %arg0 : tensor<?x4x5xf32> -> tensor<3xindex>
    %1 = shape.shape_of %arg1 : tensor<?x4x5xf32> -> tensor<3xindex>
    %2 = shape.shape_of %arg2 : tensor<?x4x5xf32> -> tensor<3xindex>
    %3 = "test.concat"(%arg0, %arg1, %arg2) {axis = 0 : i64} : (tensor<?x4x5xf32>, tensor<?x4x5xf32>, tensor<?x4x5xf32>) -> tensor<?x4x5xf32>
    %4 = shape.get_extent %0, %c0 : tensor<3xindex>, index -> index
    %5 = shape.get_extent %1, %c0 : tensor<3xindex>, index -> index
    %6 = shape.get_extent %2, %c0 : tensor<3xindex>, index -> index
    %7 = arith.addi %4, %5 : index
    %8 = arith.addi %7, %6 : index
    %9 = shape.from_extents %8, %c4, %c5 : index, index, index
    %10 = shape.with_shape %3, %9 : tensor<?x4x5xf32>, !shape.shape
    %11 = shape.value_of %10 : tensor<?x4x5xf32>
    return %11, %7 : tensor<?x4x5xf32>, index
  }
}

// -----
module {
  func.func @multiple_reused(%arg0: tensor<?x4xf32>, %arg1: tensor<?x4xf32>) -> (tensor<?x4xf32>, tensor<?x4xf32>, tensor<?x4xf32>, tensor<?x4xf32>) {
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %0 = shape.shape_of %arg0 : tensor<?x4xf32> -> tensor<2xindex>
    %1 = shape.shape_of %arg1 : tensor<?x4xf32> -> tensor<2xindex>
    %2 = "test.concat"(%arg0, %arg1) {axis = 0 : i64} : (tensor<?x4xf32>, tensor<?x4xf32>) -> tensor<?x4xf32>
    %3 = "test.concat"(%arg0, %arg1) {axis = 0 : i64} : (tensor<?x4xf32>, tensor<?x4xf32>) -> tensor<?x4xf32>
    %4 = shape.get_extent %0, %c0 : tensor<2xindex>, index -> index
    %5 = shape.get_extent %1, %c0 : tensor<2xindex>, index -> index
    %6 = arith.addi %4, %5 : index
    %7 = shape.from_extents %6, %c4 : index, index
    %8 = shape.with_shape %2, %7 : tensor<?x4xf32>, !shape.shape
    %9 = shape.with_shape %3, %7 : tensor<?x4xf32>, !shape.shape
    %10 = shape.value_of %8 : tensor<?x4xf32>
    %11 = shape.value_of %9 : tensor<?x4xf32>
    %12 = "test.concat"(%arg0, %2) {axis = 0 : i64} : (tensor<?x4xf32>, tensor<?x4xf32>) -> tensor<?x4xf32>
    %13 = "test.concat"(%arg0, %3) {axis = 0 : i64} : (tensor<?x4xf32>, tensor<?x4xf32>) -> tensor<?x4xf32>
    %14 = arith.addi %6, %4 : index
    %15 = shape.from_extents %14, %c4 : index, index
    %16 = shape.with_shape %12, %15 : tensor<?x4xf32>, !shape.shape
    %17 = shape.with_shape %13, %15 : tensor<?x4xf32>, !shape.shape
    %18 = shape.value_of %16 : tensor<?x4xf32>
    %19 = shape.value_of %17 : tensor<?x4xf32>
    return %10, %11, %18, %19 : tensor<?x4xf32>, tensor<?x4xf32>, tensor<?x4xf32>, tensor<?x4xf32>
  }
  func.func @value_shape_with_shape(%arg0: !shape.value_shape, %arg1: !shape.value_shape) -> tensor<?xf32> {
    %0 = shape.shape_of %arg0 : !shape.value_shape -> !shape.shape
    %1 = shape.with_shape %arg1, %0 : !shape.value_shape, !shape.shape
    %2 = shape.value_of %1 : tensor<?xf32>
    return %2 : tensor<?xf32>
  }
}

