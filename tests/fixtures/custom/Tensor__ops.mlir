module {
  func.func @cast(%arg0: tensor<*xf32>, %arg1: tensor<4x4xf32>, %arg2: tensor<?x?xf32>) {
    %cast = tensor.cast %arg0 : tensor<*xf32> to tensor<?x?xf32>
    %cast_0 = tensor.cast %arg1 : tensor<4x4xf32> to tensor<*xf32>
    %cast_1 = tensor.cast %arg2 : tensor<?x?xf32> to tensor<4x?xf32>
    %cast_2 = tensor.cast %cast_1 : tensor<4x?xf32> to tensor<?x?xf32>
    return
  }
}

// -----
module {
  func.func @concat(%arg0: tensor<4x7x3xf32>, %arg1: tensor<4x4x3xf32>, %arg2: tensor<?x?x?xf32>) {
    %concat = tensor.concat dim(0) %arg0 : (tensor<4x7x3xf32>) -> tensor<4x7x3xf32>
    %concat_0 = tensor.concat dim(1) %arg0, %arg1 : (tensor<4x7x3xf32>, tensor<4x4x3xf32>) -> tensor<4x11x3xf32>
    %concat_1 = tensor.concat dim(2) %arg0, %arg2 : (tensor<4x7x3xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    %concat_2 = tensor.concat dim(1) %arg2, %arg2 : (tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x10x?xf32>
    %concat_3 = tensor.concat dim(1) %arg2, %arg1, %arg0 : (tensor<?x?x?xf32>, tensor<4x4x3xf32>, tensor<4x7x3xf32>) -> tensor<4x?x3xf32>
    return
  }
}

// -----
module {
  func.func @empty(%arg0: index) -> tensor<5x?x6xf32> {
    %0 = tensor.empty(%arg0) : tensor<5x?x6xf32>
    return %0 : tensor<5x?x6xf32>
  }
}

// -----
module {
  func.func @empty_with_encoding(%arg0: index) -> tensor<5x?x6xf32, "foo"> {
    %0 = tensor.empty(%arg0) : tensor<5x?x6xf32, "foo">
    return %0 : tensor<5x?x6xf32, "foo">
  }
}

// -----
module {
  func.func @extract(%arg0: tensor<?x?x?xf32>, %arg1: index) {
    %extracted = tensor.extract %arg0[%arg1, %arg1, %arg1] : tensor<?x?x?xf32>
    return
  }
}

// -----
module {
  func.func @insert(%arg0: f32, %arg1: index, %arg2: tensor<?x?x?xf32>) {
    %inserted = tensor.insert %arg0 into %arg2[%arg1, %arg1, %arg1] : tensor<?x?x?xf32>
    return
  }
}

// -----
module {
  func.func @tensor.from_elements() {
    %c0 = arith.constant 0 : index
    %from_elements = tensor.from_elements %c0 : tensor<1xindex>
    %c1 = arith.constant 1 : index
    %from_elements_0 = tensor.from_elements %c0, %c1 : tensor<2xindex>
    %cst = arith.constant 0.000000e+00 : f32
    %from_elements_1 = tensor.from_elements %cst : tensor<1xf32>
    %from_elements_2 = tensor.from_elements  : tensor<0xindex>
    %from_elements_3 = tensor.from_elements %c0, %c1, %c0, %c1, %c0, %c1 : tensor<2x3xindex>
    %from_elements_4 = tensor.from_elements %c0 : tensor<index>
    return
  }
}

// -----
module {
  func.func @tensor.generate(%arg0: index, %arg1: index) -> tensor<?x3x?xf32> {
    %generated = tensor.generate %arg0, %arg1 {
    ^bb0(%arg2: index, %arg3: index, %arg4: index):
      %cst = arith.constant 8.000000e+00 : f32
      tensor.yield %cst : f32
    } : tensor<?x3x?xf32>
    return %generated : tensor<?x3x?xf32>
  }
}

// -----
module {
  func.func @tensor_reshape(%arg0: tensor<*xf32>, %arg1: tensor<1xi32>, %arg2: tensor<2xi32>, %arg3: tensor<?xi32>) -> tensor<*xf32> {
    %reshape = tensor.reshape %arg0(%arg1) : (tensor<*xf32>, tensor<1xi32>) -> tensor<?xf32>
    %reshape_0 = tensor.reshape %reshape(%arg2) : (tensor<?xf32>, tensor<2xi32>) -> tensor<?x?xf32>
    %reshape_1 = tensor.reshape %reshape_0(%arg3) : (tensor<?x?xf32>, tensor<?xi32>) -> tensor<*xf32>
    return %reshape_1 : tensor<*xf32>
  }
}

// -----
module {
  func.func @slice(%arg0: tensor<8x16x4xf32>, %arg1: index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %extracted_slice = tensor.extract_slice %arg0[%c0, %c0, %c0] [%arg1, %arg1, %arg1] [%c1, %c1, %c1] : tensor<8x16x4xf32> to tensor<?x?x?xf32>
    %extracted_slice_0 = tensor.extract_slice %arg0[0, 2, 0] [4, 4, 4] [1, 1, 1] : tensor<8x16x4xf32> to tensor<4x4x4xf32>
    %extracted_slice_1 = tensor.extract_slice %arg0[0, 2, 0] [4, 1, 4] [1, 1, 1] : tensor<8x16x4xf32> to tensor<4x4xf32>
    return
  }
}

// -----
module {
  func.func @insert_slice(%arg0: tensor<8x16x4xf32>, %arg1: tensor<8x?x4xf32>, %arg2: tensor<16x32x8xf32>, %arg3: tensor<4x4xf32>, %arg4: index, %arg5: index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %inserted_slice = tensor.insert_slice %arg0 into %arg2[%c0, %c0, %c0] [8, 16, 4] [%c1, %c1, %c1] : tensor<8x16x4xf32> into tensor<16x32x8xf32>
    %inserted_slice_0 = tensor.insert_slice %arg0 into %arg2[%c0, %arg4, %c0] [8, 16, 4] [%c1, 1, %c1] : tensor<8x16x4xf32> into tensor<16x32x8xf32>
    %inserted_slice_1 = tensor.insert_slice %arg3 into %arg0[0, 2, 0] [4, 1, 4] [1, 1, 1] : tensor<4x4xf32> into tensor<8x16x4xf32>
    %inserted_slice_2 = tensor.insert_slice %arg1 into %arg0[0, %arg4, 0] [8, %arg5, 4] [1, 1, 1] : tensor<8x?x4xf32> into tensor<8x16x4xf32>
    return
  }
}

// -----
module {
  func.func @tensor_reshape_zero_dim(%arg0: tensor<1x1xf32>, %arg1: tensor<f32>) -> (tensor<f32>, tensor<1x1xf32>) {
    %collapsed = tensor.collapse_shape %arg0 [] : tensor<1x1xf32> into tensor<f32>
    %expanded = tensor.expand_shape %collapsed [] output_shape [1, 1] : tensor<f32> into tensor<1x1xf32>
    return %collapsed, %expanded : tensor<f32>, tensor<1x1xf32>
  }
}

// -----
module {
  func.func @tensor_expand_shape_dynamic_dim(%arg0: tensor<?x?xf32>, %arg1: index, %arg2: index, %arg3: index) -> tensor<5x?x?x?xf32> {
    %expanded = tensor.expand_shape %arg0 [[0, 1], [2, 3]] output_shape [5, %arg1, %arg2, %arg3] : tensor<?x?xf32> into tensor<5x?x?x?xf32>
    return %expanded : tensor<5x?x?x?xf32>
  }
}

// -----
module {
  func.func @legal_collapsing_reshape_dynamic_tensor(%arg0: tensor<?x?x?x4x?xf32>) -> tensor<?x?x?xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0], [1], [2, 3, 4]] : tensor<?x?x?x4x?xf32> into tensor<?x?x?xf32>
    return %collapsed : tensor<?x?x?xf32>
  }
}

