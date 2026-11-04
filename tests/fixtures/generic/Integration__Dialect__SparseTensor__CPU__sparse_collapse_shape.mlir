#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x4xf64>) -> tensor<12xf64>, sym_name = "collapse_dense"}> ({
  ^bb0(%arg11: tensor<3x4xf64>):
    %38 = "tensor.collapse_shape"(%arg11) <{reassociation = [[0, 1]]}> : (tensor<3x4xf64>) -> tensor<12xf64>
    "func.return"(%38) : (tensor<12xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<3x4xf64, #sparse>) -> tensor<12xf64>, sym_name = "collapse_from_sparse"}> ({
  ^bb0(%arg10: tensor<3x4xf64, #sparse>):
    %37 = "tensor.collapse_shape"(%arg10) <{reassociation = [[0, 1]]}> : (tensor<3x4xf64, #sparse>) -> tensor<12xf64>
    "func.return"(%37) : (tensor<12xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<3x4xf64>) -> tensor<12xf64, #sparse1>, sym_name = "collapse_to_sparse"}> ({
  ^bb0(%arg9: tensor<3x4xf64>):
    %36 = "tensor.collapse_shape"(%arg9) <{reassociation = [[0, 1]]}> : (tensor<3x4xf64>) -> tensor<12xf64, #sparse1>
    "func.return"(%36) : (tensor<12xf64, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<3x4xf64, #sparse>) -> tensor<12xf64, #sparse1>, sym_name = "collapse_sparse2sparse"}> ({
  ^bb0(%arg8: tensor<3x4xf64, #sparse>):
    %35 = "tensor.collapse_shape"(%arg8) <{reassociation = [[0, 1]]}> : (tensor<3x4xf64, #sparse>) -> tensor<12xf64, #sparse1>
    "func.return"(%35) : (tensor<12xf64, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x3x5x2xf64>) -> tensor<6x10xf64>, sym_name = "collapse_dense_6x10"}> ({
  ^bb0(%arg7: tensor<2x3x5x2xf64>):
    %34 = "tensor.collapse_shape"(%arg7) <{reassociation = [[0, 1], [2, 3]]}> : (tensor<2x3x5x2xf64>) -> tensor<6x10xf64>
    "func.return"(%34) : (tensor<6x10xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x3x5x2xf64, #sparse2>) -> tensor<6x10xf64>, sym_name = "collapse_from_sparse_6x10"}> ({
  ^bb0(%arg6: tensor<2x3x5x2xf64, #sparse2>):
    %33 = "tensor.collapse_shape"(%arg6) <{reassociation = [[0, 1], [2, 3]]}> : (tensor<2x3x5x2xf64, #sparse2>) -> tensor<6x10xf64>
    "func.return"(%33) : (tensor<6x10xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x3x5x2xf64>) -> tensor<6x10xf64, #sparse>, sym_name = "collapse_to_sparse_6x10"}> ({
  ^bb0(%arg5: tensor<2x3x5x2xf64>):
    %32 = "tensor.collapse_shape"(%arg5) <{reassociation = [[0, 1], [2, 3]]}> : (tensor<2x3x5x2xf64>) -> tensor<6x10xf64, #sparse>
    "func.return"(%32) : (tensor<6x10xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x3x5x2xf64, #sparse2>) -> tensor<6x10xf64, #sparse>, sym_name = "collapse_sparse2sparse_6x10"}> ({
  ^bb0(%arg4: tensor<2x3x5x2xf64, #sparse2>):
    %31 = "tensor.collapse_shape"(%arg4) <{reassociation = [[0, 1], [2, 3]]}> : (tensor<2x3x5x2xf64, #sparse2>) -> tensor<6x10xf64, #sparse>
    "func.return"(%31) : (tensor<6x10xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?x?xf64>) -> tensor<?x?xf64>, sym_name = "collapse_dense_dyn"}> ({
  ^bb0(%arg3: tensor<?x?x?x?xf64>):
    %30 = "tensor.collapse_shape"(%arg3) <{reassociation = [[0, 1], [2, 3]]}> : (tensor<?x?x?x?xf64>) -> tensor<?x?xf64>
    "func.return"(%30) : (tensor<?x?xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?x?xf64, #sparse2>) -> tensor<?x?xf64>, sym_name = "collapse_from_sparse_dyn"}> ({
  ^bb0(%arg2: tensor<?x?x?x?xf64, #sparse2>):
    %29 = "tensor.collapse_shape"(%arg2) <{reassociation = [[0, 1], [2, 3]]}> : (tensor<?x?x?x?xf64, #sparse2>) -> tensor<?x?xf64>
    "func.return"(%29) : (tensor<?x?xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?x?xf64>) -> tensor<?x?xf64, #sparse>, sym_name = "collapse_to_sparse_dyn"}> ({
  ^bb0(%arg1: tensor<?x?x?x?xf64>):
    %28 = "tensor.collapse_shape"(%arg1) <{reassociation = [[0, 1], [2, 3]]}> : (tensor<?x?x?x?xf64>) -> tensor<?x?xf64, #sparse>
    "func.return"(%28) : (tensor<?x?xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?x?xf64, #sparse2>) -> tensor<?x?xf64, #sparse>, sym_name = "collapse_sparse2sparse_dyn"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xf64, #sparse2>):
    %27 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0, 1], [2, 3]]}> : (tensor<?x?x?x?xf64, #sparse2>) -> tensor<?x?xf64, #sparse>
    "func.return"(%27) : (tensor<?x?xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = -1.000000e+00 : f64}> : () -> f64
    %2 = "arith.constant"() <{value = dense<[[1.100000e+00, 0.000000e+00, 1.300000e+00, 0.000000e+00], [2.100000e+00, 0.000000e+00, 2.300000e+00, 0.000000e+00], [3.100000e+00, 0.000000e+00, 3.300000e+00, 0.000000e+00]]> : tensor<3x4xf64>}> : () -> tensor<3x4xf64>
    %3 = "arith.constant"() <{value = dense<[[[[1.000000e+00, 0.000000e+00], [3.000000e+00, 0.000000e+00], [5.000000e+00, 0.000000e+00], [7.000000e+00, 0.000000e+00], [9.000000e+00, 0.000000e+00]], [[0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00]], [[2.100000e+01, 0.000000e+00], [2.300000e+01, 0.000000e+00], [2.500000e+01, 0.000000e+00], [2.700000e+01, 0.000000e+00], [2.900000e+01, 0.000000e+00]]], [[[0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00]], [[4.100000e+01, 0.000000e+00], [4.300000e+01, 0.000000e+00], [4.500000e+01, 0.000000e+00], [4.700000e+01, 0.000000e+00], [4.900000e+01, 0.000000e+00]], [[0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00]]]]> : tensor<2x3x5x2xf64>}> : () -> tensor<2x3x5x2xf64>
    %4 = "sparse_tensor.convert"(%2) : (tensor<3x4xf64>) -> tensor<3x4xf64, #sparse>
    %5 = "sparse_tensor.convert"(%3) : (tensor<2x3x5x2xf64>) -> tensor<2x3x5x2xf64, #sparse2>
    %6 = "tensor.cast"(%2) : (tensor<3x4xf64>) -> tensor<?x?xf64>
    %7 = "tensor.cast"(%3) : (tensor<2x3x5x2xf64>) -> tensor<?x?x?x?xf64>
    %8 = "sparse_tensor.convert"(%7) : (tensor<?x?x?x?xf64>) -> tensor<?x?x?x?xf64, #sparse2>
    %9 = "func.call"(%2) <{callee = @collapse_dense}> : (tensor<3x4xf64>) -> tensor<12xf64>
    %10 = "func.call"(%4) <{callee = @collapse_from_sparse}> : (tensor<3x4xf64, #sparse>) -> tensor<12xf64>
    %11 = "func.call"(%2) <{callee = @collapse_to_sparse}> : (tensor<3x4xf64>) -> tensor<12xf64, #sparse1>
    %12 = "func.call"(%4) <{callee = @collapse_sparse2sparse}> : (tensor<3x4xf64, #sparse>) -> tensor<12xf64, #sparse1>
    %13 = "func.call"(%3) <{callee = @collapse_dense_6x10}> : (tensor<2x3x5x2xf64>) -> tensor<6x10xf64>
    %14 = "func.call"(%5) <{callee = @collapse_from_sparse_6x10}> : (tensor<2x3x5x2xf64, #sparse2>) -> tensor<6x10xf64>
    %15 = "func.call"(%3) <{callee = @collapse_to_sparse_6x10}> : (tensor<2x3x5x2xf64>) -> tensor<6x10xf64, #sparse>
    %16 = "func.call"(%5) <{callee = @collapse_sparse2sparse_6x10}> : (tensor<2x3x5x2xf64, #sparse2>) -> tensor<6x10xf64, #sparse>
    %17 = "func.call"(%7) <{callee = @collapse_dense_dyn}> : (tensor<?x?x?x?xf64>) -> tensor<?x?xf64>
    %18 = "func.call"(%8) <{callee = @collapse_from_sparse_dyn}> : (tensor<?x?x?x?xf64, #sparse2>) -> tensor<?x?xf64>
    %19 = "func.call"(%7) <{callee = @collapse_to_sparse_dyn}> : (tensor<?x?x?x?xf64>) -> tensor<?x?xf64, #sparse>
    %20 = "func.call"(%8) <{callee = @collapse_sparse2sparse_dyn}> : (tensor<?x?x?x?xf64, #sparse2>) -> tensor<?x?xf64, #sparse>
    %21 = "vector.transfer_read"(%9, %0, %1) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<12xf64>, index, f64) -> vector<12xf64>
    "vector.print"(%21) <{punctuation = #vector.punctuation<newline>}> : (vector<12xf64>) -> ()
    %22 = "vector.transfer_read"(%10, %0, %1) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<12xf64>, index, f64) -> vector<12xf64>
    "vector.print"(%22) <{punctuation = #vector.punctuation<newline>}> : (vector<12xf64>) -> ()
    "sparse_tensor.print"(%11) : (tensor<12xf64, #sparse1>) -> ()
    "sparse_tensor.print"(%12) : (tensor<12xf64, #sparse1>) -> ()
    %23 = "vector.transfer_read"(%13, %0, %0, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map1}> : (tensor<6x10xf64>, index, index, f64) -> vector<6x10xf64>
    "vector.print"(%23) <{punctuation = #vector.punctuation<newline>}> : (vector<6x10xf64>) -> ()
    %24 = "vector.transfer_read"(%14, %0, %0, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map1}> : (tensor<6x10xf64>, index, index, f64) -> vector<6x10xf64>
    "vector.print"(%24) <{punctuation = #vector.punctuation<newline>}> : (vector<6x10xf64>) -> ()
    "sparse_tensor.print"(%15) : (tensor<6x10xf64, #sparse>) -> ()
    "sparse_tensor.print"(%16) : (tensor<6x10xf64, #sparse>) -> ()
    %25 = "vector.transfer_read"(%17, %0, %0, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map1}> : (tensor<?x?xf64>, index, index, f64) -> vector<6x10xf64>
    "vector.print"(%25) <{punctuation = #vector.punctuation<newline>}> : (vector<6x10xf64>) -> ()
    %26 = "vector.transfer_read"(%18, %0, %0, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map1}> : (tensor<?x?xf64>, index, index, f64) -> vector<6x10xf64>
    "vector.print"(%26) <{punctuation = #vector.punctuation<newline>}> : (vector<6x10xf64>) -> ()
    "sparse_tensor.print"(%19) : (tensor<?x?xf64, #sparse>) -> ()
    "sparse_tensor.print"(%20) : (tensor<?x?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<3x4xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<2x3x5x2xf64, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%8) : (tensor<?x?x?x?xf64, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%11) : (tensor<12xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%12) : (tensor<12xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%15) : (tensor<6x10xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%16) : (tensor<6x10xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%19) : (tensor<?x?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%20) : (tensor<?x?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%10) : (tensor<12xf64>) -> ()
    "bufferization.dealloc_tensor"(%14) : (tensor<6x10xf64>) -> ()
    "bufferization.dealloc_tensor"(%18) : (tensor<?x?xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

