module {
  func.func @foo() -> f8E4M3FN {
    %cst = arith.constant 2.250000e+00 : f8E4M3FN
    return %cst : f8E4M3FN
  }
  func.func @bar() -> f6E3M2FN {
    %cst = arith.constant 3.000000e+00 : f6E3M2FN
    return %cst : f6E3M2FN
  }
  func.func @full_example() {
    %cst = arith.constant 1.375000e+00 : f8E4M3FN
    %0 = call @foo() : () -> f8E4M3FN
    %1 = arith.addf %cst, %0 : f8E4M3FN
    vector.print %1 : f8E4M3FN
    %cst_0 = arith.constant 2.500000e+00 : f6E3M2FN
    %2 = call @bar() : () -> f6E3M2FN
    %3 = arith.addf %cst_0, %2 : f6E3M2FN
    vector.print %3 : f6E3M2FN
    return
  }
}

// -----
module {
  func.func @addf(%arg0: f4E2M1FN, %arg1: f4E2M1FN) {
    %0 = arith.addf %arg0, %arg1 : f4E2M1FN
    return
  }
}

// -----
module {
  func.func @subf(%arg0: f4E2M1FN, %arg1: f4E2M1FN) {
    %0 = arith.subf %arg0, %arg1 : f4E2M1FN
    return
  }
}

// -----
module {
  func.func @subf(%arg0: f4E2M1FN, %arg1: f4E2M1FN) {
    %0 = arith.mulf %arg0, %arg1 : f4E2M1FN
    return
  }
}

// -----
module {
  func.func @subf(%arg0: f4E2M1FN, %arg1: f4E2M1FN) {
    %0 = arith.divf %arg0, %arg1 : f4E2M1FN
    return
  }
}

// -----
module {
  func.func @remf(%arg0: f4E2M1FN, %arg1: f4E2M1FN) {
    %0 = arith.remf %arg0, %arg1 : f4E2M1FN
    return
  }
}

// -----
module {
  func.func @extf(%arg0: f4E2M1FN) {
    %0 = arith.extf %arg0 : f4E2M1FN to f32
    return
  }
}

// -----
module {
  func.func @truncf(%arg0: bf16) {
    %0 = arith.truncf %arg0 : bf16 to f4E2M1FN
    return
  }
}

// -----
module {
  func.func @fptosi(%arg0: f16) {
    %0 = arith.fptosi %arg0 : f16 to i4
    return
  }
}

// -----
module {
  func.func @fptoui(%arg0: f16) {
    %0 = arith.fptoui %arg0 : f16 to i4
    return
  }
}

// -----
module {
  func.func @sitofp(%arg0: i32) {
    %0 = arith.sitofp %arg0 : i32 to f4E2M1FN
    return
  }
}

// -----
module {
  func.func @uitofp(%arg0: i32) {
    %0 = arith.uitofp %arg0 : i32 to f4E2M1FN
    return
  }
}

// -----
module {
  func.func @cmpf(%arg0: f4E2M1FN, %arg1: f4E2M1FN) {
    %0 = arith.cmpf ult, %arg0, %arg1 : f4E2M1FN
    return
  }
}

// -----
module {
  func.func @negf(%arg0: f32) {
    %0 = arith.negf %arg0 : f32
    return
  }
}

// -----
module {
  func.func @flush_denormals(%arg0: f32) {
    %0 = arith.flush_denormals %arg0 : f32
    return
  }
}

// -----
module {
  func.func @flush_denormals_f8(%arg0: f8E4M3FN) {
    %0 = arith.flush_denormals %arg0 : f8E4M3FN
    return
  }
}

// -----
module {
  func.func @minimumf(%arg0: f32, %arg1: f32) {
    %0 = arith.minimumf %arg0, %arg1 : f32
    return
  }
}

// -----
module {
  func.func @maximumf(%arg0: f32, %arg1: f32) {
    %0 = arith.maximumf %arg0, %arg1 : f32
    return
  }
}

// -----
module {
  func.func @minnumf(%arg0: f32, %arg1: f32) {
    %0 = arith.minnumf %arg0, %arg1 : f32
    return
  }
}

// -----
module {
  func.func @maxnumf(%arg0: f32, %arg1: f32) {
    %0 = arith.maxnumf %arg0, %arg1 : f32
    return
  }
}

// -----
module {
  func.func @unsupported_bitwidth(%arg0: f128, %arg1: f128, %arg2: f32) {
    %0 = arith.addf %arg0, %arg1 : f128
    %1 = arith.negf %arg0 : f128
    %2 = arith.cmpf ult, %arg0, %arg1 : f128
    %3 = arith.extf %arg2 : f32 to f128
    %4 = arith.truncf %arg0 : f128 to f32
    %5 = arith.fptosi %arg0 : f128 to i32
    %6 = arith.fptosi %arg2 : f32 to i92
    %7 = arith.sitofp %2 : i1 to f128
    %8 = arith.sitofp %6 : i92 to f32
    return
  }
}

// -----
module {
  func.func @addf_vector(%arg0: vector<4xf4E2M1FN>, %arg1: vector<4xf4E2M1FN>) {
    %0 = arith.addf %arg0, %arg1 : vector<4xf4E2M1FN>
    return
  }
}

