module {
}

// -----
module {
  shard.grid @grid0(shape = 3x4x5)
  func.func @process_multi_index() -> (index, index, index) {
    %proc_linear_idx:3 = shard.process_multi_index on @grid0 : index, index, index
    return %proc_linear_idx#0, %proc_linear_idx#1, %proc_linear_idx#2 : index, index, index
  }
  func.func @process_linear_index() -> index {
    %proc_linear_idx = shard.process_linear_index on @grid0 : index
    return %proc_linear_idx : index
  }
  func.func @neighbors_dim0(%arg0: tensor<120x120x120xi8>) -> (index, index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %down_linear_idx, %up_linear_idx = shard.neighbors_linear_indices on @grid0[%c1, %c0, %c4] split_axes = [0] : index, index
    return %down_linear_idx, %up_linear_idx : index, index
  }
  func.func @neighbors_dim1(%arg0: tensor<120x120x120xi8>) -> (index, index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %down_linear_idx, %up_linear_idx = shard.neighbors_linear_indices on @grid0[%c1, %c0, %c4] split_axes = [1] : index, index
    return %down_linear_idx, %up_linear_idx : index, index
  }
  func.func @neighbors_dim2(%arg0: tensor<120x120x120xi8>) -> (index, index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %down_linear_idx, %up_linear_idx = shard.neighbors_linear_indices on @grid0[%c1, %c0, %c4] split_axes = [2] : index, index
    return %down_linear_idx, %up_linear_idx : index, index
  }
}

// -----
module attributes {mpi.dlti = #dlti.map<"MPI:comm_world_rank" = 24 : i64>} {
  shard.grid @grid0(shape = 3x4x5)
  func.func @process_multi_index() -> (index, index, index) {
    %proc_linear_idx:3 = shard.process_multi_index on @grid0 : index, index, index
    return %proc_linear_idx#0, %proc_linear_idx#1, %proc_linear_idx#2 : index, index, index
  }
  func.func @process_linear_index() -> index {
    %proc_linear_idx = shard.process_linear_index on @grid0 : index
    return %proc_linear_idx : index
  }
}

// -----
module attributes {mpi.dlti = #dlti.map<"MPI:comm_world_rank" = 7 : i64>} {
  shard.grid @grid0(shape = 3x4x5)
  func.func @allreduce_tensor(%arg0: tensor<3x4xf32>) -> tensor<3x4xf32> {
    %all_reduce = shard.all_reduce %arg0 on @grid0 grid_axes = [0, 1] reduction =  max : tensor<3x4xf32> -> tensor<3x4xf32>
    return %all_reduce : tensor<3x4xf32>
  }
  func.func @allreduce_memref(%arg0: memref<3x4xf32>) -> memref<3x4xf32> {
    %all_reduce = shard.all_reduce %arg0 on @grid0 grid_axes = [0, 1] reduction =  max : memref<3x4xf32> -> memref<3x4xf32>
    return %all_reduce : memref<3x4xf32>
  }
  func.func @allreduce_new_type(%arg0: memref<3x4xf32>) -> memref<3x4xf64> {
    %all_reduce = shard.all_reduce %arg0 on @grid0 grid_axes = [0, 1] reduction =  max : memref<3x4xf32> -> memref<3x4xf64>
    return %all_reduce : memref<3x4xf64>
  }
}

// -----
module {
  shard.grid @grid0(shape = 3x4x5)
  func.func @update_halo_1d_first(%arg0: memref<120x120x120xi8>) -> memref<120x120x120xi8> {
    %0 = shard.update_halo %arg0 on @grid0 split_axes = [[0]] halo_sizes = [2, 3] : memref<120x120x120xi8>
    return %0 : memref<120x120x120xi8>
  }
}

// -----
module attributes {mpi.dlti = #dlti.map<"MPI:comm_world_rank" = 1 : i64>} {
  shard.grid @grid0(shape = 4)
  func.func @update_halo_1d_with_zero(%arg0: memref<120x120x120xi8>) -> memref<120x120x120xi8> {
    %0 = shard.update_halo %arg0 on @grid0 split_axes = [[0]] halo_sizes = [2, 0] : memref<120x120x120xi8>
    return %0 : memref<120x120x120xi8>
  }
}

// -----
module attributes {mpi.dlti = #dlti.map<"MPI:comm_world_rank" = 24 : i64>} {
  shard.grid @grid0(shape = 3x4x5)
  func.func @update_halo_3d(%arg0: memref<120x120x120xi8>) -> memref<120x120x120xi8> {
    %0 = shard.update_halo %arg0 on @grid0 split_axes = [[2], [1], [0]] halo_sizes = [1, 2, 3, 4, 5, 6] : memref<120x120x120xi8>
    return %0 : memref<120x120x120xi8>
  }
  func.func @update_halo_3d_tensor(%arg0: tensor<120x120x120xi8>) -> tensor<120x120x120xi8> {
    %0 = shard.update_halo %arg0 on @grid0 split_axes = [[2], [1], [0]] halo_sizes = [1, 2, 3, 4, 5, 6] : tensor<120x120x120xi8>
    return %0 : tensor<120x120x120xi8>
  }
}

// -----
module {
  shard.grid @grid0(shape = 2x2x4)
  func.func @return_sharding(%arg0: tensor<2x4xf32>) -> (tensor<2x4xf32>, !shard.sharding) {
    %sharding = shard.sharding @grid0 split_axes = [[0, 1], [2]] : !shard.sharding
    return %arg0, %sharding : tensor<2x4xf32>, !shard.sharding
  }
  func.func @return_sharding_halos(%arg0: tensor<6x8xf32>) -> (tensor<6x8xf32>, !shard.sharding) {
    %sharding = shard.sharding @grid0 split_axes = [[0, 1], [2]] halo_sizes = [0, 4, 3, 1] : !shard.sharding
    return %arg0, %sharding : tensor<6x8xf32>, !shard.sharding
  }
  func.func @return_sharding_offs(%arg0: tensor<?x?xf32>) -> (tensor<?x?xf32>, !shard.sharding) {
    %sharding = shard.sharding @grid0 split_axes = [[0, 1], [2]] sharded_dims_offsets = [0, 3, 5, 7, 8, 0, 0, 5, 10, 16] : !shard.sharding
    return %arg0, %sharding : tensor<?x?xf32>, !shard.sharding
  }
}

