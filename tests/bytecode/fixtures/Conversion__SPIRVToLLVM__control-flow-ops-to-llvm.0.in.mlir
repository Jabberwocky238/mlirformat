"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "branch_without_arguments"}> ({
      "spirv.Branch"()[^bb1] : () -> () loc("<stdin>":4:7)
    ^bb1:  // pred: ^bb0
      "spirv.Return"() : () -> () loc("<stdin>":6:7)
    }) : () -> () loc("<stdin>":3:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "branch_with_arguments"}> ({
      %0 = "spirv.Constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":9:12)
      %1 = "spirv.Constant"() <{value = true}> : () -> i1 loc("<stdin>":10:12)
      "spirv.Branch"(%0, %1)[^bb1] : (i32, i1) -> () loc("<stdin>":11:7)
    ^bb1(%2: i32 loc("<stdin>":12:10), %3: i1 loc("<stdin>":12:19)):  // pred: ^bb0
      "spirv.Return"() : () -> () loc("<stdin>":13:7)
    }) : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
