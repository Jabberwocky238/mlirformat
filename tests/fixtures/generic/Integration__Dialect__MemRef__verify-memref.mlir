"builtin.module"() ({
  "func.func"() <{arg_attrs = [{bufferization.access = "read"}, {bufferization.access = "read"}], function_type = (tensor<*xi8>, tensor<*xi8>) -> i64, sym_name = "verifyMemRefI8", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{arg_attrs = [{bufferization.access = "read"}, {bufferization.access = "read"}], function_type = (tensor<*xi16>, tensor<*xi16>) -> i64, sym_name = "verifyMemRefI16", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{arg_attrs = [{bufferization.access = "read"}, {bufferization.access = "read"}], function_type = (tensor<*xi32>, tensor<*xi32>) -> i64, sym_name = "verifyMemRefI32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{arg_attrs = [{bufferization.access = "read"}, {bufferization.access = "read"}], function_type = (tensor<*xi64>, tensor<*xi64>) -> i64, sym_name = "verifyMemRefI64", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{arg_attrs = [{bufferization.access = "read"}, {bufferization.access = "read"}], function_type = (tensor<*xbf16>, tensor<*xbf16>) -> i64, sym_name = "verifyMemRefBF16", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{arg_attrs = [{bufferization.access = "read"}, {bufferization.access = "read"}], function_type = (tensor<*xf16>, tensor<*xf16>) -> i64, sym_name = "verifyMemRefF16", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{arg_attrs = [{bufferization.access = "read"}, {bufferization.access = "read"}], function_type = (tensor<*xf32>, tensor<*xf32>) -> i64, sym_name = "verifyMemRefF32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{arg_attrs = [{bufferization.access = "read"}, {bufferization.access = "read"}], function_type = (tensor<*xf64>, tensor<*xf64>) -> i64, sym_name = "verifyMemRefF64", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{arg_attrs = [{bufferization.access = "read"}, {bufferization.access = "read"}], function_type = (tensor<*xcomplex<f32>>, tensor<*xcomplex<f32>>) -> i64, sym_name = "verifyMemRefC32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{arg_attrs = [{bufferization.access = "read"}, {bufferization.access = "read"}], function_type = (tensor<*xcomplex<f64>>, tensor<*xcomplex<f64>>) -> i64, sym_name = "verifyMemRefC64", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{arg_attrs = [{bufferization.access = "read"}, {bufferization.access = "read"}], function_type = (tensor<*xindex>, tensor<*xindex>) -> i64, sym_name = "verifyMemRefInd", sym_visibility = "private"}> ({
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
    %22 = "func.call"(%11, %11) <{callee = @verifyMemRefI8}> : (tensor<*xi8>, tensor<*xi8>) -> i64
    "vector.print"(%22) <{punctuation = #vector.punctuation<newline>}> : (i64) -> ()
    %23 = "func.call"(%12, %12) <{callee = @verifyMemRefI16}> : (tensor<*xi16>, tensor<*xi16>) -> i64
    "vector.print"(%23) <{punctuation = #vector.punctuation<newline>}> : (i64) -> ()
    %24 = "func.call"(%13, %13) <{callee = @verifyMemRefI32}> : (tensor<*xi32>, tensor<*xi32>) -> i64
    "vector.print"(%24) <{punctuation = #vector.punctuation<newline>}> : (i64) -> ()
    %25 = "func.call"(%14, %14) <{callee = @verifyMemRefI64}> : (tensor<*xi64>, tensor<*xi64>) -> i64
    "vector.print"(%25) <{punctuation = #vector.punctuation<newline>}> : (i64) -> ()
    %26 = "func.call"(%15, %15) <{callee = @verifyMemRefF16}> : (tensor<*xf16>, tensor<*xf16>) -> i64
    "vector.print"(%26) <{punctuation = #vector.punctuation<newline>}> : (i64) -> ()
    %27 = "func.call"(%16, %16) <{callee = @verifyMemRefBF16}> : (tensor<*xbf16>, tensor<*xbf16>) -> i64
    "vector.print"(%27) <{punctuation = #vector.punctuation<newline>}> : (i64) -> ()
    %28 = "func.call"(%17, %17) <{callee = @verifyMemRefF32}> : (tensor<*xf32>, tensor<*xf32>) -> i64
    "vector.print"(%28) <{punctuation = #vector.punctuation<newline>}> : (i64) -> ()
    %29 = "func.call"(%18, %18) <{callee = @verifyMemRefF64}> : (tensor<*xf64>, tensor<*xf64>) -> i64
    "vector.print"(%29) <{punctuation = #vector.punctuation<newline>}> : (i64) -> ()
    %30 = "func.call"(%19, %19) <{callee = @verifyMemRefC32}> : (tensor<*xcomplex<f32>>, tensor<*xcomplex<f32>>) -> i64
    "vector.print"(%30) <{punctuation = #vector.punctuation<newline>}> : (i64) -> ()
    %31 = "func.call"(%20, %20) <{callee = @verifyMemRefC64}> : (tensor<*xcomplex<f64>>, tensor<*xcomplex<f64>>) -> i64
    "vector.print"(%31) <{punctuation = #vector.punctuation<newline>}> : (i64) -> ()
    %32 = "func.call"(%21, %21) <{callee = @verifyMemRefInd}> : (tensor<*xindex>, tensor<*xindex>) -> i64
    "vector.print"(%32) <{punctuation = #vector.punctuation<newline>}> : (i64) -> ()
    %33 = "arith.constant"() <{value = dense<100> : tensor<3x3xi8>}> : () -> tensor<3x3xi8>
    %34 = "tensor.cast"(%33) : (tensor<3x3xi8>) -> tensor<*xi8>
    %35 = "func.call"(%11, %34) <{callee = @verifyMemRefI8}> : (tensor<*xi8>, tensor<*xi8>) -> i64
    "vector.print"(%35) <{punctuation = #vector.punctuation<newline>}> : (i64) -> ()
    %36 = "arith.constant"() <{value = dense<100> : tensor<3x3xi16>}> : () -> tensor<3x3xi16>
    %37 = "tensor.cast"(%36) : (tensor<3x3xi16>) -> tensor<*xi16>
    %38 = "func.call"(%12, %37) <{callee = @verifyMemRefI16}> : (tensor<*xi16>, tensor<*xi16>) -> i64
    "vector.print"(%38) <{punctuation = #vector.punctuation<newline>}> : (i64) -> ()
    %39 = "arith.constant"() <{value = dense<100> : tensor<3x3xi32>}> : () -> tensor<3x3xi32>
    %40 = "tensor.cast"(%39) : (tensor<3x3xi32>) -> tensor<*xi32>
    %41 = "func.call"(%13, %40) <{callee = @verifyMemRefI32}> : (tensor<*xi32>, tensor<*xi32>) -> i64
    "vector.print"(%41) <{punctuation = #vector.punctuation<newline>}> : (i64) -> ()
    %42 = "arith.constant"() <{value = dense<100> : tensor<3x3xi64>}> : () -> tensor<3x3xi64>
    %43 = "tensor.cast"(%42) : (tensor<3x3xi64>) -> tensor<*xi64>
    %44 = "func.call"(%14, %43) <{callee = @verifyMemRefI64}> : (tensor<*xi64>, tensor<*xi64>) -> i64
    "vector.print"(%44) <{punctuation = #vector.punctuation<newline>}> : (i64) -> ()
    %45 = "arith.constant"() <{value = dense<1.000000e+02> : tensor<3x3xf16>}> : () -> tensor<3x3xf16>
    %46 = "tensor.cast"(%45) : (tensor<3x3xf16>) -> tensor<*xf16>
    %47 = "func.call"(%15, %46) <{callee = @verifyMemRefF16}> : (tensor<*xf16>, tensor<*xf16>) -> i64
    "vector.print"(%47) <{punctuation = #vector.punctuation<newline>}> : (i64) -> ()
    %48 = "arith.constant"() <{value = dense<1.000000e+02> : tensor<3x3xbf16>}> : () -> tensor<3x3xbf16>
    %49 = "tensor.cast"(%48) : (tensor<3x3xbf16>) -> tensor<*xbf16>
    %50 = "func.call"(%16, %49) <{callee = @verifyMemRefBF16}> : (tensor<*xbf16>, tensor<*xbf16>) -> i64
    "vector.print"(%50) <{punctuation = #vector.punctuation<newline>}> : (i64) -> ()
    %51 = "arith.constant"() <{value = dense<1.000000e+02> : tensor<3x3xf32>}> : () -> tensor<3x3xf32>
    %52 = "tensor.cast"(%51) : (tensor<3x3xf32>) -> tensor<*xf32>
    %53 = "func.call"(%17, %52) <{callee = @verifyMemRefF32}> : (tensor<*xf32>, tensor<*xf32>) -> i64
    "vector.print"(%53) <{punctuation = #vector.punctuation<newline>}> : (i64) -> ()
    %54 = "arith.constant"() <{value = dense<1.000000e+02> : tensor<3x3xf64>}> : () -> tensor<3x3xf64>
    %55 = "tensor.cast"(%54) : (tensor<3x3xf64>) -> tensor<*xf64>
    %56 = "func.call"(%18, %55) <{callee = @verifyMemRefF64}> : (tensor<*xf64>, tensor<*xf64>) -> i64
    "vector.print"(%56) <{punctuation = #vector.punctuation<newline>}> : (i64) -> ()
    %57 = "arith.constant"() <{value = dense<(5.000000e+01,1.000000e+00)> : tensor<3x3xcomplex<f32>>}> : () -> tensor<3x3xcomplex<f32>>
    %58 = "tensor.cast"(%57) : (tensor<3x3xcomplex<f32>>) -> tensor<*xcomplex<f32>>
    %59 = "func.call"(%19, %58) <{callee = @verifyMemRefC32}> : (tensor<*xcomplex<f32>>, tensor<*xcomplex<f32>>) -> i64
    "vector.print"(%59) <{punctuation = #vector.punctuation<newline>}> : (i64) -> ()
    %60 = "arith.constant"() <{value = dense<(5.000000e+01,1.000000e+00)> : tensor<3x3xcomplex<f64>>}> : () -> tensor<3x3xcomplex<f64>>
    %61 = "tensor.cast"(%60) : (tensor<3x3xcomplex<f64>>) -> tensor<*xcomplex<f64>>
    %62 = "func.call"(%20, %61) <{callee = @verifyMemRefC64}> : (tensor<*xcomplex<f64>>, tensor<*xcomplex<f64>>) -> i64
    "vector.print"(%62) <{punctuation = #vector.punctuation<newline>}> : (i64) -> ()
    %63 = "arith.constant"() <{value = dense<100> : tensor<3x3xindex>}> : () -> tensor<3x3xindex>
    %64 = "tensor.cast"(%63) : (tensor<3x3xindex>) -> tensor<*xindex>
    %65 = "func.call"(%21, %64) <{callee = @verifyMemRefInd}> : (tensor<*xindex>, tensor<*xindex>) -> i64
    "vector.print"(%65) <{punctuation = #vector.punctuation<newline>}> : (i64) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

