"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, sym_name = "Module1"}> ({
    "spirv.GlobalVariable"() <{binding = 0 : i32, descriptor_set = 1 : i32, sym_name = "foo", type = !spirv.ptr<f32, Input>}> : () -> () loc("<stdin>":3:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "bar"}> ({
      "spirv.Return"() : () -> () loc("<stdin>":5:7)
    }) : () -> () loc("<stdin>":4:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "baz"}> ({
      "spirv.Return"() : () -> () loc("<stdin>":8:7)
    }) : () -> () loc("<stdin>":7:5)
    "spirv.SpecConstant"() <{default_value = -5 : i32, sym_name = "sc"}> : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":2:3)
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, sym_name = "Module2"}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "foo"}> ({
      "spirv.Return"() : () -> () loc("<stdin>":14:7)
    }) : () -> () loc("<stdin>":13:5)
    "spirv.GlobalVariable"() <{binding = 0 : i32, descriptor_set = 1 : i32, sym_name = "bar", type = !spirv.ptr<f32, Input>}> : () -> () loc("<stdin>":16:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "baz"}> ({
      "spirv.Return"() : () -> () loc("<stdin>":18:7)
    }) : () -> () loc("<stdin>":17:5)
    "spirv.SpecConstant"() <{default_value = -5 : i32, sym_name = "sc"}> : () -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":12:3)
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, sym_name = "Module3"}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "foo"}> ({
      "spirv.Return"() : () -> () loc("<stdin>":24:7)
    }) : () -> () loc("<stdin>":23:5)
    "spirv.GlobalVariable"() <{binding = 0 : i32, descriptor_set = 1 : i32, sym_name = "bar", type = !spirv.ptr<f32, Input>}> : () -> () loc("<stdin>":26:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "baz"}> ({
      "spirv.Return"() : () -> () loc("<stdin>":28:7)
    }) : () -> () loc("<stdin>":27:5)
    "spirv.SpecConstant"() <{default_value = -5 : i32, sym_name = "sc"}> : () -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":22:3)
}) : () -> () loc("<stdin>":1:1)
