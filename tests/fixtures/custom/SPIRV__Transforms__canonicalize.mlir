module {
  func.func @combine_full_access_chain() -> f32 {
    %cst0_i32 = spirv.Constant 0 : i32
    %0 = spirv.Variable : !spirv.ptr<!spirv.struct<(!spirv.array<4 x !spirv.array<4 x f32>>, !spirv.array<4 x i32>)>, Function>
    %1 = spirv.AccessChain %0[%cst0_i32] : !spirv.ptr<!spirv.struct<(!spirv.array<4 x !spirv.array<4 x f32>>, !spirv.array<4 x i32>)>, Function>, i32 -> !spirv.ptr<!spirv.array<4 x !spirv.array<4 x f32>>, Function>
    %2 = spirv.AccessChain %1[%cst0_i32, %cst0_i32] : !spirv.ptr<!spirv.array<4 x !spirv.array<4 x f32>>, Function>, i32, i32 -> !spirv.ptr<f32, Function>
    %3 = spirv.Load "Function" %2 : f32
    spirv.ReturnValue %3 : f32
  }
}

// -----
module {
  func.func @combine_access_chain_multi_use() -> !spirv.array<4 x f32> {
    %cst0_i32 = spirv.Constant 0 : i32
    %0 = spirv.Variable : !spirv.ptr<!spirv.struct<(!spirv.array<4 x !spirv.array<4 x f32>>, !spirv.array<4 x i32>)>, Function>
    %1 = spirv.AccessChain %0[%cst0_i32] : !spirv.ptr<!spirv.struct<(!spirv.array<4 x !spirv.array<4 x f32>>, !spirv.array<4 x i32>)>, Function>, i32 -> !spirv.ptr<!spirv.array<4 x !spirv.array<4 x f32>>, Function>
    %2 = spirv.AccessChain %1[%cst0_i32] : !spirv.ptr<!spirv.array<4 x !spirv.array<4 x f32>>, Function>, i32 -> !spirv.ptr<!spirv.array<4 x f32>, Function>
    %3 = spirv.AccessChain %2[%cst0_i32] : !spirv.ptr<!spirv.array<4 x f32>, Function>, i32 -> !spirv.ptr<f32, Function>
    %4 = spirv.Load "Function" %2 : !spirv.array<4 x f32>
    %5 = spirv.Load "Function" %3 : f32
    spirv.ReturnValue %4 : !spirv.array<4 x f32>
  }
}

// -----
module {
  func.func @dont_combine_access_chain_without_common_base() -> !spirv.array<4 x i32> {
    %cst1_i32 = spirv.Constant 1 : i32
    %0 = spirv.Variable : !spirv.ptr<!spirv.struct<(!spirv.array<4 x !spirv.array<4 x f32>>, !spirv.array<4 x i32>)>, Function>
    %1 = spirv.Variable : !spirv.ptr<!spirv.struct<(!spirv.array<4 x !spirv.array<4 x f32>>, !spirv.array<4 x i32>)>, Function>
    %2 = spirv.AccessChain %0[%cst1_i32] : !spirv.ptr<!spirv.struct<(!spirv.array<4 x !spirv.array<4 x f32>>, !spirv.array<4 x i32>)>, Function>, i32 -> !spirv.ptr<!spirv.array<4 x i32>, Function>
    %3 = spirv.AccessChain %1[%cst1_i32] : !spirv.ptr<!spirv.struct<(!spirv.array<4 x !spirv.array<4 x f32>>, !spirv.array<4 x i32>)>, Function>, i32 -> !spirv.ptr<!spirv.array<4 x i32>, Function>
    %4 = spirv.Load "Function" %2 : !spirv.array<4 x i32>
    %5 = spirv.Load "Function" %3 : !spirv.array<4 x i32>
    spirv.ReturnValue %4 : !spirv.array<4 x i32>
  }
}

// -----
module {
  func.func @convert_bitcast_full(%arg0: vector<2xf32>) -> f64 {
    %0 = spirv.Bitcast %arg0 : vector<2xf32> to vector<2xi32>
    %1 = spirv.Bitcast %0 : vector<2xi32> to i64
    %2 = spirv.Bitcast %1 : i64 to f64
    spirv.ReturnValue %2 : f64
  }
}

// -----
module {
  func.func @convert_bitcast_multi_use(%arg0: vector<2xf32>, %arg1: !spirv.ptr<i64, Uniform>) -> f64 {
    %0 = spirv.Bitcast %arg0 : vector<2xf32> to i64
    %1 = spirv.Bitcast %0 : i64 to f64
    spirv.Store "Uniform" %arg1, %0 : i64
    spirv.ReturnValue %1 : f64
  }
}

// -----
module {
  func.func @convert_bitcast_roundtip(%arg0: i64) -> i64 {
    %0 = spirv.Bitcast %arg0 : i64 to f64
    %1 = spirv.Bitcast %0 : f64 to i64
    spirv.ReturnValue %1 : i64
  }
}

// -----
module {
  func.func @convert_bitcast_chained_roundtip(%arg0: i64) -> i64 {
    %0 = spirv.Bitcast %arg0 : i64 to f64
    %1 = spirv.Bitcast %0 : f64 to vector<2xi32>
    %2 = spirv.Bitcast %1 : vector<2xi32> to vector<2xf32>
    %3 = spirv.Bitcast %2 : vector<2xf32> to i64
    spirv.ReturnValue %3 : i64
  }
}

// -----
module {
  func.func @extract_vector() -> (i32, i32, i32) {
    %cst_vec_3xi32 = spirv.Constant dense<[42, -33, 6]> : vector<3xi32>
    %0 = spirv.CompositeExtract %cst_vec_3xi32[0 : i32] : vector<3xi32>
    %1 = spirv.CompositeExtract %cst_vec_3xi32[1 : i32] : vector<3xi32>
    %2 = spirv.CompositeExtract %cst_vec_3xi32[2 : i32] : vector<3xi32>
    return %0, %1, %2 : i32, i32, i32
  }
}

// -----
module {
  func.func @extract_array_final() -> (i32, i32) {
    %cst = spirv.Constant [dense<[4, -5]> : vector<2xi32>] : !spirv.array<1 x vector<2xi32>>
    %0 = spirv.CompositeExtract %cst[0 : i32, 0 : i32] : !spirv.array<1 x vector<2xi32>>
    %1 = spirv.CompositeExtract %cst[0 : i32, 1 : i32] : !spirv.array<1 x vector<2xi32>>
    return %0, %1 : i32, i32
  }
}

// -----
module {
  func.func @extract_array_interm() -> vector<2xi32> {
    %cst = spirv.Constant [dense<[4, -5]> : vector<2xi32>] : !spirv.array<1 x vector<2xi32>>
    %0 = spirv.CompositeExtract %cst[0 : i32] : !spirv.array<1 x vector<2xi32>>
    return %0 : vector<2xi32>
  }
}

// -----
module {
  func.func @extract_from_not_constant() -> i32 {
    %0 = spirv.Variable : !spirv.ptr<vector<3xi32>, Function>
    %1 = spirv.Load "Function" %0 : vector<3xi32>
    %2 = spirv.CompositeExtract %1[0 : i32] : vector<3xi32>
    spirv.ReturnValue %2 : i32
  }
}

// -----
module {
  func.func @extract_insert(%arg0: !spirv.array<1 x vector<2xf32>>, %arg1: f32) -> (f32, f32) {
    %0 = spirv.CompositeInsert %arg1, %arg0[0 : i32, 1 : i32] : f32 into !spirv.array<1 x vector<2xf32>>
    %1 = spirv.CompositeExtract %0[0 : i32, 0 : i32] : !spirv.array<1 x vector<2xf32>>
    %2 = spirv.CompositeExtract %0[0 : i32, 1 : i32] : !spirv.array<1 x vector<2xf32>>
    return %1, %2 : f32, f32
  }
}

// -----
module {
  func.func @extract_construct(%arg0: vector<2xf32>, %arg1: vector<2xf32>) -> (vector<2xf32>, vector<2xf32>) {
    %0 = spirv.CompositeConstruct %arg0, %arg1 : (vector<2xf32>, vector<2xf32>) -> !spirv.array<2 x vector<2xf32>>
    %1 = spirv.CompositeExtract %0[0 : i32] : !spirv.array<2 x vector<2xf32>>
    %2 = spirv.CompositeExtract %0[1 : i32] : !spirv.array<2 x vector<2xf32>>
    return %1, %2 : vector<2xf32>, vector<2xf32>
  }
}

// -----
module {
  func.func @fold_composite_op(%arg0: !spirv.struct<(f32, f32)>, %arg1: f32, %arg2: f32) -> f32 {
    %0 = spirv.CompositeInsert %arg1, %arg0[0 : i32] : f32 into !spirv.struct<(f32, f32)>
    %1 = spirv.CompositeInsert %arg2, %0[1 : i32] : f32 into !spirv.struct<(f32, f32)>
    %2 = spirv.CompositeExtract %1[0 : i32] : !spirv.struct<(f32, f32)>
    return %2 : f32
  }
}

// -----
module {
  func.func @fold_composite_op(%arg0: f32, %arg1: f32, %arg2: f32) -> f32 {
    %0 = spirv.CompositeConstruct %arg0, %arg0, %arg0 : (f32, f32, f32) -> !spirv.struct<(f32, f32, f32)>
    %1 = spirv.CompositeInsert %arg1, %0[1 : i32] : f32 into !spirv.struct<(f32, f32, f32)>
    %2 = spirv.CompositeInsert %arg2, %1[2 : i32] : f32 into !spirv.struct<(f32, f32, f32)>
    %3 = spirv.CompositeExtract %2[0 : i32] : !spirv.struct<(f32, f32, f32)>
    return %3 : f32
  }
}

// -----
module {
  func.func @extract_construct(%arg0: vector<3xf32>, %arg1: f32) -> (f32, f32) {
    %0 = spirv.CompositeConstruct %arg0, %arg1 : (vector<3xf32>, f32) -> vector<4xf32>
    %1 = spirv.CompositeExtract %0[0 : i32] : vector<4xf32>
    %2 = spirv.CompositeExtract %0[1 : i32] : vector<4xf32>
    return %1, %2 : f32, f32
  }
}

