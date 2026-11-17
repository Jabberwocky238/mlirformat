"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.GlobalVariable"() <{binding = 1 : i32, descriptor_set = 0 : i32, sym_name = "var0", type = !spirv.ptr<!spirv.struct<(i32, !spirv.struct<(f32, i32)>, f32)>, Uniform>}> : () -> () loc("<stdin>":3:5)
    "spirv.GlobalVariable"() <{binding = 2 : i32, descriptor_set = 0 : i32, sym_name = "var1", type = !spirv.ptr<!spirv.struct<(!spirv.array<64 x i32>, f32)>, StorageBuffer>}> : () -> () loc("<stdin>":4:5)
    "spirv.GlobalVariable"() <{binding = 0 : i32, descriptor_set = 1 : i32, sym_name = "var2", type = !spirv.ptr<!spirv.struct<(!spirv.struct<(!spirv.array<64 x i32>, f32)>, i32)>, StorageBuffer>}> : () -> () loc("<stdin>":5:5)
    "spirv.GlobalVariable"() <{sym_name = "var3", type = !spirv.ptr<!spirv.struct<(!spirv.array<16 x !spirv.struct<(f32, f32, !spirv.array<16 x f32>)>>, f32)>, StorageBuffer>}> : () -> () loc("<stdin>":6:5)
    "spirv.GlobalVariable"() <{binding = 2 : i32, descriptor_set = 1 : i32, sym_name = "var4", type = !spirv.ptr<!spirv.struct<(!spirv.struct<(!spirv.struct<(i1, i8, i16, i32, i64)>, f32, i1)>, i1)>, StorageBuffer>}> : () -> () loc("<stdin>":7:5)
    "spirv.GlobalVariable"() <{binding = 3 : i32, descriptor_set = 1 : i32, sym_name = "var5", type = !spirv.ptr<!spirv.struct<(!spirv.array<256 x f32>)>, StorageBuffer>}> : () -> () loc("<stdin>":8:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "kernel"}> ({
      %0 = "spirv.Constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":10:12)
      %1 = "spirv.mlir.addressof"() <{variable = @var0}> : () -> !spirv.ptr<!spirv.struct<(i32, !spirv.struct<(f32, i32)>, f32)>, Uniform> loc("<stdin>":11:12)
      %2 = "spirv.AccessChain"(%1, %0) : (!spirv.ptr<!spirv.struct<(i32, !spirv.struct<(f32, i32)>, f32)>, Uniform>, i32) -> !spirv.ptr<i32, Uniform> loc("<stdin>":12:12)
      "spirv.Return"() : () -> () loc("<stdin>":13:7)
    }) : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
