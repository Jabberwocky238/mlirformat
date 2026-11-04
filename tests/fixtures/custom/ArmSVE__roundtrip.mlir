module {
  func.func @arm_sve_sdot(%arg0: vector<[16]xi8>, %arg1: vector<[16]xi8>, %arg2: vector<[4]xi32>) -> vector<[4]xi32> {
    %0 = arm_sve.sdot %arg2, %arg0, %arg1 : vector<[16]xi8> to vector<[4]xi32>
    return %0 : vector<[4]xi32>
  }
}

// -----
module {
  func.func @arm_sve_smmla(%arg0: vector<[16]xi8>, %arg1: vector<[16]xi8>, %arg2: vector<[4]xi32>) -> vector<[4]xi32> {
    %0 = arm_sve.smmla %arg2, %arg0, %arg1 : vector<[16]xi8> to vector<[4]xi32>
    return %0 : vector<[4]xi32>
  }
}

// -----
module {
  func.func @arm_sve_udot(%arg0: vector<[16]xi8>, %arg1: vector<[16]xi8>, %arg2: vector<[4]xi32>) -> vector<[4]xi32> {
    %0 = arm_sve.udot %arg2, %arg0, %arg1 : vector<[16]xi8> to vector<[4]xi32>
    return %0 : vector<[4]xi32>
  }
}

// -----
module {
  func.func @arm_sve_ummla(%arg0: vector<[16]xi8>, %arg1: vector<[16]xi8>, %arg2: vector<[4]xi32>) -> vector<[4]xi32> {
    %0 = arm_sve.ummla %arg2, %arg0, %arg1 : vector<[16]xi8> to vector<[4]xi32>
    return %0 : vector<[4]xi32>
  }
}

// -----
module {
  func.func @arm_sve_usmmla(%arg0: vector<[16]xi8>, %arg1: vector<[16]xi8>, %arg2: vector<[4]xi32>) -> vector<[4]xi32> {
    %0 = arm_sve.usmmla %arg2, %arg0, %arg1 : vector<[16]xi8> to vector<[4]xi32>
    return %0 : vector<[4]xi32>
  }
}

// -----
module {
  func.func @arm_sve_bfmmla(%arg0: vector<[8]xbf16>, %arg1: vector<[8]xbf16>, %arg2: vector<[4]xf32>) -> vector<[4]xf32> {
    %0 = arm_sve.intr.bfmmla %arg2, %arg0, %arg1 : vector<[8]xbf16> to vector<[4]xf32>
    return %0 : vector<[4]xf32>
  }
}

// -----
module {
  func.func @arm_sve_masked_arithi(%arg0: vector<[4]xi32>, %arg1: vector<[4]xi32>, %arg2: vector<[4]xi32>, %arg3: vector<[4]xi32>, %arg4: vector<[4]xi32>, %arg5: vector<[4]xi1>) -> vector<[4]xi32> {
    %0 = arm_sve.masked.muli %arg5, %arg0, %arg1 : vector<[4]xi1>, vector<[4]xi32>
    %1 = arm_sve.masked.addi %arg5, %0, %arg2 : vector<[4]xi1>, vector<[4]xi32>
    %2 = arm_sve.masked.subi %arg5, %1, %arg3 : vector<[4]xi1>, vector<[4]xi32>
    %3 = arm_sve.masked.divi_signed %arg5, %2, %arg4 : vector<[4]xi1>, vector<[4]xi32>
    %4 = arm_sve.masked.divi_unsigned %arg5, %3, %arg4 : vector<[4]xi1>, vector<[4]xi32>
    return %2 : vector<[4]xi32>
  }
}

// -----
module {
  func.func @arm_sve_masked_arithf(%arg0: vector<[4]xf32>, %arg1: vector<[4]xf32>, %arg2: vector<[4]xf32>, %arg3: vector<[4]xf32>, %arg4: vector<[4]xf32>, %arg5: vector<[4]xi1>) -> vector<[4]xf32> {
    %0 = arm_sve.masked.mulf %arg5, %arg0, %arg1 : vector<[4]xi1>, vector<[4]xf32>
    %1 = arm_sve.masked.addf %arg5, %0, %arg2 : vector<[4]xi1>, vector<[4]xf32>
    %2 = arm_sve.masked.subf %arg5, %1, %arg3 : vector<[4]xi1>, vector<[4]xf32>
    %3 = arm_sve.masked.divf %arg5, %2, %arg4 : vector<[4]xi1>, vector<[4]xf32>
    return %3 : vector<[4]xf32>
  }
}

// -----
module {
  func.func @arm_sve_convert_to_svbool(%arg0: vector<[1]xi1>, %arg1: vector<[2]xi1>, %arg2: vector<[4]xi1>, %arg3: vector<[8]xi1>, %arg4: vector<2x3x[1]xi1>, %arg5: vector<4x[2]xi1>, %arg6: vector<1x1x1x2x[4]xi1>, %arg7: vector<100x[8]xi1>) {
    %0 = arm_sve.convert_to_svbool %arg0 : vector<[1]xi1>
    %1 = arm_sve.convert_to_svbool %arg1 : vector<[2]xi1>
    %2 = arm_sve.convert_to_svbool %arg2 : vector<[4]xi1>
    %3 = arm_sve.convert_to_svbool %arg3 : vector<[8]xi1>
    %4 = arm_sve.convert_to_svbool %arg4 : vector<2x3x[1]xi1>
    %5 = arm_sve.convert_to_svbool %arg5 : vector<4x[2]xi1>
    %6 = arm_sve.convert_to_svbool %arg6 : vector<1x1x1x2x[4]xi1>
    %7 = arm_sve.convert_to_svbool %arg7 : vector<100x[8]xi1>
    return
  }
}

