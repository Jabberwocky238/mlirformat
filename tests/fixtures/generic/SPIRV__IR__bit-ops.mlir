"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "bitcount"}> ({
  ^bb0(%arg0: i32):
    %0 = "spirv.BitCount"(%arg0) : (i32) -> i32
    "spirv.ReturnValue"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<3xi32>, vector<3xi32>, i32, i16) -> vector<3xi32>, sym_name = "bit_field_insert_vec"}> ({
  ^bb0(%arg0: vector<3xi32>, %arg1: vector<3xi32>, %arg2: i32, %arg3: i16):
    %0 = "spirv.BitFieldInsert"(%arg0, %arg1, %arg2, %arg3) : (vector<3xi32>, vector<3xi32>, i32, i16) -> vector<3xi32>
    "spirv.ReturnValue"(%0) : (vector<3xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<3xi32>, i8, i8) -> vector<3xi32>, sym_name = "bit_field_s_extract_vec"}> ({
  ^bb0(%arg3: vector<3xi32>, %arg4: i8, %arg5: i8):
    %1 = "spirv.BitFieldSExtract"(%arg3, %arg4, %arg5) : (vector<3xi32>, i8, i8) -> vector<3xi32>
    "spirv.ReturnValue"(%1) : (vector<3xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xi32>, i8, i8) -> vector<3xi32>, sym_name = "bit_field_u_extract_vec"}> ({
  ^bb0(%arg0: vector<3xi32>, %arg1: i8, %arg2: i8):
    %0 = "spirv.BitFieldUExtract"(%arg0, %arg1, %arg2) : (vector<3xi32>, i8, i8) -> vector<3xi32>
    "spirv.ReturnValue"(%0) : (vector<3xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "bitreverse"}> ({
  ^bb0(%arg0: i32):
    %0 = "spirv.BitReverse"(%arg0) : (i32) -> i32
    "spirv.ReturnValue"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "bitwise_or_scalar"}> ({
  ^bb0(%arg5: i32):
    %9 = "spirv.BitwiseOr"(%arg5, %arg5) : (i32, i32) -> i32
    "func.return"(%9) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi32>) -> vector<4xi32>, sym_name = "bitwise_or_vector"}> ({
  ^bb0(%arg4: vector<4xi32>):
    %8 = "spirv.BitwiseOr"(%arg4, %arg4) : (vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    "func.return"(%8) : (vector<4xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "bitwise_or_zero"}> ({
  ^bb0(%arg3: i32):
    %6 = "spirv.Constant"() <{value = 0 : i32}> : () -> i32
    %7 = "spirv.BitwiseOr"(%arg3, %6) : (i32, i32) -> i32
    "func.return"(%7) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi32>) -> vector<4xi32>, sym_name = "bitwise_or_zero_vector"}> ({
  ^bb0(%arg2: vector<4xi32>):
    %4 = "spirv.Constant"() <{value = dense<0> : vector<4xi32>}> : () -> vector<4xi32>
    %5 = "spirv.BitwiseOr"(%arg2, %4) : (vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    "func.return"(%5) : (vector<4xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i8) -> i8, sym_name = "bitwise_or_all_ones"}> ({
  ^bb0(%arg1: i8):
    %2 = "spirv.Constant"() <{value = -1 : i8}> : () -> i8
    %3 = "spirv.BitwiseOr"(%arg1, %2) : (i8, i8) -> i8
    "func.return"(%3) : (i8) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xi8>) -> vector<3xi8>, sym_name = "bitwise_or_all_ones_vector"}> ({
  ^bb0(%arg0: vector<3xi8>):
    %0 = "spirv.Constant"() <{value = dense<-1> : vector<3xi8>}> : () -> vector<3xi8>
    %1 = "spirv.BitwiseOr"(%arg0, %0) : (vector<3xi8>, vector<3xi8>) -> vector<3xi8>
    "func.return"(%1) : (vector<3xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "bitwise_xor_scalar"}> ({
  ^bb0(%arg1: i32):
    %2 = "spirv.Constant"() <{value = 1 : i32}> : () -> i32
    %3 = "spirv.BitwiseXor"(%2, %arg1) : (i32, i32) -> i32
    "func.return"(%3) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi32>) -> vector<4xi32>, sym_name = "bitwise_xor_vector"}> ({
  ^bb0(%arg0: vector<4xi32>):
    %0 = "spirv.Constant"() <{value = dense<1> : vector<4xi32>}> : () -> vector<4xi32>
    %1 = "spirv.BitwiseXor"(%0, %arg0) : (vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    "func.return"(%1) : (vector<4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "bitwise_and_scalar"}> ({
  ^bb0(%arg9: i32):
    %21 = "spirv.BitwiseAnd"(%arg9, %arg9) : (i32, i32) -> i32
    "func.return"(%21) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi32>) -> vector<4xi32>, sym_name = "bitwise_and_vector"}> ({
  ^bb0(%arg8: vector<4xi32>):
    %20 = "spirv.BitwiseAnd"(%arg8, %arg8) : (vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    "func.return"(%20) : (vector<4xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "bitwise_and_zero"}> ({
  ^bb0(%arg7: i32):
    %18 = "spirv.Constant"() <{value = 0 : i32}> : () -> i32
    %19 = "spirv.BitwiseAnd"(%arg7, %18) : (i32, i32) -> i32
    "func.return"(%19) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi32>) -> vector<4xi32>, sym_name = "bitwise_and_zero_vector"}> ({
  ^bb0(%arg6: vector<4xi32>):
    %16 = "spirv.Constant"() <{value = dense<0> : vector<4xi32>}> : () -> vector<4xi32>
    %17 = "spirv.BitwiseAnd"(%arg6, %16) : (vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    "func.return"(%17) : (vector<4xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i8) -> i8, sym_name = "bitwise_and_all_ones"}> ({
  ^bb0(%arg5: i8):
    %14 = "spirv.Constant"() <{value = -1 : i8}> : () -> i8
    %15 = "spirv.BitwiseAnd"(%arg5, %14) : (i8, i8) -> i8
    "func.return"(%15) : (i8) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xi8>) -> vector<3xi8>, sym_name = "bitwise_and_all_ones_vector"}> ({
  ^bb0(%arg4: vector<3xi8>):
    %12 = "spirv.Constant"() <{value = dense<-1> : vector<3xi8>}> : () -> vector<3xi8>
    %13 = "spirv.BitwiseAnd"(%arg4, %12) : (vector<3xi8>, vector<3xi8>) -> vector<3xi8>
    "func.return"(%13) : (vector<3xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i8) -> i32, sym_name = "bitwise_and_zext_1"}> ({
  ^bb0(%arg3: i8):
    %9 = "spirv.UConvert"(%arg3) : (i8) -> i32
    %10 = "spirv.Constant"() <{value = 255 : i32}> : () -> i32
    %11 = "spirv.BitwiseAnd"(%9, %10) : (i32, i32) -> i32
    "func.return"(%11) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i8) -> i32, sym_name = "bitwise_and_zext_2"}> ({
  ^bb0(%arg2: i8):
    %6 = "spirv.UConvert"(%arg2) : (i8) -> i32
    %7 = "spirv.Constant"() <{value = 19088895 : i32}> : () -> i32
    %8 = "spirv.BitwiseAnd"(%6, %7) : (i32, i32) -> i32
    "func.return"(%8) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i8) -> i32, sym_name = "bitwise_and_zext_3"}> ({
  ^bb0(%arg1: i8):
    %3 = "spirv.UConvert"(%arg1) : (i8) -> i32
    %4 = "spirv.Constant"() <{value = 254 : i32}> : () -> i32
    %5 = "spirv.BitwiseAnd"(%3, %4) : (i32, i32) -> i32
    "func.return"(%5) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xi8>) -> vector<2xi32>, sym_name = "bitwise_and_zext_vector"}> ({
  ^bb0(%arg0: vector<2xi8>):
    %0 = "spirv.UConvert"(%arg0) : (vector<2xi8>) -> vector<2xi32>
    %1 = "spirv.Constant"() <{value = dense<255> : vector<2xi32>}> : () -> vector<2xi32>
    %2 = "spirv.BitwiseAnd"(%0, %1) : (vector<2xi32>, vector<2xi32>) -> vector<2xi32>
    "func.return"(%2) : (vector<2xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "not"}> ({
  ^bb0(%arg0: i32):
    %0 = "spirv.Not"(%arg0) : (i32) -> i32
    "spirv.ReturnValue"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i16) -> i32, sym_name = "shift_left_logical"}> ({
  ^bb0(%arg0: i32, %arg1: i16):
    %0 = "spirv.ShiftLeftLogical"(%arg0, %arg1) : (i32, i16) -> i32
    "spirv.ReturnValue"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xi32>, vector<4xi8>) -> vector<4xi32>, sym_name = "shift_right_arithmetic"}> ({
  ^bb0(%arg0: vector<4xi32>, %arg1: vector<4xi8>):
    %0 = "spirv.ShiftRightArithmetic"(%arg0, %arg1) : (vector<4xi32>, vector<4xi8>) -> vector<4xi32>
    "spirv.ReturnValue"(%0) : (vector<4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2xi32>, vector<2xi8>) -> vector<2xi32>, sym_name = "shift_right_logical"}> ({
  ^bb0(%arg0: vector<2xi32>, %arg1: vector<2xi8>):
    %0 = "spirv.ShiftRightLogical"(%arg0, %arg1) : (vector<2xi32>, vector<2xi8>) -> vector<2xi32>
    "spirv.ReturnValue"(%0) : (vector<2xi32>) -> ()
  }) : () -> ()
}) : () -> ()

