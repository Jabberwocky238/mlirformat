"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<DontInline>, function_type = () -> (), sym_name = "linkage_attr_test_kernel"}> ({
      %0 = "spirv.Constant"() <{value = 0 : i8}> : () -> i8 loc("<stdin>":4:12)
      %1 = "spirv.Constant"() <{value = 1 : i16}> : () -> i16 loc("<stdin>":5:12)
      %2 = "spirv.Constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":6:12)
      "spirv.FunctionCall"(%0) <{callee = @outside.func.with.linkage}> : (i8) -> () loc("<stdin>":7:7)
      "spirv.Return"() : () -> () loc("<stdin>":8:7)
    }) : () -> () loc("<stdin>":3:5)
    "spirv.func"() <{function_control = #spirv.function_control<Pure>, function_type = (i8) -> (), linkage_attributes = #spirv.linkage_attributes<linkage_name = "outside.func", linkage_type = <Import>>, sym_name = "outside.func.with.linkage"}> ({
    }) : () -> () loc("<stdin>":10:5)
    "spirv.func"() <{function_control = #spirv.function_control<Pure>, function_type = () -> (), sym_name = "inside.func"}> ({
      "spirv.Return"() : () -> () loc("<stdin>":13:7)
    }) : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