// -----
module {
  func.func @deduplicate_scalar_constant() -> (i32, i32) {
    %cst42_i32 = spirv.Constant 42 : i32
    %cst42_i32_0 = spirv.Constant 42 : i32
    return %cst42_i32, %cst42_i32_0 : i32, i32
  }
}

// -----
module {
  func.func @deduplicate_vector_constant() -> (vector<3xi32>, vector<3xi32>) {
    %cst_vec_3xi32 = spirv.Constant dense<[1, 2, 3]> : vector<3xi32>
    %cst_vec_3xi32_0 = spirv.Constant dense<[1, 2, 3]> : vector<3xi32>
    return %cst_vec_3xi32, %cst_vec_3xi32_0 : vector<3xi32>, vector<3xi32>
  }
}

// -----
module {
  func.func @deduplicate_composite_constant() -> (!spirv.array<1 x vector<2xi32>>, !spirv.array<1 x vector<2xi32>>) {
    %cst = spirv.Constant [dense<5> : vector<2xi32>] : !spirv.array<1 x vector<2xi32>>
    %cst_0 = spirv.Constant [dense<5> : vector<2xi32>] : !spirv.array<1 x vector<2xi32>>
    return %cst, %cst_0 : !spirv.array<1 x vector<2xi32>>, !spirv.array<1 x vector<2xi32>>
  }
}

// -----
module {
  func.func @iadd_zero(%arg0: i32) -> (i32, i32) {
    %cst0_i32 = spirv.Constant 0 : i32
    %0 = spirv.IAdd %arg0, %cst0_i32 : i32
    %1 = spirv.IAdd %cst0_i32, %arg0 : i32
    return %0, %1 : i32, i32
  }
  func.func @const_fold_scalar_iadd_normal() -> (i32, i32, i32) {
    %cst5_i32 = spirv.Constant 5 : i32
    %cst-8_i32 = spirv.Constant -8 : i32
    %0 = spirv.IAdd %cst5_i32, %cst5_i32 : i32
    %1 = spirv.IAdd %cst-8_i32, %cst-8_i32 : i32
    %2 = spirv.IAdd %cst5_i32, %cst-8_i32 : i32
    return %0, %1, %2 : i32, i32, i32
  }
  func.func @const_fold_scalar_iadd_flow() -> (i32, i32, i32, i32) {
    %cst1_i32 = spirv.Constant 1 : i32
    %cst2_i32 = spirv.Constant 2 : i32
    %cst-1_i32 = spirv.Constant -1 : i32
    %cst-2147483648_i32 = spirv.Constant -2147483648 : i32
    %cst-1_i32_0 = spirv.Constant -1 : i32
    %cst-2_i32 = spirv.Constant -2 : i32
    %0 = spirv.IAdd %cst1_i32, %cst-1_i32 : i32
    %1 = spirv.IAdd %cst2_i32, %cst-1_i32 : i32
    %2 = spirv.IAdd %cst-2147483648_i32, %cst-1_i32_0 : i32
    %3 = spirv.IAdd %cst-2147483648_i32, %cst-2_i32 : i32
    return %0, %1, %2, %3 : i32, i32, i32, i32
  }
  func.func @const_fold_vector_iadd() -> vector<3xi32> {
    %cst_vec_3xi32 = spirv.Constant dense<[42, -55, 127]> : vector<3xi32>
    %cst_vec_3xi32_0 = spirv.Constant dense<[-3, -15, 28]> : vector<3xi32>
    %0 = spirv.IAdd %cst_vec_3xi32, %cst_vec_3xi32_0 : vector<3xi32>
    return %0 : vector<3xi32>
  }
  func.func @iadd_poison(%arg0: i32) -> i32 {
    %0 = ub.poison : i32
    %1 = spirv.IAdd %arg0, %0 : i32
    return %1 : i32
  }
}

// -----
module {
  func.func @iaddcarry_x_0(%arg0: i32) -> !spirv.struct<(i32, i32)> {
    %cst0_i32 = spirv.Constant 0 : i32
    %0 = spirv.IAddCarry %arg0, %cst0_i32 : !spirv.struct<(i32, i32)>
    return %0 : !spirv.struct<(i32, i32)>
  }
  func.func @const_fold_scalar_iaddcarry() -> (!spirv.struct<(i32, i32)>, !spirv.struct<(i32, i32)>) {
    %cst5_i32 = spirv.Constant 5 : i32
    %cst-5_i32 = spirv.Constant -5 : i32
    %cst-8_i32 = spirv.Constant -8 : i32
    %0 = spirv.IAddCarry %cst5_i32, %cst-8_i32 : !spirv.struct<(i32, i32)>
    %1 = spirv.IAddCarry %cst-5_i32, %cst-8_i32 : !spirv.struct<(i32, i32)>
    return %0, %1 : !spirv.struct<(i32, i32)>, !spirv.struct<(i32, i32)>
  }
  func.func @const_fold_vector_iaddcarry() -> !spirv.struct<(vector<3xi32>, vector<3xi32>)> {
    %cst_vec_3xi32 = spirv.Constant dense<[5, -3, -1]> : vector<3xi32>
    %cst_vec_3xi32_0 = spirv.Constant dense<[-8, -8, 1]> : vector<3xi32>
    %0 = spirv.IAddCarry %cst_vec_3xi32, %cst_vec_3xi32_0 : !spirv.struct<(vector<3xi32>, vector<3xi32>)>
    return %0 : !spirv.struct<(vector<3xi32>, vector<3xi32>)>
  }
}

// -----
module {
  func.func @imul_zero_one(%arg0: i32) -> (i32, i32) {
    %cst0_i32 = spirv.Constant 0 : i32
    %cst1_i32 = spirv.Constant 1 : i32
    %0 = spirv.IMul %arg0, %cst0_i32 : i32
    %1 = spirv.IMul %cst1_i32, %arg0 : i32
    return %0, %1 : i32, i32
  }
  func.func @const_fold_scalar_imul_normal() -> (i32, i32, i32) {
    %cst5_i32 = spirv.Constant 5 : i32
    %cst-8_i32 = spirv.Constant -8 : i32
    %cst7_i32 = spirv.Constant 7 : i32
    %0 = spirv.IMul %cst7_i32, %cst5_i32 : i32
    %1 = spirv.IMul %cst5_i32, %cst-8_i32 : i32
    %2 = spirv.IMul %cst-8_i32, %cst7_i32 : i32
    return %0, %1, %2 : i32, i32, i32
  }
  func.func @const_fold_scalar_imul_flow() -> (i32, i32, i32) {
    %cst2_i32 = spirv.Constant 2 : i32
    %cst4_i32 = spirv.Constant 4 : i32
    %cst-1_i32 = spirv.Constant -1 : i32
    %cst2147483647_i32 = spirv.Constant 2147483647 : i32
    %0 = spirv.IMul %cst2_i32, %cst-1_i32 : i32
    %1 = spirv.IMul %cst2_i32, %cst2147483647_i32 : i32
    %2 = spirv.IMul %cst2147483647_i32, %cst4_i32 : i32
    return %0, %1, %2 : i32, i32, i32
  }
  func.func @const_fold_vector_imul() -> vector<3xi32> {
    %cst_vec_3xi32 = spirv.Constant dense<[42, -55, 127]> : vector<3xi32>
    %cst_vec_3xi32_0 = spirv.Constant dense<[-3, -15, 28]> : vector<3xi32>
    %0 = spirv.IMul %cst_vec_3xi32, %cst_vec_3xi32_0 : vector<3xi32>
    return %0 : vector<3xi32>
  }
}

// -----
module {
  func.func @smulextended_x_0(%arg0: i32) -> !spirv.struct<(i32, i32)> {
    %cst0_i32 = spirv.Constant 0 : i32
    %0 = spirv.SMulExtended %arg0, %cst0_i32 : !spirv.struct<(i32, i32)>
    return %0 : !spirv.struct<(i32, i32)>
  }
  func.func @const_fold_scalar_smulextended() -> (!spirv.struct<(i32, i32)>, !spirv.struct<(i32, i32)>) {
    %cst5_i32 = spirv.Constant 5 : i32
    %cst-5_i32 = spirv.Constant -5 : i32
    %cst-8_i32 = spirv.Constant -8 : i32
    %0 = spirv.SMulExtended %cst5_i32, %cst-8_i32 : !spirv.struct<(i32, i32)>
    %1 = spirv.SMulExtended %cst-5_i32, %cst-8_i32 : !spirv.struct<(i32, i32)>
    return %0, %1 : !spirv.struct<(i32, i32)>, !spirv.struct<(i32, i32)>
  }
  func.func @const_fold_vector_smulextended() -> !spirv.struct<(vector<3xi32>, vector<3xi32>)> {
    %cst_vec_3xi32 = spirv.Constant dense<[2147483647, -5, -1]> : vector<3xi32>
    %cst_vec_3xi32_0 = spirv.Constant dense<[5, -8, 1]> : vector<3xi32>
    %0 = spirv.SMulExtended %cst_vec_3xi32, %cst_vec_3xi32_0 : !spirv.struct<(vector<3xi32>, vector<3xi32>)>
    return %0 : !spirv.struct<(vector<3xi32>, vector<3xi32>)>
  }
}

// -----
module {
  func.func @umulextended_x_0(%arg0: i32) -> !spirv.struct<(i32, i32)> {
    %cst0_i32 = spirv.Constant 0 : i32
    %0 = spirv.UMulExtended %arg0, %cst0_i32 : !spirv.struct<(i32, i32)>
    return %0 : !spirv.struct<(i32, i32)>
  }
  func.func @umulextended_x_1(%arg0: i32) -> !spirv.struct<(i32, i32)> {
    %cst1_i32 = spirv.Constant 1 : i32
    %0 = spirv.UMulExtended %arg0, %cst1_i32 : !spirv.struct<(i32, i32)>
    return %0 : !spirv.struct<(i32, i32)>
  }
  func.func @const_fold_scalar_umulextended() -> (!spirv.struct<(i32, i32)>, !spirv.struct<(i32, i32)>) {
    %cst5_i32 = spirv.Constant 5 : i32
    %cst-5_i32 = spirv.Constant -5 : i32
    %cst-8_i32 = spirv.Constant -8 : i32
    %0 = spirv.UMulExtended %cst5_i32, %cst-8_i32 : !spirv.struct<(i32, i32)>
    %1 = spirv.UMulExtended %cst-5_i32, %cst-8_i32 : !spirv.struct<(i32, i32)>
    return %0, %1 : !spirv.struct<(i32, i32)>, !spirv.struct<(i32, i32)>
  }
  func.func @const_fold_vector_umulextended() -> !spirv.struct<(vector<3xi32>, vector<3xi32>)> {
    %cst_vec_3xi32 = spirv.Constant dense<[2147483647, -5, -1]> : vector<3xi32>
    %cst_vec_3xi32_0 = spirv.Constant dense<[5, -8, 1]> : vector<3xi32>
    %0 = spirv.UMulExtended %cst_vec_3xi32, %cst_vec_3xi32_0 : !spirv.struct<(vector<3xi32>, vector<3xi32>)>
    return %0 : !spirv.struct<(vector<3xi32>, vector<3xi32>)>
  }
}

