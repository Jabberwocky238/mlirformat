module {
  llvm.func @no_signed_zeros_fp_math_func_true() attributes {no_signed_zeros_fp_math = true} {
    llvm.return
  }
}

// -----
module {
  llvm.func @no_signed_zeros_fp_math_func_false() attributes {no_signed_zeros_fp_math = false} {
    llvm.return
  }
}

// -----
module {
  llvm.func @denormal_fp_math_func_ieee() attributes {denormal_fpenv = #llvm.denormal_fpenv<default_output_mode = ieee, default_input_mode = ieee, float_output_mode = ieee, float_input_mode = ieee>} {
    llvm.return
  }
}

// -----
module {
  llvm.func @denormal_fp_math_f32_func_preserve_sign() attributes {denormal_fpenv = #llvm.denormal_fpenv<default_output_mode = ieee, default_input_mode = ieee, float_output_mode = preservesign, float_input_mode = preservesign>} {
    llvm.return
  }
}

// -----
module {
  llvm.func @denormal_fp_math_dynamic_f32_func_preserve_sign() attributes {denormal_fpenv = #llvm.denormal_fpenv<default_output_mode = dynamic, default_input_mode = dynamic, float_output_mode = preservesign, float_input_mode = preservesign>} {
    llvm.return
  }
}

// -----
module {
  llvm.func @denormal_fp_math_mixed_modes() attributes {denormal_fpenv = #llvm.denormal_fpenv<default_output_mode = dynamic, default_input_mode = positivezero, float_output_mode = dynamic, float_input_mode = ieee>} {
    llvm.return
  }
}

// -----
module {
  llvm.func @fp_contract_func_fast() attributes {fp_contract = "fast"} {
    llvm.return
  }
}

