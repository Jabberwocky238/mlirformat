"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (), sym_name = "emit_mesh_tasks"}> ({
  ^bb0(%arg2: i32 loc("<stdin>":3:8)):
    "spirv.EXT.EmitMeshTasks"(%arg2, %arg2, %arg2) : (i32, i32, i32) -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (i32, !spirv.ptr<i32, TaskPayloadWorkgroupEXT>) -> (), sym_name = "emit_mesh_tasks_payload"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":7:8), %arg1: !spirv.ptr<i32, TaskPayloadWorkgroupEXT> loc("<stdin>":7:20)):
    "spirv.EXT.EmitMeshTasks"(%arg0, %arg0, %arg0, %arg1) : (i32, i32, i32, !spirv.ptr<i32, TaskPayloadWorkgroupEXT>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":6:3)
}) : () -> () loc("<stdin>":1:1)
