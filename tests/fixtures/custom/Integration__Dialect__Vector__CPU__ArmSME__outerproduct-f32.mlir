module {
  func.func @test_outerproduct_no_accumulator_4x4xf32() {
    %c0 = arith.constant 0 : index
    %0 = llvm.intr.stepvector : vector<[4]xi32>
    %1 = arith.sitofp %0 : vector<[4]xi32> to vector<[4]xf32>
    %2 = vector.outerproduct %1, %1 : vector<[4]xf32>, vector<[4]xf32>
    vector.print str "TILE BEGIN\0A"
    vector.print %2 : vector<[4]x[4]xf32>
    vector.print str "TILE END\0A"
    return
  }
  func.func @test_outerproduct_with_accumulator_4x4xf32() {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 1.000000e+01 : f32
    %0 = vector.broadcast %cst : f32 to vector<[4]x[4]xf32>
    %1 = llvm.intr.stepvector : vector<[4]xi32>
    %2 = arith.sitofp %1 : vector<[4]xi32> to vector<[4]xf32>
    %3 = vector.outerproduct %2, %2, %0 {kind = #vector.kind<add>} : vector<[4]xf32>, vector<[4]xf32>
    vector.print str "TILE BEGIN\0A"
    vector.print %3 : vector<[4]x[4]xf32>
    vector.print str "TILE END\0A"
    return
  }
  func.func @test_masked_outerproduct_no_accumulator_4x4xf32() {
    %c0 = arith.constant 0 : index
    %cst = arith.constant dense<1> : vector<[4]xi32>
    %0 = llvm.intr.stepvector : vector<[4]xi32>
    %1 = arith.addi %0, %cst : vector<[4]xi32>
    %2 = arith.sitofp %1 : vector<[4]xi32> to vector<[4]xf32>
    %c3 = arith.constant 3 : index
    %c2 = arith.constant 2 : index
    %3 = vector.create_mask %c3, %c2 : vector<[4]x[4]xi1>
    %4 = vector.mask %3 { vector.outerproduct %2, %2 : vector<[4]xf32>, vector<[4]xf32> } : vector<[4]x[4]xi1> -> vector<[4]x[4]xf32>
    vector.print str "TILE BEGIN\0A"
    vector.print %4 : vector<[4]x[4]xf32>
    vector.print str "TILE END\0A"
    return
  }
  func.func @test_masked_outerproduct_with_accumulator_4x4xf32() {
    %c0 = arith.constant 0 : index
    %cst = arith.constant dense<1> : vector<[4]xi32>
    %cst_0 = arith.constant 1.000000e+01 : f32
    %0 = vector.broadcast %cst_0 : f32 to vector<[4]x[4]xf32>
    %1 = llvm.intr.stepvector : vector<[4]xi32>
    %2 = arith.addi %1, %cst : vector<[4]xi32>
    %3 = arith.sitofp %2 : vector<[4]xi32> to vector<[4]xf32>
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %4 = vector.create_mask %c2, %c3 : vector<[4]x[4]xi1>
    %5 = vector.mask %4 { vector.outerproduct %3, %3, %0 {kind = #vector.kind<add>} : vector<[4]xf32>, vector<[4]xf32> } : vector<[4]x[4]xi1> -> vector<[4]x[4]xf32>
    vector.print str "TILE BEGIN\0A"
    vector.print %5 : vector<[4]x[4]xf32>
    vector.print str "TILE END\0A"
    return
  }
}

