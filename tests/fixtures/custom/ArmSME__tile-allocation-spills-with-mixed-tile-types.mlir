module {
  func.func @always_spill_larger_or_equal_tile_type(%arg0: memref<?x?xf16>) -> (vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[8]x[8]xf16>) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.zero : vector<[4]x[4]xf32>
    %1 = arm_sme.zero : vector<[4]x[4]xf32>
    %2 = arm_sme.zero : vector<[4]x[4]xf32>
    %3 = arm_sme.zero : vector<[4]x[4]xf32>
    %4 = arm_sme.tile_load %arg0[%c0, %c0] : memref<?x?xf16>, vector<[8]x[8]xf16>
    return %0, %1, %2, %3, %4 : vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[8]x[8]xf16>
  }
}

// -----
module {
  func.func @spill_larger_tile_type(%arg0: memref<?x?xf32>) -> (vector<[16]x[16]xi8>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.zero : vector<[16]x[16]xi8>
    %1 = arm_sme.tile_load %arg0[%c0, %c0] : memref<?x?xf32>, vector<[4]x[4]xf32>
    %2 = arm_sme.tile_load %arg0[%c0, %c0] : memref<?x?xf32>, vector<[4]x[4]xf32>
    %3 = arm_sme.tile_load %arg0[%c0, %c0] : memref<?x?xf32>, vector<[4]x[4]xf32>
    %4 = arm_sme.tile_load %arg0[%c0, %c0] : memref<?x?xf32>, vector<[4]x[4]xf32>
    return %0, %1, %2, %3, %4 : vector<[16]x[16]xi8>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>
  }
}

