module {
  func.func @outerproduct_add_widening_2way_f16f16f32(%arg0: vector<[4]xf16>, %arg1: vector<[4]xf16>, %arg2: vector<[4]xf16>, %arg3: vector<[4]xf16>, %arg4: vector<[4]xi1>, %arg5: vector<[4]xi1>, %arg6: vector<[4]xi1>, %arg7: vector<[4]xi1>) -> vector<[4]x[4]xf32> {
    %0 = arith.extf %arg0 : vector<[4]xf16> to vector<[4]xf32>
    %1 = arith.extf %arg1 : vector<[4]xf16> to vector<[4]xf32>
    %2 = arith.extf %arg2 : vector<[4]xf16> to vector<[4]xf32>
    %3 = arith.extf %arg3 : vector<[4]xf16> to vector<[4]xf32>
    %cst = arith.constant dense<0.000000e+00> : vector<[4]x[4]xf32>
    %4 = arm_sme.outerproduct %0, %1 acc(%cst) masks(%arg4, %arg5) : vector<[4]xf32>, vector<[4]xf32>
    %5 = arm_sme.outerproduct %2, %3 acc(%4) masks(%arg6, %arg7) : vector<[4]xf32>, vector<[4]xf32>
    return %5 : vector<[4]x[4]xf32>
  }
}

// -----
module {
  func.func @outerproduct_x2_add_widening_2way_f16f16f32(%arg0: vector<[4]xf16>, %arg1: vector<[4]xf16>, %arg2: vector<[4]xf16>, %arg3: vector<[4]xf16>, %arg4: vector<[4]xf16>, %arg5: vector<[4]xf16>, %arg6: vector<[4]xf16>, %arg7: vector<[4]xf16>) -> vector<[4]x[4]xf32> {
    %0 = arith.extf %arg0 : vector<[4]xf16> to vector<[4]xf32>
    %1 = arith.extf %arg1 : vector<[4]xf16> to vector<[4]xf32>
    %2 = arith.extf %arg2 : vector<[4]xf16> to vector<[4]xf32>
    %3 = arith.extf %arg3 : vector<[4]xf16> to vector<[4]xf32>
    %4 = arith.extf %arg4 : vector<[4]xf16> to vector<[4]xf32>
    %5 = arith.extf %arg5 : vector<[4]xf16> to vector<[4]xf32>
    %6 = arith.extf %arg6 : vector<[4]xf16> to vector<[4]xf32>
    %7 = arith.extf %arg7 : vector<[4]xf16> to vector<[4]xf32>
    %8 = arm_sme.outerproduct %0, %1 : vector<[4]xf32>, vector<[4]xf32>
    %9 = arm_sme.outerproduct %2, %3 acc(%8) : vector<[4]xf32>, vector<[4]xf32>
    %10 = arm_sme.outerproduct %4, %5 acc(%9) : vector<[4]xf32>, vector<[4]xf32>
    %11 = arm_sme.outerproduct %6, %7 acc(%10) : vector<[4]xf32>, vector<[4]xf32>
    return %11 : vector<[4]x[4]xf32>
  }
}

// -----
module {
  func.func @outerproduct_sub_widening_2way_f16f16f32(%arg0: vector<[4]xf16>, %arg1: vector<[4]xf16>, %arg2: vector<[4]xf16>, %arg3: vector<[4]xf16>, %arg4: vector<[4]xi1>, %arg5: vector<[4]xi1>, %arg6: vector<[4]xi1>, %arg7: vector<[4]xi1>) -> vector<[4]x[4]xf32> {
    %0 = arith.extf %arg0 : vector<[4]xf16> to vector<[4]xf32>
    %1 = arith.extf %arg1 : vector<[4]xf16> to vector<[4]xf32>
    %2 = arith.extf %arg2 : vector<[4]xf16> to vector<[4]xf32>
    %3 = arith.extf %arg3 : vector<[4]xf16> to vector<[4]xf32>
    %cst = arith.constant dense<0.000000e+00> : vector<[4]x[4]xf32>
    %4 = arm_sme.outerproduct %0, %1 kind<sub> acc(%cst) masks(%arg4, %arg5) : vector<[4]xf32>, vector<[4]xf32>
    %5 = arm_sme.outerproduct %2, %3 kind<sub> acc(%4) masks(%arg6, %arg7) : vector<[4]xf32>, vector<[4]xf32>
    return %5 : vector<[4]x[4]xf32>
  }
}

// -----
module {
  func.func @outerproduct_add_widening_2way_bf16bf16f32(%arg0: vector<[4]xbf16>, %arg1: vector<[4]xbf16>, %arg2: vector<[4]xbf16>, %arg3: vector<[4]xbf16>, %arg4: vector<[4]xi1>, %arg5: vector<[4]xi1>, %arg6: vector<[4]xi1>, %arg7: vector<[4]xi1>) -> vector<[4]x[4]xf32> {
    %0 = arith.extf %arg0 : vector<[4]xbf16> to vector<[4]xf32>
    %1 = arith.extf %arg1 : vector<[4]xbf16> to vector<[4]xf32>
    %2 = arith.extf %arg2 : vector<[4]xbf16> to vector<[4]xf32>
    %3 = arith.extf %arg3 : vector<[4]xbf16> to vector<[4]xf32>
    %cst = arith.constant dense<0.000000e+00> : vector<[4]x[4]xf32>
    %4 = arm_sme.outerproduct %0, %1 acc(%cst) masks(%arg4, %arg5) : vector<[4]xf32>, vector<[4]xf32>
    %5 = arm_sme.outerproduct %2, %3 acc(%4) masks(%arg6, %arg7) : vector<[4]xf32>, vector<[4]xf32>
    return %5 : vector<[4]x[4]xf32>
  }
}

// -----
module {
  func.func @outerproduct_sub_widening_2way_bf16bf16f32(%arg0: vector<[4]xbf16>, %arg1: vector<[4]xbf16>, %arg2: vector<[4]xbf16>, %arg3: vector<[4]xbf16>, %arg4: vector<[4]xi1>, %arg5: vector<[4]xi1>, %arg6: vector<[4]xi1>, %arg7: vector<[4]xi1>) -> vector<[4]x[4]xf32> {
    %0 = arith.extf %arg0 : vector<[4]xbf16> to vector<[4]xf32>
    %1 = arith.extf %arg1 : vector<[4]xbf16> to vector<[4]xf32>
    %2 = arith.extf %arg2 : vector<[4]xbf16> to vector<[4]xf32>
    %3 = arith.extf %arg3 : vector<[4]xbf16> to vector<[4]xf32>
    %cst = arith.constant dense<0.000000e+00> : vector<[4]x[4]xf32>
    %4 = arm_sme.outerproduct %0, %1 kind<sub> acc(%cst) masks(%arg4, %arg5) : vector<[4]xf32>, vector<[4]xf32>
    %5 = arm_sme.outerproduct %2, %3 kind<sub> acc(%4) masks(%arg6, %arg7) : vector<[4]xf32>, vector<[4]xf32>
    return %5 : vector<[4]x[4]xf32>
  }
}

// -----
module {
  func.func @outerproduct_add_widening_2way_signed_i16i16i32(%arg0: vector<[4]xi16>, %arg1: vector<[4]xi16>, %arg2: vector<[4]xi16>, %arg3: vector<[4]xi16>, %arg4: vector<[4]xi1>, %arg5: vector<[4]xi1>, %arg6: vector<[4]xi1>, %arg7: vector<[4]xi1>) -> vector<[4]x[4]xi32> {
    %0 = arith.extsi %arg0 : vector<[4]xi16> to vector<[4]xi32>
    %1 = arith.extsi %arg1 : vector<[4]xi16> to vector<[4]xi32>
    %2 = arith.extsi %arg2 : vector<[4]xi16> to vector<[4]xi32>
    %3 = arith.extsi %arg3 : vector<[4]xi16> to vector<[4]xi32>
    %cst = arith.constant dense<0> : vector<[4]x[4]xi32>
    %4 = arm_sme.outerproduct %0, %1 acc(%cst) masks(%arg4, %arg5) : vector<[4]xi32>, vector<[4]xi32>
    %5 = arm_sme.outerproduct %2, %3 acc(%4) masks(%arg6, %arg7) : vector<[4]xi32>, vector<[4]xi32>
    return %5 : vector<[4]x[4]xi32>
  }
}

