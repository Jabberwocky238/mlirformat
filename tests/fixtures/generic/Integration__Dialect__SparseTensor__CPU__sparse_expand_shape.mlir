#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<12xf64>) -> tensor<3x4xf64>, sym_name = "expand_dense"}> ({
  ^bb0(%arg11: tensor<12xf64>):
    %61 = "tensor.expand_shape"(%arg11) <{reassociation = [[0, 1]], static_output_shape = array<i64: 3, 4>}> : (tensor<12xf64>) -> tensor<3x4xf64>
    "func.return"(%61) : (tensor<3x4xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<12xf64, #sparse>) -> tensor<3x4xf64>, sym_name = "expand_from_sparse"}> ({
  ^bb0(%arg10: tensor<12xf64, #sparse>):
    %60 = "tensor.expand_shape"(%arg10) <{reassociation = [[0, 1]], static_output_shape = array<i64: 3, 4>}> : (tensor<12xf64, #sparse>) -> tensor<3x4xf64>
    "func.return"(%60) : (tensor<3x4xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<12xf64>) -> tensor<3x4xf64, #sparse1>, sym_name = "expand_to_sparse"}> ({
  ^bb0(%arg9: tensor<12xf64>):
    %59 = "tensor.expand_shape"(%arg9) <{reassociation = [[0, 1]], static_output_shape = array<i64: 3, 4>}> : (tensor<12xf64>) -> tensor<3x4xf64, #sparse1>
    "func.return"(%59) : (tensor<3x4xf64, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<12xf64, #sparse>) -> tensor<3x4xf64, #sparse1>, sym_name = "expand_sparse2sparse"}> ({
  ^bb0(%arg8: tensor<12xf64, #sparse>):
    %58 = "tensor.expand_shape"(%arg8) <{reassociation = [[0, 1]], static_output_shape = array<i64: 3, 4>}> : (tensor<12xf64, #sparse>) -> tensor<3x4xf64, #sparse1>
    "func.return"(%58) : (tensor<3x4xf64, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<3x4xf64>) -> tensor<3x2x2xf64>, sym_name = "expand_dense_3x2x2"}> ({
  ^bb0(%arg7: tensor<3x4xf64>):
    %57 = "tensor.expand_shape"(%arg7) <{reassociation = [[0], [1, 2]], static_output_shape = array<i64: 3, 2, 2>}> : (tensor<3x4xf64>) -> tensor<3x2x2xf64>
    "func.return"(%57) : (tensor<3x2x2xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<3x4xf64, #sparse1>) -> tensor<3x2x2xf64>, sym_name = "expand_from_sparse_3x2x2"}> ({
  ^bb0(%arg6: tensor<3x4xf64, #sparse1>):
    %56 = "tensor.expand_shape"(%arg6) <{reassociation = [[0], [1, 2]], static_output_shape = array<i64: 3, 2, 2>}> : (tensor<3x4xf64, #sparse1>) -> tensor<3x2x2xf64>
    "func.return"(%56) : (tensor<3x2x2xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<3x4xf64>) -> tensor<3x2x2xf64, #sparse2>, sym_name = "expand_to_sparse_3x2x2"}> ({
  ^bb0(%arg5: tensor<3x4xf64>):
    %55 = "tensor.expand_shape"(%arg5) <{reassociation = [[0], [1, 2]], static_output_shape = array<i64: 3, 2, 2>}> : (tensor<3x4xf64>) -> tensor<3x2x2xf64, #sparse2>
    "func.return"(%55) : (tensor<3x2x2xf64, #sparse2>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<3x4xf64, #sparse1>) -> tensor<3x2x2xf64, #sparse2>, sym_name = "expand_sparse2sparse_3x2x2"}> ({
  ^bb0(%arg4: tensor<3x4xf64, #sparse1>):
    %54 = "tensor.expand_shape"(%arg4) <{reassociation = [[0], [1, 2]], static_output_shape = array<i64: 3, 2, 2>}> : (tensor<3x4xf64, #sparse1>) -> tensor<3x2x2xf64, #sparse2>
    "func.return"(%54) : (tensor<3x2x2xf64, #sparse2>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf64>) -> tensor<?x2x?xf64>, sym_name = "expand_dense_dyn"}> ({
  ^bb0(%arg3: tensor<?x?xf64>):
    %47 = "arith.constant"() <{value = 0 : index}> : () -> index
    %48 = "arith.constant"() <{value = 1 : index}> : () -> index
    %49 = "arith.constant"() <{value = 2 : index}> : () -> index
    %50 = "tensor.dim"(%arg3, %47) : (tensor<?x?xf64>, index) -> index
    %51 = "tensor.dim"(%arg3, %48) : (tensor<?x?xf64>, index) -> index
    %52 = "arith.divui"(%51, %49) : (index, index) -> index
    %53 = "tensor.expand_shape"(%arg3, %50, %52) <{reassociation = [[0], [1, 2]], static_output_shape = array<i64: -9223372036854775808, 2, -9223372036854775808>}> : (tensor<?x?xf64>, index, index) -> tensor<?x2x?xf64>
    "func.return"(%53) : (tensor<?x2x?xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse1>) -> tensor<?x2x?xf64>, sym_name = "expand_from_sparse_dyn"}> ({
  ^bb0(%arg2: tensor<?x?xf64, #sparse1>):
    %40 = "arith.constant"() <{value = 0 : index}> : () -> index
    %41 = "arith.constant"() <{value = 1 : index}> : () -> index
    %42 = "arith.constant"() <{value = 2 : index}> : () -> index
    %43 = "tensor.dim"(%arg2, %40) : (tensor<?x?xf64, #sparse1>, index) -> index
    %44 = "tensor.dim"(%arg2, %41) : (tensor<?x?xf64, #sparse1>, index) -> index
    %45 = "arith.divui"(%44, %42) : (index, index) -> index
    %46 = "tensor.expand_shape"(%arg2, %43, %45) <{reassociation = [[0], [1, 2]], static_output_shape = array<i64: -9223372036854775808, 2, -9223372036854775808>}> : (tensor<?x?xf64, #sparse1>, index, index) -> tensor<?x2x?xf64>
    "func.return"(%46) : (tensor<?x2x?xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf64>) -> tensor<?x2x?xf64, #sparse2>, sym_name = "expand_to_sparse_dyn"}> ({
  ^bb0(%arg1: tensor<?x?xf64>):
    %33 = "arith.constant"() <{value = 0 : index}> : () -> index
    %34 = "arith.constant"() <{value = 1 : index}> : () -> index
    %35 = "arith.constant"() <{value = 2 : index}> : () -> index
    %36 = "tensor.dim"(%arg1, %33) : (tensor<?x?xf64>, index) -> index
    %37 = "tensor.dim"(%arg1, %34) : (tensor<?x?xf64>, index) -> index
    %38 = "arith.divui"(%37, %35) : (index, index) -> index
    %39 = "tensor.expand_shape"(%arg1, %36, %38) <{reassociation = [[0], [1, 2]], static_output_shape = array<i64: -9223372036854775808, 2, -9223372036854775808>}> : (tensor<?x?xf64>, index, index) -> tensor<?x2x?xf64, #sparse2>
    "func.return"(%39) : (tensor<?x2x?xf64, #sparse2>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse1>) -> tensor<?x2x?xf64, #sparse2>, sym_name = "expand_sparse2sparse_dyn"}> ({
  ^bb0(%arg0: tensor<?x?xf64, #sparse1>):
    %26 = "arith.constant"() <{value = 0 : index}> : () -> index
    %27 = "arith.constant"() <{value = 1 : index}> : () -> index
    %28 = "arith.constant"() <{value = 2 : index}> : () -> index
    %29 = "tensor.dim"(%arg0, %26) : (tensor<?x?xf64, #sparse1>, index) -> index
    %30 = "tensor.dim"(%arg0, %27) : (tensor<?x?xf64, #sparse1>, index) -> index
    %31 = "arith.divui"(%30, %28) : (index, index) -> index
    %32 = "tensor.expand_shape"(%arg0, %29, %31) <{reassociation = [[0], [1, 2]], static_output_shape = array<i64: -9223372036854775808, 2, -9223372036854775808>}> : (tensor<?x?xf64, #sparse1>, index, index) -> tensor<?x2x?xf64, #sparse2>
    "func.return"(%32) : (tensor<?x2x?xf64, #sparse2>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = -1.000000e+00 : f64}> : () -> f64
    %2 = "arith.constant"() <{value = dense<[1.000000e+00, 0.000000e+00, 3.000000e+00, 0.000000e+00, 5.000000e+00, 0.000000e+00, 7.000000e+00, 0.000000e+00, 9.000000e+00, 0.000000e+00, 1.100000e+01, 0.000000e+00]> : tensor<12xf64>}> : () -> tensor<12xf64>
    %3 = "arith.constant"() <{value = dense<[[1.100000e+00, 1.200000e+00, 1.300000e+00, 1.400000e+00], [2.100000e+00, 2.200000e+00, 2.300000e+00, 2.400000e+00], [3.100000e+00, 3.200000e+00, 3.300000e+00, 3.400000e+00]]> : tensor<3x4xf64>}> : () -> tensor<3x4xf64>
    %4 = "sparse_tensor.convert"(%2) : (tensor<12xf64>) -> tensor<12xf64, #sparse>
    %5 = "sparse_tensor.convert"(%3) : (tensor<3x4xf64>) -> tensor<3x4xf64, #sparse1>
    %6 = "tensor.cast"(%3) : (tensor<3x4xf64>) -> tensor<?x?xf64>
    %7 = "sparse_tensor.convert"(%6) : (tensor<?x?xf64>) -> tensor<?x?xf64, #sparse1>
    %8 = "func.call"(%2) <{callee = @expand_dense}> : (tensor<12xf64>) -> tensor<3x4xf64>
    %9 = "func.call"(%4) <{callee = @expand_from_sparse}> : (tensor<12xf64, #sparse>) -> tensor<3x4xf64>
    %10 = "func.call"(%2) <{callee = @expand_to_sparse}> : (tensor<12xf64>) -> tensor<3x4xf64, #sparse1>
    %11 = "func.call"(%4) <{callee = @expand_sparse2sparse}> : (tensor<12xf64, #sparse>) -> tensor<3x4xf64, #sparse1>
    %12 = "func.call"(%3) <{callee = @expand_dense_3x2x2}> : (tensor<3x4xf64>) -> tensor<3x2x2xf64>
    %13 = "func.call"(%5) <{callee = @expand_from_sparse_3x2x2}> : (tensor<3x4xf64, #sparse1>) -> tensor<3x2x2xf64>
    %14 = "func.call"(%3) <{callee = @expand_to_sparse_3x2x2}> : (tensor<3x4xf64>) -> tensor<3x2x2xf64, #sparse2>
    %15 = "func.call"(%5) <{callee = @expand_sparse2sparse_3x2x2}> : (tensor<3x4xf64, #sparse1>) -> tensor<3x2x2xf64, #sparse2>
    %16 = "func.call"(%6) <{callee = @expand_dense_dyn}> : (tensor<?x?xf64>) -> tensor<?x2x?xf64>
    %17 = "func.call"(%7) <{callee = @expand_from_sparse_dyn}> : (tensor<?x?xf64, #sparse1>) -> tensor<?x2x?xf64>
    %18 = "func.call"(%6) <{callee = @expand_to_sparse_dyn}> : (tensor<?x?xf64>) -> tensor<?x2x?xf64, #sparse2>
    %19 = "func.call"(%7) <{callee = @expand_sparse2sparse_dyn}> : (tensor<?x?xf64, #sparse1>) -> tensor<?x2x?xf64, #sparse2>
    %20 = "vector.transfer_read"(%8, %0, %0, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (tensor<3x4xf64>, index, index, f64) -> vector<3x4xf64>
    "vector.print"(%20) <{punctuation = #vector.punctuation<newline>}> : (vector<3x4xf64>) -> ()
    %21 = "vector.transfer_read"(%9, %0, %0, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (tensor<3x4xf64>, index, index, f64) -> vector<3x4xf64>
    "vector.print"(%21) <{punctuation = #vector.punctuation<newline>}> : (vector<3x4xf64>) -> ()
    %22 = "vector.transfer_read"(%12, %0, %0, %0, %1) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 3, 1, 0>, permutation_map = #map1}> : (tensor<3x2x2xf64>, index, index, index, f64) -> vector<3x2x2xf64>
    "vector.print"(%22) <{punctuation = #vector.punctuation<newline>}> : (vector<3x2x2xf64>) -> ()
    %23 = "vector.transfer_read"(%13, %0, %0, %0, %1) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 3, 1, 0>, permutation_map = #map1}> : (tensor<3x2x2xf64>, index, index, index, f64) -> vector<3x2x2xf64>
    "vector.print"(%23) <{punctuation = #vector.punctuation<newline>}> : (vector<3x2x2xf64>) -> ()
    %24 = "vector.transfer_read"(%16, %0, %0, %0, %1) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 3, 1, 0>, permutation_map = #map1}> : (tensor<?x2x?xf64>, index, index, index, f64) -> vector<3x2x2xf64>
    "vector.print"(%24) <{punctuation = #vector.punctuation<newline>}> : (vector<3x2x2xf64>) -> ()
    %25 = "vector.transfer_read"(%17, %0, %0, %0, %1) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 3, 1, 0>, permutation_map = #map1}> : (tensor<?x2x?xf64>, index, index, index, f64) -> vector<3x2x2xf64>
    "vector.print"(%25) <{punctuation = #vector.punctuation<newline>}> : (vector<3x2x2xf64>) -> ()
    "sparse_tensor.print"(%10) : (tensor<3x4xf64, #sparse1>) -> ()
    "sparse_tensor.print"(%11) : (tensor<3x4xf64, #sparse1>) -> ()
    "sparse_tensor.print"(%14) : (tensor<3x2x2xf64, #sparse2>) -> ()
    "sparse_tensor.print"(%15) : (tensor<3x2x2xf64, #sparse2>) -> ()
    "sparse_tensor.print"(%18) : (tensor<?x2x?xf64, #sparse2>) -> ()
    "sparse_tensor.print"(%19) : (tensor<?x2x?xf64, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<12xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<3x4xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%7) : (tensor<?x?xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%10) : (tensor<3x4xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%11) : (tensor<3x4xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%14) : (tensor<3x2x2xf64, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%15) : (tensor<3x2x2xf64, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%18) : (tensor<?x2x?xf64, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%19) : (tensor<?x2x?xf64, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%9) : (tensor<3x4xf64>) -> ()
    "bufferization.dealloc_tensor"(%13) : (tensor<3x2x2xf64>) -> ()
    "bufferization.dealloc_tensor"(%17) : (tensor<?x2x?xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