// -----
module {
  func.func @isub_x_x(%arg0: i32) -> i32 {
    %0 = spirv.ISub %arg0, %arg0 : i32
    return %0 : i32
  }
  func.func @isub_vector_x_x(%arg0: vector<3xi32>) -> vector<3xi32> {
    %0 = spirv.ISub %arg0, %arg0 : vector<3xi32>
    return %0 : vector<3xi32>
  }
  func.func @const_fold_scalar_isub_normal() -> (i32, i32, i32) {
    %cst5_i32 = spirv.Constant 5 : i32
    %cst-8_i32 = spirv.Constant -8 : i32
    %cst7_i32 = spirv.Constant 7 : i32
    %0 = spirv.ISub %cst7_i32, %cst5_i32 : i32
    %1 = spirv.ISub %cst5_i32, %cst-8_i32 : i32
    %2 = spirv.ISub %cst-8_i32, %cst7_i32 : i32
    return %0, %1, %2 : i32, i32, i32
  }
  func.func @const_fold_scalar_isub_flow() -> (i32, i32, i32, i32) {
    %cst0_i32 = spirv.Constant 0 : i32
    %cst1_i32 = spirv.Constant 1 : i32
    %cst-1_i32 = spirv.Constant -1 : i32
    %cst2147483647_i32 = spirv.Constant 2147483647 : i32
    %cst-1_i32_0 = spirv.Constant -1 : i32
    %cst-2_i32 = spirv.Constant -2 : i32
    %0 = spirv.ISub %cst0_i32, %cst-1_i32 : i32
    %1 = spirv.ISub %cst1_i32, %cst-1_i32 : i32
    %2 = spirv.ISub %cst-1_i32_0, %cst2147483647_i32 : i32
    %3 = spirv.ISub %cst-2_i32, %cst2147483647_i32 : i32
    return %0, %1, %2, %3 : i32, i32, i32, i32
  }
  func.func @const_fold_vector_isub() -> vector<3xi32> {
    %cst_vec_3xi32 = spirv.Constant dense<[42, -55, 127]> : vector<3xi32>
    %cst_vec_3xi32_0 = spirv.Constant dense<[-3, -15, 28]> : vector<3xi32>
    %0 = spirv.ISub %cst_vec_3xi32, %cst_vec_3xi32_0 : vector<3xi32>
    return %0 : vector<3xi32>
  }
}

// -----
module {
  func.func @sdiv_x_1(%arg0: i32) -> i32 {
    %cst1_i32 = spirv.Constant 1 : i32
    %0 = spirv.SDiv %arg0, %cst1_i32 : i32
    return %0 : i32
  }
  func.func @sdiv_div_0_or_overflow() -> (i32, i32) {
    %cst0_i32 = spirv.Constant 0 : i32
    %cst-1_i32 = spirv.Constant -1 : i32
    %cst-2147483648_i32 = spirv.Constant -2147483648 : i32
    %0 = spirv.SDiv %cst-1_i32, %cst0_i32 : i32
    %1 = spirv.SDiv %cst-2147483648_i32, %cst-1_i32 : i32
    return %0, %1 : i32, i32
  }
  func.func @const_fold_scalar_sdiv() -> (i32, i32, i32, i32) {
    %cst56_i32 = spirv.Constant 56 : i32
    %cst7_i32 = spirv.Constant 7 : i32
    %cst-8_i32 = spirv.Constant -8 : i32
    %cst3_i32 = spirv.Constant 3 : i32
    %cst-3_i32 = spirv.Constant -3 : i32
    %0 = spirv.SDiv %cst56_i32, %cst7_i32 : i32
    %1 = spirv.SDiv %cst56_i32, %cst-8_i32 : i32
    %2 = spirv.SDiv %cst-8_i32, %cst3_i32 : i32
    %3 = spirv.SDiv %cst56_i32, %cst-3_i32 : i32
    return %0, %1, %2, %3 : i32, i32, i32, i32
  }
  func.func @const_fold_vector_sdiv() -> vector<3xi32> {
    %cst_vec_3xi32 = spirv.Constant dense<[42, 24, -16]> : vector<3xi32>
    %cst_vec_3xi32_0 = spirv.Constant dense<[76, -24, 5]> : vector<3xi32>
    %0 = spirv.SDiv %cst_vec_3xi32, %cst_vec_3xi32_0 : vector<3xi32>
    return %0 : vector<3xi32>
  }
}

// -----
module {
  func.func @smod_x_1(%arg0: i32, %arg1: vector<3xi32>) -> (i32, vector<3xi32>) {
    %cst1_i32 = spirv.Constant 1 : i32
    %cst_vec_3xi32 = spirv.Constant dense<1> : vector<3xi32>
    %0 = spirv.SMod %arg0, %cst1_i32 : i32
    %1 = spirv.SMod %arg1, %cst_vec_3xi32 : vector<3xi32>
    return %0, %1 : i32, vector<3xi32>
  }
  func.func @smod_div_0_or_overflow() -> (i32, i32) {
    %cst0_i32 = spirv.Constant 0 : i32
    %cst-1_i32 = spirv.Constant -1 : i32
    %cst-2147483648_i32 = spirv.Constant -2147483648 : i32
    %0 = spirv.SMod %cst-1_i32, %cst0_i32 : i32
    %1 = spirv.SMod %cst-2147483648_i32, %cst-1_i32 : i32
    return %0, %1 : i32, i32
  }
  func.func @const_fold_scalar_smod() -> (i32, i32, i32, i32, i32, i32, i32, i32) {
    %cst56_i32 = spirv.Constant 56 : i32
    %cst-56_i32 = spirv.Constant -56 : i32
    %cst59_i32 = spirv.Constant 59 : i32
    %cst-59_i32 = spirv.Constant -59 : i32
    %cst7_i32 = spirv.Constant 7 : i32
    %cst-8_i32 = spirv.Constant -8 : i32
    %cst3_i32 = spirv.Constant 3 : i32
    %cst-3_i32 = spirv.Constant -3 : i32
    %0 = spirv.SMod %cst56_i32, %cst7_i32 : i32
    %1 = spirv.SMod %cst56_i32, %cst-8_i32 : i32
    %2 = spirv.SMod %cst56_i32, %cst3_i32 : i32
    %3 = spirv.SMod %cst-3_i32, %cst56_i32 : i32
    %4 = spirv.SMod %cst-3_i32, %cst-56_i32 : i32
    %5 = spirv.SMod %cst59_i32, %cst56_i32 : i32
    %6 = spirv.SMod %cst59_i32, %cst-56_i32 : i32
    %7 = spirv.SMod %cst-59_i32, %cst-56_i32 : i32
    return %0, %1, %2, %3, %4, %5, %6, %7 : i32, i32, i32, i32, i32, i32, i32, i32
  }
  func.func @const_fold_vector_smod() -> vector<3xi32> {
    %cst_vec_3xi32 = spirv.Constant dense<[42, 24, -16]> : vector<3xi32>
    %cst_vec_3xi32_0 = spirv.Constant dense<[76, -7, 5]> : vector<3xi32>
    %0 = spirv.SMod %cst_vec_3xi32, %cst_vec_3xi32_0 : vector<3xi32>
    return %0 : vector<3xi32>
  }
}

// -----
module {
  func.func @srem_x_1(%arg0: i32, %arg1: vector<3xi32>) -> (i32, vector<3xi32>) {
    %cst1_i32 = spirv.Constant 1 : i32
    %cst_vec_3xi32 = spirv.Constant dense<1> : vector<3xi32>
    %0 = spirv.SRem %arg0, %cst1_i32 : i32
    %1 = spirv.SRem %arg1, %cst_vec_3xi32 : vector<3xi32>
    return %0, %1 : i32, vector<3xi32>
  }
  func.func @srem_div_0_or_overflow() -> (i32, i32) {
    %cst0_i32 = spirv.Constant 0 : i32
    %cst-1_i32 = spirv.Constant -1 : i32
    %cst-2147483648_i32 = spirv.Constant -2147483648 : i32
    %0 = spirv.SRem %cst-1_i32, %cst0_i32 : i32
    %1 = spirv.SRem %cst-2147483648_i32, %cst-1_i32 : i32
    return %0, %1 : i32, i32
  }
  func.func @const_fold_scalar_srem() -> (i32, i32, i32, i32, i32) {
    %cst56_i32 = spirv.Constant 56 : i32
    %cst7_i32 = spirv.Constant 7 : i32
    %cst-8_i32 = spirv.Constant -8 : i32
    %cst3_i32 = spirv.Constant 3 : i32
    %cst-3_i32 = spirv.Constant -3 : i32
    %0 = spirv.SRem %cst56_i32, %cst7_i32 : i32
    %1 = spirv.SRem %cst56_i32, %cst-8_i32 : i32
    %2 = spirv.SRem %cst56_i32, %cst3_i32 : i32
    %3 = spirv.SRem %cst-3_i32, %cst56_i32 : i32
    %4 = spirv.SRem %cst7_i32, %cst-3_i32 : i32
    return %0, %1, %2, %3, %4 : i32, i32, i32, i32, i32
  }
}

