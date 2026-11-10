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
module attributes {omp.is_target_device = false} {
  llvm.func @test() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x f32 : (i64) -> !llvm.ptr
    %2 = llvm.alloca %0 x i32 : (i64) -> !llvm.ptr
    %3 = llvm.mlir.constant(9 : index) : i64
    %4 = llvm.mlir.constant(0 : index) : i64
    %5 = llvm.mlir.constant(1 : index) : i64
    %6 = llvm.mlir.constant(10 : index) : i64
    %7 = llvm.mlir.addressof @_QFEarr : !llvm.ptr
    %8 = omp.map.info var_ptr(%1 : !llvm.ptr, f32) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr
    %9 = omp.map.bounds lower_bound(%4 : i64) upper_bound(%3 : i64) extent(%6 : i64) stride(%5 : i64) start_idx(%5 : i64)
    %10 = omp.map.info var_ptr(%7 : !llvm.ptr, !llvm.array<10 x i32>) map_clauses(tofrom) capture(ByRef) bounds(%9) -> !llvm.ptr
    %11 = omp.map.info var_ptr(%2 : !llvm.ptr, i32) map_clauses(implicit) capture(ByCopy) -> !llvm.ptr
    omp.target kernel_type(generic) map_entries(%8 -> %arg0, %10 -> %arg1, %11 -> %arg2 : !llvm.ptr, !llvm.ptr, !llvm.ptr) {
      llvm.intr.dbg.declare #di_local_variable = %arg0 : !llvm.ptr
      llvm.intr.dbg.declare #di_local_variable1 = %arg1 : !llvm.ptr
      llvm.intr.dbg.declare #di_local_variable2 = %arg2 : !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
  llvm.mlir.global internal @_QFEarr() {addr_space = 0 : i32, dbg_exprs = [#di_global_variable_expression]} : !llvm.array<10 x i32>
}

