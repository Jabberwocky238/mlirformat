module {
  func.func @broadcast_to_shape_cast(%arg0: vector<4xi8>) -> vector<1x1x4xi8> {
    %0 = vector.broadcast %arg0 : vector<4xi8> to vector<1x1x4xi8>
    return %0 : vector<1x1x4xi8>
  }
}

// -----
module {
  func.func @negative_broadcast_increased_elements_to_shape_cast(%arg0: vector<1x4xi8>) -> vector<2x3x4xi8> {
    %0 = vector.broadcast %arg0 : vector<1x4xi8> to vector<2x3x4xi8>
    return %0 : vector<2x3x4xi8>
  }
}

// -----
module {
  func.func @negative_broadcast_scalar_to_shape_cast(%arg0: i8) -> vector<1xi8> {
    %0 = vector.broadcast %arg0 : i8 to vector<1xi8>
    return %0 : vector<1xi8>
  }
}

// -----
module {
  func.func @canonicalize_broadcast_shapecast_to_shapecast(%arg0: vector<2xf32>) -> vector<1x2x1xf32> {
    %0 = vector.broadcast %arg0 : vector<2xf32> to vector<1x2xf32>
    %1 = vector.shape_cast %0 : vector<1x2xf32> to vector<1x2x1xf32>
    return %1 : vector<1x2x1xf32>
  }
}

// -----
module {
  func.func @canonicalize_broadcast_shapecast_both_possible(%arg0: vector<1xf32>) -> vector<1x1xf32> {
    %0 = vector.broadcast %arg0 : vector<1xf32> to vector<1x1x1xf32>
    %1 = vector.shape_cast %0 : vector<1x1x1xf32> to vector<1x1xf32>
    return %1 : vector<1x1xf32>
  }
}

// -----
module {
  func.func @extract_to_shape_cast(%arg0: vector<1x4xf32>) -> vector<4xf32> {
    %0 = vector.extract %arg0[0] : vector<4xf32> from vector<1x4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @negative_extract_to_shape_cast(%arg0: vector<1x4xf32>, %arg1: index) -> vector<4xf32> {
    %0 = vector.extract %arg0[%arg1] : vector<4xf32> from vector<1x4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @fold_extract_shapecast_to_shapecast(%arg0: vector<3x4xf32>) -> vector<12xf32> {
    %0 = vector.shape_cast %arg0 : vector<3x4xf32> to vector<1x12xf32>
    %1 = vector.extract %0[0] : vector<12xf32> from vector<1x12xf32>
    return %1 : vector<12xf32>
  }
}

// -----
module {
  func.func @insert_extract_to_shape_cast(%arg0: vector<1x1x4xf32>, %arg1: vector<4xf32>) -> (vector<4xf32>, vector<1x1x4xf32>) {
    %0 = vector.extract %arg0[0, 0] : vector<4xf32> from vector<1x1x4xf32>
    %1 = vector.insert %arg1, %arg0 [0, 0] : vector<4xf32> into vector<1x1x4xf32>
    return %0, %1 : vector<4xf32>, vector<1x1x4xf32>
  }
}

// -----
module {
  func.func @extract_from_broadcast(%arg0: vector<1x1x1xf32>) -> vector<1xf32> {
    %0 = vector.broadcast %arg0 : vector<1x1x1xf32> to vector<1x1x32x1xf32>
    %1 = vector.extract %0[0, 0, 31] : vector<1xf32> from vector<1x1x32x1xf32>
    return %1 : vector<1xf32>
  }
}

// -----
module {
  func.func @no_fold_bcast_mode_switch(%arg0: vector<2x1xf32>) -> vector<2x2xf32> {
    %0 = vector.broadcast %arg0 : vector<2x1xf32> to vector<2x2x1xf32>
    %1 = vector.shape_cast %0 : vector<2x2x1xf32> to vector<2x2xf32>
    return %1 : vector<2x2xf32>
  }
}

