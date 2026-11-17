"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, sym_name = "vecSelect"}> ({
  ^bb0(%arg4: tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":7:8)):
    %17 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":8:11)
    %18 = "arith.constant"() <{value = 1.000000e+00 : f64}> : () -> f64 loc("<stdin>":9:11)
    %19 = "tensor.dim"(%arg4, %17) : (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, index) -> index loc("<stdin>":10:11)
    %20 = "tensor.empty"(%19) : (index) -> tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":11:11)
    %21 = "linalg.generic"(%arg4, %20) <{indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg5: f64 loc("<stdin>":13:10), %arg6: f64 loc("<stdin>":13:22)):
      %22 = "sparse_tensor.select"(%arg5) ({
      ^bb0(%arg7: f64 loc("<stdin>":15:12)):
        %23 = "arith.cmpf"(%arg7, %18) <{fastmath = #arith.fastmath<none>, predicate = 3 : i64}> : (f64, f64) -> i1 loc("<stdin>":16:15)
        "sparse_tensor.yield"(%23) : (i1) -> () loc("<stdin>":17:9)
      }) : (f64) -> f64 loc("<stdin>":14:13)
      "linalg.yield"(%22) : (f64) -> () loc("<stdin>":19:7)
    }) : (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":12:11)
    "func.return"(%21) : (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, sym_name = "matUpperTriangle"}> ({
  ^bb0(%arg0: tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":24:8)):
    %7 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":25:10)
    %8 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":26:10)
    %9 = "tensor.dim"(%arg0, %7) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, index) -> index loc("<stdin>":27:10)
    %10 = "tensor.dim"(%arg0, %8) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, index) -> index loc("<stdin>":28:11)
    %11 = "tensor.empty"(%9, %10) : (index, index) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":29:11)
    %12 = "linalg.generic"(%arg0, %11) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f64 loc("<stdin>":31:10), %arg2: f64 loc("<stdin>":31:22)):
      %13 = "linalg.index"() <{dim = 0 : i64}> : () -> index loc("<stdin>":32:13)
      %14 = "linalg.index"() <{dim = 1 : i64}> : () -> index loc("<stdin>":33:13)
      %15 = "sparse_tensor.select"(%arg1) ({
      ^bb0(%arg3: f64 loc("<stdin>":35:12)):
        %16 = "arith.cmpi"(%14, %13) <{predicate = 8 : i64}> : (index, index) -> i1 loc("<stdin>":36:15)
        "sparse_tensor.yield"(%16) : (i1) -> () loc("<stdin>":37:9)
      }) : (f64) -> f64 loc("<stdin>":34:13)
      "linalg.yield"(%15) : (f64) -> () loc("<stdin>":39:7)
    }) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":30:11)
    "func.return"(%12) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":41:5)
  }) : () -> () loc("<stdin>":23:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":44:10)
    %1 = "arith.constant"() <{value = sparse<[[1], [3], [5], [7], [9]], [1.000000e+00, 2.000000e+00, -4.000000e+00, 0.000000e+00, 5.000000e+00]> : tensor<10xf64>}> : () -> tensor<10xf64> loc("<stdin>":45:10)
    %2 = "arith.constant"() <{value = sparse<[[0, 3], [1, 4], [2, 1], [2, 3], [3, 3], [3, 4], [4, 2]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00]> : tensor<5x5xf64>}> : () -> tensor<5x5xf64> loc("<stdin>":46:10)
    %3 = "sparse_tensor.convert"(%1) : (tensor<10xf64>) -> tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":47:10)
    %4 = "sparse_tensor.convert"(%2) : (tensor<5x5xf64>) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":48:10)
    %5 = "func.call"(%3) <{callee = @vecSelect}> : (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":49:10)
    %6 = "func.call"(%4) <{callee = @matUpperTriangle}> : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":50:10)
    "sparse_tensor.print"(%3) : (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":51:5)
    "sparse_tensor.print"(%4) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":52:5)
    "sparse_tensor.print"(%5) : (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":53:5)
    "sparse_tensor.print"(%6) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":54:5)
    "bufferization.dealloc_tensor"(%3) : (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":55:5)
    "bufferization.dealloc_tensor"(%4) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":56:5)
    "bufferization.dealloc_tensor"(%5) : (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":57:5)
    "bufferization.dealloc_tensor"(%6) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":58:5)
    "func.return"() : () -> () loc("<stdin>":59:5)
  }) : () -> () loc("<stdin>":43:3)
}) : () -> () loc("<stdin>":5:1)
