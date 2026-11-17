"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, sym_name = "min_plus_csrcsr"}> ({
  ^bb0(%arg9: tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":8:8), %arg10: tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":8:41)):
    %20 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":9:11)
    %21 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":10:11)
    %22 = "arith.constant"() <{value = 0x7FF0000000000000 : f64}> : () -> f64 loc("<stdin>":11:11)
    %23 = "tensor.dim"(%arg9, %20) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, index) -> index loc("<stdin>":12:11)
    %24 = "tensor.dim"(%arg10, %21) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, index) -> index loc("<stdin>":13:11)
    %25 = "tensor.empty"(%23, %24) : (index, index) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":14:11)
    %26 = "linalg.generic"(%arg9, %arg10, %25) <{doc = "C(i,j) = SUM_k A(i,k) * B(k,j)", indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg11: f64 loc("<stdin>":16:10), %arg12: f64 loc("<stdin>":16:23), %arg13: f64 loc("<stdin>":16:36)):
      %27 = "sparse_tensor.binary"(%arg11, %arg12) ({
      ^bb0(%arg16: f64 loc("<stdin>":18:12), %arg17: f64 loc("<stdin>":18:25)):
        %31 = "arith.addf"(%arg16, %arg17) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":19:15)
        "sparse_tensor.yield"(%31) : (f64) -> () loc("<stdin>":20:9)
      }, {
      }, {
      }) : (f64, f64) -> f64 loc("<stdin>":17:13)
      %28 = "sparse_tensor.reduce"(%27, %arg13, %22) ({
      ^bb0(%arg14: f64 loc("<stdin>":25:12), %arg15: f64 loc("<stdin>":25:25)):
        %29 = "arith.cmpf"(%arg14, %arg15) <{fastmath = #arith.fastmath<none>, predicate = 4 : i64}> : (f64, f64) -> i1 loc("<stdin>":26:15)
        %30 = "arith.select"(%29, %arg14, %arg15) : (i1, f64, f64) -> f64 loc("<stdin>":27:15)
        "sparse_tensor.yield"(%30) : (f64) -> () loc("<stdin>":28:9)
      }) : (f64, f64, f64) -> f64 loc("<stdin>":24:13)
      "linalg.yield"(%28) : (f64) -> () loc("<stdin>":30:7)
    }) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":15:11)
    "func.return"(%26) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":32:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, sym_name = "min_plus_csrcsc"}> ({
  ^bb0(%arg0: tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":35:8), %arg1: tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>> loc("<stdin>":35:41)):
    %8 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":36:10)
    %9 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":37:10)
    %10 = "arith.constant"() <{value = 0x7FF0000000000000 : f64}> : () -> f64 loc("<stdin>":38:11)
    %11 = "tensor.dim"(%arg0, %8) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, index) -> index loc("<stdin>":39:11)
    %12 = "tensor.dim"(%arg1, %9) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>, index) -> index loc("<stdin>":40:11)
    %13 = "tensor.empty"(%11, %12) : (index, index) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":41:11)
    %14 = "linalg.generic"(%arg0, %arg1, %13) <{doc = "C(i,j) = SUM_k A(i,k) * B(k,j)", indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f64 loc("<stdin>":43:10), %arg3: f64 loc("<stdin>":43:22), %arg4: f64 loc("<stdin>":43:34)):
      %15 = "sparse_tensor.binary"(%arg2, %arg3) ({
      ^bb0(%arg7: f64 loc("<stdin>":45:12), %arg8: f64 loc("<stdin>":45:24)):
        %19 = "arith.addf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":46:15)
        "sparse_tensor.yield"(%19) : (f64) -> () loc("<stdin>":47:9)
      }, {
      }, {
      }) : (f64, f64) -> f64 loc("<stdin>":44:13)
      %16 = "sparse_tensor.reduce"(%15, %arg4, %10) ({
      ^bb0(%arg5: f64 loc("<stdin>":52:12), %arg6: f64 loc("<stdin>":52:24)):
        %17 = "arith.cmpf"(%arg5, %arg6) <{fastmath = #arith.fastmath<none>, predicate = 4 : i64}> : (f64, f64) -> i1 loc("<stdin>":53:15)
        %18 = "arith.select"(%17, %arg5, %arg6) : (i1, f64, f64) -> f64 loc("<stdin>":54:15)
        "sparse_tensor.yield"(%18) : (f64) -> () loc("<stdin>":55:9)
      }) : (f64, f64, f64) -> f64 loc("<stdin>":51:13)
      "linalg.yield"(%16) : (f64) -> () loc("<stdin>":57:7)
    }) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>, tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":42:11)
    "func.return"(%14) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":59:5)
  }) : () -> () loc("<stdin>":34:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":62:10)
    %1 = "arith.constant"() <{value = sparse<[[0, 0], [0, 1], [1, 0], [2, 2], [2, 3], [2, 4], [3, 0], [3, 2], [3, 3]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00, 9.000000e+00]> : tensor<4x5xf64>}> : () -> tensor<4x5xf64> loc("<stdin>":63:10)
    %2 = "arith.constant"() <{value = sparse<[[0, 0], [1, 3], [2, 0], [2, 3], [3, 1], [4, 1]], [6.000000e+00, 5.000000e+00, 4.000000e+00, 3.000000e+00, 2.000000e+00, 1.100000e+01]> : tensor<5x4xf64>}> : () -> tensor<5x4xf64> loc("<stdin>":64:10)
    %3 = "sparse_tensor.convert"(%1) : (tensor<4x5xf64>) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":65:10)
    %4 = "sparse_tensor.convert"(%2) : (tensor<5x4xf64>) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":66:10)
    %5 = "sparse_tensor.convert"(%2) : (tensor<5x4xf64>) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>> loc("<stdin>":67:10)
    %6 = "func.call"(%3, %4) <{callee = @min_plus_csrcsr}> : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":68:10)
    %7 = "func.call"(%3, %5) <{callee = @min_plus_csrcsc}> : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":69:10)
    "sparse_tensor.print"(%3) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":70:5)
    "sparse_tensor.print"(%4) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":71:5)
    "sparse_tensor.print"(%6) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":72:5)
    "sparse_tensor.print"(%7) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":73:5)
    "bufferization.dealloc_tensor"(%3) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":74:5)
    "bufferization.dealloc_tensor"(%4) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":75:5)
    "bufferization.dealloc_tensor"(%5) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>) -> () loc("<stdin>":76:5)
    "bufferization.dealloc_tensor"(%6) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":77:5)
    "bufferization.dealloc_tensor"(%7) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":78:5)
    "func.return"() : () -> () loc("<stdin>":79:5)
  }) : () -> () loc("<stdin>":61:3)
}) : () -> () loc("<stdin>":6:1)
