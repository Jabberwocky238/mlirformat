"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.SpecConstant"() <{default_value = 4.242000e+01 : f32, sym_name = "m1_sc"}> : () -> () loc("<stdin>":3:5)
    "spirv.GlobalVariable"() <{binding = 0 : i32, descriptor_set = 1 : i32, sym_name = "m1_gv", type = !spirv.ptr<f32, Input>}> : () -> () loc("<stdin>":4:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "no_op"}> ({
      "spirv.Return"() : () -> () loc("<stdin>":6:7)
    }) : () -> () loc("<stdin>":5:5)
    "spirv.EntryPoint"() <{execution_model = #spirv.execution_model<GLCompute>, fn = @no_op, interface = []}> : () -> () loc("<stdin>":8:5)
    "spirv.ExecutionMode"() <{execution_mode = #spirv.execution_mode<LocalSize>, fn = @no_op, values = [32 : i32, 1 : i32, 1 : i32]}> : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.SpecConstant"() <{default_value = 42 : i32, sym_name = "m2_sc"}> : () -> () loc("<stdin>":12:5)
    "spirv.GlobalVariable"() <{binding = 1 : i32, descriptor_set = 0 : i32, sym_name = "m2_gv", type = !spirv.ptr<f32, Input>}> : () -> () loc("<stdin>":13:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "variable_init_spec_constant"}> ({
      %0 = "spirv.mlir.referenceof"() <{spec_const = @m2_sc}> : () -> i32 loc("<stdin>":15:12)
      %1 = "spirv.Variable"(%0) <{storage_class = #spirv.storage_class<Function>}> : (i32) -> !spirv.ptr<i32, Function> loc("<stdin>":16:12)
      "spirv.Return"() : () -> () loc("<stdin>":17:7)
    }) : () -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":11:3)
}) : () -> () loc("<stdin>":1:1)
