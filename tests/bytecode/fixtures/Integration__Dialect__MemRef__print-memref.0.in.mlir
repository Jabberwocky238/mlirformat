"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*xi8>) -> (), sym_name = "printMemrefI8", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (tensor<*xi16>) -> (), sym_name = "printMemrefI16", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":4:3)
  "func.func"() <{function_type = (tensor<*xi32>) -> (), sym_name = "printMemrefI32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = (tensor<*xi64>) -> (), sym_name = "printMemrefI64", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = (tensor<*xbf16>) -> (), sym_name = "printMemrefBF16", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":10:3)
  "func.func"() <{function_type = (tensor<*xf16>) -> (), sym_name = "printMemrefF16", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (tensor<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = (tensor<*xf64>) -> (), sym_name = "printMemrefF64", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":16:3)
  "func.func"() <{function_type = (tensor<*xcomplex<f32>>) -> (), sym_name = "printMemrefC32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":18:3)
  "func.func"() <{function_type = (tensor<*xcomplex<f64>>) -> (), sym_name = "printMemrefC64", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":20:3)
  "func.func"() <{function_type = (tensor<*xindex>) -> (), sym_name = "printMemrefInd", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":22:3)
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = dense<90> : tensor<3x3xi8>}> : () -> tensor<3x3xi8> loc("<stdin>":25:10)
    %1 = "arith.constant"() <{value = dense<1> : tensor<3x3xi16>}> : () -> tensor<3x3xi16> loc("<stdin>":26:10)
    %2 = "arith.constant"() <{value = dense<2> : tensor<3x3xi32>}> : () -> tensor<3x3xi32> loc("<stdin>":27:10)
    %3 = "arith.constant"() <{value = dense<3> : tensor<3x3xi64>}> : () -> tensor<3x3xi64> loc("<stdin>":28:10)
    %4 = "arith.constant"() <{value = dense<1.500000e+00> : tensor<3x3xf16>}> : () -> tensor<3x3xf16> loc("<stdin>":29:10)
    %5 = "arith.constant"() <{value = dense<2.500000e+00> : tensor<3x3xbf16>}> : () -> tensor<3x3xbf16> loc("<stdin>":30:10)
    %6 = "arith.constant"() <{value = dense<3.500000e+00> : tensor<3x3xf32>}> : () -> tensor<3x3xf32> loc("<stdin>":31:10)
    %7 = "arith.constant"() <{value = dense<4.500000e+00> : tensor<3x3xf64>}> : () -> tensor<3x3xf64> loc("<stdin>":32:10)
    %8 = "arith.constant"() <{value = dense<(1.000000e+01,5.000000e+00)> : tensor<3x3xcomplex<f32>>}> : () -> tensor<3x3xcomplex<f32>> loc("<stdin>":33:10)
    %9 = "arith.constant"() <{value = dense<(2.000000e+01,5.000000e+00)> : tensor<3x3xcomplex<f64>>}> : () -> tensor<3x3xcomplex<f64>> loc("<stdin>":34:10)
    %10 = "arith.constant"() <{value = dense<4> : tensor<3x3xindex>}> : () -> tensor<3x3xindex> loc("<stdin>":35:11)
    %11 = "tensor.cast"(%0) : (tensor<3x3xi8>) -> tensor<*xi8> loc("<stdin>":36:11)
    %12 = "tensor.cast"(%1) : (tensor<3x3xi16>) -> tensor<*xi16> loc("<stdin>":37:11)
    %13 = "tensor.cast"(%2) : (tensor<3x3xi32>) -> tensor<*xi32> loc("<stdin>":38:11)
    %14 = "tensor.cast"(%3) : (tensor<3x3xi64>) -> tensor<*xi64> loc("<stdin>":39:11)
    %15 = "tensor.cast"(%4) : (tensor<3x3xf16>) -> tensor<*xf16> loc("<stdin>":40:11)
    %16 = "tensor.cast"(%5) : (tensor<3x3xbf16>) -> tensor<*xbf16> loc("<stdin>":41:11)
    %17 = "tensor.cast"(%6) : (tensor<3x3xf32>) -> tensor<*xf32> loc("<stdin>":42:11)
    %18 = "tensor.cast"(%7) : (tensor<3x3xf64>) -> tensor<*xf64> loc("<stdin>":43:11)
    %19 = "tensor.cast"(%8) : (tensor<3x3xcomplex<f32>>) -> tensor<*xcomplex<f32>> loc("<stdin>":44:11)
    %20 = "tensor.cast"(%9) : (tensor<3x3xcomplex<f64>>) -> tensor<*xcomplex<f64>> loc("<stdin>":45:11)
    %21 = "tensor.cast"(%10) : (tensor<3x3xindex>) -> tensor<*xindex> loc("<stdin>":46:11)
    "func.call"(%11) <{callee = @printMemrefI8}> : (tensor<*xi8>) -> () loc("<stdin>":47:5)
    "func.call"(%12) <{callee = @printMemrefI16}> : (tensor<*xi16>) -> () loc("<stdin>":48:5)
    "func.call"(%13) <{callee = @printMemrefI32}> : (tensor<*xi32>) -> () loc("<stdin>":49:5)
    "func.call"(%14) <{callee = @printMemrefI64}> : (tensor<*xi64>) -> () loc("<stdin>":50:5)
    "func.call"(%15) <{callee = @printMemrefF16}> : (tensor<*xf16>) -> () loc("<stdin>":51:5)
    "func.call"(%16) <{callee = @printMemrefBF16}> : (tensor<*xbf16>) -> () loc("<stdin>":52:5)
    "func.call"(%17) <{callee = @printMemrefF32}> : (tensor<*xf32>) -> () loc("<stdin>":53:5)
    "func.call"(%18) <{callee = @printMemrefF64}> : (tensor<*xf64>) -> () loc("<stdin>":54:5)
    "func.call"(%19) <{callee = @printMemrefC32}> : (tensor<*xcomplex<f32>>) -> () loc("<stdin>":55:5)
    "func.call"(%20) <{callee = @printMemrefC64}> : (tensor<*xcomplex<f64>>) -> () loc("<stdin>":56:5)
    "func.call"(%21) <{callee = @printMemrefInd}> : (tensor<*xindex>) -> () loc("<stdin>":57:5)
    "func.return"() : () -> () loc("<stdin>":58:5)
  }) : () -> () loc("<stdin>":24:3)
}) : () -> () loc("<stdin>":1:1)
