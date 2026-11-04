#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> ()>
#map2 = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed(nonunique), d1 : singleton(nonunique, soa), d2 : singleton(nonunique, soa), d3 : singleton(soa)) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xi32, #sparse>) -> tensor<i32>, sym_name = "sqsum"}> ({
  ^bb0(%arg5: tensor<?x?x?x?xi32, #sparse>):
    %3 = "arith.constant"() <{value = dense<0> : tensor<i32>}> : () -> tensor<i32>
    %4 = "linalg.generic"(%arg5, %3) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: i32, %arg7: i32):
      %5 = "arith.muli"(%arg6, %arg6) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %6 = "arith.addi"(%arg7, %5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%6) : (i32) -> ()
    }) : (tensor<?x?x?x?xi32, #sparse>, tensor<i32>) -> tensor<i32>
    "func.return"(%4) : (tensor<i32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<10xi32, #sparse1>, tensor<10xi32, #sparse1>) -> tensor<10xi32>, sym_name = "add"}> ({
  ^bb0(%arg0: tensor<10xi32, #sparse1>, %arg1: tensor<10xi32, #sparse1>):
    %0 = "arith.constant"() <{value = dense<0> : tensor<10xi32>}> : () -> tensor<10xi32>
    %1 = "linalg.generic"(%arg0, %arg1, %0) <{indexing_maps = [#map2, #map2, #map2], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: i32, %arg3: i32, %arg4: i32):
      %2 = "arith.addi"(%arg2, %arg3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%2) : (i32) -> ()
    }) : (tensor<10xi32, #sparse1>, tensor<10xi32, #sparse1>, tensor<10xi32>) -> tensor<10xi32>
    "func.return"(%1) : (tensor<10xi32>) -> ()
  }) : () -> ()
}) : () -> ()

