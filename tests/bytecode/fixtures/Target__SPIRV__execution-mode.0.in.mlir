"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<OpenCL>, vce_triple = #spirv.vce<v1.0, [Kernel], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "foo"}> ({
      "spirv.Return"() : () -> () loc("<stdin>":4:7)
    }) : () -> () loc("<stdin>":3:5)
    "spirv.EntryPoint"() <{execution_model = #spirv.execution_model<Kernel>, fn = @foo, interface = []}> : () -> () loc("<stdin>":6:5)
    "spirv.ExecutionMode"() <{execution_mode = #spirv.execution_mode<LocalSizeHint>, fn = @foo, values = [3 : i32, 4 : i32, 5 : i32]}> : () -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
