module {
  shard.grid @grid_1d(shape = 2)
  func.func @return_sharding(%arg0: tensor<2xf32>) -> (tensor<2xf32>, !shard.sharding) {
    %sharding = shard.sharding @grid_1d split_axes = [[0]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<2xf32>
    %0 = shard.get_sharding %sharding_annotated : tensor<2xf32> -> !shard.sharding
    return %sharding_annotated, %0 : tensor<2xf32>, !shard.sharding
  }
  func.func @full_replication(%arg0: tensor<2xi8>) -> tensor<2xi8> {
    %sharding = shard.sharding @grid_1d split_axes = [[]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<2xi8>
    %sharding_0 = shard.sharding @grid_1d split_axes = [[]] : !shard.sharding
    %sharding_annotated_1 = shard.shard %sharding_annotated to %sharding_0 annotate_for_users : tensor<2xi8>
    return %sharding_annotated_1 : tensor<2xi8>
  }
  func.func @sharding_triplet(%arg0: tensor<2xf32>) -> tensor<2xf32> {
    %sharding = shard.sharding @grid_1d split_axes = [[0]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<2xf32>
    %sharding_0 = shard.sharding @grid_1d split_axes = [[0]] : !shard.sharding
    %sharding_annotated_1 = shard.shard %sharding_annotated to %sharding_0 annotate_for_users : tensor<2xf32>
    %sharding_2 = shard.sharding @grid_1d split_axes = [[]] : !shard.sharding
    %sharding_annotated_3 = shard.shard %sharding_annotated_1 to %sharding_2 : tensor<2xf32>
    return %sharding_annotated_3 : tensor<2xf32>
  }
  func.func @move_split_axis(%arg0: tensor<2x2xi8>) -> tensor<2x2xi8> {
    %sharding = shard.sharding @grid_1d split_axes = [[0]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<2x2xi8>
    %sharding_0 = shard.sharding @grid_1d split_axes = [[], [0]] : !shard.sharding
    %sharding_annotated_1 = shard.shard %sharding_annotated to %sharding_0 annotate_for_users : tensor<2x2xi8>
    return %sharding_annotated_1 : tensor<2x2xi8>
  }
  func.func @non_tensor_value(%arg0: i8) -> i8 {
    %0 = arith.addi %arg0, %arg0 : i8
    return %0 : i8
  }
  func.func @unary_elementwise(%arg0: tensor<2xi8>) -> tensor<2xi8> {
    %sharding = shard.sharding @grid_1d split_axes = [[0]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<2xi8>
    %sharding_0 = shard.sharding @grid_1d split_axes = [[0]] : !shard.sharding
    %sharding_annotated_1 = shard.shard %sharding_annotated to %sharding_0 annotate_for_users : tensor<2xi8>
    %0 = tosa.abs %sharding_annotated_1 : (tensor<2xi8>) -> tensor<2xi8>
    %sharding_2 = shard.sharding @grid_1d split_axes = [[0]] : !shard.sharding
    %sharding_annotated_3 = shard.shard %0 to %sharding_2 : tensor<2xi8>
    %sharding_4 = shard.sharding @grid_1d split_axes = [[0]] : !shard.sharding
    %sharding_annotated_5 = shard.shard %sharding_annotated_3 to %sharding_4 annotate_for_users : tensor<2xi8>
    return %sharding_annotated_5 : tensor<2xi8>
  }
  func.func @unary_elementwise_with_resharding(%arg0: tensor<2xi8>) -> tensor<2xi8> {
    %sharding = shard.sharding @grid_1d split_axes = [[]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<2xi8>
    %sharding_0 = shard.sharding @grid_1d split_axes = [[0]] : !shard.sharding
    %sharding_annotated_1 = shard.shard %sharding_annotated to %sharding_0 annotate_for_users : tensor<2xi8>
    %0 = tosa.abs %sharding_annotated_1 : (tensor<2xi8>) -> tensor<2xi8>
    %sharding_2 = shard.sharding @grid_1d split_axes = [[0]] : !shard.sharding
    %sharding_annotated_3 = shard.shard %0 to %sharding_2 : tensor<2xi8>
    %sharding_4 = shard.sharding @grid_1d split_axes = [[]] : !shard.sharding
    %sharding_annotated_5 = shard.shard %sharding_annotated_3 to %sharding_4 annotate_for_users : tensor<2xi8>
    return %sharding_annotated_5 : tensor<2xi8>
  }
  func.func @binary_elementwise(%arg0: tensor<2xi8>, %arg1: tensor<2xi8>) -> tensor<2xi8> {
    %sharding = shard.sharding @grid_1d split_axes = [[0]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<2xi8>
    %sharding_0 = shard.sharding @grid_1d split_axes = [[0]] : !shard.sharding
    %sharding_annotated_1 = shard.shard %sharding_annotated to %sharding_0 annotate_for_users : tensor<2xi8>
    %sharding_2 = shard.sharding @grid_1d split_axes = [[0]] : !shard.sharding
    %sharding_annotated_3 = shard.shard %arg1 to %sharding_2 : tensor<2xi8>
    %sharding_4 = shard.sharding @grid_1d split_axes = [[0]] : !shard.sharding
    %sharding_annotated_5 = shard.shard %sharding_annotated_3 to %sharding_4 annotate_for_users : tensor<2xi8>
    %0 = tosa.add %sharding_annotated_1, %sharding_annotated_5 : (tensor<2xi8>, tensor<2xi8>) -> tensor<2xi8>
    %sharding_6 = shard.sharding @grid_1d split_axes = [[0]] : !shard.sharding
    %sharding_annotated_7 = shard.shard %0 to %sharding_6 : tensor<2xi8>
    %sharding_8 = shard.sharding @grid_1d split_axes = [[0]] : !shard.sharding
    %sharding_annotated_9 = shard.shard %sharding_annotated_7 to %sharding_8 annotate_for_users : tensor<2xi8>
    return %sharding_annotated_9 : tensor<2xi8>
  }
  func.func @multiple_chained_ops(%arg0: tensor<2xi8>) -> tensor<2xi8> {
    %sharding = shard.sharding @grid_1d split_axes = [[]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<2xi8>
    %sharding_0 = shard.sharding @grid_1d split_axes = [[0]] : !shard.sharding
    %sharding_annotated_1 = shard.shard %sharding_annotated to %sharding_0 annotate_for_users : tensor<2xi8>
    %0 = tosa.abs %sharding_annotated_1 : (tensor<2xi8>) -> tensor<2xi8>
    %sharding_2 = shard.sharding @grid_1d split_axes = [[0]] : !shard.sharding
    %sharding_annotated_3 = shard.shard %0 to %sharding_2 : tensor<2xi8>
    %sharding_4 = shard.sharding @grid_1d split_axes = [[]] : !shard.sharding
    %sharding_annotated_5 = shard.shard %sharding_annotated_3 to %sharding_4 annotate_for_users : tensor<2xi8>
    %1 = tosa.abs %sharding_annotated_5 : (tensor<2xi8>) -> tensor<2xi8>
    %sharding_6 = shard.sharding @grid_1d split_axes = [[]] : !shard.sharding
    %sharding_annotated_7 = shard.shard %1 to %sharding_6 : tensor<2xi8>
    %sharding_8 = shard.sharding @grid_1d split_axes = [[0]] : !shard.sharding
    %sharding_annotated_9 = shard.shard %sharding_annotated_7 to %sharding_8 annotate_for_users : tensor<2xi8>
    return %sharding_annotated_9 : tensor<2xi8>
  }
  func.func @incomplete_sharding(%arg0: tensor<8x16xf32>) -> tensor<8x16xf32> {
    %sharding = shard.sharding @grid_1d split_axes = [[0]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding annotate_for_users : tensor<8x16xf32>
    %0 = tosa.sigmoid %sharding_annotated : (tensor<8x16xf32>) -> tensor<8x16xf32>
    %sharding_0 = shard.sharding @grid_1d split_axes = [[0]] : !shard.sharding
    %sharding_annotated_1 = shard.shard %0 to %sharding_0 : tensor<8x16xf32>
    return %sharding_annotated_1 : tensor<8x16xf32>
  }
  shard.grid @grid_1d_4(shape = 4)
  func.func @ew_chain_with_halo(%arg0: tensor<8x16xf32>, %arg1: tensor<1xf32>, %arg2: tensor<1xf32>) -> tensor<8x16xf32> {
    %sharding = shard.sharding @grid_1d_4 split_axes = [[0]] halo_sizes = [2, 1] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding annotate_for_users : tensor<8x16xf32>
    %0 = tosa.tanh %sharding_annotated : (tensor<8x16xf32>) -> tensor<8x16xf32>
    %sharding_0 = shard.sharding @grid_1d_4 split_axes = [[0]] halo_sizes = [2, 1] : !shard.sharding
    %sharding_annotated_1 = shard.shard %0 to %sharding_0 : tensor<8x16xf32>
    %sharding_2 = shard.sharding @grid_1d_4 split_axes = [[0]] halo_sizes = [2, 1] : !shard.sharding
    %sharding_annotated_3 = shard.shard %sharding_annotated_1 to %sharding_2 annotate_for_users : tensor<8x16xf32>
    %1 = tosa.abs %sharding_annotated_3 : (tensor<8x16xf32>) -> tensor<8x16xf32>
    %sharding_4 = shard.sharding @grid_1d_4 split_axes = [[0]] halo_sizes = [2, 1] : !shard.sharding
    %sharding_annotated_5 = shard.shard %1 to %sharding_4 : tensor<8x16xf32>
    %sharding_6 = shard.sharding @grid_1d_4 split_axes = [[0]] halo_sizes = [2, 1] : !shard.sharding
    %sharding_annotated_7 = shard.shard %sharding_annotated_5 to %sharding_6 annotate_for_users : tensor<8x16xf32>
    %sharding_8 = shard.sharding @grid_1d_4 split_axes = [[]] : !shard.sharding
    %sharding_annotated_9 = shard.shard %arg1 to %sharding_8 annotate_for_users : tensor<1xf32>
    %sharding_annotated_10 = shard.shard %arg2 to %sharding_8 annotate_for_users : tensor<1xf32>
    %2 = tosa.negate %sharding_annotated_7, %sharding_annotated_9, %sharding_annotated_10 : (tensor<8x16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<8x16xf32>
    %sharding_11 = shard.sharding @grid_1d_4 split_axes = [[0]] halo_sizes = [2, 1] : !shard.sharding
    %sharding_annotated_12 = shard.shard %2 to %sharding_11 : tensor<8x16xf32>
    %sharding_13 = shard.sharding @grid_1d_4 split_axes = [[0]] halo_sizes = [2, 1] : !shard.sharding
    %sharding_annotated_14 = shard.shard %sharding_annotated_12 to %sharding_13 annotate_for_users : tensor<8x16xf32>
    return %sharding_annotated_14 : tensor<8x16xf32>
  }
  func.func @test_shard_update_halo(%arg0: tensor<1200x1200xi64>) -> tensor<1200x1200xi64> {
    %sharding = shard.sharding @grid_1d_4 split_axes = [[0]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<1200x1200xi64>
    %sharding_0 = shard.sharding @grid_1d_4 split_axes = [[0]] halo_sizes = [2, 2] : !shard.sharding
    %sharding_annotated_1 = shard.shard %sharding_annotated to %sharding_0 : tensor<1200x1200xi64>
    %sharding_annotated_2 = shard.shard %sharding_annotated_1 to %sharding_0 annotate_for_users : tensor<1200x1200xi64>
    return %sharding_annotated_2 : tensor<1200x1200xi64>
  }
  shard.grid @grid4x4(shape = 4x4)
  func.func @test_shard_update_halo2d(%arg0: tensor<1200x1200xi64>) -> tensor<1200x1200xi64> {
    %sharding = shard.sharding @grid4x4 split_axes = [[0], [1]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<1200x1200xi64>
    %sharding_0 = shard.sharding @grid4x4 split_axes = [[0], [1]] halo_sizes = [1, 2, 3, 4] : !shard.sharding
    %sharding_annotated_1 = shard.shard %sharding_annotated to %sharding_0 : tensor<1200x1200xi64>
    %sharding_annotated_2 = shard.shard %sharding_annotated_1 to %sharding_0 annotate_for_users : tensor<1200x1200xi64>
    return %sharding_annotated_2 : tensor<1200x1200xi64>
  }
  shard.grid @grid(shape = 2)
  func.func @test_reduce_0d(%arg0: tensor<6x6xi32>) -> tensor<i32> {
    %sharding = shard.sharding @grid split_axes = [[0]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding annotate_for_users : tensor<6x6xi32>
    %0 = tensor.empty() : tensor<i32>
    %sharding_0 = shard.sharding @grid split_axes = [[]] : !shard.sharding
    %sharding_annotated_1 = shard.shard %0 to %sharding_0 : tensor<i32>
    %sharding_annotated_2 = shard.shard %sharding_annotated to %sharding annotate_for_users : tensor<6x6xi32>
    %reduced = linalg.reduce ins(%sharding_annotated_2 : tensor<6x6xi32>) outs(%sharding_annotated_1 : tensor<i32>) dimensions = [0, 1] 
      (%in: i32, %init: i32) {
        %1 = arith.addi %in, %init : i32
        linalg.yield %1 : i32
      }
    %sharding_annotated_3 = shard.shard %reduced to %sharding_0 : tensor<i32>
    %sharding_annotated_4 = shard.shard %sharding_annotated_3 to %sharding_0 annotate_for_users : tensor<i32>
    return %sharding_annotated_4 : tensor<i32>
  }
  func.func @test_reduce_1d(%arg0: tensor<6x6xi32>) -> tensor<6xi32> {
    %sharding = shard.sharding @grid split_axes = [[0]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding annotate_for_users : tensor<6x6xi32>
    %0 = tensor.empty() : tensor<6xi32>
    %sharding_annotated_0 = shard.shard %0 to %sharding : tensor<6xi32>
    %sharding_annotated_1 = shard.shard %sharding_annotated to %sharding annotate_for_users : tensor<6x6xi32>
    %reduced = linalg.reduce ins(%sharding_annotated_1 : tensor<6x6xi32>) outs(%sharding_annotated_0 : tensor<6xi32>) dimensions = [1] 
      (%in: i32, %init: i32) {
        %1 = arith.addi %in, %init : i32
        linalg.yield %1 : i32
      }
    %sharding_annotated_2 = shard.shard %reduced to %sharding : tensor<6xi32>
    %sharding_annotated_3 = shard.shard %sharding_annotated_2 to %sharding annotate_for_users : tensor<6xi32>
    return %sharding_annotated_3 : tensor<6xi32>
  }
}

