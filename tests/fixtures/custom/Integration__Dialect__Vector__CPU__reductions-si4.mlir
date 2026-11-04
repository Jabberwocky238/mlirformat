module {
  func.func @entry() {
    %cst = arith.constant dense<[-8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7]> : vector<16xi4>
    %0 = vector.bitcast %cst : vector<16xi4> to vector<16xsi4>
    vector.print %0 : vector<16xsi4>
    %1 = vector.reduction <add>, %0 : vector<16xsi4> into si4
    vector.print %1 : si4
    %2 = vector.reduction <mul>, %0 : vector<16xsi4> into si4
    vector.print %2 : si4
    %3 = vector.reduction <minsi>, %0 : vector<16xsi4> into si4
    vector.print %3 : si4
    %4 = vector.reduction <maxsi>, %0 : vector<16xsi4> into si4
    vector.print %4 : si4
    %5 = vector.reduction <and>, %0 : vector<16xsi4> into si4
    vector.print %5 : si4
    %6 = vector.reduction <or>, %0 : vector<16xsi4> into si4
    vector.print %6 : si4
    %7 = vector.reduction <xor>, %0 : vector<16xsi4> into si4
    vector.print %7 : si4
    return
  }
}

