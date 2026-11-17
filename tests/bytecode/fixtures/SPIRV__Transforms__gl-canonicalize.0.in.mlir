"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32, f32) -> f32, sym_name = "clamp_fordlessthan"}> ({
  ^bb0(%arg0: f32 loc("<stdin>":3:8), %arg1: f32 loc("<stdin>":3:20), %arg2: f32 loc("<stdin>":3:32)):
    %0 = "spirv.FOrdLessThan"(%arg1, %arg0) : (f32, f32) -> i1 loc("<stdin>":4:10)
    %1 = "spirv.Select"(%0, %arg0, %arg1) : (i1, f32, f32) -> f32 loc("<stdin>":5:10)
    %2 = "spirv.FOrdLessThan"(%1, %arg2) : (f32, f32) -> i1 loc("<stdin>":6:10)
    %3 = "spirv.Select"(%2, %1, %arg2) : (i1, f32, f32) -> f32 loc("<stdin>":7:10)
    "spirv.ReturnValue"(%3) : (f32) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
