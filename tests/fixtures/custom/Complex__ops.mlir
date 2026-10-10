module {
  func.func @ops(%arg0: f32) {
    %cst = complex.constant [1.000000e-01, -1.000000e+00] : complex<f64>
    %cst_0 = complex.constant [1.000000e-01 : f32, -1.000000e+00 : f32] : complex<f32>
    %cst_1 = complex.constant [true, false] : complex<i1>
    %0 = complex.create %arg0, %arg0 : complex<f32>
    %1 = complex.re %0 : complex<f32>
    %2 = complex.im %0 : complex<f32>
    %3 = complex.abs %0 : complex<f32>
    %4 = complex.add %0, %0 : complex<f32>
    %5 = complex.cos %0 : complex<f32>
    %6 = complex.div %0, %0 : complex<f32>
    %7 = complex.eq %0, %0 : complex<f32>
    %8 = complex.exp %0 : complex<f32>
    %9 = complex.expm1 %0 : complex<f32>
    %10 = complex.log %0 : complex<f32>
    %11 = complex.log1p %0 : complex<f32>
    %12 = complex.mul %0, %0 : complex<f32>
    %13 = complex.neg %0 : complex<f32>
    %14 = complex.neq %0, %0 : complex<f32>
    %15 = complex.sign %0 : complex<f32>
    %16 = complex.sin %0 : complex<f32>
    %17 = complex.sub %0, %0 : complex<f32>
    %18 = complex.tanh %0 : complex<f32>
    %19 = complex.pow %0, %0 : complex<f32>
    %20 = complex.sqrt %0 : complex<f32>
    %21 = complex.rsqrt %0 : complex<f32>
    %22 = complex.atan2 %0, %0 : complex<f32>
    %23 = complex.tan %0 : complex<f32>
    %24 = complex.bitcast %0 : complex<f32> to i64
    return
  }
}

