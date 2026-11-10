module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage, Bfloat16ConversionINTEL, Int16], [SPV_INTEL_bfloat16_conversion]> {
    spirv.func @f32_to_bf16(%arg0: f32) "None" {
      %0 = spirv.INTEL.ConvertFToBF16 %arg0 : f32 to i16
      spirv.Return
    }
    spirv.func @f32_to_bf16_vec(%arg0: vector<2xf32>) "None" {
      %0 = spirv.INTEL.ConvertFToBF16 %arg0 : vector<2xf32> to vector<2xi16>
      spirv.Return
    }
    spirv.func @bf16_to_f32(%arg0: i16) "None" {
      %0 = spirv.INTEL.ConvertBF16ToF %arg0 : i16 to f32
      spirv.Return
    }
    spirv.func @bf16_to_f32_vec(%arg0: vector<2xi16>) "None" {
      %0 = spirv.INTEL.ConvertBF16ToF %arg0 : vector<2xi16> to vector<2xf32>
      spirv.Return
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage, TensorFloat32RoundingINTEL], [SPV_INTEL_tensor_float32_conversion]> {
    spirv.func @f32_to_tf32(%arg0: f32) "None" {
      %0 = spirv.INTEL.RoundFToTF32 %arg0 : f32 to f32
      spirv.Return
    }
    spirv.func @f32_to_tf32_vec(%arg0: vector<2xf32>) "None" {
      %0 = spirv.INTEL.RoundFToTF32 %arg0 : vector<2xf32> to vector<2xf32>
      spirv.Return
    }
  }
}

// -----
module {
  spirv.module Physical64 OpenCL requires #spirv.vce<v1.0, [Kernel, Addresses, Linkage, MaskedGatherScatterINTEL], [SPV_INTEL_masked_gather_scatter]> {
    spirv.func @masked_gather_f32(%arg0: vector<4x!spirv.ptr<f32, CrossWorkgroup>>, %arg1: i32, %arg2: vector<4xi1>, %arg3: vector<4xf32>) "None" {
      %0 = spirv.INTEL.MaskedGather %arg0, %arg1, %arg2, %arg3 : vector<4x!spirv.ptr<f32, CrossWorkgroup>>, i32, vector<4xi1>, vector<4xf32> -> vector<4xf32>
      spirv.Return
    }
    spirv.func @masked_gather_i32(%arg0: vector<4x!spirv.ptr<i32, CrossWorkgroup>>, %arg1: i32, %arg2: vector<4xi1>, %arg3: vector<4xi32>) "None" {
      %0 = spirv.INTEL.MaskedGather %arg0, %arg1, %arg2, %arg3 : vector<4x!spirv.ptr<i32, CrossWorkgroup>>, i32, vector<4xi1>, vector<4xi32> -> vector<4xi32>
      spirv.Return
    }
    spirv.func @masked_scatter_f32(%arg0: vector<4x!spirv.ptr<f32, CrossWorkgroup>>, %arg1: i32, %arg2: vector<4xi1>, %arg3: vector<4xf32>) "None" {
      spirv.INTEL.MaskedScatter %arg0, %arg1, %arg2, %arg3 : vector<4x!spirv.ptr<f32, CrossWorkgroup>>, i32, vector<4xi1>, vector<4xf32>
      spirv.Return
    }
    spirv.func @masked_scatter_i32(%arg0: vector<4x!spirv.ptr<i32, CrossWorkgroup>>, %arg1: i32, %arg2: vector<4xi1>, %arg3: vector<4xi32>) "None" {
      spirv.INTEL.MaskedScatter %arg0, %arg1, %arg2, %arg3 : vector<4x!spirv.ptr<i32, CrossWorkgroup>>, i32, vector<4xi1>, vector<4xi32>
      spirv.Return
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage, SplitBarrierINTEL], [SPV_INTEL_split_barrier]> {
    spirv.func @split_barrier() "None" {
      spirv.INTEL.ControlBarrierArrive <Workgroup> <Device> <Acquire|UniformMemory>
      spirv.INTEL.ControlBarrierWait <Workgroup> <Device> <Acquire|UniformMemory>
      spirv.Return
    }
  }
}

