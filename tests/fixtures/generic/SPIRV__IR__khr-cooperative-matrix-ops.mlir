"builtin.module"() ({
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> i32, sym_name = "cooperative_matrix_length"}> ({
    %0 = "spirv.KHR.CooperativeMatrixLength"() <{cooperative_matrix_type = !spirv.coopmatrix<8x16xi32, Subgroup, MatrixA>}> : () -> i32
    "spirv.ReturnValue"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<i32, StorageBuffer>, i32) -> (), sym_name = "cooperative_matrix_load"}> ({
  ^bb0(%arg22: !spirv.ptr<i32, StorageBuffer>, %arg23: i32):
    %5 = "spirv.KHR.CooperativeMatrixLoad"(%arg22, %arg23) <{matrix_layout = #spirv.coop_matrix_layout_khr<RowMajor>}> : (!spirv.ptr<i32, StorageBuffer>, i32) -> !spirv.coopmatrix<16x8xi32, Workgroup, MatrixA>
    "spirv.Return"() : () -> ()
  }) : () -> ()
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<i32, StorageBuffer>, i32) -> (), sym_name = "cooperative_matrix_load_memoperand"}> ({
  ^bb0(%arg20: !spirv.ptr<i32, StorageBuffer>, %arg21: i32):
    %4 = "spirv.KHR.CooperativeMatrixLoad"(%arg20, %arg21) <{matrix_layout = #spirv.coop_matrix_layout_khr<ColumnMajor>, memory_operand = #spirv.memory_access<Volatile>}> : (!spirv.ptr<i32, StorageBuffer>, i32) -> !spirv.coopmatrix<16x8xi32, Workgroup, MatrixA>
    "spirv.Return"() : () -> ()
  }) : () -> ()
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<vector<4xi32>, StorageBuffer>, i32) -> (), sym_name = "cooperative_matrix_load_vector_ptr_type"}> ({
  ^bb0(%arg18: !spirv.ptr<vector<4xi32>, StorageBuffer>, %arg19: i32):
    %3 = "spirv.KHR.CooperativeMatrixLoad"(%arg18, %arg19) <{matrix_layout = #spirv.coop_matrix_layout_khr<RowMajor>, memory_operand = #spirv.memory_access<Volatile>}> : (!spirv.ptr<vector<4xi32>, StorageBuffer>, i32) -> !spirv.coopmatrix<8x16xi32, Subgroup, MatrixB>
    "spirv.Return"() : () -> ()
  }) : () -> ()
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<i32, Function>, i32) -> (), sym_name = "cooperative_matrix_load_function"}> ({
  ^bb0(%arg16: !spirv.ptr<i32, Function>, %arg17: i32):
    %2 = "spirv.KHR.CooperativeMatrixLoad"(%arg16, %arg17) <{matrix_layout = #spirv.coop_matrix_layout_khr<RowMajor>}> : (!spirv.ptr<i32, Function>, i32) -> !spirv.coopmatrix<8x16xi32, Subgroup, MatrixAcc>
    "spirv.Return"() : () -> ()
  }) : () -> ()
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<i32, StorageBuffer>, i16) -> (), sym_name = "cooperative_matrix_load_stride_i16"}> ({
  ^bb0(%arg14: !spirv.ptr<i32, StorageBuffer>, %arg15: i16):
    %1 = "spirv.KHR.CooperativeMatrixLoad"(%arg14, %arg15) <{matrix_layout = #spirv.coop_matrix_layout_khr<RowMajor>}> : (!spirv.ptr<i32, StorageBuffer>, i16) -> !spirv.coopmatrix<16x8xi32, Workgroup, MatrixA>
    "spirv.Return"() : () -> ()
  }) : () -> ()
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<i32, StorageBuffer>, i32) -> (), sym_name = "cooperative_matrix_load_aligned"}> ({
  ^bb0(%arg12: !spirv.ptr<i32, StorageBuffer>, %arg13: i32):
    %0 = "spirv.KHR.CooperativeMatrixLoad"(%arg12, %arg13) <{alignment = 16 : i32, matrix_layout = #spirv.coop_matrix_layout_khr<RowMajor>, memory_operand = #spirv.memory_access<Aligned>}> : (!spirv.ptr<i32, StorageBuffer>, i32) -> !spirv.coopmatrix<16x8xi32, Workgroup, MatrixA>
    "spirv.Return"() : () -> ()
  }) : () -> ()
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<i32, StorageBuffer>, i32, !spirv.coopmatrix<8x16xi32, Workgroup, MatrixA>) -> (), sym_name = "cooperative_matrix_store"}> ({
  ^bb0(%arg9: !spirv.ptr<i32, StorageBuffer>, %arg10: i32, %arg11: !spirv.coopmatrix<8x16xi32, Workgroup, MatrixA>):
    "spirv.KHR.CooperativeMatrixStore"(%arg9, %arg11, %arg10) <{matrix_layout = #spirv.coop_matrix_layout_khr<RowMajor>}> : (!spirv.ptr<i32, StorageBuffer>, !spirv.coopmatrix<8x16xi32, Workgroup, MatrixA>, i32) -> ()
    "spirv.Return"() : () -> ()
  }) : () -> ()
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<i32, StorageBuffer>, !spirv.coopmatrix<8x16xi32, Subgroup, MatrixB>, i32) -> (), sym_name = "cooperative_matrix_store_memoperand"}> ({
  ^bb0(%arg6: !spirv.ptr<i32, StorageBuffer>, %arg7: !spirv.coopmatrix<8x16xi32, Subgroup, MatrixB>, %arg8: i32):
    "spirv.KHR.CooperativeMatrixStore"(%arg6, %arg7, %arg8) <{matrix_layout = #spirv.coop_matrix_layout_khr<ColumnMajor>, memory_operand = #spirv.memory_access<Volatile>}> : (!spirv.ptr<i32, StorageBuffer>, !spirv.coopmatrix<8x16xi32, Subgroup, MatrixB>, i32) -> ()
    "spirv.Return"() : () -> ()
  }) : () -> ()
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<i32, StorageBuffer>, !spirv.coopmatrix<8x16xi32, Subgroup, MatrixB>, i16) -> (), sym_name = "cooperative_matrix_store_stride_i16"}> ({
  ^bb0(%arg3: !spirv.ptr<i32, StorageBuffer>, %arg4: !spirv.coopmatrix<8x16xi32, Subgroup, MatrixB>, %arg5: i16):
    "spirv.KHR.CooperativeMatrixStore"(%arg3, %arg4, %arg5) <{matrix_layout = #spirv.coop_matrix_layout_khr<ColumnMajor>}> : (!spirv.ptr<i32, StorageBuffer>, !spirv.coopmatrix<8x16xi32, Subgroup, MatrixB>, i16) -> ()
    "spirv.Return"() : () -> ()
  }) : () -> ()
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<i32, StorageBuffer>, i32, !spirv.coopmatrix<8x16xi32, Workgroup, MatrixA>) -> (), sym_name = "cooperative_matrix_store_aligned"}> ({
  ^bb0(%arg0: !spirv.ptr<i32, StorageBuffer>, %arg1: i32, %arg2: !spirv.coopmatrix<8x16xi32, Workgroup, MatrixA>):
    "spirv.KHR.CooperativeMatrixStore"(%arg0, %arg2, %arg1) <{alignment = 16 : i32, matrix_layout = #spirv.coop_matrix_layout_khr<RowMajor>, memory_operand = #spirv.memory_access<Aligned>}> : (!spirv.ptr<i32, StorageBuffer>, !spirv.coopmatrix<8x16xi32, Workgroup, MatrixA>, i32) -> ()
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

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
"builtin.module"() ({
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.coopmatrix<8x16xi32, Subgroup, MatrixA>, !spirv.coopmatrix<16x4xi32, Subgroup, MatrixB>, !spirv.coopmatrix<8x4xi32, Subgroup, MatrixAcc>) -> (), sym_name = "cooperative_matrix_muladd"}> ({
  ^bb0(%arg15: !spirv.coopmatrix<8x16xi32, Subgroup, MatrixA>, %arg16: !spirv.coopmatrix<16x4xi32, Subgroup, MatrixB>, %arg17: !spirv.coopmatrix<8x4xi32, Subgroup, MatrixAcc>):
    %7 = "spirv.KHR.CooperativeMatrixMulAdd"(%arg15, %arg16, %arg17) : (!spirv.coopmatrix<8x16xi32, Subgroup, MatrixA>, !spirv.coopmatrix<16x4xi32, Subgroup, MatrixB>, !spirv.coopmatrix<8x4xi32, Subgroup, MatrixAcc>) -> !spirv.coopmatrix<8x4xi32, Subgroup, MatrixAcc>
    "spirv.Return"() : () -> ()
  }) : () -> ()
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.coopmatrix<8x16xi32, Subgroup, MatrixA>, !spirv.coopmatrix<16x4xi32, Subgroup, MatrixB>, !spirv.coopmatrix<8x4xi32, Subgroup, MatrixAcc>) -> (), sym_name = "cooperative_matrix_muladd_matrix_operands"}> ({
  ^bb0(%arg12: !spirv.coopmatrix<8x16xi32, Subgroup, MatrixA>, %arg13: !spirv.coopmatrix<16x4xi32, Subgroup, MatrixB>, %arg14: !spirv.coopmatrix<8x4xi32, Subgroup, MatrixAcc>):
    %4 = "spirv.KHR.CooperativeMatrixMulAdd"(%arg12, %arg13, %arg14) <{matrix_operands = #spirv.cooperative_matrix_operands_khr<AccSat>}> : (!spirv.coopmatrix<8x16xi32, Subgroup, MatrixA>, !spirv.coopmatrix<16x4xi32, Subgroup, MatrixB>, !spirv.coopmatrix<8x4xi32, Subgroup, MatrixAcc>) -> !spirv.coopmatrix<8x4xi32, Subgroup, MatrixAcc>
    %5 = "spirv.KHR.CooperativeMatrixMulAdd"(%arg12, %arg13, %arg14) <{matrix_operands = #spirv.cooperative_matrix_operands_khr<ASigned|BSigned>}> : (!spirv.coopmatrix<8x16xi32, Subgroup, MatrixA>, !spirv.coopmatrix<16x4xi32, Subgroup, MatrixB>, !spirv.coopmatrix<8x4xi32, Subgroup, MatrixAcc>) -> !spirv.coopmatrix<8x4xi32, Subgroup, MatrixAcc>
    %6 = "spirv.KHR.CooperativeMatrixMulAdd"(%arg12, %arg13, %arg14) <{matrix_operands = #spirv.cooperative_matrix_operands_khr<ASigned|BSigned|AccSat>}> : (!spirv.coopmatrix<8x16xi32, Subgroup, MatrixA>, !spirv.coopmatrix<16x4xi32, Subgroup, MatrixB>, !spirv.coopmatrix<8x4xi32, Subgroup, MatrixAcc>) -> !spirv.coopmatrix<8x4xi32, Subgroup, MatrixAcc>
    "spirv.Return"() : () -> ()
  }) : () -> ()
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.coopmatrix<4x4xf32, Subgroup, MatrixA>, !spirv.coopmatrix<4x4xf32, Subgroup, MatrixB>, !spirv.coopmatrix<4x4xf32, Subgroup, MatrixAcc>) -> (), sym_name = "cooperative_matrix_muladd_f32"}> ({
  ^bb0(%arg9: !spirv.coopmatrix<4x4xf32, Subgroup, MatrixA>, %arg10: !spirv.coopmatrix<4x4xf32, Subgroup, MatrixB>, %arg11: !spirv.coopmatrix<4x4xf32, Subgroup, MatrixAcc>):
    %3 = "spirv.KHR.CooperativeMatrixMulAdd"(%arg9, %arg10, %arg11) : (!spirv.coopmatrix<4x4xf32, Subgroup, MatrixA>, !spirv.coopmatrix<4x4xf32, Subgroup, MatrixB>, !spirv.coopmatrix<4x4xf32, Subgroup, MatrixAcc>) -> !spirv.coopmatrix<4x4xf32, Subgroup, MatrixAcc>
    "spirv.Return"() : () -> ()
  }) : () -> ()
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.coopmatrix<8x16xi8, Subgroup, MatrixA>, !spirv.coopmatrix<16x4xi8, Subgroup, MatrixB>, !spirv.coopmatrix<8x4xi32, Subgroup, MatrixAcc>) -> (), sym_name = "cooperative_matrix_muladd_i8_i32"}> ({
  ^bb0(%arg6: !spirv.coopmatrix<8x16xi8, Subgroup, MatrixA>, %arg7: !spirv.coopmatrix<16x4xi8, Subgroup, MatrixB>, %arg8: !spirv.coopmatrix<8x4xi32, Subgroup, MatrixAcc>):
    %2 = "spirv.KHR.CooperativeMatrixMulAdd"(%arg6, %arg7, %arg8) : (!spirv.coopmatrix<8x16xi8, Subgroup, MatrixA>, !spirv.coopmatrix<16x4xi8, Subgroup, MatrixB>, !spirv.coopmatrix<8x4xi32, Subgroup, MatrixAcc>) -> !spirv.coopmatrix<8x4xi32, Subgroup, MatrixAcc>
    "spirv.Return"() : () -> ()
  }) : () -> ()
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.coopmatrix<8x16xi8, Subgroup, MatrixA>, !spirv.coopmatrix<16x4xi16, Subgroup, MatrixB>, !spirv.coopmatrix<8x4xi32, Subgroup, MatrixAcc>) -> (), sym_name = "cooperative_matrix_muladd_i8_i16_i32"}> ({
  ^bb0(%arg3: !spirv.coopmatrix<8x16xi8, Subgroup, MatrixA>, %arg4: !spirv.coopmatrix<16x4xi16, Subgroup, MatrixB>, %arg5: !spirv.coopmatrix<8x4xi32, Subgroup, MatrixAcc>):
    %1 = "spirv.KHR.CooperativeMatrixMulAdd"(%arg3, %arg4, %arg5) : (!spirv.coopmatrix<8x16xi8, Subgroup, MatrixA>, !spirv.coopmatrix<16x4xi16, Subgroup, MatrixB>, !spirv.coopmatrix<8x4xi32, Subgroup, MatrixAcc>) -> !spirv.coopmatrix<8x4xi32, Subgroup, MatrixAcc>
    "spirv.Return"() : () -> ()
  }) : () -> ()
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.coopmatrix<4x4xf16, Workgroup, MatrixA>, !spirv.coopmatrix<4x4xf16, Workgroup, MatrixB>, !spirv.coopmatrix<4x4xf16, Workgroup, MatrixAcc>) -> (), sym_name = "cooperative_matrix_muladd_workgroup"}> ({
  ^bb0(%arg0: !spirv.coopmatrix<4x4xf16, Workgroup, MatrixA>, %arg1: !spirv.coopmatrix<4x4xf16, Workgroup, MatrixB>, %arg2: !spirv.coopmatrix<4x4xf16, Workgroup, MatrixAcc>):
    %0 = "spirv.KHR.CooperativeMatrixMulAdd"(%arg0, %arg1, %arg2) : (!spirv.coopmatrix<4x4xf16, Workgroup, MatrixA>, !spirv.coopmatrix<4x4xf16, Workgroup, MatrixB>, !spirv.coopmatrix<4x4xf16, Workgroup, MatrixAcc>) -> !spirv.coopmatrix<4x4xf16, Workgroup, MatrixAcc>
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

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
"builtin.module"() ({
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.coopmatrix<2x2xi32, Subgroup, MatrixA>, !spirv.coopmatrix<2x2xi32, Subgroup, MatrixB>) -> (), sym_name = "snegate"}> ({
  ^bb0(%arg22: !spirv.coopmatrix<2x2xi32, Subgroup, MatrixA>, %arg23: !spirv.coopmatrix<2x2xi32, Subgroup, MatrixB>):
    %21 = "spirv.SNegate"(%arg22) : (!spirv.coopmatrix<2x2xi32, Subgroup, MatrixA>) -> !spirv.coopmatrix<2x2xi32, Subgroup, MatrixA>
    %22 = "spirv.SNegate"(%arg23) : (!spirv.coopmatrix<2x2xi32, Subgroup, MatrixB>) -> !spirv.coopmatrix<2x2xi32, Subgroup, MatrixB>
    "spirv.Return"() : () -> ()
  }) : () -> ()
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.coopmatrix<2x2xf32, Subgroup, MatrixA>, !spirv.coopmatrix<2x2xf32, Subgroup, MatrixB>) -> (), sym_name = "fnegate"}> ({
  ^bb0(%arg20: !spirv.coopmatrix<2x2xf32, Subgroup, MatrixA>, %arg21: !spirv.coopmatrix<2x2xf32, Subgroup, MatrixB>):
    %19 = "spirv.FNegate"(%arg20) : (!spirv.coopmatrix<2x2xf32, Subgroup, MatrixA>) -> !spirv.coopmatrix<2x2xf32, Subgroup, MatrixA>
    %20 = "spirv.FNegate"(%arg21) : (!spirv.coopmatrix<2x2xf32, Subgroup, MatrixB>) -> !spirv.coopmatrix<2x2xf32, Subgroup, MatrixB>
    "spirv.Return"() : () -> ()
  }) : () -> ()
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.coopmatrix<2x2xi32, Subgroup, MatrixA>, !spirv.coopmatrix<2x2xi32, Subgroup, MatrixB>) -> (), sym_name = "iadd"}> ({
  ^bb0(%arg18: !spirv.coopmatrix<2x2xi32, Subgroup, MatrixA>, %arg19: !spirv.coopmatrix<2x2xi32, Subgroup, MatrixB>):
    %17 = "spirv.IAdd"(%arg18, %arg18) : (!spirv.coopmatrix<2x2xi32, Subgroup, MatrixA>, !spirv.coopmatrix<2x2xi32, Subgroup, MatrixA>) -> !spirv.coopmatrix<2x2xi32, Subgroup, MatrixA>
    %18 = "spirv.IAdd"(%arg19, %arg19) : (!spirv.coopmatrix<2x2xi32, Subgroup, MatrixB>, !spirv.coopmatrix<2x2xi32, Subgroup, MatrixB>) -> !spirv.coopmatrix<2x2xi32, Subgroup, MatrixB>
    "spirv.Return"() : () -> ()
  }) : () -> ()
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.coopmatrix<2x2xf32, Subgroup, MatrixA>, !spirv.coopmatrix<2x2xf32, Subgroup, MatrixB>) -> (), sym_name = "fadd"}> ({
  ^bb0(%arg16: !spirv.coopmatrix<2x2xf32, Subgroup, MatrixA>, %arg17: !spirv.coopmatrix<2x2xf32, Subgroup, MatrixB>):
    %15 = "spirv.FAdd"(%arg16, %arg16) : (!spirv.coopmatrix<2x2xf32, Subgroup, MatrixA>, !spirv.coopmatrix<2x2xf32, Subgroup, MatrixA>) -> !spirv.coopmatrix<2x2xf32, Subgroup, MatrixA>
    %16 = "spirv.FAdd"(%arg17, %arg17) : (!spirv.coopmatrix<2x2xf32, Subgroup, MatrixB>, !spirv.coopmatrix<2x2xf32, Subgroup, MatrixB>) -> !spirv.coopmatrix<2x2xf32, Subgroup, MatrixB>
    "spirv.Return"() : () -> ()
  }) : () -> ()
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.coopmatrix<2x2xi32, Subgroup, MatrixA>, !spirv.coopmatrix<2x2xi32, Subgroup, MatrixB>) -> (), sym_name = "isub"}> ({
  ^bb0(%arg14: !spirv.coopmatrix<2x2xi32, Subgroup, MatrixA>, %arg15: !spirv.coopmatrix<2x2xi32, Subgroup, MatrixB>):
    %13 = "spirv.ISub"(%arg14, %arg14) : (!spirv.coopmatrix<2x2xi32, Subgroup, MatrixA>, !spirv.coopmatrix<2x2xi32, Subgroup, MatrixA>) -> !spirv.coopmatrix<2x2xi32, Subgroup, MatrixA>
    %14 = "spirv.ISub"(%arg15, %arg15) : (!spirv.coopmatrix<2x2xi32, Subgroup, MatrixB>, !spirv.coopmatrix<2x2xi32, Subgroup, MatrixB>) -> !spirv.coopmatrix<2x2xi32, Subgroup, MatrixB>
    "spirv.Return"() : () -> ()
  }) : () -> ()
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.coopmatrix<2x2xf32, Subgroup, MatrixA>, !spirv.coopmatrix<2x2xf32, Subgroup, MatrixB>) -> (), sym_name = "fsub"}> ({
  ^bb0(%arg12: !spirv.coopmatrix<2x2xf32, Subgroup, MatrixA>, %arg13: !spirv.coopmatrix<2x2xf32, Subgroup, MatrixB>):
    %11 = "spirv.FSub"(%arg12, %arg12) : (!spirv.coopmatrix<2x2xf32, Subgroup, MatrixA>, !spirv.coopmatrix<2x2xf32, Subgroup, MatrixA>) -> !spirv.coopmatrix<2x2xf32, Subgroup, MatrixA>
    %12 = "spirv.FSub"(%arg13, %arg13) : (!spirv.coopmatrix<2x2xf32, Subgroup, MatrixB>, !spirv.coopmatrix<2x2xf32, Subgroup, MatrixB>) -> !spirv.coopmatrix<2x2xf32, Subgroup, MatrixB>
    "spirv.Return"() : () -> ()
  }) : () -> ()
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.coopmatrix<2x2xf32, Subgroup, MatrixA>, !spirv.coopmatrix<2x2xf32, Subgroup, MatrixB>) -> (), sym_name = "fmul"}> ({
  ^bb0(%arg10: !spirv.coopmatrix<2x2xf32, Subgroup, MatrixA>, %arg11: !spirv.coopmatrix<2x2xf32, Subgroup, MatrixB>):
    %9 = "spirv.FMul"(%arg10, %arg10) : (!spirv.coopmatrix<2x2xf32, Subgroup, MatrixA>, !spirv.coopmatrix<2x2xf32, Subgroup, MatrixA>) -> !spirv.coopmatrix<2x2xf32, Subgroup, MatrixA>
    %10 = "spirv.FMul"(%arg11, %arg11) : (!spirv.coopmatrix<2x2xf32, Subgroup, MatrixB>, !spirv.coopmatrix<2x2xf32, Subgroup, MatrixB>) -> !spirv.coopmatrix<2x2xf32, Subgroup, MatrixB>
    "spirv.Return"() : () -> ()
  }) : () -> ()
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.coopmatrix<2x2xi32, Subgroup, MatrixA>, !spirv.coopmatrix<2x2xi32, Subgroup, MatrixB>) -> (), sym_name = "imul"}> ({
  ^bb0(%arg8: !spirv.coopmatrix<2x2xi32, Subgroup, MatrixA>, %arg9: !spirv.coopmatrix<2x2xi32, Subgroup, MatrixB>):
    %7 = "spirv.IMul"(%arg8, %arg8) : (!spirv.coopmatrix<2x2xi32, Subgroup, MatrixA>, !spirv.coopmatrix<2x2xi32, Subgroup, MatrixA>) -> !spirv.coopmatrix<2x2xi32, Subgroup, MatrixA>
    %8 = "spirv.IMul"(%arg9, %arg9) : (!spirv.coopmatrix<2x2xi32, Subgroup, MatrixB>, !spirv.coopmatrix<2x2xi32, Subgroup, MatrixB>) -> !spirv.coopmatrix<2x2xi32, Subgroup, MatrixB>
    "spirv.Return"() : () -> ()
  }) : () -> ()
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.coopmatrix<2x2xf32, Subgroup, MatrixA>, !spirv.coopmatrix<2x2xf32, Subgroup, MatrixB>) -> (), sym_name = "fdiv"}> ({
  ^bb0(%arg6: !spirv.coopmatrix<2x2xf32, Subgroup, MatrixA>, %arg7: !spirv.coopmatrix<2x2xf32, Subgroup, MatrixB>):
    %5 = "spirv.FDiv"(%arg6, %arg6) : (!spirv.coopmatrix<2x2xf32, Subgroup, MatrixA>, !spirv.coopmatrix<2x2xf32, Subgroup, MatrixA>) -> !spirv.coopmatrix<2x2xf32, Subgroup, MatrixA>
    %6 = "spirv.FDiv"(%arg7, %arg7) : (!spirv.coopmatrix<2x2xf32, Subgroup, MatrixB>, !spirv.coopmatrix<2x2xf32, Subgroup, MatrixB>) -> !spirv.coopmatrix<2x2xf32, Subgroup, MatrixB>
    "spirv.Return"() : () -> ()
  }) : () -> ()
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.coopmatrix<2x2xi32, Subgroup, MatrixA>, !spirv.coopmatrix<2x2xi32, Subgroup, MatrixB>) -> (), sym_name = "sdiv"}> ({
  ^bb0(%arg4: !spirv.coopmatrix<2x2xi32, Subgroup, MatrixA>, %arg5: !spirv.coopmatrix<2x2xi32, Subgroup, MatrixB>):
    %3 = "spirv.SDiv"(%arg4, %arg4) : (!spirv.coopmatrix<2x2xi32, Subgroup, MatrixA>, !spirv.coopmatrix<2x2xi32, Subgroup, MatrixA>) -> !spirv.coopmatrix<2x2xi32, Subgroup, MatrixA>
    %4 = "spirv.SDiv"(%arg5, %arg5) : (!spirv.coopmatrix<2x2xi32, Subgroup, MatrixB>, !spirv.coopmatrix<2x2xi32, Subgroup, MatrixB>) -> !spirv.coopmatrix<2x2xi32, Subgroup, MatrixB>
    "spirv.Return"() : () -> ()
  }) : () -> ()
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.coopmatrix<2x2xi32, Subgroup, MatrixA>, !spirv.coopmatrix<2x2xi32, Subgroup, MatrixB>) -> (), sym_name = "udiv"}> ({
  ^bb0(%arg2: !spirv.coopmatrix<2x2xi32, Subgroup, MatrixA>, %arg3: !spirv.coopmatrix<2x2xi32, Subgroup, MatrixB>):
    %1 = "spirv.UDiv"(%arg2, %arg2) : (!spirv.coopmatrix<2x2xi32, Subgroup, MatrixA>, !spirv.coopmatrix<2x2xi32, Subgroup, MatrixA>) -> !spirv.coopmatrix<2x2xi32, Subgroup, MatrixA>
    %2 = "spirv.UDiv"(%arg3, %arg3) : (!spirv.coopmatrix<2x2xi32, Subgroup, MatrixB>, !spirv.coopmatrix<2x2xi32, Subgroup, MatrixB>) -> !spirv.coopmatrix<2x2xi32, Subgroup, MatrixB>
    "spirv.Return"() : () -> ()
  }) : () -> ()
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.coopmatrix<2x2xf32, Subgroup, MatrixA>, f32) -> (), sym_name = "matrix_times_scalar"}> ({
  ^bb0(%arg0: !spirv.coopmatrix<2x2xf32, Subgroup, MatrixA>, %arg1: f32):
    %0 = "spirv.MatrixTimesScalar"(%arg0, %arg1) : (!spirv.coopmatrix<2x2xf32, Subgroup, MatrixA>, f32) -> !spirv.coopmatrix<2x2xf32, Subgroup, MatrixA>
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

