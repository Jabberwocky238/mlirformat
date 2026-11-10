module {
  shard.grid @grid0(shape = 2x2x4)
  shard.grid @grid1(shape = 4x?)
  shard.grid @grid2(shape = ?x4)
  shard.grid @grid3(shape = ?x?)
  shard.grid @grid4(shape = 3)
  shard.grid @grid5(shape = ?)
  func.func @grid_shard_op_fully_replicated(%arg0: tensor<4x8xf32>) -> tensor<4x8xf32> {
    %sharding = shard.sharding @grid0 split_axes = [[]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<4x8xf32>
    return %sharding_annotated : tensor<4x8xf32>
  }
  func.func @grid_shard_op_1st_dim(%arg0: tensor<4x8xf32>) -> tensor<4x8xf32> {
    %sharding = shard.sharding @grid0 split_axes = [[0]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<4x8xf32>
    return %sharding_annotated : tensor<4x8xf32>
  }
  func.func @grid_shard_op_2nd_dim(%arg0: tensor<4x8xf32>) -> tensor<4x8xf32> {
    %sharding = shard.sharding @grid1 split_axes = [[], [0]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<4x8xf32>
    return %sharding_annotated : tensor<4x8xf32>
  }
  func.func @grid_shard_op_1st_and_3rd_dim(%arg0: tensor<4x8x16xf32>) -> tensor<4x8x16xf32> {
    %sharding = shard.sharding @grid3 split_axes = [[0], [], [1]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<4x8x16xf32>
    return %sharding_annotated : tensor<4x8x16xf32>
  }
  func.func @grid_shard_op_two_users(%arg0: tensor<4x8xf32>) -> (tensor<4x8xf32>, tensor<4x8xf32>) {
    %sharding = shard.sharding @grid0 split_axes = [[0]] : !shard.sharding
    %sharding_annotated = shard.shard %arg0 to %sharding : tensor<4x8xf32>
    %sharding_0 = shard.sharding @grid0 split_axes = [[1]] : !shard.sharding
    %sharding_annotated_1 = shard.shard %sharding_annotated to %sharding_0 annotate_for_users : tensor<4x8xf32>
    %sharding_2 = shard.sharding @grid0 split_axes = [[2]] : !shard.sharding
    %sharding_annotated_3 = shard.shard %sharding_annotated to %sharding_2 annotate_for_users : tensor<4x8xf32>
    return %sharding_annotated_1, %sharding_annotated_3 : tensor<4x8xf32>, tensor<4x8xf32>
  }
  func.func @grid_shard_halo_sizes() {
    %c3_i64 = arith.constant 3 : i64
    %sharding = shard.sharding @grid4 split_axes = [[0]] halo_sizes = [1, 4] : !shard.sharding
    %sharding_0 = shard.sharding @grid4 split_axes = [[0]] halo_sizes = [4, %c3_i64] : !shard.sharding
    return
  }
  func.func @grid_shard_dims_sizes() {
    %c3_i64 = arith.constant 3 : i64
    %sharding = shard.sharding @grid4 split_axes = [[0]] sharded_dims_offsets = [0, 1, 4, 6] : !shard.sharding
    %sharding_0 = shard.sharding @grid4 split_axes = [[0]] sharded_dims_offsets = [0, 2, %c3_i64, 5] : !shard.sharding
    return
  }
  func.func @grid_shard_shape() {
    %c3 = arith.constant 3 : index
    %sharding = shard.sharding @grid0 split_axes = [[]] : !shard.sharding
    %shard_shape:2 = shard.shard_shape dims = [8, %c3] sharding = %sharding device = [%c3] : index, index
    %shard_shape_0:2 = shard.shard_shape dims = [8, 4] sharding = %sharding device = [3] : index, index
    return
  }
  func.func @grid_get_sharding(%arg0: tensor<4x8xf32>) -> !shard.sharding {
    %0 = shard.get_sharding %arg0 : tensor<4x8xf32> -> !shard.sharding
    return %0 : !shard.sharding
  }
  func.func @grid_shape() -> (index, index) {
    %grid_shape:2 = shard.grid_shape @grid0 axes = [0, 1] : index, index
    return %grid_shape#0, %grid_shape#1 : index, index
  }
  func.func @grid_shape_default_axes() -> (index, index, index) {
    %grid_shape:3 = shard.grid_shape @grid0 : index, index, index
    return %grid_shape#0, %grid_shape#1, %grid_shape#2 : index, index, index
  }
  func.func @grid_shape_empty_axes() -> (index, index, index) {
    %grid_shape:3 = shard.grid_shape @grid0 : index, index, index
    return %grid_shape#0, %grid_shape#1, %grid_shape#2 : index, index, index
  }
  func.func @process_multi_index() -> (index, index) {
    %proc_linear_idx:2 = shard.process_multi_index on @grid0 axes = [0, 1] : index, index
    return %proc_linear_idx#0, %proc_linear_idx#1 : index, index
  }
  func.func @process_multi_index_default_axes() -> (index, index, index) {
    %proc_linear_idx:3 = shard.process_multi_index on @grid0 : index, index, index
    return %proc_linear_idx#0, %proc_linear_idx#1, %proc_linear_idx#2 : index, index, index
  }
  func.func @process_multi_index_empty_axes() -> (index, index, index) {
    %proc_linear_idx:3 = shard.process_multi_index on @grid0 : index, index, index
    return %proc_linear_idx#0, %proc_linear_idx#1, %proc_linear_idx#2 : index, index, index
  }
  func.func @process_linear_index() -> index {
    %proc_linear_idx = shard.process_linear_index on @grid0 : index
    return %proc_linear_idx : index
  }
  func.func @all_reduce(%arg0: tensor<3x4xf32>) -> tensor<3x4xf64> {
    %all_reduce = shard.all_reduce %arg0 on @grid0 grid_axes = [1, 0] reduction = max : tensor<3x4xf32> -> tensor<3x4xf64>
    return %all_reduce : tensor<3x4xf64>
  }
  func.func @all_gather(%arg0: tensor<3x4xf32>) -> tensor<3x16xf32> {
    %all_gather = shard.all_gather %arg0 on @grid0 grid_axes = [2] gather_axis = 1 : tensor<3x4xf32> -> tensor<3x16xf32>
    return %all_gather : tensor<3x16xf32>
  }
  func.func @all_gather_dynamic_dims_in_tensor(%arg0: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %all_gather = shard.all_gather %arg0 on @grid0 grid_axes = [2] gather_axis = 1 : tensor<?x?xf32> -> tensor<?x?xf32>
    return %all_gather : tensor<?x?xf32>
  }
  func.func @all_gather_dynamic_dims_in_grid(%arg0: tensor<5x6xf32>) -> tensor<5x?xf32> {
    %all_gather = shard.all_gather %arg0 on @grid3 grid_axes = [1] gather_axis = 1 : tensor<5x6xf32> -> tensor<5x?xf32>
    return %all_gather : tensor<5x?xf32>
  }
  func.func @all_slice_static_dimensions(%arg0: tensor<3x4xf32>) -> tensor<3x1xf32> {
    %all_slice = shard.all_slice %arg0 on @grid0 grid_axes = [2] slice_axis = 1 : tensor<3x4xf32> -> tensor<3x1xf32>
    return %all_slice : tensor<3x1xf32>
  }
  func.func @all_slice_dynamic_dimensions(%arg0: tensor<?xf32>) -> tensor<?xf32> {
    %all_slice = shard.all_slice %arg0 on @grid3 grid_axes = [0, 1] slice_axis = 0 : tensor<?xf32> -> tensor<?xf32>
    return %all_slice : tensor<?xf32>
  }
  func.func @all_to_all(%arg0: tensor<3x6xi8>) -> tensor<3x6xi8> {
    %all_to_all = shard.all_to_all %arg0 on @grid4 split_axis = 1 concat_axis = 0 : tensor<3x6xi8> -> tensor<3x6xi8>
    return %all_to_all : tensor<3x6xi8>
  }
  func.func @all_to_all_dynamic_dims_in_result(%arg0: tensor<3x6xi8>) -> tensor<3x?xi8> {
    %all_to_all = shard.all_to_all %arg0 on @grid4 split_axis = 1 concat_axis = 0 : tensor<3x6xi8> -> tensor<3x?xi8>
    return %all_to_all : tensor<3x?xi8>
  }
  func.func @all_to_all_same_split_concat_dim_with_dynamic_device_group_size(%arg0: tensor<3xi8>) -> tensor<3xi8> {
    %all_to_all = shard.all_to_all %arg0 on @grid4 split_axis = 0 concat_axis = 0 : tensor<3xi8> -> tensor<3xi8>
    return %all_to_all : tensor<3xi8>
  }
  func.func @all_to_all_non_divisible_split_axis_size(%arg0: tensor<2x3xi8>) -> tensor<?x12xi8> {
    %all_to_all = shard.all_to_all %arg0 on @grid0 grid_axes = [0, 1] split_axis = 0 concat_axis = 1 : tensor<2x3xi8> -> tensor<?x12xi8>
    return %all_to_all : tensor<?x12xi8>
  }
  func.func @broadcast_static_root(%arg0: tensor<3x6xi8>) -> tensor<3x6xi8> {
    %broadcast = shard.broadcast %arg0 on @grid0 grid_axes = [0, 2] root = [0, 1] : (tensor<3x6xi8>) -> tensor<3x6xi8>
    return %broadcast : tensor<3x6xi8>
  }
  func.func @broadcast_dynamic_root(%arg0: tensor<3x6xi8>, %arg1: index) -> tensor<3x6xi8> {
    %broadcast = shard.broadcast %arg0 on @grid0 grid_axes = [0, 2] root = [1, %arg1] : (tensor<3x6xi8>, index) -> tensor<3x6xi8>
    return %broadcast : tensor<3x6xi8>
  }
  func.func @gather_static_root(%arg0: tensor<3x6xi8>) -> tensor<24x6xi8> {
    %gather = shard.gather %arg0 on @grid0 grid_axes = [0, 2] gather_axis = 0 root = [0, 1] : (tensor<3x6xi8>) -> tensor<24x6xi8>
    return %gather : tensor<24x6xi8>
  }
  func.func @gather_dynamic_root(%arg0: tensor<3x6xi8>, %arg1: index) -> tensor<24x6xi8> {
    %gather = shard.gather %arg0 on @grid0 grid_axes = [0, 2] gather_axis = 0 root = [1, %arg1] : (tensor<3x6xi8>, index) -> tensor<24x6xi8>
    return %gather : tensor<24x6xi8>
  }
  func.func @receive_static_source(%arg0: tensor<2xi8>) -> tensor<2xi8> {
    %recv = shard.recv %arg0 on @grid0 grid_axes = [0, 2] source = [0, 1] : (tensor<2xi8>) -> tensor<2xi8>
    return %recv : tensor<2xi8>
  }
  func.func @receive_dynamic_source(%arg0: tensor<2xi8>, %arg1: index) -> tensor<2xi8> {
    %recv = shard.recv %arg0 on @grid0 grid_axes = [0, 2] source = [1, %arg1] : (tensor<2xi8>, index) -> tensor<2xi8>
    return %recv : tensor<2xi8>
  }
  func.func @receive_no_source(%arg0: tensor<2xi8>) -> tensor<2xi8> {
    %recv = shard.recv %arg0 on @grid0 grid_axes = [0, 2] : (tensor<2xi8>) -> tensor<2xi8>
    return %recv : tensor<2xi8>
  }
  func.func @reduce_static_root(%arg0: tensor<2xi8>) -> tensor<2xi8> {
    %reduce = shard.reduce %arg0 on @grid0 grid_axes = [0, 2] root = [0, 1] : (tensor<2xi8>) -> tensor<2xi8>
    return %reduce : tensor<2xi8>
  }
  func.func @reduce_dynamic_root(%arg0: tensor<2xi8>, %arg1: index) -> tensor<2xi8> {
    %reduce = shard.reduce %arg0 on @grid0 grid_axes = [0, 2] root = [1, %arg1] : (tensor<2xi8>, index) -> tensor<2xi8>
    return %reduce : tensor<2xi8>
  }
  func.func @reduce_different_return_element_type(%arg0: tensor<2xi8>) -> tensor<2xi16> {
    %reduce = shard.reduce %arg0 on @grid0 grid_axes = [0, 2] root = [0, 1] : (tensor<2xi8>) -> tensor<2xi16>
    return %reduce : tensor<2xi16>
  }
  func.func @reduce_scatter_static_dimensions(%arg0: tensor<3x4xf32>) -> tensor<3x1xf64> {
    %reduce_scatter = shard.reduce_scatter %arg0 on @grid0 grid_axes = [2] reduction = max scatter_dim = 1 : tensor<3x4xf32> -> tensor<3x1xf64>
    return %reduce_scatter : tensor<3x1xf64>
  }
  func.func @reduce_scatter_dynamic_dimensions(%arg0: tensor<?xf32>) -> tensor<?xf64> {
    %reduce_scatter = shard.reduce_scatter %arg0 on @grid3 grid_axes = [0, 1] scatter_dim = 0 : tensor<?xf32> -> tensor<?xf64>
    return %reduce_scatter : tensor<?xf64>
  }
  func.func @scatter_static_dimensions(%arg0: tensor<3x4xf32>) -> tensor<3x1xf32> {
    %scatter = shard.scatter %arg0 on @grid0 grid_axes = [2] scatter_dim = 1 root = [1] : (tensor<3x4xf32>) -> tensor<3x1xf32>
    return %scatter : tensor<3x1xf32>
  }
  func.func @scatter_dynamic_dimensions(%arg0: tensor<?xf32>) -> tensor<?xf32> {
    %scatter = shard.scatter %arg0 on @grid3 grid_axes = [0, 1] scatter_dim = 0 root = [1, 2] : (tensor<?xf32>) -> tensor<?xf32>
    return %scatter : tensor<?xf32>
  }
  func.func @scatter_dynamic_root(%arg0: tensor<8xi8>, %arg1: index) -> tensor<1xi8> {
    %scatter = shard.scatter %arg0 on @grid0 grid_axes = [0, 2] scatter_dim = 0 root = [1, %arg1] : (tensor<8xi8>, index) -> tensor<1xi8>
    return %scatter : tensor<1xi8>
  }
  func.func @send_static_destination(%arg0: tensor<2xi8>) -> tensor<2xi8> {
    %send = shard.send %arg0 on @grid0 grid_axes = [0, 2] destination = [0, 1] : (tensor<2xi8>) -> tensor<2xi8>
    return %send : tensor<2xi8>
  }
  func.func @send_dynamic_destination(%arg0: tensor<2xi8>, %arg1: index) -> tensor<2xi8> {
    %send = shard.send %arg0 on @grid0 grid_axes = [0, 2] destination = [1, %arg1] : (tensor<2xi8>, index) -> tensor<2xi8>
    return %send : tensor<2xi8>
  }
  func.func @shift(%arg0: tensor<2xi8>) -> tensor<2xi8> {
    %shift = shard.shift %arg0 on @grid0 grid_axes = [0, 2] shift_axis = 2 offset = -2 rotate : tensor<2xi8> -> tensor<2xi8>
    return %shift : tensor<2xi8>
  }
  func.func @update_halo(%arg0: memref<12x12xi8>) {
    %c2_i64 = arith.constant 2 : i64
    %0 = shard.update_halo %arg0 on @grid0 split_axes = [[0]] halo_sizes = [2, %c2_i64] : memref<12x12xi8>
    %1 = shard.update_halo %0 on @grid0 split_axes = [[0], [1]] halo_sizes = [2, 2, %c2_i64, 2] : memref<12x12xi8>
    return
  }
}

