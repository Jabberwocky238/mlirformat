"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>, tensor<?x?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>) -> tensor<?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, sym_name = "redsum"}> ({
  ^bb0(%arg0: tensor<?x?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>> loc("<stdin>":7:8), %arg1: tensor<?x?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>> loc("<stdin>":7:43)):
    %5 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":8:10)
    %6 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":9:10)
    %7 = "tensor.dim"(%arg0, %5) : (tensor<?x?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>, index) -> index loc("<stdin>":10:10)
    %8 = "tensor.dim"(%arg0, %6) : (tensor<?x?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>, index) -> index loc("<stdin>":11:10)
    %9 = "tensor.empty"(%7, %8) : (index, index) -> tensor<?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":12:10)
    %10 = "linalg.generic"(%arg0, %arg1, %9) <{doc = "X(i,j) = SUM_k A(i,j,k) * B(i,j,k)", indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: i32 loc("<stdin>":14:10), %arg3: i32 loc("<stdin>":14:22), %arg4: i32 loc("<stdin>":14:34)):
      %11 = "arith.muli"(%arg2, %arg3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":15:13)
      %12 = "arith.addi"(%arg4, %11) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":16:13)
      "linalg.yield"(%12) : (i32) -> () loc("<stdin>":17:7)
    }) : (tensor<?x?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>, tensor<?x?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>, tensor<?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":13:11)
    "func.return"(%10) : (tensor<?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = sparse<[[1, 1, 3], [2, 0, 0], [2, 2, 1], [2, 2, 2], [2, 2, 3]], [1, 2, 3, 4, 5]> : tensor<3x3x4xi32>}> : () -> tensor<3x3x4xi32> loc("<stdin>":22:10)
    %1 = "arith.constant"() <{value = sparse<[[1, 0, 0], [1, 1, 3], [2, 2, 1], [2, 2, 3]], [6, 7, 8, 9]> : tensor<3x3x4xi32>}> : () -> tensor<3x3x4xi32> loc("<stdin>":23:10)
    %2 = "sparse_tensor.convert"(%0) : (tensor<3x3x4xi32>) -> tensor<?x?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>> loc("<stdin>":24:10)
    %3 = "sparse_tensor.convert"(%1) : (tensor<3x3x4xi32>) -> tensor<?x?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>> loc("<stdin>":25:10)
    %4 = "func.call"(%2, %3) <{callee = @redsum}> : (tensor<?x?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>, tensor<?x?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>) -> tensor<?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":26:10)
    "sparse_tensor.print"(%4) : (tensor<?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":27:5)
    "bufferization.dealloc_tensor"(%2) : (tensor<?x?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>) -> () loc("<stdin>":28:5)
    "bufferization.dealloc_tensor"(%3) : (tensor<?x?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>) -> () loc("<stdin>":29:5)
    "bufferization.dealloc_tensor"(%4) : (tensor<?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":30:5)
    "func.return"() : () -> () loc("<stdin>":31:5)
  }) : () -> () loc("<stdin>":21:3)
}) : () -> () loc("<stdin>":5:1)
