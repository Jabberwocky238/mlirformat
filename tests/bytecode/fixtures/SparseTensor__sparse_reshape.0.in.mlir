"builtin.module"() ({
  "func.func"() <{function_type = (tensor<100xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<10x10xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, sym_name = "sparse_expand"}> ({
  ^bb0(%arg4: tensor<100xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":5:8)):
    %3 = "tensor.expand_shape"(%arg4) <{reassociation = [[0, 1]], static_output_shape = array<i64: 10, 10>}> : (tensor<100xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<10x10xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":6:10)
    "func.return"(%3) : (tensor<10x10xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":4:3)
  "func.func"() <{function_type = (tensor<10x10xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<100xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, sym_name = "sparse_collapse"}> ({
  ^bb0(%arg3: tensor<10x10xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":10:8)):
    %2 = "tensor.collapse_shape"(%arg3) <{reassociation = [[0, 1]]}> : (tensor<10x10xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<100xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":11:10)
    "func.return"(%2) : (tensor<100xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":9:3)
  "func.func"() <{function_type = (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, index) -> tensor<?x10xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, sym_name = "dynamic_sparse_expand"}> ({
  ^bb0(%arg1: tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":15:8), %arg2: index loc("<stdin>":15:39)):
    %1 = "tensor.expand_shape"(%arg1, %arg2) <{reassociation = [[0, 1]], static_output_shape = array<i64: -9223372036854775808, 10>}> : (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, index) -> tensor<?x10xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":16:10)
    "func.return"(%1) : (tensor<?x10xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = (tensor<10x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, sym_name = "dynamic_sparse_collapse"}> ({
  ^bb0(%arg0: tensor<10x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":20:8)):
    %0 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0, 1]]}> : (tensor<10x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":21:10)
    "func.return"(%0) : (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":22:5)
  }) : () -> () loc("<stdin>":19:3)
}) : () -> () loc("<stdin>":3:1)
