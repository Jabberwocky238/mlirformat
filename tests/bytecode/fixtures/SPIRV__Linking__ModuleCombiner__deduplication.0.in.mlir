"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.GlobalVariable"() <{binding = 0 : i32, descriptor_set = 1 : i32, sym_name = "foo", type = !spirv.ptr<f32, Input>}> : () -> () loc("<stdin>":3:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> f32, sym_name = "use_foo"}> ({
      %3 = "spirv.mlir.addressof"() <{variable = @foo}> : () -> !spirv.ptr<f32, Input> loc("<stdin>":5:12)
      %4 = "spirv.Load"(%3) : (!spirv.ptr<f32, Input>) -> f32 loc("<stdin>":6:12)
      "spirv.ReturnValue"(%4) : (f32) -> () loc("<stdin>":7:7)
    }) : () -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.GlobalVariable"() <{binding = 0 : i32, descriptor_set = 1 : i32, sym_name = "bar", type = !spirv.ptr<f32, Input>}> : () -> () loc("<stdin>":11:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> f32, sym_name = "use_bar"}> ({
      %0 = "spirv.mlir.addressof"() <{variable = @bar}> : () -> !spirv.ptr<f32, Input> loc("<stdin>":13:12)
      %1 = "spirv.Load"(%0) : (!spirv.ptr<f32, Input>) -> f32 loc("<stdin>":14:12)
      %2 = "spirv.FAdd"(%1, %1) : (f32, f32) -> f32 loc("<stdin>":15:12)
      "spirv.ReturnValue"(%2) : (f32) -> () loc("<stdin>":16:7)
    }) : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":10:3)
}) : () -> () loc("<stdin>":1:1)