// -----
module {
  func.func @outerproduct_sub_widening_2way_signed_i16i16i32(%arg0: vector<[4]xi16>, %arg1: vector<[4]xi16>, %arg2: vector<[4]xi16>, %arg3: vector<[4]xi16>, %arg4: vector<[4]xi1>, %arg5: vector<[4]xi1>, %arg6: vector<[4]xi1>, %arg7: vector<[4]xi1>) -> vector<[4]x[4]xi32> {
    %0 = arith.extsi %arg0 : vector<[4]xi16> to vector<[4]xi32>
    %1 = arith.extsi %arg1 : vector<[4]xi16> to vector<[4]xi32>
    %2 = arith.extsi %arg2 : vector<[4]xi16> to vector<[4]xi32>
    %3 = arith.extsi %arg3 : vector<[4]xi16> to vector<[4]xi32>
    %cst = arith.constant dense<0> : vector<[4]x[4]xi32>
    %4 = arm_sme.outerproduct %0, %1 kind<sub> acc(%cst) masks(%arg4, %arg5) : vector<[4]xi32>, vector<[4]xi32>
    %5 = arm_sme.outerproduct %2, %3 kind<sub> acc(%4) masks(%arg6, %arg7) : vector<[4]xi32>, vector<[4]xi32>
    return %5 : vector<[4]x[4]xi32>
  }
}

// -----
module {
  func.func @outerproduct_add_widening_2way_unsigned_i16i16i32(%arg0: vector<[4]xi16>, %arg1: vector<[4]xi16>, %arg2: vector<[4]xi16>, %arg3: vector<[4]xi16>, %arg4: vector<[4]xi1>, %arg5: vector<[4]xi1>, %arg6: vector<[4]xi1>, %arg7: vector<[4]xi1>) -> vector<[4]x[4]xi32> {
    %0 = arith.extui %arg0 : vector<[4]xi16> to vector<[4]xi32>
    %1 = arith.extui %arg1 : vector<[4]xi16> to vector<[4]xi32>
    %2 = arith.extui %arg2 : vector<[4]xi16> to vector<[4]xi32>
    %3 = arith.extui %arg3 : vector<[4]xi16> to vector<[4]xi32>
    %cst = arith.constant dense<0> : vector<[4]x[4]xi32>
    %4 = arm_sme.outerproduct %0, %1 acc(%cst) masks(%arg4, %arg5) : vector<[4]xi32>, vector<[4]xi32>
    %5 = arm_sme.outerproduct %2, %3 acc(%4) masks(%arg6, %arg7) : vector<[4]xi32>, vector<[4]xi32>
    return %5 : vector<[4]x[4]xi32>
  }
}

// -----
module {
  func.func @outerproduct_sub_widening_2way_unsigned_i16i16i32(%arg0: vector<[4]xi16>, %arg1: vector<[4]xi16>, %arg2: vector<[4]xi16>, %arg3: vector<[4]xi16>, %arg4: vector<[4]xi1>, %arg5: vector<[4]xi1>, %arg6: vector<[4]xi1>, %arg7: vector<[4]xi1>) -> vector<[4]x[4]xi32> {
    %0 = arith.extui %arg0 : vector<[4]xi16> to vector<[4]xi32>
    %1 = arith.extui %arg1 : vector<[4]xi16> to vector<[4]xi32>
    %2 = arith.extui %arg2 : vector<[4]xi16> to vector<[4]xi32>
    %3 = arith.extui %arg3 : vector<[4]xi16> to vector<[4]xi32>
    %cst = arith.constant dense<0> : vector<[4]x[4]xi32>
    %4 = arm_sme.outerproduct %0, %1 kind<sub> acc(%cst) masks(%arg4, %arg5) : vector<[4]xi32>, vector<[4]xi32>
    %5 = arm_sme.outerproduct %2, %3 kind<sub> acc(%4) masks(%arg6, %arg7) : vector<[4]xi32>, vector<[4]xi32>
    return %5 : vector<[4]x[4]xi32>
  }
}

// -----
module {
  func.func @outerproduct_add_widening_4way_signed_i8i8i32(%arg0: vector<[4]xi8>, %arg1: vector<[4]xi8>, %arg2: vector<[4]xi8>, %arg3: vector<[4]xi8>, %arg4: vector<[4]xi8>, %arg5: vector<[4]xi8>, %arg6: vector<[4]xi8>, %arg7: vector<[4]xi8>, %arg8: vector<[4]xi1>, %arg9: vector<[4]xi1>, %arg10: vector<[4]xi1>, %arg11: vector<[4]xi1>, %arg12: vector<[4]xi1>, %arg13: vector<[4]xi1>, %arg14: vector<[4]xi1>, %arg15: vector<[4]xi1>) -> vector<[4]x[4]xi32> {
    %0 = arith.extsi %arg0 : vector<[4]xi8> to vector<[4]xi32>
    %1 = arith.extsi %arg1 : vector<[4]xi8> to vector<[4]xi32>
    %2 = arith.extsi %arg2 : vector<[4]xi8> to vector<[4]xi32>
    %3 = arith.extsi %arg3 : vector<[4]xi8> to vector<[4]xi32>
    %4 = arith.extsi %arg4 : vector<[4]xi8> to vector<[4]xi32>
    %5 = arith.extsi %arg5 : vector<[4]xi8> to vector<[4]xi32>
    %6 = arith.extsi %arg6 : vector<[4]xi8> to vector<[4]xi32>
    %7 = arith.extsi %arg7 : vector<[4]xi8> to vector<[4]xi32>
    %cst = arith.constant dense<0> : vector<[4]x[4]xi32>
    %8 = arm_sme.outerproduct %0, %1 acc(%cst) masks(%arg8, %arg9) : vector<[4]xi32>, vector<[4]xi32>
    %9 = arm_sme.outerproduct %2, %3 acc(%8) masks(%arg10, %arg11) : vector<[4]xi32>, vector<[4]xi32>
    %10 = arm_sme.outerproduct %4, %5 acc(%9) masks(%arg12, %arg13) : vector<[4]xi32>, vector<[4]xi32>
    %11 = arm_sme.outerproduct %6, %7 acc(%10) masks(%arg14, %arg15) : vector<[4]xi32>, vector<[4]xi32>
    return %11 : vector<[4]x[4]xi32>
  }
}

// -----
module {
  func.func @outerproduct_sub_widening_4way_signed_i8i8i32(%arg0: vector<[4]xi8>, %arg1: vector<[4]xi8>, %arg2: vector<[4]xi8>, %arg3: vector<[4]xi8>, %arg4: vector<[4]xi8>, %arg5: vector<[4]xi8>, %arg6: vector<[4]xi8>, %arg7: vector<[4]xi8>, %arg8: vector<[4]xi1>, %arg9: vector<[4]xi1>, %arg10: vector<[4]xi1>, %arg11: vector<[4]xi1>, %arg12: vector<[4]xi1>, %arg13: vector<[4]xi1>, %arg14: vector<[4]xi1>, %arg15: vector<[4]xi1>) -> vector<[4]x[4]xi32> {
    %0 = arith.extsi %arg0 : vector<[4]xi8> to vector<[4]xi32>
    %1 = arith.extsi %arg1 : vector<[4]xi8> to vector<[4]xi32>
    %2 = arith.extsi %arg2 : vector<[4]xi8> to vector<[4]xi32>
    %3 = arith.extsi %arg3 : vector<[4]xi8> to vector<[4]xi32>
    %4 = arith.extsi %arg4 : vector<[4]xi8> to vector<[4]xi32>
    %5 = arith.extsi %arg5 : vector<[4]xi8> to vector<[4]xi32>
    %6 = arith.extsi %arg6 : vector<[4]xi8> to vector<[4]xi32>
    %7 = arith.extsi %arg7 : vector<[4]xi8> to vector<[4]xi32>
    %cst = arith.constant dense<0> : vector<[4]x[4]xi32>
    %8 = arm_sme.outerproduct %0, %1 kind<sub> acc(%cst) masks(%arg8, %arg9) : vector<[4]xi32>, vector<[4]xi32>
    %9 = arm_sme.outerproduct %2, %3 kind<sub> acc(%8) masks(%arg10, %arg11) : vector<[4]xi32>, vector<[4]xi32>
    %10 = arm_sme.outerproduct %4, %5 kind<sub> acc(%9) masks(%arg12, %arg13) : vector<[4]xi32>, vector<[4]xi32>
    %11 = arm_sme.outerproduct %6, %7 kind<sub> acc(%10) masks(%arg14, %arg15) : vector<[4]xi32>, vector<[4]xi32>
    return %11 : vector<[4]x[4]xi32>
  }
}