// -----
module {
  func.func @rank(%arg0: tensor<4x4x?xf32>) {
    %rank = tensor.rank %arg0 : tensor<4x4x?xf32>
    %rank_0 = tensor.rank %arg0 : tensor<4x4x?xf32>
    return
  }
}

// -----
module {
  func.func @pad_dynamic(%arg0: tensor<1x2x2x?xf32>, %arg1: index, %arg2: index, %arg3: f32) -> tensor<6x?x?x?xf32> {
    %padded = tensor.pad %arg0 low[2, %arg1, 3, 3] high[3, 3, %arg2, 2] {
    ^bb0(%arg4: index, %arg5: index, %arg6: index, %arg7: index):
      tensor.yield %arg3 : f32
    } : tensor<1x2x2x?xf32> to tensor<6x?x?x?xf32>
    return %padded : tensor<6x?x?x?xf32>
  }
}

// -----
module {
  func.func @pad_static(%arg0: tensor<3x4xf32>, %arg1: f32) -> tensor<6x9xf32> {
    %padded = tensor.pad %arg0 low[1, 2] high[2, 3] {
    ^bb0(%arg2: index, %arg3: index):
      tensor.yield %arg1 : f32
    } : tensor<3x4xf32> to tensor<6x9xf32>
    return %padded : tensor<6x9xf32>
  }
}

