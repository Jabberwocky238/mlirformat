module {
  func.func @entry() -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    %c2_i32 = arith.constant 2 : i32
    %c7_i32 = arith.constant 7 : i32
    %c12_i32 = arith.constant 12 : i32
    %c-10_i32 = arith.constant -10 : i32
    %c-219_i32 = arith.constant -219 : i32
    %0 = vector.broadcast %c1_i32 : i32 to vector<16xi32>
    %1 = vector.insert %c2_i32, %0 [1] : i32 into vector<16xi32>
    %2 = vector.insert %c7_i32, %1 [4] : i32 into vector<16xi32>
    %3 = vector.insert %c12_i32, %2 [6] : i32 into vector<16xi32>
    %4 = vector.insert %c-10_i32, %3 [7] : i32 into vector<16xi32>
    %5 = vector.insert %c0_i32, %4 [10] : i32 into vector<16xi32>
    %6 = vector.insert %c0_i32, %5 [12] : i32 into vector<16xi32>
    %7 = vector.insert %c7_i32, %6 [13] : i32 into vector<16xi32>
    %8 = vector.insert %c7_i32, %7 [14] : i32 into vector<16xi32>
    %9 = vector.insert %c0_i32, %8 [15] : i32 into vector<16xi32>
    vector.print %9 : vector<16xi32>
    %10 = vector.broadcast %c1_i32 : i32 to vector<16xi32>
    %11 = vector.insert %c2_i32, %10 [4] : i32 into vector<16xi32>
    %12 = vector.insert %c-219_i32, %11 [7] : i32 into vector<16xi32>
    %13 = vector.insert %c12_i32, %12 [8] : i32 into vector<16xi32>
    %14 = vector.insert %c12_i32, %13 [9] : i32 into vector<16xi32>
    %15 = vector.insert %c12_i32, %14 [10] : i32 into vector<16xi32>
    %16 = vector.insert %c0_i32, %15 [11] : i32 into vector<16xi32>
    %17 = vector.insert %c0_i32, %16 [12] : i32 into vector<16xi32>
    %18 = vector.insert %c0_i32, %17 [13] : i32 into vector<16xi32>
    %19 = vector.insert %c0_i32, %18 [15] : i32 into vector<16xi32>
    vector.print %19 : vector<16xi32>
    %k1, %k2 = x86.avx512.vp2intersect %9, %19 : vector<16xi32>
    vector.print %k1 : vector<16xi1>
    vector.print %k2 : vector<16xi1>
    return %c0_i32 : i32
  }
}

