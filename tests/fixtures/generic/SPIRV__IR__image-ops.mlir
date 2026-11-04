"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.sampled_image<!spirv.image<i32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Unknown>>, vector<4xf32>, f32) -> (), sym_name = "image_dref_gather"}> ({
  ^bb0(%arg0: !spirv.sampled_image<!spirv.image<i32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Unknown>>, %arg1: vector<4xf32>, %arg2: f32):
    %0 = "spirv.ImageDrefGather"(%arg0, %arg1, %arg2) : (!spirv.sampled_image<!spirv.image<i32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Unknown>>, vector<4xf32>, f32) -> vector<4xi32>
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.sampled_image<!spirv.image<i32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Unknown>>, vector<4xf32>, f32) -> (), sym_name = "image_dref_gather_with_single_imageoperands"}> ({
  ^bb0(%arg0: !spirv.sampled_image<!spirv.image<i32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Unknown>>, %arg1: vector<4xf32>, %arg2: f32):
    %0 = "spirv.ImageDrefGather"(%arg0, %arg1, %arg2) <{image_operands = #spirv.image_operands<NonPrivateTexel>}> : (!spirv.sampled_image<!spirv.image<i32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Unknown>>, vector<4xf32>, f32) -> vector<4xi32>
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.sampled_image<!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Unknown>>) -> (), sym_name = "image"}> ({
  ^bb0(%arg0: !spirv.sampled_image<!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Unknown>>):
    %0 = "spirv.Image"(%arg0) : (!spirv.sampled_image<!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Unknown>>) -> !spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Unknown>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.image<f32, Dim1D, NoDepth, NonArrayed, SingleSampled, NoSampler, Unknown>) -> (), sym_name = "image_query_size"}> ({
  ^bb0(%arg0: !spirv.image<f32, Dim1D, NoDepth, NonArrayed, SingleSampled, NoSampler, Unknown>):
    %0 = "spirv.ImageQuerySize"(%arg0) : (!spirv.image<f32, Dim1D, NoDepth, NonArrayed, SingleSampled, NoSampler, Unknown>) -> i32
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Rgba8>, vector<2xsi32>) -> (), sym_name = "image_read"}> ({
  ^bb0(%arg0: !spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Rgba8>, %arg1: vector<2xsi32>):
    %0 = "spirv.ImageRead"(%arg0, %arg1) : (!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Rgba8>, vector<2xsi32>) -> vector<4xf32>
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Rgba16>, vector<2xsi32>, vector<4xf32>) -> (), sym_name = "image_write"}> ({
  ^bb0(%arg0: !spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Rgba16>, %arg1: vector<2xsi32>, %arg2: vector<4xf32>):
    "spirv.ImageWrite"(%arg0, %arg1, %arg2) : (!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Rgba16>, vector<2xsi32>, vector<4xf32>) -> ()
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Rgba16>, vector<2xsi32>, f32) -> (), sym_name = "image_write_scalar_texel"}> ({
  ^bb0(%arg0: !spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Rgba16>, %arg1: vector<2xsi32>, %arg2: f32):
    "spirv.ImageWrite"(%arg0, %arg1, %arg2) : (!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Rgba16>, vector<2xsi32>, f32) -> ()
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.sampled_image<!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Rgba8>>, vector<2xf32>, f32) -> (), sym_name = "sample_explicit_lod"}> ({
  ^bb0(%arg0: !spirv.sampled_image<!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Rgba8>>, %arg1: vector<2xf32>, %arg2: f32):
    %0 = "spirv.ImageSampleExplicitLod"(%arg0, %arg1, %arg2) <{image_operands = #spirv.image_operands<Lod>}> : (!spirv.sampled_image<!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Rgba8>>, vector<2xf32>, f32) -> vector<4xf32>
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.sampled_image<!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Rgba8>>, vector<2xf32>) -> (), sym_name = "sample_implicit_lod"}> ({
  ^bb0(%arg0: !spirv.sampled_image<!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Rgba8>>, %arg1: vector<2xf32>):
    %0 = "spirv.ImageSampleImplicitLod"(%arg0, %arg1) : (!spirv.sampled_image<!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Rgba8>>, vector<2xf32>) -> vector<4xf32>
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.sampled_image<!spirv.image<f32, Dim2D, IsDepth, NonArrayed, SingleSampled, NeedSampler, Rgba8>>, vector<4xf32>, f32) -> (), sym_name = "sample_implicit_proj_dref"}> ({
  ^bb0(%arg0: !spirv.sampled_image<!spirv.image<f32, Dim2D, IsDepth, NonArrayed, SingleSampled, NeedSampler, Rgba8>>, %arg1: vector<4xf32>, %arg2: f32):
    %0 = "spirv.ImageSampleProjDrefImplicitLod"(%arg0, %arg1, %arg2) : (!spirv.sampled_image<!spirv.image<f32, Dim2D, IsDepth, NonArrayed, SingleSampled, NeedSampler, Rgba8>>, vector<4xf32>, f32) -> f32
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Rgba8>, vector<2xsi32>) -> (), sym_name = "image_fetch"}> ({
  ^bb0(%arg0: !spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Rgba8>, %arg1: vector<2xsi32>):
    %0 = "spirv.ImageFetch"(%arg0, %arg1) : (!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Rgba8>, vector<2xsi32>) -> vector<4xf32>
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
// -----
// -----
// -----
// -----
// -----
// -----