// -----
module {
  func.func @arm_sve_convert_from_svbool(%arg0: vector<[16]xi1>, %arg1: vector<2x3x[16]xi1>, %arg2: vector<4x[16]xi1>, %arg3: vector<1x1x1x1x[16]xi1>, %arg4: vector<32x[16]xi1>) {
    %0 = arm_sve.convert_from_svbool %arg0 : vector<[1]xi1>
    %1 = arm_sve.convert_from_svbool %arg0 : vector<[2]xi1>
    %2 = arm_sve.convert_from_svbool %arg0 : vector<[4]xi1>
    %3 = arm_sve.convert_from_svbool %arg0 : vector<[8]xi1>
    %4 = arm_sve.convert_from_svbool %arg1 : vector<2x3x[1]xi1>
    %5 = arm_sve.convert_from_svbool %arg2 : vector<4x[2]xi1>
    %6 = arm_sve.convert_from_svbool %arg3 : vector<1x1x1x1x[4]xi1>
    %7 = arm_sve.convert_from_svbool %arg4 : vector<32x[8]xi1>
    return
  }
}

// -----
module {
  func.func @arm_sve_zip_x2(%arg0: vector<[2]xi64>, %arg1: vector<[2]xf64>, %arg2: vector<[4]xi32>, %arg3: vector<[4]xf32>, %arg4: vector<[8]xi16>, %arg5: vector<[8]xf16>, %arg6: vector<[8]xbf16>, %arg7: vector<[16]xi8>) {
    %resultV1, %resultV2 = arm_sve.zip.x2 %arg0, %arg0 : vector<[2]xi64>
    %resultV1_0, %resultV2_1 = arm_sve.zip.x2 %arg1, %arg1 : vector<[2]xf64>
    %resultV1_2, %resultV2_3 = arm_sve.zip.x2 %arg2, %arg2 : vector<[4]xi32>
    %resultV1_4, %resultV2_5 = arm_sve.zip.x2 %arg3, %arg3 : vector<[4]xf32>
    %resultV1_6, %resultV2_7 = arm_sve.zip.x2 %arg4, %arg4 : vector<[8]xi16>
    %resultV1_8, %resultV2_9 = arm_sve.zip.x2 %arg5, %arg5 : vector<[8]xf16>
    %resultV1_10, %resultV2_11 = arm_sve.zip.x2 %arg6, %arg6 : vector<[8]xbf16>
    %resultV1_12, %resultV2_13 = arm_sve.zip.x2 %arg7, %arg7 : vector<[16]xi8>
    return
  }
}

// -----
module {
  func.func @arm_sve_zip_x4(%arg0: vector<[2]xi64>, %arg1: vector<[2]xf64>, %arg2: vector<[4]xi32>, %arg3: vector<[4]xf32>, %arg4: vector<[8]xi16>, %arg5: vector<[8]xf16>, %arg6: vector<[8]xbf16>, %arg7: vector<[16]xi8>) {
    %resultV1, %resultV2, %resultV3, %resultV4 = arm_sve.zip.x4 %arg0, %arg0, %arg0, %arg0 : vector<[2]xi64>
    %resultV1_0, %resultV2_1, %resultV3_2, %resultV4_3 = arm_sve.zip.x4 %arg1, %arg1, %arg1, %arg1 : vector<[2]xf64>
    %resultV1_4, %resultV2_5, %resultV3_6, %resultV4_7 = arm_sve.zip.x4 %arg2, %arg2, %arg2, %arg2 : vector<[4]xi32>
    %resultV1_8, %resultV2_9, %resultV3_10, %resultV4_11 = arm_sve.zip.x4 %arg3, %arg3, %arg3, %arg3 : vector<[4]xf32>
    %resultV1_12, %resultV2_13, %resultV3_14, %resultV4_15 = arm_sve.zip.x4 %arg4, %arg4, %arg4, %arg4 : vector<[8]xi16>
    %resultV1_16, %resultV2_17, %resultV3_18, %resultV4_19 = arm_sve.zip.x4 %arg5, %arg5, %arg5, %arg5 : vector<[8]xf16>
    %resultV1_20, %resultV2_21, %resultV3_22, %resultV4_23 = arm_sve.zip.x4 %arg6, %arg6, %arg6, %arg6 : vector<[8]xbf16>
    %resultV1_24, %resultV2_25, %resultV3_26, %resultV4_27 = arm_sve.zip.x4 %arg7, %arg7, %arg7, %arg7 : vector<[16]xi8>
    return
  }
}

// -----
module {
  func.func @arm_sve_psel(%arg0: vector<[2]xi1>, %arg1: vector<[4]xi1>, %arg2: vector<[8]xi1>, %arg3: vector<[16]xi1>, %arg4: index) {
    %0 = arm_sve.psel %arg0, %arg0[%arg4] : vector<[2]xi1>, vector<[2]xi1>
    %1 = arm_sve.psel %arg1, %arg1[%arg4] : vector<[4]xi1>, vector<[4]xi1>
    %2 = arm_sve.psel %arg2, %arg2[%arg4] : vector<[8]xi1>, vector<[8]xi1>
    %3 = arm_sve.psel %arg3, %arg3[%arg4] : vector<[16]xi1>, vector<[16]xi1>
    %4 = arm_sve.psel %arg0, %arg1[%arg4] : vector<[2]xi1>, vector<[4]xi1>
    %5 = arm_sve.psel %arg1, %arg2[%arg4] : vector<[4]xi1>, vector<[8]xi1>
    %6 = arm_sve.psel %arg2, %arg3[%arg4] : vector<[8]xi1>, vector<[16]xi1>
    %7 = arm_sve.psel %arg3, %arg0[%arg4] : vector<[16]xi1>, vector<[2]xi1>
    return
  }
}

