module {
  llvm.mlir.global external @default_external() {addr_space = 0 : i32} : i64
  llvm.mlir.global external constant @default_external_constant(42 : i64) {addr_space = 0 : i32} : i64
  llvm.mlir.global internal @global(42 : i64) {addr_space = 0 : i32} : i64
  llvm.mlir.global private @aligned_global(42 : i64) {addr_space = 0 : i32, aligned = 64 : i64} : i64
  llvm.mlir.global private constant @aligned_global_const(42 : i64) {addr_space = 0 : i32, aligned = 32 : i64} : i64
  llvm.mlir.global internal constant @constant(3.700000e+01 : f64) {addr_space = 0 : i32} : f32
  llvm.mlir.global internal constant @".string"("foobar") {addr_space = 0 : i32}
  llvm.mlir.global internal @string_notype("1234567") {addr_space = 0 : i32}
  llvm.mlir.global internal @global_undef() {addr_space = 0 : i32} : i64
  llvm.mlir.global internal @global_mega_initializer() {addr_space = 0 : i32} : i64 {
    %0 = llvm.mlir.constant(42 : i64) : i64
    llvm.return %0 : i64
  }
  llvm.mlir.global private @private() {addr_space = 0 : i32} : i64
  llvm.mlir.global internal @internal() {addr_space = 0 : i32} : i64
  llvm.mlir.global available_externally @available_externally() {addr_space = 0 : i32} : i64
  llvm.mlir.global linkonce @linkonce() {addr_space = 0 : i32} : i64
  llvm.mlir.global weak @weak() {addr_space = 0 : i32} : i64
  llvm.mlir.global common @common() {addr_space = 0 : i32} : i64
  llvm.mlir.global appending @appending() {addr_space = 0 : i32} : !llvm.array<2 x i64>
  llvm.mlir.global extern_weak @extern_weak() {addr_space = 0 : i32} : i64
  llvm.mlir.global linkonce_odr @linkonce_odr() {addr_space = 0 : i32} : i64
  llvm.mlir.global weak_odr @weak_odr() {addr_space = 0 : i32} : i64
  llvm.mlir.global external @has_thr_local(42 : i64) {addr_space = 0 : i32, thr_local} : i64
  llvm.mlir.global external @has_dso_local(42 : i64) {addr_space = 0 : i32, dso_local} : i64
  llvm.mlir.global external @has_addr_space(32 : i64) {addr_space = 3 : i32} : i64
  llvm.comdat @__llvm_comdat {
    llvm.comdat_selector @any any
  }
  llvm.mlir.global external @any() comdat(@__llvm_comdat::@any) {addr_space = 1 : i32} : i64
  func.func @references() {
    %0 = llvm.mlir.addressof @".string" : !llvm.ptr
    %1 = llvm.mlir.addressof @global : !llvm.ptr
    %2 = llvm.mlir.addressof @has_addr_space : !llvm.ptr<3>
    llvm.return
  }
  llvm.mlir.global private local_unnamed_addr constant @local(42 : i64) {addr_space = 0 : i32} : i64
  llvm.mlir.global private unnamed_addr constant @foo(42 : i64) {addr_space = 0 : i32} : i64
  llvm.mlir.global internal constant @sectionvar("teststring") {addr_space = 0 : i32, section = ".mysection"}
  llvm.mlir.global internal thread_local constant @thread_local(42 : i32) {addr_space = 0 : i32} : i32
  llvm.mlir.global internal hidden constant @hidden(42 : i32) {addr_space = 0 : i32} : i32
  llvm.mlir.global internal protected unnamed_addr @protected(42 : i32) {addr_space = 0 : i32} : i32
}

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
module {
  llvm.func @ctor() {
    llvm.return
  }
  llvm.mlir.global_ctors ctors = [@ctor], priorities = [0 : i32], data = [#llvm.zero]
}

// -----
module {
  llvm.mlir.global_ctors ctors = [], priorities = [], data = []
  llvm.mlir.global_dtors dtors = [], priorities = [], data = []
}

// -----
module {
  llvm.func @dtor() {
    llvm.return
  }
  llvm.mlir.global_dtors dtors = [@dtor], priorities = [0 : i32], data = [#llvm.zero]
}

// -----
module {
  llvm.mlir.global external @target_ext() {addr_space = 0 : i32} : !llvm.target<"spirv.Image", i32, 0>
  llvm.mlir.global external @target_ext_init() {addr_space = 0 : i32} : !llvm.target<"spirv.Image", i32, 0> {
    %0 = llvm.mlir.zero : !llvm.target<"spirv.Image", i32, 0>
    llvm.return %0 : !llvm.target<"spirv.Image", i32, 0>
  }
}

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
module {
  llvm.mlir.global external @global_with_expr1() {addr_space = 0 : i32, dbg_expr = [#di_global_variable_expression]} : i64
  llvm.mlir.global external @global_with_expr2() {addr_space = 0 : i32, dbg_expr = [#di_global_variable_expression1]} : i64
  llvm.mlir.global external @global_with_expr3() {addr_space = 0 : i32, dbg_expr = [#di_global_variable_expression2]} : i64
  llvm.mlir.global external @global_with_expr4() {addr_space = 0 : i32, dbg_expr = [#di_global_variable_expression3]} : i64
}

