"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Geometry], []>}> ({
    "spirv.GlobalVariable"() <{sym_name = "out", type = !spirv.ptr<!spirv.struct<(vector<4xf32>, f32, !spirv.array<1 x f32>)>, Output>}> : () -> () loc("<stdin>":3:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "primitive_ops"}> ({
      "spirv.EmitVertex"() : () -> () loc("<stdin>":5:7)
      "spirv.EndPrimitive"() : () -> () loc("<stdin>":6:7)
      "spirv.Return"() : () -> () loc("<stdin>":7:7)
    }) : () -> () loc("<stdin>":4:5)
    "spirv.EntryPoint"() <{execution_model = #spirv.execution_model<Geometry>, fn = @primitive_ops, interface = [@out]}> : () -> () loc("<stdin>":9:5)
    "spirv.ExecutionMode"() <{execution_mode = #spirv.execution_mode<InputPoints>, fn = @primitive_ops, values = []}> : () -> () loc("<stdin>":10:5)
    "spirv.ExecutionMode"() <{execution_mode = #spirv.execution_mode<Invocations>, fn = @primitive_ops, values = [1 : i32]}> : () -> () loc("<stdin>":11:5)
    "spirv.ExecutionMode"() <{execution_mode = #spirv.execution_mode<OutputLineStrip>, fn = @primitive_ops, values = []}> : () -> () loc("<stdin>":12:5)
    "spirv.ExecutionMode"() <{execution_mode = #spirv.execution_mode<OutputVertices>, fn = @primitive_ops, values = [2 : i32]}> : () -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