// -----
module {
  func.func @outerproduct_add_widening_4way_signed_i16i16i64(%arg0: vector<[2]xi16>, %arg1: vector<[2]xi16>, %arg2: vector<[2]xi16>, %arg3: vector<[2]xi16>, %arg4: vector<[2]xi16>, %arg5: vector<[2]xi16>, %arg6: vector<[2]xi16>, %arg7: vector<[2]xi16>, %arg8: vector<[2]xi1>, %arg9: vector<[2]xi1>, %arg10: vector<[2]xi1>, %arg11: vector<[2]xi1>, %arg12: vector<[2]xi1>, %arg13: vector<[2]xi1>, %arg14: vector<[2]xi1>, %arg15: vector<[2]xi1>) -> vector<[2]x[2]xi64> {
    %0 = arith.extsi %arg0 : vector<[2]xi16> to vector<[2]xi64>
    %1 = arith.extsi %arg1 : vector<[2]xi16> to vector<[2]xi64>
    %2 = arith.extsi %arg2 : vector<[2]xi16> to vector<[2]xi64>
    %3 = arith.extsi %arg3 : vector<[2]xi16> to vector<[2]xi64>
    %4 = arith.extsi %arg4 : vector<[2]xi16> to vector<[2]xi64>
    %5 = arith.extsi %arg5 : vector<[2]xi16> to vector<[2]xi64>
    %6 = arith.extsi %arg6 : vector<[2]xi16> to vector<[2]xi64>
    %7 = arith.extsi %arg7 : vector<[2]xi16> to vector<[2]xi64>
    %cst = arith.constant dense<0> : vector<[2]x[2]xi64>
    %8 = arm_sme.outerproduct %0, %1 acc(%cst) masks(%arg8, %arg9) : vector<[2]xi64>, vector<[2]xi64>
    %9 = arm_sme.outerproduct %2, %3 acc(%8) masks(%arg10, %arg11) : vector<[2]xi64>, vector<[2]xi64>
    %10 = arm_sme.outerproduct %4, %5 acc(%9) masks(%arg12, %arg13) : vector<[2]xi64>, vector<[2]xi64>
    %11 = arm_sme.outerproduct %6, %7 acc(%10) masks(%arg14, %arg15) : vector<[2]xi64>, vector<[2]xi64>
    return %11 : vector<[2]x[2]xi64>
  }
}

// -----
module {
  func.func @outerproduct_sub_widening_4way_signed_i16i16i64(%arg0: vector<[2]xi16>, %arg1: vector<[2]xi16>, %arg2: vector<[2]xi16>, %arg3: vector<[2]xi16>, %arg4: vector<[2]xi16>, %arg5: vector<[2]xi16>, %arg6: vector<[2]xi16>, %arg7: vector<[2]xi16>, %arg8: vector<[2]xi1>, %arg9: vector<[2]xi1>, %arg10: vector<[2]xi1>, %arg11: vector<[2]xi1>, %arg12: vector<[2]xi1>, %arg13: vector<[2]xi1>, %arg14: vector<[2]xi1>, %arg15: vector<[2]xi1>) -> vector<[2]x[2]xi64> {
    %0 = arith.extsi %arg0 : vector<[2]xi16> to vector<[2]xi64>
    %1 = arith.extsi %arg1 : vector<[2]xi16> to vector<[2]xi64>
    %2 = arith.extsi %arg2 : vector<[2]xi16> to vector<[2]xi64>
    %3 = arith.extsi %arg3 : vector<[2]xi16> to vector<[2]xi64>
    %4 = arith.extsi %arg4 : vector<[2]xi16> to vector<[2]xi64>
    %5 = arith.extsi %arg5 : vector<[2]xi16> to vector<[2]xi64>
    %6 = arith.extsi %arg6 : vector<[2]xi16> to vector<[2]xi64>
    %7 = arith.extsi %arg7 : vector<[2]xi16> to vector<[2]xi64>
    %cst = arith.constant dense<0> : vector<[2]x[2]xi64>
    %8 = arm_sme.outerproduct %0, %1 kind<sub> acc(%cst) masks(%arg8, %arg9) : vector<[2]xi64>, vector<[2]xi64>
    %9 = arm_sme.outerproduct %2, %3 kind<sub> acc(%8) masks(%arg10, %arg11) : vector<[2]xi64>, vector<[2]xi64>
    %10 = arm_sme.outerproduct %4, %5 kind<sub> acc(%9) masks(%arg12, %arg13) : vector<[2]xi64>, vector<[2]xi64>
    %11 = arm_sme.outerproduct %6, %7 kind<sub> acc(%10) masks(%arg14, %arg15) : vector<[2]xi64>, vector<[2]xi64>
    return %11 : vector<[2]x[2]xi64>
  }
}

// -----
module {
  func.func @outerproduct_add_widening_4way_unsigned_i8i8i32(%arg0: vector<[4]xi8>, %arg1: vector<[4]xi8>, %arg2: vector<[4]xi8>, %arg3: vector<[4]xi8>, %arg4: vector<[4]xi8>, %arg5: vector<[4]xi8>, %arg6: vector<[4]xi8>, %arg7: vector<[4]xi8>, %arg8: vector<[4]xi1>, %arg9: vector<[4]xi1>, %arg10: vector<[4]xi1>, %arg11: vector<[4]xi1>, %arg12: vector<[4]xi1>, %arg13: vector<[4]xi1>, %arg14: vector<[4]xi1>, %arg15: vector<[4]xi1>) -> vector<[4]x[4]xi32> {
    %0 = arith.extui %arg0 : vector<[4]xi8> to vector<[4]xi32>
    %1 = arith.extui %arg1 : vector<[4]xi8> to vector<[4]xi32>
    %2 = arith.extui %arg2 : vector<[4]xi8> to vector<[4]xi32>
    %3 = arith.extui %arg3 : vector<[4]xi8> to vector<[4]xi32>
    %4 = arith.extui %arg4 : vector<[4]xi8> to vector<[4]xi32>
    %5 = arith.extui %arg5 : vector<[4]xi8> to vector<[4]xi32>
    %6 = arith.extui %arg6 : vector<[4]xi8> to vector<[4]xi32>
    %7 = arith.extui %arg7 : vector<[4]xi8> to vector<[4]xi32>
    %cst = arith.constant dense<0> : vector<[4]x[4]xi32>
    %8 = arm_sme.outerproduct %0, %1 acc(%cst) masks(%arg8, %arg9) : vector<[4]xi32>, vector<[4]xi32>
    %9 = arm_sme.outerproduct %2, %3 acc(%8) masks(%arg10, %arg11) : vector<[4]xi32>, vector<[4]xi32>
    %10 = arm_sme.outerproduct %4, %5 acc(%9) masks(%arg12, %arg13) : vector<[4]xi32>, vector<[4]xi32>
    %11 = arm_sme.outerproduct %6, %7 acc(%10) masks(%arg14, %arg15) : vector<[4]xi32>, vector<[4]xi32>
    return %11 : vector<[4]x[4]xi32>
  }
}

// -----
module {
  func.func @outerproduct_sub_widening_4way_unsigned_i8i8i32(%arg0: vector<[4]xi8>, %arg1: vector<[4]xi8>, %arg2: vector<[4]xi8>, %arg3: vector<[4]xi8>, %arg4: vector<[4]xi8>, %arg5: vector<[4]xi8>, %arg6: vector<[4]xi8>, %arg7: vector<[4]xi8>, %arg8: vector<[4]xi1>, %arg9: vector<[4]xi1>, %arg10: vector<[4]xi1>, %arg11: vector<[4]xi1>, %arg12: vector<[4]xi1>, %arg13: vector<[4]xi1>, %arg14: vector<[4]xi1>, %arg15: vector<[4]xi1>) -> vector<[4]x[4]xi32> {
    %0 = arith.extui %arg0 : vector<[4]xi8> to vector<[4]xi32>
    %1 = arith.extui %arg1 : vector<[4]xi8> to vector<[4]xi32>
    %2 = arith.extui %arg2 : vector<[4]xi8> to vector<[4]xi32>
    %3 = arith.extui %arg3 : vector<[4]xi8> to vector<[4]xi32>
    %4 = arith.extui %arg4 : vector<[4]xi8> to vector<[4]xi32>
    %5 = arith.extui %arg5 : vector<[4]xi8> to vector<[4]xi32>
    %6 = arith.extui %arg6 : vector<[4]xi8> to vector<[4]xi32>
    %7 = arith.extui %arg7 : vector<[4]xi8> to vector<[4]xi32>
    %cst = arith.constant dense<0> : vector<[4]x[4]xi32>
    %8 = arm_sme.outerproduct %0, %1 kind<sub> acc(%cst) masks(%arg8, %arg9) : vector<[4]xi32>, vector<[4]xi32>
    %9 = arm_sme.outerproduct %2, %3 kind<sub> acc(%8) masks(%arg10, %arg11) : vector<[4]xi32>, vector<[4]xi32>
    %10 = arm_sme.outerproduct %4, %5 kind<sub> acc(%9) masks(%arg12, %arg13) : vector<[4]xi32>, vector<[4]xi32>
    %11 = arm_sme.outerproduct %6, %7 kind<sub> acc(%10) masks(%arg14, %arg15) : vector<[4]xi32>, vector<[4]xi32>
    return %11 : vector<[4]x[4]xi32>
  }
}

