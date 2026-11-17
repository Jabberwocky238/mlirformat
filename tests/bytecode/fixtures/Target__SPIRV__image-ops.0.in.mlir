"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, ImageQuery, Linkage], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.sampled_image<!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Unknown>>, vector<4xf32>, f32) -> (), sym_name = "image"}> ({
    ^bb0(%arg16: !spirv.sampled_image<!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Unknown>> loc("<stdin>":4:10), %arg17: vector<4xf32> loc("<stdin>":4:124), %arg18: f32 loc("<stdin>":4:147)):
      %6 = "spirv.Image"(%arg16) : (!spirv.sampled_image<!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Unknown>>) -> !spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Unknown> loc("<stdin>":5:12)
      %7 = "spirv.ImageDrefGather"(%arg16, %arg17, %arg18) : (!spirv.sampled_image<!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Unknown>>, vector<4xf32>, f32) -> vector<4xf32> loc("<stdin>":6:12)
      "spirv.Return"() : () -> () loc("<stdin>":7:7)
    }) : () -> () loc("<stdin>":3:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Unknown>) -> (), sym_name = "image_query_size"}> ({
    ^bb0(%arg15: !spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Unknown> loc("<stdin>":10:10)):
      %5 = "spirv.ImageQuerySize"(%arg15) : (!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Unknown>) -> vector<2xi32> loc("<stdin>":11:12)
      "spirv.Return"() : () -> () loc("<stdin>":12:7)
    }) : () -> () loc("<stdin>":9:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Rgba8>, vector<2xsi32>) -> (), sym_name = "image_read"}> ({
    ^bb0(%arg13: !spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Rgba8> loc("<stdin>":15:10), %arg14: vector<2xsi32> loc("<stdin>":15:98)):
      %4 = "spirv.ImageRead"(%arg13, %arg14) : (!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Rgba8>, vector<2xsi32>) -> vector<4xf32> loc("<stdin>":16:12)
      "spirv.Return"() : () -> () loc("<stdin>":17:7)
    }) : () -> () loc("<stdin>":14:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Rgba8>, vector<2xsi32>, vector<4xf32>) -> (), sym_name = "image_write"}> ({
    ^bb0(%arg10: !spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Rgba8> loc("<stdin>":20:10), %arg11: vector<2xsi32> loc("<stdin>":20:98), %arg12: vector<4xf32> loc("<stdin>":20:122)):
      "spirv.ImageWrite"(%arg10, %arg11, %arg12) : (!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Rgba8>, vector<2xsi32>, vector<4xf32>) -> () loc("<stdin>":21:7)
      "spirv.Return"() : () -> () loc("<stdin>":22:7)
    }) : () -> () loc("<stdin>":19:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.sampled_image<!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Rgba8>>, vector<2xf32>, f32) -> (), sym_name = "explicit_sample"}> ({
    ^bb0(%arg7: !spirv.sampled_image<!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Rgba8>> loc("<stdin>":25:10), %arg8: vector<2xf32> loc("<stdin>":25:121), %arg9: f32 loc("<stdin>":25:143)):
      %3 = "spirv.ImageSampleExplicitLod"(%arg7, %arg8, %arg9) <{image_operands = #spirv.image_operands<Lod>}> : (!spirv.sampled_image<!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Rgba8>>, vector<2xf32>, f32) -> vector<4xf32> loc("<stdin>":26:12)
      "spirv.Return"() : () -> () loc("<stdin>":27:7)
    }) : () -> () loc("<stdin>":24:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.sampled_image<!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Rgba8>>, vector<3xf32>) -> (), sym_name = "implicit_sample"}> ({
    ^bb0(%arg5: !spirv.sampled_image<!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Rgba8>> loc("<stdin>":30:10), %arg6: vector<3xf32> loc("<stdin>":30:121)):
      %2 = "spirv.ImageSampleImplicitLod"(%arg5, %arg6) : (!spirv.sampled_image<!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Rgba8>>, vector<3xf32>) -> vector<4xf32> loc("<stdin>":31:12)
      "spirv.Return"() : () -> () loc("<stdin>":32:7)
    }) : () -> () loc("<stdin>":29:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.sampled_image<!spirv.image<f32, Dim2D, IsDepth, NonArrayed, SingleSampled, NeedSampler, Rgba8>>, vector<4xf32>, f32) -> (), sym_name = "implicit_sample_proj_dref"}> ({
    ^bb0(%arg2: !spirv.sampled_image<!spirv.image<f32, Dim2D, IsDepth, NonArrayed, SingleSampled, NeedSampler, Rgba8>> loc("<stdin>":35:10), %arg3: vector<4xf32> loc("<stdin>":35:121), %arg4: f32 loc("<stdin>":35:143)):
      %1 = "spirv.ImageSampleProjDrefImplicitLod"(%arg2, %arg3, %arg4) : (!spirv.sampled_image<!spirv.image<f32, Dim2D, IsDepth, NonArrayed, SingleSampled, NeedSampler, Rgba8>>, vector<4xf32>, f32) -> f32 loc("<stdin>":36:12)
      "spirv.Return"() : () -> () loc("<stdin>":37:7)
    }) : () -> () loc("<stdin>":34:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Unknown>, vector<2xsi32>) -> (), sym_name = "image_fetch"}> ({
    ^bb0(%arg0: !spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Unknown> loc("<stdin>":40:10), %arg1: vector<2xsi32> loc("<stdin>":40:101)):
      %0 = "spirv.ImageFetch"(%arg0, %arg1) : (!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Unknown>, vector<2xsi32>) -> vector<4xf32> loc("<stdin>":41:12)
      "spirv.Return"() : () -> () loc("<stdin>":42:7)
    }) : () -> () loc("<stdin>":39:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
