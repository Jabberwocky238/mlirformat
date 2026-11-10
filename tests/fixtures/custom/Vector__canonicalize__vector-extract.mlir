module {
  func.func @extract_from_insert_trailing_unit_dim(%arg0: f32, %arg1: f32) -> (vector<1xf32>, vector<1xf32>) {
    %0 = ub.poison : vector<4x1xf32>
    %1 = vector.insert %arg0, %0 [0, 0] : f32 into vector<4x1xf32>
    %2 = vector.insert %arg1, %1 [1, 0] : f32 into vector<4x1xf32>
    %3 = vector.extract %1[0] : vector<1xf32> from vector<4x1xf32>
    %4 = vector.extract %2[1] : vector<1xf32> from vector<4x1xf32>
    return %3, %4 : vector<1xf32>, vector<1xf32>
  }
}

// -----
module {
  func.func @extract_from_insert_multiple_trailing_unit_dims(%arg0: f32) -> vector<1x1xf32> {
    %0 = ub.poison : vector<4x1x1xf32>
    %1 = vector.insert %arg0, %0 [2, 0, 0] : f32 into vector<4x1x1xf32>
    %2 = vector.extract %1[2] : vector<1x1xf32> from vector<4x1x1xf32>
    return %2 : vector<1x1xf32>
  }
}

// -----
module {
  func.func @negative_extract_from_insert_position_mismatch(%arg0: f32) -> vector<1xf32> {
    %0 = ub.poison : vector<4x1xf32>
    %1 = vector.insert %arg0, %0 [1, 0] : f32 into vector<4x1xf32>
    %2 = vector.extract %1[0] : vector<1xf32> from vector<4x1xf32>
    return %2 : vector<1xf32>
  }
}

// -----
module {
  func.func @negative_extract_from_insert_non_unit_trailing_dim(%arg0: f32) -> vector<4xf32> {
    %0 = ub.poison : vector<3x4xf32>
    %1 = vector.insert %arg0, %0 [1, 2] : f32 into vector<3x4xf32>
    %2 = vector.extract %1[1] : vector<4xf32> from vector<3x4xf32>
    return %2 : vector<4xf32>
  }
}

// -----
module {
  func.func @negative_extract_from_insert_dynamic_position(%arg0: f32, %arg1: index) -> vector<1xf32> {
    %0 = ub.poison : vector<4x1xf32>
    %1 = vector.insert %arg0, %0 [2, 0] : f32 into vector<4x1xf32>
    %2 = vector.extract %1[%arg1] : vector<1xf32> from vector<4x1xf32>
    return %2 : vector<1xf32>
  }
}

// -----
module {
  func.func @negative_insert_dynamic_position_not_folded(%arg0: f32, %arg1: index) -> vector<1xf32> {
    %0 = ub.poison : vector<4x1xf32>
    %1 = vector.insert %arg0, %0 [%arg1, 0] : f32 into vector<4x1xf32>
    %2 = vector.extract %1[2] : vector<1xf32> from vector<4x1xf32>
    return %2 : vector<1xf32>
  }
}

// -----
module {
  func.func @extract_from_insert_exact_match(%arg0: f32) -> f32 {
    %0 = ub.poison : vector<4x1xf32>
    %1 = vector.insert %arg0, %0 [2, 0] : f32 into vector<4x1xf32>
    %2 = vector.extract %1[2, 0] : f32 from vector<4x1xf32>
    return %2 : f32
  }
}

// -----
module {
  func.func @extract_from_insert_vector_to_vector_broadcast(%arg0: vector<1xf32>) -> vector<1x1xf32> {
    %0 = ub.poison : vector<16x1x1xf32>
    %1 = vector.insert %arg0, %0 [0, 0] : vector<1xf32> into vector<16x1x1xf32>
    %2 = vector.extract %1[0] : vector<1x1xf32> from vector<16x1x1xf32>
    return %2 : vector<1x1xf32>
  }
}

