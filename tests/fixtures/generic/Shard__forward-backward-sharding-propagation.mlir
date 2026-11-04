#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: 1>, sym_name = "grid"}> {sym_visibility = "private"} : () -> ()
  "func.func"() <{function_type = () -> tensor<6x6xi32>, sym_name = "test_forward"}> ({
    %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "tensor.empty"() : () -> tensor<6x6xi32>
    %2 = "shard.sharding"() <{grid = @grid, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %3 = "shard.shard"(%1, %2) : (tensor<6x6xi32>, !shard.sharding) -> tensor<6x6xi32>
    %4 = "linalg.fill"(%0, %3) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: i32, %arg4: i32):
      "linalg.yield"(%arg3) : (i32) -> ()
    }) : (i32, tensor<6x6xi32>) -> tensor<6x6xi32>
    %5 = "tensor.empty"() : () -> tensor<6x6xi32>
    %6 = "linalg.generic"(%5, %4, %5) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg0: i32, %arg1: i32, %arg2: i32):
      %9 = "arith.addi"(%arg0, %arg1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%9) : (i32) -> ()
    }) : (tensor<6x6xi32>, tensor<6x6xi32>, tensor<6x6xi32>) -> tensor<6x6xi32>
    %7 = "shard.sharding"() <{grid = @grid, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[1]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %8 = "shard.shard"(%6, %7) : (tensor<6x6xi32>, !shard.sharding) -> tensor<6x6xi32>
    "func.return"(%8) : (tensor<6x6xi32>) -> ()
  }) : () -> ()
}) : () -> ()

