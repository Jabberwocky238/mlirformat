#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed(nonunique), d1 : singleton(nonunique), d2 : singleton) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : compressed, d2 : dense) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d2 : dense, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x3x4xf32>) -> (), sym_name = "dump"}> ({
  ^bb0(%arg0: tensor<2x3x4xf32>):
    %10 = "arith.constant"() <{value = 0 : index}> : () -> index
    %11 = "arith.constant"() <{value = -1.000000e+00 : f32}> : () -> f32
    %12 = "vector.transfer_read"(%arg0, %10, %10, %10, %11) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 3, 1, 0>, permutation_map = #map}> : (tensor<2x3x4xf32>, index, index, index, f32) -> vector<2x3x4xf32>
    "vector.print"(%12) <{punctuation = #vector.punctuation<newline>}> : (vector<2x3x4xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = dense<[[[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00], [5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00], [9.000000e+00, 1.000000e+01, 1.100000e+01, 1.200000e+01]], [[1.300000e+01, 1.400000e+01, 1.500000e+01, 1.600000e+01], [1.700000e+01, 1.800000e+01, 1.900000e+01, 2.000000e+01], [2.100000e+01, 2.200000e+01, 2.300000e+01, 2.400000e+01]]]> : tensor<2x3x4xf64>}> : () -> tensor<2x3x4xf64>
    %1 = "sparse_tensor.convert"(%0) : (tensor<2x3x4xf64>) -> tensor<2x3x4xf64, #sparse>
    %2 = "sparse_tensor.convert"(%0) : (tensor<2x3x4xf64>) -> tensor<2x3x4xf64, #sparse1>
    %3 = "sparse_tensor.convert"(%0) : (tensor<2x3x4xf64>) -> tensor<2x3x4xf64, #sparse2>
    %4 = "sparse_tensor.convert"(%1) : (tensor<2x3x4xf64, #sparse>) -> tensor<2x3x4xf32, #sparse>
    %5 = "sparse_tensor.convert"(%2) : (tensor<2x3x4xf64, #sparse1>) -> tensor<2x3x4xf32, #sparse1>
    %6 = "sparse_tensor.convert"(%3) : (tensor<2x3x4xf64, #sparse2>) -> tensor<2x3x4xf32, #sparse2>
    %7 = "sparse_tensor.convert"(%4) : (tensor<2x3x4xf32, #sparse>) -> tensor<2x3x4xf32>
    %8 = "sparse_tensor.convert"(%5) : (tensor<2x3x4xf32, #sparse1>) -> tensor<2x3x4xf32>
    %9 = "sparse_tensor.convert"(%6) : (tensor<2x3x4xf32, #sparse2>) -> tensor<2x3x4xf32>
    "func.call"(%7) <{callee = @dump}> : (tensor<2x3x4xf32>) -> ()
    "func.call"(%8) <{callee = @dump}> : (tensor<2x3x4xf32>) -> ()
    "func.call"(%9) <{callee = @dump}> : (tensor<2x3x4xf32>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<2x3x4xf32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<2x3x4xf32, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<2x3x4xf32, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%1) : (tensor<2x3x4xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%2) : (tensor<2x3x4xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%3) : (tensor<2x3x4xf64, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%7) : (tensor<2x3x4xf32>) -> ()
    "bufferization.dealloc_tensor"(%8) : (tensor<2x3x4xf32>) -> ()
    "bufferization.dealloc_tensor"(%9) : (tensor<2x3x4xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

