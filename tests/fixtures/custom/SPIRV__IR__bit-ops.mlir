module {
  func.func @bitcount(%arg0: i32) -> i32 {
    %0 = spirv.BitCount %arg0 : i32
    spirv.ReturnValue %0 : i32
  }
}

// -----
module {
  func.func @bit_field_insert_vec(%arg0: vector<3xi32>, %arg1: vector<3xi32>, %arg2: i32, %arg3: i16) -> vector<3xi32> {
    %0 = spirv.BitFieldInsert %arg0, %arg1, %arg2, %arg3 : vector<3xi32>, i32, i16
    spirv.ReturnValue %0 : vector<3xi32>
  }
}

// -----
// -----
module {
  func.func @bit_field_s_extract_vec(%arg0: vector<3xi32>, %arg1: i8, %arg2: i8) -> vector<3xi32> {
    %0 = spirv.BitFieldSExtract %arg0, %arg1, %arg2 : vector<3xi32>, i8, i8
    spirv.ReturnValue %0 : vector<3xi32>
  }
  func.func @bit_field_u_extract_vec(%arg0: vector<3xi32>, %arg1: i8, %arg2: i8) -> vector<3xi32> {
    %0 = spirv.BitFieldUExtract %arg0, %arg1, %arg2 : vector<3xi32>, i8, i8
    spirv.ReturnValue %0 : vector<3xi32>
  }
}

// -----
// -----
module {
  func.func @bitreverse(%arg0: i32) -> i32 {
    %0 = spirv.BitReverse %arg0 : i32
    spirv.ReturnValue %0 : i32
  }
}

// -----
module {
  func.func @bitwise_or_scalar(%arg0: i32) -> i32 {
    %0 = spirv.BitwiseOr %arg0, %arg0 : i32
    return %0 : i32
  }
  func.func @bitwise_or_vector(%arg0: vector<4xi32>) -> vector<4xi32> {
    %0 = spirv.BitwiseOr %arg0, %arg0 : vector<4xi32>
    return %0 : vector<4xi32>
  }
  func.func @bitwise_or_zero(%arg0: i32) -> i32 {
    %cst0_i32 = spirv.Constant 0 : i32
    %0 = spirv.BitwiseOr %arg0, %cst0_i32 : i32
    return %0 : i32
  }
  func.func @bitwise_or_zero_vector(%arg0: vector<4xi32>) -> vector<4xi32> {
    %cst_vec_4xi32 = spirv.Constant dense<0> : vector<4xi32>
    %0 = spirv.BitwiseOr %arg0, %cst_vec_4xi32 : vector<4xi32>
    return %0 : vector<4xi32>
  }
  func.func @bitwise_or_all_ones(%arg0: i8) -> i8 {
    %cst-1_i8 = spirv.Constant -1 : i8
    %0 = spirv.BitwiseOr %arg0, %cst-1_i8 : i8
    return %0 : i8
  }
  func.func @bitwise_or_all_ones_vector(%arg0: vector<3xi8>) -> vector<3xi8> {
    %cst_vec_3xi8 = spirv.Constant dense<-1> : vector<3xi8>
    %0 = spirv.BitwiseOr %arg0, %cst_vec_3xi8 : vector<3xi8>
    return %0 : vector<3xi8>
  }
}

// -----
// -----
module {
  func.func @bitwise_xor_scalar(%arg0: i32) -> i32 {
    %cst1_i32 = spirv.Constant 1 : i32
    %0 = spirv.BitwiseXor %cst1_i32, %arg0 : i32
    return %0 : i32
  }
  func.func @bitwise_xor_vector(%arg0: vector<4xi32>) -> vector<4xi32> {
    %cst_vec_4xi32 = spirv.Constant dense<1> : vector<4xi32>
    %0 = spirv.BitwiseXor %cst_vec_4xi32, %arg0 : vector<4xi32>
    return %0 : vector<4xi32>
  }
}

