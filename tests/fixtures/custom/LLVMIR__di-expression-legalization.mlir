#di_basic_type = #llvm.di_basic_type<tag = DW_TAG_base_type, name = "i8", sizeInBits = 8, encoding = DW_ATE_unsigned>
#di_basic_type1 = #llvm.di_basic_type<tag = DW_TAG_base_type, name = "i32", sizeInBits = 32, encoding = DW_ATE_unsigned>
#di_file = #llvm.di_file<"foo.c" in "/mlir/">
#di_compile_unit = #llvm.di_compile_unit<id = distinct[0]<>, sourceLanguage = DW_LANG_C, file = #di_file, producer = "MLIR", isOptimized = true, emissionKind = Full>
#di_derived_type = #llvm.di_derived_type<tag = DW_TAG_member, name = "struct0_first", baseType = #di_basic_type, sizeInBits = 8, alignInBits = 8>
#di_derived_type1 = #llvm.di_derived_type<tag = DW_TAG_member, name = "struct0_second", baseType = #di_basic_type1, sizeInBits = 32, alignInBits = 32, offsetInBits = 32>
#di_derived_type2 = #llvm.di_derived_type<tag = DW_TAG_member, name = "struct1_first", baseType = #di_basic_type, sizeInBits = 8, alignInBits = 8>
#di_derived_type3 = #llvm.di_derived_type<tag = DW_TAG_member, name = "struct2_first", baseType = #di_basic_type1, sizeInBits = 32, alignInBits = 32>
#di_composite_type = #llvm.di_composite_type<tag = DW_TAG_structure_type, name = "struct0", sizeInBits = 64, alignInBits = 32, elements = #di_derived_type, #di_derived_type1>
#di_subprogram = #llvm.di_subprogram<compileUnit = #di_compile_unit, scope = #di_file, name = "simplify", file = #di_file, subprogramFlags = Definition>
#di_derived_type4 = #llvm.di_derived_type<tag = DW_TAG_member, name = "struct1_second", baseType = #di_composite_type, sizeInBits = 64, alignInBits = 32>
#di_local_variable = #llvm.di_local_variable<scope = #di_subprogram, name = "struct0_var", file = #di_file, line = 10, alignInBits = 32, type = #di_composite_type>
#di_composite_type1 = #llvm.di_composite_type<tag = DW_TAG_structure_type, name = "struct1", sizeInBits = 96, alignInBits = 32, elements = #di_derived_type2, #di_derived_type4>
#di_derived_type5 = #llvm.di_derived_type<tag = DW_TAG_member, name = "struct2_second", baseType = #di_composite_type1, sizeInBits = 96, alignInBits = 32>
#di_local_variable1 = #llvm.di_local_variable<scope = #di_subprogram, name = "struct1_var", file = #di_file, line = 10, alignInBits = 32, type = #di_composite_type1>
#di_composite_type2 = #llvm.di_composite_type<tag = DW_TAG_structure_type, name = "struct2", sizeInBits = 128, alignInBits = 32, elements = #di_derived_type3, #di_derived_type5>
#di_local_variable2 = #llvm.di_local_variable<scope = #di_subprogram, name = "struct2_var", file = #di_file, line = 10, alignInBits = 32, type = #di_composite_type2>
module {
  llvm.func @merge_fragments(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr) {
    llvm.intr.dbg.value #di_local_variable #llvm.di_expression<[DW_OP_deref, DW_OP_LLVM_fragment(32, 32)]> = %arg0 : !llvm.ptr
    llvm.intr.dbg.value #di_local_variable1 #llvm.di_expression<[DW_OP_deref, DW_OP_LLVM_fragment(32, 32), DW_OP_LLVM_fragment(32, 64)]> = %arg1 : !llvm.ptr
    llvm.intr.dbg.value #di_local_variable2 #llvm.di_expression<[DW_OP_deref, DW_OP_LLVM_fragment(32, 32), DW_OP_LLVM_fragment(32, 64), DW_OP_LLVM_fragment(32, 96)]> = %arg2 : !llvm.ptr
    llvm.return
  }
}

