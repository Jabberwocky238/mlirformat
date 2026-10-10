module {
  shard.grid @grid_1d_4(shape = 4)
  func.func @tensor_empty_static_sharded_dims_offsets() {
    %0 = tensor.empty() : tensor<8x16xf32>
    %sharding = shard.sharding @grid_1d_4 split_axes = [[0]] sharded_dims_offsets = [0, 1, 4, 7, 8] : !shard.sharding
    %sharding_annotated = shard.shard %0 to %sharding : tensor<8x16xf32>
    return
  }
  func.func @tensor_empty_dynamic_sharded_dims_offsets(%arg0: index) {
    %0 = tensor.empty(%arg0) : tensor<8x?xf32>
    %sharding = shard.sharding @grid_1d_4 split_axes = [[0]] sharded_dims_offsets = [0, 1, 4, 7, 8] : !shard.sharding
    %sharding_annotated = shard.shard %0 to %sharding : tensor<8x?xf32>
    return
  }
  func.func @tensor_empty_same_static_dims_sizes() {
    %0 = tensor.empty() : tensor<16x16xf32>
    %sharding = shard.sharding @grid_1d_4 split_axes = [[0]] sharded_dims_offsets = [0, 4, 8, 12, 16] : !shard.sharding
    %sharding_annotated = shard.shard %0 to %sharding : tensor<16x16xf32>
    return
  }
  func.func @tensor_empty_0d() {
    %0 = tensor.empty() : tensor<f32>
    return
  }
}