// -----
module {
  func.func @outerproduct_add_widening_4way_unsigned_i16i16i64(%arg0: vector<[2]xi16>, %arg1: vector<[2]xi16>, %arg2: vector<[2]xi16>, %arg3: vector<[2]xi16>, %arg4: vector<[2]xi16>, %arg5: vector<[2]xi16>, %arg6: vector<[2]xi16>, %arg7: vector<[2]xi16>, %arg8: vector<[2]xi1>, %arg9: vector<[2]xi1>, %arg10: vector<[2]xi1>, %arg11: vector<[2]xi1>, %arg12: vector<[2]xi1>, %arg13: vector<[2]xi1>, %arg14: vector<[2]xi1>, %arg15: vector<[2]xi1>) -> vector<[2]x[2]xi64> {
    %0 = arith.extui %arg0 : vector<[2]xi16> to vector<[2]xi64>
    %1 = arith.extui %arg1 : vector<[2]xi16> to vector<[2]xi64>
    %2 = arith.extui %arg2 : vector<[2]xi16> to vector<[2]xi64>
    %3 = arith.extui %arg3 : vector<[2]xi16> to vector<[2]xi64>
    %4 = arith.extui %arg4 : vector<[2]xi16> to vector<[2]xi64>
    %5 = arith.extui %arg5 : vector<[2]xi16> to vector<[2]xi64>
    %6 = arith.extui %arg6 : vector<[2]xi16> to vector<[2]xi64>
    %7 = arith.extui %arg7 : vector<[2]xi16> to vector<[2]xi64>
    %cst = arith.constant dense<0> : vector<[2]x[2]xi64>
    %8 = arm_sme.outerproduct %0, %1 acc(%cst) masks(%arg8, %arg9) : vector<[2]xi64>, vector<[2]xi64>
    %9 = arm_sme.outerproduct %2, %3 acc(%8) masks(%arg10, %arg11) : vector<[2]xi64>, vector<[2]xi64>
    %10 = arm_sme.outerproduct %4, %5 acc(%9) masks(%arg12, %arg13) : vector<[2]xi64>, vector<[2]xi64>
    %11 = arm_sme.outerproduct %6, %7 acc(%10) masks(%arg14, %arg15) : vector<[2]xi64>, vector<[2]xi64>
    return %11 : vector<[2]x[2]xi64>
  }
}

// -----
module {
  func.func @outerproduct_sub_widening_4way_unsigned_i16i16i64(%arg0: vector<[2]xi16>, %arg1: vector<[2]xi16>, %arg2: vector<[2]xi16>, %arg3: vector<[2]xi16>, %arg4: vector<[2]xi16>, %arg5: vector<[2]xi16>, %arg6: vector<[2]xi16>, %arg7: vector<[2]xi16>, %arg8: vector<[2]xi1>, %arg9: vector<[2]xi1>, %arg10: vector<[2]xi1>, %arg11: vector<[2]xi1>, %arg12: vector<[2]xi1>, %arg13: vector<[2]xi1>, %arg14: vector<[2]xi1>, %arg15: vector<[2]xi1>) -> vector<[2]x[2]xi64> {
    %0 = arith.extui %arg0 : vector<[2]xi16> to vector<[2]xi64>
    %1 = arith.extui %arg1 : vector<[2]xi16> to vector<[2]xi64>
    %2 = arith.extui %arg2 : vector<[2]xi16> to vector<[2]xi64>
    %3 = arith.extui %arg3 : vector<[2]xi16> to vector<[2]xi64>
    %4 = arith.extui %arg4 : vector<[2]xi16> to vector<[2]xi64>
    %5 = arith.extui %arg5 : vector<[2]xi16> to vector<[2]xi64>
    %6 = arith.extui %arg6 : vector<[2]xi16> to vector<[2]xi64>
    %7 = arith.extui %arg7 : vector<[2]xi16> to vector<[2]xi64>
    %cst = arith.constant dense<0> : vector<[2]x[2]xi64>
    %8 = arm_sme.outerproduct %0, %1 kind<sub> acc(%cst) masks(%arg8, %arg9) : vector<[2]xi64>, vector<[2]xi64>
    %9 = arm_sme.outerproduct %2, %3 kind<sub> acc(%8) masks(%arg10, %arg11) : vector<[2]xi64>, vector<[2]xi64>
    %10 = arm_sme.outerproduct %4, %5 kind<sub> acc(%9) masks(%arg12, %arg13) : vector<[2]xi64>, vector<[2]xi64>
    %11 = arm_sme.outerproduct %6, %7 kind<sub> acc(%10) masks(%arg14, %arg15) : vector<[2]xi64>, vector<[2]xi64>
    return %11 : vector<[2]x[2]xi64>
  }
}

// -----
module {
  func.func @outerproduct_add_widening_4way_signed_by_unsigned_i8i8i32(%arg0: vector<[4]xi8>, %arg1: vector<[4]xi8>, %arg2: vector<[4]xi8>, %arg3: vector<[4]xi8>, %arg4: vector<[4]xi8>, %arg5: vector<[4]xi8>, %arg6: vector<[4]xi8>, %arg7: vector<[4]xi8>, %arg8: vector<[4]xi1>, %arg9: vector<[4]xi1>, %arg10: vector<[4]xi1>, %arg11: vector<[4]xi1>, %arg12: vector<[4]xi1>, %arg13: vector<[4]xi1>, %arg14: vector<[4]xi1>, %arg15: vector<[4]xi1>) -> vector<[4]x[4]xi32> {
    %0 = arith.extsi %arg0 : vector<[4]xi8> to vector<[4]xi32>
    %1 = arith.extui %arg1 : vector<[4]xi8> to vector<[4]xi32>
    %2 = arith.extsi %arg2 : vector<[4]xi8> to vector<[4]xi32>
    %3 = arith.extui %arg3 : vector<[4]xi8> to vector<[4]xi32>
    %4 = arith.extsi %arg4 : vector<[4]xi8> to vector<[4]xi32>
    %5 = arith.extui %arg5 : vector<[4]xi8> to vector<[4]xi32>
    %6 = arith.extsi %arg6 : vector<[4]xi8> to vector<[4]xi32>
    %7 = arith.extui %arg7 : vector<[4]xi8> to vector<[4]xi32>
    %cst = arith.constant dense<0> : vector<[4]x[4]xi32>
    %8 = arm_sme.outerproduct %0, %1 acc(%cst) masks(%arg8, %arg9) : vector<[4]xi32>, vector<[4]xi32>
    %9 = arm_sme.outerproduct %2, %3 acc(%8) masks(%arg10, %arg11) : vector<[4]xi32>, vector<[4]xi32>
    %10 = arm_sme.outerproduct %4, %5 acc(%9) masks(%arg12, %arg13) : vector<[4]xi32>, vector<[4]xi32>
    %11 = arm_sme.outerproduct %6, %7 acc(%10) masks(%arg14, %arg15) : vector<[4]xi32>, vector<[4]xi32>
    return %11 : vector<[4]x[4]xi32>
  }
}

// -----
module {
  func.func @outerproduct_sub_widening_4way_signed_by_unsigned_i8i8i32(%arg0: vector<[4]xi8>, %arg1: vector<[4]xi8>, %arg2: vector<[4]xi8>, %arg3: vector<[4]xi8>, %arg4: vector<[4]xi8>, %arg5: vector<[4]xi8>, %arg6: vector<[4]xi8>, %arg7: vector<[4]xi8>, %arg8: vector<[4]xi1>, %arg9: vector<[4]xi1>, %arg10: vector<[4]xi1>, %arg11: vector<[4]xi1>, %arg12: vector<[4]xi1>, %arg13: vector<[4]xi1>, %arg14: vector<[4]xi1>, %arg15: vector<[4]xi1>) -> vector<[4]x[4]xi32> {
    %0 = arith.extsi %arg0 : vector<[4]xi8> to vector<[4]xi32>
    %1 = arith.extui %arg1 : vector<[4]xi8> to vector<[4]xi32>
    %2 = arith.extsi %arg2 : vector<[4]xi8> to vector<[4]xi32>
    %3 = arith.extui %arg3 : vector<[4]xi8> to vector<[4]xi32>
    %4 = arith.extsi %arg4 : vector<[4]xi8> to vector<[4]xi32>
    %5 = arith.extui %arg5 : vector<[4]xi8> to vector<[4]xi32>
    %6 = arith.extsi %arg6 : vector<[4]xi8> to vector<[4]xi32>
    %7 = arith.extui %arg7 : vector<[4]xi8> to vector<[4]xi32>
    %cst = arith.constant dense<0> : vector<[4]x[4]xi32>
    %8 = arm_sme.outerproduct %0, %1 kind<sub> acc(%cst) masks(%arg8, %arg9) : vector<[4]xi32>, vector<[4]xi32>
    %9 = arm_sme.outerproduct %2, %3 kind<sub> acc(%8) masks(%arg10, %arg11) : vector<[4]xi32>, vector<[4]xi32>
    %10 = arm_sme.outerproduct %4, %5 kind<sub> acc(%9) masks(%arg12, %arg13) : vector<[4]xi32>, vector<[4]xi32>
    %11 = arm_sme.outerproduct %6, %7 kind<sub> acc(%10) masks(%arg14, %arg15) : vector<[4]xi32>, vector<[4]xi32>
    return %11 : vector<[4]x[4]xi32>
  }
}

