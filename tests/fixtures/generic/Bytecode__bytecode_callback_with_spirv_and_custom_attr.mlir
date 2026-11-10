"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "callee"}> ({
      "spirv.Kill"() : () -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "caller"}> ({
      "spirv.FunctionCall"() <{callee = @callee}> : () -> ()
      "spirv.Return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
  "test.versionedC"() <{attribute = #test.attr_params<42, 24>}> : () -> ()
}) : () -> ()

