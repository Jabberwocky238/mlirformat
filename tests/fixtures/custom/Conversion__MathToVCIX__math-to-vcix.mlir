module {
  func.func @cos(%arg0: vector<[8]xf32>, %arg1: i64) -> vector<[8]xf32> {
    %0 = math.cos %arg0 : vector<[8]xf32>
    return %0 : vector<[8]xf32>
  }
}

// -----
module {
  func.func @cos_req_legalization(%arg0: vector<[32]xf32>, %arg1: i64) -> vector<[32]xf32> {
    %0 = math.cos %arg0 : vector<[32]xf32>
    return %0 : vector<[32]xf32>
  }
}

// -----
module {
  func.func @cos_fixed(%arg0: vector<8xf32>, %arg1: i64) -> vector<8xf32> {
    %0 = math.cos %arg0 : vector<8xf32>
    return %0 : vector<8xf32>
  }
}

// -----
module {
  func.func @sin(%arg0: vector<[8]xf32>, %arg1: i64) -> vector<[8]xf32> {
    %0 = math.sin %arg0 : vector<[8]xf32>
    return %0 : vector<[8]xf32>
  }
}

// -----
module {
  func.func @sin_req_legalization(%arg0: vector<[32]xf32>, %arg1: i64) -> vector<[32]xf32> {
    %0 = math.sin %arg0 : vector<[32]xf32>
    return %0 : vector<[32]xf32>
  }
}

// -----
module {
  func.func @sin_fixed(%arg0: vector<8xf32>, %arg1: i64) -> vector<8xf32> {
    %0 = math.sin %arg0 : vector<8xf32>
    return %0 : vector<8xf32>
  }
}

// -----
module {
  func.func @tan(%arg0: vector<[8]xf32>, %arg1: i64) -> vector<[8]xf32> {
    %0 = math.tan %arg0 : vector<[8]xf32>
    return %0 : vector<[8]xf32>
  }
}

// -----
module {
  func.func @tan_req_legalization(%arg0: vector<[32]xf32>, %arg1: i64) -> vector<[32]xf32> {
    %0 = math.tan %arg0 : vector<[32]xf32>
    return %0 : vector<[32]xf32>
  }
}

// -----
module {
  func.func @tan_fixed(%arg0: vector<8xf32>, %arg1: i64) -> vector<8xf32> {
    %0 = math.tan %arg0 : vector<8xf32>
    return %0 : vector<8xf32>
  }
}

// -----
module {
  func.func @log(%arg0: vector<[8]xf32>, %arg1: i64) -> vector<[8]xf32> {
    %0 = math.log %arg0 : vector<[8]xf32>
    return %0 : vector<[8]xf32>
  }
}

// -----
module {
  func.func @log_req_legalization(%arg0: vector<[32]xf32>, %arg1: i64) -> vector<[32]xf32> {
    %0 = math.log %arg0 : vector<[32]xf32>
    return %0 : vector<[32]xf32>
  }
}

// -----
module {
  func.func @log_fixed(%arg0: vector<8xf32>, %arg1: i64) -> vector<8xf32> {
    %0 = math.log %arg0 : vector<8xf32>
    return %0 : vector<8xf32>
  }
}

// -----
module {
  func.func @no_vector_type(%arg0: f32) -> f32 {
    %0 = math.cos %arg0 : f32
    return %0 : f32
  }
}

