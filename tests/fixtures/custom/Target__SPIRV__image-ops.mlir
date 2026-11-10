module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, ImageQuery, Linkage], []> {
    spirv.func @image(%arg0: !spirv.sampled_image<!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Unknown>>, %arg1: vector<4xf32>, %arg2: f32) "None" {
      %0 = spirv.Image %arg0 : !spirv.sampled_image<!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Unknown>>
      %1 = spirv.ImageDrefGather %arg0, %arg1, %arg2  : !spirv.sampled_image<!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Unknown>>, vector<4xf32>, f32 -> vector<4xf32>
      spirv.Return
    }
    spirv.func @image_query_size(%arg0: !spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Unknown>) "None" {
      %0 = spirv.ImageQuerySize %arg0 : !spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Unknown> -> vector<2xi32>
      spirv.Return
    }
    spirv.func @image_read(%arg0: !spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Rgba8>, %arg1: vector<2xsi32>) "None" {
      %0 = spirv.ImageRead %arg0, %arg1  : !spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Rgba8>, vector<2xsi32> -> vector<4xf32>
      spirv.Return
    }
    spirv.func @image_write(%arg0: !spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Rgba8>, %arg1: vector<2xsi32>, %arg2: vector<4xf32>) "None" {
      spirv.ImageWrite %arg0, %arg1, %arg2  : !spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Rgba8>, vector<2xsi32>, vector<4xf32>
      spirv.Return
    }
    spirv.func @explicit_sample(%arg0: !spirv.sampled_image<!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Rgba8>>, %arg1: vector<2xf32>, %arg2: f32) "None" {
      %0 = spirv.ImageSampleExplicitLod %arg0, %arg1 ["Lod"], %arg2 : !spirv.sampled_image<!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Rgba8>>, vector<2xf32>, f32 -> vector<4xf32>
      spirv.Return
    }
    spirv.func @implicit_sample(%arg0: !spirv.sampled_image<!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Rgba8>>, %arg1: vector<3xf32>) "None" {
      %0 = spirv.ImageSampleImplicitLod %arg0, %arg1  : !spirv.sampled_image<!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Rgba8>>, vector<3xf32> -> vector<4xf32>
      spirv.Return
    }
    spirv.func @implicit_sample_proj_dref(%arg0: !spirv.sampled_image<!spirv.image<f32, Dim2D, IsDepth, NonArrayed, SingleSampled, NeedSampler, Rgba8>>, %arg1: vector<4xf32>, %arg2: f32) "None" {
      %0 = spirv.ImageSampleProjDrefImplicitLod %arg0, %arg1, %arg2  : !spirv.sampled_image<!spirv.image<f32, Dim2D, IsDepth, NonArrayed, SingleSampled, NeedSampler, Rgba8>>, vector<4xf32>, f32 -> f32
      spirv.Return
    }
    spirv.func @image_fetch(%arg0: !spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Unknown>, %arg1: vector<2xsi32>) "None" {
      %0 = spirv.ImageFetch %arg0, %arg1  : !spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Unknown>, vector<2xsi32> -> vector<4xf32>
      spirv.Return
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, StorageImageWriteWithoutFormat, StorageImageReadWithoutFormat, Linkage], []> {
    spirv.func @image_read_write(%arg0: !spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Unknown>, %arg1: vector<2xsi32>) "None" {
      %0 = spirv.ImageRead %arg0, %arg1  : !spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Unknown>, vector<2xsi32> -> vector<4xf32>
      spirv.ImageWrite %arg0, %arg1, %0  : !spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Unknown>, vector<2xsi32>, vector<4xf32>
      spirv.Return
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage], []> {
    spirv.func @sampled_image(%arg0: !spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Unknown>, %arg1: !spirv.sampler) "None" {
      %0 = spirv.SampledImage %arg0, %arg1 : !spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Unknown>, !spirv.sampler -> !spirv.sampled_image<!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Unknown>>
      spirv.Return
    }
  }
}

