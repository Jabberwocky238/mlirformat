module {
  shard.grid @grid_2(shape = 2)
  shard.grid @grid_1d(shape = ?)
  shard.grid @grid_2d(shape = 2x4)
  shard.grid @grid_3d(shape = ?x?x?)
  func.func @element_wise_empty_sharding_info(%arg0: tensor<8x16xf32>) -> tensor<8x16xf32> {
    %0 = tosa.sigmoid %arg0 : (tensor<8x16xf32>) -> tensor<8x16xf32>
    return %0 : tensor<8x16xf32>
  }
  func.func @element_wise_on_def(%arg0: tensor<8x16xf32>) -> tensor<8x16xf32> {
    %0 = tosa.sigmoid %arg0 : (tensor<8x16xf32>) -> tensor<8x16xf32>
    %sharding = shard.sharding @grid_2d split_axes = [[0], [1]] : !shard.sharding
    %sharding_annotated = shard.shard %0 to %sharding : tensor<8x16xf32>
    return %sharding_annotated : tensor<8x16xf32>
  }
  func.func @element_wise_on_use(%arg0: tensor<8x16xf32>) -> tensor<8x16xf32> {
    %sharding = shard.sharding @grid_2d split_axes = [[0], [1]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding annotate_for_users : tensor<8x16xf32>
    %0 = tosa.sigmoid %sharding_annotated : (tensor<8x16xf32>) -> tensor<8x16xf32>
    return %0 : tensor<8x16xf32>
  }
  func.func @element_wise_on_graph_output(%arg0: tensor<8x16xf32>) -> tensor<8x16xf32> {
    %0 = tosa.sigmoid %arg0 : (tensor<8x16xf32>) -> tensor<8x16xf32>
    %sharding = shard.sharding @grid_2d split_axes = [[0], [1]] : !shard.sharding
    %sharding_annotated = shard.shard %0 to %sharding annotate_for_users : tensor<8x16xf32>
    return %sharding_annotated : tensor<8x16xf32>
  }
  func.func @element_wise_on_graph_input(%arg0: tensor<8x16xf32>) -> tensor<8x16xf32> {
    %sharding = shard.sharding @grid_2d split_axes = [[0], [1]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<8x16xf32>
    %0 = tosa.sigmoid %sharding_annotated : (tensor<8x16xf32>) -> tensor<8x16xf32>
    return %0 : tensor<8x16xf32>
  }
  func.func @arrow_structure(%arg0: tensor<8x16xf32>, %arg1: tensor<1xf32>, %arg2: tensor<1xf32>) -> (tensor<8x16xf32>, tensor<8x16xf32>) {
    %0 = tosa.tanh %arg0 : (tensor<8x16xf32>) -> tensor<8x16xf32>
    %1 = tosa.abs %0 : (tensor<8x16xf32>) -> tensor<8x16xf32>
    %2 = tosa.negate %0, %arg1, %arg2 : (tensor<8x16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<8x16xf32>
    %sharding = shard.sharding @grid_2d split_axes = [[0], [1]] : !shard.sharding
    %sharding_annotated = shard.shard %2 to %sharding : tensor<8x16xf32>
    return %1, %sharding_annotated : tensor<8x16xf32>, tensor<8x16xf32>
  }
  func.func @matmul_on_def_shard_batch_and_m(%arg0: tensor<2x16x8xf32>, %arg1: tensor<2x8x32xf32>, %arg2: tensor<1xf32>) -> tensor<2x16x32xf32> {
    %0 = tosa.matmul %arg0, %arg1, %arg2, %arg2 : (tensor<2x16x8xf32>, tensor<2x8x32xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<2x16x32xf32>
    %sharding = shard.sharding @grid_2d split_axes = [[0], [1]] : !shard.sharding
    %sharding_annotated = shard.shard %0 to %sharding : tensor<2x16x32xf32>
    return %sharding_annotated : tensor<2x16x32xf32>
  }
  func.func @matmul_on_def_shard_m_and_n(%arg0: tensor<2x16x8xf32>, %arg1: tensor<2x8x32xf32>, %arg2: tensor<1xf32>) -> tensor<2x16x32xf32> {
    %0 = tosa.matmul %arg0, %arg1, %arg2, %arg2 : (tensor<2x16x8xf32>, tensor<2x8x32xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<2x16x32xf32>
    %sharding = shard.sharding @grid_2d split_axes = [[], [0], [1]] : !shard.sharding
    %sharding_annotated = shard.shard %0 to %sharding : tensor<2x16x32xf32>
    return %sharding_annotated : tensor<2x16x32xf32>
  }
  func.func @matmul_on_use_shard_m_and_k(%arg0: tensor<2x16x8xf32>, %arg1: tensor<2x8x32xf32>, %arg2: tensor<1xf32>) -> tensor<2x16x32xf32> {
    %sharding = shard.sharding @grid_2d split_axes = [[], [0], [1]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<2x16x8xf32>
    %0 = tosa.matmul %sharding_annotated, %arg1, %arg2, %arg2 : (tensor<2x16x8xf32>, tensor<2x8x32xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<2x16x32xf32>
    return %0 : tensor<2x16x32xf32>
  }
  func.func @matmul_on_use_shard_m_and_duplicted_k(%arg0: tensor<2x16x8xf32>, %arg1: tensor<2x8x32xf32>, %arg2: tensor<1xf32>) -> tensor<2x16x32xf32> {
    %sharding = shard.sharding @grid_2d split_axes = [[], [1], [0]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding annotate_for_users : tensor<2x16x8xf32>
    %sharding_0 = shard.sharding @grid_2d split_axes = [[], [0]] : !shard.sharding
    %sharding_annotated_1 = shard.shard %arg1 to %sharding_0 annotate_for_users : tensor<2x8x32xf32>
    %0 = tosa.matmul %sharding_annotated, %sharding_annotated_1, %arg2, %arg2 : (tensor<2x16x8xf32>, tensor<2x8x32xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<2x16x32xf32>
    return %0 : tensor<2x16x32xf32>
  }
  func.func @resolve_conflicting_annotations(%arg0: tensor<2x3xf32>, %arg1: tensor<3x2xf32>, %arg2: tensor<2x2xf32>) -> tensor<2x2xf32> {
    %sharding = shard.sharding @grid_2 split_axes = [[0]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<2x3xf32>
    %0 = linalg.matmul ins(%sharding_annotated, %arg1 : tensor<2x3xf32>, tensor<3x2xf32>) outs(%arg2 : tensor<2x2xf32>) -> tensor<2x2xf32>
    %sharding_0 = shard.sharding @grid_2 split_axes = [[]] : !shard.sharding
    %sharding_annotated_1 = shard.shard %0 to %sharding_0 : tensor<2x2xf32>
    return %sharding_annotated_1 : tensor<2x2xf32>
  }
  func.func @mlp_1d_weight_stationary(%arg0: tensor<2x4x8xf32>, %arg1: tensor<2x8x32xf32>, %arg2: tensor<2x32x8xf32>, %arg3: tensor<1xf32>) -> tensor<2x4x8xf32> {
    %sharding = shard.sharding @grid_1d split_axes = [[], [], [0, 1, 2]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<2x4x8xf32>
    %sharding_annotated_0 = shard.shard %arg1 to %sharding : tensor<2x8x32xf32>
    %0 = tosa.matmul %sharding_annotated, %sharding_annotated_0, %arg3, %arg3 : (tensor<2x4x8xf32>, tensor<2x8x32xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<2x4x32xf32>
    %1 = tosa.sigmoid %0 : (tensor<2x4x32xf32>) -> tensor<2x4x32xf32>
    %sharding_1 = shard.sharding @grid_1d split_axes = [[], [0, 1, 2]] : !shard.sharding
    %sharding_annotated_2 = shard.shard %arg2 to %sharding_1 : tensor<2x32x8xf32>
    %2 = tosa.matmul %1, %sharding_annotated_2, %arg3, %arg3 : (tensor<2x4x32xf32>, tensor<2x32x8xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<2x4x8xf32>
    %sharding_3 = shard.sharding @grid_1d split_axes = [[], [], [0, 1, 2]] : !shard.sharding
    %sharding_annotated_4 = shard.shard %2 to %sharding_3 : tensor<2x4x8xf32>
    return %sharding_annotated_4 : tensor<2x4x8xf32>
  }
  func.func @mlp_2d_weight_stationary(%arg0: tensor<2x4x8xf32>, %arg1: tensor<2x8x32xf32>, %arg2: tensor<2x32x8xf32>, %arg3: tensor<1xf32>) -> tensor<2x4x8xf32> {
    %sharding = shard.sharding @grid_3d split_axes = [[], [], [0, 1, 2]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<2x4x8xf32>
    %sharding_0 = shard.sharding @grid_3d split_axes = [[], [0], [1, 2]] : !shard.sharding
    %sharding_annotated_1 = shard.shard %arg1 to %sharding_0 : tensor<2x8x32xf32>
    %0 = tosa.matmul %sharding_annotated, %sharding_annotated_1, %arg3, %arg3 : (tensor<2x4x8xf32>, tensor<2x8x32xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<2x4x32xf32>
    %sharding_annotated_2 = shard.shard %0 to %sharding : tensor<2x4x32xf32>
    %1 = tosa.sigmoid %sharding_annotated_2 : (tensor<2x4x32xf32>) -> tensor<2x4x32xf32>
    %sharding_3 = shard.sharding @grid_3d split_axes = [[], [1, 2], [0]] : !shard.sharding
    %sharding_annotated_4 = shard.shard %arg2 to %sharding_3 : tensor<2x32x8xf32>
    %2 = tosa.matmul %1, %sharding_annotated_4, %arg3, %arg3 : (tensor<2x4x32xf32>, tensor<2x32x8xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<2x4x8xf32>
    %sharding_annotated_5 = shard.shard %2 to %sharding : tensor<2x4x8xf32>
    %sharding_annotated_6 = shard.shard %sharding_annotated_5 to %sharding annotate_for_users : tensor<2x4x8xf32>
    return %sharding_annotated_6 : tensor<2x4x8xf32>
  }
  func.func @elementwise_duplicated_chain(%arg0: tensor<8x16xf32>) -> tensor<8x16xf32> {
    %0 = tosa.sigmoid %arg0 : (tensor<8x16xf32>) -> tensor<8x16xf32>
    %1 = tosa.sigmoid %0 : (tensor<8x16xf32>) -> tensor<8x16xf32>
    %sharding = shard.sharding @grid_2d split_axes = [[]] : !shard.sharding
    %sharding_annotated = shard.shard %1 to %sharding : tensor<8x16xf32>
    return %sharding_annotated : tensor<8x16xf32>
  }
}

