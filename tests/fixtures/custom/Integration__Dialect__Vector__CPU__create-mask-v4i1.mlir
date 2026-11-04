module {
  func.func @entry() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c5 = arith.constant 5 : index
    %0 = vector.create_mask %c2 : vector<4xi1>
    vector.print %0 : vector<4xi1>
    scf.for %arg0 = %c0 to %c5 step %c1 {
      %3 = vector.create_mask %arg0 : vector<4xi1>
      vector.print %3 : vector<4xi1>
    }
    %1 = vector.create_mask %c2, %c3 : vector<4x4xi1>
    vector.print %1 : vector<4x4xi1>
    %2 = vector.create_mask %c3, %c2 : vector<4x4xi1>
    vector.print %2 : vector<4x4xi1>
    scf.for %arg0 = %c0 to %c5 step %c1 {
      %3 = vector.create_mask %c2, %arg0 : vector<4x4xi1>
      vector.print %3 : vector<4x4xi1>
    }
    scf.for %arg0 = %c0 to %c5 step %c1 {
      %3 = vector.create_mask %arg0, %c2 : vector<4x4xi1>
      vector.print %3 : vector<4x4xi1>
    }
    scf.for %arg0 = %c0 to %c5 step %c1 {
      scf.for %arg1 = %c0 to %c5 step %c1 {
        %3 = vector.create_mask %arg0, %arg1 : vector<4x4xi1>
        vector.print %3 : vector<4x4xi1>
      }
    }
    return
  }
}

