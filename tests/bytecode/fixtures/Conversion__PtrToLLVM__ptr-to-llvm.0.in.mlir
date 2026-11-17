"builtin.module"() ({
  "func.func"() <{function_type = (!ptr.ptr<#ptr.generic_space>, index) -> (!ptr.ptr<#ptr.generic_space>, !ptr.ptr<#ptr.generic_space>, !ptr.ptr<#ptr.generic_space>, !ptr.ptr<#ptr.generic_space>), sym_name = "test_ptr_add"}> ({
  ^bb0(%arg13: !ptr.ptr<#ptr.generic_space> loc("<stdin>":3:8), %arg14: index loc("<stdin>":3:46)):
    %28 = "ptr.ptr_add"(%arg13, %arg14) <{flags = 0 : i32}> : (!ptr.ptr<#ptr.generic_space>, index) -> !ptr.ptr<#ptr.generic_space> loc("<stdin>":4:11)
    %29 = "ptr.ptr_add"(%arg13, %arg14) <{flags = 1 : i32}> : (!ptr.ptr<#ptr.generic_space>, index) -> !ptr.ptr<#ptr.generic_space> loc("<stdin>":5:11)
    %30 = "ptr.ptr_add"(%arg13, %arg14) <{flags = 2 : i32}> : (!ptr.ptr<#ptr.generic_space>, index) -> !ptr.ptr<#ptr.generic_space> loc("<stdin>":6:11)
    %31 = "ptr.ptr_add"(%arg13, %arg14) <{flags = 3 : i32}> : (!ptr.ptr<#ptr.generic_space>, index) -> !ptr.ptr<#ptr.generic_space> loc("<stdin>":7:11)
    "func.return"(%28, %29, %30, %31) : (!ptr.ptr<#ptr.generic_space>, !ptr.ptr<#ptr.generic_space>, !ptr.ptr<#ptr.generic_space>, !ptr.ptr<#ptr.generic_space>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (index, index, index), sym_name = "test_type_offset"}> ({
    %25 = "ptr.type_offset"() <{elementType = f32}> : () -> index loc("<stdin>":11:11)
    %26 = "ptr.type_offset"() <{elementType = i64}> : () -> index loc("<stdin>":12:11)
    %27 = "ptr.type_offset"() <{elementType = !llvm.struct<(i32, f64)>}> : () -> index loc("<stdin>":13:11)
    "func.return"(%25, %26, %27) : (index, index, index) -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":10:3)
  "func.func"() <{function_type = (memref<10xf32, #ptr.generic_space>) -> !ptr.ptr<#ptr.generic_space>, sym_name = "test_to_ptr"}> ({
  ^bb0(%arg12: memref<10xf32, #ptr.generic_space> loc("<stdin>":17:8)):
    %24 = "ptr.to_ptr"(%arg12) : (memref<10xf32, #ptr.generic_space>) -> !ptr.ptr<#ptr.generic_space> loc("<stdin>":18:11)
    "func.return"(%24) : (!ptr.ptr<#ptr.generic_space>) -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":16:3)
  "func.func"() <{function_type = (memref<10x20xf32, #ptr.generic_space>) -> !ptr.ptr_metadata<memref<10x20xf32, #ptr.generic_space>>, sym_name = "test_get_metadata_static"}> ({
  ^bb0(%arg11: memref<10x20xf32, #ptr.generic_space> loc("<stdin>":22:8)):
    %23 = "ptr.get_metadata"(%arg11) : (memref<10x20xf32, #ptr.generic_space>) -> !ptr.ptr_metadata<memref<10x20xf32, #ptr.generic_space>> loc("<stdin>":23:11)
    "func.return"(%23) : (!ptr.ptr_metadata<memref<10x20xf32, #ptr.generic_space>>) -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":21:3)
  "func.func"() <{function_type = (memref<?x?xf32, #ptr.generic_space>) -> !ptr.ptr_metadata<memref<?x?xf32, #ptr.generic_space>>, sym_name = "test_get_metadata_dynamic"}> ({
  ^bb0(%arg10: memref<?x?xf32, #ptr.generic_space> loc("<stdin>":27:8)):
    %22 = "ptr.get_metadata"(%arg10) : (memref<?x?xf32, #ptr.generic_space>) -> !ptr.ptr_metadata<memref<?x?xf32, #ptr.generic_space>> loc("<stdin>":28:11)
    "func.return"(%22) : (!ptr.ptr_metadata<memref<?x?xf32, #ptr.generic_space>>) -> () loc("<stdin>":29:5)
  }) : () -> () loc("<stdin>":26:3)
  "func.func"() <{function_type = (!ptr.ptr<#ptr.generic_space>, !ptr.ptr_metadata<memref<10x20xf32, #ptr.generic_space>>) -> memref<10x20xf32, #ptr.generic_space>, sym_name = "test_from_ptr_static"}> ({
  ^bb0(%arg8: !ptr.ptr<#ptr.generic_space> loc("<stdin>":32:8), %arg9: !ptr.ptr_metadata<memref<10x20xf32, #ptr.generic_space>> loc("<stdin>":32:45)):
    %21 = "ptr.from_ptr"(%arg8, %arg9) : (!ptr.ptr<#ptr.generic_space>, !ptr.ptr_metadata<memref<10x20xf32, #ptr.generic_space>>) -> memref<10x20xf32, #ptr.generic_space> loc("<stdin>":33:11)
    "func.return"(%21) : (memref<10x20xf32, #ptr.generic_space>) -> () loc("<stdin>":34:5)
  }) : () -> () loc("<stdin>":31:3)
  "func.func"() <{function_type = (!ptr.ptr<#ptr.generic_space>, !ptr.ptr_metadata<memref<?x?xf32, #ptr.generic_space>>) -> memref<?x?xf32, #ptr.generic_space>, sym_name = "test_from_ptr_dynamic"}> ({
  ^bb0(%arg6: !ptr.ptr<#ptr.generic_space> loc("<stdin>":37:8), %arg7: !ptr.ptr_metadata<memref<?x?xf32, #ptr.generic_space>> loc("<stdin>":37:45)):
    %20 = "ptr.from_ptr"(%arg6, %arg7) : (!ptr.ptr<#ptr.generic_space>, !ptr.ptr_metadata<memref<?x?xf32, #ptr.generic_space>>) -> memref<?x?xf32, #ptr.generic_space> loc("<stdin>":38:11)
    "func.return"(%20) : (memref<?x?xf32, #ptr.generic_space>) -> () loc("<stdin>":39:5)
  }) : () -> () loc("<stdin>":36:3)
  "func.func"() <{function_type = (memref<10x?x30xf32, #ptr.generic_space>) -> memref<10x?x30xf32, #ptr.generic_space>, sym_name = "test_memref_mixed"}> ({
  ^bb0(%arg5: memref<10x?x30xf32, #ptr.generic_space> loc("<stdin>":42:8)):
    %17 = "ptr.to_ptr"(%arg5) : (memref<10x?x30xf32, #ptr.generic_space>) -> !ptr.ptr<#ptr.generic_space> loc("<stdin>":43:11)
    %18 = "ptr.get_metadata"(%arg5) : (memref<10x?x30xf32, #ptr.generic_space>) -> !ptr.ptr_metadata<memref<10x?x30xf32, #ptr.generic_space>> loc("<stdin>":44:11)
    %19 = "ptr.from_ptr"(%17, %18) : (!ptr.ptr<#ptr.generic_space>, !ptr.ptr_metadata<memref<10x?x30xf32, #ptr.generic_space>>) -> memref<10x?x30xf32, #ptr.generic_space> loc("<stdin>":45:11)
    "func.return"(%19) : (memref<10x?x30xf32, #ptr.generic_space>) -> () loc("<stdin>":46:5)
  }) : () -> () loc("<stdin>":41:3)
  "func.func"() <{function_type = (memref<10x20xf32, strided<[40, 2], offset: 5>, #ptr.generic_space>) -> memref<10x20xf32, strided<[40, 2], offset: 5>, #ptr.generic_space>, sym_name = "test_memref_strided"}> ({
  ^bb0(%arg4: memref<10x20xf32, strided<[40, 2], offset: 5>, #ptr.generic_space> loc("<stdin>":49:8)):
    %14 = "ptr.to_ptr"(%arg4) : (memref<10x20xf32, strided<[40, 2], offset: 5>, #ptr.generic_space>) -> !ptr.ptr<#ptr.generic_space> loc("<stdin>":50:11)
    %15 = "ptr.get_metadata"(%arg4) : (memref<10x20xf32, strided<[40, 2], offset: 5>, #ptr.generic_space>) -> !ptr.ptr_metadata<memref<10x20xf32, strided<[40, 2], offset: 5>, #ptr.generic_space>> loc("<stdin>":51:11)
    %16 = "ptr.from_ptr"(%14, %15) : (!ptr.ptr<#ptr.generic_space>, !ptr.ptr_metadata<memref<10x20xf32, strided<[40, 2], offset: 5>, #ptr.generic_space>>) -> memref<10x20xf32, strided<[40, 2], offset: 5>, #ptr.generic_space> loc("<stdin>":52:11)
    "func.return"(%16) : (memref<10x20xf32, strided<[40, 2], offset: 5>, #ptr.generic_space>) -> () loc("<stdin>":53:5)
  }) : () -> () loc("<stdin>":48:3)
  "func.func"() <{function_type = (memref<?x?xf32, strided<[?, ?], offset: ?>, #ptr.generic_space>) -> memref<?x?xf32, strided<[?, ?], offset: ?>, #ptr.generic_space>, sym_name = "test_comprehensive_dynamic"}> ({
  ^bb0(%arg3: memref<?x?xf32, strided<[?, ?], offset: ?>, #ptr.generic_space> loc("<stdin>":56:8)):
    %9 = "ptr.to_ptr"(%arg3) : (memref<?x?xf32, strided<[?, ?], offset: ?>, #ptr.generic_space>) -> !ptr.ptr<#ptr.generic_space> loc("<stdin>":57:10)
    %10 = "ptr.get_metadata"(%arg3) : (memref<?x?xf32, strided<[?, ?], offset: ?>, #ptr.generic_space>) -> !ptr.ptr_metadata<memref<?x?xf32, strided<[?, ?], offset: ?>, #ptr.generic_space>> loc("<stdin>":58:11)
    %11 = "ptr.type_offset"() <{elementType = f32}> : () -> index loc("<stdin>":59:11)
    %12 = "ptr.ptr_add"(%9, %11) <{flags = 3 : i32}> : (!ptr.ptr<#ptr.generic_space>, index) -> !ptr.ptr<#ptr.generic_space> loc("<stdin>":60:11)
    %13 = "ptr.from_ptr"(%12, %10) : (!ptr.ptr<#ptr.generic_space>, !ptr.ptr_metadata<memref<?x?xf32, strided<[?, ?], offset: ?>, #ptr.generic_space>>) -> memref<?x?xf32, strided<[?, ?], offset: ?>, #ptr.generic_space> loc("<stdin>":61:11)
    "func.return"(%13) : (memref<?x?xf32, strided<[?, ?], offset: ?>, #ptr.generic_space>) -> () loc("<stdin>":62:5)
  }) : () -> () loc("<stdin>":55:3)
  "func.func"() <{function_type = (memref<f32, #ptr.generic_space>) -> memref<f32, #ptr.generic_space>, sym_name = "test_memref_0d"}> ({
  ^bb0(%arg2: memref<f32, #ptr.generic_space> loc("<stdin>":65:8)):
    %6 = "ptr.to_ptr"(%arg2) : (memref<f32, #ptr.generic_space>) -> !ptr.ptr<#ptr.generic_space> loc("<stdin>":66:10)
    %7 = "ptr.get_metadata"(%arg2) : (memref<f32, #ptr.generic_space>) -> !ptr.ptr_metadata<memref<f32, #ptr.generic_space>> loc("<stdin>":67:10)
    %8 = "ptr.from_ptr"(%6, %7) : (!ptr.ptr<#ptr.generic_space>, !ptr.ptr_metadata<memref<f32, #ptr.generic_space>>) -> memref<f32, #ptr.generic_space> loc("<stdin>":68:10)
    "func.return"(%8) : (memref<f32, #ptr.generic_space>) -> () loc("<stdin>":69:5)
  }) : () -> () loc("<stdin>":64:3)
  "func.func"() <{function_type = (memref<10x?x30xf32, #ptr.generic_space>, index) -> !ptr.ptr<#ptr.generic_space>, sym_name = "test_memref_ptradd_indexing"}> ({
  ^bb0(%arg0: memref<10x?x30xf32, #ptr.generic_space> loc("<stdin>":72:8), %arg1: index loc("<stdin>":72:56)):
    %2 = "ptr.to_ptr"(%arg0) : (memref<10x?x30xf32, #ptr.generic_space>) -> !ptr.ptr<#ptr.generic_space> loc("<stdin>":73:10)
    %3 = "ptr.type_offset"() <{elementType = f32}> : () -> index loc("<stdin>":74:10)
    %4 = "arith.muli"(%3, %arg1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":75:10)
    %5 = "ptr.ptr_add"(%2, %4) <{flags = 0 : i32}> : (!ptr.ptr<#ptr.generic_space>, index) -> !ptr.ptr<#ptr.generic_space> loc("<stdin>":76:10)
    "func.return"(%5) : (!ptr.ptr<#ptr.generic_space>) -> () loc("<stdin>":77:5)
  }) : () -> () loc("<stdin>":71:3)
  "func.func"() <{function_type = () -> (!ptr.ptr<#ptr.generic_space>, !ptr.ptr<#ptr.generic_space>), sym_name = "test_constant_address_ops"}> ({
    %0 = "ptr.constant"() <{value = #ptr.address<0> : !ptr.ptr<#ptr.generic_space>}> : () -> !ptr.ptr<#ptr.generic_space> loc("<stdin>":80:10)
    %1 = "ptr.constant"() <{value = #ptr.null : !ptr.ptr<#ptr.generic_space>}> : () -> !ptr.ptr<#ptr.generic_space> loc("<stdin>":81:10)
    "func.return"(%0, %1) : (!ptr.ptr<#ptr.generic_space>, !ptr.ptr<#ptr.generic_space>) -> () loc("<stdin>":82:5)
  }) : () -> () loc("<stdin>":79:3)
}) : () -> () loc("<stdin>":1:1)
