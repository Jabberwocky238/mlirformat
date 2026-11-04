module {
  spirv.func @cooperative_matrix_length() -> i32 "None" {
    %0 = spirv.KHR.CooperativeMatrixLength : !spirv.coopmatrix<8x16xi32, Subgroup, MatrixA>
    spirv.ReturnValue %0 : i32
  }
}

// -----
module {
  spirv.func @cooperative_matrix_load(%arg0: !spirv.ptr<i32, StorageBuffer>, %arg1: i32) "None" {
    %0 = spirv.KHR.CooperativeMatrixLoad %arg0, %arg1, <RowMajor> : !spirv.ptr<i32, StorageBuffer>, i32 -> !spirv.coopmatrix<16x8xi32, Workgroup, MatrixA>
    spirv.Return
  }
  spirv.func @cooperative_matrix_load_memoperand(%arg0: !spirv.ptr<i32, StorageBuffer>, %arg1: i32) "None" {
    %0 = spirv.KHR.CooperativeMatrixLoad %arg0, %arg1, <ColumnMajor>, <Volatile> : !spirv.ptr<i32, StorageBuffer>, i32 -> !spirv.coopmatrix<16x8xi32, Workgroup, MatrixA>
    spirv.Return
  }
  spirv.func @cooperative_matrix_load_vector_ptr_type(%arg0: !spirv.ptr<vector<4xi32>, StorageBuffer>, %arg1: i32) "None" {
    %0 = spirv.KHR.CooperativeMatrixLoad %arg0, %arg1, <RowMajor>, <Volatile> : !spirv.ptr<vector<4xi32>, StorageBuffer>, i32 -> !spirv.coopmatrix<8x16xi32, Subgroup, MatrixB>
    spirv.Return
  }
  spirv.func @cooperative_matrix_load_function(%arg0: !spirv.ptr<i32, Function>, %arg1: i32) "None" {
    %0 = spirv.KHR.CooperativeMatrixLoad %arg0, %arg1, <RowMajor> : !spirv.ptr<i32, Function>, i32 -> !spirv.coopmatrix<8x16xi32, Subgroup, MatrixAcc>
    spirv.Return
  }
  spirv.func @cooperative_matrix_load_stride_i16(%arg0: !spirv.ptr<i32, StorageBuffer>, %arg1: i16) "None" {
    %0 = spirv.KHR.CooperativeMatrixLoad %arg0, %arg1, <RowMajor> : !spirv.ptr<i32, StorageBuffer>, i16 -> !spirv.coopmatrix<16x8xi32, Workgroup, MatrixA>
    spirv.Return
  }
  spirv.func @cooperative_matrix_load_aligned(%arg0: !spirv.ptr<i32, StorageBuffer>, %arg1: i32) "None" {
    %0 = spirv.KHR.CooperativeMatrixLoad %arg0, %arg1, <RowMajor>, <Aligned>, 16 : !spirv.ptr<i32, StorageBuffer>, i32 -> !spirv.coopmatrix<16x8xi32, Workgroup, MatrixA>
    spirv.Return
  }
  spirv.func @cooperative_matrix_store(%arg0: !spirv.ptr<i32, StorageBuffer>, %arg1: i32, %arg2: !spirv.coopmatrix<8x16xi32, Workgroup, MatrixA>) "None" {
    spirv.KHR.CooperativeMatrixStore %arg0, %arg2, %arg1, <RowMajor> : !spirv.ptr<i32, StorageBuffer>, !spirv.coopmatrix<8x16xi32, Workgroup, MatrixA>, i32
    spirv.Return
  }
  spirv.func @cooperative_matrix_store_memoperand(%arg0: !spirv.ptr<i32, StorageBuffer>, %arg1: !spirv.coopmatrix<8x16xi32, Subgroup, MatrixB>, %arg2: i32) "None" {
    spirv.KHR.CooperativeMatrixStore %arg0, %arg1, %arg2, <ColumnMajor>, <Volatile> : !spirv.ptr<i32, StorageBuffer>, !spirv.coopmatrix<8x16xi32, Subgroup, MatrixB>, i32
    spirv.Return
  }
  spirv.func @cooperative_matrix_store_stride_i16(%arg0: !spirv.ptr<i32, StorageBuffer>, %arg1: !spirv.coopmatrix<8x16xi32, Subgroup, MatrixB>, %arg2: i16) "None" {
    spirv.KHR.CooperativeMatrixStore %arg0, %arg1, %arg2, <ColumnMajor> : !spirv.ptr<i32, StorageBuffer>, !spirv.coopmatrix<8x16xi32, Subgroup, MatrixB>, i16
    spirv.Return
  }
  spirv.func @cooperative_matrix_store_aligned(%arg0: !spirv.ptr<i32, StorageBuffer>, %arg1: i32, %arg2: !spirv.coopmatrix<8x16xi32, Workgroup, MatrixA>) "None" {
    spirv.KHR.CooperativeMatrixStore %arg0, %arg2, %arg1, <RowMajor>, <Aligned>, 16 : !spirv.ptr<i32, StorageBuffer>, !spirv.coopmatrix<8x16xi32, Workgroup, MatrixA>, i32
    spirv.Return
  }
}

// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
module {
  spirv.func @cooperative_matrix_muladd(%arg0: !spirv.coopmatrix<8x16xi32, Subgroup, MatrixA>, %arg1: !spirv.coopmatrix<16x4xi32, Subgroup, MatrixB>, %arg2: !spirv.coopmatrix<8x4xi32, Subgroup, MatrixAcc>) "None" {
    %0 = spirv.KHR.CooperativeMatrixMulAdd %arg0, %arg1, %arg2 : !spirv.coopmatrix<8x16xi32, Subgroup, MatrixA>, !spirv.coopmatrix<16x4xi32, Subgroup, MatrixB> -> !spirv.coopmatrix<8x4xi32, Subgroup, MatrixAcc>
    spirv.Return
  }
  spirv.func @cooperative_matrix_muladd_matrix_operands(%arg0: !spirv.coopmatrix<8x16xi32, Subgroup, MatrixA>, %arg1: !spirv.coopmatrix<16x4xi32, Subgroup, MatrixB>, %arg2: !spirv.coopmatrix<8x4xi32, Subgroup, MatrixAcc>) "None" {
    %0 = spirv.KHR.CooperativeMatrixMulAdd %arg0, %arg1, %arg2, <AccSat> : !spirv.coopmatrix<8x16xi32, Subgroup, MatrixA>, !spirv.coopmatrix<16x4xi32, Subgroup, MatrixB> -> !spirv.coopmatrix<8x4xi32, Subgroup, MatrixAcc>
    %1 = spirv.KHR.CooperativeMatrixMulAdd %arg0, %arg1, %arg2, <ASigned|BSigned> : !spirv.coopmatrix<8x16xi32, Subgroup, MatrixA>, !spirv.coopmatrix<16x4xi32, Subgroup, MatrixB> -> !spirv.coopmatrix<8x4xi32, Subgroup, MatrixAcc>
    %2 = spirv.KHR.CooperativeMatrixMulAdd %arg0, %arg1, %arg2, <ASigned|BSigned|AccSat> : !spirv.coopmatrix<8x16xi32, Subgroup, MatrixA>, !spirv.coopmatrix<16x4xi32, Subgroup, MatrixB> -> !spirv.coopmatrix<8x4xi32, Subgroup, MatrixAcc>
    spirv.Return
  }
  spirv.func @cooperative_matrix_muladd_f32(%arg0: !spirv.coopmatrix<4x4xf32, Subgroup, MatrixA>, %arg1: !spirv.coopmatrix<4x4xf32, Subgroup, MatrixB>, %arg2: !spirv.coopmatrix<4x4xf32, Subgroup, MatrixAcc>) "None" {
    %0 = spirv.KHR.CooperativeMatrixMulAdd %arg0, %arg1, %arg2 : !spirv.coopmatrix<4x4xf32, Subgroup, MatrixA>, !spirv.coopmatrix<4x4xf32, Subgroup, MatrixB> -> !spirv.coopmatrix<4x4xf32, Subgroup, MatrixAcc>
    spirv.Return
  }
  spirv.func @cooperative_matrix_muladd_i8_i32(%arg0: !spirv.coopmatrix<8x16xi8, Subgroup, MatrixA>, %arg1: !spirv.coopmatrix<16x4xi8, Subgroup, MatrixB>, %arg2: !spirv.coopmatrix<8x4xi32, Subgroup, MatrixAcc>) "None" {
    %0 = spirv.KHR.CooperativeMatrixMulAdd %arg0, %arg1, %arg2 : !spirv.coopmatrix<8x16xi8, Subgroup, MatrixA>, !spirv.coopmatrix<16x4xi8, Subgroup, MatrixB> -> !spirv.coopmatrix<8x4xi32, Subgroup, MatrixAcc>
    spirv.Return
  }
  spirv.func @cooperative_matrix_muladd_i8_i16_i32(%arg0: !spirv.coopmatrix<8x16xi8, Subgroup, MatrixA>, %arg1: !spirv.coopmatrix<16x4xi16, Subgroup, MatrixB>, %arg2: !spirv.coopmatrix<8x4xi32, Subgroup, MatrixAcc>) "None" {
    %0 = spirv.KHR.CooperativeMatrixMulAdd %arg0, %arg1, %arg2 : !spirv.coopmatrix<8x16xi8, Subgroup, MatrixA>, !spirv.coopmatrix<16x4xi16, Subgroup, MatrixB> -> !spirv.coopmatrix<8x4xi32, Subgroup, MatrixAcc>
    spirv.Return
  }
  spirv.func @cooperative_matrix_muladd_workgroup(%arg0: !spirv.coopmatrix<4x4xf16, Workgroup, MatrixA>, %arg1: !spirv.coopmatrix<4x4xf16, Workgroup, MatrixB>, %arg2: !spirv.coopmatrix<4x4xf16, Workgroup, MatrixAcc>) "None" {
    %0 = spirv.KHR.CooperativeMatrixMulAdd %arg0, %arg1, %arg2 : !spirv.coopmatrix<4x4xf16, Workgroup, MatrixA>, !spirv.coopmatrix<4x4xf16, Workgroup, MatrixB> -> !spirv.coopmatrix<4x4xf16, Workgroup, MatrixAcc>
    spirv.Return
  }
}

// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
module {
  spirv.func @snegate(%arg0: !spirv.coopmatrix<2x2xi32, Subgroup, MatrixA>, %arg1: !spirv.coopmatrix<2x2xi32, Subgroup, MatrixB>) "None" {
    %0 = spirv.SNegate %arg0 : !spirv.coopmatrix<2x2xi32, Subgroup, MatrixA>
    %1 = spirv.SNegate %arg1 : !spirv.coopmatrix<2x2xi32, Subgroup, MatrixB>
    spirv.Return
  }
  spirv.func @fnegate(%arg0: !spirv.coopmatrix<2x2xf32, Subgroup, MatrixA>, %arg1: !spirv.coopmatrix<2x2xf32, Subgroup, MatrixB>) "None" {
    %0 = spirv.FNegate %arg0 : !spirv.coopmatrix<2x2xf32, Subgroup, MatrixA>
    %1 = spirv.FNegate %arg1 : !spirv.coopmatrix<2x2xf32, Subgroup, MatrixB>
    spirv.Return
  }
  spirv.func @iadd(%arg0: !spirv.coopmatrix<2x2xi32, Subgroup, MatrixA>, %arg1: !spirv.coopmatrix<2x2xi32, Subgroup, MatrixB>) "None" {
    %0 = spirv.IAdd %arg0, %arg0 : !spirv.coopmatrix<2x2xi32, Subgroup, MatrixA>
    %1 = spirv.IAdd %arg1, %arg1 : !spirv.coopmatrix<2x2xi32, Subgroup, MatrixB>
    spirv.Return
  }
  spirv.func @fadd(%arg0: !spirv.coopmatrix<2x2xf32, Subgroup, MatrixA>, %arg1: !spirv.coopmatrix<2x2xf32, Subgroup, MatrixB>) "None" {
    %0 = spirv.FAdd %arg0, %arg0 : !spirv.coopmatrix<2x2xf32, Subgroup, MatrixA>
    %1 = spirv.FAdd %arg1, %arg1 : !spirv.coopmatrix<2x2xf32, Subgroup, MatrixB>
    spirv.Return
  }
  spirv.func @isub(%arg0: !spirv.coopmatrix<2x2xi32, Subgroup, MatrixA>, %arg1: !spirv.coopmatrix<2x2xi32, Subgroup, MatrixB>) "None" {
    %0 = spirv.ISub %arg0, %arg0 : !spirv.coopmatrix<2x2xi32, Subgroup, MatrixA>
    %1 = spirv.ISub %arg1, %arg1 : !spirv.coopmatrix<2x2xi32, Subgroup, MatrixB>
    spirv.Return
  }
  spirv.func @fsub(%arg0: !spirv.coopmatrix<2x2xf32, Subgroup, MatrixA>, %arg1: !spirv.coopmatrix<2x2xf32, Subgroup, MatrixB>) "None" {
    %0 = spirv.FSub %arg0, %arg0 : !spirv.coopmatrix<2x2xf32, Subgroup, MatrixA>
    %1 = spirv.FSub %arg1, %arg1 : !spirv.coopmatrix<2x2xf32, Subgroup, MatrixB>
    spirv.Return
  }
  spirv.func @fmul(%arg0: !spirv.coopmatrix<2x2xf32, Subgroup, MatrixA>, %arg1: !spirv.coopmatrix<2x2xf32, Subgroup, MatrixB>) "None" {
    %0 = spirv.FMul %arg0, %arg0 : !spirv.coopmatrix<2x2xf32, Subgroup, MatrixA>
    %1 = spirv.FMul %arg1, %arg1 : !spirv.coopmatrix<2x2xf32, Subgroup, MatrixB>
    spirv.Return
  }
  spirv.func @imul(%arg0: !spirv.coopmatrix<2x2xi32, Subgroup, MatrixA>, %arg1: !spirv.coopmatrix<2x2xi32, Subgroup, MatrixB>) "None" {
    %0 = spirv.IMul %arg0, %arg0 : !spirv.coopmatrix<2x2xi32, Subgroup, MatrixA>
    %1 = spirv.IMul %arg1, %arg1 : !spirv.coopmatrix<2x2xi32, Subgroup, MatrixB>
    spirv.Return
  }
  spirv.func @fdiv(%arg0: !spirv.coopmatrix<2x2xf32, Subgroup, MatrixA>, %arg1: !spirv.coopmatrix<2x2xf32, Subgroup, MatrixB>) "None" {
    %0 = spirv.FDiv %arg0, %arg0 : !spirv.coopmatrix<2x2xf32, Subgroup, MatrixA>
    %1 = spirv.FDiv %arg1, %arg1 : !spirv.coopmatrix<2x2xf32, Subgroup, MatrixB>
    spirv.Return
  }
  spirv.func @sdiv(%arg0: !spirv.coopmatrix<2x2xi32, Subgroup, MatrixA>, %arg1: !spirv.coopmatrix<2x2xi32, Subgroup, MatrixB>) "None" {
    %0 = spirv.SDiv %arg0, %arg0 : !spirv.coopmatrix<2x2xi32, Subgroup, MatrixA>
    %1 = spirv.SDiv %arg1, %arg1 : !spirv.coopmatrix<2x2xi32, Subgroup, MatrixB>
    spirv.Return
  }
  spirv.func @udiv(%arg0: !spirv.coopmatrix<2x2xi32, Subgroup, MatrixA>, %arg1: !spirv.coopmatrix<2x2xi32, Subgroup, MatrixB>) "None" {
    %0 = spirv.UDiv %arg0, %arg0 : !spirv.coopmatrix<2x2xi32, Subgroup, MatrixA>
    %1 = spirv.UDiv %arg1, %arg1 : !spirv.coopmatrix<2x2xi32, Subgroup, MatrixB>
    spirv.Return
  }
  spirv.func @matrix_times_scalar(%arg0: !spirv.coopmatrix<2x2xf32, Subgroup, MatrixA>, %arg1: f32) "None" {
    %0 = spirv.MatrixTimesScalar %arg0, %arg1 : !spirv.coopmatrix<2x2xf32, Subgroup, MatrixA>, f32
    spirv.Return
  }
}

// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
module {
}

