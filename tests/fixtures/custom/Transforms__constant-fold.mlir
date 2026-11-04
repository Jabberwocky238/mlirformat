module {
}

// -----
module {
  func.func @affine_for(%arg0: memref<f32>) {
    affine.for %arg1 = 0 to 128 {
      affine.for %arg2 = 0 to 8 {
        %cst = arith.constant 4.500000e+00 : f32
        %cst_0 = arith.constant 1.500000e+00 : f32
        %0 = arith.addf %cst, %cst_0 : f32
        memref.store %0, %arg0[] : memref<f32>
      }
    }
    return
  }
}

// -----
module {
  func.func @simple_addf() -> f32 {
    %cst = arith.constant 4.500000e+00 : f32
    %cst_0 = arith.constant 1.500000e+00 : f32
    %0 = arith.addf %cst, %cst_0 : f32
    return %0 : f32
  }
}

// -----
module {
  func.func @addf_splat_tensor() -> tensor<4xf32> {
    %cst = arith.constant dense<4.500000e+00> : tensor<4xf32>
    %cst_0 = arith.constant dense<1.500000e+00> : tensor<4xf32>
    %0 = arith.addf %cst, %cst_0 : tensor<4xf32>
    return %0 : tensor<4xf32>
  }
}

// -----
module {
  func.func @addf_dense_tensor() -> tensor<4xf32> {
    %cst = arith.constant dense<[1.500000e+00, 2.500000e+00, 3.500000e+00, 4.500000e+00]> : tensor<4xf32>
    %cst_0 = arith.constant dense<[1.500000e+00, 2.500000e+00, 3.500000e+00, 4.500000e+00]> : tensor<4xf32>
    %0 = arith.addf %cst, %cst_0 : tensor<4xf32>
    return %0 : tensor<4xf32>
  }
}

// -----
module {
  func.func @addf_dense_and_splat_tensors() -> tensor<4xf32> {
    %cst = arith.constant dense<[1.500000e+00, 2.500000e+00, 3.500000e+00, 4.500000e+00]> : tensor<4xf32>
    %cst_0 = arith.constant dense<1.500000e+00> : tensor<4xf32>
    %0 = arith.addf %cst, %cst_0 : tensor<4xf32>
    return %0 : tensor<4xf32>
  }
}

// -----
module {
  func.func @simple_addi() -> i32 {
    %c1_i32 = arith.constant 1 : i32
    %c5_i32 = arith.constant 5 : i32
    %0 = arith.addi %c1_i32, %c5_i32 : i32
    return %0 : i32
  }
}

// -----
module {
  func.func @simple_and(%arg0: i1, %arg1: i32) -> (i1, i32) {
    %true = arith.constant true
    %c-1_i32 = arith.constant -1 : i32
    %c31_i32 = arith.constant 31 : i32
    %0 = arith.andi %arg0, %true : i1
    %1 = arith.andi %arg1, %c-1_i32 : i32
    %2 = arith.andi %1, %c31_i32 : i32
    return %0, %2 : i1, i32
  }
}

// -----
module {
  func.func @and_index(%arg0: index) -> index {
    %c31 = arith.constant 31 : index
    %c-1 = arith.constant -1 : index
    %0 = arith.andi %arg0, %c31 : index
    %1 = arith.andi %0, %c-1 : index
    return %1 : index
  }
}

// -----
module {
  func.func @tensor_and(%arg0: tensor<2xi32>) -> tensor<2xi32> {
    %cst = arith.constant dense<-1> : tensor<2xi32>
    %cst_0 = arith.constant dense<31> : tensor<2xi32>
    %cst_1 = arith.constant dense<[31, -1]> : tensor<2xi32>
    %0 = arith.andi %arg0, %cst : tensor<2xi32>
    %1 = arith.andi %0, %cst_0 : tensor<2xi32>
    %2 = arith.andi %1, %cst_1 : tensor<2xi32>
    return %2 : tensor<2xi32>
  }
}

// -----
module {
  func.func @vector_and(%arg0: vector<2xi32>) -> vector<2xi32> {
    %cst = arith.constant dense<-1> : vector<2xi32>
    %cst_0 = arith.constant dense<31> : vector<2xi32>
    %cst_1 = arith.constant dense<[31, -1]> : vector<2xi32>
    %0 = arith.andi %arg0, %cst : vector<2xi32>
    %1 = arith.andi %0, %cst_0 : vector<2xi32>
    %2 = arith.andi %1, %cst_1 : vector<2xi32>
    return %2 : vector<2xi32>
  }
}