// -----
module {
  func.func @outerproduct_add_widening_4way_signed_by_unsigned_i16i16i64(%arg0: vector<[2]xi16>, %arg1: vector<[2]xi16>, %arg2: vector<[2]xi16>, %arg3: vector<[2]xi16>, %arg4: vector<[2]xi16>, %arg5: vector<[2]xi16>, %arg6: vector<[2]xi16>, %arg7: vector<[2]xi16>, %arg8: vector<[2]xi1>, %arg9: vector<[2]xi1>, %arg10: vector<[2]xi1>, %arg11: vector<[2]xi1>, %arg12: vector<[2]xi1>, %arg13: vector<[2]xi1>, %arg14: vector<[2]xi1>, %arg15: vector<[2]xi1>) -> vector<[2]x[2]xi64> {
    %0 = arith.extsi %arg0 : vector<[2]xi16> to vector<[2]xi64>
    %1 = arith.extui %arg1 : vector<[2]xi16> to vector<[2]xi64>
    %2 = arith.extsi %arg2 : vector<[2]xi16> to vector<[2]xi64>
    %3 = arith.extui %arg3 : vector<[2]xi16> to vector<[2]xi64>
    %4 = arith.extsi %arg4 : vector<[2]xi16> to vector<[2]xi64>
    %5 = arith.extui %arg5 : vector<[2]xi16> to vector<[2]xi64>
    %6 = arith.extsi %arg6 : vector<[2]xi16> to vector<[2]xi64>
    %7 = arith.extui %arg7 : vector<[2]xi16> to vector<[2]xi64>
    %cst = arith.constant dense<0> : vector<[2]x[2]xi64>
    %8 = arm_sme.outerproduct %0, %1 acc(%cst) masks(%arg8, %arg9) : vector<[2]xi64>, vector<[2]xi64>
    %9 = arm_sme.outerproduct %2, %3 acc(%8) masks(%arg10, %arg11) : vector<[2]xi64>, vector<[2]xi64>
    %10 = arm_sme.outerproduct %4, %5 acc(%9) masks(%arg12, %arg13) : vector<[2]xi64>, vector<[2]xi64>
    %11 = arm_sme.outerproduct %6, %7 acc(%10) masks(%arg14, %arg15) : vector<[2]xi64>, vector<[2]xi64>
    return %11 : vector<[2]x[2]xi64>
  }
}

// -----
module {
  func.func @outerproduct_sub_widening_4way_signed_by_unsigned_i16i16i64(%arg0: vector<[2]xi16>, %arg1: vector<[2]xi16>, %arg2: vector<[2]xi16>, %arg3: vector<[2]xi16>, %arg4: vector<[2]xi16>, %arg5: vector<[2]xi16>, %arg6: vector<[2]xi16>, %arg7: vector<[2]xi16>, %arg8: vector<[2]xi1>, %arg9: vector<[2]xi1>, %arg10: vector<[2]xi1>, %arg11: vector<[2]xi1>, %arg12: vector<[2]xi1>, %arg13: vector<[2]xi1>, %arg14: vector<[2]xi1>, %arg15: vector<[2]xi1>) -> vector<[2]x[2]xi64> {
    %0 = arith.extsi %arg0 : vector<[2]xi16> to vector<[2]xi64>
    %1 = arith.extui %arg1 : vector<[2]xi16> to vector<[2]xi64>
    %2 = arith.extsi %arg2 : vector<[2]xi16> to vector<[2]xi64>
    %3 = arith.extui %arg3 : vector<[2]xi16> to vector<[2]xi64>
    %4 = arith.extsi %arg4 : vector<[2]xi16> to vector<[2]xi64>
    %5 = arith.extui %arg5 : vector<[2]xi16> to vector<[2]xi64>
    %6 = arith.extsi %arg6 : vector<[2]xi16> to vector<[2]xi64>
    %7 = arith.extui %arg7 : vector<[2]xi16> to vector<[2]xi64>
    %cst = arith.constant dense<0> : vector<[2]x[2]xi64>
    %8 = arm_sme.outerproduct %0, %1 kind<sub> acc(%cst) masks(%arg8, %arg9) : vector<[2]xi64>, vector<[2]xi64>
    %9 = arm_sme.outerproduct %2, %3 kind<sub> acc(%8) masks(%arg10, %arg11) : vector<[2]xi64>, vector<[2]xi64>
    %10 = arm_sme.outerproduct %4, %5 kind<sub> acc(%9) masks(%arg12, %arg13) : vector<[2]xi64>, vector<[2]xi64>
    %11 = arm_sme.outerproduct %6, %7 kind<sub> acc(%10) masks(%arg14, %arg15) : vector<[2]xi64>, vector<[2]xi64>
    return %11 : vector<[2]x[2]xi64>
  }
}

// -----
module {
  func.func @outerproduct_add_widening_4way_unsigned_by_signed_i8i8i32(%arg0: vector<[4]xi8>, %arg1: vector<[4]xi8>, %arg2: vector<[4]xi8>, %arg3: vector<[4]xi8>, %arg4: vector<[4]xi8>, %arg5: vector<[4]xi8>, %arg6: vector<[4]xi8>, %arg7: vector<[4]xi8>, %arg8: vector<[4]xi1>, %arg9: vector<[4]xi1>, %arg10: vector<[4]xi1>, %arg11: vector<[4]xi1>, %arg12: vector<[4]xi1>, %arg13: vector<[4]xi1>, %arg14: vector<[4]xi1>, %arg15: vector<[4]xi1>) -> vector<[4]x[4]xi32> {
    %0 = arith.extui %arg0 : vector<[4]xi8> to vector<[4]xi32>
    %1 = arith.extsi %arg1 : vector<[4]xi8> to vector<[4]xi32>
    %2 = arith.extui %arg2 : vector<[4]xi8> to vector<[4]xi32>
    %3 = arith.extsi %arg3 : vector<[4]xi8> to vector<[4]xi32>
    %4 = arith.extui %arg4 : vector<[4]xi8> to vector<[4]xi32>
    %5 = arith.extsi %arg5 : vector<[4]xi8> to vector<[4]xi32>
    %6 = arith.extui %arg6 : vector<[4]xi8> to vector<[4]xi32>
    %7 = arith.extsi %arg7 : vector<[4]xi8> to vector<[4]xi32>
    %cst = arith.constant dense<0> : vector<[4]x[4]xi32>
    %8 = arm_sme.outerproduct %0, %1 acc(%cst) masks(%arg8, %arg9) : vector<[4]xi32>, vector<[4]xi32>
    %9 = arm_sme.outerproduct %2, %3 acc(%8) masks(%arg10, %arg11) : vector<[4]xi32>, vector<[4]xi32>
    %10 = arm_sme.outerproduct %4, %5 acc(%9) masks(%arg12, %arg13) : vector<[4]xi32>, vector<[4]xi32>
    %11 = arm_sme.outerproduct %6, %7 acc(%10) masks(%arg14, %arg15) : vector<[4]xi32>, vector<[4]xi32>
    return %11 : vector<[4]x[4]xi32>
  }
}

// -----
module {
  func.func @outerproduct_sub_widening_4way_unsigned_by_signed_i8i8i32(%arg0: vector<[4]xi8>, %arg1: vector<[4]xi8>, %arg2: vector<[4]xi8>, %arg3: vector<[4]xi8>, %arg4: vector<[4]xi8>, %arg5: vector<[4]xi8>, %arg6: vector<[4]xi8>, %arg7: vector<[4]xi8>, %arg8: vector<[4]xi1>, %arg9: vector<[4]xi1>, %arg10: vector<[4]xi1>, %arg11: vector<[4]xi1>, %arg12: vector<[4]xi1>, %arg13: vector<[4]xi1>, %arg14: vector<[4]xi1>, %arg15: vector<[4]xi1>) -> vector<[4]x[4]xi32> {
    %0 = arith.extui %arg0 : vector<[4]xi8> to vector<[4]xi32>
    %1 = arith.extsi %arg1 : vector<[4]xi8> to vector<[4]xi32>
    %2 = arith.extui %arg2 : vector<[4]xi8> to vector<[4]xi32>
    %3 = arith.extsi %arg3 : vector<[4]xi8> to vector<[4]xi32>
    %4 = arith.extui %arg4 : vector<[4]xi8> to vector<[4]xi32>
    %5 = arith.extsi %arg5 : vector<[4]xi8> to vector<[4]xi32>
    %6 = arith.extui %arg6 : vector<[4]xi8> to vector<[4]xi32>
    %7 = arith.extsi %arg7 : vector<[4]xi8> to vector<[4]xi32>
    %cst = arith.constant dense<0> : vector<[4]x[4]xi32>
    %8 = arm_sme.outerproduct %0, %1 kind<sub> acc(%cst) masks(%arg8, %arg9) : vector<[4]xi32>, vector<[4]xi32>
    %9 = arm_sme.outerproduct %2, %3 kind<sub> acc(%8) masks(%arg10, %arg11) : vector<[4]xi32>, vector<[4]xi32>
    %10 = arm_sme.outerproduct %4, %5 kind<sub> acc(%9) masks(%arg12, %arg13) : vector<[4]xi32>, vector<[4]xi32>
    %11 = arm_sme.outerproduct %6, %7 kind<sub> acc(%10) masks(%arg14, %arg15) : vector<[4]xi32>, vector<[4]xi32>
    return %11 : vector<[4]x[4]xi32>
  }
}

