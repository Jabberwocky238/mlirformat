module {
  func.func @iequal_scalar(%arg0: i32, %arg1: i32) -> i1 {
    %0 = spirv.IEqual %arg0, %arg1 : i32
    return %0 : i1
  }
}

// -----
module {
  func.func @iequal_vector(%arg0: vector<4xi32>, %arg1: vector<4xi32>) -> vector<4xi1> {
    %0 = spirv.IEqual %arg0, %arg1 : vector<4xi32>
    return %0 : vector<4xi1>
  }
}

// -----
module {
  func.func @inotequal_vector(%arg0: vector<4xi32>, %arg1: vector<4xi32>) -> vector<4xi1> {
    %0 = spirv.INotEqual %arg0, %arg1 : vector<4xi32>
    return %0 : vector<4xi1>
  }
}

// -----
module {
  func.func @isfinite_scalar(%arg0: f32) -> i1 {
    %0 = spirv.IsFinite %arg0 : f32
    return %0 : i1
  }
  func.func @isfinite_vector(%arg0: vector<2xf32>) -> vector<2xi1> {
    %0 = spirv.IsFinite %arg0 : vector<2xf32>
    return %0 : vector<2xi1>
  }
}

// -----
module {
  func.func @isinf_scalar(%arg0: f32) -> i1 {
    %0 = spirv.IsInf %arg0 : f32
    return %0 : i1
  }
  func.func @isinf_vector(%arg0: vector<2xf32>) -> vector<2xi1> {
    %0 = spirv.IsInf %arg0 : vector<2xf32>
    return %0 : vector<2xi1>
  }
}

// -----
module {
  func.func @isnan_scalar(%arg0: f32) -> i1 {
    %0 = spirv.IsNan %arg0 : f32
    return %0 : i1
  }
  func.func @isnan_vector(%arg0: vector<2xf32>) -> vector<2xi1> {
    %0 = spirv.IsNan %arg0 : vector<2xf32>
    return %0 : vector<2xi1>
  }
  func.func @logicalBinary(%arg0: i1, %arg1: i1, %arg2: i1) {
    %0 = spirv.LogicalAnd %arg0, %arg1 : i1
    %1 = spirv.LogicalAnd %0, %arg2 : i1
    return
  }
  func.func @logicalBinary2(%arg0: vector<4xi1>, %arg1: vector<4xi1>) {
    %0 = spirv.LogicalAnd %arg0, %arg1 : vector<4xi1>
    return
  }
}

// -----
// -----
// -----
// -----
module {
  func.func @logicalUnary(%arg0: i1, %arg1: i1) {
    %0 = spirv.LogicalNot %arg0 : i1
    %1 = spirv.LogicalNot %0 : i1
    return
  }
  func.func @logicalUnary2(%arg0: vector<4xi1>) {
    %0 = spirv.LogicalNot %arg0 : vector<4xi1>
    return
  }
}