// -----
// -----
module {
  func.func @bitwise_and_scalar(%arg0: i32) -> i32 {
    %0 = spirv.BitwiseAnd %arg0, %arg0 : i32
    return %0 : i32
  }
  func.func @bitwise_and_vector(%arg0: vector<4xi32>) -> vector<4xi32> {
    %0 = spirv.BitwiseAnd %arg0, %arg0 : vector<4xi32>
    return %0 : vector<4xi32>
  }
  func.func @bitwise_and_zero(%arg0: i32) -> i32 {
    %cst0_i32 = spirv.Constant 0 : i32
    %0 = spirv.BitwiseAnd %arg0, %cst0_i32 : i32
    return %0 : i32
  }
  func.func @bitwise_and_zero_vector(%arg0: vector<4xi32>) -> vector<4xi32> {
    %cst_vec_4xi32 = spirv.Constant dense<0> : vector<4xi32>
    %0 = spirv.BitwiseAnd %arg0, %cst_vec_4xi32 : vector<4xi32>
    return %0 : vector<4xi32>
  }
  func.func @bitwise_and_all_ones(%arg0: i8) -> i8 {
    %cst-1_i8 = spirv.Constant -1 : i8
    %0 = spirv.BitwiseAnd %arg0, %cst-1_i8 : i8
    return %0 : i8
  }
  func.func @bitwise_and_all_ones_vector(%arg0: vector<3xi8>) -> vector<3xi8> {
    %cst_vec_3xi8 = spirv.Constant dense<-1> : vector<3xi8>
    %0 = spirv.BitwiseAnd %arg0, %cst_vec_3xi8 : vector<3xi8>
    return %0 : vector<3xi8>
  }
  func.func @bitwise_and_zext_1(%arg0: i8) -> i32 {
    %0 = spirv.UConvert %arg0 : i8 to i32
    %cst255_i32 = spirv.Constant 255 : i32
    %1 = spirv.BitwiseAnd %0, %cst255_i32 : i32
    return %1 : i32
  }
  func.func @bitwise_and_zext_2(%arg0: i8) -> i32 {
    %0 = spirv.UConvert %arg0 : i8 to i32
    %cst19088895_i32 = spirv.Constant 19088895 : i32
    %1 = spirv.BitwiseAnd %0, %cst19088895_i32 : i32
    return %1 : i32
  }
  func.func @bitwise_and_zext_3(%arg0: i8) -> i32 {
    %0 = spirv.UConvert %arg0 : i8 to i32
    %cst254_i32 = spirv.Constant 254 : i32
    %1 = spirv.BitwiseAnd %0, %cst254_i32 : i32
    return %1 : i32
  }
  func.func @bitwise_and_zext_vector(%arg0: vector<2xi8>) -> vector<2xi32> {
    %0 = spirv.UConvert %arg0 : vector<2xi8> to vector<2xi32>
    %cst_vec_2xi32 = spirv.Constant dense<255> : vector<2xi32>
    %1 = spirv.BitwiseAnd %0, %cst_vec_2xi32 : vector<2xi32>
    return %1 : vector<2xi32>
  }
}

// -----
// -----
module {
  func.func @not(%arg0: i32) -> i32 {
    %0 = spirv.Not %arg0 : i32
    spirv.ReturnValue %0 : i32
  }
}

// -----
module {
  func.func @shift_left_logical(%arg0: i32, %arg1: i16) -> i32 {
    %0 = spirv.ShiftLeftLogical %arg0, %arg1 : i32, i16
    spirv.ReturnValue %0 : i32
  }
}

// -----
// -----
module {
  func.func @shift_right_arithmetic(%arg0: vector<4xi32>, %arg1: vector<4xi8>) -> vector<4xi32> {
    %0 = spirv.ShiftRightArithmetic %arg0, %arg1 : vector<4xi32>, vector<4xi8>
    spirv.ReturnValue %0 : vector<4xi32>
  }
}

// -----
module {
  func.func @shift_right_logical(%arg0: vector<2xi32>, %arg1: vector<2xi8>) -> vector<2xi32> {
    %0 = spirv.ShiftRightLogical %arg0, %arg1 : vector<2xi32>, vector<2xi8>
    spirv.ReturnValue %0 : vector<2xi32>
  }
}

