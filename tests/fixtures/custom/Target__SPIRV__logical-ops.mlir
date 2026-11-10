module {
  spirv.module Logical OpenCL requires #spirv.vce<v1.0, [Kernel, Linkage], []> {
    spirv.func @any_vector(%arg0: vector<4xi1>) "None" {
      %0 = spirv.Any %arg0 : vector<4xi1>
      spirv.Return
    }
    spirv.func @all_vector(%arg0: vector<4xi1>) "None" {
      %0 = spirv.All %arg0 : vector<4xi1>
      spirv.Return
    }
    spirv.func @iequal_scalar(%arg0: i32, %arg1: i32) "None" {
      %0 = spirv.IEqual %arg0, %arg1 : i32
      spirv.Return
    }
    spirv.func @inotequal_vector(%arg0: vector<4xi32>, %arg1: vector<4xi32>) "None" {
      %0 = spirv.INotEqual %arg0, %arg1 : vector<4xi32>
      spirv.Return
    }
    spirv.func @sgt_vector(%arg0: vector<4xi32>, %arg1: vector<4xi32>) "None" {
      %0 = spirv.SGreaterThan %arg0, %arg1 : vector<4xi32>
      spirv.Return
    }
    spirv.func @sge_vector(%arg0: vector<4xi32>, %arg1: vector<4xi32>) "None" {
      %0 = spirv.SGreaterThanEqual %arg0, %arg1 : vector<4xi32>
      spirv.Return
    }
    spirv.func @slt_vector(%arg0: vector<4xi32>, %arg1: vector<4xi32>) "None" {
      %0 = spirv.SLessThan %arg0, %arg1 : vector<4xi32>
      spirv.Return
    }
    spirv.func @slte_vector(%arg0: vector<4xi32>, %arg1: vector<4xi32>) "None" {
      %0 = spirv.SLessThanEqual %arg0, %arg1 : vector<4xi32>
      spirv.Return
    }
    spirv.func @ugt_vector(%arg0: vector<4xi32>, %arg1: vector<4xi32>) "None" {
      %0 = spirv.UGreaterThan %arg0, %arg1 : vector<4xi32>
      spirv.Return
    }
    spirv.func @ugte_vector(%arg0: vector<4xi32>, %arg1: vector<4xi32>) "None" {
      %0 = spirv.UGreaterThanEqual %arg0, %arg1 : vector<4xi32>
      spirv.Return
    }
    spirv.func @ult_vector(%arg0: vector<4xi32>, %arg1: vector<4xi32>) "None" {
      %0 = spirv.ULessThan %arg0, %arg1 : vector<4xi32>
      spirv.Return
    }
    spirv.func @ulte_vector(%arg0: vector<4xi32>, %arg1: vector<4xi32>) "None" {
      %0 = spirv.ULessThanEqual %arg0, %arg1 : vector<4xi32>
      spirv.Return
    }
    spirv.func @cmpf(%arg0: f32, %arg1: f32) "None" {
      %0 = spirv.FOrdEqual %arg0, %arg1 : f32
      %1 = spirv.FOrdGreaterThan %arg0, %arg1 : f32
      %2 = spirv.FOrdGreaterThanEqual %arg0, %arg1 : f32
      %3 = spirv.FOrdLessThan %arg0, %arg1 : f32
      %4 = spirv.FOrdLessThanEqual %arg0, %arg1 : f32
      %5 = spirv.FOrdNotEqual %arg0, %arg1 : f32
      %6 = spirv.FUnordEqual %arg0, %arg1 : f32
      %7 = spirv.FUnordGreaterThan %arg0, %arg1 : f32
      %8 = spirv.FUnordGreaterThanEqual %arg0, %arg1 : f32
      %9 = spirv.FUnordLessThan %arg0, %arg1 : f32
      %10 = spirv.FUnordLessThanEqual %arg0, %arg1 : f32
      %11 = spirv.FUnordNotEqual %arg0, %arg1 : f32
      %12 = spirv.Ordered %arg0, %arg1 : f32
      %13 = spirv.Unordered %arg0, %arg1 : f32
      %14 = spirv.IsNan %arg0 : f32
      %15 = spirv.IsInf %arg1 : f32
      %16 = spirv.IsFinite %arg0 : f32
      %17 = spirv.IsNormal %arg0 : f32
      spirv.Return
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.4, [Shader, Linkage], []> {
    spirv.SpecConstant @condition_scalar = true
    spirv.func @select() "None" {
      %cst_f32 = spirv.Constant 4.000000e+00 : f32
      %cst_f32_0 = spirv.Constant 5.000000e+00 : f32
      %0 = spirv.mlir.referenceof @condition_scalar : i1
      %1 = spirv.Select %0, %cst_f32, %cst_f32_0 : i1, f32
      %cst_vec_4xf32 = spirv.Constant dense<[2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00]> : vector<4xf32>
      %cst_vec_4xf32_1 = spirv.Constant dense<[6.000000e+00, 7.000000e+00, 8.000000e+00, 9.000000e+00]> : vector<4xf32>
      %2 = spirv.Select %0, %cst_vec_4xf32, %cst_vec_4xf32_1 : i1, vector<4xf32>
      %cst_vec_4xi1 = spirv.Constant dense<true> : vector<4xi1>
      %3 = spirv.Select %cst_vec_4xi1, %cst_vec_4xf32, %cst_vec_4xf32_1 : vector<4xi1>, vector<4xf32>
      spirv.Return
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.4, [Shader, Linkage, BFloat16TypeKHR], [SPV_KHR_bfloat16]> {
    spirv.SpecConstant @condition_scalar = true
    spirv.func @select_bf16() "None" {
      %cst_bf16 = spirv.Constant 4.000000e+00 : bf16
      %cst_bf16_0 = spirv.Constant 5.000000e+00 : bf16
      %0 = spirv.mlir.referenceof @condition_scalar : i1
      %1 = spirv.Select %0, %cst_bf16, %cst_bf16_0 : i1, bf16
      %cst_vec_4xbf16 = spirv.Constant dense<[2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00]> : vector<4xbf16>
      %cst_vec_4xbf16_1 = spirv.Constant dense<[6.000000e+00, 7.000000e+00, 8.000000e+00, 9.000000e+00]> : vector<4xbf16>
      %2 = spirv.Select %0, %cst_vec_4xbf16, %cst_vec_4xbf16_1 : i1, vector<4xbf16>
      %cst_vec_4xi1 = spirv.Constant dense<true> : vector<4xi1>
      %3 = spirv.Select %cst_vec_4xi1, %cst_vec_4xbf16, %cst_vec_4xbf16_1 : vector<4xi1>, vector<4xbf16>
      spirv.Return
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.6, [Shader, Linkage], []> {
    spirv.func @select_op_array(%arg0: i1, %arg1: !spirv.array<4 x i32>, %arg2: !spirv.array<4 x i32>) "None" {
      %0 = spirv.Select %arg0, %arg1, %arg2 : i1, !spirv.array<4 x i32>
      spirv.Return
    }
    spirv.func @select_op_struct(%arg0: i1, %arg1: !spirv.struct<(i32, i32)>, %arg2: !spirv.struct<(i32, i32)>) "None" {
      %0 = spirv.Select %arg0, %arg1, %arg2 : i1, !spirv.struct<(i32, i32)>
      spirv.Return
    }
    spirv.func @select_op_matrix(%arg0: i1, %arg1: !spirv.matrix<4 x vector<3xf32>>, %arg2: !spirv.matrix<4 x vector<3xf32>>) "None" {
      %0 = spirv.Select %arg0, %arg1, %arg2 : i1, !spirv.matrix<4 x vector<3xf32>>
      spirv.Return
    }
  }
}

