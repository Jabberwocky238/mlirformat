"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x8xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<3x3xi32>) -> tensor<6x6xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, sym_name = "conv2d_all_sparse_CSR"}> ({
  ^bb0(%arg0: tensor<8x8xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":7:8), %arg1: tensor<3x3xi32> loc("<stdin>":7:41)):
    %0 = "tensor.empty"() : () -> tensor<6x6xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":8:10)
    %1 = "linalg.generic"(%arg0, %arg1, %0) <{indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0 + d2, d1 + d3)>, affine_map<(d0, d1, d2, d3) -> (d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: i32 loc("<stdin>":10:10), %arg3: i32 loc("<stdin>":10:22), %arg4: i32 loc("<stdin>":10:34)):
      %2 = "arith.muli"(%arg2, %arg3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":11:12)
      %3 = "arith.addi"(%arg4, %2) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":12:12)
      "linalg.yield"(%3) : (i32) -> () loc("<stdin>":13:7)
    }) : (tensor<8x8xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<3x3xi32>, tensor<6x6xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<6x6xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":9:10)
    "func.return"(%1) : (tensor<6x6xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":6:3)
}) : () -> () loc("<stdin>":5:1)
