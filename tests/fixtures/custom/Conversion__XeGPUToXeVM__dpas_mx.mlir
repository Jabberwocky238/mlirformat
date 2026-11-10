module {
  gpu.module @dpas_mx_bf8 [#xevm.target<chip = "cri">] {
    gpu.func @dpas_mx_bf8(%arg0: vector<16xf8E5M2>, %arg1: vector<32xf8E5M2>, %arg2: vector<8xf32>, %arg3: vector<1xf8E8M0FNU>, %arg4: vector<1xf8E8M0FNU>) kernel {
      %0 = xegpu.dpas_mx %arg0, %arg1, %arg2 scale_a = %arg3 scale_b = %arg4 : (vector<16xf8E5M2>, vector<32xf8E5M2>, vector<8xf32>, vector<1xf8E8M0FNU>, vector<1xf8E8M0FNU>) -> vector<8xf32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @dpas_mx_f8 [#xevm.target<chip = "cri">] {
    gpu.func @dpas_mx_f8(%arg0: vector<16xf8E4M3FN>, %arg1: vector<32xf8E4M3FN>, %arg2: vector<8xf32>, %arg3: vector<1xf8E8M0FNU>, %arg4: vector<1xf8E8M0FNU>) kernel {
      %0 = xegpu.dpas_mx %arg0, %arg1, %arg2 scale_a = %arg3 scale_b = %arg4 : (vector<16xf8E4M3FN>, vector<32xf8E4M3FN>, vector<8xf32>, vector<1xf8E8M0FNU>, vector<1xf8E8M0FNU>) -> vector<8xf32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @dpas_mx_e2m1 [#xevm.target<chip = "cri">] {
    gpu.func @dpas_mx_e2m1(%arg0: vector<32xf4E2M1FN>, %arg1: vector<64xf4E2M1FN>, %arg2: vector<8xf32>, %arg3: vector<2xf8E8M0FNU>, %arg4: vector<2xf8E8M0FNU>) kernel {
      %0 = xegpu.dpas_mx %arg0, %arg1, %arg2 scale_a = %arg3 scale_b = %arg4 : (vector<32xf4E2M1FN>, vector<64xf4E2M1FN>, vector<8xf32>, vector<2xf8E8M0FNU>, vector<2xf8E8M0FNU>) -> vector<8xf32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @dpas_mx_no_acc [#xevm.target<chip = "cri">] {
    gpu.func @dpas_mx_no_acc(%arg0: vector<32xf4E2M1FN>, %arg1: vector<64xf4E2M1FN>, %arg2: vector<2xf8E8M0FNU>, %arg3: vector<2xf8E8M0FNU>) kernel {
      %0 = xegpu.dpas_mx %arg0, %arg1 scale_a = %arg2 scale_b = %arg3 : (vector<32xf4E2M1FN>, vector<64xf4E2M1FN>, vector<2xf8E8M0FNU>, vector<2xf8E8M0FNU>) -> vector<8xf32>
      gpu.return
    }
  }
}

