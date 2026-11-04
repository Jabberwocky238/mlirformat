module {
  func.func @image_dref_gather(%arg0: !spirv.sampled_image<!spirv.image<i32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Unknown>>, %arg1: vector<4xf32>, %arg2: f32) {
    %0 = spirv.ImageDrefGather %arg0, %arg1, %arg2  : !spirv.sampled_image<!spirv.image<i32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Unknown>>, vector<4xf32>, f32 -> vector<4xi32>
    spirv.Return
  }
}

// -----
module {
  func.func @image_dref_gather_with_single_imageoperands(%arg0: !spirv.sampled_image<!spirv.image<i32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Unknown>>, %arg1: vector<4xf32>, %arg2: f32) {
    %0 = spirv.ImageDrefGather %arg0, %arg1, %arg2 ["NonPrivateTexel"] : !spirv.sampled_image<!spirv.image<i32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Unknown>>, vector<4xf32>, f32 -> vector<4xi32>
    spirv.Return
  }
}

// -----
// -----
// -----
// -----
// -----
// -----
module {
  func.func @image(%arg0: !spirv.sampled_image<!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Unknown>>) {
    %0 = spirv.Image %arg0 : !spirv.sampled_image<!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Unknown>>
    return
  }
}

// -----
module {
  func.func @image_query_size(%arg0: !spirv.image<f32, Dim1D, NoDepth, NonArrayed, SingleSampled, NoSampler, Unknown>) {
    %0 = spirv.ImageQuerySize %arg0 : !spirv.image<f32, Dim1D, NoDepth, NonArrayed, SingleSampled, NoSampler, Unknown> -> i32
    spirv.Return
  }
}

// -----
// -----
// -----
// -----
// -----
module {
  func.func @image_read(%arg0: !spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Rgba8>, %arg1: vector<2xsi32>) {
    %0 = spirv.ImageRead %arg0, %arg1  : !spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Rgba8>, vector<2xsi32> -> vector<4xf32>
    spirv.Return
  }
}

// -----
// -----
// -----
module {
  func.func @image_write(%arg0: !spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Rgba16>, %arg1: vector<2xsi32>, %arg2: vector<4xf32>) {
    spirv.ImageWrite %arg0, %arg1, %arg2  : !spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Rgba16>, vector<2xsi32>, vector<4xf32>
    spirv.Return
  }
}

// -----
module {
  func.func @image_write_scalar_texel(%arg0: !spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Rgba16>, %arg1: vector<2xsi32>, %arg2: f32) {
    spirv.ImageWrite %arg0, %arg1, %arg2  : !spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Rgba16>, vector<2xsi32>, f32
    spirv.Return
  }
}

// -----
// -----
// -----
// -----
module {
  func.func @sample_explicit_lod(%arg0: !spirv.sampled_image<!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Rgba8>>, %arg1: vector<2xf32>, %arg2: f32) {
    %0 = spirv.ImageSampleExplicitLod %arg0, %arg1 ["Lod"], %arg2 : !spirv.sampled_image<!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Rgba8>>, vector<2xf32>, f32 -> vector<4xf32>
    spirv.Return
  }
}

// -----
// -----
// -----
// -----
module {
  func.func @sample_implicit_lod(%arg0: !spirv.sampled_image<!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Rgba8>>, %arg1: vector<2xf32>) {
    %0 = spirv.ImageSampleImplicitLod %arg0, %arg1  : !spirv.sampled_image<!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Rgba8>>, vector<2xf32> -> vector<4xf32>
    spirv.Return
  }
}

// -----
// -----
// -----
module {
  func.func @sample_implicit_proj_dref(%arg0: !spirv.sampled_image<!spirv.image<f32, Dim2D, IsDepth, NonArrayed, SingleSampled, NeedSampler, Rgba8>>, %arg1: vector<4xf32>, %arg2: f32) {
    %0 = spirv.ImageSampleProjDrefImplicitLod %arg0, %arg1, %arg2  : !spirv.sampled_image<!spirv.image<f32, Dim2D, IsDepth, NonArrayed, SingleSampled, NeedSampler, Rgba8>>, vector<4xf32>, f32 -> f32
    spirv.Return
  }
}

// -----
// -----
// -----
module {
  func.func @image_fetch(%arg0: !spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Rgba8>, %arg1: vector<2xsi32>) {
    %0 = spirv.ImageFetch %arg0, %arg1  : !spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Rgba8>, vector<2xsi32> -> vector<4xf32>
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
// -----
// -----
// -----
// -----
// -----
// -----
