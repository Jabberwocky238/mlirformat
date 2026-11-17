"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, sym_name = "sparse_transpose_auto"}> ({
  ^bb0(%arg0: tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":6:8)):
    %0 = "tensor.empty"() : () -> tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":7:10)
    %1 = "linalg.generic"(%arg0, %0) <{doc = "X(i,j) = A(j,i)", indexing_maps = [affine_map<(d0, d1) -> (d1, d0)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f64 loc("<stdin>":9:10), %arg2: f64 loc("<stdin>":9:22)):
      "linalg.yield"(%arg1) : (f64) -> () loc("<stdin>":10:7)
    }) : (tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":8:10)
    "func.return"(%1) : (tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":4:1)
