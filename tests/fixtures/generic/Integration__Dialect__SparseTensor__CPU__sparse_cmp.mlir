#map = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x4xf64>, tensor<4x4xf64>, tensor<4x4xi8>) -> tensor<4x4xi8>, sym_name = "cmp_all_dense"}> ({
  ^bb0(%arg10: tensor<4x4xf64>, %arg11: tensor<4x4xf64>, %arg12: tensor<4x4xi8>):
    %19 = "linalg.generic"(%arg10, %arg11, %arg12) <{doc = "X(i, j) = cmp A(i,j) B(i, j)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg13: f64, %arg14: f64, %arg15: i8):
      %20 = "arith.cmpf"(%arg13, %arg14) <{fastmath = #arith.fastmath<none>, predicate = 11 : i64}> : (f64, f64) -> i1
      %21 = "arith.extui"(%20) : (i1) -> i8
      "linalg.yield"(%21) : (i8) -> ()
    }) : (tensor<4x4xf64>, tensor<4x4xf64>, tensor<4x4xi8>) -> tensor<4x4xi8>
    "func.return"(%19) : (tensor<4x4xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4x4xf64, #sparse>, tensor<4x4xf64>) -> tensor<4x4xi8, #sparse>, sym_name = "cmp_lhs_sparse"}> ({
  ^bb0(%arg5: tensor<4x4xf64, #sparse>, %arg6: tensor<4x4xf64>):
    %15 = "tensor.empty"() : () -> tensor<4x4xi8, #sparse>
    %16 = "linalg.generic"(%arg5, %arg6, %15) <{doc = "X(i, j) = cmp A(i,j) B(i, j)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: f64, %arg8: f64, %arg9: i8):
      %17 = "arith.cmpf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>, predicate = 11 : i64}> : (f64, f64) -> i1
      %18 = "arith.extui"(%17) : (i1) -> i8
      "linalg.yield"(%18) : (i8) -> ()
    }) : (tensor<4x4xf64, #sparse>, tensor<4x4xf64>, tensor<4x4xi8, #sparse>) -> tensor<4x4xi8, #sparse>
    "func.return"(%16) : (tensor<4x4xi8, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4x4xf64, #sparse>, tensor<4x4xf64, #sparse>) -> tensor<4x4xi8, #sparse>, sym_name = "cmp_all_sparse"}> ({
  ^bb0(%arg0: tensor<4x4xf64, #sparse>, %arg1: tensor<4x4xf64, #sparse>):
    %11 = "tensor.empty"() : () -> tensor<4x4xi8, #sparse>
    %12 = "linalg.generic"(%arg0, %arg1, %11) <{doc = "X(i, j) = cmp A(i,j) B(i, j)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f64, %arg3: f64, %arg4: i8):
      %13 = "arith.cmpf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>, predicate = 11 : i64}> : (f64, f64) -> i1
      %14 = "arith.extui"(%13) : (i1) -> i8
      "linalg.yield"(%14) : (i8) -> ()
    }) : (tensor<4x4xf64, #sparse>, tensor<4x4xf64, #sparse>, tensor<4x4xi8, #sparse>) -> tensor<4x4xi8, #sparse>
    "func.return"(%12) : (tensor<4x4xi8, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = dense<[[0.000000e+00, 0.000000e+00, 1.500000e+00, 1.000000e+00], [0.000000e+00, 3.500000e+00, 0.000000e+00, 0.000000e+00], [1.000000e+00, 5.000000e+00, 2.000000e+00, 0.000000e+00], [1.000000e+00, 5.000000e-01, 0.000000e+00, 0.000000e+00]]> : tensor<4x4xf64>}> : () -> tensor<4x4xf64>
    %3 = "arith.constant"() <{value = dense<[[0.000000e+00, 1.500000e+00, 1.000000e+00, 1.500000e+00], [3.500000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [5.000000e+00, 2.000000e+00, 0.000000e+00, 2.000000e+00], [5.000000e-01, 0.000000e+00, 0.000000e+00, 0.000000e+00]]> : tensor<4x4xf64>}> : () -> tensor<4x4xf64>
    %4 = "sparse_tensor.convert"(%2) : (tensor<4x4xf64>) -> tensor<4x4xf64, #sparse>
    %5 = "sparse_tensor.convert"(%3) : (tensor<4x4xf64>) -> tensor<4x4xf64, #sparse>
    %6 = "arith.constant"() <{value = dense<0> : tensor<4x4xi8>}> : () -> tensor<4x4xi8>
    %7 = "func.call"(%2, %3, %6) <{callee = @cmp_all_dense}> : (tensor<4x4xf64>, tensor<4x4xf64>, tensor<4x4xi8>) -> tensor<4x4xi8>
    %8 = "func.call"(%4, %3) <{callee = @cmp_lhs_sparse}> : (tensor<4x4xf64, #sparse>, tensor<4x4xf64>) -> tensor<4x4xi8, #sparse>
    %9 = "func.call"(%4, %5) <{callee = @cmp_all_sparse}> : (tensor<4x4xf64, #sparse>, tensor<4x4xf64, #sparse>) -> tensor<4x4xi8, #sparse>
    %10 = "vector.transfer_read"(%7, %1, %1, %0) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (tensor<4x4xi8>, index, index, i8) -> vector<4x4xi8>
    "vector.print"(%10) <{punctuation = #vector.punctuation<newline>}> : (vector<4x4xi8>) -> ()
    "sparse_tensor.print"(%8) : (tensor<4x4xi8, #sparse>) -> ()
    "sparse_tensor.print"(%9) : (tensor<4x4xi8, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<4x4xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<4x4xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%7) : (tensor<4x4xi8>) -> ()
    "bufferization.dealloc_tensor"(%8) : (tensor<4x4xi8, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%9) : (tensor<4x4xi8, #sparse>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

