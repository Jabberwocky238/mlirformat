module {
  llvm.func @arm_neon_smull(%arg0: vector<8xi8>, %arg1: vector<8xi8>) -> !llvm.struct<(vector<8xi16>, vector<4xi32>, vector<2xi64>)> {
    %0 = arm_neon.intr.smull %arg0, %arg1 : vector<8xi8> to vector<8xi16>
    %1 = llvm.shufflevector %0, %0 [3, 4, 5, 6] : vector<8xi16> 
    %2 = arm_neon.intr.smull %1, %1 : vector<4xi16> to vector<4xi32>
    %3 = llvm.shufflevector %2, %2 [1, 2] : vector<4xi32> 
    %4 = arm_neon.intr.smull %3, %3 : vector<2xi32> to vector<2xi64>
    %5 = llvm.mlir.undef : !llvm.struct<(vector<8xi16>, vector<4xi32>, vector<2xi64>)>
    %6 = llvm.insertvalue %0, %5[0] : !llvm.struct<(vector<8xi16>, vector<4xi32>, vector<2xi64>)> 
    %7 = llvm.insertvalue %2, %6[1] : !llvm.struct<(vector<8xi16>, vector<4xi32>, vector<2xi64>)> 
    %8 = llvm.insertvalue %4, %7[2] : !llvm.struct<(vector<8xi16>, vector<4xi32>, vector<2xi64>)> 
    llvm.return %8 : !llvm.struct<(vector<8xi16>, vector<4xi32>, vector<2xi64>)>
  }
}

// -----
module {
  llvm.func @arm_neon_sdot_8_i8i8(%arg0: vector<2xi32>, %arg1: vector<8xi8>, %arg2: vector<8xi8>) -> vector<2xi32> {
    %0 = arm_neon.intr.sdot %arg0, %arg1, %arg2 : vector<8xi8>, vector<8xi8> to vector<2xi32>
    llvm.return %0 : vector<2xi32>
  }
}

// -----
module {
  llvm.func @arm_neon_sdot_16_i8i8(%arg0: vector<4xi32>, %arg1: vector<16xi8>, %arg2: vector<16xi8>) -> vector<4xi32> {
    %0 = arm_neon.intr.sdot %arg0, %arg1, %arg2 : vector<16xi8>, vector<16xi8> to vector<4xi32>
    llvm.return %0 : vector<4xi32>
  }
}

// -----
module {
  llvm.func @arm_neon_smmla(%arg0: vector<16xi8>, %arg1: vector<16xi8>, %arg2: vector<4xi32>) -> vector<4xi32> {
    %0 = arm_neon.intr.smmla %arg2, %arg0, %arg1 : vector<16xi8> to vector<4xi32>
    llvm.return %0 : vector<4xi32>
  }
}

// -----
module {
  llvm.func @arm_neon_ummla(%arg0: vector<16xi8>, %arg1: vector<16xi8>, %arg2: vector<4xi32>) -> vector<4xi32> {
    %0 = arm_neon.intr.ummla %arg2, %arg0, %arg1 : vector<16xi8> to vector<4xi32>
    llvm.return %0 : vector<4xi32>
  }
}

// -----
module {
  llvm.func @arm_neon_usmmla(%arg0: vector<16xi8>, %arg1: vector<16xi8>, %arg2: vector<4xi32>) -> vector<4xi32> {
    %0 = arm_neon.intr.usmmla %arg2, %arg0, %arg1 : vector<16xi8> to vector<4xi32>
    llvm.return %0 : vector<4xi32>
  }
}

// -----
module {
  llvm.func @arm_neon_bfmmla(%arg0: vector<8xbf16>, %arg1: vector<8xbf16>, %arg2: vector<4xf32>) -> vector<4xf32> {
    %0 = arm_neon.intr.bfmmla %arg2, %arg0, %arg1 : vector<8xbf16> to vector<4xf32>
    llvm.return %0 : vector<4xf32>
  }
}

