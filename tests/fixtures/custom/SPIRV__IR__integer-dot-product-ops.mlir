module {
  func.func @sdot_scalar_i32(%arg0: i32, %arg1: i32) -> i32 {
    %0 = spirv.SDot %arg0, %arg1, <PackedVectorFormat4x8Bit> : i32 -> i32
    return %0 : i32
  }
  func.func @sdot_scalar_i64(%arg0: i32, %arg1: i32) -> i64 {
    %0 = spirv.SDot %arg0, %arg1, <PackedVectorFormat4x8Bit> : i32 -> i64
    return %0 : i64
  }
  func.func @sdot_vector_4xi8(%arg0: vector<4xi8>, %arg1: vector<4xi8>) -> i32 {
    %0 = spirv.SDot %arg0, %arg1 : vector<4xi8> -> i32
    return %0 : i32
  }
  func.func @sdot_vector_4xi16(%arg0: vector<4xi16>, %arg1: vector<4xi16>) -> i64 {
    %0 = spirv.SDot %arg0, %arg1 : vector<4xi16> -> i64
    return %0 : i64
  }
  func.func @sdot_vector_8xi8(%arg0: vector<8xi8>, %arg1: vector<8xi8>) -> i64 {
    %0 = spirv.SDot %arg0, %arg1 : vector<8xi8> -> i64
    return %0 : i64
  }
}

// -----
// -----
// -----
// -----
// -----
module {
  func.func @sudot_scalar_i32(%arg0: i32, %arg1: i32) -> i32 {
    %0 = spirv.SUDot %arg0, %arg1, <PackedVectorFormat4x8Bit> : i32 -> i32
    return %0 : i32
  }
  func.func @sudot_scalar_i64(%arg0: i32, %arg1: i32) -> i64 {
    %0 = spirv.SUDot %arg0, %arg1, <PackedVectorFormat4x8Bit> : i32 -> i64
    return %0 : i64
  }
  func.func @sudot_vector_4xi8(%arg0: vector<4xi8>, %arg1: vector<4xi8>) -> i32 {
    %0 = spirv.SUDot %arg0, %arg1 : vector<4xi8> -> i32
    return %0 : i32
  }
  func.func @sudot_vector_4xi16(%arg0: vector<4xi16>, %arg1: vector<4xi16>) -> i64 {
    %0 = spirv.SUDot %arg0, %arg1 : vector<4xi16> -> i64
    return %0 : i64
  }
  func.func @sudot_vector_8xi8(%arg0: vector<8xi8>, %arg1: vector<8xi8>) -> i64 {
    %0 = spirv.SUDot %arg0, %arg1 : vector<8xi8> -> i64
    return %0 : i64
  }
}

// -----
module {
  func.func @udot_scalar_i32(%arg0: i32, %arg1: i32) -> i32 {
    %0 = spirv.UDot %arg0, %arg1, <PackedVectorFormat4x8Bit> : i32 -> i32
    return %0 : i32
  }
  func.func @udot_scalar_i64(%arg0: i32, %arg1: i32) -> i64 {
    %0 = spirv.UDot %arg0, %arg1, <PackedVectorFormat4x8Bit> : i32 -> i64
    return %0 : i64
  }
  func.func @udot_vector_4xi8(%arg0: vector<4xi8>, %arg1: vector<4xi8>) -> i32 {
    %0 = spirv.UDot %arg0, %arg1 : vector<4xi8> -> i32
    return %0 : i32
  }
}

