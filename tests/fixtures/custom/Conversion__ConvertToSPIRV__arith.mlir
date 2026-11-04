module {
  func.func @int32_scalar(%arg0: i32, %arg1: i32) {
    %0 = arith.addi %arg0, %arg1 : i32
    %1 = arith.subi %arg0, %arg1 : i32
    %2 = arith.muli %arg0, %arg1 : i32
    %3 = arith.divsi %arg0, %arg1 : i32
    %4 = arith.divui %arg0, %arg1 : i32
    %5 = arith.remui %arg0, %arg1 : i32
    return
  }
  func.func @int32_scalar_srem(%arg0: i32, %arg1: i32) {
    %0 = arith.remsi %arg0, %arg1 : i32
    return
  }
}

// -----
module {
  func.func @bitwise_scalar(%arg0: i32, %arg1: i32) {
    %0 = arith.andi %arg0, %arg1 : i32
    %1 = arith.ori %arg0, %arg1 : i32
    %2 = arith.xori %arg0, %arg1 : i32
    return
  }
  func.func @bitwise_vector(%arg0: vector<4xi32>, %arg1: vector<4xi32>) {
    %0 = arith.andi %arg0, %arg1 : vector<4xi32>
    %1 = arith.ori %arg0, %arg1 : vector<4xi32>
    %2 = arith.xori %arg0, %arg1 : vector<4xi32>
    return
  }
  func.func @logical_scalar(%arg0: i1, %arg1: i1) {
    %0 = arith.andi %arg0, %arg1 : i1
    %1 = arith.ori %arg0, %arg1 : i1
    %2 = arith.xori %arg0, %arg1 : i1
    return
  }
  func.func @logical_vector(%arg0: vector<4xi1>, %arg1: vector<4xi1>) {
    %0 = arith.andi %arg0, %arg1 : vector<4xi1>
    %1 = arith.ori %arg0, %arg1 : vector<4xi1>
    %2 = arith.xori %arg0, %arg1 : vector<4xi1>
    return
  }
  func.func @shift_scalar(%arg0: i32, %arg1: i32) {
    %0 = arith.shli %arg0, %arg1 : i32
    %1 = arith.shrsi %arg0, %arg1 : i32
    %2 = arith.shrui %arg0, %arg1 : i32
    return
  }
  func.func @shift_vector(%arg0: vector<4xi32>, %arg1: vector<4xi32>) {
    %0 = arith.shli %arg0, %arg1 : vector<4xi32>
    %1 = arith.shrsi %arg0, %arg1 : vector<4xi32>
    %2 = arith.shrui %arg0, %arg1 : vector<4xi32>
    return
  }
}

// -----
module {
  func.func @cmpf(%arg0: f32, %arg1: f32) {
    %0 = arith.cmpf oeq, %arg0, %arg1 : f32
    return
  }
  func.func @vec1cmpf(%arg0: vector<1xf32>, %arg1: vector<1xf32>) {
    %0 = arith.cmpf ogt, %arg0, %arg1 : vector<1xf32>
    %1 = arith.cmpf ult, %arg0, %arg1 : vector<1xf32>
    return
  }
}

// -----
module {
  func.func @cmpi(%arg0: i32, %arg1: i32) {
    %0 = arith.cmpi eq, %arg0, %arg1 : i32
    return
  }
  func.func @indexcmpi(%arg0: index, %arg1: index) {
    %0 = arith.cmpi eq, %arg0, %arg1 : index
    return
  }
  func.func @vec1cmpi(%arg0: vector<1xi32>, %arg1: vector<1xi32>) {
    %0 = arith.cmpi ult, %arg0, %arg1 : vector<1xi32>
    %1 = arith.cmpi sgt, %arg0, %arg1 : vector<1xi32>
    return
  }
  func.func @boolcmpi_equality(%arg0: i1, %arg1: i1) {
    %0 = arith.cmpi eq, %arg0, %arg1 : i1
    %1 = arith.cmpi ne, %arg0, %arg1 : i1
    return
  }
  func.func @boolcmpi_unsigned(%arg0: i1, %arg1: i1) {
    %0 = arith.cmpi uge, %arg0, %arg1 : i1
    %1 = arith.cmpi ult, %arg0, %arg1 : i1
    return
  }
  func.func @vec1boolcmpi_equality(%arg0: vector<1xi1>, %arg1: vector<1xi1>) {
    %0 = arith.cmpi eq, %arg0, %arg1 : vector<1xi1>
    %1 = arith.cmpi ne, %arg0, %arg1 : vector<1xi1>
    return
  }
  func.func @vec1boolcmpi_unsigned(%arg0: vector<1xi1>, %arg1: vector<1xi1>) {
    %0 = arith.cmpi uge, %arg0, %arg1 : vector<1xi1>
    %1 = arith.cmpi ult, %arg0, %arg1 : vector<1xi1>
    return
  }
  func.func @vecboolcmpi_equality(%arg0: vector<4xi1>, %arg1: vector<4xi1>) {
    %0 = arith.cmpi eq, %arg0, %arg1 : vector<4xi1>
    %1 = arith.cmpi ne, %arg0, %arg1 : vector<4xi1>
    return
  }
  func.func @vecboolcmpi_unsigned(%arg0: vector<3xi1>, %arg1: vector<3xi1>) {
    %0 = arith.cmpi uge, %arg0, %arg1 : vector<3xi1>
    %1 = arith.cmpi ult, %arg0, %arg1 : vector<3xi1>
    return
  }
}

