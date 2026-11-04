"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "sdot_scalar_i32"}> ({
  ^bb0(%arg8: i32, %arg9: i32):
    %4 = "spirv.SDot"(%arg8, %arg9) <{format = #spirv.packed_vector_format<PackedVectorFormat4x8Bit>}> : (i32, i32) -> i32
    "func.return"(%4) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> i64, sym_name = "sdot_scalar_i64"}> ({
  ^bb0(%arg6: i32, %arg7: i32):
    %3 = "spirv.SDot"(%arg6, %arg7) <{format = #spirv.packed_vector_format<PackedVectorFormat4x8Bit>}> : (i32, i32) -> i64
    "func.return"(%3) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi8>, vector<4xi8>) -> i32, sym_name = "sdot_vector_4xi8"}> ({
  ^bb0(%arg4: vector<4xi8>, %arg5: vector<4xi8>):
    %2 = "spirv.SDot"(%arg4, %arg5) : (vector<4xi8>, vector<4xi8>) -> i32
    "func.return"(%2) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi16>, vector<4xi16>) -> i64, sym_name = "sdot_vector_4xi16"}> ({
  ^bb0(%arg2: vector<4xi16>, %arg3: vector<4xi16>):
    %1 = "spirv.SDot"(%arg2, %arg3) : (vector<4xi16>, vector<4xi16>) -> i64
    "func.return"(%1) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi8>, vector<8xi8>) -> i64, sym_name = "sdot_vector_8xi8"}> ({
  ^bb0(%arg0: vector<8xi8>, %arg1: vector<8xi8>):
    %0 = "spirv.SDot"(%arg0, %arg1) : (vector<8xi8>, vector<8xi8>) -> i64
    "func.return"(%0) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "sudot_scalar_i32"}> ({
  ^bb0(%arg8: i32, %arg9: i32):
    %4 = "spirv.SUDot"(%arg8, %arg9) <{format = #spirv.packed_vector_format<PackedVectorFormat4x8Bit>}> : (i32, i32) -> i32
    "func.return"(%4) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> i64, sym_name = "sudot_scalar_i64"}> ({
  ^bb0(%arg6: i32, %arg7: i32):
    %3 = "spirv.SUDot"(%arg6, %arg7) <{format = #spirv.packed_vector_format<PackedVectorFormat4x8Bit>}> : (i32, i32) -> i64
    "func.return"(%3) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi8>, vector<4xi8>) -> i32, sym_name = "sudot_vector_4xi8"}> ({
  ^bb0(%arg4: vector<4xi8>, %arg5: vector<4xi8>):
    %2 = "spirv.SUDot"(%arg4, %arg5) : (vector<4xi8>, vector<4xi8>) -> i32
    "func.return"(%2) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi16>, vector<4xi16>) -> i64, sym_name = "sudot_vector_4xi16"}> ({
  ^bb0(%arg2: vector<4xi16>, %arg3: vector<4xi16>):
    %1 = "spirv.SUDot"(%arg2, %arg3) : (vector<4xi16>, vector<4xi16>) -> i64
    "func.return"(%1) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi8>, vector<8xi8>) -> i64, sym_name = "sudot_vector_8xi8"}> ({
  ^bb0(%arg0: vector<8xi8>, %arg1: vector<8xi8>):
    %0 = "spirv.SUDot"(%arg0, %arg1) : (vector<8xi8>, vector<8xi8>) -> i64
    "func.return"(%0) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "udot_scalar_i32"}> ({
  ^bb0(%arg4: i32, %arg5: i32):
    %2 = "spirv.UDot"(%arg4, %arg5) <{format = #spirv.packed_vector_format<PackedVectorFormat4x8Bit>}> : (i32, i32) -> i32
    "func.return"(%2) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> i64, sym_name = "udot_scalar_i64"}> ({
  ^bb0(%arg2: i32, %arg3: i32):
    %1 = "spirv.UDot"(%arg2, %arg3) <{format = #spirv.packed_vector_format<PackedVectorFormat4x8Bit>}> : (i32, i32) -> i64
    "func.return"(%1) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi8>, vector<4xi8>) -> i32, sym_name = "udot_vector_4xi8"}> ({
  ^bb0(%arg0: vector<4xi8>, %arg1: vector<4xi8>):
    %0 = "spirv.UDot"(%arg0, %arg1) : (vector<4xi8>, vector<4xi8>) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32, i32) -> i32, sym_name = "sdot_acc_sat_scalar_i32"}> ({
  ^bb0(%arg12: i32, %arg13: i32, %arg14: i32):
    %4 = "spirv.SDotAccSat"(%arg12, %arg13, %arg14) <{format = #spirv.packed_vector_format<PackedVectorFormat4x8Bit>}> : (i32, i32, i32) -> i32
    "func.return"(%4) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i64) -> i64, sym_name = "sdot_acc_sat_scalar_i64"}> ({
  ^bb0(%arg9: i32, %arg10: i32, %arg11: i64):
    %3 = "spirv.SDotAccSat"(%arg9, %arg10, %arg11) <{format = #spirv.packed_vector_format<PackedVectorFormat4x8Bit>}> : (i32, i32, i64) -> i64
    "func.return"(%3) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi8>, vector<4xi8>, i32) -> i32, sym_name = "sdot_acc_sat_vector_4xi8"}> ({
  ^bb0(%arg6: vector<4xi8>, %arg7: vector<4xi8>, %arg8: i32):
    %2 = "spirv.SDotAccSat"(%arg6, %arg7, %arg8) : (vector<4xi8>, vector<4xi8>, i32) -> i32
    "func.return"(%2) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi16>, vector<4xi16>, i64) -> i64, sym_name = "sdot_acc_sat_vector_4xi16"}> ({
  ^bb0(%arg3: vector<4xi16>, %arg4: vector<4xi16>, %arg5: i64):
    %1 = "spirv.SDotAccSat"(%arg3, %arg4, %arg5) : (vector<4xi16>, vector<4xi16>, i64) -> i64
    "func.return"(%1) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi8>, vector<8xi8>, i64) -> i64, sym_name = "sdot_acc_sat_vector_8xi8"}> ({
  ^bb0(%arg0: vector<8xi8>, %arg1: vector<8xi8>, %arg2: i64):
    %0 = "spirv.SDotAccSat"(%arg0, %arg1, %arg2) : (vector<8xi8>, vector<8xi8>, i64) -> i64
    "func.return"(%0) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32, i32) -> i32, sym_name = "sudot_acc_sat_scalar_i32"}> ({
  ^bb0(%arg12: i32, %arg13: i32, %arg14: i32):
    %4 = "spirv.SUDotAccSat"(%arg12, %arg13, %arg14) <{format = #spirv.packed_vector_format<PackedVectorFormat4x8Bit>}> : (i32, i32, i32) -> i32
    "func.return"(%4) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i64) -> i64, sym_name = "sudot_acc_sat_scalar_i64"}> ({
  ^bb0(%arg9: i32, %arg10: i32, %arg11: i64):
    %3 = "spirv.SUDotAccSat"(%arg9, %arg10, %arg11) <{format = #spirv.packed_vector_format<PackedVectorFormat4x8Bit>}> : (i32, i32, i64) -> i64
    "func.return"(%3) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi8>, vector<4xi8>, i32) -> i32, sym_name = "sudot_acc_sat_vector_4xi8"}> ({
  ^bb0(%arg6: vector<4xi8>, %arg7: vector<4xi8>, %arg8: i32):
    %2 = "spirv.SUDotAccSat"(%arg6, %arg7, %arg8) : (vector<4xi8>, vector<4xi8>, i32) -> i32
    "func.return"(%2) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi16>, vector<4xi16>, i64) -> i64, sym_name = "sudot_acc_sat_vector_4xi16"}> ({
  ^bb0(%arg3: vector<4xi16>, %arg4: vector<4xi16>, %arg5: i64):
    %1 = "spirv.SUDotAccSat"(%arg3, %arg4, %arg5) : (vector<4xi16>, vector<4xi16>, i64) -> i64
    "func.return"(%1) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi8>, vector<8xi8>, i64) -> i64, sym_name = "sudot_acc_sat_vector_8xi8"}> ({
  ^bb0(%arg0: vector<8xi8>, %arg1: vector<8xi8>, %arg2: i64):
    %0 = "spirv.SUDotAccSat"(%arg0, %arg1, %arg2) : (vector<8xi8>, vector<8xi8>, i64) -> i64
    "func.return"(%0) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32, i32) -> i32, sym_name = "udot_acc_sat_scalar_i32"}> ({
  ^bb0(%arg12: i32, %arg13: i32, %arg14: i32):
    %4 = "spirv.UDotAccSat"(%arg12, %arg13, %arg14) <{format = #spirv.packed_vector_format<PackedVectorFormat4x8Bit>}> : (i32, i32, i32) -> i32
    "func.return"(%4) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i64) -> i64, sym_name = "udot_acc_sat_scalar_i64"}> ({
  ^bb0(%arg9: i32, %arg10: i32, %arg11: i64):
    %3 = "spirv.UDotAccSat"(%arg9, %arg10, %arg11) <{format = #spirv.packed_vector_format<PackedVectorFormat4x8Bit>}> : (i32, i32, i64) -> i64
    "func.return"(%3) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi8>, vector<4xi8>, i32) -> i32, sym_name = "udot_acc_sat_vector_4xi8"}> ({
  ^bb0(%arg6: vector<4xi8>, %arg7: vector<4xi8>, %arg8: i32):
    %2 = "spirv.UDotAccSat"(%arg6, %arg7, %arg8) : (vector<4xi8>, vector<4xi8>, i32) -> i32
    "func.return"(%2) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi16>, vector<4xi16>, i64) -> i64, sym_name = "udot_acc_sat_vector_4xi16"}> ({
  ^bb0(%arg3: vector<4xi16>, %arg4: vector<4xi16>, %arg5: i64):
    %1 = "spirv.UDotAccSat"(%arg3, %arg4, %arg5) : (vector<4xi16>, vector<4xi16>, i64) -> i64
    "func.return"(%1) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi8>, vector<8xi8>, i64) -> i64, sym_name = "udot_acc_sat_vector_8xi8"}> ({
  ^bb0(%arg0: vector<8xi8>, %arg1: vector<8xi8>, %arg2: i64):
    %0 = "spirv.UDotAccSat"(%arg0, %arg1, %arg2) : (vector<8xi8>, vector<8xi8>, i64) -> i64
    "func.return"(%0) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

