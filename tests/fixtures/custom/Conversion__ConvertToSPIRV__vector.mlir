module {
  func.func @extract(%arg0: vector<2xf32>) -> (vector<1xf32>, f32) {
    %0 = vector.extract %arg0[0] : vector<1xf32> from vector<2xf32>
    %1 = vector.extract %arg0[1] : f32 from vector<2xf32>
    return %0, %1 : vector<1xf32>, f32
  }
}

// -----
module {
  func.func @extract_size1_vector(%arg0: vector<1xf32>) -> f32 {
    %0 = vector.extract %arg0[0] : f32 from vector<1xf32>
    return %0 : f32
  }
}

// -----
module {
  func.func @insert(%arg0: vector<4xf32>, %arg1: f32) -> vector<4xf32> {
    %0 = vector.insert %arg1, %arg0 [2] : f32 into vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @insert_index_vector(%arg0: vector<4xindex>, %arg1: index) -> vector<4xindex> {
    %0 = vector.insert %arg1, %arg0 [2] : index into vector<4xindex>
    return %0 : vector<4xindex>
  }
}

// -----
module {
  func.func @insert_size1_vector(%arg0: vector<1xf32>, %arg1: f32) -> vector<1xf32> {
    %0 = vector.insert %arg1, %arg0 [0] : f32 into vector<1xf32>
    return %0 : vector<1xf32>
  }
}

// -----
module {
  func.func @insert_size1_vector(%arg0: vector<1xf32>, %arg1: vector<3xf32>) -> vector<3xf32> {
    %0 = vector.insert_strided_slice %arg0, %arg1 {offsets = [2], strides = [1]} : vector<1xf32> into vector<3xf32>
    return %0 : vector<3xf32>
  }
}

// -----
module {
  func.func @fma(%arg0: vector<4xf32>, %arg1: vector<4xf32>, %arg2: vector<4xf32>) -> vector<4xf32> {
    %0 = vector.fma %arg0, %arg1, %arg2 : vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @fma_size1_vector(%arg0: vector<1xf32>, %arg1: vector<1xf32>, %arg2: vector<1xf32>) -> vector<1xf32> {
    %0 = vector.fma %arg0, %arg1, %arg2 : vector<1xf32>
    return %0 : vector<1xf32>
  }
}

// -----
module {
  func.func @splat(%arg0: f32) -> vector<4xf32> {
    %0 = vector.broadcast %arg0 : f32 to vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @splat_size1_vector(%arg0: f32) -> vector<1xf32> {
    %0 = vector.broadcast %arg0 : f32 to vector<1xf32>
    return %0 : vector<1xf32>
  }
}

// -----
module {
  func.func @scalar_broadcast(%arg0: f32) -> vector<4xf32> {
    %0 = vector.broadcast %arg0 : f32 to vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @scalar_broadcast_size1_vector(%arg0: f32) -> vector<1xf32> {
    %0 = vector.broadcast %arg0 : f32 to vector<1xf32>
    return %0 : vector<1xf32>
  }
}

// -----
module {
  func.func @shuffle(%arg0: vector<1xf32>, %arg1: vector<1xf32>) -> vector<4xf32> {
    %0 = vector.shuffle %arg0, %arg1 [0, 1, 1, 0] : vector<1xf32>, vector<1xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @shuffle(%arg0: vector<3xf32>, %arg1: vector<3xf32>) -> vector<4xf32> {
    %0 = vector.shuffle %arg0, %arg1 [3, 2, 5, 1] : vector<3xf32>, vector<3xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @shuffle(%arg0: vector<1xi32>, %arg1: vector<3xi32>) -> vector<3xi32> {
    %0 = vector.shuffle %arg0, %arg1 [0, 2, 3] : vector<1xi32>, vector<3xi32>
    return %0 : vector<3xi32>
  }
}

// -----
module {
  func.func @shuffle(%arg0: vector<1xi32>, %arg1: vector<1xi32>) -> vector<2xi32> {
    %0 = vector.shuffle %arg0, %arg1 [0, 1] : vector<1xi32>, vector<1xi32>
    return %0 : vector<2xi32>
  }
}

// -----
module {
  func.func @interleave(%arg0: vector<2xf32>, %arg1: vector<2xf32>) -> vector<4xf32> {
    %0 = vector.interleave %arg0, %arg1 : vector<2xf32> -> vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @interleave_size1(%arg0: vector<1xf32>, %arg1: vector<1xf32>) -> vector<2xf32> {
    %0 = vector.interleave %arg0, %arg1 : vector<1xf32> -> vector<2xf32>
    return %0 : vector<2xf32>
  }
}

// -----
module {
  func.func @reduction_add(%arg0: vector<4xi32>) -> i32 {
    %0 = vector.reduction <add>, %arg0 : vector<4xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduction_addf_one_elem(%arg0: vector<1xf32>) -> f32 {
    %0 = vector.reduction <add>, %arg0 : vector<1xf32> into f32
    return %0 : f32
  }
}

// -----
module {
  func.func @reduction_addf_one_elem_acc(%arg0: vector<1xf32>, %arg1: f32) -> f32 {
    %0 = vector.reduction <add>, %arg0, %arg1 : vector<1xf32> into f32
    return %0 : f32
  }
}

// -----
module {
  func.func @reduction_mul(%arg0: vector<3xf32>, %arg1: f32) -> f32 {
    %0 = vector.reduction <mul>, %arg0, %arg1 : vector<3xf32> into f32
    return %0 : f32
  }
}

// -----
module {
  func.func @reduction_maximumf(%arg0: vector<3xf32>, %arg1: f32) -> f32 {
    %0 = vector.reduction <maximumf>, %arg0, %arg1 : vector<3xf32> into f32
    return %0 : f32
  }
}

// -----
module {
  func.func @reduction_minimumf(%arg0: vector<3xf32>, %arg1: f32) -> f32 {
    %0 = vector.reduction <minimumf>, %arg0, %arg1 : vector<3xf32> into f32
    return %0 : f32
  }
}

// -----
module {
  func.func @reduction_minnumf(%arg0: vector<3xf32>, %arg1: f32) -> f32 {
    %0 = vector.reduction <minnumf>, %arg0, %arg1 : vector<3xf32> into f32
    return %0 : f32
  }
}

// -----
module {
  func.func @reduction_maxnumf(%arg0: vector<3xf32>, %arg1: f32) -> f32 {
    %0 = vector.reduction <maxnumf>, %arg0, %arg1 : vector<3xf32> into f32
    return %0 : f32
  }
}

// -----
module {
  func.func @reduction_maxsi(%arg0: vector<3xi32>, %arg1: i32) -> i32 {
    %0 = vector.reduction <maxsi>, %arg0, %arg1 : vector<3xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduction_minsi(%arg0: vector<3xi32>, %arg1: i32) -> i32 {
    %0 = vector.reduction <minsi>, %arg0, %arg1 : vector<3xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduction_maxui(%arg0: vector<3xi32>, %arg1: i32) -> i32 {
    %0 = vector.reduction <maxui>, %arg0, %arg1 : vector<3xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @reduction_minui(%arg0: vector<3xi32>, %arg1: i32) -> i32 {
    %0 = vector.reduction <minui>, %arg0, %arg1 : vector<3xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @shape_cast_same_type(%arg0: vector<2xf32>) -> vector<2xf32> {
    %0 = vector.shape_cast %arg0 : vector<2xf32> to vector<2xf32>
    return %arg0 : vector<2xf32>
  }
}

// -----
module {
  func.func @shape_cast_size1_vector(%arg0: vector<f32>) -> vector<1xf32> {
    %0 = vector.shape_cast %arg0 : vector<f32> to vector<1xf32>
    return %0 : vector<1xf32>
  }
}