// -----
module {
  func.func @outerproduct_add_widening_4way_unsigned_by_signed_i16i16i64(%arg0: vector<[2]xi16>, %arg1: vector<[2]xi16>, %arg2: vector<[2]xi16>, %arg3: vector<[2]xi16>, %arg4: vector<[2]xi16>, %arg5: vector<[2]xi16>, %arg6: vector<[2]xi16>, %arg7: vector<[2]xi16>, %arg8: vector<[2]xi1>, %arg9: vector<[2]xi1>, %arg10: vector<[2]xi1>, %arg11: vector<[2]xi1>, %arg12: vector<[2]xi1>, %arg13: vector<[2]xi1>, %arg14: vector<[2]xi1>, %arg15: vector<[2]xi1>) -> vector<[2]x[2]xi64> {
    %0 = arith.extui %arg0 : vector<[2]xi16> to vector<[2]xi64>
    %1 = arith.extsi %arg1 : vector<[2]xi16> to vector<[2]xi64>
    %2 = arith.extui %arg2 : vector<[2]xi16> to vector<[2]xi64>
    %3 = arith.extsi %arg3 : vector<[2]xi16> to vector<[2]xi64>
    %4 = arith.extui %arg4 : vector<[2]xi16> to vector<[2]xi64>
    %5 = arith.extsi %arg5 : vector<[2]xi16> to vector<[2]xi64>
    %6 = arith.extui %arg6 : vector<[2]xi16> to vector<[2]xi64>
    %7 = arith.extsi %arg7 : vector<[2]xi16> to vector<[2]xi64>
    %cst = arith.constant dense<0> : vector<[2]x[2]xi64>
    %8 = arm_sme.outerproduct %0, %1 acc(%cst) masks(%arg8, %arg9) : vector<[2]xi64>, vector<[2]xi64>
    %9 = arm_sme.outerproduct %2, %3 acc(%8) masks(%arg10, %arg11) : vector<[2]xi64>, vector<[2]xi64>
    %10 = arm_sme.outerproduct %4, %5 acc(%9) masks(%arg12, %arg13) : vector<[2]xi64>, vector<[2]xi64>
    %11 = arm_sme.outerproduct %6, %7 acc(%10) masks(%arg14, %arg15) : vector<[2]xi64>, vector<[2]xi64>
    return %11 : vector<[2]x[2]xi64>
  }
}

// -----
module {
  func.func @outerproduct_sub_widening_4way_unsigned_by_signed_i16i16i64(%arg0: vector<[2]xi16>, %arg1: vector<[2]xi16>, %arg2: vector<[2]xi16>, %arg3: vector<[2]xi16>, %arg4: vector<[2]xi16>, %arg5: vector<[2]xi16>, %arg6: vector<[2]xi16>, %arg7: vector<[2]xi16>, %arg8: vector<[2]xi1>, %arg9: vector<[2]xi1>, %arg10: vector<[2]xi1>, %arg11: vector<[2]xi1>, %arg12: vector<[2]xi1>, %arg13: vector<[2]xi1>, %arg14: vector<[2]xi1>, %arg15: vector<[2]xi1>) -> vector<[2]x[2]xi64> {
    %0 = arith.extui %arg0 : vector<[2]xi16> to vector<[2]xi64>
    %1 = arith.extsi %arg1 : vector<[2]xi16> to vector<[2]xi64>
    %2 = arith.extui %arg2 : vector<[2]xi16> to vector<[2]xi64>
    %3 = arith.extsi %arg3 : vector<[2]xi16> to vector<[2]xi64>
    %4 = arith.extui %arg4 : vector<[2]xi16> to vector<[2]xi64>
    %5 = arith.extsi %arg5 : vector<[2]xi16> to vector<[2]xi64>
    %6 = arith.extui %arg6 : vector<[2]xi16> to vector<[2]xi64>
    %7 = arith.extsi %arg7 : vector<[2]xi16> to vector<[2]xi64>
    %cst = arith.constant dense<0> : vector<[2]x[2]xi64>
    %8 = arm_sme.outerproduct %0, %1 kind<sub> acc(%cst) masks(%arg8, %arg9) : vector<[2]xi64>, vector<[2]xi64>
    %9 = arm_sme.outerproduct %2, %3 kind<sub> acc(%8) masks(%arg10, %arg11) : vector<[2]xi64>, vector<[2]xi64>
    %10 = arm_sme.outerproduct %4, %5 kind<sub> acc(%9) masks(%arg12, %arg13) : vector<[2]xi64>, vector<[2]xi64>
    %11 = arm_sme.outerproduct %6, %7 kind<sub> acc(%10) masks(%arg14, %arg15) : vector<[2]xi64>, vector<[2]xi64>
    return %11 : vector<[2]x[2]xi64>
  }
}

// -----
module {
  func.func @extract_from_arith_ext(%arg0: vector<4x[8]xi8>) -> vector<[8]xi32> {
    %0 = arith.extsi %arg0 : vector<4x[8]xi8> to vector<4x[8]xi32>
    %1 = vector.extract %0[0] : vector<[8]xi32> from vector<4x[8]xi32>
    return %1 : vector<[8]xi32>
  }
}

// -----
module {
  func.func @non_constant_extract_from_arith_ext(%arg0: vector<4x[8]xi8>, %arg1: index) -> vector<[8]xi32> {
    %0 = arith.extui %arg0 : vector<4x[8]xi8> to vector<4x[8]xi32>
    %1 = vector.extract %0[%arg1] : vector<[8]xi32> from vector<4x[8]xi32>
    return %1 : vector<[8]xi32>
  }
}

// -----
module {
  func.func @scalable_extract_from_arith_ext(%arg0: vector<[8]xf16>) -> vector<[4]xf32> {
    %0 = arith.extf %arg0 : vector<[8]xf16> to vector<[8]xf32>
    %1 = vector.scalable.extract %0[0] : vector<[4]xf32> from vector<[8]xf32>
    return %1 : vector<[4]xf32>
  }
}

// -----
module {
  func.func @outerproduct_widening_2way__no_acc(%arg0: vector<[4]xf16>, %arg1: vector<[4]xf16>) -> vector<[4]x[4]xf32> {
    %0 = arith.extf %arg0 : vector<[4]xf16> to vector<[4]xf32>
    %1 = arith.extf %arg1 : vector<[4]xf16> to vector<[4]xf32>
    %2 = arm_sme.outerproduct %0, %1 : vector<[4]xf32>, vector<[4]xf32>
    return %2 : vector<[4]x[4]xf32>
  }
}

// -----
module {
  func.func @outerproduct_widening_4way__no_acc(%arg0: vector<[4]xi8>, %arg1: vector<[4]xi8>, %arg2: vector<[4]xi8>, %arg3: vector<[4]xi8>, %arg4: vector<[4]xi8>, %arg5: vector<[4]xi8>) -> vector<[4]x[4]xi32> {
    %0 = arith.extsi %arg0 : vector<[4]xi8> to vector<[4]xi32>
    %1 = arith.extsi %arg1 : vector<[4]xi8> to vector<[4]xi32>
    %2 = arith.extsi %arg2 : vector<[4]xi8> to vector<[4]xi32>
    %3 = arith.extsi %arg3 : vector<[4]xi8> to vector<[4]xi32>
    %4 = arith.extsi %arg4 : vector<[4]xi8> to vector<[4]xi32>
    %5 = arith.extsi %arg5 : vector<[4]xi8> to vector<[4]xi32>
    %6 = arm_sme.outerproduct %0, %1 : vector<[4]xi32>, vector<[4]xi32>
    %7 = arm_sme.outerproduct %2, %3 acc(%6) : vector<[4]xi32>, vector<[4]xi32>
    %8 = arm_sme.outerproduct %4, %5 acc(%7) : vector<[4]xi32>, vector<[4]xi32>
    return %8 : vector<[4]x[4]xi32>
  }
}

