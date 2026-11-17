"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "foo"}> ({
      %0 = "spirv.Constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":4:12)
      "spirv.Branch"(%0)[^bb1] : (i32) -> () loc("<stdin>":5:7)
    ^bb1(%1: i32 loc("<stdin>":6:10)):  // pred: ^bb0
      "spirv.Return"() : () -> () loc("<stdin>":7:7)
    }) : () -> () loc("<stdin>":3:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "main"}> ({
      "spirv.Return"() : () -> () loc("<stdin>":10:7)
    }) : () -> () loc("<stdin>":9:5)
    "spirv.EntryPoint"() <{execution_model = #spirv.execution_model<GLCompute>, fn = @main, interface = []}> : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
