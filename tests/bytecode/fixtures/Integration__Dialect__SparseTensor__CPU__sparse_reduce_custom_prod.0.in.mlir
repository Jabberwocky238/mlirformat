"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, sym_name = "redProdLex"}> ({
  ^bb0(%arg5: tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":8:8)):
    %15 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":9:11)
    %16 = "arith.constant"() <{value = 1.000000e+00 : f64}> : () -> f64 loc("<stdin>":10:11)
    %17 = "tensor.dim"(%arg5, %15) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, index) -> index loc("<stdin>":11:11)
    %18 = "tensor.empty"(%17) : (index) -> tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":12:11)
    %19 = "linalg.generic"(%arg5, %18) <{doc = "X(i) = PROD_j A(i,j)", indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: f64 loc("<stdin>":14:10), %arg7: f64 loc("<stdin>":14:22)):
      %20 = "sparse_tensor.reduce"(%arg6, %arg7, %16) ({
      ^bb0(%arg8: f64 loc("<stdin>":16:12), %arg9: f64 loc("<stdin>":16:24)):
        %21 = "arith.mulf"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":17:15)
        "sparse_tensor.yield"(%21) : (f64) -> () loc("<stdin>":18:9)
      }) : (f64, f64, f64) -> f64 loc("<stdin>":15:13)
      "linalg.yield"(%20) : (f64) -> () loc("<stdin>":20:7)
    }) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":13:11)
    "func.return"(%19) : (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":22:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>) -> tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, sym_name = "redProdExpand"}> ({
  ^bb0(%arg0: tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>> loc("<stdin>":25:8)):
    %8 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":26:10)
    %9 = "arith.constant"() <{value = 1.000000e+00 : f64}> : () -> f64 loc("<stdin>":27:10)
    %10 = "tensor.dim"(%arg0, %8) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>, index) -> index loc("<stdin>":28:11)
    %11 = "tensor.empty"(%10) : (index) -> tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":29:11)
    %12 = "linalg.generic"(%arg0, %11) <{doc = "X(i) = PROD_j A(i,j)", indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f64 loc("<stdin>":31:10), %arg2: f64 loc("<stdin>":31:22)):
      %13 = "sparse_tensor.reduce"(%arg1, %arg2, %9) ({
      ^bb0(%arg3: f64 loc("<stdin>":33:12), %arg4: f64 loc("<stdin>":33:24)):
        %14 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":34:15)
        "sparse_tensor.yield"(%14) : (f64) -> () loc("<stdin>":35:9)
      }) : (f64, f64, f64) -> f64 loc("<stdin>":32:13)
      "linalg.yield"(%13) : (f64) -> () loc("<stdin>":37:7)
    }) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>, tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":30:11)
    "func.return"(%12) : (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":39:5)
  }) : () -> () loc("<stdin>":24:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":42:10)
    %1 = "arith.constant"() <{value = sparse<[[0, 0], [0, 1], [1, 0], [2, 2], [2, 3], [2, 4], [3, 0], [3, 2], [3, 3]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00, 9.000000e+00]> : tensor<4x5xf64>}> : () -> tensor<4x5xf64> loc("<stdin>":43:10)
    %2 = "arith.constant"() <{value = sparse<[[0, 0], [1, 3], [2, 0], [2, 3], [3, 1], [4, 1]], [6.000000e+00, 5.000000e+00, 4.000000e+00, 3.000000e+00, 2.000000e+00, 1.100000e+01]> : tensor<5x4xf64>}> : () -> tensor<5x4xf64> loc("<stdin>":44:10)
    %3 = "sparse_tensor.convert"(%1) : (tensor<4x5xf64>) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":45:10)
    %4 = "sparse_tensor.convert"(%2) : (tensor<5x4xf64>) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":46:10)
    %5 = "sparse_tensor.convert"(%2) : (tensor<5x4xf64>) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>> loc("<stdin>":47:10)
    %6 = "func.call"(%3) <{callee = @redProdLex}> : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":48:10)
    %7 = "func.call"(%5) <{callee = @redProdExpand}> : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>) -> tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":49:10)
    "sparse_tensor.print"(%3) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":50:5)
    "sparse_tensor.print"(%4) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":51:5)
    "sparse_tensor.print"(%6) : (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":52:5)
    "sparse_tensor.print"(%7) : (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":53:5)
    "bufferization.dealloc_tensor"(%3) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":54:5)
    "bufferization.dealloc_tensor"(%4) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":55:5)
    "bufferization.dealloc_tensor"(%5) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>) -> () loc("<stdin>":56:5)
    "bufferization.dealloc_tensor"(%6) : (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":57:5)
    "bufferization.dealloc_tensor"(%7) : (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":58:5)
    "func.return"() : () -> () loc("<stdin>":59:5)
  }) : () -> () loc("<stdin>":41:3)
}) : () -> () loc("<stdin>":6:1)
