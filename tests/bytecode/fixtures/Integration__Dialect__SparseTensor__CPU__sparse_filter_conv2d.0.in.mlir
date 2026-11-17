"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x8xi32>, tensor<3x3xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<6x6xi32>) -> tensor<6x6xi32>, sym_name = "conv2d"}> ({
  ^bb0(%arg5: tensor<8x8xi32> loc("<stdin>":8:8), %arg6: tensor<3x3xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":8:32), %arg7: tensor<6x6xi32> loc("<stdin>":8:65)):
    %13 = "linalg.conv_2d"(%arg5, %arg6, %arg7) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg8: i32 loc("<stdin>":10:10), %arg9: i32 loc("<stdin>":10:22), %arg10: i32 loc("<stdin>":10:34)):
      %14 = "arith.muli"(%arg8, %arg9) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":11:13)
      %15 = "arith.addi"(%arg10, %14) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":12:13)
      "linalg.yield"(%15) : (i32) -> () loc("<stdin>":13:7)
    }) {linalg.memoized_indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0 + d2, d1 + d3)>, affine_map<(d0, d1, d2, d3) -> (d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1)>]} : (tensor<8x8xi32>, tensor<3x3xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<6x6xi32>) -> tensor<6x6xi32> loc("<stdin>":9:11)
    "func.return"(%13) : (tensor<6x6xi32>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (tensor<8x8xi32>, tensor<3x3xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<6x6xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, sym_name = "conv2d_sparse_out"}> ({
  ^bb0(%arg0: tensor<8x8xi32> loc("<stdin>":18:8), %arg1: tensor<3x3xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":18:32)):
    %9 = "tensor.empty"() : () -> tensor<6x6xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":19:10)
    %10 = "linalg.conv_2d"(%arg0, %arg1, %9) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: i32 loc("<stdin>":21:10), %arg3: i32 loc("<stdin>":21:22), %arg4: i32 loc("<stdin>":21:34)):
      %11 = "arith.muli"(%arg2, %arg3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":22:13)
      %12 = "arith.addi"(%arg4, %11) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":23:13)
      "linalg.yield"(%12) : (i32) -> () loc("<stdin>":24:7)
    }) {linalg.memoized_indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0 + d2, d1 + d3)>, affine_map<(d0, d1, d2, d3) -> (d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1)>]} : (tensor<8x8xi32>, tensor<3x3xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<6x6xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<6x6xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":20:11)
    "func.return"(%10) : (tensor<6x6xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":29:10)
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":30:10)
    %2 = "arith.constant"() <{value = dense<[[1, 0, -1], [0, 0, 0], [-1, 0, 1]]> : tensor<3x3xi32>}> : () -> tensor<3x3xi32> loc("<stdin>":31:10)
    %3 = "sparse_tensor.convert"(%2) : (tensor<3x3xi32>) -> tensor<3x3xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":32:10)
    %4 = "arith.constant"() <{value = dense<[[1, 2, 3, 4, 0, 6, 7, 8], [2, 2, 4, 4, 0, 0, 6, 8], [2, 2, 4, 4, 0, 0, 6, 8], [2, 2, 3, 4, 0, 0, 7, 8], [1, 3, 3, 4, 0, 0, 6, 8], [3, 2, 3, 4, 0, 0, 7, 8], [1, 3, 3, 4, 3, 6, 6, 8], [1, 3, 3, 4, 3, 0, 7, 8]]> : tensor<8x8xi32>}> : () -> tensor<8x8xi32> loc("<stdin>":33:10)
    %5 = "arith.constant"() <{value = dense<0> : tensor<6x6xi32>}> : () -> tensor<6x6xi32> loc("<stdin>":34:10)
    %6 = "func.call"(%4, %3, %5) <{callee = @conv2d}> : (tensor<8x8xi32>, tensor<3x3xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<6x6xi32>) -> tensor<6x6xi32> loc("<stdin>":35:10)
    %7 = "func.call"(%4, %3) <{callee = @conv2d_sparse_out}> : (tensor<8x8xi32>, tensor<3x3xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<6x6xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":36:10)
    %8 = "vector.transfer_read"(%6, %0, %0, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (tensor<6x6xi32>, index, index, i32) -> vector<6x6xi32> loc("<stdin>":37:10)
    "vector.print"(%8) <{punctuation = #vector.punctuation<newline>}> : (vector<6x6xi32>) -> () loc("<stdin>":38:5)
    "sparse_tensor.print"(%7) : (tensor<6x6xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":39:5)
    "bufferization.dealloc_tensor"(%3) : (tensor<3x3xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":40:5)
    "bufferization.dealloc_tensor"(%6) : (tensor<6x6xi32>) -> () loc("<stdin>":41:5)
    "bufferization.dealloc_tensor"(%7) : (tensor<6x6xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":42:5)
    "func.return"() : () -> () loc("<stdin>":43:5)
  }) : () -> () loc("<stdin>":28:3)
}) : () -> () loc("<stdin>":6:1)
