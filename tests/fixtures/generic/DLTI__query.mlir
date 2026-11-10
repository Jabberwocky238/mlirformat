#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "builtin.module"() ({
    "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "matmul_tensors"}> ({
    ^bb0(%arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>, %arg3: tensor<?x?xf32>):
      %3 = "linalg.matmul"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
      ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
        %4 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        %5 = "arith.addf"(%arg6, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "linalg.yield"(%5) : (f32) -> ()
      }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
      "func.return"(%3) : (tensor<?x?xf32>) -> ()
    }) : () -> ()
  }) {test.dlti = #dlti.target_system_spec<"CPU" = #dlti.target_device_spec<"inner_most_tile_size" = 42 : i32>>} : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.dlti.query"(%0) <{keys = ["CPU", "inner_most_tile_size"]}> : (!transform.any_op) -> !transform.param<i32>
      %2:2 = "transform.structured.tile_using_for"(%0, %1) <{scalable_sizes = array<i1: false>, static_sizes = array<i64: -9223372036854775808>}> : (!transform.any_op, !transform.param<i32>) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

