module {
  func.func @unknown_op() -> index {
    %0 = "test.foo"() : () -> tensor<?x?xf32>
    %1 = "test.reify_bound"(%0) <{dim = 0 : i64, type = "EQ"}> : (tensor<?x?xf32>) -> index
    return %1 : index
  }
}

// -----
module {
  func.func @cast(%arg0: tensor<10xf32>) -> index {
    %cast = tensor.cast %arg0 : tensor<10xf32> to tensor<?xf32>
    %0 = "test.reify_bound"(%cast) <{dim = 0 : i64, type = "EQ"}> : (tensor<?xf32>) -> index
    return %0 : index
  }
}

// -----
module {
  func.func @cast_unranked(%arg0: tensor<*xf32>) -> index {
    %cast = tensor.cast %arg0 : tensor<*xf32> to tensor<?xf32>
    %0 = "test.reify_bound"(%cast) <{dim = 0 : i64, type = "EQ"}> : (tensor<?xf32>) -> index
    return %0 : index
  }
}

// -----
module {
  func.func @dim(%arg0: tensor<?xf32>) -> index {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?xf32>
    %0 = "test.reify_bound"(%dim) <{type = "EQ"}> : (index) -> index
    return %0 : index
  }
}

// -----
module {
  func.func @dim_all_positive(%arg0: tensor<?xf32>, %arg1: index) {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %arg1 : tensor<?xf32>
    "test.compare"(%dim, %c0) <{cmp = "GE"}> : (index, index) -> ()
    return
  }
}

// -----
module {
  func.func @empty(%arg0: index) -> (index, index) {
    %0 = tensor.empty(%arg0) : tensor<6x?xf32>
    %1 = "test.reify_bound"(%0) <{dim = 0 : i64, type = "EQ"}> : (tensor<6x?xf32>) -> index
    %2 = "test.reify_bound"(%0) <{dim = 1 : i64, type = "EQ"}> : (tensor<6x?xf32>) -> index
    return %1, %2 : index, index
  }
}

// -----
module {
  func.func @extract_slice_dynamic(%arg0: tensor<?xf32>, %arg1: index) -> index {
    %extracted_slice = tensor.extract_slice %arg0[2] [%arg1] [1] : tensor<?xf32> to tensor<?xf32>
    %0 = "test.reify_bound"(%extracted_slice) <{dim = 0 : i64, type = "EQ"}> : (tensor<?xf32>) -> index
    return %0 : index
  }
}

// -----
module {
  func.func @extract_slice_static(%arg0: tensor<?xf32>) -> index {
    %extracted_slice = tensor.extract_slice %arg0[2] [5] [1] : tensor<?xf32> to tensor<5xf32>
    %0 = "test.reify_bound"(%extracted_slice) <{dim = 0 : i64, type = "EQ"}> : (tensor<5xf32>) -> index
    return %0 : index
  }
}

// -----
module {
  func.func @extract_slice_dynamic_constant(%arg0: tensor<?xf32>, %arg1: index) -> index {
    %extracted_slice = tensor.extract_slice %arg0[2] [%arg1] [1] : tensor<?xf32> to tensor<?xf32>
    %0 = "test.reify_bound"(%extracted_slice) <{constant, dim = 0 : i64, type = "EQ"}> : (tensor<?xf32>) -> index
    return %0 : index
  }
}

// -----
module {
  func.func @extract_slice_static_constant(%arg0: tensor<?xf32>) -> index {
    %extracted_slice = tensor.extract_slice %arg0[2] [5] [1] : tensor<?xf32> to tensor<5xf32>
    %0 = "test.reify_bound"(%extracted_slice) <{constant, dim = 0 : i64, type = "EQ"}> : (tensor<5xf32>) -> index
    return %0 : index
  }
}

// -----
module {
  func.func @extract_slice_rank_reduce(%arg0: tensor<?x?xf32>, %arg1: index) -> index {
    %extracted_slice = tensor.extract_slice %arg0[0, 2] [1, %arg1] [1, 1] : tensor<?x?xf32> to tensor<?xf32>
    %0 = "test.reify_bound"(%extracted_slice) <{dim = 0 : i64, type = "EQ"}> : (tensor<?xf32>) -> index
    return %0 : index
  }
}

// -----
module {
  func.func @insert(%arg0: tensor<?xf32>, %arg1: f32, %arg2: index) -> index {
    %inserted = tensor.insert %arg1 into %arg0[%arg2] : tensor<?xf32>
    %0 = "test.reify_bound"(%inserted) <{dim = 0 : i64, type = "EQ"}> : (tensor<?xf32>) -> index
    return %0 : index
  }
}

