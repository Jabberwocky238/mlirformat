"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "foo"}> ({
    ^bb0(%arg1: i32):
      "spirv.ReturnValue"(%arg1) : (i32) -> ()
    }) : () -> ()
  }) : () -> ()
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> f32, sym_name = "foo"}> ({
    ^bb0(%arg0: f32):
      "spirv.ReturnValue"(%arg0) : (f32) -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "foo"}> ({
    ^bb0(%arg2: i32):
      "spirv.ReturnValue"(%arg2) : (i32) -> ()
    }) : () -> ()
  }) : () -> ()
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> f32, sym_name = "foo"}> ({
    ^bb0(%arg1: f32):
      %1 = "spirv.FAdd"(%arg1, %arg1) : (f32, f32) -> f32
      "spirv.ReturnValue"(%1) : (f32) -> ()
    }) : () -> ()
  }) : () -> ()
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "foo"}> ({
    ^bb0(%arg0: i32):
      %0 = "spirv.ISub"(%arg0, %arg0) : (i32, i32) -> i32
      "spirv.ReturnValue"(%0) : (i32) -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "foo"}> ({
    ^bb0(%arg2: i32):
      "spirv.ReturnValue"(%arg2) : (i32) -> ()
    }) : () -> ()
  }) : () -> ()
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> f32, sym_name = "foo"}> ({
    ^bb0(%arg1: f32):
      "spirv.ReturnValue"(%arg1) : (f32) -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> f32, sym_name = "bar"}> ({
    ^bb0(%arg0: f32):
      %0 = "spirv.FunctionCall"(%arg0) <{callee = @foo}> : (f32) -> f32
      "spirv.ReturnValue"(%0) : (f32) -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "foo"}> ({
    ^bb0(%arg2: i32):
      "spirv.ReturnValue"(%arg2) : (i32) -> ()
    }) : () -> ()
  }) : () -> ()
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> f32, sym_name = "bar"}> ({
    ^bb0(%arg1: f32):
      %0 = "spirv.FunctionCall"(%arg1) <{callee = @foo}> : (f32) -> f32
      "spirv.ReturnValue"(%0) : (f32) -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> f32, sym_name = "foo"}> ({
    ^bb0(%arg0: f32):
      "spirv.ReturnValue"(%arg0) : (f32) -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "foo"}> ({
    ^bb0(%arg1: i32):
      "spirv.ReturnValue"(%arg1) : (i32) -> ()
    }) : () -> ()
  }) : () -> ()
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> f32, sym_name = "foo"}> ({
    ^bb0(%arg0: f32):
      "spirv.ReturnValue"(%arg0) : (f32) -> ()
    }) : () -> ()
    "spirv.EntryPoint"() <{execution_model = #spirv.execution_model<GLCompute>, fn = @foo, interface = []}> : () -> ()
    "spirv.ExecutionMode"() <{execution_mode = #spirv.execution_mode<ContractionOff>, fn = @foo, values = []}> : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "foo"}> ({
    ^bb0(%arg1: i32):
      "spirv.ReturnValue"(%arg1) : (i32) -> ()
    }) : () -> ()
    "spirv.EntryPoint"() <{execution_model = #spirv.execution_model<GLCompute>, fn = @foo, interface = []}> : () -> ()
    "spirv.ExecutionMode"() <{execution_mode = #spirv.execution_mode<ContractionOff>, fn = @foo, values = []}> : () -> ()
  }) : () -> ()
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> f32, sym_name = "foo"}> ({
    ^bb0(%arg0: f32):
      "spirv.ReturnValue"(%arg0) : (f32) -> ()
    }) : () -> ()
    "spirv.EntryPoint"() <{execution_model = #spirv.execution_model<GLCompute>, fn = @foo, interface = []}> : () -> ()
    "spirv.ExecutionMode"() <{execution_mode = #spirv.execution_mode<ContractionOff>, fn = @foo, values = []}> : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "foo"}> ({
    ^bb0(%arg0: i32):
      "spirv.ReturnValue"(%arg0) : (i32) -> ()
    }) : () -> ()
  }) : () -> ()
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.GlobalVariable"() <{binding = 0 : i32, descriptor_set = 1 : i32, sym_name = "foo", type = !spirv.ptr<f32, Input>}> : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "foo"}> ({
    ^bb0(%arg0: i32):
      "spirv.ReturnValue"(%arg0) : (i32) -> ()
    }) : () -> ()
  }) : () -> ()
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.GlobalVariable"() <{binding = 0 : i32, descriptor_set = 1 : i32, sym_name = "foo", type = !spirv.ptr<f32, Input>}> : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> f32, sym_name = "bar"}> ({
      %0 = "spirv.mlir.addressof"() <{variable = @foo}> : () -> !spirv.ptr<f32, Input>
      %1 = "spirv.Load"(%0) : (!spirv.ptr<f32, Input>) -> f32
      "spirv.ReturnValue"(%1) : (f32) -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.GlobalVariable"() <{binding = 0 : i32, descriptor_set = 1 : i32, sym_name = "foo", type = !spirv.ptr<f32, Input>}> : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> f32, sym_name = "bar"}> ({
      %0 = "spirv.mlir.addressof"() <{variable = @foo}> : () -> !spirv.ptr<f32, Input>
      %1 = "spirv.Load"(%0) : (!spirv.ptr<f32, Input>) -> f32
      "spirv.ReturnValue"(%1) : (f32) -> ()
    }) : () -> ()
  }) : () -> ()
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "foo"}> ({
    ^bb0(%arg0: i32):
      "spirv.ReturnValue"(%arg0) : (i32) -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "foo"}> ({
    ^bb0(%arg0: i32):
      "spirv.ReturnValue"(%arg0) : (i32) -> ()
    }) : () -> ()
  }) : () -> ()
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.SpecConstant"() <{default_value = -5 : i32, sym_name = "foo"}> : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "foo"}> ({
    ^bb0(%arg0: i32):
      "spirv.ReturnValue"(%arg0) : (i32) -> ()
    }) : () -> ()
  }) : () -> ()
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.SpecConstant"() <{default_value = -5 : i32, sym_name = "foo"}> : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> i32, sym_name = "bar"}> ({
      %0 = "spirv.mlir.referenceof"() <{spec_const = @foo}> : () -> i32
      "spirv.ReturnValue"(%0) : (i32) -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.SpecConstant"() <{default_value = -5 : i32, sym_name = "foo"}> : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> i32, sym_name = "bar"}> ({
      %0 = "spirv.mlir.referenceof"() <{spec_const = @foo}> : () -> i32
      "spirv.ReturnValue"(%0) : (i32) -> ()
    }) : () -> ()
  }) : () -> ()
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "foo"}> ({
    ^bb0(%arg0: i32):
      "spirv.ReturnValue"(%arg0) : (i32) -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "foo"}> ({
    ^bb0(%arg0: i32):
      "spirv.ReturnValue"(%arg0) : (i32) -> ()
    }) : () -> ()
  }) : () -> ()
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.SpecConstant"() <{default_value = -5 : i32, sym_name = "bar"}> : () -> ()
    "spirv.SpecConstantComposite"() <{constituents = [@bar, @bar], sym_name = "foo", type = !spirv.array<2 x i32>}> : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "foo"}> ({
    ^bb0(%arg0: i32):
      "spirv.ReturnValue"(%arg0) : (i32) -> ()
    }) : () -> ()
  }) : () -> ()
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.SpecConstant"() <{default_value = -5 : i32, sym_name = "bar"}> : () -> ()
    "spirv.SpecConstantComposite"() <{constituents = [@bar, @bar], sym_name = "foo", type = !spirv.array<2 x i32>}> : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> i32, sym_name = "baz"}> ({
      %0 = "spirv.mlir.referenceof"() <{spec_const = @foo}> : () -> !spirv.array<2 x i32>
      %1 = "spirv.CompositeExtract"(%0) <{indices = [0 : i32]}> : (!spirv.array<2 x i32>) -> i32
      "spirv.ReturnValue"(%1) : (i32) -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.SpecConstant"() <{default_value = -5 : i32, sym_name = "bar"}> : () -> ()
    "spirv.SpecConstantComposite"() <{constituents = [@bar, @bar], sym_name = "foo", type = !spirv.array<2 x i32>}> : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> i32, sym_name = "baz"}> ({
      %0 = "spirv.mlir.referenceof"() <{spec_const = @foo}> : () -> !spirv.array<2 x i32>
      %1 = "spirv.CompositeExtract"(%0) <{indices = [0 : i32]}> : (!spirv.array<2 x i32>) -> i32
      "spirv.ReturnValue"(%1) : (i32) -> ()
    }) : () -> ()
  }) : () -> ()
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "foo"}> ({
    ^bb0(%arg0: i32):
      "spirv.ReturnValue"(%arg0) : (i32) -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.SpecConstant"() <{default_value = -5 : i32, sym_name = "bar"}> : () -> ()
    "spirv.SpecConstantComposite"() <{constituents = [@bar, @bar], sym_name = "foo", type = !spirv.array<2 x i32>}> : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> i32, sym_name = "baz"}> ({
      %0 = "spirv.mlir.referenceof"() <{spec_const = @foo}> : () -> !spirv.array<2 x i32>
      %1 = "spirv.CompositeExtract"(%0) <{indices = [0 : i32]}> : (!spirv.array<2 x i32>) -> i32
      "spirv.ReturnValue"(%1) : (i32) -> ()
    }) : () -> ()
  }) : () -> ()
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "foo"}> ({
    ^bb0(%arg1: i32):
      "spirv.ReturnValue"(%arg1) : (i32) -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> f32, sym_name = "bar"}> ({
    ^bb0(%arg0: f32):
      "spirv.ReturnValue"(%arg0) : (f32) -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.GlobalVariable"() <{binding = 0 : i32, descriptor_set = 1 : i32, sym_name = "foo", type = !spirv.ptr<f32, Input>}> : () -> ()
  }) : () -> ()
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.GlobalVariable"() <{binding = 0 : i32, descriptor_set = 2 : i32, sym_name = "foo", type = !spirv.ptr<f32, Input>}> : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.GlobalVariable"() <{built_in = "GlobalInvocationId", sym_name = "foo", type = !spirv.ptr<vector<3xi32>, Input>}> : () -> ()
  }) : () -> ()
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.GlobalVariable"() <{built_in = "LocalInvocationId", sym_name = "foo", type = !spirv.ptr<vector<3xi32>, Input>}> : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.GlobalVariable"() <{binding = 0 : i32, descriptor_set = 1 : i32, sym_name = "foo", type = !spirv.ptr<f32, Input>}> : () -> ()
  }) : () -> ()
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.SpecConstant"() <{default_value = -5 : i32, sym_name = "foo"}> : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.SpecConstant"() <{default_value = -5 : i32, sym_name = "foo"}> : () -> ()
  }) : () -> ()
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.GlobalVariable"() <{binding = 0 : i32, descriptor_set = 1 : i32, sym_name = "foo", type = !spirv.ptr<f32, Input>}> : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.GlobalVariable"() <{binding = 0 : i32, descriptor_set = 1 : i32, sym_name = "foo", type = !spirv.ptr<f32, Input>}> : () -> ()
  }) : () -> ()
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.SpecConstant"() <{default_value = -5 : i32, sym_name = "bar"}> : () -> ()
    "spirv.SpecConstantComposite"() <{constituents = [@bar, @bar], sym_name = "foo", type = !spirv.array<2 x i32>}> : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.SpecConstant"() <{default_value = -5 : i32, sym_name = "bar"}> : () -> ()
    "spirv.SpecConstantComposite"() <{constituents = [@bar, @bar], sym_name = "foo", type = !spirv.array<2 x i32>}> : () -> ()
  }) : () -> ()
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.GlobalVariable"() <{binding = 0 : i32, descriptor_set = 1 : i32, sym_name = "foo", type = !spirv.ptr<f32, Input>}> : () -> ()
  }) : () -> ()
}) : () -> ()

