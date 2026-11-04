module {
  func.func @test_outerproduct_no_accumulator_2x2xf64() {
    %c0 = arith.constant 0 : index
    %cst = arith.constant dense<1> : vector<[2]xi32>
    %0 = llvm.intr.stepvector : vector<[2]xi32>
    %1 = arith.addi %0, %cst : vector<[2]xi32>
    %2 = arith.sitofp %1 : vector<[2]xi32> to vector<[2]xf64>
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %3 = vector.create_mask %c1, %c2 : vector<[2]x[2]xi1>
    %4 = vector.outerproduct %2, %2 : vector<[2]xf64>, vector<[2]xf64>
    vector.print str "TILE BEGIN\0A"
    vector.print %4 : vector<[2]x[2]xf64>
    vector.print str "TILE END\0A"
    return
  }
  func.func @test_outerproduct_with_accumulator_2x2xf64() {
    %c0 = arith.constant 0 : index
    %cst = arith.constant dense<1> : vector<[2]xi32>
    %cst_0 = arith.constant 1.000000e+01 : f64
    %0 = vector.broadcast %cst_0 : f64 to vector<[2]x[2]xf64>
    %1 = llvm.intr.stepvector : vector<[2]xi32>
    %2 = arith.addi %1, %cst : vector<[2]xi32>
    %3 = arith.sitofp %2 : vector<[2]xi32> to vector<[2]xf64>
    %4 = vector.outerproduct %3, %3, %0 {kind = #vector.kind<add>} : vector<[2]xf64>, vector<[2]xf64>
    vector.print str "TILE BEGIN\0A"
    vector.print %4 : vector<[2]x[2]xf64>
    vector.print str "TILE END\0A"
    return
  }
  func.func @test_masked_outerproduct_no_accumulator_2x2xf64() {
    %c0 = arith.constant 0 : index
    %cst = arith.constant dense<1> : vector<[2]xi32>
    %cst_0 = arith.constant 1.000000e+01 : f64
    %0 = llvm.intr.stepvector : vector<[2]xi32>
    %1 = arith.addi %0, %cst : vector<[2]xi32>
    %2 = arith.sitofp %1 : vector<[2]xi32> to vector<[2]xf64>
    %c2 = arith.constant 2 : index
    %c1 = arith.constant 1 : index
    %3 = vector.create_mask %c2, %c1 : vector<[2]x[2]xi1>
    %4 = vector.mask %3 { vector.outerproduct %2, %2 : vector<[2]xf64>, vector<[2]xf64> } : vector<[2]x[2]xi1> -> vector<[2]x[2]xf64>
    vector.print str "TILE BEGIN\0A"
    vector.print %4 : vector<[2]x[2]xf64>
    vector.print str "TILE END\0A"
    return
  }
  func.func @test_masked_outerproduct_with_accumulator_2x2xf64() {
    %c0 = arith.constant 0 : index
    %cst = arith.constant dense<1> : vector<[2]xi32>
    %cst_0 = arith.constant 1.000000e+01 : f64
    %0 = vector.broadcast %cst_0 : f64 to vector<[2]x[2]xf64>
    %1 = llvm.intr.stepvector : vector<[2]xi32>
    %2 = arith.addi %1, %cst : vector<[2]xi32>
    %3 = arith.sitofp %2 : vector<[2]xi32> to vector<[2]xf64>
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %4 = vector.create_mask %c1, %c2 : vector<[2]x[2]xi1>
    %5 = vector.mask %4 { vector.outerproduct %3, %3, %0 {kind = #vector.kind<add>} : vector<[2]xf64>, vector<[2]xf64> } : vector<[2]x[2]xi1> -> vector<[2]x[2]xf64>
    vector.print str "TILE BEGIN\0A"
    vector.print %5 : vector<[2]x[2]xf64>
    vector.print str "TILE END\0A"
    return
  }
}

