module {
  shard.grid @grid(shape = 4)
  func.func @test_alloc_tensor_op(%arg0: tensor<?x8xf32>, %arg1: index) {
    %sharding = shard.sharding @grid split_axes = [[], [0]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<?x8xf32>
    %0 = bufferization.alloc_tensor(%arg1) : tensor<?x8xf32>
    %sharding_annotated_0 = shard.shard %0 to %sharding : tensor<?x8xf32>
    %sharding_annotated_1 = shard.shard %sharding_annotated to %sharding annotate_for_users : tensor<?x8xf32>
    %1 = bufferization.alloc_tensor() copy(%sharding_annotated_1) {escape = true} : tensor<?x8xf32>
    %sharding_annotated_2 = shard.shard %1 to %sharding : tensor<?x8xf32>
    return
  }
  func.func @test_dealloc_tensor_op(%arg0: tensor<4xi32>) {
    %sharding = shard.sharding @grid split_axes = [[0]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<4xi32>
    %sharding_annotated_0 = shard.shard %sharding_annotated to %sharding annotate_for_users : tensor<4xi32>
    bufferization.dealloc_tensor %sharding_annotated_0 : tensor<4xi32>
    return
  }
  func.func @test_materialize_in_destination_op(%arg0: tensor<?xf32>, %arg1: tensor<?xf32>, %arg2: tensor<8xf32>) -> tensor<8xf32> {
    %sharding = shard.sharding @grid split_axes = [[0]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<?xf32>
    %sharding_annotated_0 = shard.shard %arg1 to %sharding : tensor<?xf32>
    %sharding_annotated_1 = shard.shard %arg2 to %sharding : tensor<8xf32>
    %sharding_annotated_2 = shard.shard %sharding_annotated to %sharding annotate_for_users : tensor<?xf32>
    %sharding_annotated_3 = shard.shard %sharding_annotated_0 to %sharding annotate_for_users : tensor<?xf32>
    %0 = bufferization.materialize_in_destination %sharding_annotated_2 in %sharding_annotated_3 : (tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
    %sharding_annotated_4 = shard.shard %0 to %sharding : tensor<?xf32>
    %sharding_annotated_5 = shard.shard %sharding_annotated to %sharding annotate_for_users : tensor<?xf32>
    %sharding_annotated_6 = shard.shard %sharding_annotated_1 to %sharding annotate_for_users : tensor<8xf32>
    %1 = bufferization.materialize_in_destination %sharding_annotated_5 in %sharding_annotated_6 : (tensor<?xf32>, tensor<8xf32>) -> tensor<8xf32>
    %sharding_annotated_7 = shard.shard %1 to %sharding : tensor<8xf32>
    %sharding_annotated_8 = shard.shard %sharding_annotated_7 to %sharding annotate_for_users : tensor<8xf32>
    return %sharding_annotated_8 : tensor<8xf32>
  }
}

