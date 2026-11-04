module {
  spirv.module Logical Vulkan requires #spirv.vce<v1.3, [VulkanMemoryModel, Shader, TensorsARM, Linkage], [SPV_KHR_vulkan_memory_model, SPV_ARM_tensors]> {
    spirv.func @rank_1_arm_tensor_of_i32() -> !spirv.arm.tensor<3xi32> "None" {
      %cst = spirv.Constant dense<[1, 2, 3]> : !spirv.arm.tensor<3xi32>
      spirv.ReturnValue %cst : !spirv.arm.tensor<3xi32>
    }
    spirv.func @rank_2_arm_tensor_of_i32() -> !spirv.arm.tensor<2x3xi32> "None" {
      %cst = spirv.Constant dense<[[1, 2, 3], [4, 5, 6]]> : !spirv.arm.tensor<2x3xi32>
      spirv.ReturnValue %cst : !spirv.arm.tensor<2x3xi32>
    }
    spirv.func @rank_3_arm_tensor_of_i32() -> !spirv.arm.tensor<2x2x3xi32> "None" {
      %cst = spirv.Constant dense<[[[1, 2, 3], [4, 5, 6]], [[7, 8, 9], [10, 11, 12]]]> : !spirv.arm.tensor<2x2x3xi32>
      spirv.ReturnValue %cst : !spirv.arm.tensor<2x2x3xi32>
    }
    spirv.func @rank_4_arm_tensor_of_i32() -> !spirv.arm.tensor<2x3x4x5xi32> "None" {
      %cst = spirv.Constant dense<5> : !spirv.arm.tensor<2x3x4x5xi32>
      spirv.ReturnValue %cst : !spirv.arm.tensor<2x3x4x5xi32>
    }
    spirv.func @splat_arm_tensor_of_i32() -> !spirv.arm.tensor<2x3xi32> "None" {
      %cst = spirv.Constant dense<2> : !spirv.arm.tensor<2x3xi32>
      spirv.ReturnValue %cst : !spirv.arm.tensor<2x3xi32>
    }
    spirv.func @rank_1_arm_tensor_of_f32() -> !spirv.arm.tensor<3xf32> "None" {
      %cst = spirv.Constant dense<[1.000000e+00, 2.000000e+00, 3.000000e+00]> : !spirv.arm.tensor<3xf32>
      spirv.ReturnValue %cst : !spirv.arm.tensor<3xf32>
    }
    spirv.func @rank_2_arm_tensor_of_f32() -> !spirv.arm.tensor<2x3xf32> "None" {
      %cst = spirv.Constant dense<[[1.000000e+00, 2.000000e+00, 3.000000e+00], [4.000000e+00, 5.000000e+00, 6.000000e+00]]> : !spirv.arm.tensor<2x3xf32>
      spirv.ReturnValue %cst : !spirv.arm.tensor<2x3xf32>
    }
    spirv.func @rank_3_arm_tensor_of_f32() -> !spirv.arm.tensor<2x2x3xf32> "None" {
      %cst = spirv.Constant dense<[[[1.000000e+00, 2.000000e+00, 3.000000e+00], [4.000000e+00, 5.000000e+00, 6.000000e+00]], [[7.000000e+00, 8.000000e+00, 9.000000e+00], [1.000000e+01, 1.100000e+01, 1.200000e+01]]]> : !spirv.arm.tensor<2x2x3xf32>
      spirv.ReturnValue %cst : !spirv.arm.tensor<2x2x3xf32>
    }
    spirv.func @rank_4_arm_tensor_of_f32() -> !spirv.arm.tensor<2x3x4x5xf32> "None" {
      %cst = spirv.Constant dense<5.000000e+00> : !spirv.arm.tensor<2x3x4x5xf32>
      spirv.ReturnValue %cst : !spirv.arm.tensor<2x3x4x5xf32>
    }
    spirv.func @splat_arm_tensor_of_f32() -> !spirv.arm.tensor<2x3xf32> "None" {
      %cst = spirv.Constant dense<2.000000e+00> : !spirv.arm.tensor<2x3xf32>
      spirv.ReturnValue %cst : !spirv.arm.tensor<2x3xf32>
    }
    spirv.func @null_arm_tensor_of_i32() -> !spirv.arm.tensor<2x3xi32> "None" {
      %cst = spirv.Constant dense<0> : !spirv.arm.tensor<2x3xi32>
      spirv.ReturnValue %cst : !spirv.arm.tensor<2x3xi32>
    }
    spirv.func @null_arm_tensor_of_f32() -> !spirv.arm.tensor<2x3xf32> "None" {
      %cst = spirv.Constant dense<0.000000e+00> : !spirv.arm.tensor<2x3xf32>
      spirv.ReturnValue %cst : !spirv.arm.tensor<2x3xf32>
    }
  }
}

