"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "tbaa1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: !llvm.ptr loc("<stdin>":18:8), %arg5: !llvm.ptr loc("<stdin>":18:26)):
    %8 = "llvm.mlir.constant"() <{value = 1 : i8}> : () -> i8 loc("<stdin>":19:10)
    "llvm.store"(%8, %arg4) <{ordering = 0 : i64, tbaa = [#llvm.tbaa_tag<base_type = <id = "omnipotent char", members = {<#llvm.tbaa_root<id = "Simple C/C++ TBAA">, 0>}>, access_type = <id = "omnipotent char", members = {<#llvm.tbaa_root<id = "Simple C/C++ TBAA">, 0>}>, offset = 0>]}> : (i8, !llvm.ptr) -> () loc("<stdin>":20:5)
    "llvm.store"(%8, %arg5) <{ordering = 0 : i64, tbaa = [#llvm.tbaa_tag<base_type = <id = "omnipotent char", members = {<#llvm.tbaa_root<id = "Other language TBAA">, 0>}>, access_type = <id = "omnipotent char", members = {<#llvm.tbaa_root<id = "Other language TBAA">, 0>}>, offset = 0>]}> : (i8, !llvm.ptr) -> () loc("<stdin>":21:5)
    "llvm.return"() : () -> () loc("<stdin>":22:5)
  }) : () -> () loc("<stdin>":17:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "tbaa2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: !llvm.ptr loc("<stdin>":25:8), %arg3: !llvm.ptr loc("<stdin>":25:26)):
    %2 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":26:10)
    %3 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":27:10)
    %4 = "llvm.getelementptr"(%arg3, %2) <{elem_type = !llvm.struct<"struct.agg2_t", (i64, i64)>, noWrapFlags = 3 : i32, rawConstantIndices = array<i32: -2147483648, 1>}> : (!llvm.ptr, i32) -> !llvm.ptr loc("<stdin>":28:10)
    %5 = "llvm.load"(%4) <{ordering = 0 : i64, tbaa = [#llvm.tbaa_tag<base_type = <id = "agg2_t", members = {<#llvm.tbaa_type_desc<id = "long long", members = {<#llvm.tbaa_type_desc<id = "omnipotent char", members = {<#llvm.tbaa_root<id = "Simple C/C++ TBAA">, 0>}>, 0>}>, 0>, <#llvm.tbaa_type_desc<id = "long long", members = {<#llvm.tbaa_type_desc<id = "omnipotent char", members = {<#llvm.tbaa_root<id = "Simple C/C++ TBAA">, 0>}>, 0>}>, 8>}>, access_type = <id = "long long", members = {<#llvm.tbaa_type_desc<id = "omnipotent char", members = {<#llvm.tbaa_root<id = "Simple C/C++ TBAA">, 0>}>, 0>}>, offset = 8>]}> : (!llvm.ptr) -> i64 loc("<stdin>":29:10)
    %6 = "llvm.trunc"(%5) <{overflowFlags = 0 : i32}> : (i64) -> i32 loc("<stdin>":30:10)
    %7 = "llvm.getelementptr"(%arg2, %2) <{elem_type = !llvm.struct<"struct.agg1_t", (i32, i32)>, noWrapFlags = 3 : i32, rawConstantIndices = array<i32: -2147483648, 0>}> : (!llvm.ptr, i32) -> !llvm.ptr loc("<stdin>":31:10)
    "llvm.store"(%6, %7) <{ordering = 0 : i64, tbaa = [#llvm.tbaa_tag<base_type = <id = "agg1_t", members = {<#llvm.tbaa_type_desc<id = "int", members = {<#llvm.tbaa_type_desc<id = "omnipotent char", members = {<#llvm.tbaa_root<id = "Simple C/C++ TBAA">, 0>}>, 0>}>, 0>, <#llvm.tbaa_type_desc<id = "int", members = {<#llvm.tbaa_type_desc<id = "omnipotent char", members = {<#llvm.tbaa_root<id = "Simple C/C++ TBAA">, 0>}>, 0>}>, 4>}>, access_type = <id = "int", members = {<#llvm.tbaa_type_desc<id = "omnipotent char", members = {<#llvm.tbaa_root<id = "Simple C/C++ TBAA">, 0>}>, 0>}>, offset = 0>]}> : (i32, !llvm.ptr) -> () loc("<stdin>":32:5)
    "llvm.return"() : () -> () loc("<stdin>":33:5)
  }) : () -> () loc("<stdin>":24:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "tbaa3", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg1: !llvm.ptr loc("<stdin>":36:8)):
    %1 = "llvm.mlir.constant"() <{value = 1 : i8}> : () -> i8 loc("<stdin>":37:10)
    "llvm.store"(%1, %arg1) <{ordering = 0 : i64, tbaa = [#llvm.tbaa_tag<base_type = <id = "omnipotent char", members = {<#llvm.tbaa_root<id = "Simple C/C++ TBAA">, 0>}>, access_type = <id = "omnipotent char", members = {<#llvm.tbaa_root<id = "Simple C/C++ TBAA">, 0>}>, offset = 0>, #llvm.tbaa_tag<base_type = <id = "omnipotent char", members = {<#llvm.tbaa_root<id = "Other language TBAA">, 0>}>, access_type = <id = "omnipotent char", members = {<#llvm.tbaa_root<id = "Other language TBAA">, 0>}>, offset = 0>]}> : (i8, !llvm.ptr) -> () loc("<stdin>":38:5)
    "llvm.return"() : () -> () loc("<stdin>":39:5)
  }) : () -> () loc("<stdin>":35:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "tbaa4", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":42:8)):
    %0 = "llvm.mlir.constant"() <{value = 1 : i8}> : () -> i8 loc("<stdin>":43:10)
    "llvm.store"(%0, %arg0) <{ordering = 0 : i64, tbaa = [#llvm.tbaa_tag<base_type = <id = "omnipotent char", members = {<#llvm.tbaa_root, 0>}>, access_type = <id = "omnipotent char", members = {<#llvm.tbaa_root, 0>}>, offset = 0>]}> : (i8, !llvm.ptr) -> () loc("<stdin>":44:5)
    "llvm.return"() : () -> () loc("<stdin>":45:5)
  }) : () -> () loc("<stdin>":41:3)
}) : () -> () loc("<stdin>":16:1)
