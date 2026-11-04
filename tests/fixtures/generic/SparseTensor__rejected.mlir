#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<i32>, tensor<?xi32, #sparse>) -> tensor<i32>, sym_name = "sparse_reduction_subi"}> ({
  ^bb0(%arg0: tensor<i32>, %arg1: tensor<?xi32, #sparse>):
    %0 = "linalg.generic"(%arg1, %arg0) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: i32, %arg3: i32):
      %1 = "arith.subi"(%arg2, %arg3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%1) : (i32) -> ()
    }) : (tensor<?xi32, #sparse>, tensor<i32>) -> tensor<i32>
    "func.return"(%0) : (tensor<i32>) -> ()
  }) : () -> ()
}) : () -> ()

