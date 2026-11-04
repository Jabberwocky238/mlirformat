module {
}

// -----
module {
  func.func @store_and_reload_sve_predicate_nxv1i1(%arg0: vector<[1]xi1>) -> vector<[1]xi1> {
    %alloca = memref.alloca() : memref<vector<[1]xi1>>
    memref.store %arg0, %alloca[] : memref<vector<[1]xi1>>
    %0 = memref.load %alloca[] : memref<vector<[1]xi1>>
    return %0 : vector<[1]xi1>
  }
}

// -----
module {
  func.func @store_and_reload_sve_predicate_nxv2i1(%arg0: vector<[2]xi1>) -> vector<[2]xi1> {
    %alloca = memref.alloca() : memref<vector<[2]xi1>>
    memref.store %arg0, %alloca[] : memref<vector<[2]xi1>>
    %0 = memref.load %alloca[] : memref<vector<[2]xi1>>
    return %0 : vector<[2]xi1>
  }
}

// -----
module {
  func.func @store_and_reload_sve_predicate_nxv4i1(%arg0: vector<[4]xi1>) -> vector<[4]xi1> {
    %alloca = memref.alloca() : memref<vector<[4]xi1>>
    memref.store %arg0, %alloca[] : memref<vector<[4]xi1>>
    %0 = memref.load %alloca[] : memref<vector<[4]xi1>>
    return %0 : vector<[4]xi1>
  }
}

// -----
module {
  func.func @store_and_reload_sve_predicate_nxv8i1(%arg0: vector<[8]xi1>) -> vector<[8]xi1> {
    %alloca = memref.alloca() : memref<vector<[8]xi1>>
    memref.store %arg0, %alloca[] : memref<vector<[8]xi1>>
    %0 = memref.load %alloca[] : memref<vector<[8]xi1>>
    return %0 : vector<[8]xi1>
  }
}

// -----
module {
  func.func @store_and_reload_sve_predicate_nxv16i1(%arg0: vector<[16]xi1>) -> vector<[16]xi1> {
    %alloca = memref.alloca() : memref<vector<[16]xi1>>
    memref.store %arg0, %alloca[] : memref<vector<[16]xi1>>
    %0 = memref.load %alloca[] : memref<vector<[16]xi1>>
    return %0 : vector<[16]xi1>
  }
}

// -----
module {
  func.func @store_and_reload_unsupported_type(%arg0: vector<[7]xi1>) -> vector<[7]xi1> {
    %alloca = memref.alloca() : memref<vector<[7]xi1>>
    memref.store %arg0, %alloca[] : memref<vector<[7]xi1>>
    %0 = memref.load %alloca[] : memref<vector<[7]xi1>>
    return %0 : vector<[7]xi1>
  }
}

// -----
module {
  func.func @store_2d_mask_and_reload_slice(%arg0: vector<3x[8]xi1>) -> vector<[8]xi1> {
    %c0 = arith.constant 0 : index
    %alloca = memref.alloca() : memref<vector<3x[8]xi1>>
    memref.store %arg0, %alloca[] : memref<vector<3x[8]xi1>>
    %0 = vector.type_cast %alloca : memref<vector<3x[8]xi1>> to memref<3xvector<[8]xi1>>
    %1 = memref.load %0[%c0] : memref<3xvector<[8]xi1>>
    return %1 : vector<[8]xi1>
  }
}

