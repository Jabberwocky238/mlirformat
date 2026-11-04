module {
  spirv.func @bitcount_scalar(%arg0: i16) "None" {
    %0 = spirv.BitCount %arg0 : i16
    spirv.Return
  }
  spirv.func @bitcount_vector(%arg0: vector<3xi32>) "None" {
    %0 = spirv.BitCount %arg0 : vector<3xi32>
    spirv.Return
  }
  spirv.func @bitreverse_scalar(%arg0: i64) "None" {
    %0 = spirv.BitReverse %arg0 : i64
    spirv.Return
  }
  spirv.func @bitreverse_vector(%arg0: vector<4xi32>) "None" {
    %0 = spirv.BitReverse %arg0 : vector<4xi32>
    spirv.Return
  }
  spirv.func @bitfield_insert_scalar_same_bit_width(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32) "None" {
    %0 = spirv.BitFieldInsert %arg0, %arg1, %arg2, %arg3 : i32, i32, i32
    spirv.Return
  }
  spirv.func @bitfield_insert_scalar_smaller_bit_width(%arg0: i64, %arg1: i64, %arg2: i8, %arg3: i8) "None" {
    %0 = spirv.BitFieldInsert %arg0, %arg1, %arg2, %arg3 : i64, i8, i8
    spirv.Return
  }
  spirv.func @bitfield_insert_scalar_greater_bit_width(%arg0: i16, %arg1: i16, %arg2: i32, %arg3: i64) "None" {
    %0 = spirv.BitFieldInsert %arg0, %arg1, %arg2, %arg3 : i16, i32, i64
    spirv.Return
  }
  spirv.func @bitfield_insert_vector(%arg0: vector<2xi32>, %arg1: vector<2xi32>, %arg2: i32, %arg3: i32) "None" {
    %0 = spirv.BitFieldInsert %arg0, %arg1, %arg2, %arg3 : vector<2xi32>, i32, i32
    spirv.Return
  }
  spirv.func @bitfield_sextract_scalar_same_bit_width(%arg0: i64, %arg1: i64, %arg2: i64) "None" {
    %0 = spirv.BitFieldSExtract %arg0, %arg1, %arg2 : i64, i64, i64
    spirv.Return
  }
  spirv.func @bitfield_sextract_scalar_smaller_bit_width(%arg0: i32, %arg1: i8, %arg2: i8) "None" {
    %0 = spirv.BitFieldSExtract %arg0, %arg1, %arg2 : i32, i8, i8
    spirv.Return
  }
  spirv.func @bitfield_sextract_scalar_greater_bit_width(%arg0: i32, %arg1: i64, %arg2: i64) "None" {
    %0 = spirv.BitFieldSExtract %arg0, %arg1, %arg2 : i32, i64, i64
    spirv.Return
  }
  spirv.func @bitfield_sextract_vector(%arg0: vector<2xi32>, %arg1: i32, %arg2: i32) "None" {
    %0 = spirv.BitFieldSExtract %arg0, %arg1, %arg2 : vector<2xi32>, i32, i32
    spirv.Return
  }
  spirv.func @bitfield_uextract_scalar_same_bit_width(%arg0: i32, %arg1: i32, %arg2: i32) "None" {
    %0 = spirv.BitFieldUExtract %arg0, %arg1, %arg2 : i32, i32, i32
    spirv.Return
  }
  spirv.func @bitfield_uextract_scalar_smaller_bit_width(%arg0: i32, %arg1: i16, %arg2: i8) "None" {
    %0 = spirv.BitFieldUExtract %arg0, %arg1, %arg2 : i32, i16, i8
    spirv.Return
  }
  spirv.func @bitfield_uextract_scalar_greater_bit_width(%arg0: i8, %arg1: i16, %arg2: i8) "None" {
    %0 = spirv.BitFieldUExtract %arg0, %arg1, %arg2 : i8, i16, i8
    spirv.Return
  }
  spirv.func @bitfield_uextract_vector(%arg0: vector<2xi32>, %arg1: i32, %arg2: i32) "None" {
    %0 = spirv.BitFieldUExtract %arg0, %arg1, %arg2 : vector<2xi32>, i32, i32
    spirv.Return
  }
  spirv.func @bitwise_and_scalar(%arg0: i32, %arg1: i32) "None" {
    %0 = spirv.BitwiseAnd %arg0, %arg1 : i32
    spirv.Return
  }
  spirv.func @bitwise_and_vector(%arg0: vector<4xi64>, %arg1: vector<4xi64>) "None" {
    %0 = spirv.BitwiseAnd %arg0, %arg1 : vector<4xi64>
    spirv.Return
  }
  spirv.func @bitwise_or_scalar(%arg0: i64, %arg1: i64) "None" {
    %0 = spirv.BitwiseOr %arg0, %arg1 : i64
    spirv.Return
  }
  spirv.func @bitwise_or_vector(%arg0: vector<3xi8>, %arg1: vector<3xi8>) "None" {
    %0 = spirv.BitwiseOr %arg0, %arg1 : vector<3xi8>
    spirv.Return
  }
  spirv.func @bitwise_xor_scalar(%arg0: i32, %arg1: i32) "None" {
    %0 = spirv.BitwiseXor %arg0, %arg1 : i32
    spirv.Return
  }
  spirv.func @bitwise_xor_vector(%arg0: vector<2xi16>, %arg1: vector<2xi16>) "None" {
    %0 = spirv.BitwiseXor %arg0, %arg1 : vector<2xi16>
    spirv.Return
  }
  spirv.func @not_scalar(%arg0: i32) "None" {
    %0 = spirv.Not %arg0 : i32
    spirv.Return
  }
  spirv.func @not_vector(%arg0: vector<2xi16>) "None" {
    %0 = spirv.Not %arg0 : vector<2xi16>
    spirv.Return
  }
}

