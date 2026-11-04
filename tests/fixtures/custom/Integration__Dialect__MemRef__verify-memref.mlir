module {
  func.func private @verifyMemRefI8(tensor<*xi8> {bufferization.access = "read"}, tensor<*xi8> {bufferization.access = "read"}) -> i64 attributes {llvm.emit_c_interface}
  func.func private @verifyMemRefI16(tensor<*xi16> {bufferization.access = "read"}, tensor<*xi16> {bufferization.access = "read"}) -> i64 attributes {llvm.emit_c_interface}
  func.func private @verifyMemRefI32(tensor<*xi32> {bufferization.access = "read"}, tensor<*xi32> {bufferization.access = "read"}) -> i64 attributes {llvm.emit_c_interface}
  func.func private @verifyMemRefI64(tensor<*xi64> {bufferization.access = "read"}, tensor<*xi64> {bufferization.access = "read"}) -> i64 attributes {llvm.emit_c_interface}
  func.func private @verifyMemRefBF16(tensor<*xbf16> {bufferization.access = "read"}, tensor<*xbf16> {bufferization.access = "read"}) -> i64 attributes {llvm.emit_c_interface}
  func.func private @verifyMemRefF16(tensor<*xf16> {bufferization.access = "read"}, tensor<*xf16> {bufferization.access = "read"}) -> i64 attributes {llvm.emit_c_interface}
  func.func private @verifyMemRefF32(tensor<*xf32> {bufferization.access = "read"}, tensor<*xf32> {bufferization.access = "read"}) -> i64 attributes {llvm.emit_c_interface}
  func.func private @verifyMemRefF64(tensor<*xf64> {bufferization.access = "read"}, tensor<*xf64> {bufferization.access = "read"}) -> i64 attributes {llvm.emit_c_interface}
  func.func private @verifyMemRefC32(tensor<*xcomplex<f32>> {bufferization.access = "read"}, tensor<*xcomplex<f32>> {bufferization.access = "read"}) -> i64 attributes {llvm.emit_c_interface}
  func.func private @verifyMemRefC64(tensor<*xcomplex<f64>> {bufferization.access = "read"}, tensor<*xcomplex<f64>> {bufferization.access = "read"}) -> i64 attributes {llvm.emit_c_interface}
  func.func private @verifyMemRefInd(tensor<*xindex> {bufferization.access = "read"}, tensor<*xindex> {bufferization.access = "read"}) -> i64 attributes {llvm.emit_c_interface}
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
    %0 = call @verifyMemRefI8(%cast, %cast) : (tensor<*xi8>, tensor<*xi8>) -> i64
    vector.print %0 : i64
    %1 = call @verifyMemRefI16(%cast_10, %cast_10) : (tensor<*xi16>, tensor<*xi16>) -> i64
    vector.print %1 : i64
    %2 = call @verifyMemRefI32(%cast_11, %cast_11) : (tensor<*xi32>, tensor<*xi32>) -> i64
    vector.print %2 : i64
    %3 = call @verifyMemRefI64(%cast_12, %cast_12) : (tensor<*xi64>, tensor<*xi64>) -> i64
    vector.print %3 : i64
    %4 = call @verifyMemRefF16(%cast_13, %cast_13) : (tensor<*xf16>, tensor<*xf16>) -> i64
    vector.print %4 : i64
    %5 = call @verifyMemRefBF16(%cast_14, %cast_14) : (tensor<*xbf16>, tensor<*xbf16>) -> i64
    vector.print %5 : i64
    %6 = call @verifyMemRefF32(%cast_15, %cast_15) : (tensor<*xf32>, tensor<*xf32>) -> i64
    vector.print %6 : i64
    %7 = call @verifyMemRefF64(%cast_16, %cast_16) : (tensor<*xf64>, tensor<*xf64>) -> i64
    vector.print %7 : i64
    %8 = call @verifyMemRefC32(%cast_17, %cast_17) : (tensor<*xcomplex<f32>>, tensor<*xcomplex<f32>>) -> i64
    vector.print %8 : i64
    %9 = call @verifyMemRefC64(%cast_18, %cast_18) : (tensor<*xcomplex<f64>>, tensor<*xcomplex<f64>>) -> i64
    vector.print %9 : i64
    %10 = call @verifyMemRefInd(%cast_19, %cast_19) : (tensor<*xindex>, tensor<*xindex>) -> i64
    vector.print %10 : i64
    %cst_20 = arith.constant dense<100> : tensor<3x3xi8>
    %cast_21 = tensor.cast %cst_20 : tensor<3x3xi8> to tensor<*xi8>
    %11 = call @verifyMemRefI8(%cast, %cast_21) : (tensor<*xi8>, tensor<*xi8>) -> i64
    vector.print %11 : i64
    %cst_22 = arith.constant dense<100> : tensor<3x3xi16>
    %cast_23 = tensor.cast %cst_22 : tensor<3x3xi16> to tensor<*xi16>
    %12 = call @verifyMemRefI16(%cast_10, %cast_23) : (tensor<*xi16>, tensor<*xi16>) -> i64
    vector.print %12 : i64
    %cst_24 = arith.constant dense<100> : tensor<3x3xi32>
    %cast_25 = tensor.cast %cst_24 : tensor<3x3xi32> to tensor<*xi32>
    %13 = call @verifyMemRefI32(%cast_11, %cast_25) : (tensor<*xi32>, tensor<*xi32>) -> i64
    vector.print %13 : i64
    %cst_26 = arith.constant dense<100> : tensor<3x3xi64>
    %cast_27 = tensor.cast %cst_26 : tensor<3x3xi64> to tensor<*xi64>
    %14 = call @verifyMemRefI64(%cast_12, %cast_27) : (tensor<*xi64>, tensor<*xi64>) -> i64
    vector.print %14 : i64
    %cst_28 = arith.constant dense<1.000000e+02> : tensor<3x3xf16>
    %cast_29 = tensor.cast %cst_28 : tensor<3x3xf16> to tensor<*xf16>
    %15 = call @verifyMemRefF16(%cast_13, %cast_29) : (tensor<*xf16>, tensor<*xf16>) -> i64
    vector.print %15 : i64
    %cst_30 = arith.constant dense<1.000000e+02> : tensor<3x3xbf16>
    %cast_31 = tensor.cast %cst_30 : tensor<3x3xbf16> to tensor<*xbf16>
    %16 = call @verifyMemRefBF16(%cast_14, %cast_31) : (tensor<*xbf16>, tensor<*xbf16>) -> i64
    vector.print %16 : i64
    %cst_32 = arith.constant dense<1.000000e+02> : tensor<3x3xf32>
    %cast_33 = tensor.cast %cst_32 : tensor<3x3xf32> to tensor<*xf32>
    %17 = call @verifyMemRefF32(%cast_15, %cast_33) : (tensor<*xf32>, tensor<*xf32>) -> i64
    vector.print %17 : i64
    %cst_34 = arith.constant dense<1.000000e+02> : tensor<3x3xf64>
    %cast_35 = tensor.cast %cst_34 : tensor<3x3xf64> to tensor<*xf64>
    %18 = call @verifyMemRefF64(%cast_16, %cast_35) : (tensor<*xf64>, tensor<*xf64>) -> i64
    vector.print %18 : i64
    %cst_36 = arith.constant dense<(5.000000e+01,1.000000e+00)> : tensor<3x3xcomplex<f32>>
    %cast_37 = tensor.cast %cst_36 : tensor<3x3xcomplex<f32>> to tensor<*xcomplex<f32>>
    %19 = call @verifyMemRefC32(%cast_17, %cast_37) : (tensor<*xcomplex<f32>>, tensor<*xcomplex<f32>>) -> i64
    vector.print %19 : i64
    %cst_38 = arith.constant dense<(5.000000e+01,1.000000e+00)> : tensor<3x3xcomplex<f64>>
    %cast_39 = tensor.cast %cst_38 : tensor<3x3xcomplex<f64>> to tensor<*xcomplex<f64>>
    %20 = call @verifyMemRefC64(%cast_18, %cast_39) : (tensor<*xcomplex<f64>>, tensor<*xcomplex<f64>>) -> i64
    vector.print %20 : i64
    %cst_40 = arith.constant dense<100> : tensor<3x3xindex>
    %cast_41 = tensor.cast %cst_40 : tensor<3x3xindex> to tensor<*xindex>
    %21 = call @verifyMemRefInd(%cast_19, %cast_41) : (tensor<*xindex>, tensor<*xindex>) -> i64
    vector.print %21 : i64
    return
  }
}

