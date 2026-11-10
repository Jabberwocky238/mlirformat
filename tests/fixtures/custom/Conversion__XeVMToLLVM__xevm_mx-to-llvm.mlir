module {
  llvm.func @truncf_f16_to_bf8(%arg0: vector<16xf16>) -> vector<16xi8> {
    %0 = xevm.truncf %arg0 {src_etype = f16, dst_etype = bf8} : (vector<16xf16>) -> vector<16xi8>
    llvm.return %0 : vector<16xi8>
  }
}

// -----
module {
  llvm.func @truncf_f16_to_hf8(%arg0: vector<16xf16>) -> vector<16xi8> {
    %0 = xevm.truncf %arg0 {src_etype = f16, dst_etype = f8} : (vector<16xf16>) -> vector<16xi8>
    llvm.return %0 : vector<16xi8>
  }
}

// -----
module {
  llvm.func @truncf_bf16_to_bf8(%arg0: vector<16xbf16>) -> vector<16xi8> {
    %0 = xevm.truncf %arg0 {src_etype = bf16, dst_etype = bf8} : (vector<16xbf16>) -> vector<16xi8>
    llvm.return %0 : vector<16xi8>
  }
}

// -----
module {
  llvm.func @truncf_bf16_to_hf8(%arg0: vector<16xbf16>) -> vector<16xi8> {
    %0 = xevm.truncf %arg0 {src_etype = bf16, dst_etype = f8} : (vector<16xbf16>) -> vector<16xi8>
    llvm.return %0 : vector<16xi8>
  }
}

// -----
module {
  llvm.func @truncf_f16_to_e2m1(%arg0: vector<16xf16>) -> vector<8xi8> {
    %0 = xevm.truncf %arg0 {src_etype = f16, dst_etype = e2m1} : (vector<16xf16>) -> vector<8xi8>
    llvm.return %0 : vector<8xi8>
  }
}

// -----
module {
  llvm.func @truncf_bf16_to_e2m1(%arg0: vector<16xbf16>) -> vector<8xi8> {
    %0 = xevm.truncf %arg0 {src_etype = bf16, dst_etype = e2m1} : (vector<16xbf16>) -> vector<8xi8>
    llvm.return %0 : vector<8xi8>
  }
}

// -----
module {
  llvm.func @extf_bf8_to_f16(%arg0: vector<16xi8>) -> vector<16xf16> {
    %0 = xevm.extf %arg0 {src_etype = bf8, dst_etype = f16} : (vector<16xi8>) -> vector<16xf16>
    llvm.return %0 : vector<16xf16>
  }
}

// -----
module {
  llvm.func @extf_f8_to_f16(%arg0: vector<16xi8>) -> vector<16xf16> {
    %0 = xevm.extf %arg0 {src_etype = f8, dst_etype = f16} : (vector<16xi8>) -> vector<16xf16>
    llvm.return %0 : vector<16xf16>
  }
}

// -----
module {
  llvm.func @extf_bf8_to_bf16(%arg0: vector<16xi8>) -> vector<16xbf16> {
    %0 = xevm.extf %arg0 {src_etype = bf8, dst_etype = bf16} : (vector<16xi8>) -> vector<16xbf16>
    llvm.return %0 : vector<16xbf16>
  }
}

// -----
module {
  llvm.func @extf_f8_to_bf16(%arg0: vector<16xi8>) -> vector<16xbf16> {
    %0 = xevm.extf %arg0 {src_etype = f8, dst_etype = bf16} : (vector<16xi8>) -> vector<16xbf16>
    llvm.return %0 : vector<16xbf16>
  }
}

// -----
module {
  llvm.func @extf_e2m1_to_f16(%arg0: vector<8xi8>) -> vector<16xf16> {
    %0 = xevm.extf %arg0 {src_etype = e2m1, dst_etype = f16} : (vector<8xi8>) -> vector<16xf16>
    llvm.return %0 : vector<16xf16>
  }
}

// -----
module {
  llvm.func @extf_e2m1_to_bf16(%arg0: vector<8xi8>) -> vector<16xbf16> {
    %0 = xevm.extf %arg0 {src_etype = e2m1, dst_etype = bf16} : (vector<8xi8>) -> vector<16xbf16>
    llvm.return %0 : vector<16xbf16>
  }
}

// -----
module {
  llvm.func @mma_mx_bf8_bf8_k32_f32(%arg0: vector<8xi16>, %arg1: vector<8xi32>, %arg2: i8, %arg3: i8, %arg4: vector<8xf32>) -> vector<8xf32> {
    %0 = xevm.mma_mx %arg0, %arg1, %arg2, %arg3, %arg4 {shape = <m = 8, n = 16, k = 32>, types = <d = f32, a = bf8, b = bf8, c = f32>} : (vector<8xi16>, vector<8xi32>, i8, i8, vector<8xf32>) -> vector<8xf32>
    llvm.return %0 : vector<8xf32>
  }
}

