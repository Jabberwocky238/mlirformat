module {
  func.func @test_result_bitwidth_64(%arg0: vector<2x2xf32>) -> vector<2x2xf32> {
    %cst = arith.constant dense<[[1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00]]> : vector<2x2xf32>
    %0 = math.sin %arg0 : vector<2x2xf32>
    return %cst : vector<2x2xf32>
  }
}

// -----
module {
  func.func @test_index_no_linearize(%arg0: vector<2x2xindex>, %arg1: vector<2x2xindex>) -> vector<2x2xindex> {
    %0 = arith.addi %arg0, %arg1 : vector<2x2xindex>
    return %0 : vector<2x2xindex>
  }
}

// -----
module {
  func.func @test_vector_insert(%arg0: vector<2x8x4xf32>, %arg1: vector<8x4xf32>) -> vector<2x8x4xf32> {
    %0 = vector.insert %arg1, %arg0 [0] : vector<8x4xf32> into vector<2x8x4xf32>
    return %0 : vector<2x8x4xf32>
  }
}