// -----
module {
  func.func @sdot_acc_sat_scalar_i32(%arg0: i32, %arg1: i32, %arg2: i32) -> i32 {
    %0 = spirv.SDotAccSat %arg0, %arg1, %arg2, <PackedVectorFormat4x8Bit> : i32 -> i32
    return %0 : i32
  }
  func.func @sdot_acc_sat_scalar_i64(%arg0: i32, %arg1: i32, %arg2: i64) -> i64 {
    %0 = spirv.SDotAccSat %arg0, %arg1, %arg2, <PackedVectorFormat4x8Bit> : i32 -> i64
    return %0 : i64
  }
  func.func @sdot_acc_sat_vector_4xi8(%arg0: vector<4xi8>, %arg1: vector<4xi8>, %arg2: i32) -> i32 {
    %0 = spirv.SDotAccSat %arg0, %arg1, %arg2 : vector<4xi8> -> i32
    return %0 : i32
  }
  func.func @sdot_acc_sat_vector_4xi16(%arg0: vector<4xi16>, %arg1: vector<4xi16>, %arg2: i64) -> i64 {
    %0 = spirv.SDotAccSat %arg0, %arg1, %arg2 : vector<4xi16> -> i64
    return %0 : i64
  }
  func.func @sdot_acc_sat_vector_8xi8(%arg0: vector<8xi8>, %arg1: vector<8xi8>, %arg2: i64) -> i64 {
    %0 = spirv.SDotAccSat %arg0, %arg1, %arg2 : vector<8xi8> -> i64
    return %0 : i64
  }
}

// -----
// -----
// -----
// -----
// -----
module {
  func.func @sudot_acc_sat_scalar_i32(%arg0: i32, %arg1: i32, %arg2: i32) -> i32 {
    %0 = spirv.SUDotAccSat %arg0, %arg1, %arg2, <PackedVectorFormat4x8Bit> : i32 -> i32
    return %0 : i32
  }
  func.func @sudot_acc_sat_scalar_i64(%arg0: i32, %arg1: i32, %arg2: i64) -> i64 {
    %0 = spirv.SUDotAccSat %arg0, %arg1, %arg2, <PackedVectorFormat4x8Bit> : i32 -> i64
    return %0 : i64
  }
  func.func @sudot_acc_sat_vector_4xi8(%arg0: vector<4xi8>, %arg1: vector<4xi8>, %arg2: i32) -> i32 {
    %0 = spirv.SUDotAccSat %arg0, %arg1, %arg2 : vector<4xi8> -> i32
    return %0 : i32
  }
  func.func @sudot_acc_sat_vector_4xi16(%arg0: vector<4xi16>, %arg1: vector<4xi16>, %arg2: i64) -> i64 {
    %0 = spirv.SUDotAccSat %arg0, %arg1, %arg2 : vector<4xi16> -> i64
    return %0 : i64
  }
  func.func @sudot_acc_sat_vector_8xi8(%arg0: vector<8xi8>, %arg1: vector<8xi8>, %arg2: i64) -> i64 {
    %0 = spirv.SUDotAccSat %arg0, %arg1, %arg2 : vector<8xi8> -> i64
    return %0 : i64
  }
}

// -----
module {
  func.func @udot_acc_sat_scalar_i32(%arg0: i32, %arg1: i32, %arg2: i32) -> i32 {
    %0 = spirv.UDotAccSat %arg0, %arg1, %arg2, <PackedVectorFormat4x8Bit> : i32 -> i32
    return %0 : i32
  }
  func.func @udot_acc_sat_scalar_i64(%arg0: i32, %arg1: i32, %arg2: i64) -> i64 {
    %0 = spirv.UDotAccSat %arg0, %arg1, %arg2, <PackedVectorFormat4x8Bit> : i32 -> i64
    return %0 : i64
  }
  func.func @udot_acc_sat_vector_4xi8(%arg0: vector<4xi8>, %arg1: vector<4xi8>, %arg2: i32) -> i32 {
    %0 = spirv.UDotAccSat %arg0, %arg1, %arg2 : vector<4xi8> -> i32
    return %0 : i32
  }
  func.func @udot_acc_sat_vector_4xi16(%arg0: vector<4xi16>, %arg1: vector<4xi16>, %arg2: i64) -> i64 {
    %0 = spirv.UDotAccSat %arg0, %arg1, %arg2 : vector<4xi16> -> i64
    return %0 : i64
  }
  func.func @udot_acc_sat_vector_8xi8(%arg0: vector<8xi8>, %arg1: vector<8xi8>, %arg2: i64) -> i64 {
    %0 = spirv.UDotAccSat %arg0, %arg1, %arg2 : vector<8xi8> -> i64
    return %0 : i64
  }
}

