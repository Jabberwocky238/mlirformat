"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>, i64)>, linkage = #llvm.linkage<external>, sym_name = "tensormap_replace_global_address", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg15: !llvm.ptr<1>, %arg16: i64):
    "nvvm.tensormap.replace"(%arg15, %arg16) <{field = #nvvm<tensormap_field global_address>}> : (!llvm.ptr<1>, i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>, i32)>, linkage = #llvm.linkage<external>, sym_name = "tensormap_replace_rank", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg13: !llvm.ptr<1>, %arg14: i32):
    "nvvm.tensormap.replace"(%arg13, %arg14) <{field = #nvvm<tensormap_field rank>}> : (!llvm.ptr<1>, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>, i32)>, linkage = #llvm.linkage<external>, sym_name = "tensormap_replace_box_dim", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg11: !llvm.ptr<1>, %arg12: i32):
    "nvvm.tensormap.replace"(%arg11, %arg12) <{field = #nvvm<tensormap_field box_dim>, ord = 1 : i32}> : (!llvm.ptr<1>, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>, i32)>, linkage = #llvm.linkage<external>, sym_name = "tensormap_replace_global_dim", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg9: !llvm.ptr<1>, %arg10: i32):
    "nvvm.tensormap.replace"(%arg9, %arg10) <{field = #nvvm<tensormap_field global_dim>, ord = 1 : i32}> : (!llvm.ptr<1>, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>, i64)>, linkage = #llvm.linkage<external>, sym_name = "tensormap_replace_global_stride", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg7: !llvm.ptr<1>, %arg8: i64):
    "nvvm.tensormap.replace"(%arg7, %arg8) <{field = #nvvm<tensormap_field global_stride>, ord = 1 : i32}> : (!llvm.ptr<1>, i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>, i32)>, linkage = #llvm.linkage<external>, sym_name = "tensormap_replace_element_stride", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg5: !llvm.ptr<1>, %arg6: i32):
    "nvvm.tensormap.replace"(%arg5, %arg6) <{field = #nvvm<tensormap_field element_stride>, ord = 1 : i32}> : (!llvm.ptr<1>, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>)>, linkage = #llvm.linkage<external>, sym_name = "tensormap_replace_elemtype", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: !llvm.ptr<1>):
    "nvvm.tensormap.replace"(%arg4) <{field = #nvvm<tensormap_field elemtype>, new_value_attr = #nvvm.tensormap_elemtype<u8>}> : (!llvm.ptr<1>) -> ()
    "nvvm.tensormap.replace"(%arg4) <{field = #nvvm<tensormap_field elemtype>, new_value_attr = #nvvm.tensormap_elemtype<u16>}> : (!llvm.ptr<1>) -> ()
    "nvvm.tensormap.replace"(%arg4) <{field = #nvvm<tensormap_field elemtype>, new_value_attr = #nvvm.tensormap_elemtype<u32>}> : (!llvm.ptr<1>) -> ()
    "nvvm.tensormap.replace"(%arg4) <{field = #nvvm<tensormap_field elemtype>, new_value_attr = #nvvm.tensormap_elemtype<s32>}> : (!llvm.ptr<1>) -> ()
    "nvvm.tensormap.replace"(%arg4) <{field = #nvvm<tensormap_field elemtype>, new_value_attr = #nvvm.tensormap_elemtype<u64>}> : (!llvm.ptr<1>) -> ()
    "nvvm.tensormap.replace"(%arg4) <{field = #nvvm<tensormap_field elemtype>, new_value_attr = #nvvm.tensormap_elemtype<s64>}> : (!llvm.ptr<1>) -> ()
    "nvvm.tensormap.replace"(%arg4) <{field = #nvvm<tensormap_field elemtype>, new_value_attr = #nvvm.tensormap_elemtype<f16>}> : (!llvm.ptr<1>) -> ()
    "nvvm.tensormap.replace"(%arg4) <{field = #nvvm<tensormap_field elemtype>, new_value_attr = #nvvm.tensormap_elemtype<f32>}> : (!llvm.ptr<1>) -> ()
    "nvvm.tensormap.replace"(%arg4) <{field = #nvvm<tensormap_field elemtype>, new_value_attr = #nvvm.tensormap_elemtype<f32.ftz>}> : (!llvm.ptr<1>) -> ()
    "nvvm.tensormap.replace"(%arg4) <{field = #nvvm<tensormap_field elemtype>, new_value_attr = #nvvm.tensormap_elemtype<f64>}> : (!llvm.ptr<1>) -> ()
    "nvvm.tensormap.replace"(%arg4) <{field = #nvvm<tensormap_field elemtype>, new_value_attr = #nvvm.tensormap_elemtype<bf16>}> : (!llvm.ptr<1>) -> ()
    "nvvm.tensormap.replace"(%arg4) <{field = #nvvm<tensormap_field elemtype>, new_value_attr = #nvvm.tensormap_elemtype<tf32>}> : (!llvm.ptr<1>) -> ()
    "nvvm.tensormap.replace"(%arg4) <{field = #nvvm<tensormap_field elemtype>, new_value_attr = #nvvm.tensormap_elemtype<tf32.ftz>}> : (!llvm.ptr<1>) -> ()
    "nvvm.tensormap.replace"(%arg4) <{field = #nvvm<tensormap_field elemtype>, new_value_attr = #nvvm.tensormap_elemtype<b4x16>}> : (!llvm.ptr<1>) -> ()
    "nvvm.tensormap.replace"(%arg4) <{field = #nvvm<tensormap_field elemtype>, new_value_attr = #nvvm.tensormap_elemtype<b4x16_p64>}> : (!llvm.ptr<1>) -> ()
    "nvvm.tensormap.replace"(%arg4) <{field = #nvvm<tensormap_field elemtype>, new_value_attr = #nvvm.tensormap_elemtype<b6x16_p32>}> : (!llvm.ptr<1>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>)>, linkage = #llvm.linkage<external>, sym_name = "tensormap_replace_interleave_layout", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg3: !llvm.ptr<1>):
    "nvvm.tensormap.replace"(%arg3) <{field = #nvvm<tensormap_field interleave_layout>, new_value_attr = #nvvm.tensormap_interleave_layout<no_interleave>}> : (!llvm.ptr<1>) -> ()
    "nvvm.tensormap.replace"(%arg3) <{field = #nvvm<tensormap_field interleave_layout>, new_value_attr = #nvvm.tensormap_interleave_layout<b16>}> : (!llvm.ptr<1>) -> ()
    "nvvm.tensormap.replace"(%arg3) <{field = #nvvm<tensormap_field interleave_layout>, new_value_attr = #nvvm.tensormap_interleave_layout<b32>}> : (!llvm.ptr<1>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>)>, linkage = #llvm.linkage<external>, sym_name = "tensormap_replace_swizzle_mode", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: !llvm.ptr<1>):
    "nvvm.tensormap.replace"(%arg2) <{field = #nvvm<tensormap_field swizzle_mode>, new_value_attr = #nvvm.tensormap_swizzle_mode<no_swizzling>}> : (!llvm.ptr<1>) -> ()
    "nvvm.tensormap.replace"(%arg2) <{field = #nvvm<tensormap_field swizzle_mode>, new_value_attr = #nvvm.tensormap_swizzle_mode<b32>}> : (!llvm.ptr<1>) -> ()
    "nvvm.tensormap.replace"(%arg2) <{field = #nvvm<tensormap_field swizzle_mode>, new_value_attr = #nvvm.tensormap_swizzle_mode<b64>}> : (!llvm.ptr<1>) -> ()
    "nvvm.tensormap.replace"(%arg2) <{field = #nvvm<tensormap_field swizzle_mode>, new_value_attr = #nvvm.tensormap_swizzle_mode<b128>}> : (!llvm.ptr<1>) -> ()
    "nvvm.tensormap.replace"(%arg2) <{field = #nvvm<tensormap_field swizzle_mode>, new_value_attr = #nvvm.tensormap_swizzle_mode<b96>}> : (!llvm.ptr<1>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>)>, linkage = #llvm.linkage<external>, sym_name = "tensormap_replace_swizzle_atomicity", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg1: !llvm.ptr<1>):
    "nvvm.tensormap.replace"(%arg1) <{field = #nvvm<tensormap_field swizzle_atomicity>, new_value_attr = #nvvm.tensormap_swizzle_atomicity<b16>}> : (!llvm.ptr<1>) -> ()
    "nvvm.tensormap.replace"(%arg1) <{field = #nvvm<tensormap_field swizzle_atomicity>, new_value_attr = #nvvm.tensormap_swizzle_atomicity<b32>}> : (!llvm.ptr<1>) -> ()
    "nvvm.tensormap.replace"(%arg1) <{field = #nvvm<tensormap_field swizzle_atomicity>, new_value_attr = #nvvm.tensormap_swizzle_atomicity<b32_flip_b8>}> : (!llvm.ptr<1>) -> ()
    "nvvm.tensormap.replace"(%arg1) <{field = #nvvm<tensormap_field swizzle_atomicity>, new_value_attr = #nvvm.tensormap_swizzle_atomicity<b64>}> : (!llvm.ptr<1>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>)>, linkage = #llvm.linkage<external>, sym_name = "tensormap_replace_fill_mode", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr<1>):
    "nvvm.tensormap.replace"(%arg0) <{field = #nvvm<tensormap_field fill_mode>, new_value_attr = #nvvm.tensormap_fill_mode<zero>}> : (!llvm.ptr<1>) -> ()
    "nvvm.tensormap.replace"(%arg0) <{field = #nvvm<tensormap_field fill_mode>, new_value_attr = #nvvm.tensormap_fill_mode<oob_nan>}> : (!llvm.ptr<1>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

