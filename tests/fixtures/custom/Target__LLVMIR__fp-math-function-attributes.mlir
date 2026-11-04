module {
  llvm.func @no_infs_fp_math_func_true() attributes {no_infs_fp_math = true} {
    llvm.return
  }
}

// -----
module {
  llvm.func @no_infs_fp_math_func_false() attributes {no_infs_fp_math = false} {
    llvm.return
  }
}

// -----
module {
  llvm.func @no_nans_fp_math_func_true() attributes {no_nans_fp_math = true} {
    llvm.return
  }
}

// -----
module {
  llvm.func @no_nans_fp_math_func_false() attributes {no_nans_fp_math = false} {
    llvm.return
  }
}

// -----
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
  llvm.func @denormal_fp_math_func_ieee() attributes {denormal_fp_math = "ieee"} {
    llvm.return
  }
}

// -----
module {
  llvm.func @denormal_fp_math_f32_func_preserve_sign() attributes {denormal_fp_math_f32 = "preserve-sign"} {
    llvm.return
  }
}

// -----
module {
  llvm.func @fp_contract_func_fast() attributes {fp_contract = "fast"} {
    llvm.return
  }
}

