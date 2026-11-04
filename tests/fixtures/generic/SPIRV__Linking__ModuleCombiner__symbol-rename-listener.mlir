"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, sym_name = "Module1"}> ({
    "spirv.GlobalVariable"() <{binding = 0 : i32, descriptor_set = 1 : i32, sym_name = "foo", type = !spirv.ptr<f32, Input>}> : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "bar"}> ({
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "baz"}> ({
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.SpecConstant"() <{default_value = -5 : i32, sym_name = "sc"}> : () -> ()
  }) : () -> ()
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, sym_name = "Module2"}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "foo"}> ({
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.GlobalVariable"() <{binding = 0 : i32, descriptor_set = 1 : i32, sym_name = "bar", type = !spirv.ptr<f32, Input>}> : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "baz"}> ({
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.SpecConstant"() <{default_value = -5 : i32, sym_name = "sc"}> : () -> ()
  }) : () -> ()
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, sym_name = "Module3"}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "foo"}> ({
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.GlobalVariable"() <{binding = 0 : i32, descriptor_set = 1 : i32, sym_name = "bar", type = !spirv.ptr<f32, Input>}> : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "baz"}> ({
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.SpecConstant"() <{default_value = -5 : i32, sym_name = "sc"}> : () -> ()
  }) : () -> ()
}) : () -> ()

