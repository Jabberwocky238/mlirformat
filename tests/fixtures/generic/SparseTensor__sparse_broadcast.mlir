#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>
"builtin.module"() <{sym_name = "func_sparse"}> ({
  "func.func"() <{function_type = (tensor<4x5xi32, #sparse>) -> tensor<4x3x5xi32, #sparse1>, sym_name = "main", sym_visibility = "public"}> ({
  ^bb0(%arg0: tensor<4x5xi32, #sparse>):
    %0 = "tensor.empty"() : () -> tensor<4x3x5xi32, #sparse1>
    %1 = "linalg.generic"(%arg0, %0) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: i32, %arg2: i32):
      "linalg.yield"(%arg1) : (i32) -> ()
    }) : (tensor<4x5xi32, #sparse>, tensor<4x3x5xi32, #sparse1>) -> tensor<4x3x5xi32, #sparse1>
    "func.return"(%1) : (tensor<4x3x5xi32, #sparse1>) -> ()
  }) : () -> ()
}) : () -> ()

