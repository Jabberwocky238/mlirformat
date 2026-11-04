module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, ReplicatedCompositesEXT, TensorsARM, Linkage], [SPV_EXT_replicated_composites, SPV_ARM_tensors]> {
    spirv.func @splat_vector_i32() -> vector<3xi32> "None" {
      %0 = spirv.EXT.ConstantCompositeReplicate [1 : i32] : vector<3xi32>
      spirv.ReturnValue %0 : vector<3xi32>
    }
    spirv.func @splat_array_of_i32() -> !spirv.array<3 x i32> "None" {
      %0 = spirv.EXT.ConstantCompositeReplicate [1 : i32] : !spirv.array<3 x i32>
      spirv.ReturnValue %0 : !spirv.array<3 x i32>
    }
    spirv.func @splat_array_of_vectors_of_i32() -> !spirv.array<3 x vector<2xi32>> "None" {
      %0 = spirv.EXT.ConstantCompositeReplicate [dense<[1, 2]> : vector<2xi32>] : !spirv.array<3 x vector<2xi32>>
      spirv.ReturnValue %0 : !spirv.array<3 x vector<2xi32>>
    }
    spirv.func @splat_array_of_splat_array_of_i32() -> !spirv.array<2 x !spirv.array<3 x i32>> "None" {
      %0 = spirv.EXT.ConstantCompositeReplicate [3 : i32] : !spirv.array<2 x !spirv.array<3 x i32>>
      spirv.ReturnValue %0 : !spirv.array<2 x !spirv.array<3 x i32>>
    }
    spirv.func @splat_array_of_non_splat_array_of_i32() -> !spirv.array<2 x !spirv.array<3 x i32>> "None" {
      %0 = spirv.EXT.ConstantCompositeReplicate [[1 : i32, 2 : i32, 3 : i32]] : !spirv.array<2 x !spirv.array<3 x i32>>
      spirv.ReturnValue %0 : !spirv.array<2 x !spirv.array<3 x i32>>
    }
    spirv.func @splat_array_of_splat_vectors_of_i32() -> !spirv.array<2 x vector<2xi32>> "None" {
      %0 = spirv.EXT.ConstantCompositeReplicate [2 : i32] : !spirv.array<2 x vector<2xi32>>
      spirv.ReturnValue %0 : !spirv.array<2 x vector<2xi32>>
    }
    spirv.func @splat_arm_tensor_of_i32() -> !spirv.arm.tensor<2x3xi32> "None" {
      %0 = spirv.EXT.ConstantCompositeReplicate [2 : i32] : !spirv.arm.tensor<2x3xi32>
      spirv.ReturnValue %0 : !spirv.arm.tensor<2x3xi32>
    }
    spirv.func @splat_array_of_non_splat_array_of_arrays_of_i32() -> !spirv.array<2 x !spirv.array<2 x !spirv.array<3 x i32>>> "None" {
      %0 = spirv.EXT.ConstantCompositeReplicate [[[1 : i32, 2 : i32, 3 : i32], [4 : i32, 5 : i32, 6 : i32]]] : !spirv.array<2 x !spirv.array<2 x !spirv.array<3 x i32>>>
      spirv.ReturnValue %0 : !spirv.array<2 x !spirv.array<2 x !spirv.array<3 x i32>>>
    }
    spirv.func @null_cc_arm_tensor_of_i32() -> !spirv.arm.tensor<2x3xi32> "None" {
      %0 = spirv.EXT.ConstantCompositeReplicate [0 : i32] : !spirv.arm.tensor<2x3xi32>
      spirv.ReturnValue %0 : !spirv.arm.tensor<2x3xi32>
    }
    spirv.func @splat_vector_f32() -> vector<3xf32> "None" {
      %0 = spirv.EXT.ConstantCompositeReplicate [1.000000e+00 : f32] : vector<3xf32>
      spirv.ReturnValue %0 : vector<3xf32>
    }
    spirv.func @splat_array_of_f32() -> !spirv.array<3 x f32> "None" {
      %0 = spirv.EXT.ConstantCompositeReplicate [1.000000e+00 : f32] : !spirv.array<3 x f32>
      spirv.ReturnValue %0 : !spirv.array<3 x f32>
    }
    spirv.func @splat_array_of_splat_array_of_f32() -> !spirv.array<2 x !spirv.array<3 x f32>> "None" {
      %0 = spirv.EXT.ConstantCompositeReplicate [3.000000e+00 : f32] : !spirv.array<2 x !spirv.array<3 x f32>>
      spirv.ReturnValue %0 : !spirv.array<2 x !spirv.array<3 x f32>>
    }
    spirv.func @splat_array_of_non_splat_array_of_f32() -> !spirv.array<2 x !spirv.array<3 x f32>> "None" {
      %0 = spirv.EXT.ConstantCompositeReplicate [[1.000000e+00 : f32, 2.000000e+00 : f32, 3.000000e+00 : f32]] : !spirv.array<2 x !spirv.array<3 x f32>>
      spirv.ReturnValue %0 : !spirv.array<2 x !spirv.array<3 x f32>>
    }
    spirv.func @splat_array_of_vectors_of_f32() -> !spirv.array<3 x vector<2xf32>> "None" {
      %0 = spirv.EXT.ConstantCompositeReplicate [dense<[1.000000e+00, 2.000000e+00]> : vector<2xf32>] : !spirv.array<3 x vector<2xf32>>
      spirv.ReturnValue %0 : !spirv.array<3 x vector<2xf32>>
    }
    spirv.func @splat_array_of_splat_vectors_of_f32() -> !spirv.array<2 x vector<2xf32>> "None" {
      %0 = spirv.EXT.ConstantCompositeReplicate [2.000000e+00 : f32] : !spirv.array<2 x vector<2xf32>>
      spirv.ReturnValue %0 : !spirv.array<2 x vector<2xf32>>
    }
    spirv.func @splat_arm_tensor_of_f32() -> !spirv.arm.tensor<2x3xf32> "None" {
      %0 = spirv.EXT.ConstantCompositeReplicate [2.000000e+00 : f32] : !spirv.arm.tensor<2x3xf32>
      spirv.ReturnValue %0 : !spirv.arm.tensor<2x3xf32>
    }
    spirv.func @splat_array_of_non_splat_array_of_arrays_of_f32() -> !spirv.array<2 x !spirv.array<2 x !spirv.array<3 x f32>>> "None" {
      %0 = spirv.EXT.ConstantCompositeReplicate [[[1.000000e+00 : f32, 2.000000e+00 : f32, 3.000000e+00 : f32], [4.000000e+00 : f32, 5.000000e+00 : f32, 6.000000e+00 : f32]]] : !spirv.array<2 x !spirv.array<2 x !spirv.array<3 x f32>>>
      spirv.ReturnValue %0 : !spirv.array<2 x !spirv.array<2 x !spirv.array<3 x f32>>>
    }
    spirv.func @null_cc_arm_tensor_of_f32() -> !spirv.arm.tensor<2x3xf32> "None" {
      %0 = spirv.EXT.ConstantCompositeReplicate [0.000000e+00 : f32] : !spirv.arm.tensor<2x3xf32>
      spirv.ReturnValue %0 : !spirv.arm.tensor<2x3xf32>
    }
  }
}