// -----
module {
  func.func @pad(%arg0: tensor<?x7xf32>, %arg1: index, %arg2: index) -> (index, index) {
    %cst = arith.constant 0.000000e+00 : f32
    %padded = tensor.pad %arg0 low[%arg1, 5] high[%arg1, %arg2] {
    ^bb0(%arg3: index, %arg4: index):
      tensor.yield %cst : f32
    } : tensor<?x7xf32> to tensor<?x?xf32>
    %0 = "test.reify_bound"(%padded) <{dim = 0 : i64, type = "EQ"}> : (tensor<?x?xf32>) -> index
    %1 = "test.reify_bound"(%padded) <{dim = 1 : i64, type = "EQ"}> : (tensor<?x?xf32>) -> index
    return %0, %1 : index, index
  }
}

// -----
module {
  func.func @rank(%arg0: tensor<5xf32>) -> index {
    %rank = tensor.rank %arg0 : tensor<5xf32>
    %0 = "test.reify_bound"(%rank) <{type = "EQ"}> : (index) -> index
    return %0 : index
  }
}

// -----
module {
  func.func @dynamic_dims_are_equal(%arg0: tensor<?xf32>) {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?xf32>
    %dim_0 = tensor.dim %arg0, %c0 : tensor<?xf32>
    "test.compare"(%dim, %dim_0) <{cmp = "EQ"}> : (index, index) -> ()
    return
  }
}

// -----
module {
  func.func @dynamic_dims_are_different(%arg0: tensor<?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?xf32>
    %0 = arith.addi %dim, %c1 : index
    "test.compare"(%dim, %0) <{cmp = "EQ"}> : (index, index) -> ()
    return
  }
}

// -----
module {
  func.func @dynamic_dims_are_maybe_equal_1(%arg0: tensor<?xf32>) {
    %c0 = arith.constant 0 : index
    %c5 = arith.constant 5 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?xf32>
    "test.compare"(%dim, %c5) <{cmp = "EQ"}> : (index, index) -> ()
    return
  }
}

// -----
module {
  func.func @dynamic_dims_are_maybe_equal_2(%arg0: tensor<?x?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?xf32>
    "test.compare"(%dim, %dim_0) <{cmp = "EQ"}> : (index, index) -> ()
    return
  }
}

// -----
#map = affine_map<(d0) -> (-d0 + 256)>
module {
  func.func @pad_reification(%arg0: f32, %arg1: index, %arg2: tensor<64x?x64xf32>) {
    %0 = affine.apply #map(%arg1)
    %extracted_slice = tensor.extract_slice %arg2[0, 0, 0] [1, %arg1, 64] [1, 1, 1] : tensor<64x?x64xf32> to tensor<1x?x64xf32>
    %padded = tensor.pad %extracted_slice low[0, 0, 0] high[0, %0, 0] {
    ^bb0(%arg3: index, %arg4: index, %arg5: index):
      tensor.yield %arg0 : f32
    } : tensor<1x?x64xf32> to tensor<1x?x64xf32>
    %1 = "test.reify_bound"(%padded) <{constant, dim = 1 : i64, type = "EQ"}> : (tensor<1x?x64xf32>) -> index
    return
  }
}

// -----
module {
  func.func @tensor_collapse(%arg0: index) -> (index, index) {
    %0 = tensor.empty(%arg0) : tensor<3x4x?x2xf32>
    %collapsed = tensor.collapse_shape %0 [[0, 1], [2, 3]] : tensor<3x4x?x2xf32> into tensor<12x?xf32>
    %1 = "test.reify_bound"(%collapsed) <{dim = 0 : i64, type = "EQ"}> : (tensor<12x?xf32>) -> index
    %2 = "test.reify_bound"(%collapsed) <{dim = 1 : i64, type = "EQ"}> : (tensor<12x?xf32>) -> index
    return %1, %2 : index, index
  }
}

// -----
module {
  func.func @tensor_expand(%arg0: tensor<?xf32>, %arg1: index) -> (index, index) {
    %expanded = tensor.expand_shape %arg0 [[0, 1]] output_shape [4, %arg1] : tensor<?xf32> into tensor<4x?xf32>
    %0 = "test.reify_bound"(%expanded) <{dim = 0 : i64, type = "EQ"}> : (tensor<4x?xf32>) -> index
    %1 = "test.reify_bound"(%expanded) <{dim = 1 : i64, type = "EQ"}> : (tensor<4x?xf32>) -> index
    return %0, %1 : index, index
  }
}

