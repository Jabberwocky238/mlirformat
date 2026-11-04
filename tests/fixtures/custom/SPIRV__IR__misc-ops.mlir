module {
  func.func @undef() {
    %0 = spirv.Undef : f32
    %1 = spirv.Undef : vector<4xf32>
    spirv.Return
  }
}

// -----
// -----
// -----
module {
  func.func @assume_true(%arg0: i1) {
    spirv.KHR.AssumeTrue %arg0
    spirv.Return
  }
}

// -----