// -----
// -----
// -----
// -----
// -----
module {
  func.func @select_op_bool(%arg0: i1) {
    %true = spirv.Constant true
    %false = spirv.Constant false
    %0 = spirv.Select %arg0, %true, %false : i1, i1
    return
  }
  func.func @select_op_int(%arg0: i1) {
    %cst2_i32 = spirv.Constant 2 : i32
    %cst3_i32 = spirv.Constant 3 : i32
    %0 = spirv.Select %arg0, %cst2_i32, %cst3_i32 : i1, i32
    return
  }
  func.func @select_op_float(%arg0: i1) {
    %cst_f32 = spirv.Constant 2.000000e+00 : f32
    %cst_f32_0 = spirv.Constant 3.000000e+00 : f32
    %0 = spirv.Select %arg0, %cst_f32, %cst_f32_0 : i1, f32
    return
  }
  func.func @select_op_bfloat16(%arg0: i1) {
    %cst_bf16 = spirv.Constant 2.000000e+00 : bf16
    %cst_bf16_0 = spirv.Constant 3.000000e+00 : bf16
    %0 = spirv.Select %arg0, %cst_bf16, %cst_bf16_0 : i1, bf16
    return
  }
  func.func @select_op_ptr(%arg0: i1) {
    %0 = spirv.Variable : !spirv.ptr<f32, Function>
    %1 = spirv.Variable : !spirv.ptr<f32, Function>
    %2 = spirv.Select %arg0, %0, %1 : i1, !spirv.ptr<f32, Function>
    return
  }
  func.func @select_op_vec(%arg0: i1) {
    %cst_vec_3xf32 = spirv.Constant dense<[2.000000e+00, 3.000000e+00, 4.000000e+00]> : vector<3xf32>
    %cst_vec_3xf32_0 = spirv.Constant dense<[5.000000e+00, 6.000000e+00, 7.000000e+00]> : vector<3xf32>
    %0 = spirv.Select %arg0, %cst_vec_3xf32, %cst_vec_3xf32_0 : i1, vector<3xf32>
    return
  }
  func.func @select_op_vec_condn_vec(%arg0: vector<3xi1>) {
    %cst_vec_3xf32 = spirv.Constant dense<[2.000000e+00, 3.000000e+00, 4.000000e+00]> : vector<3xf32>
    %cst_vec_3xf32_0 = spirv.Constant dense<[5.000000e+00, 6.000000e+00, 7.000000e+00]> : vector<3xf32>
    %0 = spirv.Select %arg0, %cst_vec_3xf32, %cst_vec_3xf32_0 : vector<3xi1>, vector<3xf32>
    return
  }
}

// -----
// -----
// -----
// -----
// -----
// -----
module {
  func.func @sgt_vector(%arg0: vector<4xi32>, %arg1: vector<4xi32>) -> vector<4xi1> {
    %0 = spirv.SGreaterThan %arg0, %arg1 : vector<4xi32>
    return %0 : vector<4xi1>
  }
}

// -----
module {
  func.func @sge_vector(%arg0: vector<4xi32>, %arg1: vector<4xi32>) -> vector<4xi1> {
    %0 = spirv.SGreaterThanEqual %arg0, %arg1 : vector<4xi32>
    return %0 : vector<4xi1>
  }
}

// -----
module {
  func.func @slt_vector(%arg0: vector<4xi32>, %arg1: vector<4xi32>) -> vector<4xi1> {
    %0 = spirv.SLessThan %arg0, %arg1 : vector<4xi32>
    return %0 : vector<4xi1>
  }
}

// -----
module {
  func.func @slte_vector(%arg0: vector<4xi32>, %arg1: vector<4xi32>) -> vector<4xi1> {
    %0 = spirv.SLessThanEqual %arg0, %arg1 : vector<4xi32>
    return %0 : vector<4xi1>
  }
}

// -----
module {
  func.func @ugt_vector(%arg0: vector<4xi32>, %arg1: vector<4xi32>) -> vector<4xi1> {
    %0 = spirv.UGreaterThan %arg0, %arg1 : vector<4xi32>
    return %0 : vector<4xi1>
  }
}

// -----
module {
  func.func @ugte_vector(%arg0: vector<4xi32>, %arg1: vector<4xi32>) -> vector<4xi1> {
    %0 = spirv.UGreaterThanEqual %arg0, %arg1 : vector<4xi32>
    return %0 : vector<4xi1>
  }
}

// -----
module {
  func.func @ult_vector(%arg0: vector<4xi32>, %arg1: vector<4xi32>) -> vector<4xi1> {
    %0 = spirv.ULessThan %arg0, %arg1 : vector<4xi32>
    return %0 : vector<4xi1>
  }
}

// -----
module {
  func.func @ulte_vector(%arg0: vector<4xi32>, %arg1: vector<4xi32>) -> vector<4xi1> {
    %0 = spirv.ULessThanEqual %arg0, %arg1 : vector<4xi32>
    return %0 : vector<4xi1>
  }
}

