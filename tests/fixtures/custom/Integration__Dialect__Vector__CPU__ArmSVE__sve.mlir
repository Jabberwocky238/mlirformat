#map = affine_map<(d0, d1)[s0] -> (s0, d0 - d1)>
module {
  func.func @kernel_copy(%arg0: memref<?xi64>, %arg1: memref<?xi64>, %arg2: index) {
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %vscale = vector.vscale
    %c2_vscale = arith.muli %c2, %vscale : index
    scf.for %arg3 = %c0 to %arg2 step %c2_vscale {
      %0 = vector.load %arg0[%arg3] : memref<?xi64>, vector<[2]xi64>
      vector.store %0, %arg1[%arg3] : memref<?xi64>, vector<[2]xi64>
    }
    return
  }
  func.func @kernel_muladd(%arg0: memref<?xi64>, %arg1: memref<?xi64>, %arg2: memref<?xi64>, %arg3: index) {
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %vscale = vector.vscale
    %c2_vscale = arith.muli %c2, %vscale : index
    scf.for %arg4 = %c0 to %arg3 step %c2_vscale {
      %0 = vector.load %arg0[%arg4] : memref<?xi64>, vector<[2]xi64>
      %1 = vector.load %arg1[%arg4] : memref<?xi64>, vector<[2]xi64>
      %2 = vector.load %arg2[%arg4] : memref<?xi64>, vector<[2]xi64>
      %3 = arith.muli %0, %1 : vector<[2]xi64>
      %4 = arith.addi %3, %2 : vector<[2]xi64>
      vector.store %4, %arg2[%arg4] : memref<?xi64>, vector<[2]xi64>
    }
    return
  }
  func.func @kernel_absdiff(%arg0: memref<?xi64>, %arg1: memref<?xi64>, %arg2: memref<?xi64>, %arg3: index) {
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %vscale = vector.vscale
    %c2_vscale = arith.muli %c2, %vscale : index
    scf.for %arg4 = %c0 to %arg3 step %c2_vscale {
      %0 = vector.load %arg0[%arg4] : memref<?xi64>, vector<[2]xi64>
      %1 = vector.load %arg1[%arg4] : memref<?xi64>, vector<[2]xi64>
      %2 = arith.cmpi sge, %0, %1 : vector<[2]xi64>
      %3 = arith.cmpi slt, %0, %1 : vector<[2]xi64>
      %4 = arm_sve.masked.subi %2, %0, %1 : vector<[2]xi1>, vector<[2]xi64>
      %5 = arm_sve.masked.subi %3, %1, %0 : vector<[2]xi1>, vector<[2]xi64>
      vector.maskedstore %arg2[%arg4], %2, %4 : memref<?xi64>, vector<[2]xi1>, vector<[2]xi64>
      vector.maskedstore %arg2[%arg4], %3, %5 : memref<?xi64>, vector<[2]xi1>, vector<[2]xi64>
    }
    return
  }
  func.func @kernel_addition(%arg0: memref<?xf32>, %arg1: memref<?xf32>, %arg2: memref<?xf32>, %arg3: index) {
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %cst = arith.constant dense<0.000000e+00> : vector<[4]xf32>
    %vscale = vector.vscale
    %c2_vscale = arith.muli %c2, %vscale : index
    scf.for %arg4 = %c0 to %arg3 step %c2_vscale {
      %0 = affine.min #map(%arg3, %arg4)[%c2_vscale]
      %1 = vector.create_mask %0 : vector<[4]xi1>
      %2 = vector.maskedload %arg0[%arg4], %1, %cst : memref<?xf32>, vector<[4]xi1>, vector<[4]xf32> into vector<[4]xf32>
      %3 = vector.maskedload %arg1[%arg4], %1, %cst : memref<?xf32>, vector<[4]xi1>, vector<[4]xf32> into vector<[4]xf32>
      %4 = arith.addf %2, %3 : vector<[4]xf32>
      vector.maskedstore %arg2[%arg4], %1, %4 : memref<?xf32>, vector<[4]xi1>, vector<[4]xf32>
    }
    return
  }
  func.func @entry() {
    %c0_i64 = arith.constant 0 : i64
    %c1_i64 = arith.constant 1 : i64
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c4 = arith.constant 4 : index
    %c8 = arith.constant 8 : index
    %c32 = arith.constant 32 : index
    %c33 = arith.constant 33 : index
    %cst_0 = arith.constant -1.000000e+00 : f32
    %alloc = memref.alloc() : memref<32xi64>
    %alloc_1 = memref.alloc() : memref<32xi64>
    %alloc_2 = memref.alloc() : memref<32xi64>
    %alloc_3 = memref.alloc() : memref<32xi64>
    %alloc_4 = memref.alloc() : memref<32xi64>
    %alloc_5 = memref.alloc() : memref<33xf32>
    %alloc_6 = memref.alloc() : memref<33xf32>
    %alloc_7 = memref.alloc() : memref<36xf32>
    %cst_8 = arith.constant dense<[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32]> : vector<32xi64>
    vector.transfer_write %cst_8, %alloc[%c0] : vector<32xi64>, memref<32xi64>
    %cst_9 = arith.constant dense<[33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64]> : vector<32xi64>
    vector.transfer_write %cst_9, %alloc_2[%c0] : vector<32xi64>, memref<32xi64>
    %cst_10 = arith.constant dense<[-9, 76, -7, 78, -5, 80, -3, 82, -1, 84, 1, 86, 3, 88, 5, 90, 7, 92, 9, 94, 11, 96, 13, 98, 15, 100, 17, 102, 19, 104, 21, 106]> : vector<32xi64>
    vector.transfer_write %cst_10, %alloc_4[%c0] : vector<32xi64>, memref<32xi64>
    %0 = vector.broadcast %c0_i64 : i64 to vector<32xi64>
    vector.transfer_write %0, %alloc_1[%c0] : vector<32xi64>, memref<32xi64>
    %1 = vector.broadcast %c1_i64 : i64 to vector<32xi64>
    vector.transfer_write %1, %alloc_3[%c0] : vector<32xi64>, memref<32xi64>
    %cst_11 = arith.constant dense<[1.500000e+00, 2.500000e+00, 3.500000e+00, 4.500000e+00, 5.500000e+00, 6.500000e+00, 7.500000e+00, 8.500000e+00, 9.500000e+00, 1.050000e+01, 1.150000e+01, 1.250000e+01, 1.350000e+01, 1.450000e+01, 1.550000e+01, 1.650000e+01, 1.750000e+01, 1.850000e+01, 1.950000e+01, 2.050000e+01, 2.150000e+01, 2.250000e+01, 2.350000e+01, 2.450000e+01, 2.550000e+01, 2.650000e+01, 2.750000e+01, 2.850000e+01, 2.950000e+01, 3.050000e+01, 3.150000e+01, 3.250000e+01, 3.350000e+01]> : vector<33xf32>
    vector.transfer_write %cst_11, %alloc_5[%c0] : vector<33xf32>, memref<33xf32>
    %cst_12 = arith.constant dense<[4.050000e+01, 3.950000e+01, 3.850000e+01, 3.750000e+01, 3.650000e+01, 3.550000e+01, 3.450000e+01, 3.350000e+01, 3.250000e+01, 3.150000e+01, 3.050000e+01, 2.950000e+01, 2.850000e+01, 2.750000e+01, 2.650000e+01, 2.550000e+01, 2.450000e+01, 2.350000e+01, 2.250000e+01, 2.150000e+01, 2.050000e+01, 1.950000e+01, 1.850000e+01, 1.750000e+01, 1.650000e+01, 1.550000e+01, 1.450000e+01, 1.350000e+01, 1.250000e+01, 1.150000e+01, 1.050000e+01, 9.500000e+00, 8.500000e+00]> : vector<33xf32>
    vector.transfer_write %cst_12, %alloc_6[%c0] : vector<33xf32>, memref<33xf32>
    %2 = vector.broadcast %cst_0 : f32 to vector<36xf32>
    vector.transfer_write %2, %alloc_7[%c0] : vector<36xf32>, memref<36xf32>
    %cast = memref.cast %alloc : memref<32xi64> to memref<?xi64>
    %cast_13 = memref.cast %alloc_1 : memref<32xi64> to memref<?xi64>
    call @kernel_copy(%cast, %cast_13, %c32) : (memref<?xi64>, memref<?xi64>, index) -> ()
    scf.for %arg0 = %c0 to %c32 step %c4 {
      %4 = vector.transfer_read %alloc_1[%arg0], %c0_i64 : memref<32xi64>, vector<4xi64>
      vector.print %4 : vector<4xi64>
    }
    %cast_14 = memref.cast %alloc : memref<32xi64> to memref<?xi64>
    %cast_15 = memref.cast %alloc_2 : memref<32xi64> to memref<?xi64>
    %cast_16 = memref.cast %alloc_3 : memref<32xi64> to memref<?xi64>
    call @kernel_muladd(%cast_14, %cast_15, %cast_16, %c32) : (memref<?xi64>, memref<?xi64>, memref<?xi64>, index) -> ()
    scf.for %arg0 = %c0 to %c32 step %c4 {
      %4 = vector.transfer_read %alloc_3[%arg0], %c0_i64 : memref<32xi64>, vector<4xi64>
      vector.print %4 : vector<4xi64>
    }
    %cast_17 = memref.cast %alloc_2 : memref<32xi64> to memref<?xi64>
    %cast_18 = memref.cast %alloc_4 : memref<32xi64> to memref<?xi64>
    %cast_19 = memref.cast %alloc_3 : memref<32xi64> to memref<?xi64>
    call @kernel_absdiff(%cast_17, %cast_18, %cast_19, %c32) : (memref<?xi64>, memref<?xi64>, memref<?xi64>, index) -> ()
    scf.for %arg0 = %c0 to %c32 step %c4 {
      %4 = vector.transfer_read %alloc_3[%arg0], %c0_i64 : memref<32xi64>, vector<4xi64>
      vector.print %4 : vector<4xi64>
    }
    %cast_20 = memref.cast %alloc_5 : memref<33xf32> to memref<?xf32>
    %cast_21 = memref.cast %alloc_6 : memref<33xf32> to memref<?xf32>
    %cast_22 = memref.cast %alloc_7 : memref<36xf32> to memref<?xf32>
    call @kernel_addition(%cast_20, %cast_21, %cast_22, %c33) : (memref<?xf32>, memref<?xf32>, memref<?xf32>, index) -> ()
    scf.for %arg0 = %c0 to %c32 step %c8 {
      %4 = vector.transfer_read %alloc_7[%arg0], %cst : memref<36xf32>, vector<8xf32>
      vector.print %4 : vector<8xf32>
    }
    %3 = vector.transfer_read %alloc_7[%c32], %cst : memref<36xf32>, vector<4xf32>
    vector.print %3 : vector<4xf32>
    memref.dealloc %alloc : memref<32xi64>
    memref.dealloc %alloc_1 : memref<32xi64>
    memref.dealloc %alloc_2 : memref<32xi64>
    memref.dealloc %alloc_3 : memref<32xi64>
    memref.dealloc %alloc_4 : memref<32xi64>
    memref.dealloc %alloc_5 : memref<33xf32>
    memref.dealloc %alloc_6 : memref<33xf32>
    memref.dealloc %alloc_7 : memref<36xf32>
    return
  }
}

