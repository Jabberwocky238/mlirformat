"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "memory_barrier_0"}> ({
      "spirv.MemoryBarrier"() <{memory_scope = #spirv.scope<Device>, memory_semantics = #spirv.memory_semantics<Release|UniformMemory>}> : () -> ()
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "memory_barrier_1"}> ({
      "spirv.MemoryBarrier"() <{memory_scope = #spirv.scope<Subgroup>, memory_semantics = #spirv.memory_semantics<AcquireRelease|SubgroupMemory>}> : () -> ()
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "control_barrier_0"}> ({
      "spirv.ControlBarrier"() <{execution_scope = #spirv.scope<Device>, memory_scope = #spirv.scope<Workgroup>, memory_semantics = #spirv.memory_semantics<Release|UniformMemory>}> : () -> ()
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "control_barrier_1"}> ({
      "spirv.ControlBarrier"() <{execution_scope = #spirv.scope<Workgroup>, memory_scope = #spirv.scope<Invocation>, memory_semantics = #spirv.memory_semantics<AcquireRelease|UniformMemory>}> : () -> ()
      "spirv.Return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Physical64>, memory_model = #spirv.memory_model<OpenCL>, vce_triple = #spirv.vce<v1.1, [Kernel, Addresses, NamedBarrier, Linkage], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> (), sym_name = "named_barrier"}> ({
    ^bb0(%arg0: i32):
      %0 = "spirv.NamedBarrierInitialize"(%arg0) : (i32) -> !spirv.named_barrier
      "spirv.MemoryNamedBarrier"(%0) <{memory_scope = #spirv.scope<Workgroup>, memory_semantics = #spirv.memory_semantics<AcquireRelease|WorkgroupMemory>}> : (!spirv.named_barrier) -> ()
      "spirv.Return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

