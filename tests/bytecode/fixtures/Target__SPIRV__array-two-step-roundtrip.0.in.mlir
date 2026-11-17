"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage], [SPV_KHR_storage_buffer_storage_class]>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<!spirv.array<4 x !spirv.array<4 x f32, stride=4>, stride=128>, StorageBuffer>, i32, i32) -> (), sym_name = "array_stride"}> ({
    ^bb0(%arg0: !spirv.ptr<!spirv.array<4 x !spirv.array<4 x f32, stride=4>, stride=128>, StorageBuffer> loc("<stdin>":4:10), %arg1: i32 loc("<stdin>":4:107), %arg2: i32 loc("<stdin>":4:119)):
      %0 = "spirv.AccessChain"(%arg0, %arg1, %arg2) : (!spirv.ptr<!spirv.array<4 x !spirv.array<4 x f32, stride=4>, stride=128>, StorageBuffer>, i32, i32) -> !spirv.ptr<f32, StorageBuffer> loc("<stdin>":5:12)
      "spirv.Return"() : () -> () loc("<stdin>":6:7)
    }) : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
