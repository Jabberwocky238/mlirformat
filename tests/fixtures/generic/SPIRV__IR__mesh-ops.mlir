"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (), sym_name = "emit_mesh_tasks"}> ({
  ^bb0(%arg2: i32):
    "spirv.EXT.EmitMeshTasks"(%arg2, %arg2, %arg2) : (i32, i32, i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, !spirv.ptr<i32, TaskPayloadWorkgroupEXT>) -> (), sym_name = "emit_mesh_tasks_payload"}> ({
  ^bb0(%arg0: i32, %arg1: !spirv.ptr<i32, TaskPayloadWorkgroupEXT>):
    "spirv.EXT.EmitMeshTasks"(%arg0, %arg0, %arg0, %arg1) : (i32, i32, i32, !spirv.ptr<i32, TaskPayloadWorkgroupEXT>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "set_mesh_outputs"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    "spirv.EXT.SetMeshOutputs"(%arg0, %arg1) : (i32, i32) -> ()
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