// -----
module {
  func.func @outerproduct_widening_2way__bad_acc(%arg0: vector<[4]xf16>, %arg1: vector<[4]xf16>, %arg2: vector<[4]x[4]xf32>) -> vector<[4]x[4]xf32> {
    %0 = arith.extf %arg0 : vector<[4]xf16> to vector<[4]xf32>
    %1 = arith.extf %arg1 : vector<[4]xf16> to vector<[4]xf32>
    %2 = arm_sme.outerproduct %0, %1 acc(%arg2) : vector<[4]xf32>, vector<[4]xf32>
    return %2 : vector<[4]x[4]xf32>
  }
}

// -----
module {
  func.func @outerproduct_widening_4way__missing_acc(%arg0: vector<[4]xi8>, %arg1: vector<[4]xi8>, %arg2: vector<[4]xi8>, %arg3: vector<[4]xi8>, %arg4: vector<[4]xi8>, %arg5: vector<[4]xi8>, %arg6: vector<[4]xi8>, %arg7: vector<[4]xi8>) -> vector<[4]x[4]xi32> {
    %0 = arith.extsi %arg0 : vector<[4]xi8> to vector<[4]xi32>
    %1 = arith.extsi %arg1 : vector<[4]xi8> to vector<[4]xi32>
    %2 = arith.extsi %arg2 : vector<[4]xi8> to vector<[4]xi32>
    %3 = arith.extsi %arg3 : vector<[4]xi8> to vector<[4]xi32>
    %4 = arith.extsi %arg4 : vector<[4]xi8> to vector<[4]xi32>
    %5 = arith.extsi %arg5 : vector<[4]xi8> to vector<[4]xi32>
    %6 = arith.extsi %arg6 : vector<[4]xi8> to vector<[4]xi32>
    %7 = arith.extsi %arg7 : vector<[4]xi8> to vector<[4]xi32>
    %8 = arm_sme.outerproduct %0, %1 : vector<[4]xi32>, vector<[4]xi32>
    %9 = arm_sme.outerproduct %2, %3 acc(%8) : vector<[4]xi32>, vector<[4]xi32>
    %10 = arm_sme.outerproduct %4, %5 acc(%9) : vector<[4]xi32>, vector<[4]xi32>
    %11 = arm_sme.outerproduct %6, %7 : vector<[4]xi32>, vector<[4]xi32>
    "test.some_use"(%10) : (vector<[4]x[4]xi32>) -> ()
    return %11 : vector<[4]x[4]xi32>
  }
}

// -----
module {
  func.func @outerproduct_widening_2way__bad_combining_kind(%arg0: vector<[4]xf16>, %arg1: vector<[4]xf16>, %arg2: vector<[4]xf16>, %arg3: vector<[4]xf16>) -> vector<[4]x[4]xf32> {
    %0 = arith.extf %arg0 : vector<[4]xf16> to vector<[4]xf32>
    %1 = arith.extf %arg1 : vector<[4]xf16> to vector<[4]xf32>
    %2 = arith.extf %arg2 : vector<[4]xf16> to vector<[4]xf32>
    %3 = arith.extf %arg3 : vector<[4]xf16> to vector<[4]xf32>
    %4 = arm_sme.outerproduct %0, %1 : vector<[4]xf32>, vector<[4]xf32>
    %5 = arm_sme.outerproduct %2, %3 kind<sub> acc(%4) : vector<[4]xf32>, vector<[4]xf32>
    return %5 : vector<[4]x[4]xf32>
  }
}

// -----
module {
  func.func @outerproduct_widening_4way__inconsistent_combining_kind(%arg0: vector<[4]xi8>, %arg1: vector<[4]xi8>, %arg2: vector<[4]xi8>, %arg3: vector<[4]xi8>, %arg4: vector<[4]xi8>, %arg5: vector<[4]xi8>, %arg6: vector<[4]xi8>, %arg7: vector<[4]xi8>) -> vector<[4]x[4]xi32> {
    %0 = arith.extsi %arg0 : vector<[4]xi8> to vector<[4]xi32>
    %1 = arith.extsi %arg1 : vector<[4]xi8> to vector<[4]xi32>
    %2 = arith.extsi %arg2 : vector<[4]xi8> to vector<[4]xi32>
    %3 = arith.extsi %arg3 : vector<[4]xi8> to vector<[4]xi32>
    %4 = arith.extsi %arg4 : vector<[4]xi8> to vector<[4]xi32>
    %5 = arith.extsi %arg5 : vector<[4]xi8> to vector<[4]xi32>
    %6 = arith.extsi %arg6 : vector<[4]xi8> to vector<[4]xi32>
    %7 = arith.extsi %arg7 : vector<[4]xi8> to vector<[4]xi32>
    %8 = arm_sme.outerproduct %0, %1 kind<sub> : vector<[4]xi32>, vector<[4]xi32>
    %9 = arm_sme.outerproduct %2, %3 acc(%8) : vector<[4]xi32>, vector<[4]xi32>
    %10 = arm_sme.outerproduct %4, %5 acc(%9) : vector<[4]xi32>, vector<[4]xi32>
    %11 = arm_sme.outerproduct %6, %7 acc(%10) : vector<[4]xi32>, vector<[4]xi32>
    return %11 : vector<[4]x[4]xi32>
  }
}

// -----
module {
  func.func @outerproduct_widening_2way__cant_erase(%arg0: vector<[4]xf16>, %arg1: vector<[4]xf16>, %arg2: vector<[4]xf16>, %arg3: vector<[4]xf16>) -> vector<[4]x[4]xf32> {
    %0 = arith.extf %arg0 : vector<[4]xf16> to vector<[4]xf32>
    %1 = arith.extf %arg1 : vector<[4]xf16> to vector<[4]xf32>
    %2 = arith.extf %arg2 : vector<[4]xf16> to vector<[4]xf32>
    %3 = arith.extf %arg3 : vector<[4]xf16> to vector<[4]xf32>
    %cst = arith.constant dense<1.000000e+00> : vector<[4]x[4]xf32>
    %4 = arm_sme.outerproduct %0, %1 acc(%cst) : vector<[4]xf32>, vector<[4]xf32>
    "test.some_use"(%4) : (vector<[4]x[4]xf32>) -> ()
    %5 = arm_sme.outerproduct %2, %3 acc(%4) : vector<[4]xf32>, vector<[4]xf32>
    return %5 : vector<[4]x[4]xf32>
  }
}

// -----
module {
  func.func @outerproduct_widening_4way__multi_use_cant_erase(%arg0: vector<[4]xi8>, %arg1: vector<[4]xi8>, %arg2: vector<[4]xi8>, %arg3: vector<[4]xi8>, %arg4: vector<[4]xi8>, %arg5: vector<[4]xi8>, %arg6: vector<[4]xi8>, %arg7: vector<[4]xi8>) -> vector<[4]x[4]xi32> {
    %0 = arith.extsi %arg0 : vector<[4]xi8> to vector<[4]xi32>
    %1 = arith.extsi %arg1 : vector<[4]xi8> to vector<[4]xi32>
    %2 = arith.extsi %arg2 : vector<[4]xi8> to vector<[4]xi32>
    %3 = arith.extsi %arg3 : vector<[4]xi8> to vector<[4]xi32>
    %4 = arith.extsi %arg4 : vector<[4]xi8> to vector<[4]xi32>
    %5 = arith.extsi %arg5 : vector<[4]xi8> to vector<[4]xi32>
    %6 = arith.extsi %arg6 : vector<[4]xi8> to vector<[4]xi32>
    %7 = arith.extsi %arg7 : vector<[4]xi8> to vector<[4]xi32>
    %8 = arm_sme.outerproduct %0, %1 : vector<[4]xi32>, vector<[4]xi32>
    %9 = arm_sme.outerproduct %2, %3 acc(%8) : vector<[4]xi32>, vector<[4]xi32>
    "test.some_use"(%9) : (vector<[4]x[4]xi32>) -> ()
    %10 = arm_sme.outerproduct %4, %5 acc(%9) : vector<[4]xi32>, vector<[4]xi32>
    %11 = arm_sme.outerproduct %6, %7 acc(%10) : vector<[4]xi32>, vector<[4]xi32>
    return %11 : vector<[4]x[4]xi32>
  }
}

