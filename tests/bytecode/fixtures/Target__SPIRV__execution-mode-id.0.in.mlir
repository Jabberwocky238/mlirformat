"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.2, [Shader], []>}> ({
    "spirv.SpecConstant"() <{default_value = 3 : i32, sym_name = "x"}> : () -> () loc("<stdin>":3:5)
    "spirv.SpecConstant"() <{default_value = 4 : i32, sym_name = "y"}> : () -> () loc("<stdin>":4:5)
    "spirv.SpecConstant"() <{default_value = 5 : i32, sym_name = "z"}> : () -> () loc("<stdin>":5:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "foo"}> ({
      "spirv.Return"() : () -> () loc("<stdin>":7:7)
    }) : () -> () loc("<stdin>":6:5)
    "spirv.EntryPoint"() <{execution_model = #spirv.execution_model<GLCompute>, fn = @foo, interface = []}> : () -> () loc("<stdin>":9:5)
    "spirv.ExecutionModeId"() <{execution_mode = #spirv.execution_mode<LocalSizeId>, fn = @foo, values = [@x, @y, @z]}> : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
