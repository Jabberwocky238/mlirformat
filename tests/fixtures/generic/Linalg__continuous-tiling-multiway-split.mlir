#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg6: !transform.any_op):
      %3 = "transform.structured.match"(%arg6) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %4:2 = "transform.structured.continuous_tile_sizes"(%3) <{dimension = 1 : i64, target_size = 9 : i64}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %5 = "transform.structured.split"(%3, %4#1) <{dimension = 1 : i64, multiway, static_chunk_sizes = -9223372036854775808 : i64}> : (!transform.any_op, !transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
  "func.func"() <{function_type = (tensor<25x34xf32>, tensor<34x25xf32>, tensor<25x25xf32>) -> tensor<25x25xf32>, sym_name = "continuous_tile_linalg_matmul"}> ({
  ^bb0(%arg0: tensor<25x34xf32>, %arg1: tensor<34x25xf32>, %arg2: tensor<25x25xf32>):
    %0 = "linalg.matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<25x34xf32>, tensor<34x25xf32>, tensor<25x25xf32>) -> tensor<25x25xf32>
    "func.return"(%0) : (tensor<25x25xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg6: !transform.any_op):
      %3 = "transform.structured.match"(%arg6) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %4:2 = "transform.structured.continuous_tile_sizes"(%3) <{dimension = 1 : i64, target_size = 9 : i64}> : (!transform.any_op) -> (!transform.param<i64>, !transform.param<i64>)
      %5 = "transform.structured.split"(%3, %4#1) <{dimension = 1 : i64, multiway, static_chunk_sizes = -9223372036854775808 : i64}> : (!transform.any_op, !transform.param<i64>) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
  "func.func"() <{function_type = (tensor<25x34xf32>, tensor<34x25xf32>, tensor<25x25xf32>) -> tensor<25x25xf32>, sym_name = "continuous_tile_static_linalg_matmul"}> ({
  ^bb0(%arg0: tensor<25x34xf32>, %arg1: tensor<34x25xf32>, %arg2: tensor<25x25xf32>):
    %0 = "linalg.matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<25x34xf32>, tensor<34x25xf32>, tensor<25x25xf32>) -> tensor<25x25xf32>
    "func.return"(%0) : (tensor<25x25xf32>) -> ()
  }) : () -> ()
}) : () -> ()

