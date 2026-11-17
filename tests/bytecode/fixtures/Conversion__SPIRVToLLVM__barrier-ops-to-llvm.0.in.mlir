"builtin.module"() ({
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "control_barrier"}> ({
    "spirv.ControlBarrier"() <{execution_scope = #spirv.scope<Workgroup>, memory_scope = #spirv.scope<Workgroup>, memory_semantics = #spirv.memory_semantics<WorkgroupMemory|CrossWorkgroupMemory>}> : () -> () loc("<stdin>":3:5)
    "spirv.ControlBarrier"() <{execution_scope = #spirv.scope<Workgroup>, memory_scope = #spirv.scope<Workgroup>, memory_semantics = #spirv.memory_semantics<WorkgroupMemory>}> : () -> () loc("<stdin>":4:5)
    "spirv.Return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