// -----
module {
  func.func @udiv_x_1(%arg0: i32) -> i32 {
    %cst1_i32 = spirv.Constant 1 : i32
    %0 = spirv.UDiv %arg0, %cst1_i32 : i32
    return %0 : i32
  }
  func.func @udiv_div_0() -> i32 {
    %cst0_i32 = spirv.Constant 0 : i32
    %cst-1_i32 = spirv.Constant -1 : i32
    %0 = spirv.UDiv %cst-1_i32, %cst0_i32 : i32
    return %0 : i32
  }
  func.func @const_fold_scalar_udiv() -> (i32, i32, i32) {
    %cst56_i32 = spirv.Constant 56 : i32
    %cst7_i32 = spirv.Constant 7 : i32
    %cst-8_i32 = spirv.Constant -8 : i32
    %cst3_i32 = spirv.Constant 3 : i32
    %0 = spirv.UDiv %cst56_i32, %cst7_i32 : i32
    %1 = spirv.UDiv %cst-8_i32, %cst3_i32 : i32
    %2 = spirv.UDiv %cst56_i32, %cst-8_i32 : i32
    return %0, %1, %2 : i32, i32, i32
  }
}

// -----
module {
  func.func @umod_x_1(%arg0: i32, %arg1: vector<3xi32>) -> (i32, vector<3xi32>) {
    %cst1_i32 = spirv.Constant 1 : i32
    %cst_vec_3xi32 = spirv.Constant dense<1> : vector<3xi32>
    %0 = spirv.UMod %arg0, %cst1_i32 : i32
    %1 = spirv.UMod %arg1, %cst_vec_3xi32 : vector<3xi32>
    return %0, %1 : i32, vector<3xi32>
  }
  func.func @umod_div_0() -> i32 {
    %cst0_i32 = spirv.Constant 0 : i32
    %cst-1_i32 = spirv.Constant -1 : i32
    %0 = spirv.UMod %cst-1_i32, %cst0_i32 : i32
    return %0 : i32
  }
  func.func @const_fold_scalar_umod() -> (i32, i32, i32) {
    %cst56_i32 = spirv.Constant 56 : i32
    %cst7_i32 = spirv.Constant 7 : i32
    %cst-8_i32 = spirv.Constant -8 : i32
    %cst3_i32 = spirv.Constant 3 : i32
    %0 = spirv.UMod %cst56_i32, %cst7_i32 : i32
    %1 = spirv.UMod %cst-8_i32, %cst3_i32 : i32
    %2 = spirv.UMod %cst56_i32, %cst-8_i32 : i32
    return %0, %1, %2 : i32, i32, i32
  }
  func.func @const_fold_vector_umod() -> vector<3xi32> {
    %cst_vec_3xi32 = spirv.Constant dense<[42, 24, -16]> : vector<3xi32>
    %cst_vec_3xi32_0 = spirv.Constant dense<[76, -7, 5]> : vector<3xi32>
    %0 = spirv.UMod %cst_vec_3xi32, %cst_vec_3xi32_0 : vector<3xi32>
    return %0 : vector<3xi32>
  }
  func.func @umod_fold(%arg0: i32) -> (i32, i32) {
    %cst32_i32 = spirv.Constant 32 : i32
    %0 = spirv.UMod %arg0, %cst32_i32 : i32
    %cst4_i32 = spirv.Constant 4 : i32
    %1 = spirv.UMod %0, %cst4_i32 : i32
    return %0, %1 : i32, i32
  }
  func.func @umod_vector_fold(%arg0: vector<4xi32>) -> (vector<4xi32>, vector<4xi32>) {
    %cst_vec_4xi32 = spirv.Constant dense<32> : vector<4xi32>
    %0 = spirv.UMod %arg0, %cst_vec_4xi32 : vector<4xi32>
    %cst_vec_4xi32_0 = spirv.Constant dense<4> : vector<4xi32>
    %1 = spirv.UMod %0, %cst_vec_4xi32_0 : vector<4xi32>
    return %0, %1 : vector<4xi32>, vector<4xi32>
  }
  func.func @umod_fold_same_divisor(%arg0: i32) -> (i32, i32) {
    %cst32_i32 = spirv.Constant 32 : i32
    %0 = spirv.UMod %arg0, %cst32_i32 : i32
    %cst32_i32_0 = spirv.Constant 32 : i32
    %1 = spirv.UMod %0, %cst32_i32_0 : i32
    return %0, %1 : i32, i32
  }
  func.func @umod_fail_1_fold(%arg0: i32) -> (i32, i32) {
    %cst32_i32 = spirv.Constant 32 : i32
    %0 = spirv.UMod %arg0, %cst32_i32 : i32
    %cst5_i32 = spirv.Constant 5 : i32
    %1 = spirv.UMod %0, %cst5_i32 : i32
    return %0, %1 : i32, i32
  }
  func.func @umod_fail_2_fold(%arg0: i32) -> (i32, i32) {
    %cst4_i32 = spirv.Constant 4 : i32
    %0 = spirv.UMod %arg0, %cst4_i32 : i32
    %cst32_i32 = spirv.Constant 32 : i32
    %1 = spirv.UMod %0, %cst32_i32 : i32
    return %0, %1 : i32, i32
  }
  func.func @umod_vector_fail_1_fold(%arg0: vector<4xi32>) -> (vector<4xi32>, vector<4xi32>) {
    %cst_vec_4xi32 = spirv.Constant dense<64> : vector<4xi32>
    %0 = spirv.UMod %arg0, %cst_vec_4xi32 : vector<4xi32>
    %cst_vec_4xi32_0 = spirv.Constant dense<9> : vector<4xi32>
    %1 = spirv.UMod %0, %cst_vec_4xi32_0 : vector<4xi32>
    return %0, %1 : vector<4xi32>, vector<4xi32>
  }
  func.func @umod_vector_fail_2_fold(%arg0: vector<4xi32>) -> (vector<4xi32>, vector<4xi32>) {
    %cst_vec_4xi32 = spirv.Constant dense<4> : vector<4xi32>
    %0 = spirv.UMod %arg0, %cst_vec_4xi32 : vector<4xi32>
    %cst_vec_4xi32_0 = spirv.Constant dense<32> : vector<4xi32>
    %1 = spirv.UMod %0, %cst_vec_4xi32_0 : vector<4xi32>
    return %0, %1 : vector<4xi32>, vector<4xi32>
  }
}

// -----
module {
  func.func @snegate_twice(%arg0: i32) -> i32 {
    %0 = spirv.SNegate %arg0 : i32
    %1 = spirv.SNegate %0 : i32
    return %1 : i32
  }
  func.func @snegate_min() -> (i8, i8) {
    %cst-128_i8 = spirv.Constant -128 : i8
    %0 = spirv.SNegate %cst-128_i8 : i8
    %1 = spirv.SNegate %0 : i8
    return %0, %1 : i8, i8
  }
  func.func @const_fold_scalar_snegate() -> (i32, i32, i32) {
    %cst0_i32 = spirv.Constant 0 : i32
    %cst3_i32 = spirv.Constant 3 : i32
    %cst-3_i32 = spirv.Constant -3 : i32
    %0 = spirv.SNegate %cst0_i32 : i32
    %1 = spirv.SNegate %cst3_i32 : i32
    %2 = spirv.SNegate %cst-3_i32 : i32
    return %0, %1, %2 : i32, i32, i32
  }
  func.func @const_fold_vector_snegate() -> vector<3xi32> {
    %cst_vec_3xi32 = spirv.Constant dense<[0, -3, 3]> : vector<3xi32>
    %0 = spirv.SNegate %cst_vec_3xi32 : vector<3xi32>
    return %0 : vector<3xi32>
  }
}

// -----
module {
  func.func @not_twice(%arg0: i32) -> i32 {
    %0 = spirv.Not %arg0 : i32
    %1 = spirv.Not %0 : i32
    return %1 : i32
  }
  func.func @const_fold_scalar_not() -> (i32, i32, i32) {
    %cst0_i32 = spirv.Constant 0 : i32
    %cst3_i32 = spirv.Constant 3 : i32
    %cst-3_i32 = spirv.Constant -3 : i32
    %0 = spirv.Not %cst0_i32 : i32
    %1 = spirv.Not %cst3_i32 : i32
    %2 = spirv.Not %cst-3_i32 : i32
    return %0, %1, %2 : i32, i32, i32
  }
  func.func @const_fold_vector_not() -> vector<3xi32> {
    %cst_vec_3xi32 = spirv.Constant dense<[-1, -4, 2]> : vector<3xi32>
    %0 = spirv.Not %cst_vec_3xi32 : vector<3xi32>
    return %0 : vector<3xi32>
  }
}

// -----
module {
  func.func @convert_logical_and_true_false_scalar(%arg0: i1) -> (i1, i1) {
    %true = spirv.Constant true
    %false = spirv.Constant false
    %0 = spirv.LogicalAnd %true, %arg0 : i1
    %1 = spirv.LogicalAnd %arg0, %false : i1
    return %0, %1 : i1, i1
  }
  func.func @convert_logical_and_true_false_vector(%arg0: vector<3xi1>) -> (vector<3xi1>, vector<3xi1>) {
    %cst_vec_3xi1 = spirv.Constant dense<true> : vector<3xi1>
    %cst_vec_3xi1_0 = spirv.Constant dense<false> : vector<3xi1>
    %0 = spirv.LogicalAnd %cst_vec_3xi1, %arg0 : vector<3xi1>
    %1 = spirv.LogicalAnd %arg0, %cst_vec_3xi1_0 : vector<3xi1>
    return %0, %1 : vector<3xi1>, vector<3xi1>
  }
}

// -----
module {
  func.func @logical_not_twice(%arg0: i1) -> i1 {
    %0 = spirv.LogicalNot %arg0 : i1
    %1 = spirv.LogicalNot %0 : i1
    return %1 : i1
  }
  func.func @const_fold_scalar_logical_not() -> i1 {
    %true = spirv.Constant true
    %0 = spirv.LogicalNot %true : i1
    return %0 : i1
  }
  func.func @const_fold_vector_logical_not() -> vector<2xi1> {
    %cst_vec_2xi1 = spirv.Constant dense<[true, false]> : vector<2xi1>
    %0 = spirv.LogicalNot %cst_vec_2xi1 : vector<2xi1>
    return %0 : vector<2xi1>
  }
}

// -----
module {
  func.func @convert_logical_not_to_not_equal(%arg0: vector<3xi64>, %arg1: vector<3xi64>) -> vector<3xi1> {
    %0 = spirv.IEqual %arg0, %arg1 : vector<3xi64>
    %1 = spirv.LogicalNot %0 : vector<3xi1>
    spirv.ReturnValue %1 : vector<3xi1>
  }
}

