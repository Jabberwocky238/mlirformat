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
  func.func @arm_sve_arithi_masked(%arg0: vector<[4]xi32>, %arg1: vector<[4]xi32>, %arg2: vector<[4]xi32>, %arg3: vector<[4]xi32>, %arg4: vector<[4]xi32>, %arg5: vector<[4]xi1>) -> vector<[4]xi32> {
    %0 = arm_sve.masked.addi %arg5, %arg0, %arg1 : vector<[4]xi1>, vector<[4]xi32>
    %1 = arm_sve.masked.subi %arg5, %0, %arg2 : vector<[4]xi1>, vector<[4]xi32>
    %2 = arm_sve.masked.muli %arg5, %1, %arg3 : vector<[4]xi1>, vector<[4]xi32>
    %3 = arm_sve.masked.divi_signed %arg5, %2, %arg4 : vector<[4]xi1>, vector<[4]xi32>
    %4 = arm_sve.masked.divi_unsigned %arg5, %3, %arg4 : vector<[4]xi1>, vector<[4]xi32>
    return %4 : vector<[4]xi32>
  }
}

// -----
module {
  func.func @arm_sve_arithf_masked(%arg0: vector<[4]xf32>, %arg1: vector<[4]xf32>, %arg2: vector<[4]xf32>, %arg3: vector<[4]xf32>, %arg4: vector<[4]xf32>, %arg5: vector<[4]xi1>) -> vector<[4]xf32> {
    %0 = arm_sve.masked.addf %arg5, %arg0, %arg1 : vector<[4]xi1>, vector<[4]xf32>
    %1 = arm_sve.masked.subf %arg5, %0, %arg2 : vector<[4]xi1>, vector<[4]xf32>
    %2 = arm_sve.masked.mulf %arg5, %1, %arg3 : vector<[4]xi1>, vector<[4]xf32>
    %3 = arm_sve.masked.divf %arg5, %2, %arg4 : vector<[4]xi1>, vector<[4]xf32>
    return %3 : vector<[4]xf32>
  }
}

// -----
module {
  func.func @arm_sve_abs_diff(%arg0: vector<[4]xi32>, %arg1: vector<[4]xi32>) -> vector<[4]xi32> {
    %0 = arith.subi %arg0, %arg0 : vector<[4]xi32>
    %1 = arith.cmpi sge, %arg0, %arg1 : vector<[4]xi32>
    %2 = arith.cmpi slt, %arg0, %arg1 : vector<[4]xi32>
    %3 = arm_sve.masked.subi %1, %arg0, %arg1 : vector<[4]xi1>, vector<[4]xi32>
    %4 = arm_sve.masked.subi %2, %arg1, %arg0 : vector<[4]xi1>, vector<[4]xi32>
    %5 = arm_sve.masked.addi %1, %0, %3 : vector<[4]xi1>, vector<[4]xi32>
    %6 = arm_sve.masked.addi %2, %5, %4 : vector<[4]xi1>, vector<[4]xi32>
    return %6 : vector<[4]xi32>
  }
}

// -----
module {
  func.func @get_vector_scale() -> index {
    %vscale = vector.vscale
    return %vscale : index
  }
}

// -----
module {
  func.func @convert_1d_mask_to_svbool(%arg0: vector<[4]xi1>) -> vector<[16]xi1> {
    %0 = arm_sve.convert_to_svbool %arg0 : vector<[4]xi1>
    return %0 : vector<[16]xi1>
  }
}

// -----
module {
  func.func @convert_1d_mask_from_svbool(%arg0: vector<[16]xi1>) -> vector<[2]xi1> {
    %0 = arm_sve.convert_from_svbool %arg0 : vector<[2]xi1>
    return %0 : vector<[2]xi1>
  }
}

// -----
module {
  func.func @convert_2d_mask_to_svbool(%arg0: vector<2x[8]xi1>) -> vector<2x[16]xi1> {
    %0 = arm_sve.convert_to_svbool %arg0 : vector<2x[8]xi1>
    return %0 : vector<2x[16]xi1>
  }
}

// -----
module {
  func.func @convert_2d_mask_from_svbool(%arg0: vector<3x[16]xi1>) -> vector<3x[1]xi1> {
    %0 = arm_sve.convert_from_svbool %arg0 : vector<3x[1]xi1>
    return %0 : vector<3x[1]xi1>
  }
}

