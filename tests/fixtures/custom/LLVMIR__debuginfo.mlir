#di_basic_type = #llvm.di_basic_type<tag = DW_TAG_base_type, name = "int1", sizeInBits = 32, encoding = DW_ATE_signed>
#di_basic_type1 = #llvm.di_basic_type<tag = DW_TAG_base_type, name = "int0">
#di_composite_type = #llvm.di_composite_type<tag = DW_TAG_array_type, name = "array0", line = 10, sizeInBits = 128, alignInBits = 32>
#di_derived_type = #llvm.di_derived_type<tag = DW_TAG_pointer_type, name = "ptr1">
#di_file = #llvm.di_file<"debuginfo.mlir" in "/test/">
#di_namespace = #llvm.di_namespace<name = "toplevel", exportSymbols = true>
#di_null_type = #llvm.di_null_type
#di_subroutine_type = #llvm.di_subroutine_type<callingConvention = DW_CC_normal>
#di_compile_unit = #llvm.di_compile_unit<id = distinct[0]<>, sourceLanguage = DW_LANG_C, file = #di_file, producer = "MLIR", isOptimized = true, emissionKind = Full>
#di_composite_type1 = #llvm.di_composite_type<tag = DW_TAG_array_type, name = "array1", file = #di_file, scope = #di_file, baseType = #di_basic_type1, allocated = <[DW_OP_push_object_address, DW_OP_deref]>, elements = #llvm.di_subrange<count = 4 : i64>>
#di_composite_type2 = #llvm.di_composite_type<tag = DW_TAG_array_type, name = "expr_elements2", baseType = #di_basic_type1, elements = #llvm.di_generic_subrange<count = #llvm.di_expression<[DW_OP_push_object_address, DW_OP_plus_uconst(16), DW_OP_deref]>, lowerBound = #llvm.di_expression<[DW_OP_push_object_address, DW_OP_plus_uconst(24), DW_OP_deref]>, stride = #llvm.di_expression<[DW_OP_push_object_address, DW_OP_plus_uconst(32), DW_OP_deref]>>>
#di_derived_type1 = #llvm.di_derived_type<tag = DW_TAG_pointer_type, baseType = #di_basic_type1, sizeInBits = 64, alignInBits = 32, offsetInBits = 4, extraData = #di_basic_type>
#di_derived_type2 = #llvm.di_derived_type<tag = DW_TAG_pointer_type, baseType = #di_basic_type1, sizeInBits = 64, alignInBits = 32, offsetInBits = 4, dwarfAddressSpace = 3, extraData = #di_basic_type>
#di_module = #llvm.di_module<file = #di_file, scope = #di_file, name = "module", configMacros = "bar", includePath = "/", apinotes = "/", line = 42, isDecl = true>
#di_namespace1 = #llvm.di_namespace<name = "nested", scope = #di_namespace, exportSymbols = false>
#di_namespace2 = #llvm.di_namespace<scope = #di_file, exportSymbols = false>
#di_subroutine_type1 = #llvm.di_subroutine_type<types = #di_basic_type, #di_basic_type>
#di_composite_type3 = #llvm.di_composite_type<tag = DW_TAG_class_type, name = "class_name", file = #di_file, scope = #di_namespace1, flags = "TypePassByReference|NonTrivial">
#di_subprogram = #llvm.di_subprogram<compileUnit = #di_compile_unit, scope = #di_module, name = "value", file = #di_file, subprogramFlags = Definition, type = #di_subroutine_type, annotations = #llvm.di_annotation<name = "foo", value = "bar">>
#di_subprogram1 = #llvm.di_subprogram<scope = #di_derived_type2, file = #di_file, type = #di_subroutine_type1>
#di_lexical_block = #llvm.di_lexical_block<scope = #di_subprogram>
#di_lexical_block1 = #llvm.di_lexical_block<scope = #di_subprogram1>
#di_subprogram2 = #llvm.di_subprogram<scope = #di_composite_type3, file = #di_file, type = #di_subroutine_type1>
#di_subroutine_type2 = #llvm.di_subroutine_type<callingConvention = DW_CC_normal, types = #di_null_type, #di_basic_type1, #di_derived_type1, #di_derived_type, #di_derived_type2, #di_composite_type, #di_composite_type1, #di_composite_type3, #di_composite_type2>
#di_common_block = #llvm.di_common_block<scope = #di_subprogram2, name = "block", file = #di_file, line = 3>
#di_label = #llvm.di_label<scope = #di_lexical_block>
#di_lexical_block2 = #llvm.di_lexical_block<scope = #di_subprogram2>
#di_local_variable = #llvm.di_local_variable<scope = #di_lexical_block, name = "arg2">
#di_local_variable1 = #llvm.di_local_variable<scope = #di_lexical_block1, name = "arg3">
#di_subprogram3 = #llvm.di_subprogram<compileUnit = #di_compile_unit, scope = #di_namespace2, name = "addr", linkageName = "addr", file = #di_file, line = 3, scopeLine = 3, subprogramFlags = "Definition|Optimized", type = #di_subroutine_type2>
#di_global_variable = #llvm.di_global_variable<scope = #di_common_block, name = "a", file = #di_file, line = 2, type = #di_basic_type1>
#di_global_variable1 = #llvm.di_global_variable<scope = #di_common_block, name = "b", file = #di_file, line = 3, type = #di_basic_type1>
#di_label1 = #llvm.di_label<scope = #di_lexical_block2, name = "label", file = #di_file, line = 42>
#di_lexical_block3 = #llvm.di_lexical_block<scope = #di_subprogram3, line = 1, column = 2>
#di_local_variable2 = #llvm.di_local_variable<scope = #di_lexical_block2, name = "arg1">
#di_global_variable_expression = #llvm.di_global_variable_expression<var = #di_global_variable, expr = <>>
#di_global_variable_expression1 = #llvm.di_global_variable_expression<var = #di_global_variable1, expr = <>>
#di_local_variable3 = #llvm.di_local_variable<scope = #di_lexical_block3, name = "alloc", file = #di_file, line = 6, arg = 1, alignInBits = 32, type = #di_basic_type1>
module {
  llvm.mlir.global external @data() {addr_space = 0 : i32, dbg_exprs = [#di_global_variable_expression, #di_global_variable_expression1]} : i64
  llvm.func @addr(%arg0: i64) {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i64 : (i32) -> !llvm.ptr
    llvm.intr.dbg.declare #di_local_variable3 = %1 : !llvm.ptr
    llvm.return
  }
  llvm.func @value(%arg0: i32, %arg1: i32, %arg2: i32) {
    llvm.intr.dbg.value #di_local_variable2 #llvm.di_expression<[DW_OP_LLVM_fragment(16, 8), DW_OP_plus_uconst(2), DW_OP_deref]> = %arg0 : i32
    llvm.intr.dbg.value #di_local_variable = %arg1 : i32
    llvm.intr.dbg.value #di_local_variable1 = %arg2 : i32
    llvm.intr.dbg.label #di_label1
    llvm.intr.dbg.label #di_label
    llvm.return
  }
}

