module {
  shard.grid @grid_2(shape = 2)
  func.func @matmul_shard_prallel_axis(%arg0: tensor<2x3xf32>, %arg1: tensor<3x2xf32>, %arg2: tensor<2x2xf32>) -> tensor<2x2xf32> {
    %sharding = shard.sharding @grid_2 split_axes = [[0]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<2x3xf32>
    %0 = linalg.matmul ins(%sharding_annotated, %arg1 : tensor<2x3xf32>, tensor<3x2xf32>) outs(%arg2 : tensor<2x2xf32>) -> tensor<2x2xf32>
    %sharding_0 = shard.sharding @grid_2 split_axes = [[]] : !shard.sharding
    %sharding_annotated_1 = shard.shard %0 to %sharding_0 annotate_for_users : tensor<2x2xf32>
    return %sharding_annotated_1 : tensor<2x2xf32>
  }
}

