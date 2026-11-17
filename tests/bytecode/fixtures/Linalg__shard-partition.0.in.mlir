"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: 2>, sym_name = "grid_1d"}> : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = (tensor<2xi8>, tensor<2xi8>, tensor<2xi8>) -> tensor<2xi8>, sym_name = "elementwise_static_1d_grid_static_1d_tensor"}> ({
  ^bb0(%arg0: tensor<2xi8> loc("<stdin>":5:8), %arg1: tensor<2xi8> loc("<stdin>":5:29), %arg2: tensor<2xi8> loc("<stdin>":5:50)):
    %0 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding loc("<stdin>":6:10)
    %1 = "shard.shard"(%arg0, %0) : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8> loc("<stdin>":7:10)
    %2 = "shard.shard"(%1, %0) <{annotate_for_users}> : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8> loc("<stdin>":8:10)
    %3 = "shard.shard"(%arg1, %0) : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8> loc("<stdin>":9:10)
    %4 = "shard.shard"(%3, %0) <{annotate_for_users}> : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8> loc("<stdin>":10:10)
    %5 = "shard.shard"(%arg2, %0) : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8> loc("<stdin>":11:10)
    %6 = "shard.shard"(%5, %0) <{annotate_for_users}> : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8> loc("<stdin>":12:10)
    %7 = "linalg.generic"(%2, %4, %6) <{indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: i8 loc("<stdin>":14:10), %arg4: i8 loc("<stdin>":14:21), %arg5: i8 loc("<stdin>":14:32)):
      %10 = "arith.muli"(%arg3, %arg4) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8 loc("<stdin>":15:13)
      "linalg.yield"(%10) : (i8) -> () loc("<stdin>":16:7)
    }) : (tensor<2xi8>, tensor<2xi8>, tensor<2xi8>) -> tensor<2xi8> loc("<stdin>":13:10)
    %8 = "shard.shard"(%7, %0) : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8> loc("<stdin>":18:10)
    %9 = "shard.shard"(%8, %0) <{annotate_for_users}> : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8> loc("<stdin>":19:10)
    "func.return"(%9) : (tensor<2xi8>) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":4:3)
}) : () -> () loc("<stdin>":2:1)
