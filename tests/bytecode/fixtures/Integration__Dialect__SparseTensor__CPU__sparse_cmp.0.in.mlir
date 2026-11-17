"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x4xf64>, tensor<4x4xf64>, tensor<4x4xi8>) -> tensor<4x4xi8>, sym_name = "cmp_all_dense"}> ({
  ^bb0(%arg10: tensor<4x4xf64> loc("<stdin>":5:8), %arg11: tensor<4x4xf64> loc("<stdin>":5:33), %arg12: tensor<4x4xi8> loc("<stdin>":5:58)):
    %19 = "linalg.generic"(%arg10, %arg11, %arg12) <{doc = "X(i, j) = cmp A(i,j) B(i, j)", indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg13: f64 loc("<stdin>":7:10), %arg14: f64 loc("<stdin>":7:23), %arg15: i8 loc("<stdin>":7:36)):
      %20 = "arith.cmpf"(%arg13, %arg14) <{fastmath = #arith.fastmath<none>, predicate = 11 : i64}> : (f64, f64) -> i1 loc("<stdin>":8:13)
      %21 = "arith.extui"(%20) : (i1) -> i8 loc("<stdin>":9:13)
      "linalg.yield"(%21) : (i8) -> () loc("<stdin>":10:7)
    }) : (tensor<4x4xf64>, tensor<4x4xf64>, tensor<4x4xi8>) -> tensor<4x4xi8> loc("<stdin>":6:11)
    "func.return"(%19) : (tensor<4x4xi8>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":4:3)
  "func.func"() <{function_type = (tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<4x4xf64>) -> tensor<4x4xi8, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, sym_name = "cmp_lhs_sparse"}> ({
  ^bb0(%arg5: tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":15:8), %arg6: tensor<4x4xf64> loc("<stdin>":15:41)):
    %15 = "tensor.empty"() : () -> tensor<4x4xi8, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":16:11)
    %16 = "linalg.generic"(%arg5, %arg6, %15) <{doc = "X(i, j) = cmp A(i,j) B(i, j)", indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: f64 loc("<stdin>":18:10), %arg8: f64 loc("<stdin>":18:22), %arg9: i8 loc("<stdin>":18:34)):
      %17 = "arith.cmpf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>, predicate = 11 : i64}> : (f64, f64) -> i1 loc("<stdin>":19:13)
      %18 = "arith.extui"(%17) : (i1) -> i8 loc("<stdin>":20:13)
      "linalg.yield"(%18) : (i8) -> () loc("<stdin>":21:7)
    }) : (tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<4x4xf64>, tensor<4x4xi8, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<4x4xi8, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":17:11)
    "func.return"(%16) : (tensor<4x4xi8, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = (tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<4x4xi8, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, sym_name = "cmp_all_sparse"}> ({
  ^bb0(%arg0: tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":26:8), %arg1: tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":26:41)):
    %11 = "tensor.empty"() : () -> tensor<4x4xi8, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":27:11)
    %12 = "linalg.generic"(%arg0, %arg1, %11) <{doc = "X(i, j) = cmp A(i,j) B(i, j)", indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f64 loc("<stdin>":29:10), %arg3: f64 loc("<stdin>":29:22), %arg4: i8 loc("<stdin>":29:34)):
      %13 = "arith.cmpf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>, predicate = 11 : i64}> : (f64, f64) -> i1 loc("<stdin>":30:13)
      %14 = "arith.extui"(%13) : (i1) -> i8 loc("<stdin>":31:13)
      "linalg.yield"(%14) : (i8) -> () loc("<stdin>":32:7)
    }) : (tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<4x4xi8, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<4x4xi8, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":28:11)
    "func.return"(%12) : (tensor<4x4xi8, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":34:5)
  }) : () -> () loc("<stdin>":25:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : i8}> : () -> i8 loc("<stdin>":37:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":38:10)
    %2 = "arith.constant"() <{value = dense<[[0.000000e+00, 0.000000e+00, 1.500000e+00, 1.000000e+00], [0.000000e+00, 3.500000e+00, 0.000000e+00, 0.000000e+00], [1.000000e+00, 5.000000e+00, 2.000000e+00, 0.000000e+00], [1.000000e+00, 5.000000e-01, 0.000000e+00, 0.000000e+00]]> : tensor<4x4xf64>}> : () -> tensor<4x4xf64> loc("<stdin>":39:10)
    %3 = "arith.constant"() <{value = dense<[[0.000000e+00, 1.500000e+00, 1.000000e+00, 1.500000e+00], [3.500000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [5.000000e+00, 2.000000e+00, 0.000000e+00, 2.000000e+00], [5.000000e-01, 0.000000e+00, 0.000000e+00, 0.000000e+00]]> : tensor<4x4xf64>}> : () -> tensor<4x4xf64> loc("<stdin>":40:10)
    %4 = "sparse_tensor.convert"(%2) : (tensor<4x4xf64>) -> tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":41:10)
    %5 = "sparse_tensor.convert"(%3) : (tensor<4x4xf64>) -> tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":42:10)
    %6 = "arith.constant"() <{value = dense<0> : tensor<4x4xi8>}> : () -> tensor<4x4xi8> loc("<stdin>":43:10)
    %7 = "func.call"(%2, %3, %6) <{callee = @cmp_all_dense}> : (tensor<4x4xf64>, tensor<4x4xf64>, tensor<4x4xi8>) -> tensor<4x4xi8> loc("<stdin>":44:10)
    %8 = "func.call"(%4, %3) <{callee = @cmp_lhs_sparse}> : (tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<4x4xf64>) -> tensor<4x4xi8, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":45:10)
    %9 = "func.call"(%4, %5) <{callee = @cmp_all_sparse}> : (tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<4x4xi8, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":46:10)
    %10 = "vector.transfer_read"(%7, %1, %1, %0) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (tensor<4x4xi8>, index, index, i8) -> vector<4x4xi8> loc("<stdin>":47:11)
    "vector.print"(%10) <{punctuation = #vector.punctuation<newline>}> : (vector<4x4xi8>) -> () loc("<stdin>":48:5)
    "sparse_tensor.print"(%8) : (tensor<4x4xi8, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":49:5)
    "sparse_tensor.print"(%9) : (tensor<4x4xi8, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":50:5)
    "bufferization.dealloc_tensor"(%4) : (tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":51:5)
    "bufferization.dealloc_tensor"(%5) : (tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":52:5)
    "bufferization.dealloc_tensor"(%7) : (tensor<4x4xi8>) -> () loc("<stdin>":53:5)
    "bufferization.dealloc_tensor"(%8) : (tensor<4x4xi8, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":54:5)
    "bufferization.dealloc_tensor"(%9) : (tensor<4x4xi8, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":55:5)
    "func.return"() : () -> () loc("<stdin>":56:5)
  }) : () -> () loc("<stdin>":36:3)
}) : () -> () loc("<stdin>":3:1)
