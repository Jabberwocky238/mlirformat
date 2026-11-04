module {
  spirv.module Logical Vulkan requires #spirv.vce<v1.3, [VulkanMemoryModel, Shader, Int64, Int16, Int8, Float64, Float16, CooperativeMatrixKHR, TensorsARM, Linkage], [SPV_KHR_vulkan_memory_model, SPV_KHR_cooperative_matrix, SPV_ARM_tensors]> {
    spirv.func @bool_const() "None" {
      %true = spirv.Constant true
      %false = spirv.Constant false
      %0 = spirv.Variable init(%true) : !spirv.ptr<i1, Function>
      %1 = spirv.Variable init(%false) : !spirv.ptr<i1, Function>
      spirv.Return
    }
    spirv.func @i32_const() "None" {
      %cst0_i32 = spirv.Constant 0 : i32
      %cst10_i32 = spirv.Constant 10 : i32
      %cst-5_i32 = spirv.Constant -5 : i32
      %0 = spirv.IAdd %cst0_i32, %cst10_i32 : i32
      %1 = spirv.IAdd %cst-5_i32, %0 : i32
      spirv.Return
    }
    spirv.func @si32_const() "None" {
      %cst0_si32 = spirv.Constant 0 : si32
      %cst10_si32 = spirv.Constant 10 : si32
      %cst-5_si32 = spirv.Constant -5 : si32
      %0 = spirv.IAdd %cst0_si32, %cst10_si32 : si32
      %1 = spirv.IAdd %cst-5_si32, %0 : si32
      spirv.Return
    }
    spirv.func @ui32_const() "None" {
      %cst0_ui32 = spirv.Constant 0 : ui32
      %cst10_ui32 = spirv.Constant 10 : ui32
      %cst4294967291_ui32 = spirv.Constant 4294967291 : ui32
      %0 = spirv.IAdd %cst0_ui32, %cst10_ui32 : ui32
      %1 = spirv.IAdd %cst4294967291_ui32, %0 : ui32
      spirv.Return
    }
    spirv.func @i64_const() "None" {
      %cst4294967296_i64 = spirv.Constant 4294967296 : i64
      %cst-4294967296_i64 = spirv.Constant -4294967296 : i64
      %cst9223372036854775807_i64 = spirv.Constant 9223372036854775807 : i64
      %cst-9223372036854775808_i64 = spirv.Constant -9223372036854775808 : i64
      %0 = spirv.IAdd %cst4294967296_i64, %cst-4294967296_i64 : i64
      %1 = spirv.IAdd %cst9223372036854775807_i64, %cst-9223372036854775808_i64 : i64
      spirv.Return
    }
    spirv.func @i16_const() "None" {
      %cst-32768_i16 = spirv.Constant -32768 : i16
      %cst32767_i16 = spirv.Constant 32767 : i16
      %0 = spirv.IAdd %cst-32768_i16, %cst32767_i16 : i16
      spirv.Return
    }
    spirv.func @i8_const() "None" {
      %cst0_i8 = spirv.Constant 0 : i8
      %cst-1_i8 = spirv.Constant -1 : i8
      %cst0_si8 = spirv.Constant 0 : si8
      %cst127_si8 = spirv.Constant 127 : si8
      %cst-128_si8 = spirv.Constant -128 : si8
      %cst0_ui8 = spirv.Constant 0 : ui8
      %cst255_ui8 = spirv.Constant 255 : ui8
      %0 = spirv.IAdd %cst0_i8, %cst-1_i8 : i8
      %1 = spirv.IAdd %cst0_si8, %cst127_si8 : si8
      %2 = spirv.IAdd %cst127_si8, %cst-128_si8 : si8
      %3 = spirv.IAdd %cst0_ui8, %cst255_ui8 : ui8
      spirv.Return
    }
    spirv.func @float_const() "None" {
      %cst_f32 = spirv.Constant 0.000000e+00 : f32
      %cst_f32_0 = spirv.Constant 1.000000e+00 : f32
      %cst_f32_1 = spirv.Constant -0.000000e+00 : f32
      %cst_f32_2 = spirv.Constant -1.000000e+00 : f32
      %cst_f32_3 = spirv.Constant 7.500000e-01 : f32
      %cst_f32_4 = spirv.Constant -2.500000e-01 : f32
      %0 = spirv.FAdd %cst_f32, %cst_f32_0 : f32
      %1 = spirv.FAdd %cst_f32_1, %cst_f32_2 : f32
      %2 = spirv.FAdd %cst_f32_3, %cst_f32_4 : f32
      spirv.Return
    }
    spirv.func @double_const() "None" {
      %cst_f64 = spirv.Constant 1.024000e+03 : f64
      %cst_f64_0 = spirv.Constant -1.024000e+03 : f64
      %0 = spirv.FAdd %cst_f64, %cst_f64_0 : f64
      spirv.Return
    }
    spirv.func @half_const() "None" {
      %cst_f16 = spirv.Constant 5.120000e+02 : f16
      %cst_f16_0 = spirv.Constant -5.120000e+02 : f16
      %0 = spirv.FAdd %cst_f16, %cst_f16_0 : f16
      spirv.Return
    }
    spirv.func @bool_vector_const() "None" {
      %cst_vec_2xi1 = spirv.Constant dense<false> : vector<2xi1>
      %cst_vec_3xi1 = spirv.Constant dense<true> : vector<3xi1>
      %cst_vec_2xi1_0 = spirv.Constant dense<[false, true]> : vector<2xi1>
      %0 = spirv.Variable init(%cst_vec_2xi1) : !spirv.ptr<vector<2xi1>, Function>
      %1 = spirv.Variable init(%cst_vec_3xi1) : !spirv.ptr<vector<3xi1>, Function>
      %2 = spirv.Variable init(%cst_vec_2xi1_0) : !spirv.ptr<vector<2xi1>, Function>
      spirv.Return
    }
    spirv.func @int_vector_const() "None" {
      %cst_vec_3xi32 = spirv.Constant dense<0> : vector<3xi32>
      %cst_vec_3xi32_0 = spirv.Constant dense<1> : vector<3xi32>
      %cst_vec_3xi32_1 = spirv.Constant dense<[2, -3, 4]> : vector<3xi32>
      %0 = spirv.IAdd %cst_vec_3xi32, %cst_vec_3xi32_0 : vector<3xi32>
      %1 = spirv.IAdd %cst_vec_3xi32_1, %0 : vector<3xi32>
      spirv.Return
    }
    spirv.func @fp_vector_const() "None" {
      %cst_vec_4xf32 = spirv.Constant dense<0.000000e+00> : vector<4xf32>
      %cst_vec_4xf32_0 = spirv.Constant dense<-1.500000e+01> : vector<4xf32>
      %cst_vec_4xf32_1 = spirv.Constant dense<[7.500000e-01, -2.500000e-01, 1.000000e+01, 4.200000e+01]> : vector<4xf32>
      %0 = spirv.FAdd %cst_vec_4xf32, %cst_vec_4xf32_0 : vector<4xf32>
      %1 = spirv.FAdd %cst_vec_4xf32_1, %0 : vector<4xf32>
      spirv.Return
    }
    spirv.func @ui64_array_const() -> !spirv.array<3 x ui64> "None" {
      %cst = spirv.Constant [5 : ui64, 6 : ui64, 7 : ui64] : !spirv.array<3 x ui64>
      spirv.ReturnValue %cst : !spirv.array<3 x ui64>
    }
    spirv.func @si32_array_const() -> !spirv.array<3 x si32> "None" {
      %cst = spirv.Constant [5 : si32, 6 : si32, 7 : si32] : !spirv.array<3 x si32>
      spirv.ReturnValue %cst : !spirv.array<3 x si32>
    }
    spirv.func @float_array_const() -> !spirv.array<2 x vector<2xf32>> "None" {
      %cst = spirv.Constant [dense<3.000000e+00> : vector<2xf32>, dense<[4.000000e+00, 5.000000e+00]> : vector<2xf32>] : !spirv.array<2 x vector<2xf32>>
      spirv.ReturnValue %cst : !spirv.array<2 x vector<2xf32>>
    }
    spirv.func @ignore_not_used_const() "None" {
      %false = spirv.Constant false
      spirv.Return
    }
    spirv.func @materialize_const_at_each_use() -> i32 "None" {
      %cst42_i32 = spirv.Constant 42 : i32
      %0 = spirv.IAdd %cst42_i32, %cst42_i32 : i32
      spirv.ReturnValue %0 : i32
    }
    spirv.func @const_variable(%arg0: i32, %arg1: i32) "None" {
      %0 = spirv.IAdd %arg0, %arg1 : i32
      %cst5_i32 = spirv.Constant 5 : i32
      %1 = spirv.Variable init(%cst5_i32) : !spirv.ptr<i32, Function>
      %2 = spirv.Load "Function" %1 : i32
      %3 = spirv.IAdd %0, %2 : i32
      spirv.Return
    }
    spirv.func @multi_dimensions_const() -> !spirv.array<2 x !spirv.array<2 x !spirv.array<3 x i32, stride=4>, stride=12>, stride=24> "None" {
      %cst = spirv.Constant dense<[[[1, 2, 3], [4, 5, 6]], [[7, 8, 9], [10, 11, 12]]]> : tensor<2x2x3xi32> : !spirv.array<2 x !spirv.array<2 x !spirv.array<3 x i32, stride=4>, stride=12>, stride=24>
      spirv.ReturnValue %cst : !spirv.array<2 x !spirv.array<2 x !spirv.array<3 x i32, stride=4>, stride=12>, stride=24>
    }
    spirv.func @multi_dimensions_splat_const() -> !spirv.array<2 x !spirv.array<2 x !spirv.array<3 x i32, stride=4>, stride=12>, stride=24> "None" {
      %cst = spirv.Constant dense<1> : tensor<2x2x3xi32> : !spirv.array<2 x !spirv.array<2 x !spirv.array<3 x i32, stride=4>, stride=12>, stride=24>
      spirv.ReturnValue %cst : !spirv.array<2 x !spirv.array<2 x !spirv.array<3 x i32, stride=4>, stride=12>, stride=24>
    }
    spirv.func @signless_int_const_bit_extension() -> i16 "None" {
      %cst-1_i16 = spirv.Constant -1 : i16
      spirv.ReturnValue %cst-1_i16 : i16
    }
    spirv.func @signed_int_const_bit_extension() -> si16 "None" {
      %cst-1_si16 = spirv.Constant -1 : si16
      spirv.ReturnValue %cst-1_si16 : si16
    }
    spirv.func @coop_matrix_const_zero_f32() -> !spirv.coopmatrix<16x16xf32, Subgroup, MatrixAcc> "None" {
      %cst = spirv.Constant dense<0.000000e+00> : !spirv.coopmatrix<16x16xf32, Subgroup, MatrixAcc>
      spirv.ReturnValue %cst : !spirv.coopmatrix<16x16xf32, Subgroup, MatrixAcc>
    }
    spirv.func @coop_matrix_const_non_zero_f32() -> !spirv.coopmatrix<16x16xf32, Subgroup, MatrixAcc> "None" {
      %cst = spirv.Constant dense<4.200000e+00> : !spirv.coopmatrix<16x16xf32, Subgroup, MatrixAcc>
      spirv.ReturnValue %cst : !spirv.coopmatrix<16x16xf32, Subgroup, MatrixAcc>
    }
    spirv.func @coop_matrix_const_zero_i8() -> !spirv.coopmatrix<16x16xi8, Subgroup, MatrixAcc> "None" {
      %cst = spirv.Constant dense<0> : !spirv.coopmatrix<16x16xi8, Subgroup, MatrixAcc>
      spirv.ReturnValue %cst : !spirv.coopmatrix<16x16xi8, Subgroup, MatrixAcc>
    }
    spirv.func @coop_matrix_const_non_zero_i8() -> !spirv.coopmatrix<16x16xi8, Subgroup, MatrixAcc> "None" {
      %cst = spirv.Constant dense<4> : !spirv.coopmatrix<16x16xi8, Subgroup, MatrixAcc>
      spirv.ReturnValue %cst : !spirv.coopmatrix<16x16xi8, Subgroup, MatrixAcc>
    }
    spirv.EntryPoint "GLCompute" @bool_const
  }
}

