#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed), posWidth = 64, crdWidth = 32 }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : dense, d2 : compressed), posWidth = 64, crdWidth = 32 }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : compressed, d2 : dense), posWidth = 64, crdWidth = 32 }>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = dense<[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00]> : tensor<8xf32>}> : () -> tensor<8xf32>
    %3 = "arith.constant"() <{value = dense<[0, 3]> : tensor<2xi64>}> : () -> tensor<2xi64>
    %4 = "arith.constant"() <{value = dense<[0, 2, 3]> : tensor<3xi32>}> : () -> tensor<3xi32>
    %5 = "arith.constant"() <{value = dense<[0, 2, 4, 5]> : tensor<4xi64>}> : () -> tensor<4xi64>
    %6 = "arith.constant"() <{value = dense<[0, 1, 1, 2, 1]> : tensor<5xi32>}> : () -> tensor<5xi32>
    %7 = "arith.constant"() <{value = dense<[0, 2, 4, 5, 7, 8]> : tensor<6xi64>}> : () -> tensor<6xi64>
    %8 = "arith.constant"() <{value = dense<[0, 1, 0, 1, 0, 0, 1, 0]> : tensor<8xi32>}> : () -> tensor<8xi32>
    %9 = "sparse_tensor.assemble"(%3, %4, %5, %6, %7, %8, %2) : (tensor<2xi64>, tensor<3xi32>, tensor<4xi64>, tensor<5xi32>, tensor<6xi64>, tensor<8xi32>, tensor<8xf32>) -> tensor<4x3x2xf32, #sparse>
    %10 = "arith.constant"() <{value = dense<[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00, 9.000000e+00, 1.000000e+01, 1.100000e+01, 1.200000e+01, 1.300000e+01, 1.400000e+01, 1.500000e+01, 1.600000e+01]> : tensor<16xf32>}> : () -> tensor<16xf32>
    %11 = "arith.constant"() <{value = dense<[0, 2, 3, 4, 6, 6, 7, 9, 11, 13, 14, 15, 16]> : tensor<13xi64>}> : () -> tensor<13xi64>
    %12 = "arith.constant"() <{value = dense<[0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1]> : tensor<16xi32>}> : () -> tensor<16xi32>
    %13 = "sparse_tensor.assemble"(%11, %12, %10) : (tensor<13xi64>, tensor<16xi32>, tensor<16xf32>) -> tensor<4x3x2xf32, #sparse1>
    %14 = "arith.constant"() <{value = dense<[1.000000e+00, 2.000000e+00, 0.000000e+00, 3.000000e+00, 4.000000e+00, 0.000000e+00, 5.000000e+00, 6.000000e+00, 0.000000e+00, 7.000000e+00, 8.000000e+00, 9.000000e+00, 1.000000e+01, 1.100000e+01, 1.200000e+01, 1.300000e+01, 1.400000e+01, 0.000000e+00, 0.000000e+00, 1.500000e+01, 0.000000e+00, 1.600000e+01]> : tensor<22xf32>}> : () -> tensor<22xf32>
    %15 = "arith.constant"() <{value = dense<[0, 3, 5, 8, 11]> : tensor<5xi64>}> : () -> tensor<5xi64>
    %16 = "arith.constant"() <{value = dense<[0, 1, 2, 0, 2, 0, 1, 2, 0, 1, 2]> : tensor<11xi32>}> : () -> tensor<11xi32>
    %17 = "sparse_tensor.assemble"(%15, %16, %14) : (tensor<5xi64>, tensor<11xi32>, tensor<22xf32>) -> tensor<4x3x2xf32, #sparse2>
    "sparse_tensor.print"(%9) : (tensor<4x3x2xf32, #sparse>) -> ()
    "sparse_tensor.print"(%13) : (tensor<4x3x2xf32, #sparse1>) -> ()
    "sparse_tensor.print"(%17) : (tensor<4x3x2xf32, #sparse2>) -> ()
    %18 = "sparse_tensor.has_runtime_library"() : () -> i1
    "scf.if"(%18) ({
      "bufferization.dealloc_tensor"(%9) : (tensor<4x3x2xf32, #sparse>) -> ()
      "bufferization.dealloc_tensor"(%13) : (tensor<4x3x2xf32, #sparse1>) -> ()
      "bufferization.dealloc_tensor"(%17) : (tensor<4x3x2xf32, #sparse2>) -> ()
      "scf.yield"() : () -> ()
    }, {
    }) : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

