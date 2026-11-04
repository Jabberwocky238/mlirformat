module {
  func.func @main() {
    %c128_i32 = arith.constant 128 : i32
    call @setArmSVLBits(%c128_i32) : (i32) -> ()
    call @test_outerproduct_i8i8i32() : () -> ()
    call @test_masked_outerproduct_i8i8i32() : () -> ()
    return
  }
  func.func @test_outerproduct_i8i8i32() {
    %0 = llvm.mlir.undef : vector<[4]xi8>
    %cst = arith.constant dense<[0, 4, 8, 12]> : vector<4xi8>
    %cst_0 = arith.constant dense<[1, 5, 9, 13]> : vector<4xi8>
    %cst_1 = arith.constant dense<[2, 6, 10, 14]> : vector<4xi8>
    %cst_2 = arith.constant dense<[3, 7, 11, 15]> : vector<4xi8>
    %cst_3 = arith.constant dense<[16, 20, 24, 28]> : vector<4xi8>
    %cst_4 = arith.constant dense<[17, 21, 25, 29]> : vector<4xi8>
    %cst_5 = arith.constant dense<[18, 22, 26, 30]> : vector<4xi8>
    %cst_6 = arith.constant dense<[19, 23, 27, 31]> : vector<4xi8>
    %1 = vector.scalable.insert %cst, %0[0] : vector<4xi8> into vector<[4]xi8>
    %2 = vector.scalable.insert %cst_3, %0[0] : vector<4xi8> into vector<[4]xi8>
    %3 = vector.scalable.insert %cst_0, %0[0] : vector<4xi8> into vector<[4]xi8>
    %4 = vector.scalable.insert %cst_4, %0[0] : vector<4xi8> into vector<[4]xi8>
    %5 = vector.scalable.insert %cst_1, %0[0] : vector<4xi8> into vector<[4]xi8>
    %6 = vector.scalable.insert %cst_5, %0[0] : vector<4xi8> into vector<[4]xi8>
    %7 = vector.scalable.insert %cst_2, %0[0] : vector<4xi8> into vector<[4]xi8>
    %8 = vector.scalable.insert %cst_6, %0[0] : vector<4xi8> into vector<[4]xi8>
    %9 = arith.extsi %1 : vector<[4]xi8> to vector<[4]xi32>
    %10 = arith.extsi %2 : vector<[4]xi8> to vector<[4]xi32>
    %11 = arith.extsi %3 : vector<[4]xi8> to vector<[4]xi32>
    %12 = arith.extsi %4 : vector<[4]xi8> to vector<[4]xi32>
    %13 = arith.extsi %5 : vector<[4]xi8> to vector<[4]xi32>
    %14 = arith.extsi %6 : vector<[4]xi8> to vector<[4]xi32>
    %15 = arith.extsi %7 : vector<[4]xi8> to vector<[4]xi32>
    %16 = arith.extsi %8 : vector<[4]xi8> to vector<[4]xi32>
    %17 = vector.outerproduct %9, %10 : vector<[4]xi32>, vector<[4]xi32>
    %18 = vector.outerproduct %11, %12, %17 {kind = #vector.kind<add>} : vector<[4]xi32>, vector<[4]xi32>
    %19 = vector.outerproduct %13, %14, %18 {kind = #vector.kind<add>} : vector<[4]xi32>, vector<[4]xi32>
    %20 = vector.outerproduct %15, %16, %19 {kind = #vector.kind<add>} : vector<[4]xi32>, vector<[4]xi32>
    vector.print %20 : vector<[4]x[4]xi32>
    return
  }
  func.func @test_masked_outerproduct_i8i8i32() {
    %0 = llvm.mlir.undef : vector<[4]xi8>
    %cst = arith.constant dense<[0, 4, 8, 12]> : vector<4xi8>
    %cst_0 = arith.constant dense<[1, 5, 9, 13]> : vector<4xi8>
    %cst_1 = arith.constant dense<[2, 6, 10, 14]> : vector<4xi8>
    %cst_2 = arith.constant dense<[3, 7, 11, 15]> : vector<4xi8>
    %cst_3 = arith.constant dense<[16, 20, 24, 28]> : vector<4xi8>
    %cst_4 = arith.constant dense<[17, 21, 25, 29]> : vector<4xi8>
    %cst_5 = arith.constant dense<[18, 22, 26, 30]> : vector<4xi8>
    %cst_6 = arith.constant dense<[19, 23, 27, 31]> : vector<4xi8>
    %1 = vector.scalable.insert %cst, %0[0] : vector<4xi8> into vector<[4]xi8>
    %2 = vector.scalable.insert %cst_3, %0[0] : vector<4xi8> into vector<[4]xi8>
    %3 = vector.scalable.insert %cst_0, %0[0] : vector<4xi8> into vector<[4]xi8>
    %4 = vector.scalable.insert %cst_4, %0[0] : vector<4xi8> into vector<[4]xi8>
    %5 = vector.scalable.insert %cst_1, %0[0] : vector<4xi8> into vector<[4]xi8>
    %6 = vector.scalable.insert %cst_5, %0[0] : vector<4xi8> into vector<[4]xi8>
    %7 = vector.scalable.insert %cst_2, %0[0] : vector<4xi8> into vector<[4]xi8>
    %8 = vector.scalable.insert %cst_6, %0[0] : vector<4xi8> into vector<[4]xi8>
    %9 = arith.extsi %1 : vector<[4]xi8> to vector<[4]xi32>
    %10 = arith.extsi %2 : vector<[4]xi8> to vector<[4]xi32>
    %11 = arith.extsi %3 : vector<[4]xi8> to vector<[4]xi32>
    %12 = arith.extsi %4 : vector<[4]xi8> to vector<[4]xi32>
    %13 = arith.extsi %5 : vector<[4]xi8> to vector<[4]xi32>
    %14 = arith.extsi %6 : vector<[4]xi8> to vector<[4]xi32>
    %15 = arith.extsi %7 : vector<[4]xi8> to vector<[4]xi32>
    %16 = arith.extsi %8 : vector<[4]xi8> to vector<[4]xi32>
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c4 = arith.constant 4 : index
    %17 = vector.create_mask %c1, %c1 : vector<[4]x[4]xi1>
    %18 = vector.create_mask %c1, %c2 : vector<[4]x[4]xi1>
    %19 = vector.create_mask %c2, %c3 : vector<[4]x[4]xi1>
    %20 = vector.create_mask %c3, %c4 : vector<[4]x[4]xi1>
    %cst_7 = arith.constant dense<2> : vector<[4]x[4]xi32>
    %21 = vector.mask %17 { vector.outerproduct %9, %10, %cst_7 {kind = #vector.kind<add>} : vector<[4]xi32>, vector<[4]xi32> } : vector<[4]x[4]xi1> -> vector<[4]x[4]xi32>
    %22 = vector.mask %18 { vector.outerproduct %11, %12, %21 {kind = #vector.kind<add>} : vector<[4]xi32>, vector<[4]xi32> } : vector<[4]x[4]xi1> -> vector<[4]x[4]xi32>
    %23 = vector.mask %19 { vector.outerproduct %13, %14, %22 {kind = #vector.kind<add>} : vector<[4]xi32>, vector<[4]xi32> } : vector<[4]x[4]xi1> -> vector<[4]x[4]xi32>
    %24 = vector.mask %20 { vector.outerproduct %15, %16, %23 {kind = #vector.kind<add>} : vector<[4]xi32>, vector<[4]xi32> } : vector<[4]x[4]xi1> -> vector<[4]x[4]xi32>
    vector.print %24 : vector<[4]x[4]xi32>
    return
  }
  func.func private @setArmSVLBits(i32)
}