// -----
module {
  func.func @arm_sve_zip_x2(%arg0: vector<[8]xi16>, %arg1: vector<[8]xi16>) -> (vector<[8]xi16>, vector<[8]xi16>) {
    %resultV1, %resultV2 = arm_sve.zip.x2 %arg0, %arg1 : vector<[8]xi16>
    return %resultV1, %resultV2 : vector<[8]xi16>, vector<[8]xi16>
  }
}

// -----
module {
  func.func @arm_sve_zip_x4(%arg0: vector<[16]xi8>, %arg1: vector<[16]xi8>, %arg2: vector<[16]xi8>, %arg3: vector<[16]xi8>) -> (vector<[16]xi8>, vector<[16]xi8>, vector<[16]xi8>, vector<[16]xi8>) {
    %resultV1, %resultV2, %resultV3, %resultV4 = arm_sve.zip.x4 %arg0, %arg1, %arg2, %arg3 : vector<[16]xi8>
    return %resultV1, %resultV2, %resultV3, %resultV4 : vector<[16]xi8>, vector<[16]xi8>, vector<[16]xi8>, vector<[16]xi8>
  }
}

// -----
module {
  func.func @arm_sve_predicate_sized_create_masks(%arg0: index) -> (vector<[2]xi1>, vector<[4]xi1>, vector<[8]xi1>, vector<[16]xi1>) {
    %0 = vector.create_mask %arg0 : vector<[2]xi1>
    %1 = vector.create_mask %arg0 : vector<[4]xi1>
    %2 = vector.create_mask %arg0 : vector<[8]xi1>
    %3 = vector.create_mask %arg0 : vector<[16]xi1>
    return %0, %1, %2, %3 : vector<[2]xi1>, vector<[4]xi1>, vector<[8]xi1>, vector<[16]xi1>
  }
}

// -----
module {
  func.func @arm_sve_unsupported_create_masks(%arg0: index) -> (vector<[1]xi1>, vector<[7]xi1>, vector<[32]xi1>) {
    %0 = vector.create_mask %arg0 : vector<[1]xi1>
    %1 = vector.create_mask %arg0 : vector<[7]xi1>
    %2 = vector.create_mask %arg0 : vector<[32]xi1>
    return %0, %1, %2 : vector<[1]xi1>, vector<[7]xi1>, vector<[32]xi1>
  }
}

// -----
module {
  func.func @arm_sve_psel_matching_predicate_types(%arg0: vector<[4]xi1>, %arg1: vector<[4]xi1>, %arg2: index) -> vector<[4]xi1> {
    %0 = arm_sve.psel %arg0, %arg1[%arg2] : vector<[4]xi1>, vector<[4]xi1>
    return %0 : vector<[4]xi1>
  }
}

// -----
module {
  func.func @arm_sve_psel_mixed_predicate_types(%arg0: vector<[8]xi1>, %arg1: vector<[16]xi1>, %arg2: index) -> vector<[8]xi1> {
    %0 = arm_sve.psel %arg0, %arg1[%arg2] : vector<[8]xi1>, vector<[16]xi1>
    return %0 : vector<[8]xi1>
  }
}

// -----
module {
  func.func @arm_sve_dupq_lane(%arg0: vector<[16]xi8>, %arg1: vector<[8]xi16>, %arg2: vector<[8]xf16>, %arg3: vector<[8]xbf16>, %arg4: vector<[4]xi32>, %arg5: vector<[4]xf32>, %arg6: vector<[2]xi64>, %arg7: vector<[2]xf64>) -> (vector<[16]xi8>, vector<[8]xi16>, vector<[8]xf16>, vector<[8]xbf16>, vector<[4]xi32>, vector<[4]xf32>, vector<[2]xi64>, vector<[2]xf64>) {
    %0 = arm_sve.dupq_lane %arg0[0] : vector<[16]xi8>
    %1 = arm_sve.dupq_lane %arg1[1] : vector<[8]xi16>
    %2 = arm_sve.dupq_lane %arg2[2] : vector<[8]xf16>
    %3 = arm_sve.dupq_lane %arg3[3] : vector<[8]xbf16>
    %4 = arm_sve.dupq_lane %arg4[4] : vector<[4]xi32>
    %5 = arm_sve.dupq_lane %arg5[5] : vector<[4]xf32>
    %6 = arm_sve.dupq_lane %arg6[6] : vector<[2]xi64>
    %7 = arm_sve.dupq_lane %arg7[7] : vector<[2]xf64>
    return %0, %1, %2, %3, %4, %5, %6, %7 : vector<[16]xi8>, vector<[8]xi16>, vector<[8]xf16>, vector<[8]xbf16>, vector<[4]xi32>, vector<[4]xf32>, vector<[2]xi64>, vector<[2]xf64>
  }
}

