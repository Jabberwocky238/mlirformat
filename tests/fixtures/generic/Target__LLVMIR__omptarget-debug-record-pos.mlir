#di_basic_type = #llvm.di_basic_type<tag = DW_TAG_base_type, name = "real", sizeInBits = 32, encoding = DW_ATE_float>
#di_file = #llvm.di_file<"test.f90" in "">
#di_null_type = #llvm.di_null_type
#di_compile_unit = #llvm.di_compile_unit<id = distinct[0]<>, sourceLanguage = DW_LANG_Fortran95, file = #di_file, emissionKind = Full>
#di_subroutine_type = #llvm.di_subroutine_type<callingConvention = DW_CC_program, types = #di_null_type>
#di_subprogram = #llvm.di_subprogram<compileUnit = #di_compile_unit, name = "main", file = #di_file, subprogramFlags = Definition, type = #di_subroutine_type>
#di_subprogram1 = #llvm.di_subprogram<compileUnit = #di_compile_unit, name = "target", file = #di_file, subprogramFlags = Definition, type = #di_subroutine_type>
#di_local_variable = #llvm.di_local_variable<scope = #di_subprogram, name = "x", file = #di_file, line = 2, type = #di_basic_type>
#di_local_variable1 = #llvm.di_local_variable<scope = #di_subprogram1, name = "x", file = #di_file, line = 2, type = #di_basic_type>
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "main", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = i1}> : (i64) -> !llvm.ptr<5>
    %2 = "llvm.addrspacecast"(%1) : (!llvm.ptr<5>) -> !llvm.ptr
    "llvm.intr.dbg.declare"(%2) <{locationExpr = #llvm.di_expression<>, varInfo = #di_local_variable}> : (!llvm.ptr) -> ()
    %3 = "omp.map.info"(%2) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "x", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = f32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%3) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr):
      %4 = "llvm.mlir.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
      "llvm.intr.dbg.declare"(%arg0) <{locationExpr = #llvm.di_expression<>, varInfo = #di_local_variable1}> : (!llvm.ptr) -> ()
      %5 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
      %6 = "llvm.fadd"(%5, %4) <{fastmathFlags = #llvm.fastmath<contract>}> : (f32, f32) -> f32
      "llvm.store"(%6, %arg0) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_target_device = true} : () -> ()