// -----
module {
  func.func @logical_equal_same(%arg0: i1, %arg1: vector<3xi1>) -> (i1, vector<3xi1>) {
    %0 = spirv.LogicalEqual %arg0, %arg0 : i1
    %1 = spirv.LogicalEqual %arg1, %arg1 : vector<3xi1>
    return %0, %1 : i1, vector<3xi1>
  }
  func.func @const_fold_scalar_logical_equal() -> (i1, i1) {
    %true = spirv.Constant true
    %false = spirv.Constant false
    %0 = spirv.LogicalEqual %true, %false : i1
    %1 = spirv.LogicalEqual %false, %false : i1
    return %0, %1 : i1, i1
  }
  func.func @const_fold_vector_logical_equal() -> vector<3xi1> {
    %cst_vec_3xi1 = spirv.Constant dense<[true, false, true]> : vector<3xi1>
    %cst_vec_3xi1_0 = spirv.Constant dense<[true, false, false]> : vector<3xi1>
    %0 = spirv.LogicalEqual %cst_vec_3xi1, %cst_vec_3xi1_0 : vector<3xi1>
    return %0 : vector<3xi1>
  }
}

// -----
module {
  func.func @convert_logical_not_equal_false(%arg0: vector<4xi1>) -> vector<4xi1> {
    %cst_vec_4xi1 = spirv.Constant dense<false> : vector<4xi1>
    %0 = spirv.LogicalNotEqual %arg0, %cst_vec_4xi1 : vector<4xi1>
    spirv.ReturnValue %0 : vector<4xi1>
  }
  func.func @logical_not_equal_same(%arg0: i1, %arg1: vector<3xi1>) -> (i1, vector<3xi1>) {
    %0 = spirv.LogicalNotEqual %arg0, %arg0 : i1
    %1 = spirv.LogicalNotEqual %arg1, %arg1 : vector<3xi1>
    return %0, %1 : i1, vector<3xi1>
  }
  func.func @const_fold_scalar_logical_not_equal() -> (i1, i1) {
    %true = spirv.Constant true
    %false = spirv.Constant false
    %0 = spirv.LogicalNotEqual %true, %false : i1
    %1 = spirv.LogicalNotEqual %false, %false : i1
    return %0, %1 : i1, i1
  }
  func.func @const_fold_vector_logical_not_equal() -> vector<3xi1> {
    %cst_vec_3xi1 = spirv.Constant dense<[true, false, true]> : vector<3xi1>
    %cst_vec_3xi1_0 = spirv.Constant dense<[true, false, false]> : vector<3xi1>
    %0 = spirv.LogicalNotEqual %cst_vec_3xi1, %cst_vec_3xi1_0 : vector<3xi1>
    return %0 : vector<3xi1>
  }
}

// -----
module {
  func.func @convert_logical_not_to_equal(%arg0: vector<3xi64>, %arg1: vector<3xi64>) -> vector<3xi1> {
    %0 = spirv.INotEqual %arg0, %arg1 : vector<3xi64>
    %1 = spirv.LogicalNot %0 : vector<3xi1>
    spirv.ReturnValue %1 : vector<3xi1>
  }
}

// -----
module {
  func.func @convert_logical_not_parent_multi_use(%arg0: vector<3xi64>, %arg1: vector<3xi64>, %arg2: !spirv.ptr<vector<3xi1>, Uniform>) -> vector<3xi1> {
    %0 = spirv.INotEqual %arg0, %arg1 : vector<3xi64>
    %1 = spirv.LogicalNot %0 : vector<3xi1>
    spirv.Store "Uniform" %arg2, %0 : vector<3xi1>
    spirv.ReturnValue %1 : vector<3xi1>
  }
}

// -----
module {
  func.func @convert_logical_not_to_logical_not_equal(%arg0: vector<3xi1>, %arg1: vector<3xi1>) -> vector<3xi1> {
    %0 = spirv.LogicalEqual %arg0, %arg1 : vector<3xi1>
    %1 = spirv.LogicalNot %0 : vector<3xi1>
    spirv.ReturnValue %1 : vector<3xi1>
  }
}

// -----
module {
  func.func @convert_logical_not_to_logical_equal(%arg0: vector<3xi1>, %arg1: vector<3xi1>) -> vector<3xi1> {
    %0 = spirv.LogicalNotEqual %arg0, %arg1 : vector<3xi1>
    %1 = spirv.LogicalNot %0 : vector<3xi1>
    spirv.ReturnValue %1 : vector<3xi1>
  }
}

// -----
module {
  func.func @convert_logical_or_true_false_scalar(%arg0: i1) -> (i1, i1) {
    %true = spirv.Constant true
    %false = spirv.Constant false
    %0 = spirv.LogicalOr %true, %arg0 : i1
    %1 = spirv.LogicalOr %arg0, %false : i1
    return %0, %1 : i1, i1
  }
  func.func @convert_logical_or_true_false_vector(%arg0: vector<3xi1>) -> (vector<3xi1>, vector<3xi1>) {
    %cst_vec_3xi1 = spirv.Constant dense<true> : vector<3xi1>
    %cst_vec_3xi1_0 = spirv.Constant dense<false> : vector<3xi1>
    %0 = spirv.LogicalOr %cst_vec_3xi1, %arg0 : vector<3xi1>
    %1 = spirv.LogicalOr %arg0, %cst_vec_3xi1_0 : vector<3xi1>
    return %0, %1 : vector<3xi1>, vector<3xi1>
  }
}

// -----
module {
  func.func @convert_select_scalar(%arg0: i32, %arg1: i32) -> (i32, i32) {
    %true = spirv.Constant true
    %false = spirv.Constant false
    %0 = spirv.Select %true, %arg0, %arg1 : i1, i32
    %1 = spirv.Select %false, %arg0, %arg1 : i1, i32
    return %0, %1 : i32, i32
  }
  func.func @convert_select_vector(%arg0: vector<3xi32>, %arg1: vector<3xi32>) -> (vector<3xi32>, vector<3xi32>) {
    %cst_vec_3xi1 = spirv.Constant dense<true> : vector<3xi1>
    %cst_vec_3xi1_0 = spirv.Constant dense<false> : vector<3xi1>
    %0 = spirv.Select %cst_vec_3xi1, %arg0, %arg1 : vector<3xi1>, vector<3xi32>
    %1 = spirv.Select %cst_vec_3xi1_0, %arg0, %arg1 : vector<3xi1>, vector<3xi32>
    return %0, %1 : vector<3xi32>, vector<3xi32>
  }
  func.func @convert_select_vector_extra(%arg0: vector<2xi1>, %arg1: vector<2xi32>) -> (vector<2xi32>, vector<2xi32>) {
    %cst_vec_2xi1 = spirv.Constant dense<[true, false]> : vector<2xi1>
    %cst_vec_2xi32 = spirv.Constant dense<[42, -132]> : vector<2xi32>
    %cst_vec_2xi32_0 = spirv.Constant dense<[0, 42]> : vector<2xi32>
    %0 = spirv.Select %cst_vec_2xi1, %cst_vec_2xi32, %cst_vec_2xi32_0 : vector<2xi1>, vector<2xi32>
    %1 = spirv.Select %arg0, %arg1, %arg1 : vector<2xi1>, vector<2xi32>
    return %0, %1 : vector<2xi32>, vector<2xi32>
  }
}

// -----
module {
  func.func @iequal_same(%arg0: i32, %arg1: vector<3xi32>) -> (i1, vector<3xi1>) {
    %0 = spirv.IEqual %arg0, %arg0 : i32
    %1 = spirv.IEqual %arg1, %arg1 : vector<3xi32>
    return %0, %1 : i1, vector<3xi1>
  }
  func.func @const_fold_scalar_iequal() -> (i1, i1) {
    %cst5_i32 = spirv.Constant 5 : i32
    %cst6_i32 = spirv.Constant 6 : i32
    %0 = spirv.IEqual %cst5_i32, %cst6_i32 : i32
    %1 = spirv.IEqual %cst5_i32, %cst5_i32 : i32
    return %0, %1 : i1, i1
  }
  func.func @const_fold_vector_iequal() -> vector<3xi1> {
    %cst_vec_3xi32 = spirv.Constant dense<[-1, -4, 2]> : vector<3xi32>
    %cst_vec_3xi32_0 = spirv.Constant dense<[-1, -3, 2]> : vector<3xi32>
    %0 = spirv.IEqual %cst_vec_3xi32, %cst_vec_3xi32_0 : vector<3xi32>
    return %0 : vector<3xi1>
  }
}

// -----
module {
  func.func @inotequal_same(%arg0: i32, %arg1: vector<3xi32>) -> (i1, vector<3xi1>) {
    %0 = spirv.INotEqual %arg0, %arg0 : i32
    %1 = spirv.INotEqual %arg1, %arg1 : vector<3xi32>
    return %0, %1 : i1, vector<3xi1>
  }
  func.func @const_fold_scalar_inotequal() -> (i1, i1) {
    %cst5_i32 = spirv.Constant 5 : i32
    %cst6_i32 = spirv.Constant 6 : i32
    %0 = spirv.INotEqual %cst5_i32, %cst6_i32 : i32
    %1 = spirv.INotEqual %cst5_i32, %cst5_i32 : i32
    return %0, %1 : i1, i1
  }
  func.func @const_fold_vector_inotequal() -> vector<3xi1> {
    %cst_vec_3xi32 = spirv.Constant dense<[-1, -4, 2]> : vector<3xi32>
    %cst_vec_3xi32_0 = spirv.Constant dense<[-1, -3, 2]> : vector<3xi32>
    %0 = spirv.INotEqual %cst_vec_3xi32, %cst_vec_3xi32_0 : vector<3xi32>
    return %0 : vector<3xi1>
  }
}

