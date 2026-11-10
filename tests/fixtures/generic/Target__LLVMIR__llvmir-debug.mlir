#di_basic_type = #llvm.di_basic_type<tag = DW_TAG_base_type>
#di_basic_type1 = #llvm.di_basic_type<tag = DW_TAG_base_type, name = "si32", sizeInBits = 32, encoding = DW_ATE_signed>
#di_file = #llvm.di_file<"foo.mlir" in "/test/">
#di_namespace = #llvm.di_namespace<name = "toplevel", exportSymbols = true>
#di_null_type = #llvm.di_null_type
#di_compile_unit = #llvm.di_compile_unit<id = distinct[0]<>, sourceLanguage = DW_LANG_C, file = #di_file, producer = "MLIR", isOptimized = true, emissionKind = Full, isDebugInfoForProfiling = true, nameTableKind = None, splitDebugFilename = "test.dwo">
#di_composite_type = #llvm.di_composite_type<tag = DW_TAG_structure_type, name = "composite", file = #di_file, line = 42, sizeInBits = 64, alignInBits = 32, elements = #llvm.di_subrange<count = 4 : i64>>
#di_composite_type1 = #llvm.di_composite_type<tag = DW_TAG_array_type, name = "array", file = #di_file, baseType = #di_basic_type, flags = Vector, elements = #llvm.di_subrange<lowerBound = 0 : i64, upperBound = 4 : i64, stride = 1 : i64>>
#di_derived_type = #llvm.di_derived_type<tag = DW_TAG_pointer_type, baseType = #di_basic_type1, sizeInBits = 64, alignInBits = 32, offsetInBits = 8, extraData = #di_basic_type1>
#di_derived_type1 = #llvm.di_derived_type<tag = DW_TAG_pointer_type, name = "named", baseType = #di_basic_type1>
#di_derived_type2 = #llvm.di_derived_type<tag = DW_TAG_pointer_type, baseType = #di_basic_type1, sizeInBits = 64, alignInBits = 32, offsetInBits = 8, dwarfAddressSpace = 3>
#di_derived_type3 = #llvm.di_derived_type<tag = DW_TAG_pointer_type, file = #di_file, line = 42, scope = #di_file, baseType = #di_basic_type1>
#di_derived_type4 = #llvm.di_derived_type<tag = DW_TAG_pointer_type, baseType = #di_basic_type1, sizeInBits = 64, flags = "Artificial|ObjectPointer">
#di_namespace1 = #llvm.di_namespace<name = "nested", scope = #di_namespace, exportSymbols = false>
#di_subroutine_type = #llvm.di_subroutine_type<callingConvention = DW_CC_normal, types = #di_null_type, #di_basic_type, #di_derived_type, #di_derived_type1, #di_derived_type2, #di_derived_type3, #di_derived_type4, #di_composite_type, #di_composite_type1>
#di_subprogram = #llvm.di_subprogram<compileUnit = #di_compile_unit, scope = #di_namespace1, name = "func_with_debug", linkageName = "func_with_debug", file = #di_file, line = 3, scopeLine = 3, subprogramFlags = "Definition|Optimized", type = #di_subroutine_type>
#di_lexical_block = #llvm.di_lexical_block<scope = #di_subprogram>
#di_lexical_block_file = #llvm.di_lexical_block_file<scope = #di_subprogram, file = #di_file, discriminator = 0>
#di_local_variable = #llvm.di_local_variable<scope = #di_lexical_block_file, name = "arg", file = #di_file, line = 6, arg = 1, alignInBits = 32, type = #di_basic_type>
#di_local_variable1 = #llvm.di_local_variable<scope = #di_lexical_block, name = "alloc">
#di_local_variable2 = #llvm.di_local_variable<scope = #di_lexical_block>
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "callee", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "func_with_empty_named_info", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @callee, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "func_no_debug", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64)>, linkage = #llvm.linkage<external>, sym_name = "func_with_debug", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64):
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "llvm.alloca"(%0) <{elem_type = i64}> : (i32) -> !llvm.ptr
    "llvm.intr.dbg.value"(%arg0) <{locationExpr = #llvm.di_expression<[DW_OP_LLVM_fragment(0, 1)]>, varInfo = #di_local_variable}> : (i64) -> ()
    "llvm.intr.dbg.declare"(%1) <{locationExpr = #llvm.di_expression<[DW_OP_deref, DW_OP_LLVM_convert(4, DW_ATE_signed)]>, varInfo = #di_local_variable1}> : (!llvm.ptr) -> ()
    "llvm.intr.dbg.value"(%arg0) <{locationExpr = #llvm.di_expression<>, varInfo = #di_local_variable2}> : (i64) -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @func_no_debug, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @func_no_debug, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @func_no_debug, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @func_no_debug, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @func_no_debug, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @func_no_debug, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @func_no_debug, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    %2 = "llvm.add"(%arg0, %arg0) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "empty_types", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 ()>, linkage = #llvm.linkage<external>, sym_name = "func_decl_with_subprogram", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) : () -> ()

// -----
#di_basic_type = #llvm.di_basic_type<tag = DW_TAG_base_type, name = "int", sizeInBits = 32, encoding = DW_ATE_signed>
#di_file = #llvm.di_file<"foo.mlir" in "/test/">
#di_null_type = #llvm.di_null_type
#di_compile_unit = #llvm.di_compile_unit<id = distinct[0]<>, sourceLanguage = DW_LANG_C, file = #di_file, producer = "MLIR", isOptimized = true, emissionKind = Full, isDebugInfoForProfiling = true>
#di_subroutine_type = #llvm.di_subroutine_type<types = #di_null_type>
#di_subprogram = #llvm.di_subprogram<compileUnit = #di_compile_unit, scope = #di_file, name = "outer_func", file = #di_file, subprogramFlags = "Definition|Optimized", type = #di_subroutine_type>
#di_subprogram1 = #llvm.di_subprogram<compileUnit = #di_compile_unit, scope = #di_file, name = "inner_func", file = #di_file, subprogramFlags = "LocalToUnit|Definition|Optimized", type = #di_subroutine_type>
#di_lexical_block_file = #llvm.di_lexical_block_file<scope = #di_subprogram1, file = #di_file, discriminator = 0>
#di_local_variable = #llvm.di_local_variable<scope = #di_subprogram, name = "a", file = #di_file, type = #di_basic_type>
#di_label = #llvm.di_label<scope = #di_lexical_block_file, name = "label", file = #di_file, line = 42>
#di_local_variable1 = #llvm.di_local_variable<scope = #di_lexical_block_file, name = "b", file = #di_file, type = #di_basic_type>
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32)>, linkage = #llvm.linkage<external>, sym_name = "func_with_inlined_dbg_value", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32):
    "llvm.intr.dbg.value"(%arg0) <{locationExpr = #llvm.di_expression<>, varInfo = #di_local_variable}> : (i32) -> ()
    "llvm.intr.dbg.value"(%arg0) <{locationExpr = #llvm.di_expression<>, varInfo = #di_local_variable1}> : (i32) -> ()
    "llvm.intr.dbg.label"() <{label = #di_label}> : () -> ()
    "llvm.return"(%arg0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#di_basic_type = #llvm.di_basic_type<tag = DW_TAG_base_type, name = "int", sizeInBits = 32, encoding = DW_ATE_signed>
#di_file = #llvm.di_file<"foo.mlir" in "/test/">
#di_null_type = #llvm.di_null_type
#di_compile_unit = #llvm.di_compile_unit<id = distinct[0]<>, sourceLanguage = DW_LANG_C, file = #di_file, producer = "MLIR", isOptimized = true, emissionKind = Full, isDebugInfoForProfiling = true>
#di_subroutine_type = #llvm.di_subroutine_type<types = #di_null_type>
#di_subprogram = #llvm.di_subprogram<compileUnit = #di_compile_unit, scope = #di_file, name = "func", file = #di_file, subprogramFlags = Definition, type = #di_subroutine_type>
#di_local_variable = #llvm.di_local_variable<scope = #di_subprogram, name = "a", file = #di_file, type = #di_basic_type>
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32)>, linkage = #llvm.linkage<external>, sym_name = "func_without_subprogram", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32):
    "llvm.intr.dbg.value"(%arg0) <{locationExpr = #llvm.di_expression<>, varInfo = #di_local_variable}> : (i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#di_file = #llvm.di_file<"foo.mlir" in "/test/">
#di_null_type = #llvm.di_null_type
#di_compile_unit = #llvm.di_compile_unit<id = distinct[0]<>, sourceLanguage = DW_LANG_C, file = #di_file, producer = "MLIR", isOptimized = true, emissionKind = Full, isDebugInfoForProfiling = true>
#di_subroutine_type = #llvm.di_subroutine_type<types = #di_null_type>
#di_subprogram = #llvm.di_subprogram<compileUnit = #di_compile_unit, scope = #di_file, name = "outer_func", file = #di_file, subprogramFlags = "Definition|Optimized", type = #di_subroutine_type>
#di_label = #llvm.di_label<scope = #di_subprogram, name = "label", file = #di_file, line = 42>
#di_local_variable = #llvm.di_local_variable<scope = #di_subprogram, name = "a">
#di_local_variable1 = #llvm.di_local_variable<scope = #di_subprogram, name = "alloc">
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32)>, linkage = #llvm.linkage<external>, sym_name = "dbg_intrinsics_with_no_location", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32):
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "llvm.alloca"(%0) <{elem_type = i64}> : (i32) -> !llvm.ptr
    "llvm.intr.dbg.value"(%arg0) <{locationExpr = #llvm.di_expression<>, varInfo = #di_local_variable}> : (i32) -> ()
    "llvm.intr.dbg.declare"(%1) <{locationExpr = #llvm.di_expression<>, varInfo = #di_local_variable1}> : (!llvm.ptr) -> ()
    "llvm.intr.dbg.label"() <{label = #di_label}> : () -> ()
    "llvm.return"(%arg0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#di_basic_type = #llvm.di_basic_type<tag = DW_TAG_base_type, name = "uint64_t", sizeInBits = 64, encoding = DW_ATE_unsigned>
#di_file = #llvm.di_file<"not" in "existence">
#di_compile_unit = #llvm.di_compile_unit<id = distinct[0]<>, sourceLanguage = DW_LANG_C, file = #di_file, producer = "MLIR", isOptimized = true, emissionKind = Full, isDebugInfoForProfiling = true>
#di_global_variable = #llvm.di_global_variable<scope = #di_compile_unit, name = "global_with_expr_1", linkageName = "global_with_expr_1", file = #di_file, line = 370, type = #di_basic_type>
#di_global_variable1 = #llvm.di_global_variable<scope = #di_compile_unit, name = "global_with_expr_2", linkageName = "global_with_expr_2", file = #di_file, line = 371, type = #di_basic_type, isLocalToUnit = true, isDefined = true, alignInBits = 8>
#di_global_variable_expression = #llvm.di_global_variable_expression<var = #di_global_variable, expr = <>>
#di_global_variable_expression1 = #llvm.di_global_variable_expression<var = #di_global_variable1, expr = <>>
"builtin.module"() ({
  "llvm.mlir.global"() <{addr_space = 0 : i32, dbg_exprs = [#di_global_variable_expression], global_type = i64, linkage = #llvm.linkage<external>, sym_name = "global_with_expr_1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, dbg_exprs = [#di_global_variable_expression1], global_type = i64, linkage = #llvm.linkage<external>, sym_name = "global_with_expr_2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) : () -> ()

// -----
#di_basic_type = #llvm.di_basic_type<tag = DW_TAG_base_type, name = "integer", sizeInBits = 64, encoding = DW_ATE_signed>
#di_file = #llvm.di_file<"test.f90" in "existence">
#di_compile_unit = #llvm.di_compile_unit<id = distinct[0]<>, sourceLanguage = DW_LANG_Fortran95, file = #di_file, producer = "MLIR", isOptimized = true, emissionKind = Full, isDebugInfoForProfiling = true>
#di_module = #llvm.di_module<file = #di_file, scope = #di_compile_unit, name = "module2", configMacros = "", includePath = "", apinotes = "", line = 120>
#di_global_variable = #llvm.di_global_variable<scope = #di_module, name = "module_global", linkageName = "module_global", file = #di_file, line = 121, type = #di_basic_type, isDefined = true>
#di_global_variable_expression = #llvm.di_global_variable_expression<var = #di_global_variable, expr = <>>
"builtin.module"() ({
  "llvm.mlir.global"() <{addr_space = 0 : i32, dbg_exprs = [#di_global_variable_expression], global_type = i64, linkage = #llvm.linkage<external>, sym_name = "module_global", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) : () -> ()

// -----
#di_basic_type = #llvm.di_basic_type<tag = DW_TAG_base_type, name = "integer", sizeInBits = 64, encoding = DW_ATE_signed>
#di_file = #llvm.di_file<"test.f90" in "existence">
#di_null_type = #llvm.di_null_type
#di_compile_unit = #llvm.di_compile_unit<id = distinct[0]<>, sourceLanguage = DW_LANG_Fortran95, file = #di_file, producer = "MLIR", isOptimized = true, emissionKind = Full, isDebugInfoForProfiling = true>
#di_subroutine_type = #llvm.di_subroutine_type<types = #di_null_type>
#di_subprogram = #llvm.di_subprogram<compileUnit = #di_compile_unit, scope = #di_file, name = "fn_with_gl", file = #di_file, subprogramFlags = "Definition|Optimized", type = #di_subroutine_type>
#di_global_variable = #llvm.di_global_variable<scope = #di_subprogram, name = "func_global", linkageName = "func_global", file = #di_file, line = 121, type = #di_basic_type, isLocalToUnit = true, isDefined = true>
#di_global_variable_expression = #llvm.di_global_variable_expression<var = #di_global_variable, expr = <>>
"builtin.module"() ({
  "llvm.mlir.global"() <{addr_space = 0 : i32, dbg_exprs = [#di_global_variable_expression], global_type = i64, linkage = #llvm.linkage<external>, sym_name = "func_global", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "fn_with_gl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "imp_fn", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#di_basic_type = #llvm.di_basic_type<tag = DW_TAG_base_type, name = "char", sizeInBits = 8, encoding = DW_ATE_signed_char>
#di_file = #llvm.di_file<"file.c" in "/path/to/file">
#di_derived_type = #llvm.di_derived_type<tag = DW_TAG_const_type, baseType = #di_basic_type>
#di_composite_type = #llvm.di_composite_type<tag = DW_TAG_array_type, baseType = #di_derived_type, sizeInBits = 80>
#di_global_variable = #llvm.di_global_variable<file = #di_file, line = 268, type = #di_composite_type, isLocalToUnit = true, isDefined = true>
#di_global_variable_expression = #llvm.di_global_variable_expression<var = #di_global_variable, expr = <>>
"builtin.module"() ({
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, dbg_exprs = [#di_global_variable_expression], global_type = !llvm.array<10 x i8>, linkage = #llvm.linkage<external>, sym_name = ".str.1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "func_line_tables", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "func_debug_directives", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "class_method", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#di_composite_type = #llvm.di_composite_type<recId = distinct[0]<>, isRecSelf = true>
#di_file = #llvm.di_file<"test.mlir" in "/">
#di_subroutine_type = #llvm.di_subroutine_type<types = #di_composite_type>
#di_subprogram = #llvm.di_subprogram<scope = #di_file, file = #di_file, subprogramFlags = Optimized, type = #di_subroutine_type>
#di_composite_type1 = #llvm.di_composite_type<recId = distinct[0]<>, tag = DW_TAG_class_type, scope = #di_subprogram>
#di_global_variable = #llvm.di_global_variable<file = #di_file, line = 1, type = #di_composite_type1>
#di_global_variable_expression = #llvm.di_global_variable_expression<var = #di_global_variable>
"builtin.module"() ({
  "llvm.mlir.global"() <{addr_space = 0 : i32, dbg_exprs = [#di_global_variable_expression], global_type = !llvm.struct<()>, linkage = #llvm.linkage<external>, sym_name = "global_variable", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) : () -> ()

// -----
#di_composite_type = #llvm.di_composite_type<recId = distinct[0]<>, isRecSelf = true>
#di_file = #llvm.di_file<"test.mlir" in "/">
#di_subroutine_type = #llvm.di_subroutine_type<types = #di_composite_type>
#di_subprogram = #llvm.di_subprogram<scope = #di_file, file = #di_file, subprogramFlags = Optimized, type = #di_subroutine_type>
#di_composite_type1 = #llvm.di_composite_type<recId = distinct[0]<>, tag = DW_TAG_class_type, scope = #di_subprogram>
#di_subroutine_type1 = #llvm.di_subroutine_type<types = #di_composite_type1>
#di_subprogram1 = #llvm.di_subprogram<scope = #di_file, file = #di_file, subprogramFlags = Optimized, type = #di_subroutine_type1>
#di_composite_type2 = #llvm.di_composite_type<recId = distinct[0]<>, tag = DW_TAG_class_type, scope = #di_subprogram1>
#di_subroutine_type2 = #llvm.di_subroutine_type<types = #di_composite_type2, #di_composite_type1>
#di_global_variable = #llvm.di_global_variable<file = #di_file, line = 1, type = #di_subroutine_type2>
#di_global_variable_expression = #llvm.di_global_variable_expression<var = #di_global_variable>
"builtin.module"() ({
  "llvm.mlir.global"() <{addr_space = 0 : i32, dbg_exprs = [#di_global_variable_expression], global_type = !llvm.struct<()>, linkage = #llvm.linkage<external>, sym_name = "global_variable", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "fn_with_composite", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#di_basic_type = #llvm.di_basic_type<tag = DW_TAG_base_type, name = "int">
#di_file = #llvm.di_file<"debug-info.ll" in "/">
#di_compile_unit = #llvm.di_compile_unit<id = distinct[0]<>, sourceLanguage = DW_LANG_Fortran95, file = #di_file, emissionKind = Full>
#di_composite_type = #llvm.di_composite_type<tag = DW_TAG_array_type, name = "expr_elements", baseType = #di_basic_type, flags = Vector, elements = #llvm.di_subrange<count = #llvm.di_expression<[DW_OP_push_object_address, DW_OP_plus_uconst(16), DW_OP_deref]>>>
#di_composite_type1 = #llvm.di_composite_type<tag = DW_TAG_array_type, name = "expr_elements2", baseType = #di_basic_type, elements = #llvm.di_generic_subrange<count = #llvm.di_expression<[DW_OP_push_object_address, DW_OP_plus_uconst(16), DW_OP_deref]>, lowerBound = #llvm.di_expression<[DW_OP_push_object_address, DW_OP_plus_uconst(24), DW_OP_deref]>, stride = #llvm.di_expression<[DW_OP_push_object_address, DW_OP_plus_uconst(32), DW_OP_deref]>>>
#di_global_variable = #llvm.di_global_variable<scope = #di_compile_unit, name = "gv", file = #di_file, line = 3, type = #di_basic_type>
#di_subroutine_type = #llvm.di_subroutine_type<types = #di_basic_type, #di_composite_type, #di_composite_type1>
#di_global_variable_expression = #llvm.di_global_variable_expression<var = #di_global_variable, expr = <>>
#di_subprogram = #llvm.di_subprogram<compileUnit = #di_compile_unit, scope = #di_file, name = "subranges", file = #di_file, subprogramFlags = Definition, type = #di_subroutine_type>
#di_local_variable = #llvm.di_local_variable<scope = #di_subprogram, name = "size">
#di_composite_type2 = #llvm.di_composite_type<tag = DW_TAG_array_type, name = "var_elements", baseType = #di_basic_type, flags = Vector, elements = #llvm.di_subrange<count = #di_local_variable, stride = #di_global_variable>>
#di_composite_type3 = #llvm.di_composite_type<tag = DW_TAG_array_type, name = "var_elements2", baseType = #di_basic_type, elements = #llvm.di_generic_subrange<count = #di_local_variable, lowerBound = #di_global_variable, stride = #di_global_variable>>
#di_local_variable1 = #llvm.di_local_variable<scope = #di_subprogram, name = "var", type = #di_composite_type2>
#di_local_variable2 = #llvm.di_local_variable<scope = #di_subprogram, name = "var1", type = #di_composite_type3>
"builtin.module"() ({
  "llvm.mlir.global"() <{addr_space = 0 : i32, dbg_exprs = [#di_global_variable_expression], global_type = i64, linkage = #llvm.linkage<external>, sym_name = "gv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "subranges", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    "llvm.intr.dbg.declare"(%arg0) <{locationExpr = #llvm.di_expression<>, varInfo = #di_local_variable1}> : (!llvm.ptr) -> ()
    "llvm.intr.dbg.declare"(%arg0) <{locationExpr = #llvm.di_expression<>, varInfo = #di_local_variable2}> : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#di_basic_type = #llvm.di_basic_type<tag = DW_TAG_base_type, name = "int", sizeInBits = 32>
#di_file = #llvm.di_file<"debug-info.ll" in "/">
#di_null_type = #llvm.di_null_type
#di_string_type = #llvm.di_string_type<tag = DW_TAG_string_type>
#di_compile_unit = #llvm.di_compile_unit<id = distinct[0]<>, sourceLanguage = DW_LANG_C, file = #di_file, emissionKind = Full>
#di_subroutine_type = #llvm.di_subroutine_type<types = #di_null_type>
#di_subprogram = #llvm.di_subprogram<compileUnit = #di_compile_unit, scope = #di_file, name = "test", file = #di_file, subprogramFlags = Definition, type = #di_subroutine_type>
#di_local_variable = #llvm.di_local_variable<scope = #di_subprogram, name = "string_size", type = #di_basic_type, flags = Artificial>
#di_local_variable1 = #llvm.di_local_variable<scope = #di_subprogram, name = "str2", type = #di_string_type>
#di_string_type1 = #llvm.di_string_type<tag = DW_TAG_string_type, name = "character(*)", sizeInBits = 32, alignInBits = 8, stringLength = #di_local_variable, stringLengthExp = <[DW_OP_push_object_address, DW_OP_plus_uconst(8)]>, stringLocationExp = <[DW_OP_push_object_address, DW_OP_deref]>>
#di_local_variable2 = #llvm.di_local_variable<scope = #di_subprogram, name = "str1", type = #di_string_type1>
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "string_ty", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    "llvm.intr.dbg.value"(%arg0) <{locationExpr = #llvm.di_expression<>, varInfo = #di_local_variable2}> : (!llvm.ptr) -> ()
    "llvm.intr.dbg.value"(%arg0) <{locationExpr = #llvm.di_expression<>, varInfo = #di_local_variable1}> : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#di_basic_type = #llvm.di_basic_type<tag = DW_TAG_base_type, name = "int", sizeInBits = 32>
#di_file = #llvm.di_file<"test.f90" in "">
#di_null_type = #llvm.di_null_type
#di_compile_unit = #llvm.di_compile_unit<id = distinct[0]<>, sourceLanguage = DW_LANG_C, file = #di_file, emissionKind = Full>
#di_subroutine_type = #llvm.di_subroutine_type<types = #di_null_type>
#di_subprogram = #llvm.di_subprogram<compileUnit = #di_compile_unit, scope = #di_file, name = "test", file = #di_file, subprogramFlags = Definition, type = #di_subroutine_type>
#di_common_block = #llvm.di_common_block<scope = #di_subprogram, name = "block", file = #di_file, line = 3>
#di_global_variable = #llvm.di_global_variable<scope = #di_common_block, name = "a", file = #di_file, line = 2, type = #di_basic_type>
#di_global_variable_expression = #llvm.di_global_variable_expression<var = #di_global_variable, expr = <>>
"builtin.module"() ({
  "llvm.mlir.global"() <{addr_space = 0 : i32, dbg_exprs = [#di_global_variable_expression], global_type = !llvm.array<8 x i8>, linkage = #llvm.linkage<common>, sym_name = "block_", unnamed_addr = 0 : i64, value = dense<0> : tensor<8xi8>, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#di_basic_type = #llvm.di_basic_type<tag = DW_TAG_base_type, name = "int", sizeInBits = 32>
#di_file = #llvm.di_file<"test.f90" in "">
#di_compile_unit = #llvm.di_compile_unit<id = distinct[0]<>, sourceLanguage = DW_LANG_C, file = #di_file, emissionKind = Full>
#di_global_variable = #llvm.di_global_variable<scope = #di_compile_unit, name = "a", file = #di_file, line = 2, type = #di_basic_type>
#di_global_variable1 = #llvm.di_global_variable<scope = #di_compile_unit, name = "b", file = #di_file, line = 3, type = #di_basic_type>
#di_global_variable_expression = #llvm.di_global_variable_expression<var = #di_global_variable, expr = <>>
#di_global_variable_expression1 = #llvm.di_global_variable_expression<var = #di_global_variable1, expr = <>>
"builtin.module"() ({
  "llvm.mlir.global"() <{addr_space = 0 : i32, dbg_exprs = [#di_global_variable_expression, #di_global_variable_expression1], global_type = i64, linkage = #llvm.linkage<external>, sym_name = "data", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "fn_cu_imports", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "fn_cu_import_cycle", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#di_basic_type = #llvm.di_basic_type<tag = DW_TAG_base_type, name = "uint8", sizeInBits = 8, encoding = DW_ATE_unsigned>
#di_basic_type1 = #llvm.di_basic_type<tag = DW_TAG_base_type, name = "int64", sizeInBits = 64, encoding = DW_ATE_signed>
#di_basic_type2 = #llvm.di_basic_type<tag = DW_TAG_base_type, name = "float64", sizeInBits = 64, encoding = DW_ATE_float>
#di_file = #llvm.di_file<"foo.mlir" in "/tmp">
#di_null_type = #llvm.di_null_type
#di_compile_unit = #llvm.di_compile_unit<id = distinct[0]<>, sourceLanguage = DW_LANG_C, file = #di_file, emissionKind = Full>
#di_derived_type = #llvm.di_derived_type<tag = DW_TAG_member, name = "discriminator", baseType = #di_basic_type, sizeInBits = 8, flags = Artificial>
#di_derived_type1 = #llvm.di_derived_type<tag = DW_TAG_member, name = "_int64", baseType = #di_basic_type1, sizeInBits = 64, offsetInBits = 64, extraData = 1 : i8>
#di_derived_type2 = #llvm.di_derived_type<tag = DW_TAG_member, name = "_float64", baseType = #di_basic_type2, sizeInBits = 64, offsetInBits = 64, extraData = 2 : i8>
#di_subroutine_type = #llvm.di_subroutine_type<types = #di_null_type>
#di_composite_type = #llvm.di_composite_type<tag = DW_TAG_variant_part, name = "variant_part", file = #di_file, sizeInBits = 64, identifier = "variant-id", discriminator = #di_derived_type, elements = #di_derived_type1, #di_derived_type2>
#di_subprogram = #llvm.di_subprogram<id = distinct[1]<>, compileUnit = #di_compile_unit, scope = #di_file, name = "variant_part_emission", file = #di_file, subprogramFlags = Definition, type = #di_subroutine_type>
#di_local_variable = #llvm.di_local_variable<scope = #di_subprogram, name = "x", file = #di_file, type = #di_composite_type>
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32)>, linkage = #llvm.linkage<external>, sym_name = "variant_part_emission", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32):
    "llvm.intr.dbg.value"(%arg0) <{locationExpr = #llvm.di_expression<>, varInfo = #di_local_variable}> : (i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

