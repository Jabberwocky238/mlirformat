#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: 1>, sym_name = "grid"}> {sym_visibility = "private"} : () -> ()
  "func.func"() <{function_type = () -> (tensor<6x6xi32>, tensor<6x6xi32>, tensor<i32>), sym_name = "test_forward"}> ({
    %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "tensor.empty"() : () -> tensor<6x6xi32>
    %2 = "linalg.fill"(%0, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg7: i32, %arg8: i32):
      "linalg.yield"(%arg7) : (i32) -> ()
    }) : (i32, tensor<6x6xi32>) -> tensor<6x6xi32>
    %3 = "shard.sharding"() <{grid = @grid, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %4 = "shard.shard"(%2, %3) : (tensor<6x6xi32>, !shard.sharding) -> tensor<6x6xi32>
    %5 = "tensor.empty"() : () -> tensor<6x6xi32>
    %6 = "linalg.generic"(%4, %4, %5) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: i32, %arg5: i32, %arg6: i32):
      %14 = "arith.addi"(%arg4, %arg5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%14) : (i32) -> ()
    }) : (tensor<6x6xi32>, tensor<6x6xi32>, tensor<6x6xi32>) -> tensor<6x6xi32>
    %7 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %8 = "tensor.empty"() : () -> tensor<i32>
    %9 = "linalg.fill"(%7, %8) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: i32, %arg3: i32):
      "linalg.yield"(%arg2) : (i32) -> ()
    }) : (i32, tensor<i32>) -> tensor<i32>
    %10 = "linalg.reduce"(%6, %9) <{dimensions = array<i64: 0, 1>}> ({
    ^bb0(%arg0: i32, %arg1: i32):
      %13 = "arith.addi"(%arg0, %arg1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%13) : (i32) -> ()
    }) : (tensor<6x6xi32>, tensor<i32>) -> tensor<i32>
    %11 = "shard.sharding"() <{grid = @grid, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %12 = "shard.shard"(%10, %11) <{annotate_for_users}> : (tensor<i32>, !shard.sharding) -> tensor<i32>
    "func.return"(%4, %6, %12) : (tensor<6x6xi32>, tensor<6x6xi32>, tensor<i32>) -> ()
  }) {llvm.emit_c_interface} : () -> ()
}) {dlti.map = #dlti.map<"MPI:Implementation" = "mpich", "MPI:comm_world_rank" = 0 : i32>} : () -> ()

