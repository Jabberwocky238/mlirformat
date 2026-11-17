"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<f32, Input>, !spirv.ptr<f32, Output>) -> (), sym_name = "load_store"}> ({
    ^bb0(%arg2: !spirv.ptr<f32, Input> loc("<stdin>":4:10), %arg3: !spirv.ptr<f32, Output> loc("<stdin>":4:41)):
      %1 = "spirv.Load"(%arg2) : (!spirv.ptr<f32, Input>) -> f32 loc("<stdin>":5:12)
      "spirv.Store"(%arg3, %1) : (!spirv.ptr<f32, Output>, f32) -> () loc("<stdin>":6:7)
      "spirv.Return"() : () -> () loc("<stdin>":7:7)
    }) : () -> () loc("<stdin>":3:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<f32, Input>, !spirv.ptr<f32, Output>) -> (), sym_name = "load_store_memory_operands"}> ({
    ^bb0(%arg0: !spirv.ptr<f32, Input> loc("<stdin>":10:10), %arg1: !spirv.ptr<f32, Output> loc("<stdin>":10:41)):
      %0 = "spirv.Load"(%arg0) <{alignment = 4 : i32, memory_access = #spirv.memory_access<Volatile|Aligned>}> : (!spirv.ptr<f32, Input>) -> f32 loc("<stdin>":11:12)
      "spirv.Store"(%arg1, %0) <{alignment = 4 : i32, memory_access = #spirv.memory_access<Volatile|Aligned>}> : (!spirv.ptr<f32, Output>, f32) -> () loc("<stdin>":12:7)
      "spirv.Return"() : () -> () loc("<stdin>":13:7)
    }) : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
