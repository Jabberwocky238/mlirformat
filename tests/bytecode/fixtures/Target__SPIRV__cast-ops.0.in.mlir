"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> (), sym_name = "bit_cast"}> ({
    ^bb0(%arg0: f32 loc("<stdin>":4:10)):
      %0 = "spirv.Bitcast"(%arg0) : (f32) -> i32 loc("<stdin>":5:12)
      %1 = "spirv.Bitcast"(%0) : (i32) -> si32 loc("<stdin>":6:12)
      %2 = "spirv.Bitcast"(%1) : (si32) -> ui32 loc("<stdin>":7:12)
      "spirv.Return"() : () -> () loc("<stdin>":8:7)
    }) : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
