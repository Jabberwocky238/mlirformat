#di_basic_type = #llvm.di_basic_type<tag = DW_TAG_base_type, name = "real", sizeInBits = 32, encoding = DW_ATE_float>
#di_basic_type1 = #llvm.di_basic_type<tag = DW_TAG_base_type, name = "integer", sizeInBits = 32, encoding = DW_ATE_signed>
#di_file = #llvm.di_file<"target.f90" in "">
#di_null_type = #llvm.di_null_type
#di_compile_unit = #llvm.di_compile_unit<id = distinct[0]<>, sourceLanguage = DW_LANG_Fortran95, file = #di_file, emissionKind = Full>
#di_composite_type = #llvm.di_composite_type<tag = DW_TAG_array_type, baseType = #di_basic_type1, elements = #llvm.di_subrange<count = 10 : i64>>
#di_subroutine_type = #llvm.di_subroutine_type<callingConvention = DW_CC_program, types = #di_null_type>
#di_global_variable = #llvm.di_global_variable<scope = #di_compile_unit, name = "arr", linkageName = "_QFEarr", file = #di_file, line = 4, type = #di_composite_type, isDefined = true>
#di_subprogram = #llvm.di_subprogram<id = distinct[1]<>, compileUnit = #di_compile_unit, scope = #di_file, name = "target", file = #di_file, subprogramFlags = Definition, type = #di_subroutine_type>
#di_global_variable_expression = #llvm.di_global_variable_expression<var = #di_global_variable>
#di_local_variable = #llvm.di_local_variable<scope = #di_subprogram, name = "x", file = #di_file, line = 12, type = #di_basic_type>
#di_local_variable1 = #llvm.di_local_variable<scope = #di_subprogram, name = "arr", file = #di_file, line = 4, type = #di_composite_type>
#di_local_variable2 = #llvm.di_local_variable<scope = #di_subprogram, name = "i", file = #di_file, line = 13, type = #di_basic_type1>
module attributes {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_target_device = true} {
  llvm.func @test() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x f32 : (i64) -> !llvm.ptr<5>
    %2 = llvm.alloca %0 x i32 : (i64) -> !llvm.ptr<5>
    %3 = llvm.addrspacecast %1 : !llvm.ptr<5> to !llvm.ptr
    %4 = llvm.addrspacecast %2 : !llvm.ptr<5> to !llvm.ptr
    %5 = llvm.mlir.addressof @_QFEarr : !llvm.ptr
    %6 = omp.map.info var_ptr(%3 : !llvm.ptr, f32) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr
    %7 = omp.map.info var_ptr(%5 : !llvm.ptr, !llvm.array<10 x i32>) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr
    %8 = omp.map.info var_ptr(%4 : !llvm.ptr, i32) map_clauses(implicit) capture(ByCopy) -> !llvm.ptr
    omp.target kernel_type(generic) map_entries(%6 -> %arg0, %7 -> %arg1, %8 -> %arg2 : !llvm.ptr, !llvm.ptr, !llvm.ptr) {
      llvm.intr.dbg.declare #di_local_variable = %arg0 : !llvm.ptr
      llvm.intr.dbg.declare #di_local_variable1 = %arg1 : !llvm.ptr
      llvm.intr.dbg.declare #di_local_variable2 = %arg2 : !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
  llvm.mlir.global internal @_QFEarr() {addr_space = 0 : i32, dbg_exprs = [#di_global_variable_expression]} : !llvm.array<10 x i32>
}

