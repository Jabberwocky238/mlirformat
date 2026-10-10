module {
  func.func @replace_op_with_op_of_same_type() {
    %0 = "test.foo"() {replaced} : () -> tensor<5xf32>
    %1 = "test.foo"() {replacement_0 = 0 : i64} : () -> tensor<5xf32>
    return
  }
}

// -----
module {
  func.func @replace_op_with_op_of_different_type() {
    %0 = tensor.empty() {replaced} : tensor<5xf32>
    %1 = "test.foo"() {replacement_0 = 0 : i64} : () -> tensor<5xf32>
    return
  }
}

// -----
module {
  func.func @multi_result_replacement() {
    %0:2 = "test.foo"() {replaced} : () -> (tensor<5xf32>, tensor<6xf32>)
    %1:2 = "test.foo"() {replacement_0 = 0 : i64, replacement_1 = 1 : i64} : () -> (tensor<5xf32>, tensor<6xf32>)
    return
  }
}

// -----
module {
  func.func @multi_result_replacement_with_multiple_ops() {
    %0:2 = "test.foo"() {replaced} : () -> (tensor<5xf32>, tensor<6xf32>)
    %1:2 = "test.foo"() {replacement_0 = 0 : i64} : () -> (tensor<5xf32>, tensor<6xf32>)
    %2:2 = "test.foo"() {replacement_1 = 1 : i64} : () -> (tensor<5xf32>, tensor<6xf32>)
    return
  }
}

// -----
module {
  func.func @replacement_wrapped_in_cast() {
    %0 = "test.foo"() {replaced} : () -> tensor<5xf32>
    %1 = "test.foo"() : () -> tensor<?xf32>
    %cast = tensor.cast %1 {replacement_0 = 0 : i64} : tensor<?xf32> to tensor<5xf32>
    return
  }
}

// -----
module {
  func.func @replacement_wrapped_in_chain_of_casts() {
    %0 = "test.foo"() {replaced} : () -> tensor<5xf32>
    %1 = "test.foo"() : () -> tensor<?xf32>
    %cast = tensor.cast %1 : tensor<?xf32> to tensor<5xf32>
    %cast_0 = tensor.cast %cast : tensor<5xf32> to tensor<?xf32>
    %cast_1 = tensor.cast %cast_0 {replacement_0 = 0 : i64} : tensor<?xf32> to tensor<5xf32>
    return
  }
}

// -----
module {
  func.func @cast_like_insert_slice(%arg0: tensor<1x5xf32>) {
    %0 = "test.foo"() {replaced} : () -> tensor<5xf32>
    %1 = "test.foo"() : () -> tensor<5xf32>
    %inserted_slice = tensor.insert_slice %1 into %arg0[0, 0] [1, 5] [1, 1] {replacement_0 = 0 : i64} : tensor<5xf32> into tensor<1x5xf32>
    return
  }
}

// -----
module {
  func.func @non_cast_like_insert_slice(%arg0: tensor<7xf32>) {
    %0 = "test.foo"() {replaced} : () -> tensor<5xf32>
    %1 = "test.foo"() : () -> tensor<5xf32>
    %inserted_slice = tensor.insert_slice %1 into %arg0[0] [5] [1] {replacement_0 = 0 : i64} : tensor<5xf32> into tensor<7xf32>
    return
  }
}

// -----
module {
  func.func @cast_like_insert_slice_dynamic(%arg0: tensor<1x?x1xf32>, %arg1: f32, %arg2: index) {
    %c0 = arith.constant 0 : index
    %inserted = tensor.insert %arg1 into %arg0[%c0, %arg2, %c0] {replaced} : tensor<1x?x1xf32>
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c1 : tensor<1x?x1xf32>
    %extracted_slice = tensor.extract_slice %arg0[0, 0, 0] [1, %dim, 1] [1, 1, 1] : tensor<1x?x1xf32> to tensor<?xf32>
    %inserted_0 = tensor.insert %arg1 into %extracted_slice[%c0] : tensor<?xf32>
    %dim_1 = tensor.dim %extracted_slice, %c0 : tensor<?xf32>
    %inserted_slice = tensor.insert_slice %inserted_0 into %arg0[0, 0, 0] [1, %dim_1, 1] [1, 1, 1] {replacement_0 = 0 : i64} : tensor<?xf32> into tensor<1x?x1xf32>
    return
  }
}

// -----
module {
  func.func @cast_like_extract_slice() {
    %0 = "test.foo"() {replaced} : () -> tensor<5xf32>
    %1 = "test.foo"() : () -> tensor<1x5x1x1xf32>
    %extracted_slice = tensor.extract_slice %1[0, 0, 0, 0] [1, 5, 1, 1] [1, 1, 1, 1] {replacement_0 = 0 : i64} : tensor<1x5x1x1xf32> to tensor<5xf32>
    return
  }
}

// -----
module {
  func.func @cast_like_extract_slice_dynamic() {
    %0 = "test.foo"() {replaced} : () -> tensor<?xf32>
    %1 = "test.foo"() : () -> tensor<1x?x1x1xf32>
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %1, %c1 : tensor<1x?x1x1xf32>
    %extracted_slice = tensor.extract_slice %1[0, 0, 0, 0] [1, %dim, 1, 1] [1, 1, 1, 1] {replacement_0 = 0 : i64} : tensor<1x?x1x1xf32> to tensor<?xf32>
    return
  }
}

// -----
module {
  func.func @non_cast_like_extract_slice() {
    %0 = "test.foo"() {replaced} : () -> tensor<5xf32>
    %1 = "test.foo"() : () -> tensor<1x5x1x1xf32>
    %extracted_slice = tensor.extract_slice %1[0, 0, 0, 0] [1, 3, 1, 1] [1, 1, 1, 1] {replacement_0 = 0 : i64} : tensor<1x5x1x1xf32> to tensor<3xf32>
    return
  }
}

// -----
module {
  func.func @non_cast_like_extract_slice_drop_non_unit_dim() {
    %0 = "test.foo"() {replaced} : () -> tensor<f32>
    %1 = "test.foo"() : () -> tensor<1x5x1x1xf32>
    %extracted_slice = tensor.extract_slice %1[0, 0, 0, 0] [1, 1, 1, 1] [1, 1, 1, 1] {replacement_0 = 0 : i64} : tensor<1x5x1x1xf32> to tensor<f32>
    return
  }
}

