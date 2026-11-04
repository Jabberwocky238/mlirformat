#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x4xf64, #sparse>) -> tensor<4x3xf64, #sparse>, sym_name = "sparse_transpose_auto"}> ({
  ^bb0(%arg0: tensor<3x4xf64, #sparse>):
    %0 = "tensor.empty"() : () -> tensor<4x3xf64, #sparse>
    %1 = "linalg.generic"(%arg0, %0) <{doc = "X(i,j) = A(j,i)", indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f64, %arg2: f64):
      "linalg.yield"(%arg1) : (f64) -> ()
    }) : (tensor<3x4xf64, #sparse>, tensor<4x3xf64, #sparse>) -> tensor<4x3xf64, #sparse>
    "func.return"(%1) : (tensor<4x3xf64, #sparse>) -> ()
  }) : () -> ()
}) : () -> ()