// -----
module {
  func.func @sgt_same(%arg0: i32, %arg1: vector<3xi32>) -> (i1, vector<3xi1>) {
    %0 = spirv.SGreaterThan %arg0, %arg0 : i32
    %1 = spirv.SGreaterThan %arg1, %arg1 : vector<3xi32>
    return %0, %1 : i1, vector<3xi1>
  }
  func.func @const_fold_scalar_sgt() -> (i1, i1) {
    %cst4_i32 = spirv.Constant 4 : i32
    %cst5_i32 = spirv.Constant 5 : i32
    %cst6_i32 = spirv.Constant 6 : i32
    %0 = spirv.SGreaterThan %cst5_i32, %cst6_i32 : i32
    %1 = spirv.SGreaterThan %cst5_i32, %cst4_i32 : i32
    return %0, %1 : i1, i1
  }
  func.func @const_fold_vector_sgt() -> vector<3xi1> {
    %cst_vec_3xi32 = spirv.Constant dense<[-1, -4, 3]> : vector<3xi32>
    %cst_vec_3xi32_0 = spirv.Constant dense<[-1, -3, 2]> : vector<3xi32>
    %0 = spirv.SGreaterThan %cst_vec_3xi32, %cst_vec_3xi32_0 : vector<3xi32>
    return %0 : vector<3xi1>
  }
}

// -----
module {
  func.func @sge_same(%arg0: i32, %arg1: vector<3xi32>) -> (i1, vector<3xi1>) {
    %0 = spirv.SGreaterThanEqual %arg0, %arg0 : i32
    %1 = spirv.SGreaterThanEqual %arg1, %arg1 : vector<3xi32>
    return %0, %1 : i1, vector<3xi1>
  }
  func.func @const_fold_scalar_sge() -> (i1, i1) {
    %cst4_i32 = spirv.Constant 4 : i32
    %cst5_i32 = spirv.Constant 5 : i32
    %cst6_i32 = spirv.Constant 6 : i32
    %0 = spirv.SGreaterThanEqual %cst5_i32, %cst6_i32 : i32
    %1 = spirv.SGreaterThanEqual %cst5_i32, %cst4_i32 : i32
    return %0, %1 : i1, i1
  }
  func.func @const_fold_vector_sge() -> vector<3xi1> {
    %cst_vec_3xi32 = spirv.Constant dense<[-1, -4, 3]> : vector<3xi32>
    %cst_vec_3xi32_0 = spirv.Constant dense<[-1, -3, 2]> : vector<3xi32>
    %0 = spirv.SGreaterThanEqual %cst_vec_3xi32, %cst_vec_3xi32_0 : vector<3xi32>
    return %0 : vector<3xi1>
  }
}

// -----
module {
  func.func @ugt_same(%arg0: i32, %arg1: vector<3xi32>) -> (i1, vector<3xi1>) {
    %0 = spirv.UGreaterThan %arg0, %arg0 : i32
    %1 = spirv.UGreaterThan %arg1, %arg1 : vector<3xi32>
    return %0, %1 : i1, vector<3xi1>
  }
  func.func @const_fold_scalar_ugt() -> (i1, i1) {
    %cst4_i32 = spirv.Constant 4 : i32
    %cst5_i32 = spirv.Constant 5 : i32
    %cst-6_i32 = spirv.Constant -6 : i32
    %0 = spirv.UGreaterThan %cst5_i32, %cst-6_i32 : i32
    %1 = spirv.UGreaterThan %cst5_i32, %cst4_i32 : i32
    return %0, %1 : i1, i1
  }
  func.func @const_fold_vector_ugt() -> vector<3xi1> {
    %cst_vec_3xi32 = spirv.Constant dense<[-1, -4, 3]> : vector<3xi32>
    %cst_vec_3xi32_0 = spirv.Constant dense<[-1, -3, 2]> : vector<3xi32>
    %0 = spirv.UGreaterThan %cst_vec_3xi32, %cst_vec_3xi32_0 : vector<3xi32>
    return %0 : vector<3xi1>
  }
}

// -----
module {
  func.func @uge_same(%arg0: i32, %arg1: vector<3xi32>) -> (i1, vector<3xi1>) {
    %0 = spirv.UGreaterThanEqual %arg0, %arg0 : i32
    %1 = spirv.UGreaterThanEqual %arg1, %arg1 : vector<3xi32>
    return %0, %1 : i1, vector<3xi1>
  }
  func.func @const_fold_scalar_uge() -> (i1, i1) {
    %cst4_i32 = spirv.Constant 4 : i32
    %cst5_i32 = spirv.Constant 5 : i32
    %cst-6_i32 = spirv.Constant -6 : i32
    %0 = spirv.UGreaterThanEqual %cst5_i32, %cst-6_i32 : i32
    %1 = spirv.UGreaterThanEqual %cst5_i32, %cst4_i32 : i32
    return %0, %1 : i1, i1
  }
  func.func @const_fold_vector_uge() -> vector<3xi1> {
    %cst_vec_3xi32 = spirv.Constant dense<[-1, -4, 3]> : vector<3xi32>
    %cst_vec_3xi32_0 = spirv.Constant dense<[-1, -3, 2]> : vector<3xi32>
    %0 = spirv.UGreaterThanEqual %cst_vec_3xi32, %cst_vec_3xi32_0 : vector<3xi32>
    return %0 : vector<3xi1>
  }
}

// -----
module {
  func.func @slt_same(%arg0: i32, %arg1: vector<3xi32>) -> (i1, vector<3xi1>) {
    %0 = spirv.SLessThan %arg0, %arg0 : i32
    %1 = spirv.SLessThan %arg1, %arg1 : vector<3xi32>
    return %0, %1 : i1, vector<3xi1>
  }
  func.func @const_fold_scalar_slt() -> (i1, i1) {
    %cst4_i32 = spirv.Constant 4 : i32
    %cst5_i32 = spirv.Constant 5 : i32
    %cst6_i32 = spirv.Constant 6 : i32
    %0 = spirv.SLessThan %cst5_i32, %cst6_i32 : i32
    %1 = spirv.SLessThan %cst5_i32, %cst4_i32 : i32
    return %0, %1 : i1, i1
  }
  func.func @const_fold_vector_slt() -> vector<3xi1> {
    %cst_vec_3xi32 = spirv.Constant dense<[-1, -4, 3]> : vector<3xi32>
    %cst_vec_3xi32_0 = spirv.Constant dense<[-1, -3, 2]> : vector<3xi32>
    %0 = spirv.SLessThan %cst_vec_3xi32, %cst_vec_3xi32_0 : vector<3xi32>
    return %0 : vector<3xi1>
  }
}

// -----
module {
  func.func @sle_same(%arg0: i32, %arg1: vector<3xi32>) -> (i1, vector<3xi1>) {
    %0 = spirv.SLessThanEqual %arg0, %arg0 : i32
    %1 = spirv.SLessThanEqual %arg1, %arg1 : vector<3xi32>
    return %0, %1 : i1, vector<3xi1>
  }
  func.func @const_fold_scalar_sle() -> (i1, i1) {
    %cst4_i32 = spirv.Constant 4 : i32
    %cst5_i32 = spirv.Constant 5 : i32
    %cst6_i32 = spirv.Constant 6 : i32
    %0 = spirv.SLessThanEqual %cst5_i32, %cst6_i32 : i32
    %1 = spirv.SLessThanEqual %cst5_i32, %cst4_i32 : i32
    return %0, %1 : i1, i1
  }
  func.func @const_fold_vector_sle() -> vector<3xi1> {
    %cst_vec_3xi32 = spirv.Constant dense<[-1, -4, 3]> : vector<3xi32>
    %cst_vec_3xi32_0 = spirv.Constant dense<[-1, -3, 2]> : vector<3xi32>
    %0 = spirv.SLessThanEqual %cst_vec_3xi32, %cst_vec_3xi32_0 : vector<3xi32>
    return %0 : vector<3xi1>
  }
}

// -----
module {
  func.func @ult_same(%arg0: i32, %arg1: vector<3xi32>) -> (i1, vector<3xi1>) {
    %0 = spirv.ULessThan %arg0, %arg0 : i32
    %1 = spirv.ULessThan %arg1, %arg1 : vector<3xi32>
    return %0, %1 : i1, vector<3xi1>
  }
  func.func @const_fold_scalar_ult() -> (i1, i1) {
    %cst4_i32 = spirv.Constant 4 : i32
    %cst5_i32 = spirv.Constant 5 : i32
    %cst-6_i32 = spirv.Constant -6 : i32
    %0 = spirv.ULessThan %cst5_i32, %cst-6_i32 : i32
    %1 = spirv.ULessThan %cst5_i32, %cst4_i32 : i32
    return %0, %1 : i1, i1
  }
  func.func @const_fold_vector_ult() -> vector<3xi1> {
    %cst_vec_3xi32 = spirv.Constant dense<[-1, -4, 3]> : vector<3xi32>
    %cst_vec_3xi32_0 = spirv.Constant dense<[-1, -3, 2]> : vector<3xi32>
    %0 = spirv.ULessThan %cst_vec_3xi32, %cst_vec_3xi32_0 : vector<3xi32>
    return %0 : vector<3xi1>
  }
}

// -----
module {
  func.func @ule_same(%arg0: i32, %arg1: vector<3xi32>) -> (i1, vector<3xi1>) {
    %0 = spirv.ULessThanEqual %arg0, %arg0 : i32
    %1 = spirv.ULessThanEqual %arg1, %arg1 : vector<3xi32>
    return %0, %1 : i1, vector<3xi1>
  }
  func.func @const_fold_scalar_ule() -> (i1, i1) {
    %cst4_i32 = spirv.Constant 4 : i32
    %cst5_i32 = spirv.Constant 5 : i32
    %cst-6_i32 = spirv.Constant -6 : i32
    %0 = spirv.ULessThanEqual %cst5_i32, %cst-6_i32 : i32
    %1 = spirv.ULessThanEqual %cst5_i32, %cst4_i32 : i32
    return %0, %1 : i1, i1
  }
  func.func @const_fold_vector_ule() -> vector<3xi1> {
    %cst_vec_3xi32 = spirv.Constant dense<[-1, -4, 3]> : vector<3xi32>
    %cst_vec_3xi32_0 = spirv.Constant dense<[-1, -3, 2]> : vector<3xi32>
    %0 = spirv.ULessThanEqual %cst_vec_3xi32, %cst_vec_3xi32_0 : vector<3xi32>
    return %0 : vector<3xi1>
  }
}

