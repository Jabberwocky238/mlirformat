module {
  func.func @entry() {
    %0 = vector.constant_mask [4] : vector<8xi1>
    vector.print %0 : vector<8xi1>
    %1 = vector.constant_mask [1, 3] : vector<4x4xi1>
    vector.print %1 : vector<4x4xi1>
    %2 = vector.constant_mask [2, 2] : vector<4x4xi1>
    vector.print %2 : vector<4x4xi1>
    %3 = vector.constant_mask [2, 4] : vector<4x4xi1>
    vector.print %3 : vector<4x4xi1>
    %4 = vector.constant_mask [3, 1] : vector<4x4xi1>
    vector.print %4 : vector<4x4xi1>
    %5 = vector.constant_mask [3, 2] : vector<4x4xi1>
    vector.print %5 : vector<4x4xi1>
    %6 = vector.constant_mask [4, 3] : vector<4x4xi1>
    vector.print %6 : vector<4x4xi1>
    %7 = vector.constant_mask [4, 4] : vector<4x4xi1>
    vector.print %7 : vector<4x4xi1>
    %8 = vector.constant_mask [1, 2, 3] : vector<2x3x4xi1>
    vector.print %8 : vector<2x3x4xi1>
    %9 = vector.constant_mask [2, 2, 3] : vector<2x3x4xi1>
    vector.print %9 : vector<2x3x4xi1>
    return
  }
}

