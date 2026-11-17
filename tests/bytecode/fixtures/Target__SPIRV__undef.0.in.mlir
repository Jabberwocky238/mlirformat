"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage], [SPV_KHR_storage_buffer_storage_class]>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "foo"}> ({
      %0 = "spirv.Undef"() : () -> f32 loc("<stdin>":4:12)
      %1 = "spirv.Undef"() : () -> f32 loc("<stdin>":5:12)
      %2 = "spirv.FAdd"(%0, %1) : (f32, f32) -> f32 loc("<stdin>":6:12)
      %3 = "spirv.Undef"() : () -> vector<4xi32> loc("<stdin>":7:12)
      %4 = "spirv.CompositeExtract"(%3) <{indices = [1 : i32]}> : (vector<4xi32>) -> i32 loc("<stdin>":8:12)
      %5 = "spirv.Undef"() : () -> !spirv.array<4 x !spirv.array<4 x i32>> loc("<stdin>":9:12)
      %6 = "spirv.CompositeExtract"(%5) <{indices = [1 : i32, 2 : i32]}> : (!spirv.array<4 x !spirv.array<4 x i32>>) -> i32 loc("<stdin>":10:12)
      %7 = "spirv.Undef"() : () -> !spirv.ptr<!spirv.struct<(f32), Block>, StorageBuffer> loc("<stdin>":11:12)
      %8 = "spirv.Constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":12:12)
      %9 = "spirv.AccessChain"(%7, %8) : (!spirv.ptr<!spirv.struct<(f32), Block>, StorageBuffer>, i32) -> !spirv.ptr<f32, StorageBuffer> loc("<stdin>":13:12)
      "spirv.Return"() : () -> () loc("<stdin>":14:7)
    }) : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
