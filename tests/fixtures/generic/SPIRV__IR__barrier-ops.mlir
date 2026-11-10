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
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (), sym_name = "named_barrier_initialize"}> ({
  ^bb0(%arg0: i32):
    %0 = "spirv.NamedBarrierInitialize"(%arg0) : (i32) -> !spirv.named_barrier
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (), sym_name = "memory_named_barrier"}> ({
  ^bb0(%arg0: i32):
    %0 = "spirv.NamedBarrierInitialize"(%arg0) : (i32) -> !spirv.named_barrier
    "spirv.MemoryNamedBarrier"(%0) <{memory_scope = #spirv.scope<Workgroup>, memory_semantics = #spirv.memory_semantics<AcquireRelease|WorkgroupMemory>}> : (!spirv.named_barrier) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
