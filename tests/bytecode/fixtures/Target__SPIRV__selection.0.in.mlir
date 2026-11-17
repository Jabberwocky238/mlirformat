"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i1) -> (), sym_name = "selection"}> ({
    ^bb0(%arg0: i1 loc("<stdin>":4:10)):
      %0 = "spirv.Constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":5:12)
      %1 = "spirv.Constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":6:12)
      %2 = "spirv.Constant"() <{value = 2 : i32}> : () -> i32 loc("<stdin>":7:12)
      %3 = "spirv.Variable"(%0) <{storage_class = #spirv.storage_class<Function>}> : (i32) -> !spirv.ptr<i32, Function> loc("<stdin>":8:12)
      "spirv.mlir.selection"() <{selection_control = #spirv.selection_control<Flatten>}> ({
        "spirv.BranchConditional"(%arg0)[^bb1, ^bb2] <{branch_weights = [5 : i32, 10 : i32], operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":10:9)
      ^bb1:  // pred: ^bb0
        "spirv.Store"(%3, %1) : (!spirv.ptr<i32, Function>, i32) -> () loc("<stdin>":12:9)
        "spirv.Branch"()[^bb3] : () -> () loc("<stdin>":13:9)
      ^bb2:  // pred: ^bb0
        "spirv.Store"(%3, %2) : (!spirv.ptr<i32, Function>, i32) -> () loc("<stdin>":15:9)
        "spirv.Branch"()[^bb3] : () -> () loc("<stdin>":16:9)
      ^bb3:  // 2 preds: ^bb1, ^bb2
        "spirv.mlir.merge"() : () -> () loc("<stdin>":18:9)
      }) : () -> () loc("<stdin>":9:7)
      "spirv.Return"() : () -> () loc("<stdin>":20:7)
    }) : () -> () loc("<stdin>":3:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "main"}> ({
      "spirv.Return"() : () -> () loc("<stdin>":23:7)
    }) : () -> () loc("<stdin>":22:5)
    "spirv.EntryPoint"() <{execution_model = #spirv.execution_model<GLCompute>, fn = @main, interface = []}> : () -> () loc("<stdin>":25:5)
    "spirv.ExecutionMode"() <{execution_mode = #spirv.execution_mode<LocalSize>, fn = @main, values = [1 : i32, 1 : i32, 1 : i32]}> : () -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
