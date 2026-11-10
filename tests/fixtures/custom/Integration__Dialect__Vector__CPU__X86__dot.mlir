module {
  func.func @entry() -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant dense<[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00]> : vector<8xf32>
    %cst_0 = arith.constant dense<[9.000000e+00, 1.000000e+01, 1.100000e+01, 1.200000e+01, 1.300000e+01, 1.400000e+01, 1.500000e+01, 1.600000e+01]> : vector<8xf32>
    %0 = x86.avx.intr.dot %cst, %cst_0 : vector<8xf32>
    %1 = vector.extract %0[%c0] : f32 from vector<8xf32>
    %2 = vector.extract %0[%c4] : f32 from vector<8xf32>
    %3 = arith.addf %1, %2 : f32
    vector.print %0 : vector<8xf32>
    vector.print %3 : f32
    return %c0_i32 : i32
  }
}

