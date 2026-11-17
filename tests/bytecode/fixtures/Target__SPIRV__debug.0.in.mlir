"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.3, [Shader, GroupNonUniformArithmetic], [SPV_KHR_non_semantic_info, SPV_KHR_storage_buffer_storage_class]>}> ({
    "spirv.GlobalVariable"() <{binding = 1 : i32, descriptor_set = 0 : i32, sym_name = "var0", type = !spirv.ptr<f32, Input>}> : () -> () loc("<stdin>":3:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xf32>, vector<4xf32>) -> (), sym_name = "arithmetic"}> ({
    ^bb0(%arg18: vector<4xf32> loc("<stdin>":5:10), %arg19: vector<4xf32> loc("<stdin>":5:33)):
      %27 = "spirv.FAdd"(%arg18, %arg19) : (vector<4xf32>, vector<4xf32>) -> vector<4xf32> loc("<stdin>":6:13)
      %28 = "spirv.FNegate"(%arg18) : (vector<4xf32>) -> vector<4xf32> loc("<stdin>":7:13)
      "spirv.Return"() : () -> () loc("<stdin>":8:7)
    }) : () -> () loc("<stdin>":4:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<i32, Workgroup>, i32, i32) -> (), sym_name = "atomic"}> ({
    ^bb0(%arg15: !spirv.ptr<i32, Workgroup> loc("<stdin>":11:10), %arg16: i32 loc("<stdin>":11:46), %arg17: i32 loc("<stdin>":11:59)):
      %26 = "spirv.AtomicAnd"(%arg15, %arg16) <{memory_scope = #spirv.scope<Device>, semantics = #spirv.memory_semantics<None>}> : (!spirv.ptr<i32, Workgroup>, i32) -> i32 loc("<stdin>":12:13)
      "spirv.Return"() : () -> () loc("<stdin>":13:7)
    }) : () -> () loc("<stdin>":10:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32, i32) -> (), sym_name = "bitwiser"}> ({
    ^bb0(%arg13: i32 loc("<stdin>":16:10), %arg14: i32 loc("<stdin>":16:23)):
      %25 = "spirv.BitwiseAnd"(%arg13, %arg14) : (i32, i32) -> i32 loc("<stdin>":17:13)
      "spirv.Return"() : () -> () loc("<stdin>":18:7)
    }) : () -> () loc("<stdin>":15:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> (), sym_name = "convert"}> ({
    ^bb0(%arg12: f32 loc("<stdin>":21:10)):
      %24 = "spirv.ConvertFToU"(%arg12) : (f32) -> i32 loc("<stdin>":22:13)
      "spirv.Return"() : () -> () loc("<stdin>":23:7)
    }) : () -> () loc("<stdin>":20:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.struct<(f32, !spirv.struct<(!spirv.array<4 x f32>, f32)>)>, !spirv.array<4 x f32>, f32, f32) -> (), sym_name = "composite"}> ({
    ^bb0(%arg8: !spirv.struct<(f32, !spirv.struct<(!spirv.array<4 x f32>, f32)>)> loc("<stdin>":26:10), %arg9: !spirv.array<4 x f32> loc("<stdin>":26:84), %arg10: f32 loc("<stdin>":26:114), %arg11: f32 loc("<stdin>":26:127)):
      %22 = "spirv.CompositeInsert"(%arg9, %arg8) <{indices = [1 : i32, 0 : i32]}> : (!spirv.array<4 x f32>, !spirv.struct<(f32, !spirv.struct<(!spirv.array<4 x f32>, f32)>)>) -> !spirv.struct<(f32, !spirv.struct<(!spirv.array<4 x f32>, f32)>)> loc("<stdin>":27:13)
      %23 = "spirv.CompositeConstruct"(%arg10, %arg11) : (f32, f32) -> vector<2xf32> loc("<stdin>":28:13)
      "spirv.Return"() : () -> () loc("<stdin>":29:7)
    }) : () -> () loc("<stdin>":25:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> (), sym_name = "group_non_uniform"}> ({
    ^bb0(%arg7: f32 loc("<stdin>":32:10)):
      %21 = "spirv.GroupNonUniformFAdd"(%arg7) <{execution_scope = #spirv.scope<Workgroup>, group_operation = #spirv.group_operation<Reduce>}> : (f32) -> f32 loc("<stdin>":33:13)
      "spirv.Return"() : () -> () loc("<stdin>":34:7)
    }) : () -> () loc("<stdin>":31:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "local_var"}> ({
      %19 = "spirv.Constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":37:13)
      %20 = "spirv.Variable"(%19) <{storage_class = #spirv.storage_class<Function>}> : (i32) -> !spirv.ptr<i32, Function> loc("<stdin>":38:13)
      "spirv.Return"() : () -> () loc("<stdin>":39:7)
    }) : () -> () loc("<stdin>":36:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32, i32) -> (), sym_name = "logical"}> ({
    ^bb0(%arg5: i32 loc("<stdin>":42:10), %arg6: i32 loc("<stdin>":42:22)):
      %18 = "spirv.IEqual"(%arg5, %arg6) : (i32, i32) -> i1 loc("<stdin>":43:13)
      "spirv.Return"() : () -> () loc("<stdin>":44:7)
    }) : () -> () loc("<stdin>":41:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<!spirv.array<4 x !spirv.array<4 x f32>>, StorageBuffer>, i32, i32) -> (), sym_name = "memory_accesses"}> ({
    ^bb0(%arg2: !spirv.ptr<!spirv.array<4 x !spirv.array<4 x f32>>, StorageBuffer> loc("<stdin>":47:10), %arg3: i32 loc("<stdin>":47:85), %arg4: i32 loc("<stdin>":47:97)):
      %16 = "spirv.AccessChain"(%arg2, %arg3, %arg4) : (!spirv.ptr<!spirv.array<4 x !spirv.array<4 x f32>>, StorageBuffer>, i32, i32) -> !spirv.ptr<f32, StorageBuffer> loc("<stdin>":48:13)
      %17 = "spirv.Load"(%16) : (!spirv.ptr<f32, StorageBuffer>) -> f32 loc("<stdin>":49:13)
      "spirv.Store"(%16, %17) : (!spirv.ptr<f32, StorageBuffer>, f32) -> () loc("<stdin>":50:7)
      "spirv.Return"() : () -> () loc("<stdin>":51:7)
    }) : () -> () loc("<stdin>":46:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> (), sym_name = "loop"}> ({
    ^bb0(%arg1: i32 loc("<stdin>":54:10)):
      %4 = "spirv.Constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":55:12)
      %5 = "spirv.Constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":56:12)
      %6 = "spirv.Variable"(%4) <{storage_class = #spirv.storage_class<Function>}> : (i32) -> !spirv.ptr<i32, Function> loc("<stdin>":57:12)
      %7 = "spirv.Variable"(%4) <{storage_class = #spirv.storage_class<Function>}> : (i32) -> !spirv.ptr<i32, Function> loc("<stdin>":58:12)
      "spirv.mlir.loop"() <{loop_control = #spirv.loop_control<None>}> ({
        "spirv.Branch"()[^bb1] : () -> () loc("<stdin>":60:9)
      ^bb1:  // 2 preds: ^bb0, ^bb3
        %8 = "spirv.Load"(%6) : (!spirv.ptr<i32, Function>) -> i32 loc("<stdin>":62:14)
        %9 = "spirv.SLessThan"(%8, %arg1) : (i32, i32) -> i1 loc("<stdin>":63:14)
        "spirv.BranchConditional"(%9)[^bb2, ^bb4] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":64:9)
      ^bb2:  // pred: ^bb1
        "spirv.Store"(%7, %4) : (!spirv.ptr<i32, Function>, i32) -> () loc("<stdin>":66:9)
        "spirv.mlir.loop"() <{loop_control = #spirv.loop_control<None>}> ({
          "spirv.Branch"()[^bb1] : () -> () loc("<stdin>":68:11)
        ^bb1:  // 2 preds: ^bb0, ^bb3
          %12 = "spirv.Load"(%7) : (!spirv.ptr<i32, Function>) -> i32 loc("<stdin>":70:17)
          %13 = "spirv.SLessThan"(%12, %arg1) : (i32, i32) -> i1 loc("<stdin>":71:17)
          "spirv.BranchConditional"(%13)[^bb2, ^bb4] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":72:11)
        ^bb2:  // pred: ^bb1
          "spirv.Branch"()[^bb3] : () -> () loc("<stdin>":74:11)
        ^bb3:  // pred: ^bb2
          %14 = "spirv.Load"(%7) : (!spirv.ptr<i32, Function>) -> i32 loc("<stdin>":76:17)
          %15 = "spirv.IAdd"(%14, %5) : (i32, i32) -> i32 loc("<stdin>":77:17)
          "spirv.Store"(%7, %15) : (!spirv.ptr<i32, Function>, i32) -> () loc("<stdin>":78:11)
          "spirv.Branch"()[^bb1] : () -> () loc("<stdin>":79:11)
        ^bb4:  // pred: ^bb1
          "spirv.mlir.merge"() : () -> () loc("<stdin>":81:11)
        }) : () -> () loc("<stdin>":67:9)
        "spirv.Branch"()[^bb3] : () -> () loc("<stdin>":83:9)
      ^bb3:  // pred: ^bb2
        %10 = "spirv.Load"(%6) : (!spirv.ptr<i32, Function>) -> i32 loc("<stdin>":85:15)
        %11 = "spirv.IAdd"(%10, %5) : (i32, i32) -> i32 loc("<stdin>":86:15)
        "spirv.Store"(%6, %11) : (!spirv.ptr<i32, Function>, i32) -> () loc("<stdin>":87:9)
        "spirv.Branch"()[^bb1] : () -> () loc("<stdin>":88:9)
      ^bb4:  // pred: ^bb1
        "spirv.mlir.merge"() : () -> () loc("<stdin>":90:9)
      }) : () -> () loc("<stdin>":59:7)
      "spirv.Return"() : () -> () loc("<stdin>":92:7)
    }) : () -> () loc("<stdin>":53:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i1) -> (), sym_name = "selection"}> ({
    ^bb0(%arg0: i1 loc("<stdin>":95:10)):
      %0 = "spirv.Constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":96:12)
      %1 = "spirv.Constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":97:12)
      %2 = "spirv.Constant"() <{value = 2 : i32}> : () -> i32 loc("<stdin>":98:12)
      %3 = "spirv.Variable"(%0) <{storage_class = #spirv.storage_class<Function>}> : (i32) -> !spirv.ptr<i32, Function> loc("<stdin>":99:12)
      "spirv.mlir.selection"() <{selection_control = #spirv.selection_control<None>}> ({
        "spirv.BranchConditional"(%arg0)[^bb1, ^bb2] <{branch_weights = [5 : i32, 10 : i32], operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":101:9)
      ^bb1:  // pred: ^bb0
        "spirv.Store"(%3, %1) : (!spirv.ptr<i32, Function>, i32) -> () loc("<stdin>":103:9)
        "spirv.Branch"()[^bb3] : () -> () loc("<stdin>":104:9)
      ^bb2:  // pred: ^bb0
        "spirv.Store"(%3, %2) : (!spirv.ptr<i32, Function>, i32) -> () loc("<stdin>":106:9)
        "spirv.Branch"()[^bb3] : () -> () loc("<stdin>":107:9)
      ^bb3:  // 2 preds: ^bb1, ^bb2
        "spirv.mlir.merge"() : () -> () loc("<stdin>":109:9)
      }) : () -> () loc("<stdin>":100:7)
      "spirv.Return"() : () -> () loc("<stdin>":111:7)
    }) : () -> () loc("<stdin>":94:5)
    "spirv.EntryPoint"() <{execution_model = #spirv.execution_model<GLCompute>, fn = @local_var, interface = []}> : () -> () loc("<stdin>":113:5)
  }) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.3, [Shader, GroupNonUniformArithmetic], [SPV_KHR_non_semantic_info, SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
