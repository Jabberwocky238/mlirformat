module {
  func.func @exp(%arg0: f32) {
    %0 = spirv.CL.exp %arg0 : f32
    return
  }
  func.func @expvec(%arg0: vector<3xf16>) {
    %0 = spirv.CL.exp %arg0 : vector<3xf16>
    return
  }
}

// -----
// -----
// -----
// -----
// -----
module {
  func.func @fabs(%arg0: f32) {
    %0 = spirv.CL.fabs %arg0 : f32
    return
  }
  func.func @fabsvec(%arg0: vector<3xf16>) {
    %0 = spirv.CL.fabs %arg0 : vector<3xf16>
    return
  }
  func.func @fabsf64(%arg0: f64) {
    %0 = spirv.CL.fabs %arg0 : f64
    return
  }
}

// -----
// -----
// -----
// -----
// -----
module {
  func.func @sabs(%arg0: i32) {
    %0 = spirv.CL.s_abs %arg0 : i32
    return
  }
  func.func @sabsvec(%arg0: vector<3xi16>) {
    %0 = spirv.CL.s_abs %arg0 : vector<3xi16>
    return
  }
  func.func @sabsi64(%arg0: i64) {
    %0 = spirv.CL.s_abs %arg0 : i64
    return
  }
  func.func @sabsi8(%arg0: i8) {
    %0 = spirv.CL.s_abs %arg0 : i8
    return
  }
}

// -----
// -----
// -----
// -----
// -----
module {
  func.func @fma(%arg0: f32, %arg1: f32, %arg2: f32) {
    %0 = spirv.CL.fma %arg0, %arg1, %arg2 : f32
    return
  }
}

// -----
module {
  func.func @fma(%arg0: vector<3xf32>, %arg1: vector<3xf32>, %arg2: vector<3xf32>) {
    %0 = spirv.CL.fma %arg0, %arg1, %arg2 : vector<3xf32>
    return
  }
}

// -----
module {
  func.func @mix(%arg0: f32, %arg1: f32, %arg2: f32) {
    %0 = spirv.CL.mix %arg0, %arg1, %arg2 : f32
    return
  }
}

// -----
module {
  func.func @mix(%arg0: vector<3xf32>, %arg1: vector<3xf32>, %arg2: vector<3xf32>) {
    %0 = spirv.CL.mix %arg0, %arg1, %arg2 : vector<3xf32>
    return
  }
}

// -----
module {
  func.func @fmaxmin(%arg0: f32, %arg1: f32) {
    %0 = spirv.CL.fmax %arg0, %arg1 : f32
    %1 = spirv.CL.fmin %arg0, %arg1 : f32
    return
  }
  func.func @fmaxminvec(%arg0: vector<3xf16>, %arg1: vector<3xf16>) {
    %0 = spirv.CL.fmax %arg0, %arg1 : vector<3xf16>
    %1 = spirv.CL.fmin %arg0, %arg1 : vector<3xf16>
    return
  }
  func.func @fmaxminf64(%arg0: f64, %arg1: f64) {
    %0 = spirv.CL.fmax %arg0, %arg1 : f64
    %1 = spirv.CL.fmin %arg0, %arg1 : f64
    return
  }
  func.func @iminmax(%arg0: i32, %arg1: i32) {
    %0 = spirv.CL.s_max %arg0, %arg1 : i32
    %1 = spirv.CL.u_max %arg0, %arg1 : i32
    %2 = spirv.CL.s_min %arg0, %arg1 : i32
    %3 = spirv.CL.u_min %arg0, %arg1 : i32
    return
  }
}

// -----
module {
  func.func @rint(%arg0: f32) {
    %0 = spirv.CL.rint %arg0 : f32
    return
  }
  func.func @rintvec(%arg0: vector<3xf16>) {
    %0 = spirv.CL.rint %arg0 : vector<3xf16>
    return
  }
}

// -----
module {
  func.func @printf(%arg0: !spirv.ptr<i8, UniformConstant>, %arg1: i32, %arg2: i32) -> i32 {
    %0 = spirv.CL.printf %arg0 %arg1, %arg2 : !spirv.ptr<i8, UniformConstant>, i32, i32 -> i32
    return %0 : i32
  }
}

// -----
module {
  func.func @tan(%arg0: f32) {
    %0 = spirv.CL.tan %arg0 : f32
    return
  }
}

// -----
module {
  func.func @tan(%arg0: vector<4xf16>) {
    %0 = spirv.CL.tan %arg0 : vector<4xf16>
    return
  }
}

// -----
module {
  func.func @atan(%arg0: f32) {
    %0 = spirv.CL.atan %arg0 : f32
    return
  }
}

// -----
module {
  func.func @atan(%arg0: vector<4xf16>) {
    %0 = spirv.CL.atan %arg0 : vector<4xf16>
    return
  }
}

// -----
module {
  func.func @atanh(%arg0: f32) {
    %0 = spirv.CL.atanh %arg0 : f32
    return
  }
}

// -----
module {
  func.func @atanh(%arg0: vector<4xf16>) {
    %0 = spirv.CL.atanh %arg0 : vector<4xf16>
    return
  }
}

// -----
module {
  func.func @sinh(%arg0: f32) {
    %0 = spirv.CL.sinh %arg0 : f32
    return
  }
}

// -----
module {
  func.func @sinh(%arg0: vector<4xf16>) {
    %0 = spirv.CL.sinh %arg0 : vector<4xf16>
    return
  }
}

// -----
module {
  func.func @cosh(%arg0: f32) {
    %0 = spirv.CL.cosh %arg0 : f32
    return
  }
}

// -----
module {
  func.func @cosh(%arg0: vector<4xf16>) {
    %0 = spirv.CL.cosh %arg0 : vector<4xf16>
    return
  }
}

// -----
module {
  func.func @asin(%arg0: f32) {
    %0 = spirv.CL.asin %arg0 : f32
    return
  }
}

// -----
module {
  func.func @asin(%arg0: vector<4xf16>) {
    %0 = spirv.CL.asin %arg0 : vector<4xf16>
    return
  }
}

// -----
module {
  func.func @asinh(%arg0: f32) {
    %0 = spirv.CL.asinh %arg0 : f32
    return
  }
}

// -----
module {
  func.func @asinh(%arg0: vector<4xf16>) {
    %0 = spirv.CL.asinh %arg0 : vector<4xf16>
    return
  }
}

// -----
module {
  func.func @acos(%arg0: f32) {
    %0 = spirv.CL.acos %arg0 : f32
    return
  }
}

// -----
module {
  func.func @acos(%arg0: vector<4xf16>) {
    %0 = spirv.CL.acos %arg0 : vector<4xf16>
    return
  }
}

// -----
module {
  func.func @acosh(%arg0: f32) {
    %0 = spirv.CL.acosh %arg0 : f32
    return
  }
}

// -----
module {
  func.func @acosh(%arg0: vector<4xf16>) {
    %0 = spirv.CL.acosh %arg0 : vector<4xf16>
    return
  }
}

// -----
module {
  func.func @atan2(%arg0: f32, %arg1: f32) {
    %0 = spirv.CL.atan2 %arg0, %arg1 : f32
    return
  }
}

// -----
module {
  func.func @atan2(%arg0: vector<4xf16>, %arg1: vector<4xf16>) {
    %0 = spirv.CL.atan2 %arg0, %arg1 : vector<4xf16>
    return
  }
}

