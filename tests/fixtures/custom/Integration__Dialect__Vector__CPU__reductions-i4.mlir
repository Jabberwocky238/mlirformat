module {
  func.func @entry() {
    %cst = arith.constant dense<[-8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, -8, -7, -6, -5, -4, -3, -2, -1]> : vector<24xi4>
    vector.print %cst : vector<24xi4>
    %0 = vector.reduction <add>, %cst : vector<24xi4> into i4
    vector.print %0 : i4
    %1 = vector.reduction <mul>, %cst : vector<24xi4> into i4
    vector.print %1 : i4
    %2 = vector.reduction <minsi>, %cst : vector<24xi4> into i4
    vector.print %2 : i4
    %3 = vector.reduction <maxsi>, %cst : vector<24xi4> into i4
    vector.print %3 : i4
    %4 = vector.reduction <and>, %cst : vector<24xi4> into i4
    vector.print %4 : i4
    %5 = vector.reduction <or>, %cst : vector<24xi4> into i4
    vector.print %5 : i4
    %6 = vector.reduction <xor>, %cst : vector<24xi4> into i4
    vector.print %6 : i4
    return
  }
}

