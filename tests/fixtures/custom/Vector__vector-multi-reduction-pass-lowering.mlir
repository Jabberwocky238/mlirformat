module {
  func.func @vector_multi_reduction(%arg0: vector<2x4xf32>, %arg1: vector<2xf32>) -> vector<2xf32> {
    %0 = vector.multi_reduction <mul>, %arg0, %arg1 [1] : vector<2x4xf32> to vector<2xf32>
    return %0 : vector<2xf32>
  }
}

// -----
module {
  func.func @vector_multi_reduction_parallel_middle(%arg0: vector<3x4x5xf32>, %arg1: vector<4xf32>) -> vector<4xf32> {
    %0 = vector.multi_reduction <add>, %arg0, %arg1 [0, 2] : vector<3x4x5xf32> to vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @vector_multi_reduction_masked(%arg0: vector<2x4xf32>, %arg1: vector<2xf32>, %arg2: vector<2x4xi1>) -> vector<2xf32> {
    %0 = vector.mask %arg2 { vector.multi_reduction <mul>, %arg0, %arg1 [1] : vector<2x4xf32> to vector<2xf32> } : vector<2x4xi1> -> vector<2xf32>
    return %0 : vector<2xf32>
  }
}

