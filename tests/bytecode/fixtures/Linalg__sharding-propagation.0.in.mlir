"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: 2>, sym_name = "grid_2"}> : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = (tensor<2x3xf32>, tensor<3x2xf32>, tensor<2x2xf32>) -> tensor<2x2xf32>, sym_name = "matmul_shard_prallel_axis"}> ({
  ^bb0(%arg0: tensor<2x3xf32> loc("<stdin>":7:8), %arg1: tensor<3x2xf32> loc("<stdin>":7:32), %arg2: tensor<2x2xf32> loc("<stdin>":7:56)):
    %0 = "shard.sharding"() <{grid = @grid_2, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding loc("<stdin>":8:10)
    %1 = "shard.shard"(%arg0, %0) : (tensor<2x3xf32>, !shard.sharding) -> tensor<2x3xf32> loc("<stdin>":9:10)
    %2 = "linalg.matmul"(%1, %arg1, %arg2) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":11:10), %arg4: f32 loc("<stdin>":11:22), %arg5: f32 loc("<stdin>":11:34)):
      %5 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":12:12)
      %6 = "arith.addf"(%arg5, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":13:12)
      "linalg.yield"(%6) : (f32) -> () loc("<stdin>":14:7)
    }) : (tensor<2x3xf32>, tensor<3x2xf32>, tensor<2x2xf32>) -> tensor<2x2xf32> loc("<stdin>":10:10)
    %3 = "shard.sharding"() <{grid = @grid_2, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding loc("<stdin>":16:10)
    %4 = "shard.shard"(%2, %3) <{annotate_for_users}> : (tensor<2x2xf32>, !shard.sharding) -> tensor<2x2xf32> loc("<stdin>":17:10)
    "func.return"(%4) : (tensor<2x2xf32>) -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":6:3)
}) : () -> () loc("<stdin>":4:1)
