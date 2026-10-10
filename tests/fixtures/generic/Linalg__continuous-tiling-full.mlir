#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg6: !transform.any_op):
      %3 = "transform.structured.match"(%arg6) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %4:2 = "transform.structured.continuous_tile_sizes"(%3) <{dimension = 0 : i64, target_size = 9 : i64}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %5 = "transform.structured.split"(%3, %4#1) <{dimension = 0 : i64, multiway, static_chunk_sizes = -9223372036854775808 : i64}> : (!transform.any_op, !transform.any_op) -> !transform.any_op
      "transform.foreach"(%5, %4#0) ({
      ^bb0(%arg7: !transform.any_op, %arg8: !transform.any_op):
        %6:2 = "transform.structured.tile_using_for"(%arg7, %arg8) <{scalable_sizes = array<i1: false>, static_sizes = array<i64: -9223372036854775808>}> : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
        "transform.yield"() : () -> ()
      }) : (!transform.any_op, !transform.any_op) -> ()
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
      %4:2 = "transform.structured.continuous_tile_sizes"(%3) <{dimension = 0 : i64, target_size = 9 : i64}> : (!transform.any_op) -> (!transform.param<i64>, !transform.param<i64>)
      %5 = "transform.structured.split"(%3, %4#1) <{dimension = 0 : i64, multiway, static_chunk_sizes = -9223372036854775808 : i64}> : (!transform.any_op, !transform.param<i64>) -> !transform.any_op
      "transform.foreach"(%5, %4#0) ({
      ^bb0(%arg7: !transform.any_op, %arg8: !transform.param<i64>):
        %6:2 = "transform.structured.tile_using_for"(%arg7, %arg8) <{scalable_sizes = array<i1: false>, static_sizes = array<i64: -9223372036854775808>}> : (!transform.any_op, !transform.param<i64>) -> (!transform.any_op, !transform.any_op)
        "transform.yield"() : () -> ()
      }) : (!transform.any_op, !transform.param<i64>) -> ()
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

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg6: !transform.any_op):
      %3 = "transform.structured.match"(%arg6) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %4:2 = "transform.structured.continuous_tile_sizes"(%3) <{dimension = 0 : i64, target_size = 9 : i64}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %5 = "transform.structured.split"(%3, %4#1) <{dimension = 0 : i64, multiway, static_chunk_sizes = -9223372036854775808 : i64}> : (!transform.any_op, !transform.any_op) -> !transform.any_op
      "transform.foreach"(%5, %4#0) <{with_zip_shortest}> ({
      ^bb0(%arg7: !transform.any_op, %arg8: !transform.any_op):
        %6:2 = "transform.structured.tile_using_for"(%arg7, %arg8) <{scalable_sizes = array<i1: false>, static_sizes = array<i64: -9223372036854775808>}> : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
        "transform.yield"() : () -> ()
      }) : (!transform.any_op, !transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "continuous_tile_dynamic_linalg_matmul"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>):
    %0 = "linalg.matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%0) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

