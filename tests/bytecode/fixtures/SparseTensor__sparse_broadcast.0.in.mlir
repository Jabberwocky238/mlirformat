"builtin.module"() <{sym_name = "func_sparse"}> ({
  "func.func"() <{function_type = (tensor<4x5xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<4x3x5xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>, sym_name = "main", sym_visibility = "public"}> ({
  ^bb0(%arg0: tensor<4x5xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":7:8)):
    %0 = "tensor.empty"() : () -> tensor<4x3x5xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>> loc("<stdin>":8:10)
    %1 = "linalg.generic"(%arg0, %0) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: i32 loc("<stdin>":10:10), %arg2: i32 loc("<stdin>":10:22)):
      "linalg.yield"(%arg1) : (i32) -> () loc("<stdin>":11:7)
    }) : (tensor<4x5xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<4x3x5xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>) -> tensor<4x3x5xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>> loc("<stdin>":9:10)
    "func.return"(%1) : (tensor<4x3x5xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>) -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":6:3)
}) : () -> () loc("<stdin>":5:1)
