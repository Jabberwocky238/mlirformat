"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "ret"}> ({
      "spirv.Return"() : () -> () loc("<stdin>":4:7)
    }) : () -> () loc("<stdin>":3:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> i32, sym_name = "ret_val"}> ({
      %0 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<i32, Function> loc("<stdin>":7:12)
      %1 = "spirv.Load"(%0) : (!spirv.ptr<i32, Function>) -> i32 loc("<stdin>":8:12)
      "spirv.ReturnValue"(%1) : (i32) -> () loc("<stdin>":9:7)
    }) : () -> () loc("<stdin>":6:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "unreachable"}> ({
      "spirv.Return"() : () -> () loc("<stdin>":12:7)
    ^bb1:  // no predecessors
      "spirv.Unreachable"() : () -> () loc("<stdin>":14:7)
    }) : () -> () loc("<stdin>":11:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "kill"}> ({
      "spirv.Kill"() : () -> () loc("<stdin>":17:7)
    }) : () -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
