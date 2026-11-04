module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.4, [MeshShadingEXT], [SPV_EXT_mesh_shader]> {
    spirv.func @emit_mesh_tasks() "None" {
      %cst1_i32 = spirv.Constant 1 : i32
      spirv.EXT.EmitMeshTasks %cst1_i32, %cst1_i32, %cst1_i32 : i32, i32, i32
    }
    spirv.func @set_mesh_outputs(%arg0: i32, %arg1: i32) "None" {
      spirv.EXT.SetMeshOutputs %arg0, %arg1 : i32, i32
      spirv.Return
    }
    spirv.EntryPoint "TaskEXT" @emit_mesh_tasks
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.4, [MeshShadingEXT], [SPV_EXT_mesh_shader]> {
    spirv.GlobalVariable @payload : !spirv.ptr<i32, TaskPayloadWorkgroupEXT>
    spirv.func @emit_mesh_tasks_payload() "None" {
      %cst1_i32 = spirv.Constant 1 : i32
      %payload_addr = spirv.mlir.addressof @payload : !spirv.ptr<i32, TaskPayloadWorkgroupEXT>
      spirv.EXT.EmitMeshTasks %cst1_i32, %cst1_i32, %cst1_i32, %payload_addr : i32, i32, i32, !spirv.ptr<i32, TaskPayloadWorkgroupEXT>
    }
    spirv.EntryPoint "TaskEXT" @emit_mesh_tasks_payload, @payload
  }
}

