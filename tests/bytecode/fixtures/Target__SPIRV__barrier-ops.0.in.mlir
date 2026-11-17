"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "memory_barrier_0"}> ({
      "spirv.MemoryBarrier"() <{memory_scope = #spirv.scope<Device>, memory_semantics = #spirv.memory_semantics<Release|UniformMemory>}> : () -> () loc("<stdin>":4:7)
      "spirv.Return"() : () -> () loc("<stdin>":5:7)
    }) : () -> () loc("<stdin>":3:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "memory_barrier_1"}> ({
      "spirv.MemoryBarrier"() <{memory_scope = #spirv.scope<Subgroup>, memory_semantics = #spirv.memory_semantics<AcquireRelease|SubgroupMemory>}> : () -> () loc("<stdin>":8:7)
      "spirv.Return"() : () -> () loc("<stdin>":9:7)
    }) : () -> () loc("<stdin>":7:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "control_barrier_0"}> ({
      "spirv.ControlBarrier"() <{execution_scope = #spirv.scope<Device>, memory_scope = #spirv.scope<Workgroup>, memory_semantics = #spirv.memory_semantics<Release|UniformMemory>}> : () -> () loc("<stdin>":12:7)
      "spirv.Return"() : () -> () loc("<stdin>":13:7)
    }) : () -> () loc("<stdin>":11:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "control_barrier_1"}> ({
      "spirv.ControlBarrier"() <{execution_scope = #spirv.scope<Workgroup>, memory_scope = #spirv.scope<Invocation>, memory_semantics = #spirv.memory_semantics<AcquireRelease|UniformMemory>}> : () -> () loc("<stdin>":16:7)
      "spirv.Return"() : () -> () loc("<stdin>":17:7)
    }) : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