// -----
module {
  func.func @lsl_x_0(%arg0: i32, %arg1: vector<3xi32>) -> (i32, vector<3xi32>) {
    %cst0_i32 = spirv.Constant 0 : i32
    %cst_vec_3xi32 = spirv.Constant dense<0> : vector<3xi32>
    %0 = spirv.ShiftLeftLogical %arg0, %cst0_i32 : i32, i32
    %1 = spirv.ShiftLeftLogical %arg1, %cst_vec_3xi32 : vector<3xi32>, vector<3xi32>
    return %0, %1 : i32, vector<3xi32>
  }
  func.func @lsl_shift_overflow(%arg0: i32, %arg1: vector<3xi32>) -> (i32, vector<3xi32>) {
    %cst32_i32 = spirv.Constant 32 : i32
    %cst_vec_3xi32 = spirv.Constant dense<[6, 18, 128]> : vector<3xi32>
    %0 = spirv.ShiftLeftLogical %arg0, %cst32_i32 : i32, i32
    %1 = spirv.ShiftLeftLogical %arg1, %cst_vec_3xi32 : vector<3xi32>, vector<3xi32>
    return %0, %1 : i32, vector<3xi32>
  }
  func.func @const_fold_scalar_lsl() -> i32 {
    %cst65535_i32 = spirv.Constant 65535 : i32
    %cst17_i32 = spirv.Constant 17 : i32
    %0 = spirv.ShiftLeftLogical %cst65535_i32, %cst17_i32 : i32, i32
    return %0 : i32
  }
  func.func @const_fold_vector_lsl() -> vector<3xi32> {
    %cst_vec_3xi32 = spirv.Constant dense<[1, -1, 127]> : vector<3xi32>
    %cst_vec_3xi32_0 = spirv.Constant dense<[31, 16, 13]> : vector<3xi32>
    %0 = spirv.ShiftLeftLogical %cst_vec_3xi32, %cst_vec_3xi32_0 : vector<3xi32>, vector<3xi32>
    return %0 : vector<3xi32>
  }
}

// -----
module {
  func.func @asr_x_0(%arg0: i32, %arg1: vector<3xi32>) -> (i32, vector<3xi32>) {
    %cst0_i32 = spirv.Constant 0 : i32
    %cst_vec_3xi32 = spirv.Constant dense<0> : vector<3xi32>
    %0 = spirv.ShiftRightArithmetic %arg0, %cst0_i32 : i32, i32
    %1 = spirv.ShiftRightArithmetic %arg1, %cst_vec_3xi32 : vector<3xi32>, vector<3xi32>
    return %0, %1 : i32, vector<3xi32>
  }
  func.func @asr_shift_overflow(%arg0: i32, %arg1: vector<3xi32>) -> (i32, vector<3xi32>) {
    %cst32_i32 = spirv.Constant 32 : i32
    %cst_vec_3xi32 = spirv.Constant dense<[6, 18, 128]> : vector<3xi32>
    %0 = spirv.ShiftRightArithmetic %arg0, %cst32_i32 : i32, i32
    %1 = spirv.ShiftRightArithmetic %arg1, %cst_vec_3xi32 : vector<3xi32>, vector<3xi32>
    return %0, %1 : i32, vector<3xi32>
  }
  func.func @const_fold_scalar_asr() -> i32 {
    %cst-131072_i32 = spirv.Constant -131072 : i32
    %cst17_i32 = spirv.Constant 17 : i32
    %0 = spirv.ShiftRightArithmetic %cst-131072_i32, %cst17_i32 : i32, i32
    return %0 : i32
  }
  func.func @const_fold_vector_asr() -> vector<3xi32> {
    %cst_vec_3xi32 = spirv.Constant dense<[-2147483648, 239847, 127]> : vector<3xi32>
    %cst_vec_3xi32_0 = spirv.Constant dense<[31, 16, 13]> : vector<3xi32>
    %0 = spirv.ShiftRightArithmetic %cst_vec_3xi32, %cst_vec_3xi32_0 : vector<3xi32>, vector<3xi32>
    return %0 : vector<3xi32>
  }
}

// -----
module {
  func.func @lsr_x_0(%arg0: i32, %arg1: vector<3xi32>) -> (i32, vector<3xi32>) {
    %cst0_i32 = spirv.Constant 0 : i32
    %cst_vec_3xi32 = spirv.Constant dense<0> : vector<3xi32>
    %0 = spirv.ShiftRightLogical %arg0, %cst0_i32 : i32, i32
    %1 = spirv.ShiftRightLogical %arg1, %cst_vec_3xi32 : vector<3xi32>, vector<3xi32>
    return %0, %1 : i32, vector<3xi32>
  }
  func.func @lsr_shift_overflow(%arg0: i32, %arg1: vector<3xi32>) -> (i32, vector<3xi32>) {
    %cst32_i32 = spirv.Constant 32 : i32
    %cst_vec_3xi32 = spirv.Constant dense<[6, 18, 128]> : vector<3xi32>
    %0 = spirv.ShiftRightLogical %arg0, %cst32_i32 : i32, i32
    %1 = spirv.ShiftRightLogical %arg1, %cst_vec_3xi32 : vector<3xi32>, vector<3xi32>
    return %0, %1 : i32, vector<3xi32>
  }
  func.func @const_fold_scalar_lsr() -> i32 {
    %cst-131072_i32 = spirv.Constant -131072 : i32
    %cst17_i32 = spirv.Constant 17 : i32
    %0 = spirv.ShiftRightLogical %cst-131072_i32, %cst17_i32 : i32, i32
    return %0 : i32
  }
  func.func @const_fold_vector_lsr() -> vector<3xi32> {
    %cst_vec_3xi32 = spirv.Constant dense<[-2147483648, -1, -127]> : vector<3xi32>
    %cst_vec_3xi32_0 = spirv.Constant dense<[31, 16, 13]> : vector<3xi32>
    %0 = spirv.ShiftRightLogical %cst_vec_3xi32, %cst_vec_3xi32_0 : vector<3xi32>, vector<3xi32>
    return %0 : vector<3xi32>
  }
}

// -----
module {
  func.func @bitwise_and_x_x(%arg0: i32, %arg1: vector<3xi32>) -> (i32, vector<3xi32>) {
    %0 = spirv.BitwiseAnd %arg0, %arg0 : i32
    %1 = spirv.BitwiseAnd %arg1, %arg1 : vector<3xi32>
    return %0, %1 : i32, vector<3xi32>
  }
  func.func @bitwise_and_x_0(%arg0: i32, %arg1: vector<3xi32>) -> (i32, vector<3xi32>) {
    %cst0_i32 = spirv.Constant 0 : i32
    %cst_vec_3xi32 = spirv.Constant dense<0> : vector<3xi32>
    %0 = spirv.BitwiseAnd %arg0, %cst0_i32 : i32
    %1 = spirv.BitwiseAnd %arg1, %cst_vec_3xi32 : vector<3xi32>
    return %0, %1 : i32, vector<3xi32>
  }
  func.func @bitwise_and_x_n1(%arg0: i32, %arg1: vector<3xi32>) -> (i32, vector<3xi32>) {
    %cst-1_i32 = spirv.Constant -1 : i32
    %cst_vec_3xi32 = spirv.Constant dense<-1> : vector<3xi32>
    %0 = spirv.BitwiseAnd %arg0, %cst-1_i32 : i32
    %1 = spirv.BitwiseAnd %arg1, %cst_vec_3xi32 : vector<3xi32>
    return %0, %1 : i32, vector<3xi32>
  }
  func.func @const_fold_scalar_band() -> i32 {
    %cst-268464129_i32 = spirv.Constant -268464129 : i32
    %cst268464128_i32 = spirv.Constant 268464128 : i32
    %0 = spirv.BitwiseAnd %cst-268464129_i32, %cst268464128_i32 : i32
    return %0 : i32
  }
  func.func @const_fold_vector_band() -> vector<3xi32> {
    %cst_vec_3xi32 = spirv.Constant dense<[42, -55, 127]> : vector<3xi32>
    %cst_vec_3xi32_0 = spirv.Constant dense<[-3, -15, 28]> : vector<3xi32>
    %0 = spirv.BitwiseAnd %cst_vec_3xi32, %cst_vec_3xi32_0 : vector<3xi32>
    return %0 : vector<3xi32>
  }
}

// -----
module {
  func.func @bitwise_or_x_x(%arg0: i32, %arg1: vector<3xi32>) -> (i32, vector<3xi32>) {
    %0 = spirv.BitwiseOr %arg0, %arg0 : i32
    %1 = spirv.BitwiseOr %arg1, %arg1 : vector<3xi32>
    return %0, %1 : i32, vector<3xi32>
  }
  func.func @bitwise_or_x_0(%arg0: i32, %arg1: vector<3xi32>) -> (i32, vector<3xi32>) {
    %cst0_i32 = spirv.Constant 0 : i32
    %cst_vec_3xi32 = spirv.Constant dense<0> : vector<3xi32>
    %0 = spirv.BitwiseOr %arg0, %cst0_i32 : i32
    %1 = spirv.BitwiseOr %arg1, %cst_vec_3xi32 : vector<3xi32>
    return %0, %1 : i32, vector<3xi32>
  }
  func.func @bitwise_or_x_n1(%arg0: i32, %arg1: vector<3xi32>) -> (i32, vector<3xi32>) {
    %cst-1_i32 = spirv.Constant -1 : i32
    %cst_vec_3xi32 = spirv.Constant dense<-1> : vector<3xi32>
    %0 = spirv.BitwiseOr %arg0, %cst-1_i32 : i32
    %1 = spirv.BitwiseOr %arg1, %cst_vec_3xi32 : vector<3xi32>
    return %0, %1 : i32, vector<3xi32>
  }
  func.func @const_fold_scalar_bor() -> i32 {
    %cst-268464129_i32 = spirv.Constant -268464129 : i32
    %cst268464128_i32 = spirv.Constant 268464128 : i32
    %0 = spirv.BitwiseOr %cst-268464129_i32, %cst268464128_i32 : i32
    return %0 : i32
  }
  func.func @const_fold_vector_bor() -> vector<3xi32> {
    %cst_vec_3xi32 = spirv.Constant dense<[42, -55, 127]> : vector<3xi32>
    %cst_vec_3xi32_0 = spirv.Constant dense<[-3, -15, 28]> : vector<3xi32>
    %0 = spirv.BitwiseOr %cst_vec_3xi32, %cst_vec_3xi32_0 : vector<3xi32>
    return %0 : vector<3xi32>
  }
}

