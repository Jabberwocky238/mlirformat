"builtin.module"() ({
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i64, linkage = #llvm.linkage<external>, sym_name = "default_external", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = i64, linkage = #llvm.linkage<external>, sym_name = "default_external_constant", unnamed_addr = 0 : i64, value = 42 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i64, linkage = #llvm.linkage<internal>, sym_name = "global", unnamed_addr = 0 : i64, value = 42 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i64, linkage = #llvm.linkage<private>, sym_name = "aligned_global", unnamed_addr = 0 : i64, value = 42 : i64, visibility_ = 0 : i64}> ({
  }) {aligned = 64 : i64} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = i64, linkage = #llvm.linkage<private>, sym_name = "aligned_global_const", unnamed_addr = 0 : i64, value = 42 : i64, visibility_ = 0 : i64}> ({
  }) {aligned = 32 : i64} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = f32, linkage = #llvm.linkage<internal>, sym_name = "constant", unnamed_addr = 0 : i64, value = 3.700000e+01 : f64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = !llvm.array<6 x i8>, linkage = #llvm.linkage<internal>, sym_name = ".string", unnamed_addr = 0 : i64, value = "foobar", visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.array<7 x i8>, linkage = #llvm.linkage<internal>, sym_name = "string_notype", unnamed_addr = 0 : i64, value = "1234567", visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i64, linkage = #llvm.linkage<internal>, sym_name = "global_undef", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i64, linkage = #llvm.linkage<internal>, sym_name = "global_mega_initializer", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %3 = "llvm.mlir.constant"() <{value = 42 : i64}> : () -> i64
    "llvm.return"(%3) : (i64) -> ()
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i64, linkage = #llvm.linkage<private>, sym_name = "private", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i64, linkage = #llvm.linkage<internal>, sym_name = "internal", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i64, linkage = #llvm.linkage<available_externally>, sym_name = "available_externally", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i64, linkage = #llvm.linkage<linkonce>, sym_name = "linkonce", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i64, linkage = #llvm.linkage<weak>, sym_name = "weak", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i64, linkage = #llvm.linkage<common>, sym_name = "common", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.array<2 x i64>, linkage = #llvm.linkage<appending>, sym_name = "appending", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i64, linkage = #llvm.linkage<extern_weak>, sym_name = "extern_weak", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i64, linkage = #llvm.linkage<linkonce_odr>, sym_name = "linkonce_odr", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i64, linkage = #llvm.linkage<weak_odr>, sym_name = "weak_odr", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i64, linkage = #llvm.linkage<external>, sym_name = "has_thr_local", unnamed_addr = 0 : i64, value = 42 : i64, visibility_ = 0 : i64}> ({
  }) {thr_local} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, dso_local, global_type = i64, linkage = #llvm.linkage<external>, sym_name = "has_dso_local", unnamed_addr = 0 : i64, value = 42 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 3 : i32, global_type = i64, linkage = #llvm.linkage<external>, sym_name = "has_addr_space", unnamed_addr = 0 : i64, value = 32 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.comdat"() <{sym_name = "__llvm_comdat"}> ({
    "llvm.comdat_selector"() <{comdat = 0 : i64, sym_name = "any"}> : () -> ()
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 1 : i32, comdat = @__llvm_comdat::@any, global_type = i64, linkage = #llvm.linkage<external>, sym_name = "any", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "references"}> ({
    %0 = "llvm.mlir.addressof"() <{global_name = @".string"}> : () -> !llvm.ptr
    %1 = "llvm.mlir.addressof"() <{global_name = @global}> : () -> !llvm.ptr
    %2 = "llvm.mlir.addressof"() <{global_name = @has_addr_space}> : () -> !llvm.ptr<3>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = i64, linkage = #llvm.linkage<private>, sym_name = "local", unnamed_addr = 1 : i64, value = 42 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = i64, linkage = #llvm.linkage<private>, sym_name = "foo", unnamed_addr = 2 : i64, value = 42 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = !llvm.array<10 x i8>, linkage = #llvm.linkage<internal>, section = ".mysection", sym_name = "sectionvar", unnamed_addr = 0 : i64, value = "teststring", visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = i32, linkage = #llvm.linkage<internal>, sym_name = "thread_local", thread_local_, unnamed_addr = 0 : i64, value = 42 : i32, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = i32, linkage = #llvm.linkage<internal>, sym_name = "hidden", unnamed_addr = 0 : i64, value = 42 : i32, visibility_ = 1 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<internal>, sym_name = "protected", unnamed_addr = 2 : i64, value = 42 : i32, visibility_ = 2 : i64}> ({
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "ctor", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.mlir.global_ctors"() <{ctors = [@ctor], data = [#llvm.zero], priorities = [0 : i32]}> : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.mlir.global_ctors"() <{ctors = [], data = [], priorities = []}> : () -> ()
  "llvm.mlir.global_dtors"() <{data = [], dtors = [], priorities = []}> : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "dtor", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.mlir.global_dtors"() <{data = [#llvm.zero], dtors = [@dtor], priorities = [0 : i32]}> : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.target<"spirv.Image", i32, 0>, linkage = #llvm.linkage<external>, sym_name = "target_ext", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.target<"spirv.Image", i32, 0>, linkage = #llvm.linkage<external>, sym_name = "target_ext_init", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.zero"() : () -> !llvm.target<"spirv.Image", i32, 0>
    "llvm.return"(%0) : (!llvm.target<"spirv.Image", i32, 0>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
#di_basic_type = #llvm.di_basic_type<tag = DW_TAG_base_type, name = "uint64_t", sizeInBits = 64, encoding = DW_ATE_unsigned>
#di_file = #llvm.di_file<"not" in "existence">
#di_compile_unit = #llvm.di_compile_unit<id = distinct[0]<>, sourceLanguage = DW_LANG_C, file = #di_file, producer = "MLIR", isOptimized = true, emissionKind = Full>
#di_global_variable = #llvm.di_global_variable<scope = #di_compile_unit, name = "global_with_expr_1", linkageName = "global_with_expr_1", file = #di_file, line = 370, type = #di_basic_type, isLocalToUnit = true, isDefined = true, alignInBits = 8>
#di_global_variable1 = #llvm.di_global_variable<scope = #di_compile_unit, name = "global_with_expr_2", linkageName = "global_with_expr_2", file = #di_file, line = 371, type = #di_basic_type, isLocalToUnit = true, isDefined = true, alignInBits = 8>
#di_global_variable2 = #llvm.di_global_variable<scope = #di_compile_unit, name = "global_with_expr_3", linkageName = "global_with_expr_3", file = #di_file, line = 372, type = #di_basic_type, isLocalToUnit = true, isDefined = true, alignInBits = 8>
#di_global_variable3 = #llvm.di_global_variable<scope = #di_compile_unit, name = "global_with_expr_4", linkageName = "global_with_expr_4", file = #di_file, line = 373, type = #di_basic_type, isLocalToUnit = true, isDefined = true, alignInBits = 8>
#di_global_variable_expression = #llvm.di_global_variable_expression<var = #di_global_variable, expr = <>>
#di_global_variable_expression1 = #llvm.di_global_variable_expression<var = #di_global_variable1, expr = <[DW_OP_push_object_address, DW_OP_deref]>>
#di_global_variable_expression2 = #llvm.di_global_variable_expression<var = #di_global_variable2, expr = <[DW_OP_LLVM_arg(0), DW_OP_LLVM_arg(1), DW_OP_plus]>>
#di_global_variable_expression3 = #llvm.di_global_variable_expression<var = #di_global_variable3, expr = <[DW_OP_LLVM_convert(16, DW_ATE_signed)]>>
"builtin.module"() ({
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i64, linkage = #llvm.linkage<external>, sym_name = "global_with_expr1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) {dbg_expr = [#di_global_variable_expression]} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i64, linkage = #llvm.linkage<external>, sym_name = "global_with_expr2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) {dbg_expr = [#di_global_variable_expression1]} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i64, linkage = #llvm.linkage<external>, sym_name = "global_with_expr3", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) {dbg_expr = [#di_global_variable_expression2]} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i64, linkage = #llvm.linkage<external>, sym_name = "global_with_expr4", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) {dbg_expr = [#di_global_variable_expression3]} : () -> ()
}) : () -> ()

