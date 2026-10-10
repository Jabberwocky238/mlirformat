#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: 2>, sym_name = "grid_2"}> : () -> ()
  "func.func"() <{function_type = (tensor<2x3xf32>, tensor<3x2xf32>, tensor<2x2xf32>) -> tensor<2x2xf32>, sym_name = "matmul_shard_prallel_axis"}> ({
  ^bb0(%arg0: tensor<2x3xf32>, %arg1: tensor<3x2xf32>, %arg2: tensor<2x2xf32>):
    %0 = "shard.sharding"() <{grid = @grid_2, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %1 = "shard.shard"(%arg0, %0) : (tensor<2x3xf32>, !shard.sharding) -> tensor<2x3xf32>
    %2 = "linalg.matmul"(%1, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %5 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %6 = "arith.addf"(%arg5, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%6) : (f32) -> ()
    }) : (tensor<2x3xf32>, tensor<3x2xf32>, tensor<2x2xf32>) -> tensor<2x2xf32>
    %3 = "shard.sharding"() <{grid = @grid_2, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %4 = "shard.shard"(%2, %3) <{annotate_for_users}> : (tensor<2x2xf32>, !shard.sharding) -> tensor<2x2xf32>
    "func.return"(%4) : (tensor<2x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

