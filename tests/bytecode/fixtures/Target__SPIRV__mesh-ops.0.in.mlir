"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.4, [MeshShadingEXT], [SPV_EXT_mesh_shader]>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "emit_mesh_tasks"}> ({
      %0 = "spirv.Constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":4:12)
      "spirv.EXT.EmitMeshTasks"(%0, %0, %0) : (i32, i32, i32) -> () loc("<stdin>":5:7)
    }) : () -> () loc("<stdin>":3:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32, i32) -> (), sym_name = "set_mesh_outputs"}> ({
    ^bb0(%arg0: i32 loc("<stdin>":8:10), %arg1: i32 loc("<stdin>":8:22)):
      "spirv.EXT.SetMeshOutputs"(%arg0, %arg1) : (i32, i32) -> () loc("<stdin>":9:7)
      "spirv.Return"() : () -> () loc("<stdin>":10:7)
    }) : () -> () loc("<stdin>":7:5)
    "spirv.EntryPoint"() <{execution_model = #spirv.execution_model<TaskEXT>, fn = @emit_mesh_tasks, interface = []}> : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
