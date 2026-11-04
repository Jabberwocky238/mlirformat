module {
  llvm.func @foo()
  llvm.func @bar(i64, i64) -> i64
  llvm.func @baz(%arg0: i64) -> i64 {
    llvm.return %arg0 : i64
  }
  llvm.func @qux(!llvm.ptr {llvm.noalias}, i64) attributes {xxx = {yyy = 42 : i64}}
  llvm.func @roundtrip1()
  llvm.func @roundtrip2(i64, f32) -> f64
  llvm.func @roundtrip3(i32, i1)
  llvm.func @roundtrip4(%arg0: i32, %arg1: i1) {
    llvm.return
  }
  llvm.func @roundtrip5() attributes {baz = 42 : i64, foo = "bar"}
  llvm.func @roundtrip6() attributes {baz = 42 : i64, foo = "bar"} {
    llvm.return
  }
  llvm.func @roundtrip7() {
    llvm.return
  }
  llvm.func @roundtrip8() -> i32
  llvm.func @roundtrip9(!llvm.ptr {llvm.noalias})
  llvm.func @roundtrip10(!llvm.ptr {llvm.noalias})
  llvm.func @roundtrip11(%arg0: !llvm.ptr {llvm.noalias}) {
    llvm.return
  }
  llvm.func @roundtrip12(%arg0: !llvm.ptr {llvm.noalias}) attributes {foo = 42 : i32} {
    llvm.return
  }
  llvm.func @byvalattr(%arg0: !llvm.ptr {llvm.byval = i32}) {
    llvm.return
  }
  llvm.func @sretattr(%arg0: !llvm.ptr {llvm.sret = i32}) {
    llvm.return
  }
  llvm.func @nestattr(%arg0: !llvm.ptr {llvm.nest}) {
    llvm.return
  }
  llvm.func @llvm_noalias_decl(!llvm.ptr {llvm.noalias})
  llvm.func @byrefattr_decl(!llvm.ptr {llvm.byref = i32})
  llvm.func @byvalattr_decl(!llvm.ptr {llvm.byval = i32})
  llvm.func @sretattr_decl(!llvm.ptr {llvm.sret = i32})
  llvm.func @nestattr_decl(!llvm.ptr {llvm.nest})
  llvm.func @noundefattr_decl(i32 {llvm.noundef})
  llvm.func @llvm_align_decl(!llvm.ptr {llvm.align = 4 : i64})
  llvm.func @inallocaattr_decl(!llvm.ptr {llvm.inalloca = i32})
  llvm.func @variadic(...)
  llvm.func @variadic_args(i32, i32, ...)
  llvm.func internal @internal_func() {
    llvm.return
  }
  llvm.func weak @weak_linkage() {
    llvm.return
  }
  llvm.func ptx_kernelcc @calling_conv() {
    llvm.return
  }
  llvm.func @external_func()
  llvm.func @arg_struct_attr(%arg0: !llvm.struct<(i32)> {llvm.struct_attrs = [{llvm.noalias}]}) {
    llvm.return
  }
  llvm.func @res_struct_attr(%arg0: !llvm.struct<(i32)>) -> (!llvm.struct<(i32)> {llvm.struct_attrs = [{llvm.noalias}]}) {
    llvm.return %arg0 : !llvm.struct<(i32)>
  }
  llvm.func @cconv1() {
    llvm.return
  }
  llvm.func weak @cconv2() {
    llvm.return
  }
  llvm.func weak fastcc @cconv3() {
    llvm.return
  }
  llvm.func cc_10 @cconv4() {
    llvm.return
  }
  llvm.func @test_ccs() {
    %0 = llvm.mlir.addressof @cconv4 : !llvm.ptr
    llvm.call @cconv1() : () -> ()
    llvm.call @cconv2() : () -> ()
    llvm.call fastcc @cconv3() : () -> ()
    llvm.call cc_10 %0() : !llvm.ptr, () -> ()
    llvm.return
  }
  llvm.func @variadic_def(...) {
    llvm.return
  }
  llvm.func @memory_attr() attributes {memory = #llvm.memory_effects<other = none, argMem = read, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} {
    llvm.return
  }
  llvm.func hidden @hidden() {
    llvm.return
  }
  llvm.func protected @protected() {
    llvm.return
  }
  llvm.func local_unnamed_addr @local_unnamed_addr_func() {
    llvm.return
  }
  llvm.func @align_func() attributes {alignment = 2 : i64} {
    llvm.return
  }
  llvm.comdat @__llvm_comdat {
    llvm.comdat_selector @any any
  }
  llvm.func @any() comdat(@__llvm_comdat::@any) attributes {dso_local} {
    llvm.return
  }
  llvm.func @vscale_roundtrip() vscale_range(1, 2) {
    llvm.return
  }
  llvm.func @frame_pointer_roundtrip() attributes {frame_pointer = #llvm.framePointerKind<"non-leaf">} {
    llvm.return
  }
  llvm.func @no_infs_fp_math_roundtrip() attributes {no_infs_fp_math = true} {
    llvm.return
  }
  llvm.func @no_nans_fp_math_roundtrip() attributes {no_nans_fp_math = true} {
    llvm.return
  }
  llvm.func @no_signed_zeros_fp_math_roundtrip() attributes {no_signed_zeros_fp_math = true} {
    llvm.return
  }
  llvm.func @convergent_function() attributes {convergent} {
    llvm.return
  }
  llvm.func @denormal_fp_math_roundtrip() attributes {denormal_fp_math = "preserve-sign"} {
    llvm.return
  }
  llvm.func @denormal_fp_math_f32_roundtrip() attributes {denormal_fp_math_f32 = "preserve-sign"} {
    llvm.return
  }
  llvm.func @fp_contract_roundtrip() attributes {fp_contract = "fast"} {
    llvm.return
  }
  llvm.func @instrument_function_entry_function() attributes {instrument_function_entry = "__cyg_profile_func_enter"} {
    llvm.return
  }
  llvm.func @instrument_function_exit_function() attributes {instrument_function_exit = "__cyg_profile_func_exit"} {
    llvm.return
  }
  llvm.func @nounwind_function() attributes {no_unwind} {
    llvm.return
  }
  llvm.func @willreturn_function() attributes {will_return} {
    llvm.return
  }
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
module {
  llvm.func @vec_type_hint() attributes {vec_type_hint = #llvm.vec_type_hint<hint = i32>}
  llvm.func @vec_type_hint_signed() attributes {vec_type_hint = #llvm.vec_type_hint<hint = i32, is_signed = true>}
  llvm.func @vec_type_hint_signed_vec() attributes {vec_type_hint = #llvm.vec_type_hint<hint = vector<2xi32>, is_signed = true>}
  llvm.func @vec_type_hint_float_vec() attributes {vec_type_hint = #llvm.vec_type_hint<hint = vector<3xf32>>}
  llvm.func @vec_type_hint_bfloat_vec() attributes {vec_type_hint = #llvm.vec_type_hint<hint = vector<8xbf16>>}
}

// -----
module {
  llvm.func @work_group_size_hint() attributes {work_group_size_hint = array<i32: 128, 128, 128>}
}

// -----
module {
  llvm.func @reqd_work_group_size_hint() attributes {reqd_work_group_size = array<i32: 128, 256, 128>}
}

// -----
module {
  llvm.func @intel_reqd_sub_group_size_hint() attributes {llvm.intel_reqd_sub_group_size = 32 : i32}
}

// -----
module {
  llvm.func @workgroup_attribution(!llvm.ptr {llvm.workgroup_attribution = #llvm.mlir.workgroup_attribution<512 : i64, i32>}, !llvm.ptr {llvm.workgroup_attribution = #llvm.mlir.workgroup_attribution<128 : i64, !llvm.struct<(i32, i64, f32)>>})
}

// -----
module {
  llvm.func @constant_range_negative() -> (i32 {llvm.range = #llvm.constant_range<i32, 0, -2147483648>})
}