// -----
module {
  func.func @set_sve_alloca_alignment() {
    %alloca = memref.alloca() : memref<vector<[32]xi8>>
    %alloca_0 = memref.alloca() : memref<vector<[16]xi8>>
    %alloca_1 = memref.alloca() : memref<vector<[8]xi8>>
    %alloca_2 = memref.alloca() : memref<vector<[4]xi8>>
    %alloca_3 = memref.alloca() : memref<vector<[2]xi8>>
    %alloca_4 = memref.alloca() : memref<vector<[1]xi8>>
    %alloca_5 = memref.alloca() : memref<vector<[32]xi16>>
    %alloca_6 = memref.alloca() : memref<vector<[16]xi16>>
    %alloca_7 = memref.alloca() : memref<vector<[8]xi16>>
    %alloca_8 = memref.alloca() : memref<vector<[4]xi16>>
    %alloca_9 = memref.alloca() : memref<vector<[2]xi16>>
    %alloca_10 = memref.alloca() : memref<vector<[1]xi16>>
    %alloca_11 = memref.alloca() : memref<vector<[32]xi32>>
    %alloca_12 = memref.alloca() : memref<vector<[16]xi32>>
    %alloca_13 = memref.alloca() : memref<vector<[8]xi32>>
    %alloca_14 = memref.alloca() : memref<vector<[4]xi32>>
    %alloca_15 = memref.alloca() : memref<vector<[2]xi32>>
    %alloca_16 = memref.alloca() : memref<vector<[1]xi32>>
    %alloca_17 = memref.alloca() : memref<vector<[32]xi64>>
    %alloca_18 = memref.alloca() : memref<vector<[16]xi64>>
    %alloca_19 = memref.alloca() : memref<vector<[8]xi64>>
    %alloca_20 = memref.alloca() : memref<vector<[4]xi64>>
    %alloca_21 = memref.alloca() : memref<vector<[2]xi64>>
    %alloca_22 = memref.alloca() : memref<vector<[1]xi64>>
    %alloca_23 = memref.alloca() : memref<vector<[32]xf32>>
    %alloca_24 = memref.alloca() : memref<vector<[16]xf32>>
    %alloca_25 = memref.alloca() : memref<vector<[8]xf32>>
    %alloca_26 = memref.alloca() : memref<vector<[4]xf32>>
    %alloca_27 = memref.alloca() : memref<vector<[2]xf32>>
    %alloca_28 = memref.alloca() : memref<vector<[1]xf32>>
    %alloca_29 = memref.alloca() : memref<vector<[32]xf64>>
    %alloca_30 = memref.alloca() : memref<vector<[16]xf64>>
    %alloca_31 = memref.alloca() : memref<vector<[8]xf64>>
    %alloca_32 = memref.alloca() : memref<vector<[4]xf64>>
    %alloca_33 = memref.alloca() : memref<vector<[2]xf64>>
    %alloca_34 = memref.alloca() : memref<vector<[1]xf64>>
    "prevent.dce"(%alloca, %alloca_0, %alloca_1, %alloca_2, %alloca_3, %alloca_4, %alloca_5, %alloca_6, %alloca_7, %alloca_8, %alloca_9, %alloca_10, %alloca_11, %alloca_12, %alloca_13, %alloca_14, %alloca_15, %alloca_16, %alloca_17, %alloca_18, %alloca_19, %alloca_20, %alloca_21, %alloca_22, %alloca_23, %alloca_24, %alloca_25, %alloca_26, %alloca_27, %alloca_28, %alloca_29, %alloca_30, %alloca_31, %alloca_32, %alloca_33, %alloca_34) : (memref<vector<[32]xi8>>, memref<vector<[16]xi8>>, memref<vector<[8]xi8>>, memref<vector<[4]xi8>>, memref<vector<[2]xi8>>, memref<vector<[1]xi8>>, memref<vector<[32]xi16>>, memref<vector<[16]xi16>>, memref<vector<[8]xi16>>, memref<vector<[4]xi16>>, memref<vector<[2]xi16>>, memref<vector<[1]xi16>>, memref<vector<[32]xi32>>, memref<vector<[16]xi32>>, memref<vector<[8]xi32>>, memref<vector<[4]xi32>>, memref<vector<[2]xi32>>, memref<vector<[1]xi32>>, memref<vector<[32]xi64>>, memref<vector<[16]xi64>>, memref<vector<[8]xi64>>, memref<vector<[4]xi64>>, memref<vector<[2]xi64>>, memref<vector<[1]xi64>>, memref<vector<[32]xf32>>, memref<vector<[16]xf32>>, memref<vector<[8]xf32>>, memref<vector<[4]xf32>>, memref<vector<[2]xf32>>, memref<vector<[1]xf32>>, memref<vector<[32]xf64>>, memref<vector<[16]xf64>>, memref<vector<[8]xf64>>, memref<vector<[4]xf64>>, memref<vector<[2]xf64>>, memref<vector<[1]xf64>>) -> ()
    return
  }
}

