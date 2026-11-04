module {
  func.func @emit_mesh_tasks(%arg0: i32) {
    spirv.EXT.EmitMeshTasks %arg0, %arg0, %arg0 : i32, i32, i32
  }
  func.func @emit_mesh_tasks_payload(%arg0: i32, %arg1: !spirv.ptr<i32, TaskPayloadWorkgroupEXT>) {
    spirv.EXT.EmitMeshTasks %arg0, %arg0, %arg0, %arg1 : i32, i32, i32, !spirv.ptr<i32, TaskPayloadWorkgroupEXT>
  }
}

// -----
// -----
module {
  func.func @set_mesh_outputs(%arg0: i32, %arg1: i32) {
    spirv.EXT.SetMeshOutputs %arg0, %arg1 : i32, i32
    spirv.Return
  }
}

