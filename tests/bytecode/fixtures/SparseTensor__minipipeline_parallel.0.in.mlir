"builtin.module"() ({
  "func.func"() <{function_type = (f32, tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "scale_ss"}> ({
  ^bb0(%arg0: f32 loc("<stdin>":5:8), %arg1: tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":5:20), %arg2: tensor<?x?xf32> loc("<stdin>":5:53)):
    %0 = "linalg.generic"(%arg1, %arg2) <{doc = "X(i,j) = A(i,j) * SCALE", indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":7:10), %arg4: f32 loc("<stdin>":7:22)):
      %1 = "arith.mulf"(%arg3, %arg0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":8:12)
      "linalg.yield"(%1) : (f32) -> () loc("<stdin>":9:7)
    }) : (tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":6:10)
    "func.return"(%0) : (tensor<?x?xf32>) -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":4:3)
}) : () -> () loc("<stdin>":3:1)
