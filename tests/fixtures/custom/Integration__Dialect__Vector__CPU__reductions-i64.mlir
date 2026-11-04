module {
  func.func @entry() {
    %c1_i64 = arith.constant 1 : i64
    %c2_i64 = arith.constant 2 : i64
    %c3_i64 = arith.constant 3 : i64
    %c4_i64 = arith.constant 4 : i64
    %c5_i64 = arith.constant 5 : i64
    %c-1_i64 = arith.constant -1 : i64
    %c-2_i64 = arith.constant -2 : i64
    %c-4_i64 = arith.constant -4 : i64
    %c-80_i64 = arith.constant -80 : i64
    %c-16_i64 = arith.constant -16 : i64
    %0 = vector.broadcast %c1_i64 : i64 to vector<10xi64>
    %1 = vector.insert %c2_i64, %0 [1] : i64 into vector<10xi64>
    %2 = vector.insert %c3_i64, %1 [2] : i64 into vector<10xi64>
    %3 = vector.insert %c4_i64, %2 [3] : i64 into vector<10xi64>
    %4 = vector.insert %c5_i64, %3 [4] : i64 into vector<10xi64>
    %5 = vector.insert %c-1_i64, %4 [5] : i64 into vector<10xi64>
    %6 = vector.insert %c-2_i64, %5 [6] : i64 into vector<10xi64>
    %7 = vector.insert %c-4_i64, %6 [7] : i64 into vector<10xi64>
    %8 = vector.insert %c-80_i64, %7 [8] : i64 into vector<10xi64>
    %9 = vector.insert %c-16_i64, %8 [9] : i64 into vector<10xi64>
    vector.print %9 : vector<10xi64>
    %10 = vector.reduction <add>, %9 : vector<10xi64> into i64
    vector.print %10 : i64
    %11 = vector.reduction <mul>, %9 : vector<10xi64> into i64
    vector.print %11 : i64
    %12 = vector.reduction <minsi>, %9 : vector<10xi64> into i64
    vector.print %12 : i64
    %13 = vector.reduction <maxsi>, %9 : vector<10xi64> into i64
    vector.print %13 : i64
    %14 = vector.reduction <and>, %9 : vector<10xi64> into i64
    vector.print %14 : i64
    %15 = vector.reduction <or>, %9 : vector<10xi64> into i64
    vector.print %15 : i64
    %16 = vector.reduction <xor>, %9 : vector<10xi64> into i64
    vector.print %16 : i64
    return
  }
}

