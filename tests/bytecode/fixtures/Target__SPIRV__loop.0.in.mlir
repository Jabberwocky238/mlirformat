"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> (), sym_name = "loop"}> ({
    ^bb0(%arg0: i32 loc("<stdin>":4:10)):
      %0 = "spirv.Constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":5:12)
      %1 = "spirv.Constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":6:12)
      %2 = "spirv.Variable"(%0) <{storage_class = #spirv.storage_class<Function>}> : (i32) -> !spirv.ptr<i32, Function> loc("<stdin>":7:12)
      "spirv.mlir.loop"() <{loop_control = #spirv.loop_control<None>}> ({
        "spirv.Branch"()[^bb1] : () -> () loc("<stdin>":9:9)
      ^bb1:  // 2 preds: ^bb0, ^bb3
        %3 = "spirv.Load"(%2) : (!spirv.ptr<i32, Function>) -> i32 loc("<stdin>":11:14)
        %4 = "spirv.SLessThan"(%3, %arg0) : (i32, i32) -> i1 loc("<stdin>":12:14)
        "spirv.BranchConditional"(%4)[^bb2, ^bb4] <{branch_weights = [1 : i32, 1 : i32], operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":13:9)
      ^bb2:  // pred: ^bb1
        "spirv.Branch"()[^bb3] : () -> () loc("<stdin>":15:9)
      ^bb3:  // pred: ^bb2
        %5 = "spirv.Load"(%2) : (!spirv.ptr<i32, Function>) -> i32 loc("<stdin>":17:14)
        %6 = "spirv.IAdd"(%5, %1) : (i32, i32) -> i32 loc("<stdin>":18:14)
        "spirv.Store"(%2, %6) : (!spirv.ptr<i32, Function>, i32) -> () loc("<stdin>":19:9)
        "spirv.Branch"()[^bb1] : () -> () loc("<stdin>":20:9)
      ^bb4:  // pred: ^bb1
        "spirv.mlir.merge"() : () -> () loc("<stdin>":22:9)
      }) : () -> () loc("<stdin>":8:7)
      "spirv.Return"() : () -> () loc("<stdin>":24:7)
    }) : () -> () loc("<stdin>":3:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "main"}> ({
      "spirv.Return"() : () -> () loc("<stdin>":27:7)
    }) : () -> () loc("<stdin>":26:5)
    "spirv.EntryPoint"() <{execution_model = #spirv.execution_model<GLCompute>, fn = @main, interface = []}> : () -> () loc("<stdin>":29:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
