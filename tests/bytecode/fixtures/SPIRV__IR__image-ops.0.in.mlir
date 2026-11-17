"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.sampled_image<!spirv.image<i32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Unknown>>, vector<4xf32>, f32) -> (), sym_name = "image_dref_gather"}> ({
  ^bb0(%arg0: !spirv.sampled_image<!spirv.image<i32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Unknown>> loc("<stdin>":3:8), %arg1: vector<4xf32> loc("<stdin>":3:119), %arg2: f32 loc("<stdin>":3:141)):
    %0 = "spirv.ImageDrefGather"(%arg0, %arg1, %arg2) : (!spirv.sampled_image<!spirv.image<i32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Unknown>>, vector<4xf32>, f32) -> vector<4xi32> loc("<stdin>":4:10)
    "spirv.Return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
