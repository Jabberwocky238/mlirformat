#map = affine_map<(d0) -> (0, d0)>
#map1 = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x77xi1>, tensor<1x77xi1>) -> tensor<77xi1, #sparse>, sym_name = "main"}> ({
  ^bb0(%arg0: tensor<1x77xi1>, %arg1: tensor<1x77xi1>):
    %0 = "tensor.empty"() : () -> tensor<77xi1, #sparse>
    %1 = "linalg.generic"(%arg0, %arg1, %0) <{indexing_maps = [#map, #map, #map1], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: i1, %arg3: i1, %arg4: i1):
      %2 = "arith.addi"(%arg2, %arg3) <{overflowFlags = #arith.overflow<none>}> : (i1, i1) -> i1
      "linalg.yield"(%2) : (i1) -> ()
    }) : (tensor<1x77xi1>, tensor<1x77xi1>, tensor<77xi1, #sparse>) -> tensor<77xi1, #sparse>
    "func.return"(%1) : (tensor<77xi1, #sparse>) -> ()
  }) : () -> ()
}) : () -> ()

