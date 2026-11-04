module {
  shard.grid @grid0(shape = 2x4)
  func.func @all_reduce_empty_grid_axes(%arg0: tensor<4xf32>) -> tensor<4xf32> {
    %all_reduce = shard.all_reduce %arg0 on @grid0 : tensor<4xf32> -> tensor<4xf32>
    return %all_reduce : tensor<4xf32>
  }
  func.func @all_reduce_empty_grid_axes_different_return_type(%arg0: tensor<4xf32>) -> tensor<4xf64> {
    %all_reduce = shard.all_reduce %arg0 on @grid0 : tensor<4xf32> -> tensor<4xf64>
    return %all_reduce : tensor<4xf64>
  }
  func.func @all_reduce_default_reduction(%arg0: tensor<4xf32>) -> tensor<4xf64> {
    %all_reduce = shard.all_reduce %arg0 on @grid0 grid_axes = [0] : tensor<4xf32> -> tensor<4xf64>
    return %all_reduce : tensor<4xf64>
  }
  func.func @all_to_all_empty_grid_axes(%arg0: tensor<8xf32>) -> tensor<8xf32> {
    %all_to_all = shard.all_to_all %arg0 on @grid0 split_axis = 0 concat_axis = 0 : tensor<8xf32> -> tensor<8xf32>
    return %all_to_all : tensor<8xf32>
  }
  func.func @all_gather_empty_grid_axes(%arg0: tensor<4xf32>) -> tensor<4xf32> {
    %all_gather = shard.all_gather %arg0 on @grid0 gather_axis = 0 : tensor<4xf32> -> tensor<4xf32>
    return %all_gather : tensor<4xf32>
  }
  func.func @all_slice_empty_grid_axes(%arg0: tensor<4xf32>) -> tensor<4xf32> {
    %all_slice = shard.all_slice %arg0 on @grid0 slice_axis = 0 : tensor<4xf32> -> tensor<4xf32>
    return %all_slice : tensor<4xf32>
  }
  func.func @broadcast_empty_grid_axes(%arg0: tensor<4xf32>) -> tensor<4xf32> {
    %broadcast = shard.broadcast %arg0 on @grid0 root = [] : (tensor<4xf32>) -> tensor<4xf32>
    return %broadcast : tensor<4xf32>
  }
  func.func @gather_empty_grid_axes(%arg0: tensor<4xf32>) -> tensor<4xf32> {
    %gather = shard.gather %arg0 on @grid0 gather_axis = 0 root = [] : (tensor<4xf32>) -> tensor<4xf32>
    return %gather : tensor<4xf32>
  }
  func.func @receive_empty_grid_axes(%arg0: tensor<4xf32>) -> tensor<4xf32> {
    %recv = shard.recv %arg0 on @grid0 : (tensor<4xf32>) -> tensor<4xf32>
    return %recv : tensor<4xf32>
  }
  func.func @reduce_empty_grid_axes(%arg0: tensor<4xf32>) -> tensor<4xf32> {
    %reduce = shard.reduce %arg0 on @grid0 root = [] : (tensor<4xf32>) -> tensor<4xf32>
    return %reduce : tensor<4xf32>
  }
  func.func @reduce_scatter_empty_grid_axes(%arg0: tensor<4xf32>) -> tensor<4xf32> {
    %reduce_scatter = shard.reduce_scatter %arg0 on @grid0 scatter_axis = 0 : tensor<4xf32> -> tensor<4xf32>
    return %reduce_scatter : tensor<4xf32>
  }
  func.func @reduce_scatter_empty_grid_axes_different_return_type(%arg0: tensor<4xf32>) -> tensor<4xf64> {
    %reduce_scatter = shard.reduce_scatter %arg0 on @grid0 scatter_axis = 0 : tensor<4xf32> -> tensor<4xf64>
    return %reduce_scatter : tensor<4xf64>
  }
  func.func @reduce_scatter_default_reduction(%arg0: tensor<4xf32>) -> tensor<2xf64> {
    %reduce_scatter = shard.reduce_scatter %arg0 on @grid0 grid_axes = [0] scatter_axis = 0 : tensor<4xf32> -> tensor<2xf64>
    return %reduce_scatter : tensor<2xf64>
  }
  func.func @scatter_empty_grid_axes(%arg0: tensor<4xf32>) -> tensor<4xf32> {
    %scatter = shard.scatter %arg0 on @grid0 scatter_axis = 0 root = [] : (tensor<4xf32>) -> tensor<4xf32>
    return %scatter : tensor<4xf32>
  }
  func.func @send_empty_grid_axes(%arg0: tensor<4xf32>) -> tensor<4xf32> {
    %send = shard.send %arg0 on @grid0 destination = [] : (tensor<4xf32>) -> tensor<4xf32>
    return %send : tensor<4xf32>
  }
  shard.grid @grid4x4(shape = 4x4)
  func.func @test_halo_sizes() -> !shard.sharding {
    %c2_i64 = arith.constant 2 : i64
    %sharding = shard.sharding @grid4x4 split_axes = [[0], [1]] halo_sizes = [1, %c2_i64, %c2_i64, 22] : !shard.sharding
    return %sharding : !shard.sharding
  }
  func.func @test_shard_offs() -> !shard.sharding {
    %c2_i64 = arith.constant 2 : i64
    %sharding = shard.sharding @grid4x4 split_axes = [[0], [1]] sharded_dims_offsets = [0, 1, %c2_i64, 3, 4, 0, %c2_i64, 3, 4, 22] : !shard.sharding
    return %sharding : !shard.sharding
  }
  func.func @test_duplicate_shardops() -> (tensor<1024x1024xf32>, tensor<1024x1024xf32>) attributes {llvm.emit_c_interface} {
    %cst = arith.constant dense<0.000000e+00> : tensor<1024x1024xf32>
    %sharding = shard.sharding @grid4x4 split_axes = [[0, 1]] : !shard.sharding
    %cst_0 = arith.constant dense<0.000000e+00> : tensor<1024x1024xf32>
    %sharding_1 = shard.sharding @grid4x4 split_axes = [[0, 1]] : !shard.sharding
    %sharding_annotated = shard.shard %cst_0 to %sharding_1 : tensor<1024x1024xf32>
    %cst_2 = arith.constant dense<0.000000e+00> : tensor<1024x1024xf32>
    %sharding_3 = shard.sharding @grid4x4 split_axes = [[0, 1]] : !shard.sharding
    %sharding_annotated_4 = shard.shard %cst_2 to %sharding_3 : tensor<1024x1024xf32>
    %sharding_annotated_5 = shard.shard %cst to %sharding : tensor<1024x1024xf32>
    return %sharding_annotated_5, %sharding_annotated : tensor<1024x1024xf32>, tensor<1024x1024xf32>
  }
  func.func @test_duplicate_shardops_diff() -> (tensor<1024x1024xf32>, tensor<1024x1024xf32>) attributes {llvm.emit_c_interface} {
    %cst = arith.constant dense<0.000000e+00> : tensor<1024x1024xf32>
    %sharding = shard.sharding @grid4x4 split_axes = [[0]] : !shard.sharding
    %cst_0 = arith.constant dense<0.000000e+00> : tensor<1024x1024xf32>
    %sharding_1 = shard.sharding @grid4x4 split_axes = [[0, 1]] : !shard.sharding
    %sharding_annotated = shard.shard %cst_0 to %sharding_1 : tensor<1024x1024xf32>
    %cst_2 = arith.constant dense<0.000000e+00> : tensor<1024x1024xf32>
    %sharding_3 = shard.sharding @grid4x4 split_axes = [[0]] : !shard.sharding
    %sharding_annotated_4 = shard.shard %cst_2 to %sharding_3 : tensor<1024x1024xf32>
    %sharding_annotated_5 = shard.shard %cst to %sharding : tensor<1024x1024xf32>
    return %sharding_annotated_5, %sharding_annotated : tensor<1024x1024xf32>, tensor<1024x1024xf32>
  }
}