// -----
module {
  func.func @outerproduct_widening_2way__unsupported_type_f32f32f64(%arg0: vector<[2]xf32>, %arg1: vector<[2]xf32>, %arg2: vector<[2]xf32>, %arg3: vector<[2]xf32>) -> vector<[2]x[2]xf64> {
    %0 = arith.extf %arg0 : vector<[2]xf32> to vector<[2]xf64>
    %1 = arith.extf %arg1 : vector<[2]xf32> to vector<[2]xf64>
    %2 = arith.extf %arg2 : vector<[2]xf32> to vector<[2]xf64>
    %3 = arith.extf %arg3 : vector<[2]xf32> to vector<[2]xf64>
    %4 = arm_sme.outerproduct %0, %1 : vector<[2]xf64>, vector<[2]xf64>
    %5 = arm_sme.outerproduct %2, %3 acc(%4) : vector<[2]xf64>, vector<[2]xf64>
    return %5 : vector<[2]x[2]xf64>
  }
}

// -----
module {
  func.func @outerproduct_widening_4way__unsupported_type_f16f16f64(%arg0: vector<[2]xf16>, %arg1: vector<[2]xf16>, %arg2: vector<[2]xf16>, %arg3: vector<[2]xf16>, %arg4: vector<[2]xf16>, %arg5: vector<[2]xf16>, %arg6: vector<[2]xf16>, %arg7: vector<[2]xf16>) -> vector<[2]x[2]xf64> {
    %0 = arith.extf %arg0 : vector<[2]xf16> to vector<[2]xf64>
    %1 = arith.extf %arg1 : vector<[2]xf16> to vector<[2]xf64>
    %2 = arith.extf %arg2 : vector<[2]xf16> to vector<[2]xf64>
    %3 = arith.extf %arg3 : vector<[2]xf16> to vector<[2]xf64>
    %4 = arith.extf %arg4 : vector<[2]xf16> to vector<[2]xf64>
    %5 = arith.extf %arg5 : vector<[2]xf16> to vector<[2]xf64>
    %6 = arith.extf %arg6 : vector<[2]xf16> to vector<[2]xf64>
    %7 = arith.extf %arg7 : vector<[2]xf16> to vector<[2]xf64>
    %8 = arm_sme.outerproduct %0, %1 : vector<[2]xf64>, vector<[2]xf64>
    %9 = arm_sme.outerproduct %2, %3 acc(%8) : vector<[2]xf64>, vector<[2]xf64>
    %10 = arm_sme.outerproduct %4, %5 acc(%9) : vector<[2]xf64>, vector<[2]xf64>
    %11 = arm_sme.outerproduct %6, %7 acc(%10) : vector<[2]xf64>, vector<[2]xf64>
    return %11 : vector<[2]x[2]xf64>
  }
}

// -----
module {
  func.func @outerproduct_widening_2way__bad_masking(%arg0: vector<[4]xf16>, %arg1: vector<[4]xf16>, %arg2: vector<[4]xf16>, %arg3: vector<[4]xf16>, %arg4: vector<[4]xi1>, %arg5: vector<[4]xi1>) -> vector<[4]x[4]xf32> {
    %0 = arith.extf %arg0 : vector<[4]xf16> to vector<[4]xf32>
    %1 = arith.extf %arg1 : vector<[4]xf16> to vector<[4]xf32>
    %2 = arith.extf %arg2 : vector<[4]xf16> to vector<[4]xf32>
    %3 = arith.extf %arg3 : vector<[4]xf16> to vector<[4]xf32>
    %4 = arm_sme.outerproduct %0, %1 : vector<[4]xf32>, vector<[4]xf32>
    %5 = arm_sme.outerproduct %2, %3 acc(%4) masks(%arg4, %arg5) : vector<[4]xf32>, vector<[4]xf32>
    return %5 : vector<[4]x[4]xf32>
  }
}

// -----
module {
  func.func @outerproduct_widening_4way__inconsistent_masking(%arg0: vector<[4]xi8>, %arg1: vector<[4]xi8>, %arg2: vector<[4]xi8>, %arg3: vector<[4]xi8>, %arg4: vector<[4]xi8>, %arg5: vector<[4]xi8>, %arg6: vector<[4]xi8>, %arg7: vector<[4]xi8>, %arg8: vector<[4]xi1>, %arg9: vector<[4]xi1>) -> vector<[4]x[4]xi32> {
    %0 = arith.extsi %arg0 : vector<[4]xi8> to vector<[4]xi32>
    %1 = arith.extsi %arg1 : vector<[4]xi8> to vector<[4]xi32>
    %2 = arith.extsi %arg2 : vector<[4]xi8> to vector<[4]xi32>
    %3 = arith.extsi %arg3 : vector<[4]xi8> to vector<[4]xi32>
    %4 = arith.extsi %arg4 : vector<[4]xi8> to vector<[4]xi32>
    %5 = arith.extsi %arg5 : vector<[4]xi8> to vector<[4]xi32>
    %6 = arith.extsi %arg6 : vector<[4]xi8> to vector<[4]xi32>
    %7 = arith.extsi %arg7 : vector<[4]xi8> to vector<[4]xi32>
    %8 = arm_sme.outerproduct %0, %1 : vector<[4]xi32>, vector<[4]xi32>
    %9 = arm_sme.outerproduct %2, %3 acc(%8) : vector<[4]xi32>, vector<[4]xi32>
    %10 = arm_sme.outerproduct %4, %5 acc(%9) masks(%arg8, %arg9) : vector<[4]xi32>, vector<[4]xi32>
    %11 = arm_sme.outerproduct %6, %7 acc(%10) : vector<[4]xi32>, vector<[4]xi32>
    return %11 : vector<[4]x[4]xi32>
  }
}

// -----
module {
  func.func @outerproduct_widening_2way__bad_defining_op(%arg0: vector<[4]xf32>, %arg1: vector<[4]xf32>, %arg2: vector<[4]xf32>, %arg3: vector<[4]xf32>) -> vector<[4]x[4]xf32> {
    %0 = arm_sme.outerproduct %arg0, %arg1 : vector<[4]xf32>, vector<[4]xf32>
    %1 = arm_sme.outerproduct %arg2, %arg3 acc(%0) : vector<[4]xf32>, vector<[4]xf32>
    return %1 : vector<[4]x[4]xf32>
  }
}

// -----
module {
  func.func @outerproduct_widening_4way__bad_defining_op(%arg0: vector<[4]xi8>, %arg1: vector<[4]xi8>, %arg2: vector<[4]xi8>, %arg3: vector<[4]xi8>, %arg4: vector<[4]xi32>, %arg5: vector<[4]xi32>, %arg6: vector<[4]xi8>, %arg7: vector<[4]xi8>) -> vector<[4]x[4]xi32> {
    %0 = arith.extsi %arg0 : vector<[4]xi8> to vector<[4]xi32>
    %1 = arith.extsi %arg1 : vector<[4]xi8> to vector<[4]xi32>
    %2 = arith.extsi %arg2 : vector<[4]xi8> to vector<[4]xi32>
    %3 = arith.extsi %arg3 : vector<[4]xi8> to vector<[4]xi32>
    %4 = arith.extsi %arg6 : vector<[4]xi8> to vector<[4]xi32>
    %5 = arith.extsi %arg7 : vector<[4]xi8> to vector<[4]xi32>
    %6 = arm_sme.outerproduct %0, %1 : vector<[4]xi32>, vector<[4]xi32>
    %7 = arm_sme.outerproduct %2, %3 acc(%6) : vector<[4]xi32>, vector<[4]xi32>
    %8 = arm_sme.outerproduct %arg4, %arg5 acc(%7) : vector<[4]xi32>, vector<[4]xi32>
    %9 = arm_sme.outerproduct %4, %5 acc(%8) : vector<[4]xi32>, vector<[4]xi32>
    return %9 : vector<[4]x[4]xi32>
  }
}

// -----
module {
  func.func @extract_scalar_from_arith_ext(%arg0: vector<4x[8]xi8>) -> i32 {
    %0 = arith.extsi %arg0 : vector<4x[8]xi8> to vector<4x[8]xi32>
    %1 = vector.extract %0[0, 0] : i32 from vector<4x[8]xi32>
    return %1 : i32
  }
}

// -----
module {
  func.func @extract_fixed_1d_vec_from_arith_ext(%arg0: vector<4x8xi8>) -> vector<8xi32> {
    %0 = arith.extsi %arg0 : vector<4x8xi8> to vector<4x8xi32>
    %1 = vector.extract %0[0] : vector<8xi32> from vector<4x8xi32>
    return %1 : vector<8xi32>
  }
}

// -----
module {
  func.func @extract_from_non_arith_ext(%arg0: vector<4x[8]xi32>) -> vector<[8]xi32> {
    %0 = vector.extract %arg0[0] : vector<[8]xi32> from vector<4x[8]xi32>
    return %0 : vector<[8]xi32>
  }
}

// -----
module {
  func.func @scalable_extract_from_non_arith_ext(%arg0: vector<[8]xf32>) -> vector<[4]xf32> {
    %0 = vector.scalable.extract %arg0[0] : vector<[4]xf32> from vector<[8]xf32>
    return %0 : vector<[4]xf32>
  }
}

