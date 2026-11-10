#di_basic_type = #llvm.di_basic_type<tag = DW_TAG_base_type, name = "real", sizeInBits = 32, encoding = DW_ATE_float>
#di_file = #llvm.di_file<"test.f90" in "">
#di_null_type = #llvm.di_null_type
#di_compile_unit = #llvm.di_compile_unit<id = distinct[0]<>, sourceLanguage = DW_LANG_Fortran95, file = #di_file, emissionKind = Full>
#di_subroutine_type = #llvm.di_subroutine_type<callingConvention = DW_CC_program, types = #di_null_type>
#di_subprogram = #llvm.di_subprogram<compileUnit = #di_compile_unit, name = "main", file = #di_file, subprogramFlags = Definition, type = #di_subroutine_type>
#di_subprogram1 = #llvm.di_subprogram<compileUnit = #di_compile_unit, name = "target", file = #di_file, subprogramFlags = Definition, type = #di_subroutine_type>
#di_local_variable = #llvm.di_local_variable<scope = #di_subprogram, name = "x", file = #di_file, line = 2, type = #di_basic_type>
#di_local_variable1 = #llvm.di_local_variable<scope = #di_subprogram1, name = "x", file = #di_file, line = 2, type = #di_basic_type>
module attributes {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_target_device = true} {
  llvm.func @main() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i1 : (i64) -> !llvm.ptr<5>
    %2 = llvm.addrspacecast %1 : !llvm.ptr<5> to !llvm.ptr
    llvm.intr.dbg.declare #di_local_variable = %2 : !llvm.ptr
    %3 = omp.map.info var_ptr(%2 : !llvm.ptr, f32) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr {name = "x"}
    omp.target kernel_type(generic) map_entries(%3 -> %arg0 : !llvm.ptr) {
      %4 = llvm.mlir.constant(1.000000e+00 : f32) : f32
      llvm.intr.dbg.declare #di_local_variable1 = %arg0 : !llvm.ptr
      %5 = llvm.load %arg0 : !llvm.ptr -> f32
      %6 = llvm.fadd %5, %4 {fastmathFlags = #llvm.fastmath<contract>} : f32
      llvm.store %6, %arg0 : f32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
}

