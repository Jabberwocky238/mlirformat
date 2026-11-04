module {
  func.func @genbool_var_1d(%arg0: index) -> vector<11xi1> {
    %0 = vector.create_mask %arg0 : vector<11xi1>
    return %0 : vector<11xi1>
  }
  func.func @genbool_var_1d_scalable(%arg0: index) -> vector<[11]xi1> {
    %0 = vector.create_mask %arg0 : vector<[11]xi1>
    return %0 : vector<[11]xi1>
  }
}

