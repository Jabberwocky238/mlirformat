"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: 4>, sym_name = "grid"}> : () -> ()
  "func.func"() <{function_type = (tensor<?x8xf32>, index) -> (), sym_name = "test_alloc_tensor_op"}> ({
  ^bb0(%arg4: tensor<?x8xf32>, %arg5: index):
    %16 = "shard.sharding"() <{grid = @grid, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[], [0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %17 = "shard.shard"(%arg4, %16) : (tensor<?x8xf32>, !shard.sharding) -> tensor<?x8xf32>
    %18 = "bufferization.alloc_tensor"(%arg5) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (index) -> tensor<?x8xf32>
    %19 = "shard.shard"(%18, %16) : (tensor<?x8xf32>, !shard.sharding) -> tensor<?x8xf32>
    %20 = "shard.shard"(%17, %16) <{annotate_for_users}> : (tensor<?x8xf32>, !shard.sharding) -> tensor<?x8xf32>
    %21 = "bufferization.alloc_tensor"(%20) <{operandSegmentSizes = array<i32: 0, 1, 0>}> {escape = true} : (tensor<?x8xf32>) -> tensor<?x8xf32>
    %22 = "shard.shard"(%21, %16) : (tensor<?x8xf32>, !shard.sharding) -> tensor<?x8xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4xi32>) -> (), sym_name = "test_dealloc_tensor_op"}> ({
  ^bb0(%arg3: tensor<4xi32>):
    %13 = "shard.sharding"() <{grid = @grid, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %14 = "shard.shard"(%arg3, %13) : (tensor<4xi32>, !shard.sharding) -> tensor<4xi32>
    %15 = "shard.shard"(%14, %13) <{annotate_for_users}> : (tensor<4xi32>, !shard.sharding) -> tensor<4xi32>
    "bufferization.dealloc_tensor"(%15) : (tensor<4xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf32>, tensor<?xf32>, tensor<8xf32>) -> tensor<8xf32>, sym_name = "test_materialize_in_destination_op"}> ({
  ^bb0(%arg0: tensor<?xf32>, %arg1: tensor<?xf32>, %arg2: tensor<8xf32>):
    %0 = "shard.sharding"() <{grid = @grid, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %1 = "shard.shard"(%arg0, %0) : (tensor<?xf32>, !shard.sharding) -> tensor<?xf32>
    %2 = "shard.shard"(%arg1, %0) : (tensor<?xf32>, !shard.sharding) -> tensor<?xf32>
    %3 = "shard.shard"(%arg2, %0) : (tensor<8xf32>, !shard.sharding) -> tensor<8xf32>
    %4 = "shard.shard"(%1, %0) <{annotate_for_users}> : (tensor<?xf32>, !shard.sharding) -> tensor<?xf32>
    %5 = "shard.shard"(%2, %0) <{annotate_for_users}> : (tensor<?xf32>, !shard.sharding) -> tensor<?xf32>
    %6 = "bufferization.materialize_in_destination"(%4, %5) : (tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
    %7 = "shard.shard"(%6, %0) : (tensor<?xf32>, !shard.sharding) -> tensor<?xf32>
    %8 = "shard.shard"(%1, %0) <{annotate_for_users}> : (tensor<?xf32>, !shard.sharding) -> tensor<?xf32>
    %9 = "shard.shard"(%3, %0) <{annotate_for_users}> : (tensor<8xf32>, !shard.sharding) -> tensor<8xf32>
    %10 = "bufferization.materialize_in_destination"(%8, %9) : (tensor<?xf32>, tensor<8xf32>) -> tensor<8xf32>
    %11 = "shard.shard"(%10, %0) : (tensor<8xf32>, !shard.sharding) -> tensor<8xf32>
    %12 = "shard.shard"(%11, %0) <{annotate_for_users}> : (tensor<8xf32>, !shard.sharding) -> tensor<8xf32>
    "func.return"(%12) : (tensor<8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

