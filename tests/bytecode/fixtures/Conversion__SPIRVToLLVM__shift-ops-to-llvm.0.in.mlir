"builtin.module"() ({
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32, si32, i16, ui16) -> (), sym_name = "shift_right_arithmetic_scalar"}> ({
  ^bb0(%arg20: i32 loc("<stdin>":3:8), %arg21: si32 loc("<stdin>":3:21), %arg22: i16 loc("<stdin>":3:35), %arg23: ui16 loc("<stdin>":3:48)):
    %20 = "spirv.ShiftRightArithmetic"(%arg20, %arg20) : (i32, i32) -> i32 loc("<stdin>":4:11)
    %21 = "spirv.ShiftRightArithmetic"(%arg20, %arg21) : (i32, si32) -> i32 loc("<stdin>":5:11)
    %22 = "spirv.ShiftRightArithmetic"(%arg20, %arg22) : (i32, i16) -> i32 loc("<stdin>":6:11)
    %23 = "spirv.ShiftRightArithmetic"(%arg20, %arg23) : (i32, ui16) -> i32 loc("<stdin>":7:11)
    "spirv.Return"() : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi64>, vector<4xui64>, vector<4xi32>, vector<4xui32>) -> (), sym_name = "shift_right_arithmetic_vector"}> ({
  ^bb0(%arg16: vector<4xi64> loc("<stdin>":11:8), %arg17: vector<4xui64> loc("<stdin>":11:31), %arg18: vector<4xi32> loc("<stdin>":11:55), %arg19: vector<4xui32> loc("<stdin>":11:78)):
    %16 = "spirv.ShiftRightArithmetic"(%arg16, %arg16) : (vector<4xi64>, vector<4xi64>) -> vector<4xi64> loc("<stdin>":12:11)
    %17 = "spirv.ShiftRightArithmetic"(%arg16, %arg17) : (vector<4xi64>, vector<4xui64>) -> vector<4xi64> loc("<stdin>":13:11)
    %18 = "spirv.ShiftRightArithmetic"(%arg16, %arg18) : (vector<4xi64>, vector<4xi32>) -> vector<4xi64> loc("<stdin>":14:11)
    %19 = "spirv.ShiftRightArithmetic"(%arg16, %arg19) : (vector<4xi64>, vector<4xui32>) -> vector<4xi64> loc("<stdin>":15:11)
    "spirv.Return"() : () -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":10:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32, si32, si16, ui16) -> (), sym_name = "shift_right_logical_scalar"}> ({
  ^bb0(%arg12: i32 loc("<stdin>":19:8), %arg13: si32 loc("<stdin>":19:21), %arg14: si16 loc("<stdin>":19:35), %arg15: ui16 loc("<stdin>":19:49)):
    %12 = "spirv.ShiftRightLogical"(%arg12, %arg12) : (i32, i32) -> i32 loc("<stdin>":20:11)
    %13 = "spirv.ShiftRightLogical"(%arg12, %arg13) : (i32, si32) -> i32 loc("<stdin>":21:11)
    %14 = "spirv.ShiftRightLogical"(%arg12, %arg14) : (i32, si16) -> i32 loc("<stdin>":22:11)
    %15 = "spirv.ShiftRightLogical"(%arg12, %arg15) : (i32, ui16) -> i32 loc("<stdin>":23:11)
    "spirv.Return"() : () -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":18:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi64>, vector<4xsi64>, vector<4xi32>, vector<4xui32>) -> (), sym_name = "shift_right_logical_vector"}> ({
  ^bb0(%arg8: vector<4xi64> loc("<stdin>":27:8), %arg9: vector<4xsi64> loc("<stdin>":27:30), %arg10: vector<4xi32> loc("<stdin>":27:53), %arg11: vector<4xui32> loc("<stdin>":27:76)):
    %8 = "spirv.ShiftRightLogical"(%arg8, %arg8) : (vector<4xi64>, vector<4xi64>) -> vector<4xi64> loc("<stdin>":28:10)
    %9 = "spirv.ShiftRightLogical"(%arg8, %arg9) : (vector<4xi64>, vector<4xsi64>) -> vector<4xi64> loc("<stdin>":29:10)
    %10 = "spirv.ShiftRightLogical"(%arg8, %arg10) : (vector<4xi64>, vector<4xi32>) -> vector<4xi64> loc("<stdin>":30:11)
    %11 = "spirv.ShiftRightLogical"(%arg8, %arg11) : (vector<4xi64>, vector<4xui32>) -> vector<4xi64> loc("<stdin>":31:11)
    "spirv.Return"() : () -> () loc("<stdin>":32:5)
  }) : () -> () loc("<stdin>":26:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32, si32, i16, ui16) -> (), sym_name = "shift_left_logical_scalar"}> ({
  ^bb0(%arg4: i32 loc("<stdin>":35:8), %arg5: si32 loc("<stdin>":35:20), %arg6: i16 loc("<stdin>":35:33), %arg7: ui16 loc("<stdin>":35:45)):
    %4 = "spirv.ShiftLeftLogical"(%arg4, %arg4) : (i32, i32) -> i32 loc("<stdin>":36:10)
    %5 = "spirv.ShiftLeftLogical"(%arg4, %arg5) : (i32, si32) -> i32 loc("<stdin>":37:10)
    %6 = "spirv.ShiftLeftLogical"(%arg4, %arg6) : (i32, i16) -> i32 loc("<stdin>":38:10)
    %7 = "spirv.ShiftLeftLogical"(%arg4, %arg7) : (i32, ui16) -> i32 loc("<stdin>":39:10)
    "spirv.Return"() : () -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":34:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi64>, vector<4xsi64>, vector<4xi32>, vector<4xui32>) -> (), sym_name = "shift_left_logical_vector"}> ({
  ^bb0(%arg0: vector<4xi64> loc("<stdin>":43:8), %arg1: vector<4xsi64> loc("<stdin>":43:30), %arg2: vector<4xi32> loc("<stdin>":43:53), %arg3: vector<4xui32> loc("<stdin>":43:75)):
    %0 = "spirv.ShiftLeftLogical"(%arg0, %arg0) : (vector<4xi64>, vector<4xi64>) -> vector<4xi64> loc("<stdin>":44:10)
    %1 = "spirv.ShiftLeftLogical"(%arg0, %arg1) : (vector<4xi64>, vector<4xsi64>) -> vector<4xi64> loc("<stdin>":45:10)
    %2 = "spirv.ShiftLeftLogical"(%arg0, %arg2) : (vector<4xi64>, vector<4xi32>) -> vector<4xi64> loc("<stdin>":46:10)
    %3 = "spirv.ShiftLeftLogical"(%arg0, %arg3) : (vector<4xi64>, vector<4xui32>) -> vector<4xi64> loc("<stdin>":47:10)
    "spirv.Return"() : () -> () loc("<stdin>":48:5)
  }) : () -> () loc("<stdin>":42:3)
}) : () -> () loc("<stdin>":1:1)
