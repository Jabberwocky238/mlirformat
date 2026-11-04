"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "control_barrier_0"}> ({
    "spirv.ControlBarrier"() <{execution_scope = #spirv.scope<Workgroup>, memory_scope = #spirv.scope<Device>, memory_semantics = #spirv.memory_semantics<Acquire|UniformMemory>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "memory_barrier_0"}> ({
    "spirv.MemoryBarrier"() <{memory_scope = #spirv.scope<Device>, memory_semantics = #spirv.memory_semantics<Acquire|UniformMemory>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "memory_barrier_1"}> ({
    "spirv.MemoryBarrier"() <{memory_scope = #spirv.scope<Workgroup>, memory_semantics = #spirv.memory_semantics<Acquire>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
