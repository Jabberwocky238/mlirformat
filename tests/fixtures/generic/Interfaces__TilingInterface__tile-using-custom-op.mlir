#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "builtin.module"() ({
    "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?xf32>) -> tensor<?x?xf32>, sym_name = "generic_parallel"}> ({
    ^bb0(%arg1: tensor<?x?xf32>, %arg2: tensor<?xf32>):
      %2 = "arith.constant"() <{value = 0 : index}> : () -> index
      %3 = "arith.constant"() <{value = 1 : index}> : () -> index
      %4 = "tensor.dim"(%arg1, %2) : (tensor<?x?xf32>, index) -> index
      %5 = "tensor.dim"(%arg1, %3) : (tensor<?x?xf32>, index) -> index
      %6 = "tensor.empty"(%4, %5) : (index, index) -> tensor<?x?xf32>
      %7 = "linalg.generic"(%arg1, %arg2, %6) <{indexing_maps = [#map, #map1, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
      ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
        %8 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "linalg.yield"(%8) : (f32) -> ()
      }) : (tensor<?x?xf32>, tensor<?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
      "func.return"(%7) : (tensor<?x?xf32>) -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.test.tile_using_custom_loop"(%0) <{tile_sizes = [10, 20]}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

