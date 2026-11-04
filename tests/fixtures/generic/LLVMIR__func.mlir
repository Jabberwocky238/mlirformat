"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "foo", visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "bar", visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (i64)>, linkage = #llvm.linkage<external>, sym_name = "baz", visibility_ = 0 : i64}> ({
  ^bb0(%arg9: i64):
    "llvm.return"(%arg9) : (i64) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.noalias}, {}], function_type = !llvm.func<void (ptr, i64)>, linkage = #llvm.linkage<external>, sym_name = "qux", visibility_ = 0 : i64}> ({
  }) {xxx = {yyy = 42 : i64}} : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "roundtrip1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f64 (i64, f32)>, linkage = #llvm.linkage<external>, sym_name = "roundtrip2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i1)>, linkage = #llvm.linkage<external>, sym_name = "roundtrip3", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i1)>, linkage = #llvm.linkage<external>, sym_name = "roundtrip4", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg7: i32, %arg8: i1):
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "roundtrip5", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) {baz = 42 : i64, foo = "bar"} : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "roundtrip6", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) {baz = 42 : i64, foo = "bar"} : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "roundtrip7", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 ()>, linkage = #llvm.linkage<external>, sym_name = "roundtrip8", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.noalias}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "roundtrip9", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.noalias}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "roundtrip10", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.noalias}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "roundtrip11", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg6: !llvm.ptr):
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.noalias}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "roundtrip12", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg5: !llvm.ptr):
    "llvm.return"() : () -> ()
  }) {foo = 42 : i32} : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.byval = i32}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "byvalattr", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: !llvm.ptr):
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.sret = i32}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "sretattr", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg3: !llvm.ptr):
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.nest}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "nestattr", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: !llvm.ptr):
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.noalias}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "llvm_noalias_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.byref = i32}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "byrefattr_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.byval = i32}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "byvalattr_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.sret = i32}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "sretattr_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.nest}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "nestattr_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.noundef}], function_type = !llvm.func<void (i32)>, linkage = #llvm.linkage<external>, sym_name = "noundefattr_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.align = 4 : i64}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "llvm_align_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.inalloca = i32}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "inallocaattr_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (...)>, linkage = #llvm.linkage<external>, sym_name = "variadic", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, ...)>, linkage = #llvm.linkage<external>, sym_name = "variadic_args", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<internal>, sym_name = "internal_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<weak>, sym_name = "weak_linkage", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ptx_kernelcc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "calling_conv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "external_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.struct_attrs = [{llvm.noalias}]}], function_type = !llvm.func<void (struct<(i32)>)>, linkage = #llvm.linkage<external>, sym_name = "arg_struct_attr", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg1: !llvm.struct<(i32)>):
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(i32)> (struct<(i32)>)>, linkage = #llvm.linkage<external>, res_attrs = [{llvm.struct_attrs = [{llvm.noalias}]}], sym_name = "res_struct_attr", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.struct<(i32)>):
    "llvm.return"(%arg0) : (!llvm.struct<(i32)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "cconv1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<weak>, sym_name = "cconv2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<fastcc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<weak>, sym_name = "cconv3", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<cc_10>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "cconv4", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_ccs", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.addressof"() <{global_name = @cconv4}> : () -> !llvm.ptr
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @cconv1, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @cconv2, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.call"() <{CConv = #llvm.cconv<fastcc>, TailCallKind = #llvm.tailcallkind<none>, callee = @cconv3, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.call"(%0) <{CConv = #llvm.cconv<cc_10>, TailCallKind = #llvm.tailcallkind<none>, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (...)>, linkage = #llvm.linkage<external>, sym_name = "variadic_def", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "memory_attr", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) {memory = #llvm.memory_effects<other = none, argMem = read, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "hidden", unnamed_addr = 0 : i64, visibility_ = 1 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "protected", unnamed_addr = 0 : i64, visibility_ = 2 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "local_unnamed_addr_func", unnamed_addr = 1 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, alignment = 2 : i64, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "align_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.comdat"() <{sym_name = "__llvm_comdat"}> ({
    "llvm.comdat_selector"() <{comdat = 0 : i64, sym_name = "any"}> : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, comdat = @__llvm_comdat::@any, dso_local, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "any", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "vscale_roundtrip", unnamed_addr = 0 : i64, visibility_ = 0 : i64, vscale_range = #llvm.vscale_range<minRange = 1 : i32, maxRange = 2 : i32>}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, frame_pointer = #llvm.framePointerKind<"non-leaf">, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "frame_pointer_roundtrip", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, no_infs_fp_math = true, sym_name = "no_infs_fp_math_roundtrip", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, no_nans_fp_math = true, sym_name = "no_nans_fp_math_roundtrip", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, no_signed_zeros_fp_math = true, sym_name = "no_signed_zeros_fp_math_roundtrip", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, convergent, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "convergent_function", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, denormal_fp_math = "preserve-sign", function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "denormal_fp_math_roundtrip", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, denormal_fp_math_f32 = "preserve-sign", function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "denormal_fp_math_f32_roundtrip", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, fp_contract = "fast", function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "fp_contract_roundtrip", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, instrument_function_entry = "__cyg_profile_func_enter", linkage = #llvm.linkage<external>, sym_name = "instrument_function_entry_function", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, instrument_function_exit = "__cyg_profile_func_exit", linkage = #llvm.linkage<external>, sym_name = "instrument_function_exit_function", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, no_unwind, sym_name = "nounwind_function", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "willreturn_function", unnamed_addr = 0 : i64, visibility_ = 0 : i64, will_return}> ({
    "llvm.return"() : () -> ()
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
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "vec_type_hint", unnamed_addr = 0 : i64, vec_type_hint = #llvm.vec_type_hint<hint = i32>, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "vec_type_hint_signed", unnamed_addr = 0 : i64, vec_type_hint = #llvm.vec_type_hint<hint = i32, is_signed = true>, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "vec_type_hint_signed_vec", unnamed_addr = 0 : i64, vec_type_hint = #llvm.vec_type_hint<hint = vector<2xi32>, is_signed = true>, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "vec_type_hint_float_vec", unnamed_addr = 0 : i64, vec_type_hint = #llvm.vec_type_hint<hint = vector<3xf32>>, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "vec_type_hint_bfloat_vec", unnamed_addr = 0 : i64, vec_type_hint = #llvm.vec_type_hint<hint = vector<8xbf16>>, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "work_group_size_hint", unnamed_addr = 0 : i64, visibility_ = 0 : i64, work_group_size_hint = array<i32: 128, 128, 128>}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, reqd_work_group_size = array<i32: 128, 256, 128>, sym_name = "reqd_work_group_size_hint", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "intel_reqd_sub_group_size_hint", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) {llvm.intel_reqd_sub_group_size = 32 : i32} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.workgroup_attribution = #llvm.mlir.workgroup_attribution<512 : i64, i32>}, {llvm.workgroup_attribution = #llvm.mlir.workgroup_attribution<128 : i64, !llvm.struct<(i32, i64, f32)>>}], function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "workgroup_attribution", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 ()>, linkage = #llvm.linkage<external>, res_attrs = [{llvm.range = #llvm.constant_range<i32, 0, -2147483648>}], sym_name = "constant_range_negative", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) : () -> ()

