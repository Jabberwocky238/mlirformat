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
// -----
module {
  func.func @expect_scalar_int(%arg0: i32, %arg1: i32) -> i32 {
    %0 = spirv.KHR.Expect %arg0, %arg1 : i32
    spirv.ReturnValue %0 : i32
  }
}

// -----
module {
  func.func @expect_scalar_bool(%arg0: i1, %arg1: i1) -> i1 {
    %0 = spirv.KHR.Expect %arg0, %arg1 : i1
    spirv.ReturnValue %0 : i1
  }
}

// -----
module {
  func.func @expect_vector_int(%arg0: vector<4xi32>, %arg1: vector<4xi32>) -> vector<4xi32> {
    %0 = spirv.KHR.Expect %arg0, %arg1 : vector<4xi32>
    spirv.ReturnValue %0 : vector<4xi32>
  }
}

// -----
module {
  func.func @expect_vector_bool(%arg0: vector<4xi1>, %arg1: vector<4xi1>) -> vector<4xi1> {
    %0 = spirv.KHR.Expect %arg0, %arg1 : vector<4xi1>
    spirv.ReturnValue %0 : vector<4xi1>
  }
}

// -----
// -----