// -----
module {
  func.func @addi_splat_vector() -> vector<8xi32> {
    %cst = arith.constant dense<1> : vector<8xi32>
    %cst_0 = arith.constant dense<5> : vector<8xi32>
    %0 = arith.addi %cst, %cst_0 : vector<8xi32>
    return %0 : vector<8xi32>
  }
}

// -----
module {
  func.func @simple_subf() -> f32 {
    %cst = arith.constant 4.500000e+00 : f32
    %cst_0 = arith.constant 1.500000e+00 : f32
    %0 = arith.subf %cst, %cst_0 : f32
    return %0 : f32
  }
}

// -----
module {
  func.func @subf_splat_vector() -> vector<4xf32> {
    %cst = arith.constant dense<4.500000e+00> : vector<4xf32>
    %cst_0 = arith.constant dense<1.500000e+00> : vector<4xf32>
    %0 = arith.subf %cst, %cst_0 : vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @simple_subi(%arg0: i32) -> (i32, i32) {
    %c4_i32 = arith.constant 4 : i32
    %c1_i32 = arith.constant 1 : i32
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.subi %c4_i32, %c1_i32 : i32
    %1 = arith.subi %arg0, %c0_i32 : i32
    return %0, %1 : i32, i32
  }
}

// -----
module {
  func.func @subi_splat_tensor() -> tensor<4xi32> {
    %cst = arith.constant dense<4> : tensor<4xi32>
    %cst_0 = arith.constant dense<1> : tensor<4xi32>
    %0 = arith.subi %cst, %cst_0 : tensor<4xi32>
    return %0 : tensor<4xi32>
  }
}

// -----
#map = affine_map<(d0, d1)[s0] -> (d0 floordiv 128 + s0 + d1 mod 128)>
#map1 = affine_map<(d0, d1)[s0] -> ((s0 ceildiv 128) * 128)>
#map2 = affine_map<(d0) -> (42)>
module {
  func.func @affine_apply(%arg0: index) -> (index, index, index) {
    %c177 = arith.constant 177 : index
    %c211 = arith.constant 211 : index
    %c1075 = arith.constant 1075 : index
    %0 = affine.apply #map(%c177, %c211)[%c1075]
    %1 = affine.apply #map1(%c177, %c211)[%c1075]
    %2 = affine.apply #map2(%arg0)
    return %0, %1, %2 : index, index, index
  }
}

// -----
module {
  func.func @simple_mulf() -> f32 {
    %cst = arith.constant 4.500000e+00 : f32
    %cst_0 = arith.constant 1.500000e+00 : f32
    %0 = arith.mulf %cst, %cst_0 : f32
    return %0 : f32
  }
}

// -----
module {
  func.func @mulf_splat_tensor() -> tensor<4xf32> {
    %cst = arith.constant dense<4.500000e+00> : tensor<4xf32>
    %cst_0 = arith.constant dense<1.500000e+00> : tensor<4xf32>
    %0 = arith.mulf %cst, %cst_0 : tensor<4xf32>
    return %0 : tensor<4xf32>
  }
}

// -----
module {
  func.func @simple_divi_signed() -> (i32, i32, i32) {
    %c0_i32 = arith.constant 0 : i32
    %c6_i32 = arith.constant 6 : i32
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.divsi %c6_i32, %c2_i32 : i32
    %c-2_i32 = arith.constant -2 : i32
    %1 = arith.divsi %c6_i32, %c-2_i32 : i32
    %2 = arith.divsi %c6_i32, %c0_i32 : i32
    return %0, %1, %2 : i32, i32, i32
  }
}

// -----
module {
  func.func @divi_signed_splat_tensor() -> (tensor<4xi32>, tensor<4xi32>, tensor<4xi32>) {
    %cst = arith.constant dense<0> : tensor<4xi32>
    %cst_0 = arith.constant dense<6> : tensor<4xi32>
    %cst_1 = arith.constant dense<2> : tensor<4xi32>
    %0 = arith.divsi %cst_0, %cst_1 : tensor<4xi32>
    %cst_2 = arith.constant dense<-2> : tensor<4xi32>
    %1 = arith.divsi %cst_0, %cst_2 : tensor<4xi32>
    %2 = arith.divsi %cst_0, %cst : tensor<4xi32>
    return %0, %1, %2 : tensor<4xi32>, tensor<4xi32>, tensor<4xi32>
  }
}

// -----
module {
  func.func @simple_divi_unsigned() -> (i32, i32, i32) {
    %c0_i32 = arith.constant 0 : i32
    %c6_i32 = arith.constant 6 : i32
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.divui %c6_i32, %c2_i32 : i32
    %c-2_i32 = arith.constant -2 : i32
    %1 = arith.divui %c6_i32, %c-2_i32 : i32
    %2 = arith.divui %c6_i32, %c0_i32 : i32
    return %0, %1, %2 : i32, i32, i32
  }
}

// -----
module {
  func.func @divi_unsigned_splat_tensor() -> (tensor<4xi32>, tensor<4xi32>, tensor<4xi32>) {
    %cst = arith.constant dense<0> : tensor<4xi32>
    %cst_0 = arith.constant dense<6> : tensor<4xi32>
    %cst_1 = arith.constant dense<2> : tensor<4xi32>
    %0 = arith.divui %cst_0, %cst_1 : tensor<4xi32>
    %cst_2 = arith.constant dense<-2> : tensor<4xi32>
    %1 = arith.divui %cst_0, %cst_2 : tensor<4xi32>
    %2 = arith.divui %cst_0, %cst : tensor<4xi32>
    return %0, %1, %2 : tensor<4xi32>, tensor<4xi32>, tensor<4xi32>
  }
}

// -----
module {
  func.func @simple_arith.floordivsi() -> (i32, i32, i32, i32, i32) {
    %c0_i32 = arith.constant 0 : i32
    %c7_i32 = arith.constant 7 : i32
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.floordivsi %c7_i32, %c2_i32 : i32
    %c-2_i32 = arith.constant -2 : i32
    %1 = arith.floordivsi %c7_i32, %c-2_i32 : i32
    %c-9_i32 = arith.constant -9 : i32
    %2 = arith.floordivsi %c-9_i32, %c2_i32 : i32
    %c-13_i32 = arith.constant -13 : i32
    %3 = arith.floordivsi %c-13_i32, %c-2_i32 : i32
    %4 = arith.floordivsi %c7_i32, %c0_i32 : i32
    return %0, %1, %2, %3, %4 : i32, i32, i32, i32, i32
  }
}

// -----
module {
  func.func @simple_arith.ceildivsi() -> (i32, i32, i32, i32, i32) {
    %c0_i32 = arith.constant 0 : i32
    %c7_i32 = arith.constant 7 : i32
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.ceildivsi %c7_i32, %c2_i32 : i32
    %c-2_i32 = arith.constant -2 : i32
    %1 = arith.ceildivsi %c7_i32, %c-2_i32 : i32
    %c-9_i32 = arith.constant -9 : i32
    %2 = arith.ceildivsi %c-9_i32, %c2_i32 : i32
    %c-15_i32 = arith.constant -15 : i32
    %3 = arith.ceildivsi %c-15_i32, %c-2_i32 : i32
    %4 = arith.ceildivsi %c7_i32, %c0_i32 : i32
    return %0, %1, %2, %3, %4 : i32, i32, i32, i32, i32
  }
}

// -----
module {
  func.func @simple_arith.ceildivsi_overflow() -> (i8, i16, i32) {
    %c7_i8 = arith.constant 7 : i8
    %c-128_i8 = arith.constant -128 : i8
    %0 = arith.ceildivsi %c-128_i8, %c7_i8 : i8
    %c7_i16 = arith.constant 7 : i16
    %c-32768_i16 = arith.constant -32768 : i16
    %1 = arith.ceildivsi %c-32768_i16, %c7_i16 : i16
    %c7_i32 = arith.constant 7 : i32
    %c-2147483648_i32 = arith.constant -2147483648 : i32
    %2 = arith.ceildivsi %c-2147483648_i32, %c7_i32 : i32
    return %0, %1, %2 : i8, i16, i32
  }
}

// -----
module {
  func.func @simple_arith.ceildivui() -> (i32, i32, i32, i32, i32) {
    %c0_i32 = arith.constant 0 : i32
    %c7_i32 = arith.constant 7 : i32
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.ceildivui %c7_i32, %c2_i32 : i32
    %c-2_i32 = arith.constant -2 : i32
    %1 = arith.ceildivui %c7_i32, %c-2_i32 : i32
    %c-8_i32 = arith.constant -8 : i32
    %2 = arith.ceildivui %c-8_i32, %c2_i32 : i32
    %c-15_i32 = arith.constant -15 : i32
    %3 = arith.ceildivui %c-15_i32, %c-2_i32 : i32
    %4 = arith.ceildivui %c7_i32, %c0_i32 : i32
    return %0, %1, %2, %3, %4 : i32, i32, i32, i32, i32
  }
}

// -----
module {
  func.func @simple_arith.remsi(%arg0: i32) -> (i32, i32, i32) {
    %c5_i32 = arith.constant 5 : i32
    %c2_i32 = arith.constant 2 : i32
    %c1_i32 = arith.constant 1 : i32
    %c-2_i32 = arith.constant -2 : i32
    %0 = arith.remsi %c5_i32, %c2_i32 : i32
    %1 = arith.remsi %c5_i32, %c-2_i32 : i32
    %2 = arith.remsi %arg0, %c1_i32 : i32
    return %0, %1, %2 : i32, i32, i32
  }
}

// -----
module {
  func.func @simple_arith.remui(%arg0: i32) -> (i32, i32, i32) {
    %c5_i32 = arith.constant 5 : i32
    %c2_i32 = arith.constant 2 : i32
    %c1_i32 = arith.constant 1 : i32
    %c-2_i32 = arith.constant -2 : i32
    %0 = arith.remui %c5_i32, %c2_i32 : i32
    %1 = arith.remui %c5_i32, %c-2_i32 : i32
    %2 = arith.remui %arg0, %c1_i32 : i32
    return %0, %1, %2 : i32, i32, i32
  }
}

// -----
module {
  func.func @muli() -> i32 {
    %c4_i32 = arith.constant 4 : i32
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.muli %c4_i32, %c2_i32 : i32
    return %0 : i32
  }
}

// -----
module {
  func.func @muli_splat_vector() -> vector<4xi32> {
    %cst = arith.constant dense<4> : vector<4xi32>
    %cst_0 = arith.constant dense<2> : vector<4xi32>
    %0 = arith.muli %cst, %cst_0 : vector<4xi32>
    return %0 : vector<4xi32>
  }
  func.func @dim(%arg0: tensor<8x4xf32>) -> index {
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c1 : tensor<8x4xf32>
    return %dim : index
  }
}

// -----
module {
  func.func @cmpi() -> (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) {
    %c42_i32 = arith.constant 42 : i32
    %c-1_i32 = arith.constant -1 : i32
    %0 = arith.cmpi eq, %c42_i32, %c-1_i32 : i32
    %1 = arith.cmpi ne, %c42_i32, %c-1_i32 : i32
    %2 = arith.cmpi slt, %c42_i32, %c-1_i32 : i32
    %3 = arith.cmpi sle, %c42_i32, %c-1_i32 : i32
    %4 = arith.cmpi sgt, %c42_i32, %c-1_i32 : i32
    %5 = arith.cmpi sge, %c42_i32, %c-1_i32 : i32
    %6 = arith.cmpi ult, %c42_i32, %c-1_i32 : i32
    %7 = arith.cmpi ule, %c42_i32, %c-1_i32 : i32
    %8 = arith.cmpi ugt, %c42_i32, %c-1_i32 : i32
    %9 = arith.cmpi uge, %c42_i32, %c-1_i32 : i32
    return %0, %1, %2, %3, %4, %5, %6, %7, %8, %9 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
  }
}

// -----
module {
  func.func @cmpf_normal_numbers() -> (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) {
    %cst = arith.constant 4.200000e+01 : f32
    %cst_0 = arith.constant -1.000000e+00 : f32
    %0 = arith.cmpf false, %cst, %cst_0 : f32
    %1 = arith.cmpf oeq, %cst, %cst_0 : f32
    %2 = arith.cmpf ogt, %cst, %cst_0 : f32
    %3 = arith.cmpf oge, %cst, %cst_0 : f32
    %4 = arith.cmpf olt, %cst, %cst_0 : f32
    %5 = arith.cmpf ole, %cst, %cst_0 : f32
    %6 = arith.cmpf one, %cst, %cst_0 : f32
    %7 = arith.cmpf ord, %cst, %cst_0 : f32
    %8 = arith.cmpf ueq, %cst, %cst_0 : f32
    %9 = arith.cmpf ugt, %cst, %cst_0 : f32
    %10 = arith.cmpf uge, %cst, %cst_0 : f32
    %11 = arith.cmpf ult, %cst, %cst_0 : f32
    %12 = arith.cmpf ule, %cst, %cst_0 : f32
    %13 = arith.cmpf une, %cst, %cst_0 : f32
    %14 = arith.cmpf uno, %cst, %cst_0 : f32
    %15 = arith.cmpf true, %cst, %cst_0 : f32
    return %0, %1, %2, %3, %4, %5, %6, %7, %8, %9, %10, %11, %12, %13, %14, %15 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
  }
}

// -----
module {
  func.func @cmpf_nan() -> (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) {
    %cst = arith.constant 4.200000e+01 : f32
    %cst_0 = arith.constant 0xFFFFFFFF : f32
    %0 = arith.cmpf false, %cst, %cst_0 : f32
    %1 = arith.cmpf oeq, %cst, %cst_0 : f32
    %2 = arith.cmpf ogt, %cst, %cst_0 : f32
    %3 = arith.cmpf oge, %cst, %cst_0 : f32
    %4 = arith.cmpf olt, %cst, %cst_0 : f32
    %5 = arith.cmpf ole, %cst, %cst_0 : f32
    %6 = arith.cmpf one, %cst, %cst_0 : f32
    %7 = arith.cmpf ord, %cst, %cst_0 : f32
    %8 = arith.cmpf ueq, %cst, %cst_0 : f32
    %9 = arith.cmpf ugt, %cst, %cst_0 : f32
    %10 = arith.cmpf uge, %cst, %cst_0 : f32
    %11 = arith.cmpf ult, %cst, %cst_0 : f32
    %12 = arith.cmpf ule, %cst, %cst_0 : f32
    %13 = arith.cmpf une, %cst, %cst_0 : f32
    %14 = arith.cmpf uno, %cst, %cst_0 : f32
    %15 = arith.cmpf true, %cst, %cst_0 : f32
    return %0, %1, %2, %3, %4, %5, %6, %7, %8, %9, %10, %11, %12, %13, %14, %15 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
  }
}

// -----
module {
  func.func @cmpf_inf() -> (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) {
    %cst = arith.constant 4.200000e+01 : f32
    %cst_0 = arith.constant 0x7F800000 : f32
    %0 = arith.cmpf false, %cst, %cst_0 : f32
    %1 = arith.cmpf oeq, %cst, %cst_0 : f32
    %2 = arith.cmpf ogt, %cst, %cst_0 : f32
    %3 = arith.cmpf oge, %cst, %cst_0 : f32
    %4 = arith.cmpf olt, %cst, %cst_0 : f32
    %5 = arith.cmpf ole, %cst, %cst_0 : f32
    %6 = arith.cmpf one, %cst, %cst_0 : f32
    %7 = arith.cmpf ord, %cst, %cst_0 : f32
    %8 = arith.cmpf ueq, %cst, %cst_0 : f32
    %9 = arith.cmpf ugt, %cst, %cst_0 : f32
    %10 = arith.cmpf uge, %cst, %cst_0 : f32
    %11 = arith.cmpf ult, %cst, %cst_0 : f32
    %12 = arith.cmpf ule, %cst, %cst_0 : f32
    %13 = arith.cmpf une, %cst, %cst_0 : f32
    %14 = arith.cmpf uno, %cst, %cst_0 : f32
    %15 = arith.cmpf true, %cst, %cst_0 : f32
    return %0, %1, %2, %3, %4, %5, %6, %7, %8, %9, %10, %11, %12, %13, %14, %15 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
  }
}

// -----
module {
  func.func @nested_isolated_region() {
    builtin.module {
      func.func @isolated_op() {
        %c1_i32 = arith.constant 1 : i32
        %0 = arith.addi %c1_i32, %c1_i32 : i32
        "foo.yield"(%0) : (i32) -> ()
      }
    }
    "foo.unknown_region"() ({
      %c1_i32 = arith.constant 1 : i32
      %0 = arith.addi %c1_i32, %c1_i32 : i32
      "foo.yield"(%0) : (i32) -> ()
    }) : () -> ()
    return
  }
}

// -----
module {
  func.func @custom_insertion_position() {
    "test.one_region_op"() ({
      %c1_i32 = arith.constant 1 : i32
      %0 = arith.addi %c1_i32, %c1_i32 : i32
      "foo.yield"(%0) : (i32) -> ()
    }) : () -> ()
    return
  }
}

// -----
module {
  func.func @subview_scalar_fold(%arg0: memref<f32>) -> memref<f32> {
    %subview = memref.subview %arg0[] [] [] : memref<f32> to memref<f32>
    return %subview : memref<f32>
  }
}

