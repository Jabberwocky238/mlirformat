"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage], []>}> ({
    "spirv.SpecConstant"() <{default_value = true, sym_name = "sc_true"}> : () -> () loc("<stdin>":3:5)
    "spirv.SpecConstant"() <{default_value = false, sym_name = "sc_false"}> {spec_id = 1 : i64} : () -> () loc("<stdin>":4:5)
    "spirv.SpecConstant"() <{default_value = -5 : i32, sym_name = "sc_int"}> : () -> () loc("<stdin>":5:5)
    "spirv.SpecConstant"() <{default_value = 1.000000e+00 : f32, sym_name = "sc_float"}> {spec_id = 5 : i64} : () -> () loc("<stdin>":6:5)
    "spirv.SpecConstantComposite"() <{constituents = [@sc_int, @sc_int], sym_name = "scc", type = !spirv.array<2 x i32>}> : () -> () loc("<stdin>":7:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> i32, sym_name = "use"}> ({
      %4 = "spirv.mlir.referenceof"() <{spec_const = @sc_int}> : () -> i32 loc("<stdin>":9:12)
      %5 = "spirv.IAdd"(%4, %4) : (i32, i32) -> i32 loc("<stdin>":10:12)
      "spirv.ReturnValue"(%5) : (i32) -> () loc("<stdin>":11:7)
    }) : () -> () loc("<stdin>":8:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> i32, sym_name = "use_composite"}> ({
      %0 = "spirv.mlir.referenceof"() <{spec_const = @scc}> : () -> !spirv.array<2 x i32> loc("<stdin>":14:12)
      %1 = "spirv.CompositeExtract"(%0) <{indices = [0 : i32]}> : (!spirv.array<2 x i32>) -> i32 loc("<stdin>":15:12)
      %2 = "spirv.CompositeExtract"(%0) <{indices = [1 : i32]}> : (!spirv.array<2 x i32>) -> i32 loc("<stdin>":16:12)
      %3 = "spirv.IAdd"(%1, %2) : (i32, i32) -> i32 loc("<stdin>":17:12)
      "spirv.ReturnValue"(%3) : (i32) -> () loc("<stdin>":18:7)
    }) : () -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
