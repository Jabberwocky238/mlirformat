"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.GlobalVariable"() <{binding = 0 : i32, descriptor_set = 1 : i32, sym_name = "foo", type = !spirv.ptr<f32, Input>}> : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> f32, sym_name = "use_foo"}> ({
      %3 = "spirv.mlir.addressof"() <{variable = @foo}> : () -> !spirv.ptr<f32, Input>
      %4 = "spirv.Load"(%3) : (!spirv.ptr<f32, Input>) -> f32
      "spirv.ReturnValue"(%4) : (f32) -> ()
    }) : () -> ()
  }) : () -> ()
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.GlobalVariable"() <{binding = 0 : i32, descriptor_set = 1 : i32, sym_name = "bar", type = !spirv.ptr<f32, Input>}> : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> f32, sym_name = "use_bar"}> ({
      %0 = "spirv.mlir.addressof"() <{variable = @bar}> : () -> !spirv.ptr<f32, Input>
      %1 = "spirv.Load"(%0) : (!spirv.ptr<f32, Input>) -> f32
      %2 = "spirv.FAdd"(%1, %1) : (f32, f32) -> f32
      "spirv.ReturnValue"(%2) : (f32) -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.GlobalVariable"() <{binding = 0 : i32, descriptor_set = 1 : i32, sym_name = "foo", type = !spirv.ptr<i32, Input>}> : () -> ()
  }) : () -> ()
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.GlobalVariable"() <{binding = 0 : i32, descriptor_set = 1 : i32, sym_name = "bar", type = !spirv.ptr<f32, Input>}> : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> f32, sym_name = "use_bar"}> ({
      %0 = "spirv.mlir.addressof"() <{variable = @bar}> : () -> !spirv.ptr<f32, Input>
      %1 = "spirv.Load"(%0) : (!spirv.ptr<f32, Input>) -> f32
      "spirv.ReturnValue"(%1) : (f32) -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.GlobalVariable"() <{built_in = "GlobalInvocationId", sym_name = "foo", type = !spirv.ptr<vector<3xi32>, Input>}> : () -> ()
  }) : () -> ()
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.GlobalVariable"() <{built_in = "GlobalInvocationId", sym_name = "bar", type = !spirv.ptr<vector<3xi32>, Input>}> : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> vector<3xi32>, sym_name = "use_bar"}> ({
      %0 = "spirv.mlir.addressof"() <{variable = @bar}> : () -> !spirv.ptr<vector<3xi32>, Input>
      %1 = "spirv.Load"(%0) : (!spirv.ptr<vector<3xi32>, Input>) -> vector<3xi32>
      "spirv.ReturnValue"(%1) : (vector<3xi32>) -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.SpecConstant"() <{default_value = 1.000000e+00 : f32, sym_name = "foo"}> {spec_id = 5 : i64} : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> f32, sym_name = "use_foo"}> ({
      %2 = "spirv.mlir.referenceof"() <{spec_const = @foo}> : () -> f32
      "spirv.ReturnValue"(%2) : (f32) -> ()
    }) : () -> ()
  }) : () -> ()
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.SpecConstant"() <{default_value = 1.000000e+00 : f32, sym_name = "bar"}> {spec_id = 5 : i64} : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> f32, sym_name = "use_bar"}> ({
      %0 = "spirv.mlir.referenceof"() <{spec_const = @bar}> : () -> f32
      %1 = "spirv.FAdd"(%0, %0) : (f32, f32) -> f32
      "spirv.ReturnValue"(%1) : (f32) -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32, f32, f32) -> f32, sym_name = "foo"}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %2 = "spirv.FAdd"(%arg3, %arg4) : (f32, f32) -> f32
      %3 = "spirv.FMul"(%2, %arg5) : (f32, f32) -> f32
      "spirv.ReturnValue"(%3) : (f32) -> ()
    }) : () -> ()
  }) : () -> ()
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32, f32, f32) -> f32, sym_name = "foo"}> ({
    ^bb0(%arg0: f32, %arg1: f32, %arg2: f32):
      %0 = "spirv.FAdd"(%arg0, %arg2) : (f32, f32) -> f32
      %1 = "spirv.FMul"(%0, %arg1) : (f32, f32) -> f32
      "spirv.ReturnValue"(%1) : (f32) -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.SpecConstant"() <{default_value = 1.000000e+00 : f32, sym_name = "bar"}> {spec_id = 5 : i64} : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> f32, sym_name = "foo"}> ({
    ^bb0(%arg11: f32):
      "spirv.ReturnValue"(%arg11) : (f32) -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> f32, sym_name = "foo_duplicate"}> ({
    ^bb0(%arg10: f32):
      "spirv.ReturnValue"(%arg10) : (f32) -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> f32, sym_name = "foo_different_body"}> ({
    ^bb0(%arg9: f32):
      %0 = "spirv.mlir.referenceof"() <{spec_const = @bar}> : () -> f32
      "spirv.ReturnValue"(%arg9) : (f32) -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "baz"}> ({
    ^bb0(%arg8: i32):
      "spirv.ReturnValue"(%arg8) : (i32) -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> (), sym_name = "baz_no_return"}> ({
    ^bb0(%arg7: i32):
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> (), sym_name = "baz_no_return_duplicate"}> ({
    ^bb0(%arg6: i32):
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<Inline>, function_type = (i32) -> (), sym_name = "baz_no_return_different_control"}> ({
    ^bb0(%arg5: i32):
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<Inline|Pure>, function_type = (i32) -> (), sym_name = "baz_no_return_another_control"}> ({
    ^bb0(%arg4: i32):
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32, !spirv.ptr<!spirv.struct<(!spirv.array<12 x f32>)>, CrossWorkgroup>) -> (), sym_name = "kernel"}> ({
    ^bb0(%arg2: f32, %arg3: !spirv.ptr<!spirv.struct<(!spirv.array<12 x f32>)>, CrossWorkgroup>):
      "spirv.Return"() : () -> ()
    }) {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [32, 1, 1]>} : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32, !spirv.ptr<!spirv.struct<(!spirv.array<12 x f32>)>, CrossWorkgroup>) -> (), sym_name = "kernel_different_attr"}> ({
    ^bb0(%arg0: f32, %arg1: !spirv.ptr<!spirv.struct<(!spirv.array<12 x f32>)>, CrossWorkgroup>):
      "spirv.Return"() : () -> ()
    }) {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [64, 1, 1]>} : () -> ()
  }) : () -> ()
}) : () -> ()

