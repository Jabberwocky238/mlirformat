"builtin.module"() ({
  "func.func"() <{function_type = (() -> ()) -> (), sym_name = "second_order_arg", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (() -> ()), sym_name = "second_order_result", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":4:3)
  "func.func"() <{function_type = () -> (() -> i32, () -> i64, () -> f32), sym_name = "second_order_multi_result", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = (memref<?xf32>) -> (), sym_name = "memref_call_conv", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = ((memref<?xf32>) -> ()) -> (), sym_name = "memref_call_conv_nested", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":10:3)
  "func.func"() <{function_type = (() -> ()) -> (() -> ()), sym_name = "pass_through"}> ({
  ^bb0(%arg4: () -> () loc("<stdin>":13:8)):
    "cf.br"(%arg4)[^bb1] : (() -> ()) -> () loc("<stdin>":14:5)
  ^bb1(%2: () -> () loc("<stdin>":15:8)):  // pred: ^bb0
    "func.return"(%2) : (() -> ()) -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (i32) -> (), sym_name = "llvmlinkage", sym_visibility = "private"}> ({
  }) {llvm.linkage = #llvm.linkage<extern_weak>} : () -> () loc("<stdin>":18:3)
  "func.func"() <{function_type = (i32) -> (), sym_name = "llvmreadnone", sym_visibility = "private"}> ({
  }) {llvm.readnone} : () -> () loc("<stdin>":20:3)
  "func.func"() <{function_type = (i32) -> (), sym_name = "body", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":22:3)
  "func.func"() <{function_type = (i32) -> (), sym_name = "indirect_const_call"}> ({
  ^bb0(%arg3: i32 loc("<stdin>":25:8)):
    %1 = "func.constant"() <{value = @body}> : () -> ((i32) -> ()) loc("<stdin>":26:10)
    "func.call_indirect"(%1, %arg3) : ((i32) -> (), i32) -> () loc("<stdin>":27:5)
    "func.return"() : () -> () loc("<stdin>":28:5)
  }) : () -> () loc("<stdin>":24:3)
  "func.func"() <{function_type = ((f32) -> i32, f32) -> i32, sym_name = "indirect_call"}> ({
  ^bb0(%arg1: (f32) -> i32 loc("<stdin>":31:8), %arg2: f32 loc("<stdin>":31:29)):
    %0 = "func.call_indirect"(%arg1, %arg2) : ((f32) -> i32, f32) -> i32 loc("<stdin>":32:10)
    "func.return"(%0) : (i32) -> () loc("<stdin>":33:5)
  }) : () -> () loc("<stdin>":30:3)
  "func.func"() <{function_type = (i32) -> (), sym_name = "variadic_func"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":36:8)):
    "func.return"() : () -> () loc("<stdin>":37:5)
  }) {func.varargs = true} : () -> () loc("<stdin>":35:3)
  "func.func"() <{function_type = () -> (), sym_name = "target_cpu", sym_visibility = "private"}> ({
  }) {llvm.target_cpu = "gfx90a"} : () -> () loc("<stdin>":39:3)
  "func.func"() <{function_type = () -> (), sym_name = "target_features", sym_visibility = "private"}> ({
  }) {llvm.target_features = #llvm.target_features<["+sme", "+sve"]>} : () -> () loc("<stdin>":41:3)
  "func.func"() <{function_type = () -> (), sym_name = "passthrough_attr", sym_visibility = "private"}> ({
  }) {llvm.passthrough = ["presplitcoroutine"]} : () -> () loc("<stdin>":43:3)
}) : () -> () loc("<stdin>":1:1)