// -----
module {
  func.func @pad_asymmetrical(%arg0: tensor<2x3xf32>, %arg1: index, %arg2: index, %arg3: f32) -> tensor<?x?xf32> {
    %padded = tensor.pad %arg0 low[0, 0] high[%arg1, %arg2] {
    ^bb0(%arg4: index, %arg5: index):
      tensor.yield %arg3 : f32
    } : tensor<2x3xf32> to tensor<?x?xf32>
    return %padded : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @pad_to_static_size(%arg0: tensor<?x?xf32>, %arg1: index, %arg2: index, %arg3: f32) -> tensor<2x3xf32> {
    %padded = tensor.pad %arg0 low[0, 0] high[%arg1, %arg2] {
    ^bb0(%arg4: index, %arg5: index):
      tensor.yield %arg3 : f32
    } : tensor<?x?xf32> to tensor<2x3xf32>
    return %padded : tensor<2x3xf32>
  }
}

// -----
module {
  func.func @test_splat_op(%arg0: f32, %arg1: !llvm.ptr) {
    %splat = tensor.splat %arg0 : tensor<8xf32>
    %splat_0 = tensor.splat %arg0 : tensor<4xf32>
    %splat_1 = tensor.splat %arg1 : tensor<8x!llvm.ptr>
    return
  }
  func.func @test_splat_op_dynamic(%arg0: f32, %arg1: index, %arg2: index) {
    %splat = tensor.splat %arg0[%arg1, %arg2] : tensor<?x8x?xf32>
    return
  }
}

// -----
module {
  func.func @gather_scatter(%arg0: tensor<4x5x6xf32>, %arg1: tensor<1x3x2xindex>, %arg2: tensor<1x3x2xi32>) {
    %gather = tensor.gather %arg0[%arg2] gather_dims([1, 2]) unique : (tensor<4x5x6xf32>, tensor<1x3x2xi32>) -> tensor<1x3x4x1x1xf32>
    %gather_0 = tensor.gather %arg0[%arg1] gather_dims([1, 2]) unique : (tensor<4x5x6xf32>, tensor<1x3x2xindex>) -> tensor<1x3x4xf32>
    %scatter = tensor.scatter %gather into %arg0[%arg1] scatter_dims([1, 2]) unique : (tensor<1x3x4x1x1xf32>, tensor<4x5x6xf32>, tensor<1x3x2xindex>) -> tensor<4x5x6xf32>
    %scatter_1 = tensor.scatter %gather_0 into %arg0[%arg2] scatter_dims([1, 2]) unique : (tensor<1x3x4xf32>, tensor<4x5x6xf32>, tensor<1x3x2xi32>) -> tensor<4x5x6xf32>
    return
  }
}

