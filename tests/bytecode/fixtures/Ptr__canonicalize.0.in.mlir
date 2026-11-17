"builtin.module"() ({
  "func.func"() <{function_type = (!ptr.ptr<#ptr.generic_space>) -> !ptr.ptr<#ptr.generic_space>, sym_name = "zero_offset"}> ({
  ^bb0(%arg11: !ptr.ptr<#ptr.generic_space> loc("<stdin>":3:8)):
    %27 = "index.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:11)
    %28 = "ptr.ptr_add"(%arg11, %27) <{flags = 0 : i32}> : (!ptr.ptr<#ptr.generic_space>, index) -> !ptr.ptr<#ptr.generic_space> loc("<stdin>":5:11)
    "func.return"(%28) : (!ptr.ptr<#ptr.generic_space>) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<f32, #ptr.generic_space>) -> memref<f32, #ptr.generic_space>, sym_name = "test_from_ptr_0"}> ({
  ^bb0(%arg10: memref<f32, #ptr.generic_space> loc("<stdin>":9:8)):
    %24 = "ptr.to_ptr"(%arg10) : (memref<f32, #ptr.generic_space>) -> !ptr.ptr<#ptr.generic_space> loc("<stdin>":10:11)
    %25 = "ptr.get_metadata"(%arg10) : (memref<f32, #ptr.generic_space>) -> !ptr.ptr_metadata<memref<f32, #ptr.generic_space>> loc("<stdin>":11:11)
    %26 = "ptr.from_ptr"(%24, %25) : (!ptr.ptr<#ptr.generic_space>, !ptr.ptr_metadata<memref<f32, #ptr.generic_space>>) -> memref<f32, #ptr.generic_space> loc("<stdin>":12:11)
    "func.return"(%26) : (memref<f32, #ptr.generic_space>) -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = (memref<f32, #ptr.generic_space>) -> memref<f32, #ptr.generic_space>, sym_name = "test_from_ptr_1"}> ({
  ^bb0(%arg9: memref<f32, #ptr.generic_space> loc("<stdin>":16:8)):
    %22 = "ptr.to_ptr"(%arg9) : (memref<f32, #ptr.generic_space>) -> !ptr.ptr<#ptr.generic_space> loc("<stdin>":17:11)
    %23 = "ptr.from_ptr"(%22) : (!ptr.ptr<#ptr.generic_space>) -> memref<f32, #ptr.generic_space> loc("<stdin>":18:11)
    "func.return"(%23) : (memref<f32, #ptr.generic_space>) -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":15:3)
  "func.func"() <{function_type = (memref<f32, #ptr.generic_space>, !ptr.ptr_metadata<memref<f32, #ptr.generic_space>>) -> memref<f32, #ptr.generic_space>, sym_name = "test_from_ptr_2"}> ({
  ^bb0(%arg7: memref<f32, #ptr.generic_space> loc("<stdin>":22:8), %arg8: !ptr.ptr_metadata<memref<f32, #ptr.generic_space>> loc("<stdin>":22:48)):
    %20 = "ptr.to_ptr"(%arg7) : (memref<f32, #ptr.generic_space>) -> !ptr.ptr<#ptr.generic_space> loc("<stdin>":23:11)
    %21 = "ptr.from_ptr"(%20, %arg8) : (!ptr.ptr<#ptr.generic_space>, !ptr.ptr_metadata<memref<f32, #ptr.generic_space>>) -> memref<f32, #ptr.generic_space> loc("<stdin>":24:11)
    "func.return"(%21) : (memref<f32, #ptr.generic_space>) -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":21:3)
  "func.func"() <{function_type = (memref<f32, #ptr.generic_space>) -> memref<f32, #ptr.generic_space>, sym_name = "test_from_ptr_3"}> ({
  ^bb0(%arg6: memref<f32, #ptr.generic_space> loc("<stdin>":28:8)):
    %15 = "ptr.get_metadata"(%arg6) : (memref<f32, #ptr.generic_space>) -> !ptr.ptr_metadata<memref<f32, #ptr.generic_space>> loc("<stdin>":29:11)
    %16 = "ptr.to_ptr"(%arg6) : (memref<f32, #ptr.generic_space>) -> !ptr.ptr<#ptr.generic_space> loc("<stdin>":30:11)
    %17 = "ptr.from_ptr"(%16, %15) : (!ptr.ptr<#ptr.generic_space>, !ptr.ptr_metadata<memref<f32, #ptr.generic_space>>) -> memref<f32, #ptr.generic_space> loc("<stdin>":31:11)
    %18 = "ptr.to_ptr"(%17) : (memref<f32, #ptr.generic_space>) -> !ptr.ptr<#ptr.generic_space> loc("<stdin>":32:11)
    %19 = "ptr.from_ptr"(%18, %15) : (!ptr.ptr<#ptr.generic_space>, !ptr.ptr_metadata<memref<f32, #ptr.generic_space>>) -> memref<f32, #ptr.generic_space> loc("<stdin>":33:11)
    "func.return"(%19) : (memref<f32, #ptr.generic_space>) -> () loc("<stdin>":34:5)
  }) : () -> () loc("<stdin>":27:3)
  "func.func"() <{function_type = (!ptr.ptr<#ptr.generic_space>, !ptr.ptr_metadata<memref<f32, #ptr.generic_space>>) -> !ptr.ptr<#ptr.generic_space>, sym_name = "test_to_ptr_0"}> ({
  ^bb0(%arg4: !ptr.ptr<#ptr.generic_space> loc("<stdin>":37:8), %arg5: !ptr.ptr_metadata<memref<f32, #ptr.generic_space>> loc("<stdin>":37:45)):
    %13 = "ptr.from_ptr"(%arg4, %arg5) : (!ptr.ptr<#ptr.generic_space>, !ptr.ptr_metadata<memref<f32, #ptr.generic_space>>) -> memref<f32, #ptr.generic_space> loc("<stdin>":38:11)
    %14 = "ptr.to_ptr"(%13) : (memref<f32, #ptr.generic_space>) -> !ptr.ptr<#ptr.generic_space> loc("<stdin>":39:11)
    "func.return"(%14) : (!ptr.ptr<#ptr.generic_space>) -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":36:3)
  "func.func"() <{function_type = (!ptr.ptr<#ptr.generic_space>) -> !ptr.ptr<#ptr.generic_space>, sym_name = "test_to_ptr_1"}> ({
  ^bb0(%arg3: !ptr.ptr<#ptr.generic_space> loc("<stdin>":43:8)):
    %11 = "ptr.from_ptr"(%arg3) : (!ptr.ptr<#ptr.generic_space>) -> memref<f32, #ptr.generic_space> loc("<stdin>":44:11)
    %12 = "ptr.to_ptr"(%11) : (memref<f32, #ptr.generic_space>) -> !ptr.ptr<#ptr.generic_space> loc("<stdin>":45:11)
    "func.return"(%12) : (!ptr.ptr<#ptr.generic_space>) -> () loc("<stdin>":46:5)
  }) : () -> () loc("<stdin>":42:3)
  "func.func"() <{function_type = (!ptr.ptr<#ptr.generic_space>) -> !ptr.ptr<#ptr.generic_space>, sym_name = "test_to_ptr_2"}> ({
  ^bb0(%arg2: !ptr.ptr<#ptr.generic_space> loc("<stdin>":49:8)):
    %5 = "ptr.from_ptr"(%arg2) : (!ptr.ptr<#ptr.generic_space>) -> memref<f32, #ptr.generic_space> loc("<stdin>":50:10)
    %6 = "ptr.to_ptr"(%5) : (memref<f32, #ptr.generic_space>) -> !ptr.ptr<#ptr.generic_space> loc("<stdin>":51:10)
    %7 = "ptr.from_ptr"(%6) : (!ptr.ptr<#ptr.generic_space>) -> memref<f32, #ptr.generic_space> loc("<stdin>":52:10)
    %8 = "ptr.to_ptr"(%7) : (memref<f32, #ptr.generic_space>) -> !ptr.ptr<#ptr.generic_space> loc("<stdin>":53:10)
    %9 = "ptr.from_ptr"(%8) : (!ptr.ptr<#ptr.generic_space>) -> memref<f32, #ptr.generic_space> loc("<stdin>":54:10)
    %10 = "ptr.to_ptr"(%9) : (memref<f32, #ptr.generic_space>) -> !ptr.ptr<#ptr.generic_space> loc("<stdin>":55:11)
    "func.return"(%10) : (!ptr.ptr<#ptr.generic_space>) -> () loc("<stdin>":56:5)
  }) : () -> () loc("<stdin>":48:3)
  "func.func"() <{function_type = (memref<f32, #ptr.generic_space>, !ptr.ptr_metadata<memref<f32, #ptr.generic_space>>) -> memref<f32, #ptr.generic_space>, sym_name = "test_cast_chain_folding"}> ({
  ^bb0(%arg0: memref<f32, #ptr.generic_space> loc("<stdin>":59:8), %arg1: !ptr.ptr_metadata<memref<f32, #ptr.generic_space>> loc("<stdin>":59:48)):
    %0 = "ptr.to_ptr"(%arg0) : (memref<f32, #ptr.generic_space>) -> !ptr.ptr<#ptr.generic_space> loc("<stdin>":60:10)
    %1 = "ptr.from_ptr"(%0, %arg1) : (!ptr.ptr<#ptr.generic_space>, !ptr.ptr_metadata<memref<f32, #ptr.generic_space>>) -> memref<f32, #ptr.generic_space> loc("<stdin>":61:10)
    %2 = "ptr.to_ptr"(%1) : (memref<f32, #ptr.generic_space>) -> !ptr.ptr<#ptr.generic_space> loc("<stdin>":62:10)
    %3 = "ptr.get_metadata"(%arg0) : (memref<f32, #ptr.generic_space>) -> !ptr.ptr_metadata<memref<f32, #ptr.generic_space>> loc("<stdin>":63:10)
    %4 = "ptr.from_ptr"(%2, %3) : (!ptr.ptr<#ptr.generic_space>, !ptr.ptr_metadata<memref<f32, #ptr.generic_space>>) -> memref<f32, #ptr.generic_space> loc("<stdin>":64:10)
    "func.return"(%4) : (memref<f32, #ptr.generic_space>) -> () loc("<stdin>":65:5)
  }) : () -> () loc("<stdin>":58:3)
}) : () -> () loc("<stdin>":1:1)