// -----
module {
  func.func @bitwise_xor_x_0(%arg0: i32, %arg1: vector<3xi32>) -> (i32, vector<3xi32>) {
    %cst0_i32 = spirv.Constant 0 : i32
    %cst_vec_3xi32 = spirv.Constant dense<0> : vector<3xi32>
    %0 = spirv.BitwiseXor %arg0, %cst0_i32 : i32
    %1 = spirv.BitwiseXor %arg1, %cst_vec_3xi32 : vector<3xi32>
    return %0, %1 : i32, vector<3xi32>
  }
  func.func @bitwise_xor_x_x(%arg0: i32, %arg1: vector<3xi32>) -> (i32, vector<3xi32>) {
    %0 = spirv.BitwiseXor %arg0, %arg0 : i32
    %1 = spirv.BitwiseXor %arg1, %arg1 : vector<3xi32>
    return %0, %1 : i32, vector<3xi32>
  }
  func.func @const_fold_scalar_bxor() -> i32 {
    %cst-1_i32 = spirv.Constant -1 : i32
    %cst-2147483648_i32 = spirv.Constant -2147483648 : i32
    %0 = spirv.BitwiseXor %cst-1_i32, %cst-2147483648_i32 : i32
    return %0 : i32
  }
  func.func @const_fold_vector_bxor() -> vector<3xi32> {
    %cst_vec_3xi32 = spirv.Constant dense<[42, -55, 127]> : vector<3xi32>
    %cst_vec_3xi32_0 = spirv.Constant dense<[-3, -15, 28]> : vector<3xi32>
    %0 = spirv.BitwiseXor %cst_vec_3xi32, %cst_vec_3xi32_0 : vector<3xi32>
    return %0 : vector<3xi32>
  }
}

// -----
module {
  func.func @canonicalize_selection_op_scalar_type(%arg0: i1) {
    %cst0_i32 = spirv.Constant 0 : i32
    %cst1_i32 = spirv.Constant 1 : i32
    %cst2_i32 = spirv.Constant 2 : i32
    %0 = spirv.Variable init(%cst0_i32) : !spirv.ptr<i32, Function>
    spirv.mlir.selection {
      spirv.BranchConditional %arg0, ^bb2, ^bb1
    ^bb1:  // pred: ^bb0
      spirv.Store "Function" %0, %cst2_i32 ["Aligned", 4] : i32
      spirv.Branch ^bb3
    ^bb2:  // pred: ^bb0
      spirv.Store "Function" %0, %cst1_i32 ["Aligned", 4] : i32
      spirv.Branch ^bb3
    ^bb3:  // 2 preds: ^bb1, ^bb2
      spirv.mlir.merge
    }
    spirv.Return
  }
}

// -----
module {
  func.func @canonicalize_selection_op_vector_type(%arg0: i1) {
    %cst_vec_3xi32 = spirv.Constant dense<[0, 1, 2]> : vector<3xi32>
    %cst_vec_3xi32_0 = spirv.Constant dense<[1, 2, 3]> : vector<3xi32>
    %cst_vec_3xi32_1 = spirv.Constant dense<[2, 3, 4]> : vector<3xi32>
    %0 = spirv.Variable init(%cst_vec_3xi32) : !spirv.ptr<vector<3xi32>, Function>
    spirv.mlir.selection {
      spirv.BranchConditional %arg0, ^bb1, ^bb2
    ^bb1:  // pred: ^bb0
      spirv.Store "Function" %0, %cst_vec_3xi32_0 ["Aligned", 8] : vector<3xi32>
      spirv.Branch ^bb3
    ^bb2:  // pred: ^bb0
      spirv.Store "Function" %0, %cst_vec_3xi32_1 ["Aligned", 8] : vector<3xi32>
      spirv.Branch ^bb3
    ^bb3:  // 2 preds: ^bb1, ^bb2
      spirv.mlir.merge
    }
    spirv.Return
  }
}

// -----
module {
  func.func @cannot_canonicalize_selection_op_0(%arg0: i1) {
    %cst_vec_3xi32 = spirv.Constant dense<[0, 1, 2]> : vector<3xi32>
    %cst_vec_3xi32_0 = spirv.Constant dense<[1, 2, 3]> : vector<3xi32>
    %cst_vec_3xi32_1 = spirv.Constant dense<[2, 3, 4]> : vector<3xi32>
    %0 = spirv.Variable init(%cst_vec_3xi32) : !spirv.ptr<vector<3xi32>, Function>
    %1 = spirv.Variable init(%cst_vec_3xi32) : !spirv.ptr<vector<3xi32>, Function>
    spirv.mlir.selection {
      spirv.BranchConditional %arg0, ^bb1, ^bb2
    ^bb1:  // pred: ^bb0
      spirv.Store "Function" %0, %cst_vec_3xi32_0 ["Aligned", 8] : vector<3xi32>
      spirv.Branch ^bb3
    ^bb2:  // pred: ^bb0
      spirv.Store "Function" %1, %cst_vec_3xi32_1 ["Aligned", 8] : vector<3xi32>
      spirv.Branch ^bb3
    ^bb3:  // 2 preds: ^bb1, ^bb2
      spirv.mlir.merge
    }
    spirv.Return
  }
}

// -----
module {
  func.func @cannot_canonicalize_selection_op_1(%arg0: i1) {
    %cst_vec_3xi32 = spirv.Constant dense<[0, 1, 2]> : vector<3xi32>
    %cst_vec_3xi32_0 = spirv.Constant dense<[1, 2, 3]> : vector<3xi32>
    %cst_vec_3xi32_1 = spirv.Constant dense<[2, 3, 4]> : vector<3xi32>
    %0 = spirv.Variable init(%cst_vec_3xi32) : !spirv.ptr<vector<3xi32>, Function>
    %1 = spirv.Variable init(%cst_vec_3xi32) : !spirv.ptr<vector<3xi32>, Function>
    spirv.mlir.selection {
      spirv.BranchConditional %arg0, ^bb1, ^bb2
    ^bb1:  // pred: ^bb0
      spirv.Store "Function" %0, %cst_vec_3xi32_0 ["Aligned", 8] : vector<3xi32>
      spirv.Store "Function" %1, %cst_vec_3xi32_0 ["Aligned", 8] : vector<3xi32>
      spirv.Branch ^bb3
    ^bb2:  // pred: ^bb0
      spirv.Store "Function" %1, %cst_vec_3xi32_1 ["Aligned", 8] : vector<3xi32>
      spirv.Branch ^bb3
    ^bb3:  // 2 preds: ^bb1, ^bb2
      spirv.mlir.merge
    }
    spirv.Return
  }
}

// -----
module {
  func.func @cannot_canonicalize_selection_op_2(%arg0: i1) {
    %cst_vec_3xi32 = spirv.Constant dense<[0, 1, 2]> : vector<3xi32>
    %cst_vec_3xi32_0 = spirv.Constant dense<[1, 2, 3]> : vector<3xi32>
    %cst_vec_3xi32_1 = spirv.Constant dense<[2, 3, 4]> : vector<3xi32>
    %0 = spirv.Variable init(%cst_vec_3xi32) : !spirv.ptr<vector<3xi32>, Function>
    spirv.mlir.selection {
      spirv.BranchConditional %arg0, ^bb1, ^bb2
    ^bb1:  // 2 preds: ^bb0, ^bb2
      spirv.Store "Function" %0, %cst_vec_3xi32_0 ["Aligned", 8] : vector<3xi32>
      spirv.Branch ^bb3
    ^bb2:  // pred: ^bb0
      spirv.Store "Function" %0, %cst_vec_3xi32_1 ["Aligned", 8] : vector<3xi32>
      spirv.Branch ^bb1
    ^bb3:  // pred: ^bb1
      spirv.mlir.merge
    }
    spirv.Return
  }
}

// -----
module {
  func.func @cannot_canonicalize_selection_op_3(%arg0: i1) {
    %cst_vec_3xi32 = spirv.Constant dense<[0, 1, 2]> : vector<3xi32>
    %cst_vec_3xi32_0 = spirv.Constant dense<[1, 2, 3]> : vector<3xi32>
    %cst_vec_3xi32_1 = spirv.Constant dense<[2, 3, 4]> : vector<3xi32>
    %0 = spirv.Variable init(%cst_vec_3xi32) : !spirv.ptr<vector<3xi32>, Function>
    spirv.mlir.selection {
      spirv.BranchConditional %arg0, ^bb1, ^bb2
    ^bb1:  // pred: ^bb0
      spirv.Store "Function" %0, %cst_vec_3xi32_0 ["Aligned", 8] : vector<3xi32>
      spirv.Return
    ^bb2:  // pred: ^bb0
      spirv.Store "Function" %0, %cst_vec_3xi32_1 ["Aligned", 8] : vector<3xi32>
      spirv.Branch ^bb3
    ^bb3:  // pred: ^bb2
      spirv.mlir.merge
    }
    spirv.Return
  }
}

// -----
module {
  func.func @cannot_canonicalize_selection_op_4(%arg0: i1) {
    %cst_vec_3xi32 = spirv.Constant dense<[0, 1, 2]> : vector<3xi32>
    %cst_vec_3xi32_0 = spirv.Constant dense<[1, 2, 3]> : vector<3xi32>
    %cst_vec_3xi32_1 = spirv.Constant dense<[2, 3, 4]> : vector<3xi32>
    %0 = spirv.Variable init(%cst_vec_3xi32) : !spirv.ptr<vector<3xi32>, Function>
    spirv.mlir.selection {
      spirv.BranchConditional %arg0, ^bb1, ^bb2
    ^bb1:  // pred: ^bb0
      spirv.Store "Function" %0, %cst_vec_3xi32_0 ["Aligned", 4] : vector<3xi32>
      spirv.Branch ^bb3
    ^bb2:  // pred: ^bb0
      spirv.Store "Function" %0, %cst_vec_3xi32_1 ["Aligned", 8] : vector<3xi32>
      spirv.Branch ^bb3
    ^bb3:  // 2 preds: ^bb1, ^bb2
      spirv.mlir.merge
    }
    spirv.Return
  }
}

