module {
  spirv.func @shift_right_arithmetic_scalar(%arg0: i32, %arg1: si32, %arg2: i16, %arg3: ui16) "None" {
    %0 = spirv.ShiftRightArithmetic %arg0, %arg0 : i32, i32
    %1 = spirv.ShiftRightArithmetic %arg0, %arg1 : i32, si32
    %2 = spirv.ShiftRightArithmetic %arg0, %arg2 : i32, i16
    %3 = spirv.ShiftRightArithmetic %arg0, %arg3 : i32, ui16
    spirv.Return
  }
  spirv.func @shift_right_arithmetic_vector(%arg0: vector<4xi64>, %arg1: vector<4xui64>, %arg2: vector<4xi32>, %arg3: vector<4xui32>) "None" {
    %0 = spirv.ShiftRightArithmetic %arg0, %arg0 : vector<4xi64>, vector<4xi64>
    %1 = spirv.ShiftRightArithmetic %arg0, %arg1 : vector<4xi64>, vector<4xui64>
    %2 = spirv.ShiftRightArithmetic %arg0, %arg2 : vector<4xi64>, vector<4xi32>
    %3 = spirv.ShiftRightArithmetic %arg0, %arg3 : vector<4xi64>, vector<4xui32>
    spirv.Return
  }
  spirv.func @shift_right_logical_scalar(%arg0: i32, %arg1: si32, %arg2: si16, %arg3: ui16) "None" {
    %0 = spirv.ShiftRightLogical %arg0, %arg0 : i32, i32
    %1 = spirv.ShiftRightLogical %arg0, %arg1 : i32, si32
    %2 = spirv.ShiftRightLogical %arg0, %arg2 : i32, si16
    %3 = spirv.ShiftRightLogical %arg0, %arg3 : i32, ui16
    spirv.Return
  }
  spirv.func @shift_right_logical_vector(%arg0: vector<4xi64>, %arg1: vector<4xsi64>, %arg2: vector<4xi32>, %arg3: vector<4xui32>) "None" {
    %0 = spirv.ShiftRightLogical %arg0, %arg0 : vector<4xi64>, vector<4xi64>
    %1 = spirv.ShiftRightLogical %arg0, %arg1 : vector<4xi64>, vector<4xsi64>
    %2 = spirv.ShiftRightLogical %arg0, %arg2 : vector<4xi64>, vector<4xi32>
    %3 = spirv.ShiftRightLogical %arg0, %arg3 : vector<4xi64>, vector<4xui32>
    spirv.Return
  }
  spirv.func @shift_left_logical_scalar(%arg0: i32, %arg1: si32, %arg2: i16, %arg3: ui16) "None" {
    %0 = spirv.ShiftLeftLogical %arg0, %arg0 : i32, i32
    %1 = spirv.ShiftLeftLogical %arg0, %arg1 : i32, si32
    %2 = spirv.ShiftLeftLogical %arg0, %arg2 : i32, i16
    %3 = spirv.ShiftLeftLogical %arg0, %arg3 : i32, ui16
    spirv.Return
  }
  spirv.func @shift_left_logical_vector(%arg0: vector<4xi64>, %arg1: vector<4xsi64>, %arg2: vector<4xi32>, %arg3: vector<4xui32>) "None" {
    %0 = spirv.ShiftLeftLogical %arg0, %arg0 : vector<4xi64>, vector<4xi64>
    %1 = spirv.ShiftLeftLogical %arg0, %arg1 : vector<4xi64>, vector<4xsi64>
    %2 = spirv.ShiftLeftLogical %arg0, %arg2 : vector<4xi64>, vector<4xi32>
    %3 = spirv.ShiftLeftLogical %arg0, %arg3 : vector<4xi64>, vector<4xui32>
    spirv.Return
  }
}

