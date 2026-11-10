module {
  gpu.module @extf_e2m1_bf16 [#xevm.target<chip = "cri">] {
    gpu.func @extf_e2m1_bf16(%arg0: vector<16xf4E2M1FN>) kernel {
      %0 = arith.extf %arg0 : vector<16xf4E2M1FN> to vector<16xbf16>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @extf_e2m1_f16 [#xevm.target<chip = "cri">] {
    gpu.func @extf_e2m1_f16(%arg0: vector<16xf4E2M1FN>) kernel {
      %0 = arith.extf %arg0 : vector<16xf4E2M1FN> to vector<16xf16>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @extf_bf8_f16 [#xevm.target<chip = "cri">] {
    gpu.func @extf_bf8_f16(%arg0: vector<16xf8E5M2>) kernel {
      %0 = arith.extf %arg0 : vector<16xf8E5M2> to vector<16xf16>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @extf_f8_bf16 [#xevm.target<chip = "cri">] {
    gpu.func @extf_f8_bf16(%arg0: vector<16xf8E4M3FN>) kernel {
      %0 = arith.extf %arg0 : vector<16xf8E4M3FN> to vector<16xbf16>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @truncf_f16_e2m1 [#xevm.target<chip = "cri">] {
    gpu.func @truncf_f16_e2m1(%arg0: vector<16xf16>) kernel {
      %0 = arith.truncf %arg0 : vector<16xf16> to vector<16xf4E2M1FN>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @truncf_bf16_f8 [#xevm.target<chip = "cri">] {
    gpu.func @truncf_bf16_f8(%arg0: vector<16xbf16>) kernel {
      %0 = arith.truncf %arg0 : vector<16xbf16> to vector<16xf8E4M3FN>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @extf_passthrough [#xevm.target<chip = "cri">] {
    gpu.func @extf_passthrough(%arg0: vector<16xf16>) kernel {
      %0 = arith.extf %arg0 : vector<16xf16> to vector<16xf32>
      gpu.return
    }
  }
}

