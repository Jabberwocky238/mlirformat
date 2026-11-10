"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, no_signed_zeros_fp_math = true, sym_name = "no_signed_zeros_fp_math_func_true", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, no_signed_zeros_fp_math = false, sym_name = "no_signed_zeros_fp_math_func_false", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, denormal_fpenv = #llvm.denormal_fpenv<default_output_mode = ieee, default_input_mode = ieee, float_output_mode = ieee, float_input_mode = ieee>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "denormal_fp_math_func_ieee", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, denormal_fpenv = #llvm.denormal_fpenv<default_output_mode = ieee, default_input_mode = ieee, float_output_mode = preservesign, float_input_mode = preservesign>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "denormal_fp_math_f32_func_preserve_sign", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, denormal_fpenv = #llvm.denormal_fpenv<default_output_mode = dynamic, default_input_mode = dynamic, float_output_mode = preservesign, float_input_mode = preservesign>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "denormal_fp_math_dynamic_f32_func_preserve_sign", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, denormal_fpenv = #llvm.denormal_fpenv<default_output_mode = dynamic, default_input_mode = positivezero, float_output_mode = dynamic, float_input_mode = ieee>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "denormal_fp_math_mixed_modes", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, fp_contract = "fast", function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "fp_contract_func_fast", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

