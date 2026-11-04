module {
  func.func @foo() -> (f8E4M3FN, f32) {
    %cst = arith.constant 2.250000e+00 : f8E4M3FN
    %cst_0 = arith.constant 2.200000e+00 : f32
    return %cst, %cst_0 : f8E4M3FN, f32
  }
  func.func @entry() {
    %cst = arith.constant 1.375000e+00 : f8E4M3FN
    %cst_0 = arith.constant 1.400000e+00 : f32
    %0:2 = call @foo() : () -> (f8E4M3FN, f32)
    vector.print %0#1 : f32
    %1 = arith.addf %cst, %0#0 : f8E4M3FN
    vector.print %1 : f8E4M3FN
    %2 = arith.addf %cst_0, %0#1 : f32
    vector.print %2 : f32
    %3 = arith.truncf %0#1 : f32 to f8E4M3FN
    vector.print %3 : f8E4M3FN
    %4 = arith.negf %3 : f8E4M3FN
    vector.print %4 : f8E4M3FN
    %5 = arith.minimumf %3, %4 : f8E4M3FN
    vector.print %5 : f8E4M3FN
    %6 = arith.cmpf olt, %3, %1 : f8E4M3FN
    vector.print %6 : i1
    %7 = arith.fptosi %3 : f8E4M3FN to i2
    vector.print %7 : i2
    %8 = arith.fptoui %3 : f8E4M3FN to i2
    vector.print %8 : i2
    %c-9_i16 = arith.constant -9 : i16
    %9 = arith.sitofp %c-9_i16 : i16 to f4E2M1FN
    vector.print %9 : f4E2M1FN
    %10 = arith.uitofp %c-9_i16 : i16 to f4E2M1FN
    vector.print %10 : f4E2M1FN
    return
  }
}

