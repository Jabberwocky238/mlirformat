module {
  func.func @entry() {
    %c1_i32 = arith.constant 1 : i32
    %c2_i32 = arith.constant 2 : i32
    %c3_i32 = arith.constant 3 : i32
    %c4_i32 = arith.constant 4 : i32
    %c5_i32 = arith.constant 5 : i32
    %c-1_i32 = arith.constant -1 : i32
    %c-2_i32 = arith.constant -2 : i32
    %c-4_i32 = arith.constant -4 : i32
    %c-80_i32 = arith.constant -80 : i32
    %c-16_i32 = arith.constant -16 : i32
    %0 = vector.broadcast %c1_i32 : i32 to vector<10xi32>
    %1 = vector.insert %c2_i32, %0 [1] : i32 into vector<10xi32>
    %2 = vector.insert %c3_i32, %1 [2] : i32 into vector<10xi32>
    %3 = vector.insert %c4_i32, %2 [3] : i32 into vector<10xi32>
    %4 = vector.insert %c5_i32, %3 [4] : i32 into vector<10xi32>
    %5 = vector.insert %c-1_i32, %4 [5] : i32 into vector<10xi32>
    %6 = vector.insert %c-2_i32, %5 [6] : i32 into vector<10xi32>
    %7 = vector.insert %c-4_i32, %6 [7] : i32 into vector<10xi32>
    %8 = vector.insert %c-80_i32, %7 [8] : i32 into vector<10xi32>
    %9 = vector.insert %c-16_i32, %8 [9] : i32 into vector<10xi32>
    vector.print %9 : vector<10xi32>
    %10 = vector.reduction <add>, %9 : vector<10xi32> into i32
    vector.print %10 : i32
    %11 = vector.reduction <mul>, %9 : vector<10xi32> into i32
    vector.print %11 : i32
    %12 = vector.reduction <minsi>, %9 : vector<10xi32> into i32
    vector.print %12 : i32
    %13 = vector.reduction <maxsi>, %9 : vector<10xi32> into i32
    vector.print %13 : i32
    %14 = vector.reduction <and>, %9 : vector<10xi32> into i32
    vector.print %14 : i32
    %15 = vector.reduction <or>, %9 : vector<10xi32> into i32
    vector.print %15 : i32
    %16 = vector.reduction <xor>, %9 : vector<10xi32> into i32
    vector.print %16 : i32
    return
  }
}

