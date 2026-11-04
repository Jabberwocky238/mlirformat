module {
  func.func @fadd_scalar(%arg0: f32) -> f32 {
    %0 = spirv.FAdd %arg0, %arg0 : f32
    return %0 : f32
  }
}

// -----
// -----
module {
  func.func @fdiv_scalar(%arg0: f32) -> f32 {
    %0 = spirv.FDiv %arg0, %arg0 : f32
    return %0 : f32
  }
}

// -----
// -----
module {
  func.func @fmod_scalar(%arg0: f32) -> f32 {
    %0 = spirv.FMod %arg0, %arg0 : f32
    return %0 : f32
  }
}

// -----
// -----
module {
  func.func @fmul_scalar(%arg0: f32) -> f32 {
    %0 = spirv.FMul %arg0, %arg0 : f32
    return %0 : f32
  }
  func.func @fmul_vector(%arg0: vector<4xf32>) -> vector<4xf32> {
    %0 = spirv.FMul %arg0, %arg0 : vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
// -----
// -----
// -----
// -----
module {
  func.func @fnegate_scalar(%arg0: f32) -> f32 {
    %0 = spirv.FNegate %arg0 : f32
    return %0 : f32
  }
}

// -----
// -----
module {
  func.func @frem_scalar(%arg0: f32) -> f32 {
    %0 = spirv.FRem %arg0, %arg0 : f32
    return %0 : f32
  }
}

// -----
// -----
module {
  func.func @fsub_scalar(%arg0: f32) -> f32 {
    %0 = spirv.FSub %arg0, %arg0 : f32
    return %0 : f32
  }
}

// -----
// -----
module {
  func.func @iadd_scalar(%arg0: i32) -> i32 {
    %0 = spirv.IAdd %arg0, %arg0 : i32
    return %0 : i32
  }
}

// -----
module {
  func.func @imul_scalar(%arg0: i32) -> i32 {
    %0 = spirv.IMul %arg0, %arg0 : i32
    return %0 : i32
  }
}

// -----
module {
  func.func @isub_scalar(%arg0: i32) -> i32 {
    %0 = spirv.ISub %arg0, %arg0 : i32
    return %0 : i32
  }
}

// -----
module {
  func.func @iadd_carry_scalar(%arg0: i32) -> !spirv.struct<(i32, i32)> {
    %0 = spirv.IAddCarry %arg0, %arg0 : !spirv.struct<(i32, i32)>
    return %0 : !spirv.struct<(i32, i32)>
  }
  func.func @iadd_carry_vector(%arg0: vector<3xi32>) -> !spirv.struct<(vector<3xi32>, vector<3xi32>)> {
    %0 = spirv.IAddCarry %arg0, %arg0 : !spirv.struct<(vector<3xi32>, vector<3xi32>)>
    return %0 : !spirv.struct<(vector<3xi32>, vector<3xi32>)>
  }
}

// -----
// -----
// -----
// -----
// -----
module {
  func.func @isub_borrow_scalar(%arg0: i32) -> !spirv.struct<(i32, i32)> {
    %0 = spirv.ISubBorrow %arg0, %arg0 : !spirv.struct<(i32, i32)>
    return %0 : !spirv.struct<(i32, i32)>
  }
  func.func @isub_borrow_vector(%arg0: vector<3xi32>) -> !spirv.struct<(vector<3xi32>, vector<3xi32>)> {
    %0 = spirv.ISubBorrow %arg0, %arg0 : !spirv.struct<(vector<3xi32>, vector<3xi32>)>
    return %0 : !spirv.struct<(vector<3xi32>, vector<3xi32>)>
  }
}

// -----
// -----
// -----
// -----
// -----
module {
  func.func @dot(%arg0: vector<4xf32>, %arg1: vector<4xf32>) -> f32 {
    %0 = spirv.Dot %arg0, %arg1 : vector<4xf32> -> f32
    return %0 : f32
  }
}

// -----
module {
  func.func @dot_bf16(%arg0: vector<4xbf16>, %arg1: vector<4xbf16>) -> bf16 {
    %0 = spirv.Dot %arg0, %arg1 : vector<4xbf16> -> bf16
    return %0 : bf16
  }
}

// -----
// -----
// -----
// -----
module {
  func.func @smul_extended_scalar(%arg0: i32) -> !spirv.struct<(i32, i32)> {
    %0 = spirv.SMulExtended %arg0, %arg0 : !spirv.struct<(i32, i32)>
    return %0 : !spirv.struct<(i32, i32)>
  }
  func.func @smul_extended_vector(%arg0: vector<3xi32>) -> !spirv.struct<(vector<3xi32>, vector<3xi32>)> {
    %0 = spirv.SMulExtended %arg0, %arg0 : !spirv.struct<(vector<3xi32>, vector<3xi32>)>
    return %0 : !spirv.struct<(vector<3xi32>, vector<3xi32>)>
  }
}

// -----
// -----
// -----
// -----
// -----
module {
  func.func @umul_extended_scalar(%arg0: i32) -> !spirv.struct<(i32, i32)> {
    %0 = spirv.UMulExtended %arg0, %arg0 : !spirv.struct<(i32, i32)>
    return %0 : !spirv.struct<(i32, i32)>
  }
  func.func @umul_extended_vector(%arg0: vector<3xi32>) -> !spirv.struct<(vector<3xi32>, vector<3xi32>)> {
    %0 = spirv.UMulExtended %arg0, %arg0 : !spirv.struct<(vector<3xi32>, vector<3xi32>)>
    return %0 : !spirv.struct<(vector<3xi32>, vector<3xi32>)>
  }
}

// -----
// -----
// -----
// -----
// -----
module {
  func.func @sdiv_scalar(%arg0: i32) -> i32 {
    %0 = spirv.SDiv %arg0, %arg0 : i32
    return %0 : i32
  }
}

// -----
module {
  func.func @smod_scalar(%arg0: i32) -> i32 {
    %0 = spirv.SMod %arg0, %arg0 : i32
    return %0 : i32
  }
}

// -----
module {
  func.func @snegate_scalar(%arg0: i32) -> i32 {
    %0 = spirv.SNegate %arg0 : i32
    return %0 : i32
  }
}

// -----
module {
  func.func @srem_scalar(%arg0: i32) -> i32 {
    %0 = spirv.SRem %arg0, %arg0 : i32
    return %0 : i32
  }
}

// -----
module {
  func.func @udiv_scalar(%arg0: i32) -> i32 {
    %0 = spirv.UDiv %arg0, %arg0 : i32
    return %0 : i32
  }
}

// -----
module {
  func.func @umod_scalar(%arg0: i32) -> i32 {
    %0 = spirv.UMod %arg0, %arg0 : i32
    return %0 : i32
  }
}

// -----
module {
  func.func @vector_times_scalar(%arg0: vector<4xf32>, %arg1: f32) -> vector<4xf32> {
    %0 = spirv.VectorTimesScalar %arg0, %arg1 : (vector<4xf32>, f32) -> vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
// -----
// -----
