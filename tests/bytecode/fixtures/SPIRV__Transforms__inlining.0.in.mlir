"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "callee"}> ({
      "spirv.Return"() : () -> () loc("<stdin>":4:7)
    }) : () -> () loc("<stdin>":3:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "calling_single_block_ret_func"}> ({
      "spirv.FunctionCall"() <{callee = @callee}> : () -> () loc("<stdin>":7:7)
      "spirv.Return"() : () -> () loc("<stdin>":8:7)
    }) : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
