"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.GlobalVariable"() <{binding = 1 : i32, descriptor_set = 0 : i32, sym_name = "var01s", type = !spirv.ptr<!spirv.struct<(!spirv.rtarray<f32, stride=4> [0])>, StorageBuffer>}> {aliased} : () -> () loc("<stdin>":3:5)
    "spirv.GlobalVariable"() <{binding = 1 : i32, descriptor_set = 0 : i32, sym_name = "var01v", type = !spirv.ptr<!spirv.struct<(!spirv.rtarray<vector<4xf32>, stride=16> [0])>, StorageBuffer>}> {aliased} : () -> () loc("<stdin>":4:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> f32, sym_name = "load_store_scalar"}> ({
    ^bb0(%arg0: i32 loc("<stdin>":6:10)):
      %0 = "spirv.Constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":7:12)
      %1 = "spirv.mlir.addressof"() <{variable = @var01s}> : () -> !spirv.ptr<!spirv.struct<(!spirv.rtarray<f32, stride=4> [0])>, StorageBuffer> loc("<stdin>":8:12)
      %2 = "spirv.AccessChain"(%1, %0, %arg0) : (!spirv.ptr<!spirv.struct<(!spirv.rtarray<f32, stride=4> [0])>, StorageBuffer>, i32, i32) -> !spirv.ptr<f32, StorageBuffer> loc("<stdin>":9:12)
      %3 = "spirv.Load"(%2) : (!spirv.ptr<f32, StorageBuffer>) -> f32 loc("<stdin>":10:12)
      "spirv.Store"(%2, %3) : (!spirv.ptr<f32, StorageBuffer>, f32) -> () loc("<stdin>":11:7)
      "spirv.ReturnValue"(%3) : (f32) -> () loc("<stdin>":12:7)
    }) : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
