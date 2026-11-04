module {
  func.func @tensor_extract_constant(%arg0: index, %arg1: index, %arg2: index) -> i32 {
    %cst = arith.constant dense<[[[1, 2, 3], [4, 5, 6]], [[7, 8, 9], [10, 11, 12]]]> : tensor<2x2x3xi32>
    %extracted = tensor.extract %cst[%arg0, %arg1, %arg2] : tensor<2x2x3xi32>
    return %extracted : i32
  }
}

// -----
module {
  func.func @test_spirv_unsupported_type_index(%arg0: index) {
    %cst = arith.constant dense<[1, 2]> : tensor<2xindex>
    %extracted = tensor.extract %cst[%arg0] : tensor<2xindex>
    return
  }
  func.func @test_spirv_unsupported_type_i128(%arg0: index) {
    %cst = arith.constant dense<[1, 2]> : tensor<2xi128>
    %extracted = tensor.extract %cst[%arg0] : tensor<2xi128>
    return
  }
}

// -----
module {
  func.func @tensor_0d() {
    %cst = arith.constant dense<1> : tensor<i32>
    return
  }
  func.func @tensor_1d() {
    %cst = arith.constant dense<[1, 2, 3]> : tensor<3xi32>
    return
  }
  func.func @tensor_2d() {
    %cst = arith.constant dense<[[1, 2, 3], [4, 5, 6]]> : tensor<2x3xi32>
    return
  }
  func.func @tensor_2d_empty() {
    %cst = arith.constant dense<> : tensor<2x0xi32>
    return
  }
  func.func @very_large_tensor() {
    %cst = arith.constant dense<1> : tensor<4294967296xi32>
    return
  }
}

