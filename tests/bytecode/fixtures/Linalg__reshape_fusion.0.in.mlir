"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x4x?xf32>, tensor<?x?x?xf32>, f32) -> tensor<?x?x?xf32>, sym_name = "generic_op_reshape_producer_fusion"}> ({
  ^bb0(%arg0: tensor<?x?x4x?xf32> loc("<stdin>":6:8), %arg1: tensor<?x?x?xf32> loc("<stdin>":6:36), %arg2: f32 loc("<stdin>":6:62)):
    %0 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0], [1, 2], [3]]}> : (tensor<?x?x4x?xf32>) -> tensor<?x?x?xf32> loc("<stdin>":7:10)
    %1 = "linalg.generic"(%0, %arg1, %arg2, %arg1) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d2, d0, d1)>, affine_map<(d0, d1, d2) -> (d1, d2, d0)>, affine_map<(d0, d1, d2) -> ()>, affine_map<(d0, d1, d2) -> (d1, d2, d0)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":9:10), %arg4: f32 loc("<stdin>":9:22), %arg5: f32 loc("<stdin>":9:34), %arg6: f32 loc("<stdin>":9:46)):
      %2 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":10:12)
      %3 = "arith.addf"(%2, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":11:12)
      "linalg.yield"(%3) : (f32) -> () loc("<stdin>":12:7)
    }) : (tensor<?x?x?xf32>, tensor<?x?x?xf32>, f32, tensor<?x?x?xf32>) -> tensor<?x?x?xf32> loc("<stdin>":8:10)
    "func.return"(%1) : (tensor<?x?x?xf32>) -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":4:1)
