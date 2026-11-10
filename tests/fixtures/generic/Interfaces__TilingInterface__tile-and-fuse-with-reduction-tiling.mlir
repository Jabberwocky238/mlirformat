#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "builtin.module"() ({
    "func.func"() <{function_type = (tensor<?x?xf32>) -> tensor<?xf32>, sym_name = "tile_and_fuse_with_partial_reduction_outer_parallel"}> ({
    ^bb0(%arg1: tensor<?x?xf32>):
      %2 = "arith.constant"() <{value = 0 : index}> : () -> index
      %3 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
      %4 = "tensor.dim"(%arg1, %2) : (tensor<?x?xf32>, index) -> index
      %5 = "tensor.empty"(%4) : (index) -> tensor<?xf32>
      %6 = "linalg.fill"(%3, %5) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg4: f32, %arg5: f32):
        "linalg.yield"(%arg4) : (f32) -> ()
      }) : (f32, tensor<?xf32>) -> tensor<?xf32>
      %7 = "linalg.generic"(%arg1, %6) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg2: f32, %arg3: f32):
        %8 = "arith.addf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "linalg.yield"(%8) : (f32) -> ()
      }) : (tensor<?x?xf32>, tensor<?xf32>) -> tensor<?xf32>
      "func.return"(%7) : (tensor<?xf32>) -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.test.tile_and_fuse_outer_parallel_partial_reduction"(%0) <{reduction_dims = [], tile_sizes = [128]}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "builtin.module"() ({
    "func.func"() <{function_type = (tensor<8x128xf32>) -> tensor<8xi32>, sym_name = "partial_reduction_with_linalg_index"}> ({
    ^bb0(%arg1: tensor<8x128xf32>):
      %2 = "arith.constant"() <{value = 0 : i32}> : () -> i32
      %3 = "tensor.empty"() : () -> tensor<8xi32>
      %4 = "linalg.fill"(%2, %3) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg4: i32, %arg5: i32):
        "linalg.yield"(%arg4) : (i32) -> ()
      }) : (i32, tensor<8xi32>) -> tensor<8xi32>
      %5 = "linalg.generic"(%arg1, %4) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg2: f32, %arg3: i32):
        %6 = "linalg.index"() <{dim = 1 : i64}> : () -> index
        %7 = "arith.index_cast"(%6) : (index) -> i32
        %8 = "arith.addi"(%7, %arg3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
        "linalg.yield"(%8) : (i32) -> ()
      }) : (tensor<8x128xf32>, tensor<8xi32>) -> tensor<8xi32>
      "func.return"(%5) : (tensor<8xi32>) -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.test.tile_and_fuse_outer_parallel_partial_reduction"(%0) <{reduction_dims = [], tile_sizes = [32]}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

