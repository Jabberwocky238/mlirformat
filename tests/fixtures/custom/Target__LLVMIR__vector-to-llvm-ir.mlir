module {
  func.func @genbool_1d() -> vector<8xi1> {
    %0 = vector.constant_mask [4] : vector<8xi1>
    return %0 : vector<8xi1>
  }
  func.func @genbool_2d() -> vector<4x4xi1> {
    %0 = vector.constant_mask [2, 2] : vector<4x4xi1>
    return %0 : vector<4x4xi1>
  }
  func.func @genbool_3d() -> vector<2x3x4xi1> {
    %0 = vector.constant_mask [1, 1, 3] : vector<2x3x4xi1>
    return %0 : vector<2x3x4xi1>
  }
  func.func @genbool_1d_var_but_constant() -> vector<8xi1> {
    %c0 = arith.constant 0 : index
    %0 = vector.create_mask %c0 : vector<8xi1>
    return %0 : vector<8xi1>
  }
}

