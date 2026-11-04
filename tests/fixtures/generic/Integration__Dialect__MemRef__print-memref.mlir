"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*xi8>) -> (), sym_name = "printMemrefI8", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = (tensor<*xi16>) -> (), sym_name = "printMemrefI16", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = (tensor<*xi32>) -> (), sym_name = "printMemrefI32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = (tensor<*xi64>) -> (), sym_name = "printMemrefI64", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = (tensor<*xbf16>) -> (), sym_name = "printMemrefBF16", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = (tensor<*xf16>) -> (), sym_name = "printMemrefF16", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = (tensor<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = (tensor<*xf64>) -> (), sym_name = "printMemrefF64", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = (tensor<*xcomplex<f32>>) -> (), sym_name = "printMemrefC32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = (tensor<*xcomplex<f64>>) -> (), sym_name = "printMemrefC64", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = (tensor<*xindex>) -> (), sym_name = "printMemrefInd", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = dense<90> : tensor<3x3xi8>}> : () -> tensor<3x3xi8>
    %1 = "arith.constant"() <{value = dense<1> : tensor<3x3xi16>}> : () -> tensor<3x3xi16>
    %2 = "arith.constant"() <{value = dense<2> : tensor<3x3xi32>}> : () -> tensor<3x3xi32>
    %3 = "arith.constant"() <{value = dense<3> : tensor<3x3xi64>}> : () -> tensor<3x3xi64>
    %4 = "arith.constant"() <{value = dense<1.500000e+00> : tensor<3x3xf16>}> : () -> tensor<3x3xf16>
    %5 = "arith.constant"() <{value = dense<2.500000e+00> : tensor<3x3xbf16>}> : () -> tensor<3x3xbf16>
    %6 = "arith.constant"() <{value = dense<3.500000e+00> : tensor<3x3xf32>}> : () -> tensor<3x3xf32>
    %7 = "arith.constant"() <{value = dense<4.500000e+00> : tensor<3x3xf64>}> : () -> tensor<3x3xf64>
    %8 = "arith.constant"() <{value = dense<(1.000000e+01,5.000000e+00)> : tensor<3x3xcomplex<f32>>}> : () -> tensor<3x3xcomplex<f32>>
    %9 = "arith.constant"() <{value = dense<(2.000000e+01,5.000000e+00)> : tensor<3x3xcomplex<f64>>}> : () -> tensor<3x3xcomplex<f64>>
    %10 = "arith.constant"() <{value = dense<4> : tensor<3x3xindex>}> : () -> tensor<3x3xindex>
    %11 = "tensor.cast"(%0) : (tensor<3x3xi8>) -> tensor<*xi8>
    %12 = "tensor.cast"(%1) : (tensor<3x3xi16>) -> tensor<*xi16>
    %13 = "tensor.cast"(%2) : (tensor<3x3xi32>) -> tensor<*xi32>
    %14 = "tensor.cast"(%3) : (tensor<3x3xi64>) -> tensor<*xi64>
    %15 = "tensor.cast"(%4) : (tensor<3x3xf16>) -> tensor<*xf16>
    %16 = "tensor.cast"(%5) : (tensor<3x3xbf16>) -> tensor<*xbf16>
    %17 = "tensor.cast"(%6) : (tensor<3x3xf32>) -> tensor<*xf32>
    %18 = "tensor.cast"(%7) : (tensor<3x3xf64>) -> tensor<*xf64>
    %19 = "tensor.cast"(%8) : (tensor<3x3xcomplex<f32>>) -> tensor<*xcomplex<f32>>
    %20 = "tensor.cast"(%9) : (tensor<3x3xcomplex<f64>>) -> tensor<*xcomplex<f64>>
    %21 = "tensor.cast"(%10) : (tensor<3x3xindex>) -> tensor<*xindex>
    "func.call"(%11) <{callee = @printMemrefI8}> : (tensor<*xi8>) -> ()
    "func.call"(%12) <{callee = @printMemrefI16}> : (tensor<*xi16>) -> ()
    "func.call"(%13) <{callee = @printMemrefI32}> : (tensor<*xi32>) -> ()
    "func.call"(%14) <{callee = @printMemrefI64}> : (tensor<*xi64>) -> ()
    "func.call"(%15) <{callee = @printMemrefF16}> : (tensor<*xf16>) -> ()
    "func.call"(%16) <{callee = @printMemrefBF16}> : (tensor<*xbf16>) -> ()
    "func.call"(%17) <{callee = @printMemrefF32}> : (tensor<*xf32>) -> ()
    "func.call"(%18) <{callee = @printMemrefF64}> : (tensor<*xf64>) -> ()
    "func.call"(%19) <{callee = @printMemrefC32}> : (tensor<*xcomplex<f32>>) -> ()
    "func.call"(%20) <{callee = @printMemrefC64}> : (tensor<*xcomplex<f64>>) -> ()
    "func.call"(%21) <{callee = @printMemrefInd}> : (tensor<*xindex>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

