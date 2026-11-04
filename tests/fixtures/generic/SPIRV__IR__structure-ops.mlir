"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.GlobalVariable"() <{sym_name = "var1", type = !spirv.ptr<!spirv.struct<(f32, !spirv.array<4 x f32>)>, Input>}> : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "access_chain"}> ({
      %0 = "spirv.Constant"() <{value = 1 : i32}> : () -> i32
      %1 = "spirv.mlir.addressof"() <{variable = @var1}> : () -> !spirv.ptr<!spirv.struct<(f32, !spirv.array<4 x f32>)>, Input>
      %2 = "spirv.AccessChain"(%1, %0, %0) : (!spirv.ptr<!spirv.struct<(f32, !spirv.array<4 x f32>)>, Input>, i32, i32) -> !spirv.ptr<f32, Input>
      "spirv.Return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.GlobalVariable"() <{sym_name = "var", type = !spirv.ptr<!spirv.struct<(f32, !spirv.array<4 x f32>)>, Input>}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "addressof"}> ({
    %0 = "spirv.mlir.addressof"() <{variable = @var}> : () -> !spirv.ptr<!spirv.struct<(f32, !spirv.array<4 x f32>)>, Input>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "const"}> ({
    %0 = "spirv.Constant"() <{value = true}> : () -> i1
    %1 = "spirv.Constant"() <{value = 42 : i32}> : () -> i32
    %2 = "spirv.Constant"() <{value = 5.000000e-01 : f32}> : () -> f32
    %3 = "spirv.Constant"() <{value = dense<[2, 3]> : vector<2xi32>}> : () -> vector<2xi32>
    %4 = "spirv.Constant"() <{value = [dense<3.000000e+00> : vector<2xf32>]}> : () -> !spirv.array<1 x vector<2xf32>>
    %5 = "spirv.Constant"() <{value = dense<1> : tensor<2x3xi32>}> : () -> !spirv.array<2 x !spirv.array<3 x i32>>
    %6 = "spirv.Constant"() <{value = dense<1.000000e+00> : tensor<2x3xf32>}> : () -> !spirv.array<2 x !spirv.array<3 x f32>>
    %7 = "spirv.Constant"() <{value = dense<[[1, 2, 3], [4, 5, 6]]> : tensor<2x3xi32>}> : () -> !spirv.array<2 x !spirv.array<3 x i32>>
    %8 = "spirv.Constant"() <{value = dense<[[1.000000e+00, 2.000000e+00, 3.000000e+00], [4.000000e+00, 5.000000e+00, 6.000000e+00]]> : tensor<2x3xf32>}> : () -> !spirv.array<2 x !spirv.array<3 x f32>>
    %9 = "spirv.Constant"() <{value = [[dense<3.000000e+00> : vector<2xf32>]]}> : () -> !spirv.array<1 x !spirv.array<1 x vector<2xf32>>>
    %10 = "spirv.Constant"() <{value = dense<0.000000e+00> : !spirv.coopmatrix<16x16xf32, Subgroup, MatrixAcc>}> : () -> !spirv.coopmatrix<16x16xf32, Subgroup, MatrixAcc>
    %11 = "spirv.Constant"() <{value = dense<4.200000e+00> : !spirv.coopmatrix<16x16xf32, Subgroup, MatrixAcc>}> : () -> !spirv.coopmatrix<16x16xf32, Subgroup, MatrixAcc>
    %12 = "spirv.Constant"() <{value = dense<0> : !spirv.coopmatrix<16x16xi8, Subgroup, MatrixAcc>}> : () -> !spirv.coopmatrix<16x16xi8, Subgroup, MatrixAcc>
    %13 = "spirv.Constant"() <{value = dense<4> : !spirv.coopmatrix<16x16xi8, Subgroup, MatrixAcc>}> : () -> !spirv.coopmatrix<16x16xi8, Subgroup, MatrixAcc>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "do_nothing"}> ({
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.EntryPoint"() <{execution_model = #spirv.execution_model<GLCompute>, fn = @do_nothing, interface = []}> : () -> ()
  }) : () -> ()
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.GlobalVariable"() <{sym_name = "var2", type = !spirv.ptr<f32, Input>}> : () -> ()
    "spirv.GlobalVariable"() <{sym_name = "var3", type = !spirv.ptr<f32, Output>}> : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<f32, Input>, !spirv.ptr<f32, Output>) -> (), sym_name = "do_something"}> ({
    ^bb0(%arg0: !spirv.ptr<f32, Input>, %arg1: !spirv.ptr<f32, Output>):
      %0 = "spirv.Load"(%arg0) : (!spirv.ptr<f32, Input>) -> f32
      "spirv.Store"(%arg1, %0) : (!spirv.ptr<f32, Output>, f32) -> ()
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.EntryPoint"() <{execution_model = #spirv.execution_model<GLCompute>, fn = @do_something, interface = [@var2, @var3]}> : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "do_nothing"}> ({
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.EntryPoint"() <{execution_model = #spirv.execution_model<GLCompute>, fn = @do_nothing, interface = []}> : () -> ()
    "spirv.ExecutionMode"() <{execution_mode = #spirv.execution_mode<ContractionOff>, fn = @do_nothing, values = []}> : () -> ()
  }) : () -> ()
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "do_nothing"}> ({
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.EntryPoint"() <{execution_model = #spirv.execution_model<GLCompute>, fn = @do_nothing, interface = []}> : () -> ()
    "spirv.ExecutionMode"() <{execution_mode = #spirv.execution_mode<LocalSizeHint>, fn = @do_nothing, values = [3 : i32, 4 : i32, 5 : i32]}> : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "foo"}> ({
  }) : () -> ()
  "spirv.func"() <{function_control = #spirv.function_control<Inline|Pure>, function_type = (i32) -> i32, sym_name = "bar"}> ({
  ^bb0(%arg1: i32):
    "spirv.ReturnValue"(%arg1) : (i32) -> ()
  }) : () -> ()
  "spirv.func"() <{function_control = #spirv.function_control<DontInline>, function_type = (i32) -> (), sym_name = "baz"}> ({
  ^bb0(%arg0: i32):
    "spirv.Return"() : () -> ()
  }) {additional_stuff = 64 : i64} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<Pure>, function_type = (i8) -> (), linkage_attributes = #spirv.linkage_attributes<linkage_name = "outside.func", linkage_type = <Import>>, sym_name = "outside.func.with.linkage"}> ({
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<Pure>, function_type = () -> (), sym_name = "inside.func"}> ({
      "spirv.Return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.GlobalVariable"() <{sym_name = "var0", type = !spirv.ptr<f32, Input>}> : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.SpecConstant"() <{default_value = 4.000000e+00 : f32, sym_name = "sc"}> : () -> ()
    "spirv.GlobalVariable"() <{initializer = @sc, sym_name = "var", type = !spirv.ptr<f32, Private>}> : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.SpecConstant"() <{default_value = 4.000000e+00 : f32, sym_name = "sc"}> : () -> ()
  "spirv.GlobalVariable"() <{initializer = @sc, sym_name = "var", type = !spirv.ptr<f32, Private>}> : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.SpecConstant"() <{default_value = 1 : i8, sym_name = "sc1"}> : () -> ()
    "spirv.SpecConstant"() <{default_value = 2 : i8, sym_name = "sc2"}> : () -> ()
    "spirv.SpecConstant"() <{default_value = 3 : i8, sym_name = "sc3"}> : () -> ()
    "spirv.SpecConstantComposite"() <{constituents = [@sc1, @sc2, @sc3], sym_name = "scc", type = !spirv.array<3 x i8>}> : () -> ()
    "spirv.GlobalVariable"() <{initializer = @scc, sym_name = "var", type = !spirv.ptr<!spirv.array<3 x i8>, Private>}> : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.GlobalVariable"() <{binding = 2 : i32, descriptor_set = 1 : i32, sym_name = "var0", type = !spirv.ptr<f32, Uniform>}> : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.GlobalVariable"() <{built_in = "GlobalInvocationID", sym_name = "var1", type = !spirv.ptr<vector<3xi32>, Input>}> : () -> ()
    "spirv.GlobalVariable"() <{built_in = "GlobalInvocationID", sym_name = "var2", type = !spirv.ptr<vector<3xi32>, Input>}> : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.GlobalVariable"() <{sym_name = "var0", type = !spirv.ptr<f32, Input>}> : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage], []>}> ({
    "spirv.GlobalVariable"() <{linkage_attributes = #spirv.linkage_attributes<linkage_name = "outSideGlobalVar1", linkage_type = <Import>>, sym_name = "var1", type = !spirv.ptr<f32, Private>}> : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
  ^bb0:
  }) : () -> ()
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, sym_name = "name"}> ({
  ^bb0:
  }) : () -> ()
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader], [SPV_KHR_16bit_storage]>}> ({
  ^bb0:
  }) : () -> ()
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
  ^bb0:
  }) {foo = "bar"} : () -> ()
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader], [SPV_KHR_16bit_storage]>}> ({
  ^bb0:
  }) {foo = "bar"} : () -> ()
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "do_nothing"}> ({
      "spirv.Return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.SpecConstant"() <{default_value = false, sym_name = "sc1"}> : () -> ()
    "spirv.SpecConstant"() <{default_value = 42 : i64, sym_name = "sc2"}> : () -> ()
    "spirv.SpecConstant"() <{default_value = 1.500000e+00 : f32, sym_name = "sc3"}> : () -> ()
    "spirv.SpecConstantComposite"() <{constituents = [@sc1, @sc2, @sc3], sym_name = "scc", type = !spirv.struct<(i1, i64, f32)>}> : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> i1, sym_name = "reference"}> ({
      %8 = "spirv.mlir.referenceof"() <{spec_const = @sc1}> : () -> i1
      "spirv.ReturnValue"(%8) : (i1) -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> i1, sym_name = "reference_composite"}> ({
      %6 = "spirv.mlir.referenceof"() <{spec_const = @scc}> : () -> !spirv.struct<(i1, i64, f32)>
      %7 = "spirv.CompositeExtract"(%6) <{indices = [0 : i32]}> : (!spirv.struct<(i1, i64, f32)>) -> i1
      "spirv.ReturnValue"(%7) : (i1) -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> i64, sym_name = "initialize"}> ({
      %3 = "spirv.mlir.referenceof"() <{spec_const = @sc2}> : () -> i64
      %4 = "spirv.Variable"(%3) <{storage_class = #spirv.storage_class<Function>}> : (i64) -> !spirv.ptr<i64, Function>
      %5 = "spirv.Load"(%4) : (!spirv.ptr<i64, Function>) -> i64
      "spirv.ReturnValue"(%5) : (i64) -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> f32, sym_name = "compute"}> ({
      %0 = "spirv.mlir.referenceof"() <{spec_const = @sc3}> : () -> f32
      %1 = "spirv.Constant"() <{value = 6.000000e+00 : f32}> : () -> f32
      %2 = "spirv.FAdd"(%0, %1) : (f32, f32) -> f32
      "spirv.ReturnValue"(%2) : (f32) -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.SpecConstant"() <{default_value = 5 : i32, sym_name = "sc"}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "reference_of"}> ({
    %0 = "spirv.mlir.referenceof"() <{spec_const = @sc}> : () -> i32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.SpecConstant"() <{default_value = 5 : i32, sym_name = "sc"}> : () -> ()
  "spirv.SpecConstantComposite"() <{constituents = [@sc], sym_name = "scc", type = !spirv.array<1 x i32>}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "reference_of_composite"}> ({
    %0 = "spirv.mlir.referenceof"() <{spec_const = @scc}> : () -> !spirv.array<1 x i32>
    %1 = "spirv.CompositeExtract"(%0) <{indices = [0 : i32]}> : (!spirv.array<1 x i32>) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.SpecConstant"() <{default_value = false, sym_name = "sc1"}> : () -> ()
    "spirv.SpecConstant"() <{default_value = 42 : i64, sym_name = "sc2"}> {spec_id = 5 : i64} : () -> ()
    "spirv.SpecConstant"() <{default_value = 1.500000e+00 : f32, sym_name = "sc3"}> : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.SpecConstant"() <{default_value = 1.500000e+00 : f32, sym_name = "sc1"}> : () -> ()
    "spirv.SpecConstant"() <{default_value = 2.500000e+00 : f32, sym_name = "sc2"}> : () -> ()
    "spirv.SpecConstant"() <{default_value = 3.500000e+00 : f32, sym_name = "sc3"}> : () -> ()
    "spirv.SpecConstantComposite"() <{constituents = [@sc1, @sc2, @sc3], sym_name = "scc", type = !spirv.array<3 x f32>}> : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.SpecConstant"() <{default_value = 1 : i32, sym_name = "sc1"}> : () -> ()
    "spirv.SpecConstant"() <{default_value = 2.500000e+00 : f32, sym_name = "sc2"}> : () -> ()
    "spirv.SpecConstant"() <{default_value = 3.500000e+00 : f32, sym_name = "sc3"}> : () -> ()
    "spirv.SpecConstantComposite"() <{constituents = [@sc1, @sc2, @sc3], sym_name = "scc", type = !spirv.struct<(i32, f32, f32)>}> : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.SpecConstant"() <{default_value = 1.500000e+00 : f32, sym_name = "sc1"}> : () -> ()
    "spirv.SpecConstant"() <{default_value = 2.500000e+00 : f32, sym_name = "sc2"}> : () -> ()
    "spirv.SpecConstant"() <{default_value = 3.500000e+00 : f32, sym_name = "sc3"}> : () -> ()
    "spirv.SpecConstantComposite"() <{constituents = [@sc1, @sc2, @sc3], sym_name = "scc", type = vector<3xf32>}> : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> i32, sym_name = "foo"}> ({
      %0 = "spirv.Constant"() <{value = 1 : i32}> : () -> i32
      %1 = "spirv.Constant"() <{value = 1 : i32}> : () -> i32
      %2 = "spirv.SpecConstantOperation"() ({
        %3 = "spirv.IAdd"(%0, %1) : (i32, i32) -> i32
        "spirv.mlir.yield"(%3) : (i32) -> ()
      }) : () -> i32
      "spirv.ReturnValue"(%2) : (i32) -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.SpecConstant"() <{default_value = 42 : i32, sym_name = "sc"}> : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> i32, sym_name = "foo"}> ({
      %0 = "spirv.mlir.referenceof"() <{spec_const = @sc}> : () -> i32
      %1 = "spirv.SpecConstantOperation"() ({
        %2 = "spirv.ISub"(%0, %0) : (i32, i32) -> i32
        "spirv.mlir.yield"(%2) : (i32) -> ()
      }) : () -> i32
      "spirv.ReturnValue"(%1) : (i32) -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
