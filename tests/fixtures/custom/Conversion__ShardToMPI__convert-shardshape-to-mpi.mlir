module attributes {mpi.dlti = #dlti.map<"MPI:comm_world_rank" = 24 : i64>} {
  shard.grid @grid0(shape = 3x4x5)
  func.func @shard_shape_equal() -> (index, index, index) {
    %sharding = shard.sharding @grid0 split_axes = [[0], [1], [2]] : !shard.sharding
    %proc_linear_idx:3 = shard.process_multi_index on @grid0 : index, index, index
    %c9 = arith.constant 9 : index
    %c12 = arith.constant 12 : index
    %shard_shape:3 = shard.shard_shape dims = [%c9, %c12, 15] sharding = %sharding device = [%proc_linear_idx#0, %proc_linear_idx#1, %proc_linear_idx#2] : index, index, index
    return %shard_shape#0, %shard_shape#1, %shard_shape#2 : index, index, index
  }
  func.func @shard_shape_odd_1() -> (index, index, index) {
    %sharding = shard.sharding @grid0 split_axes = [[0], [1], [2]] : !shard.sharding
    %proc_linear_idx:3 = shard.process_multi_index on @grid0 : index, index, index
    %c9 = arith.constant 9 : index
    %c12 = arith.constant 12 : index
    %shard_shape:3 = shard.shard_shape dims = [%c9, %c12, 16] sharding = %sharding device = [%proc_linear_idx#0, %proc_linear_idx#1, %proc_linear_idx#2] : index, index, index
    return %shard_shape#0, %shard_shape#1, %shard_shape#2 : index, index, index
  }
  func.func @shard_shape_odd_2() -> (index, index, index) {
    %sharding = shard.sharding @grid0 split_axes = [[0], [1], [2]] : !shard.sharding
    %proc_linear_idx:3 = shard.process_multi_index on @grid0 : index, index, index
    %c9 = arith.constant 9 : index
    %shard_shape:3 = shard.shard_shape dims = [%c9, 15, 15] sharding = %sharding device = [%proc_linear_idx#0, %proc_linear_idx#1, %proc_linear_idx#2] : index, index, index
    return %shard_shape#0, %shard_shape#1, %shard_shape#2 : index, index, index
  }
  func.func @shard_shape_odd_3() -> (index, index, index) {
    %sharding = shard.sharding @grid0 split_axes = [[0], [1], [2]] : !shard.sharding
    %proc_linear_idx:3 = shard.process_multi_index on @grid0 : index, index, index
    %shard_shape:3 = shard.shard_shape dims = [11, 12, 15] sharding = %sharding device = [%proc_linear_idx#0, %proc_linear_idx#1, %proc_linear_idx#2] : index, index, index
    return %shard_shape#0, %shard_shape#1, %shard_shape#2 : index, index, index
  }
  func.func @shard_shape_sharded_dims_offs() -> (index, index, index) {
    %sharding = shard.sharding @grid0 split_axes = [[0], [1], [2]] sharded_dims_offsets = [0, 1, 4, 9, 0, 2, 6, 12, 12, 0, 3, 6, 9, 12, 15] : !shard.sharding
    %proc_linear_idx:3 = shard.process_multi_index on @grid0 : index, index, index
    %c9 = arith.constant 9 : index
    %c12 = arith.constant 12 : index
    %shard_shape:3 = shard.shard_shape dims = [%c9, %c12, 15] sharding = %sharding device = [%proc_linear_idx#0, %proc_linear_idx#1, %proc_linear_idx#2] : index, index, index
    return %shard_shape#0, %shard_shape#1, %shard_shape#2 : index, index, index
  }
}

