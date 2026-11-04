"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i1) -> (), sym_name = "selection"}> ({
    ^bb0(%arg0: i1):
      %0 = "spirv.Constant"() <{value = 0 : i32}> : () -> i32
      %1 = "spirv.Constant"() <{value = 1 : i32}> : () -> i32
      %2 = "spirv.Constant"() <{value = 2 : i32}> : () -> i32
      %3 = "spirv.Variable"(%0) <{storage_class = #spirv.storage_class<Function>}> : (i32) -> !spirv.ptr<i32, Function>
      "spirv.mlir.selection"() <{selection_control = #spirv.selection_control<Flatten>}> ({
        "spirv.BranchConditional"(%arg0)[^bb1, ^bb2] <{branch_weights = [5 : i32, 10 : i32], operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^bb1:  // pred: ^bb0
        "spirv.Store"(%3, %1) : (!spirv.ptr<i32, Function>, i32) -> ()
        "spirv.Branch"()[^bb3] : () -> ()
      ^bb2:  // pred: ^bb0
        "spirv.Store"(%3, %2) : (!spirv.ptr<i32, Function>, i32) -> ()
        "spirv.Branch"()[^bb3] : () -> ()
      ^bb3:  // 2 preds: ^bb1, ^bb2
        "spirv.mlir.merge"() : () -> ()
      }) : () -> ()
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "main"}> ({
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.EntryPoint"() <{execution_model = #spirv.execution_model<GLCompute>, fn = @main, interface = []}> : () -> ()
    "spirv.ExecutionMode"() <{execution_mode = #spirv.execution_mode<LocalSize>, fn = @main, values = [1 : i32, 1 : i32, 1 : i32]}> : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i1) -> i32, sym_name = "selection"}> ({
    ^bb0(%arg0: i1):
      "spirv.mlir.selection"() <{selection_control = #spirv.selection_control<None>}> ({
        "spirv.BranchConditional"(%arg0)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^bb1:  // pred: ^bb0
        %1 = "spirv.Constant"() <{value = 0 : i32}> : () -> i32
        "spirv.ReturnValue"(%1) : (i32) -> ()
      ^bb2:  // pred: ^bb0
        "spirv.mlir.merge"() : () -> ()
      }) : () -> ()
      %0 = "spirv.Constant"() <{value = 1 : i32}> : () -> i32
      "spirv.ReturnValue"(%0) : (i32) -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "main"}> ({
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.EntryPoint"() <{execution_model = #spirv.execution_model<GLCompute>, fn = @main, interface = []}> : () -> ()
    "spirv.ExecutionMode"() <{execution_mode = #spirv.execution_mode<LocalSize>, fn = @main, values = [1 : i32, 1 : i32, 1 : i32]}> : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "selection_cf"}> ({
      %0 = "spirv.Constant"() <{value = true}> : () -> i1
      %1 = "spirv.Constant"() <{value = false}> : () -> i1
      %2 = "spirv.Constant"() <{value = 0 : i32}> : () -> i32
      %3 = "spirv.Constant"() <{value = 1 : i32}> : () -> i32
      %4 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<i1, Function>
      "spirv.mlir.selection"() <{selection_control = #spirv.selection_control<None>}> ({
        "spirv.BranchConditional"(%0)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^bb1:  // pred: ^bb0
        "spirv.Store"(%4, %0) : (!spirv.ptr<i1, Function>, i1) -> ()
        "spirv.Branch"()[^bb3] : () -> ()
      ^bb2:  // pred: ^bb0
        "spirv.Store"(%4, %1) : (!spirv.ptr<i1, Function>, i1) -> ()
        "spirv.Branch"()[^bb3] : () -> ()
      ^bb3:  // 2 preds: ^bb1, ^bb2
        "spirv.mlir.merge"() : () -> ()
      }) : () -> ()
      %5 = "spirv.Load"(%4) : (!spirv.ptr<i1, Function>) -> i1
      "spirv.mlir.selection"() <{selection_control = #spirv.selection_control<None>}> ({
        "spirv.BranchConditional"(%5, %3, %2, %2)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 1, 2>}> : (i1, i32, i32, i32) -> ()
      ^bb1(%6: i32):  // pred: ^bb0
        "spirv.Return"() : () -> ()
      ^bb2(%7: i32, %8: i32):  // pred: ^bb0
        "spirv.Return"() : () -> ()
      ^bb3:  // no predecessors
        "spirv.mlir.merge"() : () -> ()
      }) : () -> ()
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "main"}> ({
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.EntryPoint"() <{execution_model = #spirv.execution_model<GLCompute>, fn = @main, interface = []}> : () -> ()
    "spirv.ExecutionMode"() <{execution_mode = #spirv.execution_mode<LocalSize>, fn = @main, values = [1 : i32, 1 : i32, 1 : i32]}> : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i1) -> (), sym_name = "selection_yield"}> ({
    ^bb0(%arg0: i1):
      %0 = "spirv.Constant"() <{value = 0 : i32}> : () -> i32
      %1 = "spirv.Variable"(%0) <{storage_class = #spirv.storage_class<Function>}> : (i32) -> !spirv.ptr<i32, Function>
      %2 = "spirv.mlir.selection"() <{selection_control = #spirv.selection_control<None>}> ({
        "spirv.BranchConditional"(%arg0)[^bb1, ^bb2] <{branch_weights = [5 : i32, 10 : i32], operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^bb1:  // pred: ^bb0
        %3 = "spirv.Constant"() <{value = 1 : i32}> : () -> i32
        "spirv.Branch"(%3)[^bb3] : (i32) -> ()
      ^bb2:  // pred: ^bb0
        %4 = "spirv.Constant"() <{value = 2 : i32}> : () -> i32
        "spirv.Branch"(%4)[^bb3] : (i32) -> ()
      ^bb3(%5: i32):  // 2 preds: ^bb1, ^bb2
        "spirv.mlir.merge"(%5) : (i32) -> ()
      }) : () -> i32
      "spirv.Store"(%1, %2) : (!spirv.ptr<i32, Function>, i32) -> ()
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "main"}> ({
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.EntryPoint"() <{execution_model = #spirv.execution_model<GLCompute>, fn = @main, interface = []}> : () -> ()
    "spirv.ExecutionMode"() <{execution_mode = #spirv.execution_mode<LocalSize>, fn = @main, values = [1 : i32, 1 : i32, 1 : i32]}> : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> (), sym_name = "selection_switch"}> ({
    ^bb0(%arg0: i32):
      %0 = "spirv.Constant"() <{value = 0 : i32}> : () -> i32
      %1 = "spirv.Constant"() <{value = 1 : i32}> : () -> i32
      %2 = "spirv.Constant"() <{value = 2 : i32}> : () -> i32
      %3 = "spirv.Constant"() <{value = 3 : i32}> : () -> i32
      %4 = "spirv.Constant"() <{value = 4 : i32}> : () -> i32
      %5 = "spirv.Variable"(%0) <{storage_class = #spirv.storage_class<Function>}> : (i32) -> !spirv.ptr<i32, Function>
      "spirv.mlir.selection"() <{selection_control = #spirv.selection_control<None>}> ({
        "spirv.Switch"(%arg0)[^bb1, ^bb2, ^bb3, ^bb4] <{case_operand_segments = array<i32: 0, 0, 0>, literals = dense<[0, 1, 2]> : vector<3xi32>, operandSegmentSizes = array<i32: 1, 0, 0>}> : (i32) -> ()
      ^bb1:  // pred: ^bb0
        "spirv.Store"(%5, %1) : (!spirv.ptr<i32, Function>, i32) -> ()
        "spirv.Branch"()[^bb5] : () -> ()
      ^bb2:  // pred: ^bb0
        "spirv.Store"(%5, %2) : (!spirv.ptr<i32, Function>, i32) -> ()
        "spirv.Branch"()[^bb5] : () -> ()
      ^bb3:  // pred: ^bb0
        "spirv.Store"(%5, %3) : (!spirv.ptr<i32, Function>, i32) -> ()
        "spirv.Branch"()[^bb5] : () -> ()
      ^bb4:  // pred: ^bb0
        "spirv.Store"(%5, %4) : (!spirv.ptr<i32, Function>, i32) -> ()
        "spirv.Branch"()[^bb5] : () -> ()
      ^bb5:  // 4 preds: ^bb1, ^bb2, ^bb3, ^bb4
        "spirv.mlir.merge"() : () -> ()
      }) : () -> ()
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "main"}> ({
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.EntryPoint"() <{execution_model = #spirv.execution_model<GLCompute>, fn = @main, interface = []}> : () -> ()
    "spirv.ExecutionMode"() <{execution_mode = #spirv.execution_mode<LocalSize>, fn = @main, values = [1 : i32, 1 : i32, 1 : i32]}> : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.5, [Shader], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (si32) -> (), sym_name = "selection_switch_operands"}> ({
    ^bb0(%arg0: si32):
      %0 = "spirv.Constant"() <{value = 1.000000e+00 : f32}> : () -> f32
      %1 = "spirv.Undef"() : () -> vector<3xf32>
      %2 = "spirv.CompositeInsert"(%0, %1) <{indices = [0 : i32]}> : (f32, vector<3xf32>) -> vector<3xf32>
      "spirv.Branch"()[^bb1] : () -> ()
    ^bb1:  // pred: ^bb0
      %3 = "spirv.mlir.selection"() <{selection_control = #spirv.selection_control<None>}> ({
        "spirv.Switch"(%arg0, %2, %2, %2)[^bb3, ^bb1, ^bb2] <{case_operand_segments = array<i32: 1, 1>, literals = dense<[0, 1]> : vector<2xsi32>, operandSegmentSizes = array<i32: 1, 1, 2>}> : (si32, vector<3xf32>, vector<3xf32>, vector<3xf32>) -> ()
      ^bb1(%6: vector<3xf32>):  // pred: ^bb0
        %7 = "spirv.Constant"() <{value = 3.000000e+00 : f32}> : () -> f32
        %8 = "spirv.CompositeInsert"(%7, %6) <{indices = [1 : i32]}> : (f32, vector<3xf32>) -> vector<3xf32>
        "spirv.Branch"(%8)[^bb3] : (vector<3xf32>) -> ()
      ^bb2(%9: vector<3xf32>):  // pred: ^bb0
        %10 = "spirv.Constant"() <{value = 4.000000e+00 : f32}> : () -> f32
        %11 = "spirv.CompositeInsert"(%10, %9) <{indices = [1 : i32]}> : (f32, vector<3xf32>) -> vector<3xf32>
        "spirv.Branch"(%11)[^bb3] : (vector<3xf32>) -> ()
      ^bb3(%12: vector<3xf32>):  // 3 preds: ^bb0, ^bb1, ^bb2
        "spirv.mlir.merge"(%12) : (vector<3xf32>) -> ()
      }) : () -> vector<3xf32>
      %4 = "spirv.Constant"() <{value = 2.000000e+00 : f32}> : () -> f32
      %5 = "spirv.CompositeInsert"(%4, %3) <{indices = [2 : i32]}> : (f32, vector<3xf32>) -> vector<3xf32>
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "main"}> ({
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.EntryPoint"() <{execution_model = #spirv.execution_model<GLCompute>, fn = @main, interface = []}> : () -> ()
    "spirv.ExecutionMode"() <{execution_mode = #spirv.execution_mode<LocalSize>, fn = @main, values = [1 : i32, 1 : i32, 1 : i32]}> : () -> ()
  }) : () -> ()
}) : () -> ()

