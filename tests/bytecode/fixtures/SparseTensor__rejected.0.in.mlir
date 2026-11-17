"builtin.module"() ({
  "func.func"() <{function_type = (tensor<i32>, tensor<?xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<i32>, sym_name = "sparse_reduction_subi"}> ({
  ^bb0(%arg0: tensor<i32> loc("<stdin>":6:8), %arg1: tensor<?xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":6:28)):
    %0 = "linalg.generic"(%arg1, %arg0) <{indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: i32 loc("<stdin>":8:10), %arg3: i32 loc("<stdin>":8:22)):
      %1 = "arith.subi"(%arg2, %arg3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":9:12)
      "linalg.yield"(%1) : (i32) -> () loc("<stdin>":10:7)
    }) : (tensor<?xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<i32>) -> tensor<i32> loc("<stdin>":7:10)
    "func.return"(%0) : (tensor<i32>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":4:1)
