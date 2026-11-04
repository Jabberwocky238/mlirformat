module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage, Int16, Int8], []> {
    spirv.func @bitcount(%arg0: i32) -> i32 "None" {
      %0 = spirv.BitCount %arg0 : i32
      spirv.ReturnValue %0 : i32
    }
    spirv.func @bit_field_insert(%arg0: vector<3xi32>, %arg1: vector<3xi32>, %arg2: i32, %arg3: i16) -> vector<3xi32> "None" {
      %0 = spirv.BitFieldInsert %arg0, %arg1, %arg2, %arg3 : vector<3xi32>, i32, i16
      spirv.ReturnValue %0 : vector<3xi32>
    }
    spirv.func @bit_field_s_extract(%arg0: vector<3xi32>, %arg1: i8, %arg2: i8) -> vector<3xi32> "None" {
      %0 = spirv.BitFieldSExtract %arg0, %arg1, %arg2 : vector<3xi32>, i8, i8
      spirv.ReturnValue %0 : vector<3xi32>
    }
    spirv.func @bit_field_u_extract(%arg0: vector<3xi32>, %arg1: i8, %arg2: i8) -> vector<3xi32> "None" {
      %0 = spirv.BitFieldUExtract %arg0, %arg1, %arg2 : vector<3xi32>, i8, i8
      spirv.ReturnValue %0 : vector<3xi32>
    }
    spirv.func @bitreverse(%arg0: i32) -> i32 "None" {
      %0 = spirv.BitReverse %arg0 : i32
      spirv.ReturnValue %0 : i32
    }
    spirv.func @not(%arg0: i32) -> i32 "None" {
      %0 = spirv.Not %arg0 : i32
      spirv.ReturnValue %0 : i32
    }
    spirv.func @bitwise_scalar(%arg0: i32, %arg1: i32) "None" {
      %0 = spirv.BitwiseAnd %arg0, %arg1 : i32
      %1 = spirv.BitwiseOr %arg0, %arg1 : i32
      %2 = spirv.BitwiseXor %arg0, %arg1 : i32
      spirv.Return
    }
    spirv.func @shift_left_logical(%arg0: i32, %arg1: i16) -> i32 "None" {
      %0 = spirv.ShiftLeftLogical %arg0, %arg1 : i32, i16
      spirv.ReturnValue %0 : i32
    }
    spirv.func @shift_right_arithmetic(%arg0: vector<4xi32>, %arg1: vector<4xi8>) -> vector<4xi32> "None" {
      %0 = spirv.ShiftRightArithmetic %arg0, %arg1 : vector<4xi32>, vector<4xi8>
      spirv.ReturnValue %0 : vector<4xi32>
    }
    spirv.func @shift_right_logical(%arg0: vector<2xi32>, %arg1: vector<2xi8>) -> vector<2xi32> "None" {
      %0 = spirv.ShiftRightLogical %arg0, %arg1 : vector<2xi32>, vector<2xi8>
      spirv.ReturnValue %0 : vector<2xi32>
    }
  }
}

