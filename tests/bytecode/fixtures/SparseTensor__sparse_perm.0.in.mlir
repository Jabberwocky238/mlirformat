"builtin.module"() ({
  "func.func"() <{function_type = (tensor<10x20x30xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : dense, d0 : dense, d1 : dense) }>>, tensor<20x30x10xf32>) -> tensor<20x30x10xf32>, sym_name = "sparse_static_dims"}> ({
  ^bb0(%arg4: tensor<10x20x30xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : dense, d0 : dense, d1 : dense) }>> loc("<stdin>":6:8), %arg5: tensor<20x30x10xf32> loc("<stdin>":6:46)):
    %1 = "linalg.generic"(%arg4, %arg5) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d2, d0, d1)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: f32 loc("<stdin>":8:10), %arg7: f32 loc("<stdin>":8:22)):
      "linalg.yield"(%arg6) : (f32) -> () loc("<stdin>":9:7)
    }) : (tensor<10x20x30xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : dense, d0 : dense, d1 : dense) }>>, tensor<20x30x10xf32>) -> tensor<20x30x10xf32> loc("<stdin>":7:10)
    "func.return"(%1) : (tensor<20x30x10xf32>) -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = (tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : dense, d0 : dense, d1 : dense) }>>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>, sym_name = "sparse_dynamic_dims"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : dense, d0 : dense, d1 : dense) }>> loc("<stdin>":14:8), %arg1: tensor<?x?x?xf32> loc("<stdin>":14:43)):
    %0 = "linalg.generic"(%arg0, %arg1) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d2, d0, d1)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":16:10), %arg3: f32 loc("<stdin>":16:22)):
      "linalg.yield"(%arg2) : (f32) -> () loc("<stdin>":17:7)
    }) : (tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : dense, d0 : dense, d1 : dense) }>>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32> loc("<stdin>":15:10)
    "func.return"(%0) : (tensor<?x?x?xf32>) -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":13:3)
}) : () -> () loc("<stdin>":4:1)
