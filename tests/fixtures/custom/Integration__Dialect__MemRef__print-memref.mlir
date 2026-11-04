module {
  func.func private @printMemrefI8(tensor<*xi8>) attributes {llvm.emit_c_interface}
  func.func private @printMemrefI16(tensor<*xi16>) attributes {llvm.emit_c_interface}
  func.func private @printMemrefI32(tensor<*xi32>) attributes {llvm.emit_c_interface}
  func.func private @printMemrefI64(tensor<*xi64>) attributes {llvm.emit_c_interface}
  func.func private @printMemrefBF16(tensor<*xbf16>) attributes {llvm.emit_c_interface}
  func.func private @printMemrefF16(tensor<*xf16>) attributes {llvm.emit_c_interface}
  func.func private @printMemrefF32(tensor<*xf32>) attributes {llvm.emit_c_interface}
  func.func private @printMemrefF64(tensor<*xf64>) attributes {llvm.emit_c_interface}
  func.func private @printMemrefC32(tensor<*xcomplex<f32>>) attributes {llvm.emit_c_interface}
  func.func private @printMemrefC64(tensor<*xcomplex<f64>>) attributes {llvm.emit_c_interface}
  func.func private @printMemrefInd(tensor<*xindex>) attributes {llvm.emit_c_interface}
  func.func @entry() {
    %cst = arith.constant dense<90> : tensor<3x3xi8>
    %cst_0 = arith.constant dense<1> : tensor<3x3xi16>
    %cst_1 = arith.constant dense<2> : tensor<3x3xi32>
    %cst_2 = arith.constant dense<3> : tensor<3x3xi64>
    %cst_3 = arith.constant dense<1.500000e+00> : tensor<3x3xf16>
    %cst_4 = arith.constant dense<2.500000e+00> : tensor<3x3xbf16>
    %cst_5 = arith.constant dense<3.500000e+00> : tensor<3x3xf32>
    %cst_6 = arith.constant dense<4.500000e+00> : tensor<3x3xf64>
    %cst_7 = arith.constant dense<(1.000000e+01,5.000000e+00)> : tensor<3x3xcomplex<f32>>
    %cst_8 = arith.constant dense<(2.000000e+01,5.000000e+00)> : tensor<3x3xcomplex<f64>>
    %cst_9 = arith.constant dense<4> : tensor<3x3xindex>
    %cast = tensor.cast %cst : tensor<3x3xi8> to tensor<*xi8>
    %cast_10 = tensor.cast %cst_0 : tensor<3x3xi16> to tensor<*xi16>
    %cast_11 = tensor.cast %cst_1 : tensor<3x3xi32> to tensor<*xi32>
    %cast_12 = tensor.cast %cst_2 : tensor<3x3xi64> to tensor<*xi64>
    %cast_13 = tensor.cast %cst_3 : tensor<3x3xf16> to tensor<*xf16>
    %cast_14 = tensor.cast %cst_4 : tensor<3x3xbf16> to tensor<*xbf16>
    %cast_15 = tensor.cast %cst_5 : tensor<3x3xf32> to tensor<*xf32>
    %cast_16 = tensor.cast %cst_6 : tensor<3x3xf64> to tensor<*xf64>
    %cast_17 = tensor.cast %cst_7 : tensor<3x3xcomplex<f32>> to tensor<*xcomplex<f32>>
    %cast_18 = tensor.cast %cst_8 : tensor<3x3xcomplex<f64>> to tensor<*xcomplex<f64>>
    %cast_19 = tensor.cast %cst_9 : tensor<3x3xindex> to tensor<*xindex>
    call @printMemrefI8(%cast) : (tensor<*xi8>) -> ()
    call @printMemrefI16(%cast_10) : (tensor<*xi16>) -> ()
    call @printMemrefI32(%cast_11) : (tensor<*xi32>) -> ()
    call @printMemrefI64(%cast_12) : (tensor<*xi64>) -> ()
    call @printMemrefF16(%cast_13) : (tensor<*xf16>) -> ()
    call @printMemrefBF16(%cast_14) : (tensor<*xbf16>) -> ()
    call @printMemrefF32(%cast_15) : (tensor<*xf32>) -> ()
    call @printMemrefF64(%cast_16) : (tensor<*xf64>) -> ()
    call @printMemrefC32(%cast_17) : (tensor<*xcomplex<f32>>) -> ()
    call @printMemrefC64(%cast_18) : (tensor<*xcomplex<f64>>) -> ()
    call @printMemrefInd(%cast_19) : (tensor<*xindex>) -> ()
    return
  }
}

