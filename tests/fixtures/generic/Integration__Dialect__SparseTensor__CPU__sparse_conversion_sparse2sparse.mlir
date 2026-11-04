#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : dense, d2 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d2 : dense, d1 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : compressed(nonunique), d2 : singleton) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x3x4xf64>) -> (), sym_name = "dump"}> ({
  ^bb0(%arg0: tensor<2x3x4xf64>):
    %14 = "arith.constant"() <{value = 0 : index}> : () -> index
    %15 = "arith.constant"() <{value = -1.000000e+00 : f64}> : () -> f64
    %16 = "vector.transfer_read"(%arg0, %14, %14, %14, %15) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 3, 1, 0>, permutation_map = #map}> : (tensor<2x3x4xf64>, index, index, index, f64) -> vector<2x3x4xf64>
    "vector.print"(%16) <{punctuation = #vector.punctuation<newline>}> : (vector<2x3x4xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "testNonSingleton"}> ({
    %7 = "arith.constant"() <{value = dense<[[[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00], [5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00], [9.000000e+00, 1.000000e+01, 1.100000e+01, 1.200000e+01]], [[1.300000e+01, 1.400000e+01, 1.500000e+01, 1.600000e+01], [1.700000e+01, 1.800000e+01, 1.900000e+01, 2.000000e+01], [2.100000e+01, 2.200000e+01, 2.300000e+01, 2.400000e+01]]]> : tensor<2x3x4xf64>}> : () -> tensor<2x3x4xf64>
    %8 = "sparse_tensor.convert"(%7) : (tensor<2x3x4xf64>) -> tensor<2x3x4xf64, #sparse>
    %9 = "sparse_tensor.convert"(%7) : (tensor<2x3x4xf64>) -> tensor<2x3x4xf64, #sparse1>
    %10 = "sparse_tensor.convert"(%8) : (tensor<2x3x4xf64, #sparse>) -> tensor<2x3x4xf64, #sparse1>
    %11 = "sparse_tensor.convert"(%9) : (tensor<2x3x4xf64, #sparse1>) -> tensor<2x3x4xf64, #sparse>
    %12 = "sparse_tensor.convert"(%10) : (tensor<2x3x4xf64, #sparse1>) -> tensor<2x3x4xf64>
    %13 = "sparse_tensor.convert"(%11) : (tensor<2x3x4xf64, #sparse>) -> tensor<2x3x4xf64>
    "func.call"(%7) <{callee = @dump}> : (tensor<2x3x4xf64>) -> ()
    "func.call"(%12) <{callee = @dump}> : (tensor<2x3x4xf64>) -> ()
    "func.call"(%13) <{callee = @dump}> : (tensor<2x3x4xf64>) -> ()
    "bufferization.dealloc_tensor"(%10) : (tensor<2x3x4xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%11) : (tensor<2x3x4xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%8) : (tensor<2x3x4xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%9) : (tensor<2x3x4xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%12) : (tensor<2x3x4xf64>) -> ()
    "bufferization.dealloc_tensor"(%13) : (tensor<2x3x4xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "testSingleton"}> ({
    %0 = "arith.constant"() <{value = dense<[[[1.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 6.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 1.100000e+01, 0.000000e+00]], [[0.000000e+00, 1.400000e+01, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 2.000000e+01], [2.100000e+01, 0.000000e+00, 0.000000e+00, 0.000000e+00]]]> : tensor<2x3x4xf64>}> : () -> tensor<2x3x4xf64>
    %1 = "sparse_tensor.convert"(%0) : (tensor<2x3x4xf64>) -> tensor<2x3x4xf64, #sparse2>
    %2 = "sparse_tensor.convert"(%0) : (tensor<2x3x4xf64>) -> tensor<2x3x4xf64, #sparse>
    %3 = "sparse_tensor.convert"(%1) : (tensor<2x3x4xf64, #sparse2>) -> tensor<2x3x4xf64, #sparse>
    %4 = "sparse_tensor.convert"(%2) : (tensor<2x3x4xf64, #sparse>) -> tensor<2x3x4xf64, #sparse2>
    %5 = "sparse_tensor.convert"(%3) : (tensor<2x3x4xf64, #sparse>) -> tensor<2x3x4xf64>
    %6 = "sparse_tensor.convert"(%4) : (tensor<2x3x4xf64, #sparse2>) -> tensor<2x3x4xf64>
    "func.call"(%0) <{callee = @dump}> : (tensor<2x3x4xf64>) -> ()
    "func.call"(%5) <{callee = @dump}> : (tensor<2x3x4xf64>) -> ()
    "func.call"(%6) <{callee = @dump}> : (tensor<2x3x4xf64>) -> ()
    "bufferization.dealloc_tensor"(%3) : (tensor<2x3x4xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<2x3x4xf64, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%1) : (tensor<2x3x4xf64, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%2) : (tensor<2x3x4xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<2x3x4xf64>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<2x3x4xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    "func.call"() <{callee = @testNonSingleton}> : () -> ()
    "func.call"() <{callee = @testSingleton}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

