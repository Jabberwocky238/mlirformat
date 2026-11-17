"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.GlobalVariable"() <{sym_name = "var1", type = !spirv.ptr<!spirv.struct<(f32, !spirv.array<4 x f32>)>, Input>}> : () -> () loc("<stdin>":3:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "access_chain"}> ({
      %0 = "spirv.Constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":5:12)
      %1 = "spirv.mlir.addressof"() <{variable = @var1}> : () -> !spirv.ptr<!spirv.struct<(f32, !spirv.array<4 x f32>)>, Input> loc("<stdin>":6:12)
      %2 = "spirv.AccessChain"(%1, %0, %0) : (!spirv.ptr<!spirv.struct<(f32, !spirv.array<4 x f32>)>, Input>, i32, i32) -> !spirv.ptr<f32, Input> loc("<stdin>":7:12)
      "spirv.Return"() : () -> () loc("<stdin>":8:7)
    }) : () -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
