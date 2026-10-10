#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: 2>, sym_name = "grid_1d"}> : () -> ()
  "func.func"() <{function_type = (tensor<2xi8>, tensor<2xi8>, tensor<2xi8>) -> tensor<2xi8>, sym_name = "elementwise_static_1d_grid_static_1d_tensor"}> ({
  ^bb0(%arg0: tensor<2xi8>, %arg1: tensor<2xi8>, %arg2: tensor<2xi8>):
    %0 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %1 = "shard.shard"(%arg0, %0) : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    %2 = "shard.shard"(%1, %0) <{annotate_for_users}> : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    %3 = "shard.shard"(%arg1, %0) : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    %4 = "shard.shard"(%3, %0) <{annotate_for_users}> : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    %5 = "shard.shard"(%arg2, %0) : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    %6 = "shard.shard"(%5, %0) <{annotate_for_users}> : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    %7 = "linalg.generic"(%2, %4, %6) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: i8, %arg4: i8, %arg5: i8):
      %10 = "arith.muli"(%arg3, %arg4) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8
      "linalg.yield"(%10) : (i8) -> ()
    }) : (tensor<2xi8>, tensor<2xi8>, tensor<2xi8>) -> tensor<2xi8>
    %8 = "shard.shard"(%7, %0) : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    %9 = "shard.shard"(%8, %0) <{annotate_for_users}> : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    "func.return"(%9) : (tensor<2xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: 4>, sym_name = "grid_1d"}> : () -> ()
  "func.func"() <{function_type = (tensor<4x3xi8>, tensor<3x8xi8>, tensor<4x8xi8>) -> tensor<4x8xi8>, sym_name = "matmul_1d_grid_static_tensors_parallel_iterator_sharding"}> ({
  ^bb0(%arg0: tensor<4x3xi8>, %arg1: tensor<3x8xi8>, %arg2: tensor<4x8xi8>):
    %0 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %1 = "shard.shard"(%arg0, %0) : (tensor<4x3xi8>, !shard.sharding) -> tensor<4x3xi8>
    %2 = "shard.shard"(%1, %0) <{annotate_for_users}> : (tensor<4x3xi8>, !shard.sharding) -> tensor<4x3xi8>
    %3 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %4 = "shard.shard"(%arg1, %3) : (tensor<3x8xi8>, !shard.sharding) -> tensor<3x8xi8>
    %5 = "shard.shard"(%4, %3) <{annotate_for_users}> : (tensor<3x8xi8>, !shard.sharding) -> tensor<3x8xi8>
    %6 = "shard.shard"(%arg2, %0) : (tensor<4x8xi8>, !shard.sharding) -> tensor<4x8xi8>
    %7 = "shard.shard"(%6, %0) <{annotate_for_users}> : (tensor<4x8xi8>, !shard.sharding) -> tensor<4x8xi8>
    %8 = "linalg.matmul"(%2, %5, %7) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: i8, %arg4: i8, %arg5: i8):
      %11 = "arith.muli"(%arg3, %arg4) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8
      %12 = "arith.addi"(%arg5, %11) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8
      "linalg.yield"(%12) : (i8) -> ()
    }) : (tensor<4x3xi8>, tensor<3x8xi8>, tensor<4x8xi8>) -> tensor<4x8xi8>
    %9 = "shard.shard"(%8, %0) : (tensor<4x8xi8>, !shard.sharding) -> tensor<4x8xi8>
    %10 = "shard.shard"(%9, %0) <{annotate_for_users}> : (tensor<4x8xi8>, !shard.sharding) -> tensor<4x8xi8>
    "func.return"(%10) : (tensor<4x8xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: 3>, sym_name = "grid_1d"}> : () -> ()
  "func.func"() <{function_type = (tensor<4x6xi8>, tensor<6x8xi8>, tensor<4x8xi8>) -> tensor<4x8xi8>, sym_name = "matmul_1d_grid_static_tensors_reduction_iterator_sharding"}> ({
  ^bb0(%arg0: tensor<4x6xi8>, %arg1: tensor<6x8xi8>, %arg2: tensor<4x8xi8>):
    %0 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[], [0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %1 = "shard.shard"(%arg0, %0) : (tensor<4x6xi8>, !shard.sharding) -> tensor<4x6xi8>
    %2 = "shard.shard"(%1, %0) <{annotate_for_users}> : (tensor<4x6xi8>, !shard.sharding) -> tensor<4x6xi8>
    %3 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %4 = "shard.shard"(%arg1, %3) : (tensor<6x8xi8>, !shard.sharding) -> tensor<6x8xi8>
    %5 = "shard.shard"(%4, %3) <{annotate_for_users}> : (tensor<6x8xi8>, !shard.sharding) -> tensor<6x8xi8>
    %6 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %7 = "shard.shard"(%arg2, %6) : (tensor<4x8xi8>, !shard.sharding) -> tensor<4x8xi8>
    %8 = "shard.shard"(%7, %6) <{annotate_for_users}> : (tensor<4x8xi8>, !shard.sharding) -> tensor<4x8xi8>
    %9 = "linalg.matmul"(%2, %5, %8) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: i8, %arg4: i8, %arg5: i8):
      %12 = "arith.muli"(%arg3, %arg4) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8
      %13 = "arith.addi"(%arg5, %12) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8
      "linalg.yield"(%13) : (i8) -> ()
    }) : (tensor<4x6xi8>, tensor<6x8xi8>, tensor<4x8xi8>) -> tensor<4x8xi8>
    %10 = "shard.shard"(%9, %6) : (tensor<4x8xi8>, !shard.sharding) -> tensor<4x8xi8>
    %11 = "shard.shard"(%10, %6) <{annotate_for_users}> : (tensor<4x8xi8>, !shard.sharding) -> tensor<4x8xi8>
    "func.return"(%11) : (tensor<4x8xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: 4>, sym_name = "grid_1d"}> : () -> ()
  "func.func"() <{function_type = (tensor<4x6xi8>, tensor<6x8xi8>, tensor<4x8xi8>) -> tensor<4x8xi8>, sym_name = "matmul_1d_grid_static_tensors_parallel_iterator_unsplit_last_axis"}> ({
  ^bb0(%arg0: tensor<4x6xi8>, %arg1: tensor<6x8xi8>, %arg2: tensor<4x8xi8>):
    %0 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[], []]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %1 = "shard.shard"(%arg0, %0) : (tensor<4x6xi8>, !shard.sharding) -> tensor<4x6xi8>
    %2 = "shard.shard"(%1, %0) <{annotate_for_users}> : (tensor<4x6xi8>, !shard.sharding) -> tensor<4x6xi8>
    %3 = "shard.shard"(%arg1, %0) : (tensor<6x8xi8>, !shard.sharding) -> tensor<6x8xi8>
    %4 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[], [0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %5 = "shard.shard"(%3, %4) <{annotate_for_users}> : (tensor<6x8xi8>, !shard.sharding) -> tensor<6x8xi8>
    %6 = "shard.shard"(%arg2, %0) : (tensor<4x8xi8>, !shard.sharding) -> tensor<4x8xi8>
    %7 = "shard.shard"(%6, %4) <{annotate_for_users}> : (tensor<4x8xi8>, !shard.sharding) -> tensor<4x8xi8>
    %8 = "linalg.matmul"(%2, %5, %7) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: i8, %arg4: i8, %arg5: i8):
      %11 = "arith.muli"(%arg3, %arg4) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8
      %12 = "arith.addi"(%arg5, %11) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8
      "linalg.yield"(%12) : (i8) -> ()
    }) : (tensor<4x6xi8>, tensor<6x8xi8>, tensor<4x8xi8>) -> tensor<4x8xi8>
    %9 = "shard.shard"(%8, %4) : (tensor<4x8xi8>, !shard.sharding) -> tensor<4x8xi8>
    %10 = "shard.shard"(%9, %0) <{annotate_for_users}> : (tensor<4x8xi8>, !shard.sharding) -> tensor<4x8xi8>
    "func.return"(%10) : (tensor<4x8xi8>) -> ()
  }) : () -> ()
}) : () -> ()

