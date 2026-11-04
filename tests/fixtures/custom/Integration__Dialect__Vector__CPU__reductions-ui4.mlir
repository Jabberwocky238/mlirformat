module {
  func.func @entry() {
    %cst = arith.constant dense<[0, 1, 2, 3, 4, 5, 6, 7, -8, -7, -6, -5, -4, -3, -2, -1]> : vector<16xi4>
    %0 = vector.bitcast %cst : vector<16xi4> to vector<16xui4>
    vector.print %0 : vector<16xui4>
    %1 = vector.reduction <add>, %0 : vector<16xui4> into ui4
    vector.print %1 : ui4
    %2 = vector.reduction <mul>, %0 : vector<16xui4> into ui4
    vector.print %2 : ui4
    %3 = vector.reduction <minui>, %0 : vector<16xui4> into ui4
    vector.print %3 : ui4
    %4 = vector.reduction <maxui>, %0 : vector<16xui4> into ui4
    vector.print %4 : ui4
    %5 = vector.reduction <and>, %0 : vector<16xui4> into ui4
    vector.print %5 : ui4
    %6 = vector.reduction <or>, %0 : vector<16xui4> into ui4
    vector.print %6 : ui4
    %7 = vector.reduction <xor>, %0 : vector<16xui4> into ui4
    vector.print %7 : ui4
    return
  }
}

