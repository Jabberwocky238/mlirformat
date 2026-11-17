"builtin.module"() ({
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> (), sym_name = "f32_to_bf16"}> ({
  ^bb0(%arg0: f32 loc("<stdin>":3:8)):
    %0 = "spirv.INTEL.ConvertFToBF16"(%arg0) : (f32) -> i16 loc("<stdin>":4:10)
    "spirv.Return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
