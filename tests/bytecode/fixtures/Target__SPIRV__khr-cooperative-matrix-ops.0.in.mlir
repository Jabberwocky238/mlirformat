"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<Vulkan>, vce_triple = #spirv.vce<v1.5, [Shader, Int8, Int16, Int64, Linkage, CooperativeMatrixKHR, VulkanMemoryModel], [SPV_KHR_storage_buffer_storage_class, SPV_KHR_cooperative_matrix]>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "cooperative_matrix_length"}> ({
      %8 = "spirv.KHR.CooperativeMatrixLength"() <{cooperative_matrix_type = !spirv.coopmatrix<2x2xi32, Subgroup, MatrixB>}> : () -> i32 loc("<stdin>":4:12)
      "spirv.Return"() : () -> () loc("<stdin>":5:7)
    }) : () -> () loc("<stdin>":3:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<i32, StorageBuffer>, i32) -> (), sym_name = "cooperative_matrix_load_1"}> ({
    ^bb0(%arg16: !spirv.ptr<i32, StorageBuffer> loc("<stdin>":8:10), %arg17: i32 loc("<stdin>":8:50)):
      %7 = "spirv.KHR.CooperativeMatrixLoad"(%arg16, %arg17) <{matrix_layout = #spirv.coop_matrix_layout_khr<RowMajor>}> : (!spirv.ptr<i32, StorageBuffer>, i32) -> !spirv.coopmatrix<16x8xi32, Workgroup, MatrixA> loc("<stdin>":9:12)
      "spirv.Return"() : () -> () loc("<stdin>":10:7)
    }) : () -> () loc("<stdin>":7:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<f32, StorageBuffer>, i64) -> (), sym_name = "cooperative_matrix_load_2"}> ({
    ^bb0(%arg14: !spirv.ptr<f32, StorageBuffer> loc("<stdin>":13:10), %arg15: i64 loc("<stdin>":13:50)):
      %6 = "spirv.KHR.CooperativeMatrixLoad"(%arg14, %arg15) <{matrix_layout = #spirv.coop_matrix_layout_khr<ColumnMajor>, memory_operand = #spirv.memory_access<Volatile>}> : (!spirv.ptr<f32, StorageBuffer>, i64) -> !spirv.coopmatrix<8x16xf32, Subgroup, MatrixAcc> loc("<stdin>":14:12)
      "spirv.Return"() : () -> () loc("<stdin>":15:7)
    }) : () -> () loc("<stdin>":12:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<i32, StorageBuffer>, i32) -> (), sym_name = "cooperative_matrix_load_3"}> ({
    ^bb0(%arg12: !spirv.ptr<i32, StorageBuffer> loc("<stdin>":18:10), %arg13: i32 loc("<stdin>":18:50)):
      %5 = "spirv.KHR.CooperativeMatrixLoad"(%arg12, %arg13) <{alignment = 16 : i32, matrix_layout = #spirv.coop_matrix_layout_khr<RowMajor>, memory_operand = #spirv.memory_access<Aligned>}> : (!spirv.ptr<i32, StorageBuffer>, i32) -> !spirv.coopmatrix<16x8xi32, Workgroup, MatrixA> loc("<stdin>":19:12)
      "spirv.Return"() : () -> () loc("<stdin>":20:7)
    }) : () -> () loc("<stdin>":17:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<i32, StorageBuffer>, i32, !spirv.coopmatrix<16x8xi32, Workgroup, MatrixA>) -> (), sym_name = "cooperative_matrix_store_1"}> ({
    ^bb0(%arg9: !spirv.ptr<i32, StorageBuffer> loc("<stdin>":23:10), %arg10: i32 loc("<stdin>":23:49), %arg11: !spirv.coopmatrix<16x8xi32, Workgroup, MatrixA> loc("<stdin>":23:62)):
      "spirv.KHR.CooperativeMatrixStore"(%arg9, %arg11, %arg10) <{matrix_layout = #spirv.coop_matrix_layout_khr<RowMajor>}> : (!spirv.ptr<i32, StorageBuffer>, !spirv.coopmatrix<16x8xi32, Workgroup, MatrixA>, i32) -> () loc("<stdin>":24:7)
      "spirv.KHR.CooperativeMatrixStore"(%arg9, %arg11, %arg10) <{alignment = 16 : i32, matrix_layout = #spirv.coop_matrix_layout_khr<RowMajor>, memory_operand = #spirv.memory_access<Aligned>}> : (!spirv.ptr<i32, StorageBuffer>, !spirv.coopmatrix<16x8xi32, Workgroup, MatrixA>, i32) -> () loc("<stdin>":25:7)
      "spirv.KHR.CooperativeMatrixStore"(%arg9, %arg11, %arg10) <{matrix_layout = #spirv.coop_matrix_layout_khr<RowMajor>, memory_operand = #spirv.memory_access<Volatile|Nontemporal>}> : (!spirv.ptr<i32, StorageBuffer>, !spirv.coopmatrix<16x8xi32, Workgroup, MatrixA>, i32) -> () loc("<stdin>":26:7)
      "spirv.Return"() : () -> () loc("<stdin>":27:7)
    }) : () -> () loc("<stdin>":22:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<f32, Workgroup>, i64, !spirv.coopmatrix<4x8xf32, Subgroup, MatrixB>) -> (), sym_name = "cooperative_matrix_store_2"}> ({
    ^bb0(%arg6: !spirv.ptr<f32, Workgroup> loc("<stdin>":30:10), %arg7: i64 loc("<stdin>":30:45), %arg8: !spirv.coopmatrix<4x8xf32, Subgroup, MatrixB> loc("<stdin>":30:57)):
      "spirv.KHR.CooperativeMatrixStore"(%arg6, %arg8, %arg7) <{matrix_layout = #spirv.coop_matrix_layout_khr<ColumnMajor>, memory_operand = #spirv.memory_access<Nontemporal>}> : (!spirv.ptr<f32, Workgroup>, !spirv.coopmatrix<4x8xf32, Subgroup, MatrixB>, i64) -> () loc("<stdin>":31:7)
      "spirv.Return"() : () -> () loc("<stdin>":32:7)
    }) : () -> () loc("<stdin>":29:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.coopmatrix<8x16xi8, Subgroup, MatrixA>, !spirv.coopmatrix<16x8xi16, Subgroup, MatrixB>, !spirv.coopmatrix<8x8xi32, Subgroup, MatrixAcc>) -> (), sym_name = "cooperative_matrix_muladd_1"}> ({
    ^bb0(%arg3: !spirv.coopmatrix<8x16xi8, Subgroup, MatrixA> loc("<stdin>":35:10), %arg4: !spirv.coopmatrix<16x8xi16, Subgroup, MatrixB> loc("<stdin>":35:64), %arg5: !spirv.coopmatrix<8x8xi32, Subgroup, MatrixAcc> loc("<stdin>":35:119)):
      %1 = "spirv.KHR.CooperativeMatrixMulAdd"(%arg3, %arg4, %arg5) : (!spirv.coopmatrix<8x16xi8, Subgroup, MatrixA>, !spirv.coopmatrix<16x8xi16, Subgroup, MatrixB>, !spirv.coopmatrix<8x8xi32, Subgroup, MatrixAcc>) -> !spirv.coopmatrix<8x8xi32, Subgroup, MatrixAcc> loc("<stdin>":36:12)
      %2 = "spirv.KHR.CooperativeMatrixMulAdd"(%arg3, %arg4, %arg5) <{matrix_operands = #spirv.cooperative_matrix_operands_khr<ASigned>}> : (!spirv.coopmatrix<8x16xi8, Subgroup, MatrixA>, !spirv.coopmatrix<16x8xi16, Subgroup, MatrixB>, !spirv.coopmatrix<8x8xi32, Subgroup, MatrixAcc>) -> !spirv.coopmatrix<8x8xi32, Subgroup, MatrixAcc> loc("<stdin>":37:12)
      %3 = "spirv.KHR.CooperativeMatrixMulAdd"(%arg3, %arg4, %arg5) <{matrix_operands = #spirv.cooperative_matrix_operands_khr<BSigned>}> : (!spirv.coopmatrix<8x16xi8, Subgroup, MatrixA>, !spirv.coopmatrix<16x8xi16, Subgroup, MatrixB>, !spirv.coopmatrix<8x8xi32, Subgroup, MatrixAcc>) -> !spirv.coopmatrix<8x8xi32, Subgroup, MatrixAcc> loc("<stdin>":38:12)
      %4 = "spirv.KHR.CooperativeMatrixMulAdd"(%arg3, %arg4, %arg5) <{matrix_operands = #spirv.cooperative_matrix_operands_khr<ASigned|BSigned|ResultSigned|AccSat>}> : (!spirv.coopmatrix<8x16xi8, Subgroup, MatrixA>, !spirv.coopmatrix<16x8xi16, Subgroup, MatrixB>, !spirv.coopmatrix<8x8xi32, Subgroup, MatrixAcc>) -> !spirv.coopmatrix<8x8xi32, Subgroup, MatrixAcc> loc("<stdin>":39:12)
      "spirv.Return"() : () -> () loc("<stdin>":40:7)
    }) : () -> () loc("<stdin>":34:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.coopmatrix<8x8xf32, Workgroup, MatrixA>, !spirv.coopmatrix<8x8xf32, Workgroup, MatrixB>, !spirv.coopmatrix<8x8xf32, Workgroup, MatrixAcc>) -> (), sym_name = "cooperative_matrix_muladd_2"}> ({
    ^bb0(%arg0: !spirv.coopmatrix<8x8xf32, Workgroup, MatrixA> loc("<stdin>":43:10), %arg1: !spirv.coopmatrix<8x8xf32, Workgroup, MatrixB> loc("<stdin>":43:65), %arg2: !spirv.coopmatrix<8x8xf32, Workgroup, MatrixAcc> loc("<stdin>":43:120)):
      %0 = "spirv.KHR.CooperativeMatrixMulAdd"(%arg0, %arg1, %arg2) : (!spirv.coopmatrix<8x8xf32, Workgroup, MatrixA>, !spirv.coopmatrix<8x8xf32, Workgroup, MatrixB>, !spirv.coopmatrix<8x8xf32, Workgroup, MatrixAcc>) -> !spirv.coopmatrix<8x8xf32, Workgroup, MatrixAcc> loc("<stdin>":44:12)
      "spirv.Return"() : () -> () loc("<stdin>":45:7)
    }) : () -> () loc("<stdin>":42:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
