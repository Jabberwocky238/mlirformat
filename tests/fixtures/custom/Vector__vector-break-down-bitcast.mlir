module {
  func.func @bitcast_f16_to_f32(%arg0: vector<8xf16>) -> vector<4xf32> {
    %0 = vector.bitcast %arg0 : vector<8xf16> to vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @bitcast_i8_to_i32(%arg0: vector<16xi8>) -> vector<4xi32> {
    %0 = vector.bitcast %arg0 : vector<16xi8> to vector<4xi32>
    return %0 : vector<4xi32>
  }
}

// -----
module {
  func.func @bitcast_scalable_negative(%arg0: vector<[8]xf16>) -> vector<[4]xf32> {
    %0 = vector.bitcast %arg0 : vector<[8]xf16> to vector<[4]xf32>
    return %0 : vector<[4]xf32>
  }
}

