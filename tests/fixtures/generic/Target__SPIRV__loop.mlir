"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> (), sym_name = "loop"}> ({
    ^bb0(%arg0: i32):
      %0 = "spirv.Constant"() <{value = 0 : i32}> : () -> i32
      %1 = "spirv.Constant"() <{value = 1 : i32}> : () -> i32
      %2 = "spirv.Variable"(%0) <{storage_class = #spirv.storage_class<Function>}> : (i32) -> !spirv.ptr<i32, Function>
      "spirv.mlir.loop"() <{loop_control = #spirv.loop_control<None>}> ({
        "spirv.Branch"()[^bb1] : () -> ()
      ^bb1:  // 2 preds: ^bb0, ^bb3
        %3 = "spirv.Load"(%2) : (!spirv.ptr<i32, Function>) -> i32
        %4 = "spirv.SLessThan"(%3, %arg0) : (i32, i32) -> i1
        "spirv.BranchConditional"(%4)[^bb2, ^bb4] <{branch_weights = [1 : i32, 1 : i32], operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^bb2:  // pred: ^bb1
        "spirv.Branch"()[^bb3] : () -> ()
      ^bb3:  // pred: ^bb2
        %5 = "spirv.Load"(%2) : (!spirv.ptr<i32, Function>) -> i32
        %6 = "spirv.IAdd"(%5, %1) : (i32, i32) -> i32
        "spirv.Store"(%2, %6) : (!spirv.ptr<i32, Function>, i32) -> ()
        "spirv.Branch"()[^bb1] : () -> ()
      ^bb4:  // pred: ^bb1
        "spirv.mlir.merge"() : () -> ()
      }) : () -> ()
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "main"}> ({
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.EntryPoint"() <{execution_model = #spirv.execution_model<GLCompute>, fn = @main, interface = []}> : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class]>}> ({
    "spirv.GlobalVariable"() <{binding = 0 : i32, descriptor_set = 0 : i32, sym_name = "GV1", type = !spirv.ptr<!spirv.struct<(!spirv.array<10 x f32, stride=4> [0])>, StorageBuffer>}> : () -> ()
    "spirv.GlobalVariable"() <{binding = 1 : i32, descriptor_set = 0 : i32, sym_name = "GV2", type = !spirv.ptr<!spirv.struct<(!spirv.array<10 x f32, stride=4> [0])>, StorageBuffer>}> : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "loop_kernel"}> ({
      %0 = "spirv.mlir.addressof"() <{variable = @GV1}> : () -> !spirv.ptr<!spirv.struct<(!spirv.array<10 x f32, stride=4> [0])>, StorageBuffer>
      %1 = "spirv.Constant"() <{value = 0 : i32}> : () -> i32
      %2 = "spirv.AccessChain"(%0, %1) : (!spirv.ptr<!spirv.struct<(!spirv.array<10 x f32, stride=4> [0])>, StorageBuffer>, i32) -> !spirv.ptr<!spirv.array<10 x f32, stride=4>, StorageBuffer>
      %3 = "spirv.mlir.addressof"() <{variable = @GV2}> : () -> !spirv.ptr<!spirv.struct<(!spirv.array<10 x f32, stride=4> [0])>, StorageBuffer>
      %4 = "spirv.AccessChain"(%3, %1) : (!spirv.ptr<!spirv.struct<(!spirv.array<10 x f32, stride=4> [0])>, StorageBuffer>, i32) -> !spirv.ptr<!spirv.array<10 x f32, stride=4>, StorageBuffer>
      %5 = "spirv.Constant"() <{value = 4 : i32}> : () -> i32
      %6 = "spirv.Constant"() <{value = 42 : i32}> : () -> i32
      %7 = "spirv.Constant"() <{value = 2 : i32}> : () -> i32
      "spirv.mlir.loop"() <{loop_control = #spirv.loop_control<None>}> ({
        "spirv.Branch"(%5)[^bb1] : (i32) -> ()
      ^bb1(%8: i32):  // 2 preds: ^bb0, ^bb2
        %9 = "spirv.SLessThan"(%8, %6) : (i32, i32) -> i1
        "spirv.BranchConditional"(%9)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^bb2:  // pred: ^bb1
        %10 = "spirv.AccessChain"(%2, %8) : (!spirv.ptr<!spirv.array<10 x f32, stride=4>, StorageBuffer>, i32) -> !spirv.ptr<f32, StorageBuffer>
        %11 = "spirv.Load"(%10) : (!spirv.ptr<f32, StorageBuffer>) -> f32
        %12 = "spirv.AccessChain"(%4, %8) : (!spirv.ptr<!spirv.array<10 x f32, stride=4>, StorageBuffer>, i32) -> !spirv.ptr<f32, StorageBuffer>
        "spirv.Store"(%12, %11) : (!spirv.ptr<f32, StorageBuffer>, f32) -> ()
        %13 = "spirv.IAdd"(%8, %7) : (i32, i32) -> i32
        "spirv.Branch"(%13)[^bb1] : (i32) -> ()
      ^bb3:  // pred: ^bb1
        "spirv.mlir.merge"() : () -> ()
      }) : () -> ()
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.EntryPoint"() <{execution_model = #spirv.execution_model<GLCompute>, fn = @loop_kernel, interface = []}> : () -> ()
    "spirv.ExecutionMode"() <{execution_mode = #spirv.execution_mode<LocalSize>, fn = @loop_kernel, values = [1 : i32, 1 : i32, 1 : i32]}> : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> (), sym_name = "loop"}> ({
    ^bb0(%arg0: i32):
      %0 = "spirv.Constant"() <{value = 0 : i32}> : () -> i32
      %1 = "spirv.Constant"() <{value = 1 : i32}> : () -> i32
      %2 = "spirv.Variable"(%0) <{storage_class = #spirv.storage_class<Function>}> : (i32) -> !spirv.ptr<i32, Function>
      %3 = "spirv.Variable"(%0) <{storage_class = #spirv.storage_class<Function>}> : (i32) -> !spirv.ptr<i32, Function>
      "spirv.mlir.loop"() <{loop_control = #spirv.loop_control<Unroll>}> ({
        "spirv.Branch"()[^bb1] : () -> ()
      ^bb1:  // 2 preds: ^bb0, ^bb3
        %4 = "spirv.Load"(%2) : (!spirv.ptr<i32, Function>) -> i32
        %5 = "spirv.SLessThan"(%4, %arg0) : (i32, i32) -> i1
        "spirv.BranchConditional"(%5)[^bb2, ^bb4] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^bb2:  // pred: ^bb1
        "spirv.Store"(%3, %0) : (!spirv.ptr<i32, Function>, i32) -> ()
        "spirv.mlir.loop"() <{loop_control = #spirv.loop_control<DontUnroll>}> ({
          "spirv.Branch"()[^bb1] : () -> ()
        ^bb1:  // 2 preds: ^bb0, ^bb3
          %8 = "spirv.Load"(%3) : (!spirv.ptr<i32, Function>) -> i32
          %9 = "spirv.SLessThan"(%8, %arg0) : (i32, i32) -> i1
          "spirv.BranchConditional"(%9)[^bb2, ^bb4] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
        ^bb2:  // pred: ^bb1
          "spirv.Branch"()[^bb3] : () -> ()
        ^bb3:  // pred: ^bb2
          %10 = "spirv.Load"(%3) : (!spirv.ptr<i32, Function>) -> i32
          %11 = "spirv.IAdd"(%10, %1) : (i32, i32) -> i32
          "spirv.Store"(%3, %11) : (!spirv.ptr<i32, Function>, i32) -> ()
          "spirv.Branch"()[^bb1] : () -> ()
        ^bb4:  // pred: ^bb1
          "spirv.mlir.merge"() : () -> ()
        }) : () -> ()
        "spirv.Branch"()[^bb3] : () -> ()
      ^bb3:  // pred: ^bb2
        %6 = "spirv.Load"(%2) : (!spirv.ptr<i32, Function>) -> i32
        %7 = "spirv.IAdd"(%6, %1) : (i32, i32) -> i32
        "spirv.Store"(%2, %7) : (!spirv.ptr<i32, Function>, i32) -> ()
        "spirv.Branch"()[^bb1] : () -> ()
      ^bb4:  // pred: ^bb1
        "spirv.mlir.merge"() : () -> ()
      }) : () -> ()
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "main"}> ({
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.EntryPoint"() <{execution_model = #spirv.execution_model<GLCompute>, fn = @main, interface = []}> : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Physical64>, memory_model = #spirv.memory_model<OpenCL>, vce_triple = #spirv.vce<v1.0, [Kernel, Linkage, Addresses, Int64], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i64) -> (), sym_name = "kernel"}> ({
    ^bb0(%arg0: i64):
      %0 = "spirv.Constant"() <{value = 0 : i64}> : () -> i64
      %1 = "spirv.Constant"() <{value = true}> : () -> i1
      %2 = "spirv.Constant"() <{value = false}> : () -> i1
      "spirv.mlir.loop"() <{loop_control = #spirv.loop_control<None>}> ({
        "spirv.Branch"(%arg0)[^bb1] : (i64) -> ()
      ^bb1(%3: i64):  // 2 preds: ^bb0, ^bb2
        %4 = "spirv.SGreaterThan"(%3, %0) : (i64, i64) -> i1
        %5 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<i1, Function>
        "spirv.mlir.selection"() <{selection_control = #spirv.selection_control<None>}> ({
          "spirv.BranchConditional"(%4)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
        ^bb1:  // pred: ^bb0
          "spirv.Store"(%5, %1) : (!spirv.ptr<i1, Function>, i1) -> ()
          "spirv.Branch"()[^bb3] : () -> ()
        ^bb2:  // pred: ^bb0
          "spirv.Store"(%5, %2) : (!spirv.ptr<i1, Function>, i1) -> ()
          "spirv.Branch"()[^bb3] : () -> ()
        ^bb3:  // 2 preds: ^bb1, ^bb2
          "spirv.mlir.merge"() : () -> ()
        }) : () -> ()
        %6 = "spirv.Load"(%5) : (!spirv.ptr<i1, Function>) -> i1
        "spirv.BranchConditional"(%6, %3)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 1, 0>}> : (i1, i64) -> ()
      ^bb2(%7: i64):  // pred: ^bb1
        %8 = "spirv.SLessThan"(%7, %0) : (i64, i64) -> i1
        "spirv.Store"(%5, %8) : (!spirv.ptr<i1, Function>, i1) -> ()
        "spirv.Branch"(%7)[^bb1] : (i64) -> ()
      ^bb3:  // pred: ^bb1
        "spirv.mlir.merge"() : () -> ()
      }) : () -> ()
      "spirv.Return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> (), sym_name = "loop_yield"}> ({
    ^bb0(%arg0: i32):
      %0 = "spirv.Constant"() <{value = 0 : i32}> : () -> i32
      %1 = "spirv.Constant"() <{value = 1 : i32}> : () -> i32
      %2 = "spirv.Variable"(%0) <{storage_class = #spirv.storage_class<Function>}> : (i32) -> !spirv.ptr<i32, Function>
      %3 = "spirv.mlir.loop"() <{loop_control = #spirv.loop_control<None>}> ({
        "spirv.Branch"(%0)[^bb1] : (i32) -> ()
      ^bb1(%4: i32):  // 2 preds: ^bb0, ^bb3
        %5 = "spirv.SLessThan"(%4, %arg0) : (i32, i32) -> i1
        "spirv.BranchConditional"(%5)[^bb2, ^bb4] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^bb2:  // pred: ^bb1
        "spirv.Branch"()[^bb3] : () -> ()
      ^bb3:  // pred: ^bb2
        %6 = "spirv.IAdd"(%4, %1) : (i32, i32) -> i32
        "spirv.Branch"(%6)[^bb1] : (i32) -> ()
      ^bb4:  // pred: ^bb1
        "spirv.mlir.merge"(%4) : (i32) -> ()
      }) : () -> i32
      "spirv.Store"(%2, %3) : (!spirv.ptr<i32, Function>, i32) -> ()
      "spirv.Return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

