module {
  func.func @main() {
    %c128_i32 = arith.constant 128 : i32
    call @setArmSVLBits(%c128_i32) : (i32) -> ()
    call @test_outerproduct_f16f16f32() : () -> ()
    return
  }
  func.func @test_outerproduct_f16f16f32() {
    %0 = llvm.mlir.undef : vector<[4]xf16>
    %cst = arith.constant dense<[0.000000e+00, 2.000000e+00, 4.000000e+00, 6.000000e+00]> : vector<4xf16>
    %cst_0 = arith.constant dense<[1.000000e+00, 3.000000e+00, 5.000000e+00, 7.000000e+00]> : vector<4xf16>
    %cst_1 = arith.constant dense<[8.000000e+00, 1.000000e+01, 1.200000e+01, 1.400000e+01]> : vector<4xf16>
    %cst_2 = arith.constant dense<[9.000000e+00, 1.100000e+01, 1.300000e+01, 1.500000e+01]> : vector<4xf16>
    %1 = vector.scalable.insert %cst, %0[0] : vector<4xf16> into vector<[4]xf16>
    %2 = vector.scalable.insert %cst_0, %0[0] : vector<4xf16> into vector<[4]xf16>
    %3 = vector.scalable.insert %cst_1, %0[0] : vector<4xf16> into vector<[4]xf16>
    %4 = vector.scalable.insert %cst_2, %0[0] : vector<4xf16> into vector<[4]xf16>
    %5 = arith.extf %1 : vector<[4]xf16> to vector<[4]xf32>
    %6 = arith.extf %2 : vector<[4]xf16> to vector<[4]xf32>
    %7 = arith.extf %3 : vector<[4]xf16> to vector<[4]xf32>
    %8 = arith.extf %4 : vector<[4]xf16> to vector<[4]xf32>
    %cst_3 = arith.constant dense<7.000000e+00> : vector<[4]x[4]xf32>
    %9 = vector.outerproduct %5, %6, %cst_3 {kind = #vector.kind<add>} : vector<[4]xf32>, vector<[4]xf32>
    %10 = vector.outerproduct %7, %8, %9 {kind = #vector.kind<add>} : vector<[4]xf32>, vector<[4]xf32>
    vector.print %10 : vector<[4]x[4]xf32>
    return
  }
  func.func @test_masked_outerproduct_f16f16f32() {
    %0 = llvm.mlir.undef : vector<[4]xf16>
    %cst = arith.constant dense<[0.000000e+00, 2.000000e+00, 4.000000e+00, 6.000000e+00]> : vector<4xf16>
    %cst_0 = arith.constant dense<[1.000000e+00, 3.000000e+00, 5.000000e+00, 7.000000e+00]> : vector<4xf16>
    %cst_1 = arith.constant dense<[8.000000e+00, 1.000000e+01, 1.200000e+01, 1.400000e+01]> : vector<4xf16>
    %cst_2 = arith.constant dense<[9.000000e+00, 1.100000e+01, 1.300000e+01, 1.500000e+01]> : vector<4xf16>
    %1 = vector.scalable.insert %cst, %0[0] : vector<4xf16> into vector<[4]xf16>
    %2 = vector.scalable.insert %cst_0, %0[0] : vector<4xf16> into vector<[4]xf16>
    %3 = vector.scalable.insert %cst_1, %0[0] : vector<4xf16> into vector<[4]xf16>
    %4 = vector.scalable.insert %cst_2, %0[0] : vector<4xf16> into vector<[4]xf16>
    %5 = arith.extf %1 : vector<[4]xf16> to vector<[4]xf32>
    %6 = arith.extf %2 : vector<[4]xf16> to vector<[4]xf32>
    %7 = arith.extf %3 : vector<[4]xf16> to vector<[4]xf32>
    %8 = arith.extf %4 : vector<[4]xf16> to vector<[4]xf32>
    %cst_3 = arith.constant dense<7.000000e+00> : vector<[4]x[4]xf32>
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %9 = vector.create_mask %c2, %c3 : vector<[4]x[4]xi1>
    %10 = vector.create_mask %c3, %c2 : vector<[4]x[4]xi1>
    %11 = vector.mask %9 { vector.outerproduct %5, %6, %cst_3 {kind = #vector.kind<add>} : vector<[4]xf32>, vector<[4]xf32> } : vector<[4]x[4]xi1> -> vector<[4]x[4]xf32>
    %12 = vector.mask %10 { vector.outerproduct %7, %8, %11 {kind = #vector.kind<add>} : vector<[4]xf32>, vector<[4]xf32> } : vector<[4]x[4]xi1> -> vector<[4]x[4]xf32>
    vector.print %12 : vector<[4]x[4]xf32>
    return
  }
  func.func private @setArmSVLBits(i32)
}

