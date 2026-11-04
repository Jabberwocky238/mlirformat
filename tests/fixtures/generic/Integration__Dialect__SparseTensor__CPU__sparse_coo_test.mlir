#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x8xf32, #sparse>, tensor<8x8xf32, #sparse1>) -> tensor<8x8xf32>, sym_name = "add_coo_csr"}> ({
  ^bb0(%arg20: tensor<8x8xf32, #sparse>, %arg21: tensor<8x8xf32, #sparse1>):
    %31 = "tensor.empty"() : () -> tensor<8x8xf32>
    %32 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %33 = "linalg.fill"(%32, %31) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg25: f32, %arg26: f32):
      "linalg.yield"(%arg25) : (f32) -> ()
    }) : (f32, tensor<8x8xf32>) -> tensor<8x8xf32>
    %34 = "linalg.generic"(%arg20, %arg21, %33) <{doc = "X(i,j) = A(i,j) + B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg22: f32, %arg23: f32, %arg24: f32):
      %35 = "arith.addf"(%arg22, %arg23) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%35) : (f32) -> ()
    }) : (tensor<8x8xf32, #sparse>, tensor<8x8xf32, #sparse1>, tensor<8x8xf32>) -> tensor<8x8xf32>
    "func.return"(%34) : (tensor<8x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xf32, #sparse2>, tensor<8x8xf32, #sparse1>) -> tensor<8x8xf32>, sym_name = "add_coo_coo"}> ({
  ^bb0(%arg13: tensor<8x8xf32, #sparse2>, %arg14: tensor<8x8xf32, #sparse1>):
    %26 = "tensor.empty"() : () -> tensor<8x8xf32>
    %27 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %28 = "linalg.fill"(%27, %26) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg18: f32, %arg19: f32):
      "linalg.yield"(%arg18) : (f32) -> ()
    }) : (f32, tensor<8x8xf32>) -> tensor<8x8xf32>
    %29 = "linalg.generic"(%arg13, %arg14, %28) <{doc = "X(i,j) = A(i,j) + B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg15: f32, %arg16: f32, %arg17: f32):
      %30 = "arith.addf"(%arg15, %arg16) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%30) : (f32) -> ()
    }) : (tensor<8x8xf32, #sparse2>, tensor<8x8xf32, #sparse1>, tensor<8x8xf32>) -> tensor<8x8xf32>
    "func.return"(%29) : (tensor<8x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xf32, #sparse2>, tensor<8x8xf32, #sparse1>) -> tensor<8x8xf32, #sparse1>, sym_name = "add_coo_coo_out_coo"}> ({
  ^bb0(%arg8: tensor<8x8xf32, #sparse2>, %arg9: tensor<8x8xf32, #sparse1>):
    %23 = "tensor.empty"() : () -> tensor<8x8xf32, #sparse1>
    %24 = "linalg.generic"(%arg8, %arg9, %23) <{doc = "X(i,j) = A(i,j) + B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg10: f32, %arg11: f32, %arg12: f32):
      %25 = "arith.addf"(%arg10, %arg11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%25) : (f32) -> ()
    }) : (tensor<8x8xf32, #sparse2>, tensor<8x8xf32, #sparse1>, tensor<8x8xf32, #sparse1>) -> tensor<8x8xf32, #sparse1>
    "func.return"(%24) : (tensor<8x8xf32, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xf32>, tensor<8x8xf32, #sparse1>) -> tensor<8x8xf32>, sym_name = "add_coo_dense"}> ({
  ^bb0(%arg1: tensor<8x8xf32>, %arg2: tensor<8x8xf32, #sparse1>):
    %18 = "tensor.empty"() : () -> tensor<8x8xf32>
    %19 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %20 = "linalg.fill"(%19, %18) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32):
      "linalg.yield"(%arg6) : (f32) -> ()
    }) : (f32, tensor<8x8xf32>) -> tensor<8x8xf32>
    %21 = "linalg.generic"(%arg1, %arg2, %20) <{doc = "X(i,j) = A(i,j) + B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %22 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%22) : (f32) -> ()
    }) : (tensor<8x8xf32>, tensor<8x8xf32, #sparse1>, tensor<8x8xf32>) -> tensor<8x8xf32>
    "func.return"(%21) : (tensor<8x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 8 : index}> : () -> index
    %3 = "arith.constant"() <{value = dense<[[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00], [1.100000e+00, 2.100000e+00, 3.100000e+00, 4.100000e+00, 5.100000e+00, 6.100000e+00, 7.100000e+00, 8.100000e+00], [2.200000e+00, 2.200000e+00, 3.200000e+00, 4.200000e+00, 5.200000e+00, 6.1999998, 7.1999998, 8.1999998], [3.300000e+00, 2.300000e+00, 3.300000e+00, 4.300000e+00, 5.300000e+00, 6.300000e+00, 7.300000e+00, 8.300000e+00], [4.400000e+00, 2.400000e+00, 3.400000e+00, 4.400000e+00, 5.400000e+00, 6.400000e+00, 7.400000e+00, 8.39999961], [5.500000e+00, 2.500000e+00, 3.500000e+00, 4.500000e+00, 5.500000e+00, 6.500000e+00, 7.500000e+00, 8.500000e+00], [6.600000e+00, 2.600000e+00, 3.600000e+00, 4.600000e+00, 5.600000e+00, 6.600000e+00, 7.600000e+00, 8.600000e+00], [7.6999998, 2.700000e+00, 3.700000e+00, 4.700000e+00, 5.700000e+00, 6.6999998, 7.6999998, 8.6999998]]> : tensor<8x8xf32>}> : () -> tensor<8x8xf32>
    %4 = "arith.constant"() <{value = dense<[[7.800000e+00, 2.800000e+00, 3.800000e+00, 8.000000e-01, 3.800000e+00, 1.000000e-01, 7.800000e+00, 8.800000e+00], [3.300000e+00, 2.300000e+00, 1.300000e+00, 4.300000e+00, 3.300000e+00, 6.300000e+00, 9.300000e+00, 8.300000e+00], [6.600000e+00, 2.600000e+00, 3.600000e+00, 4.600000e+00, 3.600000e+00, 6.600000e+00, 7.600000e+00, 7.600000e+00], [1.000000e+00, 3.000000e+00, 3.000000e+00, 4.000000e+00, 3.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00], [1.000000e-01, 2.100000e+00, 3.100000e+00, 4.100000e+00, 3.100000e+00, 6.100000e+00, 7.100000e+00, 8.100000e+00], [4.400000e+00, 2.400000e+00, 3.400000e+00, 4.400000e+00, 3.400000e+00, 6.400000e+00, 8.39999961, 8.39999961], [5.500000e+00, 3.500000e+00, 1.500000e+00, 4.500000e+00, 3.500000e+00, 6.500000e+00, 7.500000e+00, 8.500000e+00], [7.6999998, 2.700000e+00, 3.700000e+00, 0.699999988, 5.700000e+00, 3.700000e+00, 3.700000e+00, 0.699999988]]> : tensor<8x8xf32>}> : () -> tensor<8x8xf32>
    %5 = "sparse_tensor.convert"(%3) : (tensor<8x8xf32>) -> tensor<8x8xf32, #sparse>
    %6 = "sparse_tensor.convert"(%3) : (tensor<8x8xf32>) -> tensor<8x8xf32, #sparse2>
    %7 = "sparse_tensor.convert"(%4) : (tensor<8x8xf32>) -> tensor<8x8xf32, #sparse1>
    %8 = "func.call"(%3, %7) <{callee = @add_coo_dense}> : (tensor<8x8xf32>, tensor<8x8xf32, #sparse1>) -> tensor<8x8xf32>
    %9 = "func.call"(%5, %7) <{callee = @add_coo_csr}> : (tensor<8x8xf32, #sparse>, tensor<8x8xf32, #sparse1>) -> tensor<8x8xf32>
    %10 = "func.call"(%6, %7) <{callee = @add_coo_coo}> : (tensor<8x8xf32, #sparse2>, tensor<8x8xf32, #sparse1>) -> tensor<8x8xf32>
    %11 = "func.call"(%6, %7) <{callee = @add_coo_coo_out_coo}> : (tensor<8x8xf32, #sparse2>, tensor<8x8xf32, #sparse1>) -> tensor<8x8xf32, #sparse1>
    %12 = "sparse_tensor.convert"(%11) : (tensor<8x8xf32, #sparse1>) -> tensor<8x8xf32>
    %13 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg0: index):
      %14 = "vector.transfer_read"(%8, %arg0, %0, %13) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map1}> : (tensor<8x8xf32>, index, index, f32) -> vector<8xf32>
      %15 = "vector.transfer_read"(%9, %arg0, %0, %13) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map1}> : (tensor<8x8xf32>, index, index, f32) -> vector<8xf32>
      %16 = "vector.transfer_read"(%10, %arg0, %0, %13) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map1}> : (tensor<8x8xf32>, index, index, f32) -> vector<8xf32>
      %17 = "vector.transfer_read"(%12, %arg0, %0, %13) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map1}> : (tensor<8x8xf32>, index, index, f32) -> vector<8xf32>
      "vector.print"(%14) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> ()
      "vector.print"(%15) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> ()
      "vector.print"(%16) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> ()
      "vector.print"(%17) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "sparse_tensor.print"(%11) : (tensor<8x8xf32, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%8) : (tensor<8x8xf32>) -> ()
    "bufferization.dealloc_tensor"(%9) : (tensor<8x8xf32>) -> ()
    "bufferization.dealloc_tensor"(%10) : (tensor<8x8xf32>) -> ()
    "bufferization.dealloc_tensor"(%12) : (tensor<8x8xf32>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<8x8xf32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<8x8xf32, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%7) : (tensor<8x8xf32, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%11) : (tensor<8x8xf32, #sparse1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

