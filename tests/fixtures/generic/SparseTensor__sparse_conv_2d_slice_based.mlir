#map = affine_map<(d0, d1, d2, d3) -> (d0 + d2, d1 + d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x8xi32, #sparse>, tensor<3x3xi32>) -> tensor<6x6xi32, #sparse>, sym_name = "conv2d_all_sparse_CSR"}> ({
  ^bb0(%arg0: tensor<8x8xi32, #sparse>, %arg1: tensor<3x3xi32>):
    %0 = "tensor.empty"() : () -> tensor<6x6xi32, #sparse>
    %1 = "linalg.generic"(%arg0, %arg1, %0) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: i32, %arg3: i32, %arg4: i32):
      %2 = "arith.muli"(%arg2, %arg3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %3 = "arith.addi"(%arg4, %2) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%3) : (i32) -> ()
    }) : (tensor<8x8xi32, #sparse>, tensor<3x3xi32>, tensor<6x6xi32, #sparse>) -> tensor<6x6xi32, #sparse>
    "func.return"(%1) : (tensor<6x6xi32, #sparse>) -> ()
  }) : () -> ()
}) : () -> ()

