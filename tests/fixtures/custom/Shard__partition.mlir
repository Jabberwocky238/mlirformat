module {
  shard.grid @grid_1d(shape = 2)
  shard.grid @grid_1d_4(shape = 4)
  shard.grid @grid_2d_16(shape = 4x4)
  shard.grid @grid_4d(shape = 2x3x4x5)
  func.func @return_sharding(%arg0: tensor<2xf32>) -> (tensor<2xf32>, !shard.sharding) {
    %sharding = shard.sharding @grid_1d split_axes = [[0]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<2xf32>
    %0 = shard.get_sharding %sharding_annotated : tensor<2xf32> -> !shard.sharding
    %sharding_annotated_0 = shard.shard %sharding_annotated to %sharding annotate_for_users : tensor<2xf32>
    return %sharding_annotated_0, %0 : tensor<2xf32>, !shard.sharding
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
    %sharding_annotated_3 = shard.shard %sharding_annotated_1 to %sharding_2 annotate_for_users : tensor<2xf32>
    return %sharding_annotated_3 : tensor<2xf32>
  }
  func.func @unsplit_last_axes_some(%arg0: tensor<6x48xi8>) -> tensor<6x48xi8> {
    %sharding = shard.sharding @grid_4d split_axes = [[], [0, 1, 2]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<6x48xi8>
    %sharding_0 = shard.sharding @grid_4d split_axes = [[], [0]] : !shard.sharding
    %sharding_annotated_1 = shard.shard %sharding_annotated to %sharding_0 annotate_for_users : tensor<6x48xi8>
    return %sharding_annotated_1 : tensor<6x48xi8>
  }
  func.func @unsplit_last_axes_all(%arg0: tensor<48x48xi8>) -> tensor<48x48xi8> {
    %sharding = shard.sharding @grid_4d split_axes = [[0, 1, 2]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<48x48xi8>
    %sharding_0 = shard.sharding @grid_4d split_axes = [[]] : !shard.sharding
    %sharding_annotated_1 = shard.shard %sharding_annotated to %sharding_0 annotate_for_users : tensor<48x48xi8>
    return %sharding_annotated_1 : tensor<48x48xi8>
  }
  func.func @unsplit_all_dims(%arg0: tensor<6x10x16x15xi8>) -> tensor<6x10x16x15xi8> {
    %sharding = shard.sharding @grid_4d split_axes = [[0], [3], [2], [1]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<6x10x16x15xi8>
    %sharding_0 = shard.sharding @grid_4d split_axes = [[], []] : !shard.sharding
    %sharding_annotated_1 = shard.shard %sharding_annotated to %sharding_0 annotate_for_users : tensor<6x10x16x15xi8>
    return %sharding_annotated_1 : tensor<6x10x16x15xi8>
  }
  func.func @unsplit_some_dims(%arg0: tensor<6x10x16x15xi8>) -> tensor<6x10x16x15xi8> {
    %sharding = shard.sharding @grid_4d split_axes = [[], [3], [2], []] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<6x10x16x15xi8>
    %sharding_0 = shard.sharding @grid_4d split_axes = [[]] : !shard.sharding
    %sharding_annotated_1 = shard.shard %sharding_annotated to %sharding_0 annotate_for_users : tensor<6x10x16x15xi8>
    return %sharding_annotated_1 : tensor<6x10x16x15xi8>
  }
  func.func @move_split_axis(%arg0: tensor<2x2xi8>) -> tensor<2x2xi8> {
    %sharding = shard.sharding @grid_1d split_axes = [[0]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<2x2xi8>
    %sharding_0 = shard.sharding @grid_1d split_axes = [[], [0]] : !shard.sharding
    %sharding_annotated_1 = shard.shard %sharding_annotated to %sharding_0 annotate_for_users : tensor<2x2xi8>
    return %sharding_annotated_1 : tensor<2x2xi8>
  }
  func.func @unsplit_and_split(%arg0: tensor<6x10x120x15xi8>) -> tensor<6x10x120x15xi8> {
    %sharding = shard.sharding @grid_4d split_axes = [[0], [], [1, 2]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<6x10x120x15xi8>
    %sharding_0 = shard.sharding @grid_4d split_axes = [[], [], [1, 2, 3]] : !shard.sharding
    %sharding_annotated_1 = shard.shard %sharding_annotated to %sharding_0 annotate_for_users : tensor<6x10x120x15xi8>
    return %sharding_annotated_1 : tensor<6x10x120x15xi8>
  }
  func.func @move_and_split(%arg0: tensor<6x10x120x15xi8>) -> tensor<6x10x120x15xi8> {
    %sharding = shard.sharding @grid_4d split_axes = [[0], [], [1, 2]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<6x10x120x15xi8>
    %sharding_0 = shard.sharding @grid_4d split_axes = [[], [0], [1, 2, 3]] : !shard.sharding
    %sharding_annotated_1 = shard.shard %sharding_annotated to %sharding_0 annotate_for_users : tensor<6x10x120x15xi8>
    return %sharding_annotated_1 : tensor<6x10x120x15xi8>
  }
  func.func @move_and_unsplit(%arg0: tensor<6x10x120x15xi8>) -> tensor<6x10x120x15xi8> {
    %sharding = shard.sharding @grid_4d split_axes = [[0], [], [1, 2]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<6x10x120x15xi8>
    %sharding_0 = shard.sharding @grid_4d split_axes = [[], [0], [1]] : !shard.sharding
    %sharding_annotated_1 = shard.shard %sharding_annotated to %sharding_0 annotate_for_users : tensor<6x10x120x15xi8>
    return %sharding_annotated_1 : tensor<6x10x120x15xi8>
  }
  func.func @unsplit_move_split(%arg0: tensor<6x20x120x15xi8>) -> tensor<6x20x120x15xi8> {
    %sharding = shard.sharding @grid_4d split_axes = [[0], [2], [], [3]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<6x20x120x15xi8>
    %sharding_0 = shard.sharding @grid_4d split_axes = [[], [], [2], [3, 1]] : !shard.sharding
    %sharding_annotated_1 = shard.shard %sharding_annotated to %sharding_0 annotate_for_users : tensor<6x20x120x15xi8>
    return %sharding_annotated_1 : tensor<6x20x120x15xi8>
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
    %sharding_annotated_2 = shard.shard %sharding_annotated_1 to %sharding_0 annotate_for_users : tensor<8x16xf32>
    return %sharding_annotated_2 : tensor<8x16xf32>
  }
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
    %sharding_annotated_1 = shard.shard %sharding_annotated_0 to %sharding annotate_for_users : tensor<6xi32>
    %sharding_annotated_2 = shard.shard %sharding_annotated to %sharding annotate_for_users : tensor<6x6xi32>
    %reduced = linalg.reduce ins(%sharding_annotated_2 : tensor<6x6xi32>) outs(%sharding_annotated_1 : tensor<6xi32>) dimensions = [1] 
      (%in: i32, %init: i32) {
        %1 = arith.addi %in, %init : i32
        linalg.yield %1 : i32
      }
    %sharding_annotated_3 = shard.shard %reduced to %sharding : tensor<6xi32>
    %sharding_annotated_4 = shard.shard %sharding_annotated_3 to %sharding annotate_for_users : tensor<6xi32>
    return %sharding_annotated_4 : tensor<6xi32>
  }
  func.func @mlp_1d_weight_stationary(%arg0: tensor<512x2048xf32>, %arg1: tensor<2048x1024xf32>, %arg2: tensor<1024x2048xf32>) -> tensor<512x2048xf32> attributes {llvm.emit_c_interface} {
    %sharding = shard.sharding @grid_1d_4 split_axes = [[], [0]] : !shard.sharding
    %sharding_0 = shard.sharding @grid_1d_4 split_axes = [[0], []] : !shard.sharding
    %sharding_1 = shard.sharding @grid_1d_4 split_axes = [[]] : !shard.sharding
    %sharding_2 = shard.sharding @grid_1d_4 split_axes = [[], [0]] : !shard.sharding
    %sharding_3 = shard.sharding @grid_1d_4 split_axes = [[], [0]] : !shard.sharding
    %sharding_4 = shard.sharding @grid_1d_4 split_axes = [[0], []] : !shard.sharding
    %sharding_5 = shard.sharding @grid_1d_4 split_axes = [[]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding_2 : tensor<512x2048xf32>
    %sharding_annotated_6 = shard.shard %arg1 to %sharding_3 : tensor<2048x1024xf32>
    %sharding_annotated_7 = shard.shard %arg2 to %sharding_4 : tensor<1024x2048xf32>
    %0 = tensor.empty() : tensor<512x1024xf32>
    %sharding_annotated_8 = shard.shard %0 to %sharding : tensor<512x1024xf32>
    %cst = arith.constant 0.000000e+00 : f32
    %sharding_annotated_9 = shard.shard %sharding_annotated_8 to %sharding annotate_for_users : tensor<512x1024xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%sharding_annotated_9 : tensor<512x1024xf32>) -> tensor<512x1024xf32>
    %sharding_annotated_10 = shard.shard %1 to %sharding : tensor<512x1024xf32>
    %sharding_annotated_11 = shard.shard %sharding_annotated to %sharding_1 annotate_for_users : tensor<512x2048xf32>
    %sharding_annotated_12 = shard.shard %sharding_annotated_6 to %sharding annotate_for_users : tensor<2048x1024xf32>
    %sharding_annotated_13 = shard.shard %sharding_annotated_10 to %sharding annotate_for_users : tensor<512x1024xf32>
    %2 = linalg.matmul ins(%sharding_annotated_11, %sharding_annotated_12 : tensor<512x2048xf32>, tensor<2048x1024xf32>) outs(%sharding_annotated_13 : tensor<512x1024xf32>) -> tensor<512x1024xf32>
    %sharding_annotated_14 = shard.shard %2 to %sharding : tensor<512x1024xf32>
    %sharding_annotated_15 = shard.shard %sharding_annotated_14 to %sharding annotate_for_users : tensor<512x1024xf32>
    %3 = tosa.sigmoid %sharding_annotated_15 : (tensor<512x1024xf32>) -> tensor<512x1024xf32>
    %sharding_annotated_16 = shard.shard %3 to %sharding : tensor<512x1024xf32>
    %4 = tensor.empty() : tensor<512x2048xf32>
    %sharding_annotated_17 = shard.shard %4 to %sharding_1 : tensor<512x2048xf32>
    %sharding_annotated_18 = shard.shard %sharding_annotated_17 to %sharding_1 annotate_for_users : tensor<512x2048xf32>
    %5 = linalg.fill ins(%cst : f32) outs(%sharding_annotated_18 : tensor<512x2048xf32>) -> tensor<512x2048xf32>
    %sharding_annotated_19 = shard.shard %5 to %sharding_1 : tensor<512x2048xf32>
    %sharding_annotated_20 = shard.shard %sharding_annotated_16 to %sharding annotate_for_users : tensor<512x1024xf32>
    %sharding_annotated_21 = shard.shard %sharding_annotated_7 to %sharding_0 annotate_for_users : tensor<1024x2048xf32>
    %sharding_annotated_22 = shard.shard %sharding_annotated_19 to %sharding_1 annotate_for_users : tensor<512x2048xf32>
    %6 = linalg.matmul ins(%sharding_annotated_20, %sharding_annotated_21 : tensor<512x1024xf32>, tensor<1024x2048xf32>) outs(%sharding_annotated_22 : tensor<512x2048xf32>) -> tensor<512x2048xf32>
    %sharding_annotated_23 = shard.shard %6 to %sharding_1 : tensor<512x2048xf32>
    %sharding_annotated_24 = shard.shard %sharding_annotated_23 to %sharding_5 annotate_for_users : tensor<512x2048xf32>
    return %sharding_annotated_24 : tensor<512x2048xf32>
  }
}

