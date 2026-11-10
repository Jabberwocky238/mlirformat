module {
  shard.grid @grid_1d(shape = 2)
  shard.grid @grid_1d_dynamic(shape = ?)
  shard.grid @grid_3d(shape = 2x2x2)
  func.func @same_source_and_target_sharding(%arg0: tensor<2xf32>) -> tensor<2xf32> {
    %sharding = shard.sharding @grid_1d split_axes = [[]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<2xf32>
    %sharding_0 = shard.sharding @grid_1d split_axes = [[]] : !shard.sharding
    %sharding_annotated_1 = shard.shard %sharding_annotated to %sharding_0 annotate_for_users : tensor<2xf32>
    return %sharding_annotated_1 : tensor<2xf32>
  }
  func.func @identical_source_and_target_sharding(%arg0: tensor<2xf32>) -> tensor<2xf32> {
    %sharding = shard.sharding @grid_1d split_axes = [[]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<2xf32>
    %sharding_annotated_0 = shard.shard %sharding_annotated to %sharding annotate_for_users : tensor<2xf32>
    return %sharding_annotated_0 : tensor<2xf32>
  }
  func.func @split_replicated_tensor_axis(%arg0: tensor<3x14xf32>) -> tensor<3x14xf32> {
    %sharding = shard.sharding @grid_1d split_axes = [[]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<3x14xf32>
    %sharding_0 = shard.sharding @grid_1d split_axes = [[], [0]] : !shard.sharding
    %sharding_annotated_1 = shard.shard %sharding_annotated to %sharding_0 annotate_for_users : tensor<3x14xf32>
    return %sharding_annotated_1 : tensor<3x14xf32>
  }
  func.func @split_replicated_tensor_axis_dynamic(%arg0: tensor<?x3x?xf32>) -> tensor<?x3x?xf32> {
    %sharding = shard.sharding @grid_1d_dynamic split_axes = [[], [], []] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<?x3x?xf32>
    %sharding_0 = shard.sharding @grid_1d_dynamic split_axes = [[0]] : !shard.sharding
    %sharding_annotated_1 = shard.shard %sharding_annotated to %sharding_0 annotate_for_users : tensor<?x3x?xf32>
    return %sharding_annotated_1 : tensor<?x3x?xf32>
  }
  func.func @move_split_axis(%arg0: tensor<10x14xf32>) -> tensor<10x14xf32> {
    %sharding = shard.sharding @grid_1d split_axes = [[0]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<10x14xf32>
    %sharding_0 = shard.sharding @grid_1d split_axes = [[], [0]] : !shard.sharding
    %sharding_annotated_1 = shard.shard %sharding_annotated to %sharding_0 annotate_for_users : tensor<10x14xf32>
    return %sharding_annotated_1 : tensor<10x14xf32>
  }
  func.func @move_split_axis_dynamic_grid(%arg0: tensor<10x14xf32>) -> tensor<10x14xf32> {
    %sharding = shard.sharding @grid_1d_dynamic split_axes = [[0]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<10x14xf32>
    %sharding_0 = shard.sharding @grid_1d_dynamic split_axes = [[], [0]] : !shard.sharding
    %sharding_annotated_1 = shard.shard %sharding_annotated to %sharding_0 annotate_for_users : tensor<10x14xf32>
    return %sharding_annotated_1 : tensor<10x14xf32>
  }
  func.func @move_split_dynamic_axis(%arg0: tensor<?x14xf32>) -> tensor<?x14xf32> {
    %sharding = shard.sharding @grid_1d split_axes = [[0]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<?x14xf32>
    %sharding_0 = shard.sharding @grid_1d split_axes = [[], [0]] : !shard.sharding
    %sharding_annotated_1 = shard.shard %sharding_annotated to %sharding_0 annotate_for_users : tensor<?x14xf32>
    return %sharding_annotated_1 : tensor<?x14xf32>
  }
  func.func @unshard_static_axis(%arg0: tensor<10x14xf32>) -> tensor<10x14xf32> {
    %sharding = shard.sharding @grid_1d split_axes = [[0]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<10x14xf32>
    %sharding_0 = shard.sharding @grid_1d split_axes = [[]] : !shard.sharding
    %sharding_annotated_1 = shard.shard %sharding_annotated to %sharding_0 annotate_for_users : tensor<10x14xf32>
    return %sharding_annotated_1 : tensor<10x14xf32>
  }
  func.func @unshard_static_last_axis(%arg0: tensor<10x14xf32>) -> tensor<10x14xf32> {
    %sharding = shard.sharding @grid_1d split_axes = [[], [0]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<10x14xf32>
    %sharding_0 = shard.sharding @grid_1d split_axes = [[], []] : !shard.sharding
    %sharding_annotated_1 = shard.shard %sharding_annotated to %sharding_0 annotate_for_users : tensor<10x14xf32>
    return %sharding_annotated_1 : tensor<10x14xf32>
  }
  func.func @unshard_dynamic_axis(%arg0: tensor<?x14xf32>) -> tensor<?x14xf32> {
    %sharding = shard.sharding @grid_1d split_axes = [[0]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<?x14xf32>
    %sharding_0 = shard.sharding @grid_1d split_axes = [[]] : !shard.sharding
    %sharding_annotated_1 = shard.shard %sharding_annotated to %sharding_0 annotate_for_users : tensor<?x14xf32>
    return %sharding_annotated_1 : tensor<?x14xf32>
  }
  func.func @unshard_static_axis_on_dynamic_grid_axis(%arg0: tensor<10x14xf32>) -> tensor<10x14xf32> {
    %sharding = shard.sharding @grid_1d_dynamic split_axes = [[0]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<10x14xf32>
    %sharding_0 = shard.sharding @grid_1d_dynamic split_axes = [[]] : !shard.sharding
    %sharding_annotated_1 = shard.shard %sharding_annotated to %sharding_0 annotate_for_users : tensor<10x14xf32>
    return %sharding_annotated_1 : tensor<10x14xf32>
  }
  func.func @move_last_split_axis_to_front_of_target_dim(%arg0: tensor<8x16xf32>) -> tensor<8x16xf32> {
    %sharding = shard.sharding @grid_3d split_axes = [[0, 1], [2]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<8x16xf32>
    %sharding_0 = shard.sharding @grid_3d split_axes = [[0], [1, 2]] : !shard.sharding
    %sharding_annotated_1 = shard.shard %sharding_annotated to %sharding_0 annotate_for_users : tensor<8x16xf32>
    return %sharding_annotated_1 : tensor<8x16xf32>
  }
  func.func @move_last_split_axis_to_lower_dim(%arg0: tensor<8x16xf32>) -> tensor<8x16xf32> {
    %sharding = shard.sharding @grid_3d split_axes = [[0], [1, 2]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<8x16xf32>
    %sharding_0 = shard.sharding @grid_3d split_axes = [[2, 0], [1]] : !shard.sharding
    %sharding_annotated_1 = shard.shard %sharding_annotated to %sharding_0 annotate_for_users : tensor<8x16xf32>
    return %sharding_annotated_1 : tensor<8x16xf32>
  }
  func.func @move_last_split_axis_empty_source_at_target_dim(%arg0: tensor<8x16xf32>) -> tensor<8x16xf32> {
    %sharding = shard.sharding @grid_3d split_axes = [[0, 1]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<8x16xf32>
    %sharding_0 = shard.sharding @grid_3d split_axes = [[0], [1]] : !shard.sharding
    %sharding_annotated_1 = shard.shard %sharding_annotated to %sharding_0 annotate_for_users : tensor<8x16xf32>
    return %sharding_annotated_1 : tensor<8x16xf32>
  }
}

